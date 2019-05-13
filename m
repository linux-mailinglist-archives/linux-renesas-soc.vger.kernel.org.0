Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E90501AF7C
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 13 May 2019 06:33:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726136AbfEMEdl (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 13 May 2019 00:33:41 -0400
Received: from relmlor2.renesas.com ([210.160.252.172]:43182 "EHLO
        relmlie6.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726103AbfEMEdk (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 13 May 2019 00:33:40 -0400
X-IronPort-AV: E=Sophos;i="5.60,464,1549897200"; 
   d="scan'208";a="15554229"
Received: from unknown (HELO relmlir6.idc.renesas.com) ([10.200.68.152])
  by relmlie6.idc.renesas.com with ESMTP; 13 May 2019 13:33:38 +0900
Received: from localhost.localdomain (unknown [10.166.17.210])
        by relmlir6.idc.renesas.com (Postfix) with ESMTP id A627B41836E2;
        Mon, 13 May 2019 13:33:38 +0900 (JST)
From:   Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
To:     ulf.hansson@linaro.org, wsa+renesas@sang-engineering.com
Cc:     linux-mmc@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Subject: [PATCH v2 2/2] mmc: renesas_sdhi: use multiple segments if possible
Date:   Mon, 13 May 2019 13:29:04 +0900
Message-Id: <1557721744-30545-3-git-send-email-yoshihiro.shimoda.uh@renesas.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1557721744-30545-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
References: <1557721744-30545-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
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
 drivers/mmc/host/renesas_sdhi_core.c | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/drivers/mmc/host/renesas_sdhi_core.c b/drivers/mmc/host/renesas_sdhi_core.c
index 5e9e36e..29a7d66 100644
--- a/drivers/mmc/host/renesas_sdhi_core.c
+++ b/drivers/mmc/host/renesas_sdhi_core.c
@@ -203,6 +203,17 @@ static void renesas_sdhi_clk_disable(struct tmio_mmc_host *host)
 	clk_disable_unprepare(priv->clk_cd);
 }
 
+static void renesas_sdhi_init_card(struct mmc_host *mmc, struct mmc_card *card)
+{
+	struct tmio_mmc_host *host = mmc_priv(mmc);
+
+	if (host->pdev->dev.iommu_group &&
+	    (mmc_card_mmc(card) || mmc_card_sd(card)))
+		host->mmc->max_segs = 512;
+	else
+		host->mmc->max_segs = host->pdata->max_segs;
+}
+
 static int renesas_sdhi_card_busy(struct mmc_host *mmc)
 {
 	struct tmio_mmc_host *host = mmc_priv(mmc);
@@ -726,6 +737,8 @@ int renesas_sdhi_probe(struct platform_device *pdev,
 
 	/* SDR speeds are only available on Gen2+ */
 	if (mmc_data->flags & TMIO_MMC_MIN_RCAR2) {
+		host->ops.init_card = renesas_sdhi_init_card;
+
 		/* card_busy caused issues on r8a73a4 (pre-Gen2) CD-less SDHI */
 		host->ops.card_busy = renesas_sdhi_card_busy;
 		host->ops.start_signal_voltage_switch =
-- 
2.7.4

