Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9CA1033BF48
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 15 Mar 2021 16:01:21 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233183AbhCOPAD (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 15 Mar 2021 11:00:03 -0400
Received: from www.zeus03.de ([194.117.254.33]:47508 "EHLO mail.zeus03.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S233169AbhCOO7m (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 15 Mar 2021 10:59:42 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple; d=sang-engineering.com; h=
        from:to:cc:subject:date:message-id:in-reply-to:references
        :mime-version:content-transfer-encoding; s=k1; bh=t8iUTSfb7kOqAF
        0vK4VOLAEP+Ojkq/VM7IgeG1+ToqU=; b=hSeJhEsPcUl2P7P6z1XavQKAGAmcv0
        pL+ceJ9MYAqs4tT1N91AYZBdjNjrOROwF9b3t3hXQ+61U4PoQmfY10BtGetvB2Qi
        Oqp3M5u83h3kFe1qh/Y5KDw6U2m57RhjSezWcLVBHPeqD/A83/8nfqto9tfaEfEy
        IsaCUt7L+jxRo=
Received: (qmail 1439293 invoked from network); 15 Mar 2021 15:59:41 +0100
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 15 Mar 2021 15:59:41 +0100
X-UD-Smtp-Session: l3s3148p1@uZ/Uf5S9EIsgARa4RYTzARykWRFxRPkz
From:   Wolfram Sang <wsa+renesas@sang-engineering.com>
To:     linux-mmc@vger.kernel.org
Cc:     linux-renesas-soc@vger.kernel.org,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>
Subject: [PATCH v2 3/3] mmc: renesas_sdhi: do hard reset if possible
Date:   Mon, 15 Mar 2021 15:59:38 +0100
Message-Id: <20210315145938.58565-4-wsa+renesas@sang-engineering.com>
X-Mailer: git-send-email 2.30.0
In-Reply-To: <20210315145938.58565-1-wsa+renesas@sang-engineering.com>
References: <20210315145938.58565-1-wsa+renesas@sang-engineering.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

All recent SDHI instances can be reset via the reset controller. If one
is found, use it instead of the open coded reset. This is to get a
future-proof sane reset state.

Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
---
 drivers/mmc/host/Kconfig             |  1 +
 drivers/mmc/host/renesas_sdhi.h      |  2 ++
 drivers/mmc/host/renesas_sdhi_core.c | 17 ++++++++++++++++-
 3 files changed, 19 insertions(+), 1 deletion(-)

diff --git a/drivers/mmc/host/Kconfig b/drivers/mmc/host/Kconfig
index b236dfe2e879..1f1b691f10ce 100644
--- a/drivers/mmc/host/Kconfig
+++ b/drivers/mmc/host/Kconfig
@@ -707,6 +707,7 @@ config MMC_SDHI
 	tristate "Renesas SDHI SD/SDIO controller support"
 	depends on SUPERH || ARCH_RENESAS || COMPILE_TEST
 	select MMC_TMIO_CORE
+	select RESET_CONTROLLER
 	help
 	  This provides support for the SDHI SD/SDIO controller found in
 	  Renesas SuperH, ARM and ARM64 based SoCs
diff --git a/drivers/mmc/host/renesas_sdhi.h b/drivers/mmc/host/renesas_sdhi.h
index cb962c7883dc..53eded81a53e 100644
--- a/drivers/mmc/host/renesas_sdhi.h
+++ b/drivers/mmc/host/renesas_sdhi.h
@@ -70,6 +70,8 @@ struct renesas_sdhi {
 	DECLARE_BITMAP(smpcmp, BITS_PER_LONG);
 	unsigned int tap_num;
 	unsigned int tap_set;
+
+	struct reset_control *rstc;
 };
 
 #define host_to_priv(host) \
diff --git a/drivers/mmc/host/renesas_sdhi_core.c b/drivers/mmc/host/renesas_sdhi_core.c
index db753829eaf6..d36181b6f687 100644
--- a/drivers/mmc/host/renesas_sdhi_core.c
+++ b/drivers/mmc/host/renesas_sdhi_core.c
@@ -20,6 +20,7 @@
 
 #include <linux/clk.h>
 #include <linux/delay.h>
+#include <linux/iopoll.h>
 #include <linux/kernel.h>
 #include <linux/mfd/tmio.h>
 #include <linux/mmc/host.h>
@@ -32,6 +33,7 @@
 #include <linux/platform_device.h>
 #include <linux/pm_domain.h>
 #include <linux/regulator/consumer.h>
+#include <linux/reset.h>
 #include <linux/sh_dma.h>
 #include <linux/slab.h>
 #include <linux/sys_soc.h>
@@ -572,10 +574,19 @@ static void renesas_sdhi_scc_reset(struct tmio_mmc_host *host, struct renesas_sd
 static void renesas_sdhi_reset(struct tmio_mmc_host *host)
 {
 	struct renesas_sdhi *priv = host_to_priv(host);
+	int ret;
 	u16 val;
 
-	if (priv->scc_ctl)
+	if (priv->rstc) {
+		reset_control_reset(priv->rstc);
+		/* Unknown why but without polling reset status, it will hang */
+		read_poll_timeout(reset_control_status, ret, ret == 0, 1, 100,
+				  false, priv->rstc);
+		priv->needs_adjust_hs400 = false;
+		renesas_sdhi_set_clock(host, host->clk_cache);
+	} else if (priv->scc_ctl) {
 		renesas_sdhi_scc_reset(host, priv);
+	}
 
 	sd_ctrl_write32_as_16_and_16(host, CTL_IRQ_MASK, TMIO_MASK_ALL_RCAR2);
 
@@ -1081,6 +1092,10 @@ int renesas_sdhi_probe(struct platform_device *pdev,
 	if (ret)
 		goto efree;
 
+	priv->rstc = devm_reset_control_get_optional_exclusive(&pdev->dev, NULL);
+	if (IS_ERR(priv->rstc))
+		return PTR_ERR(priv->rstc);
+
 	ver = sd_ctrl_read16(host, CTL_VERSION);
 	/* GEN2_SDR104 is first known SDHI to use 32bit block count */
 	if (ver < SDHI_VER_GEN2_SDR104 && mmc_data->max_blk_count > U16_MAX)
-- 
2.30.0

