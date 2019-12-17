Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id F2766122A55
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 17 Dec 2019 12:40:46 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727216AbfLQLkp (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 17 Dec 2019 06:40:45 -0500
Received: from sauhun.de ([88.99.104.3]:52198 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727198AbfLQLkp (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 17 Dec 2019 06:40:45 -0500
Received: from localhost (p54B330AA.dip0.t-ipconnect.de [84.179.48.170])
        by pokefinder.org (Postfix) with ESMTPSA id C4A6C2C2D94;
        Tue, 17 Dec 2019 12:40:43 +0100 (CET)
From:   Wolfram Sang <wsa+renesas@sang-engineering.com>
To:     linux-mmc@vger.kernel.org
Cc:     linux-renesas-soc@vger.kernel.org,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        Takeshi Saito <takeshi.saito.xv@renesas.com>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>
Subject: [RFC PATCH v2 3/5] mmc: renesas_sdhi: only check CMD status for HS400 manual correction
Date:   Tue, 17 Dec 2019 12:40:32 +0100
Message-Id: <20191217114034.13290-4-wsa+renesas@sang-engineering.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20191217114034.13290-1-wsa+renesas@sang-engineering.com>
References: <20191217114034.13290-1-wsa+renesas@sang-engineering.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

From: Takeshi Saito <takeshi.saito.xv@renesas.com>

R-Car Gen3 cannot use correction error status with HS400.
HS200: CMD and DAT signal timing are based on CLK signal.
HS400: CMD signal is based on CLK. DAT signal is based on DS signal.

In HS400, CMD signal is 200MHz(SDR). DAT signal is 200MHz(DDR).
Center position of signal is different between CMD and DAT.

TAP position should be adjusted to the center position of CMD signal.
DAT sampling timing is adjusted by HS400 calibration circuit regardless
of TAP position. Refer to renesas_sdhi_adjust_hs400mode_enable().

However, correction error status contains CMD and DAT status in HS400
(DAT signal is not masked in HS400). Therefore, correction error status
cannot use in HS400. It means that auto correction cannot be uses in
HS400. Manual correction can change to the correct TAP position by
ignoring DAT correction error status and using only CMD correction
status.

Signed-off-by: Takeshi Saito <takeshi.saito.xv@renesas.com>
[wsa: refactored patch from BSP]
Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
---
 drivers/mmc/host/renesas_sdhi_core.c | 41 ++++++++++++++++++++++------
 1 file changed, 33 insertions(+), 8 deletions(-)

diff --git a/drivers/mmc/host/renesas_sdhi_core.c b/drivers/mmc/host/renesas_sdhi_core.c
index 6cedc0a10593..e5db96fd0a69 100644
--- a/drivers/mmc/host/renesas_sdhi_core.c
+++ b/drivers/mmc/host/renesas_sdhi_core.c
@@ -250,6 +250,7 @@ static int renesas_sdhi_start_signal_voltage_switch(struct mmc_host *mmc,
 #define SH_MOBILE_SDHI_SCC_CKSEL	0x006
 #define SH_MOBILE_SDHI_SCC_RVSCNTL	0x008
 #define SH_MOBILE_SDHI_SCC_RVSREQ	0x00A
+#define SH_MOBILE_SDHI_SCC_SMPCMP       0x00C
 #define SH_MOBILE_SDHI_SCC_TMPPORT2	0x00E
 
 /* Definitions for values the SH_MOBILE_SDHI_SCC_DTCNTL register */
@@ -265,6 +266,10 @@ static int renesas_sdhi_start_signal_voltage_switch(struct mmc_host *mmc,
 #define SH_MOBILE_SDHI_SCC_RVSREQ_RVSERR	BIT(2)
 #define SH_MOBILE_SDHI_SCC_RVSREQ_REQTAPUP	BIT(1)
 #define SH_MOBILE_SDHI_SCC_RVSREQ_REQTAPDOWN	BIT(0)
+/* Definitions for values the SH_MOBILE_SDHI_SCC_SMPCMP register */
+#define SH_MOBILE_SDHI_SCC_SMPCMP_CMD_ERR	(BIT(24) | BIT(8))
+#define SH_MOBILE_SDHI_SCC_SMPCMP_CMD_REQUP	BIT(24)
+#define SH_MOBILE_SDHI_SCC_SMPCMP_CMD_REQDOWN	BIT(8)
 /* Definitions for values the SH_MOBILE_SDHI_SCC_TMPPORT2 register */
 #define SH_MOBILE_SDHI_SCC_TMPPORT2_HS400OSEL	BIT(4)
 #define SH_MOBILE_SDHI_SCC_TMPPORT2_HS400EN	BIT(31)
@@ -494,6 +499,7 @@ static int renesas_sdhi_select_tuning(struct tmio_mmc_host *host)
 static bool renesas_sdhi_manual_correction(struct tmio_mmc_host *host, bool use_4tap)
 {
 	struct renesas_sdhi *priv = host_to_priv(host);
+	unsigned long new_tap = host->tap_set;
 	u32 val;
 
 	val = sd_scc_read32(host, priv, SH_MOBILE_SDHI_SCC_RVSREQ);
@@ -503,15 +509,34 @@ static bool renesas_sdhi_manual_correction(struct tmio_mmc_host *host, bool use_
 	sd_scc_write32(host, priv, SH_MOBILE_SDHI_SCC_RVSREQ, 0);
 
 	/* Change TAP position according to correction status */
-	if (val & SH_MOBILE_SDHI_SCC_RVSREQ_RVSERR)
-		return true;    /* Need re-tune */
-	else if (val & SH_MOBILE_SDHI_SCC_RVSREQ_REQTAPUP)
-		host->tap_set = (host->tap_set + 1) % host->tap_num;
-	else if (val & SH_MOBILE_SDHI_SCC_RVSREQ_REQTAPDOWN)
-		host->tap_set = (host->tap_set - 1) % host->tap_num;
-	else
-		return false;
+	if (sd_ctrl_read16(host, CTL_VERSION) == SDHI_VER_GEN3_SDMMC &&
+	    host->mmc->ios.timing == MMC_TIMING_MMC_HS400) {
+		/*
+		 * With HS400, the DAT signal is based on DS, not CLK.
+		 * Therefore, use only CMD status.
+		 */
+		u32 smpcmp = sd_scc_read32(host, priv, SH_MOBILE_SDHI_SCC_SMPCMP) &
+					   SH_MOBILE_SDHI_SCC_SMPCMP_CMD_ERR;
+		if (!smpcmp)
+			return false;	/* no error in CMD signal */
+		else if (smpcmp == SH_MOBILE_SDHI_SCC_SMPCMP_CMD_REQUP)
+			new_tap++;
+		else if (smpcmp == SH_MOBILE_SDHI_SCC_SMPCMP_CMD_REQDOWN)
+			new_tap--;
+		else
+			return true;	/* need retune */
+	} else {
+		if (val & SH_MOBILE_SDHI_SCC_RVSREQ_RVSERR)
+			return true;    /* need retune */
+		else if (val & SH_MOBILE_SDHI_SCC_RVSREQ_REQTAPUP)
+			new_tap++;
+		else if (val & SH_MOBILE_SDHI_SCC_RVSREQ_REQTAPDOWN)
+			new_tap--;
+		else
+			return false;
+	}
 
+	host->tap_set = (new_tap % host->tap_num);
 	sd_scc_write32(host, priv, SH_MOBILE_SDHI_SCC_TAPSET,
 		       host->tap_set / (use_4tap ? 2 : 1));
 
-- 
2.20.1

