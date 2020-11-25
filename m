Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A7E422C49E8
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 25 Nov 2020 22:30:36 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732181AbgKYVaR (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 25 Nov 2020 16:30:17 -0500
Received: from www.zeus03.de ([194.117.254.33]:50290 "EHLO mail.zeus03.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1732193AbgKYVaQ (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 25 Nov 2020 16:30:16 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple; d=sang-engineering.com; h=
        from:to:cc:subject:date:message-id:in-reply-to:references
        :mime-version:content-transfer-encoding; s=k1; bh=rdfbV7Lr2bOWPq
        aYvs96W61a1TNaIaXNyfLaNfizkOk=; b=oBJlt/8B07U9npgKc9G4jW3l5PhSdd
        V8M7h01hAyc0FAB+B7iex0rRufvir8wN9otycWXo9XBqxjq3I2mbEItqX5tKJuT5
        cFhMzii8s2CkB+oPvCsoI4pttLv13C4+kx8xjgRAexJHMHy5zQWAzdagOxrVeQ3X
        vUU/G5JuJ0duc=
Received: (qmail 3441528 invoked from network); 25 Nov 2020 22:30:15 +0100
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 25 Nov 2020 22:30:15 +0100
X-UD-Smtp-Session: l3s3148p1@+TAQIvW0kr8gAwDPXwZjAA625bO7DiyS
From:   Wolfram Sang <wsa+renesas@sang-engineering.com>
To:     linux-mmc@vger.kernel.org
Cc:     linux-renesas-soc@vger.kernel.org,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        Wolfram Sang <wsa@kernel.org>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>
Subject: [PATCH 3/3] mmc: renesas_sdhi: populate hook for longer busy_wait
Date:   Wed, 25 Nov 2020 22:30:01 +0100
Message-Id: <20201125213001.15003-4-wsa+renesas@sang-engineering.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20201125213001.15003-1-wsa+renesas@sang-engineering.com>
References: <20201125213001.15003-1-wsa+renesas@sang-engineering.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

From: Wolfram Sang <wsa@kernel.org>

Make use of the EXTOP bit in R-Car Gen3 SoCs to have a twice as large
busy wait duration.

Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
---
 drivers/mmc/host/renesas_sdhi_core.c | 20 ++++++++++++++++++++
 drivers/mmc/host/tmio_mmc.h          |  2 ++
 2 files changed, 22 insertions(+)

diff --git a/drivers/mmc/host/renesas_sdhi_core.c b/drivers/mmc/host/renesas_sdhi_core.c
index 153767054c05..38f028e70633 100644
--- a/drivers/mmc/host/renesas_sdhi_core.c
+++ b/drivers/mmc/host/renesas_sdhi_core.c
@@ -561,6 +561,7 @@ static int renesas_sdhi_prepare_hs400_tuning(struct mmc_host *mmc, struct mmc_io
 static void renesas_sdhi_reset(struct tmio_mmc_host *host)
 {
 	struct renesas_sdhi *priv = host_to_priv(host);
+	u16 val;
 
 	if (priv->scc_ctl) {
 		renesas_sdhi_disable_scc(host->mmc);
@@ -573,6 +574,21 @@ static void renesas_sdhi_reset(struct tmio_mmc_host *host)
 	}
 
 	sd_ctrl_write32_as_16_and_16(host, CTL_IRQ_MASK, TMIO_MASK_INIT_RCAR2);
+
+	if (sd_ctrl_read16(host, CTL_VERSION) >= SDHI_VER_GEN3_SD) {
+		val = sd_ctrl_read16(host, CTL_SD_MEM_CARD_OPT);
+		val |= CARD_OPT_EXTOP;
+		sd_ctrl_write16(host, CTL_SD_MEM_CARD_OPT, val);
+	}
+}
+
+static unsigned int renesas_sdhi_gen3_get_cycles(struct tmio_mmc_host *host)
+{
+	u16 num, val = sd_ctrl_read16(host, CTL_SD_MEM_CARD_OPT);
+
+	num = (val & CARD_OPT_TOP_MASK) >> CARD_OPT_TOP_SHIFT;
+	return 1 << ((val & CARD_OPT_EXTOP ? 14 : 13) + num);
+
 }
 
 #define SH_MOBILE_SDHI_MIN_TAP_ROW 3
@@ -1067,6 +1083,10 @@ int renesas_sdhi_probe(struct platform_device *pdev,
 			quirks->hs400_calib_table + 1);
 	}
 
+	/* these have an EXTOP bit */
+	if (ver >= SDHI_VER_GEN3_SD)
+		host->get_timeout_cycles = renesas_sdhi_gen3_get_cycles;
+
 	/* Enable tuning iff we have an SCC and a supported mode */
 	if (of_data && of_data->scc_offset &&
 	    (host->mmc->caps & MMC_CAP_UHS_SDR104 ||
diff --git a/drivers/mmc/host/tmio_mmc.h b/drivers/mmc/host/tmio_mmc.h
index f60559bc413a..784fa6ed5843 100644
--- a/drivers/mmc/host/tmio_mmc.h
+++ b/drivers/mmc/host/tmio_mmc.h
@@ -82,7 +82,9 @@
 /* Definitions for values the CTL_SD_MEM_CARD_OPT register can take */
 #define CARD_OPT_TOP_MASK	0xf0
 #define CARD_OPT_TOP_SHIFT	4
+#define CARD_OPT_EXTOP		BIT(9) /* first appeared on R-Car Gen3 SDHI */
 #define CARD_OPT_WIDTH8		BIT(13)
+#define CARD_OPT_ALWAYS1	BIT(14)
 #define CARD_OPT_WIDTH		BIT(15)
 
 /* Definitions for values the CTL_SDIO_STATUS register can take */
-- 
2.28.0

