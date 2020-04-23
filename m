Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 98C921B5B56
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 23 Apr 2020 14:24:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726435AbgDWMY4 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 23 Apr 2020 08:24:56 -0400
Received: from sauhun.de ([88.99.104.3]:33852 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726232AbgDWMY4 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 23 Apr 2020 08:24:56 -0400
Received: from localhost (p5486CE55.dip0.t-ipconnect.de [84.134.206.85])
        by pokefinder.org (Postfix) with ESMTPSA id 1EEC72C2017;
        Thu, 23 Apr 2020 14:24:54 +0200 (CEST)
From:   Wolfram Sang <wsa+renesas@sang-engineering.com>
To:     linux-mmc@vger.kernel.org
Cc:     linux-renesas-soc@vger.kernel.org,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        Takeshi Saito <takeshi.saito.xv@renesas.com>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>
Subject: [PATCH v2 2/2] mmc: renesas_sdhi: Avoid bad TAP in HS400
Date:   Thu, 23 Apr 2020 14:24:48 +0200
Message-Id: <20200423122448.8099-3-wsa+renesas@sang-engineering.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200423122448.8099-1-wsa+renesas@sang-engineering.com>
References: <20200423122448.8099-1-wsa+renesas@sang-engineering.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

From: Takeshi Saito <takeshi.saito.xv@renesas.com>

With R-Car Gen3, CRC error occue at the following TAPs.

H3, M3W 1.3, M3N... TAP=2,3,6,7
M3W 3.0		... TAP=1,3,5,7

(Note: for 4tap SoCs, the numbers get divided by 2)

Do not use these TAPs in HS400, and also don't use auto correction but
manual correction.

We check for bad taps in two places:

1) After tuning HS400: Then, we select a neighbouring TAP. One of them
   must be good, because there are never three bad taps in a row.
   Retuning won't help because we just finished tuning.

2) After a manual correction request: Here, we can't switch to the
   requested TAP. But we can retune (if the HS200 tuning was good)
   because the environment might have changed since the last tuning.
   If not, we stay on the same TAP.

Signed-off-by: Takeshi Saito <takeshi.saito.xv@renesas.com>
[wsa: refactored to match upstream driver, reworded commit msg]
Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
Reviewed-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
---

Change since V1:
* added tag from Shimoda-san
* removed unneeded curly braces

 drivers/mmc/host/renesas_sdhi.h      |  1 +
 drivers/mmc/host/renesas_sdhi_core.c | 55 ++++++++++++++++++++++++----
 2 files changed, 48 insertions(+), 8 deletions(-)

diff --git a/drivers/mmc/host/renesas_sdhi.h b/drivers/mmc/host/renesas_sdhi.h
index 86efa9d5cd6d..14c64caefc64 100644
--- a/drivers/mmc/host/renesas_sdhi.h
+++ b/drivers/mmc/host/renesas_sdhi.h
@@ -36,6 +36,7 @@ struct renesas_sdhi_of_data {
 struct renesas_sdhi_quirks {
 	bool hs400_disabled;
 	bool hs400_4taps;
+	u32 hs400_bad_taps;
 };
 
 struct tmio_mmc_dma {
diff --git a/drivers/mmc/host/renesas_sdhi_core.c b/drivers/mmc/host/renesas_sdhi_core.c
index 33b51105c788..ff72b381a6b3 100644
--- a/drivers/mmc/host/renesas_sdhi_core.c
+++ b/drivers/mmc/host/renesas_sdhi_core.c
@@ -325,6 +325,8 @@ static void renesas_sdhi_hs400_complete(struct mmc_host *mmc)
 {
 	struct tmio_mmc_host *host = mmc_priv(mmc);
 	struct renesas_sdhi *priv = host_to_priv(host);
+	u32 bad_taps = priv->quirks ? priv->quirks->hs400_bad_taps : 0;
+	bool use_4tap = priv->quirks && priv->quirks->hs400_4taps;
 
 	sd_ctrl_write16(host, CTL_SD_CARD_CLK_CTL, ~CLK_CTL_SCLKEN &
 		sd_ctrl_read16(host, CTL_SD_CARD_CLK_CTL));
@@ -352,10 +354,23 @@ static void renesas_sdhi_hs400_complete(struct mmc_host *mmc)
 		       SH_MOBILE_SDHI_SCC_DTCNTL_TAPEN |
 		       0x4 << SH_MOBILE_SDHI_SCC_DTCNTL_TAPNUM_SHIFT);
 
+	/* Avoid bad TAP */
+	if (bad_taps & BIT(priv->tap_set)) {
+		u32 new_tap = (priv->tap_set + 1) % priv->tap_num;
+
+		if (bad_taps & BIT(new_tap))
+			new_tap = (priv->tap_set - 1) % priv->tap_num;
 
-	if (priv->quirks && priv->quirks->hs400_4taps)
-		sd_scc_write32(host, priv, SH_MOBILE_SDHI_SCC_TAPSET,
-			       priv->tap_set / 2);
+		if (bad_taps & BIT(new_tap)) {
+			new_tap = priv->tap_set;
+			dev_dbg(&host->pdev->dev, "Can't handle three bad tap in a row\n");
+		}
+
+		priv->tap_set = new_tap;
+	}
+
+	sd_scc_write32(host, priv, SH_MOBILE_SDHI_SCC_TAPSET,
+		       priv->tap_set / (use_4tap ? 2 : 1));
 
 	sd_scc_write32(host, priv, SH_MOBILE_SDHI_SCC_CKSEL,
 		       SH_MOBILE_SDHI_SCC_CKSEL_DTSEL |
@@ -527,7 +542,7 @@ static int renesas_sdhi_execute_tuning(struct tmio_mmc_host *host, u32 opcode)
 static bool renesas_sdhi_manual_correction(struct tmio_mmc_host *host, bool use_4tap)
 {
 	struct renesas_sdhi *priv = host_to_priv(host);
-	unsigned int new_tap = priv->tap_set;
+	unsigned int new_tap = priv->tap_set, error_tap = priv->tap_set;
 	u32 val;
 
 	val = sd_scc_read32(host, priv, SH_MOBILE_SDHI_SCC_RVSREQ);
@@ -539,20 +554,32 @@ static bool renesas_sdhi_manual_correction(struct tmio_mmc_host *host, bool use_
 	/* Change TAP position according to correction status */
 	if (sd_ctrl_read16(host, CTL_VERSION) == SDHI_VER_GEN3_SDMMC &&
 	    host->mmc->ios.timing == MMC_TIMING_MMC_HS400) {
+		u32 bad_taps = priv->quirks ? priv->quirks->hs400_bad_taps : 0;
 		/*
 		 * With HS400, the DAT signal is based on DS, not CLK.
 		 * Therefore, use only CMD status.
 		 */
 		u32 smpcmp = sd_scc_read32(host, priv, SH_MOBILE_SDHI_SCC_SMPCMP) &
 					   SH_MOBILE_SDHI_SCC_SMPCMP_CMD_ERR;
-		if (!smpcmp)
+		if (!smpcmp) {
 			return false;	/* no error in CMD signal */
-		else if (smpcmp == SH_MOBILE_SDHI_SCC_SMPCMP_CMD_REQUP)
+		} else if (smpcmp == SH_MOBILE_SDHI_SCC_SMPCMP_CMD_REQUP) {
 			new_tap++;
-		else if (smpcmp == SH_MOBILE_SDHI_SCC_SMPCMP_CMD_REQDOWN)
+			error_tap--;
+		} else if (smpcmp == SH_MOBILE_SDHI_SCC_SMPCMP_CMD_REQDOWN) {
 			new_tap--;
-		else
+			error_tap++;
+		} else {
 			return true;	/* need retune */
+		}
+
+		/*
+		 * When new_tap is a bad tap, we cannot change. Then, we compare
+		 * with the HS200 tuning result. When smpcmp[error_tap] is OK,
+		 * we can at least retune.
+		 */
+		if (bad_taps & BIT(new_tap % priv->tap_num))
+			return test_bit(error_tap % priv->tap_num, priv->smpcmp);
 	} else {
 		if (val & SH_MOBILE_SDHI_SCC_RVSREQ_RVSERR)
 			return true;    /* need retune */
@@ -705,12 +732,21 @@ static const struct renesas_sdhi_quirks sdhi_quirks_4tap_nohs400 = {
 
 static const struct renesas_sdhi_quirks sdhi_quirks_4tap = {
 	.hs400_4taps = true,
+	.hs400_bad_taps = BIT(2) | BIT(3) | BIT(6) | BIT(7),
 };
 
 static const struct renesas_sdhi_quirks sdhi_quirks_nohs400 = {
 	.hs400_disabled = true,
 };
 
+static const struct renesas_sdhi_quirks sdhi_quirks_bad_taps1357 = {
+	.hs400_bad_taps = BIT(1) | BIT(3) | BIT(5) | BIT(7),
+};
+
+static const struct renesas_sdhi_quirks sdhi_quirks_bad_taps2367 = {
+	.hs400_bad_taps = BIT(2) | BIT(3) | BIT(6) | BIT(7),
+};
+
 /*
  * Note for r8a7796 / r8a774a1: we can't distinguish ES1.1 and 1.2 as of now.
  * So, we want to treat them equally and only have a match for ES1.2 to enforce
@@ -720,8 +756,11 @@ static const struct soc_device_attribute sdhi_quirks_match[]  = {
 	{ .soc_id = "r8a774a1", .revision = "ES1.[012]", .data = &sdhi_quirks_4tap_nohs400 },
 	{ .soc_id = "r8a7795", .revision = "ES1.*", .data = &sdhi_quirks_4tap_nohs400 },
 	{ .soc_id = "r8a7795", .revision = "ES2.0", .data = &sdhi_quirks_4tap },
+	{ .soc_id = "r8a7795", .revision = "ES3.*", .data = &sdhi_quirks_bad_taps2367 },
 	{ .soc_id = "r8a7796", .revision = "ES1.[012]", .data = &sdhi_quirks_4tap_nohs400 },
 	{ .soc_id = "r8a7796", .revision = "ES1.*", .data = &sdhi_quirks_4tap },
+	{ .soc_id = "r8a7796", .revision = "ES3.*", .data = &sdhi_quirks_bad_taps1357 },
+	{ .soc_id = "r8a77965", .data = &sdhi_quirks_bad_taps2367 },
 	{ .soc_id = "r8a77980", .data = &sdhi_quirks_nohs400 },
 	{ /* Sentinel. */ },
 };
-- 
2.20.1

