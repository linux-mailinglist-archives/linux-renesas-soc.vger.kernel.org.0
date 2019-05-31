Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4CD2D30D43
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 31 May 2019 13:21:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727107AbfEaLVI (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 31 May 2019 07:21:08 -0400
Received: from relmlor1.renesas.com ([210.160.252.171]:16076 "EHLO
        relmlie5.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1727114AbfEaLVI (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 31 May 2019 07:21:08 -0400
X-IronPort-AV: E=Sophos;i="5.60,534,1549897200"; 
   d="scan'208";a="17484183"
Received: from unknown (HELO relmlir6.idc.renesas.com) ([10.200.68.152])
  by relmlie5.idc.renesas.com with ESMTP; 31 May 2019 20:21:04 +0900
Received: from localhost.localdomain (unknown [10.166.17.210])
        by relmlir6.idc.renesas.com (Postfix) with ESMTP id 39F704249D39;
        Fri, 31 May 2019 20:21:04 +0900 (JST)
From:   Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
To:     ulf.hansson@linaro.org, wsa+renesas@sang-engineering.com
Cc:     linux-mmc@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Subject: [PATCH v4 3/3] mmc: renesas_sdhi: use multiple segments if possible
Date:   Fri, 31 May 2019 20:16:11 +0900
Message-Id: <1559301371-21200-4-git-send-email-yoshihiro.shimoda.uh@renesas.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1559301371-21200-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
References: <1559301371-21200-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

In IOMMU environment, since it's possible to merge scatter gather
buffers of memory requests to one iova, this patch changes the max_segs
value when init_card of mmc_host timing to improve the transfer
performance on renesas_sdhi_internal_dmac.

Notes that an sdio card may be possible to use scatter gather buffers
with non page aligned size, so that this driver will not use multiple
segments to avoid any trouble. Also, on renesas_sdhi_sys_dmac,
the max_segs value will change from 32 to 512, but the sys_dmac
can handle 512 segments, so that this init_card ops is added on
"TMIO_MMC_MIN_RCAR2" environment.

Signed-off-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
---
 drivers/mmc/host/renesas_sdhi.h               |  1 +
 drivers/mmc/host/renesas_sdhi_core.c          | 60 +++++++++++++++++++++++++++
 drivers/mmc/host/renesas_sdhi_internal_dmac.c | 19 +++++++++
 3 files changed, 80 insertions(+)

diff --git a/drivers/mmc/host/renesas_sdhi.h b/drivers/mmc/host/renesas_sdhi.h
index c0504aa..d53dda5 100644
--- a/drivers/mmc/host/renesas_sdhi.h
+++ b/drivers/mmc/host/renesas_sdhi.h
@@ -51,6 +51,7 @@ struct renesas_sdhi {
 	void __iomem *scc_ctl;
 	u32 scc_tappos;
 	u32 scc_tappos_hs400;
+	bool ipmmu_mapped;
 };
 
 #define host_to_priv(host) \
diff --git a/drivers/mmc/host/renesas_sdhi_core.c b/drivers/mmc/host/renesas_sdhi_core.c
index 5e9e36e..e9d9541 100644
--- a/drivers/mmc/host/renesas_sdhi_core.c
+++ b/drivers/mmc/host/renesas_sdhi_core.c
@@ -46,6 +46,8 @@
 #define SDHI_VER_GEN3_SD	0xcc10
 #define SDHI_VER_GEN3_SDMMC	0xcd10
 
+#define SDHI_MAX_SEGS_IN_IOMMU	512
+
 struct renesas_sdhi_quirks {
 	bool hs400_disabled;
 	bool hs400_4taps;
@@ -203,6 +205,32 @@ static void renesas_sdhi_clk_disable(struct tmio_mmc_host *host)
 	clk_disable_unprepare(priv->clk_cd);
 }
 
+static void renesas_sdhi_init_card(struct mmc_host *mmc, struct mmc_card *card)
+{
+	struct tmio_mmc_host *host = mmc_priv(mmc);
+	struct renesas_sdhi *priv = host_to_priv(host);
+
+	/*
+	 * In IPMMU environment that some R-Car SoCs have, it's possible to
+	 * merge scatter gather buffers of memory requests to one iova so that
+	 * this code changes the max_segs when init_card of mmc_host timing.
+	 * Notes that an sdio card may be possible to use scatter gather
+	 * buffers with non page aligned size, so that this driver will not use
+	 * multiple segments to avoid any trouble even if IPMMU environment.
+	 *
+	 * This can expose the host->mmc->max_segs to a block layer by using
+	 * blk_queue_max_segments() that mmc_setup_queue() calls. In other
+	 * words, this init_card() ops is called before a block device is
+	 * created.
+	 */
+	if (host->pdata->max_segs < SDHI_MAX_SEGS_IN_IOMMU &&
+	    priv->ipmmu_mapped && (mmc_card_mmc(card) || mmc_card_sd(card)))
+		host->mmc->max_segs = SDHI_MAX_SEGS_IN_IOMMU;
+	else
+		host->mmc->max_segs = host->pdata->max_segs ? :
+				      TMIO_DEFAULT_MAX_SEGS;
+}
+
 static int renesas_sdhi_card_busy(struct mmc_host *mmc)
 {
 	struct tmio_mmc_host *host = mmc_priv(mmc);
@@ -610,6 +638,35 @@ static void renesas_sdhi_enable_dma(struct tmio_mmc_host *host, bool enable)
 	renesas_sdhi_sdbuf_width(host, enable ? width : 16);
 }
 
+static bool renesas_sdhi_ipmmu_mapped(struct device *dev)
+{
+	struct device_node *iommu_np;
+	static const char * const compatibles[] = {
+		"renesas,ipmmu-r8a7795",
+		"renesas,ipmmu-r8a7796",
+		"renesas,ipmmu-r8a77965",
+		"renesas,ipmmu-r8a77970",
+		"renesas,ipmmu-r8a77980",
+		"renesas,ipmmu-r8a77990",
+		"renesas,ipmmu-r8a77995",
+	};
+	int i;
+
+	if (!device_iommu_mapped(dev))
+		return false;
+
+	iommu_np = of_parse_phandle(dev->of_node, "iommus", 0);
+	if (!iommu_np)
+		return false;
+
+	for (i = 0; i < ARRAY_SIZE(compatibles); i++) {
+		if (of_device_is_compatible(iommu_np, compatibles[i]))
+			return true;
+	}
+
+	return false;
+}
+
 static const struct renesas_sdhi_quirks sdhi_quirks_h3_m3w_es1 = {
 	.hs400_disabled = true,
 	.hs400_4taps = true,
@@ -726,6 +783,9 @@ int renesas_sdhi_probe(struct platform_device *pdev,
 
 	/* SDR speeds are only available on Gen2+ */
 	if (mmc_data->flags & TMIO_MMC_MIN_RCAR2) {
+		host->ops.init_card = renesas_sdhi_init_card;
+		priv->ipmmu_mapped = renesas_sdhi_ipmmu_mapped(&pdev->dev);
+
 		/* card_busy caused issues on r8a73a4 (pre-Gen2) CD-less SDHI */
 		host->ops.card_busy = renesas_sdhi_card_busy;
 		host->ops.start_signal_voltage_switch =
diff --git a/drivers/mmc/host/renesas_sdhi_internal_dmac.c b/drivers/mmc/host/renesas_sdhi_internal_dmac.c
index 751fe91..2b83b43 100644
--- a/drivers/mmc/host/renesas_sdhi_internal_dmac.c
+++ b/drivers/mmc/host/renesas_sdhi_internal_dmac.c
@@ -177,11 +177,30 @@ renesas_sdhi_internal_dmac_start_dma(struct tmio_mmc_host *host,
 				     struct mmc_data *data)
 {
 	struct scatterlist *sg = host->sg_ptr;
+	struct renesas_sdhi *priv = host_to_priv(host);
 	u32 dtran_mode = DTRAN_MODE_BUS_WIDTH;
 
 	if (!test_bit(SDHI_INTERNAL_DMAC_ADDR_MODE_FIXED_ONLY, &global_flags))
 		dtran_mode |= DTRAN_MODE_ADDR_MODE;
 
+	/*
+	 * If this driver uses multiple segments on IPMMU, all segment buffers
+	 * boundary except the end of buffer should be aligned to IPMMU page
+	 * size. Note that the IPMMU page size will be the same as (or less
+	 * than) CPU page size.
+	 */
+	if (priv->ipmmu_mapped && host->sg_len > 1) {
+		int i;
+		struct scatterlist *s;
+
+		for_each_sg(sg, s, host->sg_len, i) {
+			if (!PAGE_ALIGNED(sg_virt(s)) ||
+			    ((i < host->sg_len - 1) &&
+			     !PAGE_ALIGNED(s->length)))
+				goto force_pio;
+		}
+	}
+
 	if (!dma_map_sg(&host->pdev->dev, sg, host->sg_len,
 			mmc_get_dma_dir(data)))
 		goto force_pio;
-- 
2.7.4

