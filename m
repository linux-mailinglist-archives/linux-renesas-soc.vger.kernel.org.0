Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A1A4F25A79F
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  2 Sep 2020 10:18:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726312AbgIBIS1 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 2 Sep 2020 04:18:27 -0400
Received: from www.zeus03.de ([194.117.254.33]:39470 "EHLO mail.zeus03.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726490AbgIBISX (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 2 Sep 2020 04:18:23 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple; d=sang-engineering.com; h=
        from:to:cc:subject:date:message-id:in-reply-to:references
        :mime-version:content-transfer-encoding; s=k1; bh=IFqmGs9Q5qUW+p
        mdJt1YQHUCMq7m6zQn2kNQJbsxxLM=; b=NYo+NqezGrWzmM/X5I7BAc06P71fAX
        m7PWmJpn9tCZlnPGe9UrQQGdw3cfGQcSx4Sfu9Uraq3jUK14RwQEvEu07rMq1RJv
        mDUXC98QZIVR2bPs7k4yWhNdEi/9ji0vPn2TJUoUKVbmrGE0l/ShhFsAlHR70pfI
        CA8bnMBYUtKZ0=
Received: (qmail 2768763 invoked from network); 2 Sep 2020 10:18:20 +0200
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 2 Sep 2020 10:18:20 +0200
X-UD-Smtp-Session: l3s3148p1@ATBOR1CuKM0gAwDPXwgJAIvFhnYIE9zj
From:   Wolfram Sang <wsa+renesas@sang-engineering.com>
To:     linux-mmc@vger.kernel.org
Cc:     linux-renesas-soc@vger.kernel.org,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Takeshi Saito <takeshi.saito.xv@renesas.com>
Subject: [PATCH v2 2/2] mmc: renesas_sdhi: support manual calibration
Date:   Wed,  2 Sep 2020 10:18:12 +0200
Message-Id: <20200902081812.1591-3-wsa+renesas@sang-engineering.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200902081812.1591-1-wsa+renesas@sang-engineering.com>
References: <20200902081812.1591-1-wsa+renesas@sang-engineering.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Some R-Car Gen3 SoCs need some manual correction of timing parameters
after the automatic tuning has finished but before next CMD13 is
completed. This patch implements that by this state machine:

- introducing a per-SoC correction table if needed
- iff such a table exists, the 'fixup_request' callback is populated
  during probe
- iff such a table exists, a runtime flag ('needs_adjust_hs400')
  is set when HS400 tuning was completed
- the callback will check the runtime flag and enable the corrected
  manual mode if the flag is set and CMD13 is encountered
- at the end of the enablement the runtime flag is cleared
- iff the configuration flag is set, the manual mode will be disabled
  when HS400 gets downgraded

There also some helper functions added to access the TMPPORT registers.
The actual correction table is SoC and instance(!) specific and is
added to the quirks struct.

Signed-off-by: Takeshi Saito <takeshi.saito.xv@renesas.com>
Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
---
 drivers/mmc/host/renesas_sdhi.h      |   5 +
 drivers/mmc/host/renesas_sdhi_core.c | 152 ++++++++++++++++++++++++++-
 2 files changed, 155 insertions(+), 2 deletions(-)

diff --git a/drivers/mmc/host/renesas_sdhi.h b/drivers/mmc/host/renesas_sdhi.h
index 14c64caefc64..24958de274c1 100644
--- a/drivers/mmc/host/renesas_sdhi.h
+++ b/drivers/mmc/host/renesas_sdhi.h
@@ -33,10 +33,13 @@ struct renesas_sdhi_of_data {
 	unsigned short max_segs;
 };
 
+#define SDHI_CALIB_TABLE_MAX 32
+
 struct renesas_sdhi_quirks {
 	bool hs400_disabled;
 	bool hs400_4taps;
 	u32 hs400_bad_taps;
+	const u8 (*hs400_calib_table)[SDHI_CALIB_TABLE_MAX];
 };
 
 struct tmio_mmc_dma {
@@ -58,6 +61,8 @@ struct renesas_sdhi {
 	void __iomem *scc_ctl;
 	u32 scc_tappos;
 	u32 scc_tappos_hs400;
+	const u8 *adjust_hs400_calib_table;
+	bool needs_adjust_hs400;
 	bool doing_tune;
 
 	/* Tuning values: 1 for success, 0 for failure */
diff --git a/drivers/mmc/host/renesas_sdhi_core.c b/drivers/mmc/host/renesas_sdhi_core.c
index c5cba0a1b112..b54dd8a7ecaa 100644
--- a/drivers/mmc/host/renesas_sdhi_core.c
+++ b/drivers/mmc/host/renesas_sdhi_core.c
@@ -26,6 +26,7 @@
 #include <linux/platform_device.h>
 #include <linux/pm_domain.h>
 #include <linux/mmc/host.h>
+#include <linux/mmc/mmc.h>
 #include <linux/mmc/slot-gpio.h>
 #include <linux/mfd/tmio.h>
 #include <linux/sh_dma.h>
@@ -47,6 +48,8 @@
 #define SDHI_VER_GEN3_SD	0xcc10
 #define SDHI_VER_GEN3_SDMMC	0xcd10
 
+#define SDHI_GEN3_MMC0_ADDR	0xee140000
+
 static void renesas_sdhi_sdbuf_width(struct tmio_mmc_host *host, int width)
 {
 	u32 val;
@@ -251,6 +254,11 @@ static int renesas_sdhi_start_signal_voltage_switch(struct mmc_host *mmc,
 #define SH_MOBILE_SDHI_SCC_RVSREQ	0x00A
 #define SH_MOBILE_SDHI_SCC_SMPCMP       0x00C
 #define SH_MOBILE_SDHI_SCC_TMPPORT2	0x00E
+#define SH_MOBILE_SDHI_SCC_TMPPORT3	0x014
+#define SH_MOBILE_SDHI_SCC_TMPPORT4	0x016
+#define SH_MOBILE_SDHI_SCC_TMPPORT5	0x018
+#define SH_MOBILE_SDHI_SCC_TMPPORT6	0x01A
+#define SH_MOBILE_SDHI_SCC_TMPPORT7	0x01C
 
 #define SH_MOBILE_SDHI_SCC_DTCNTL_TAPEN		BIT(0)
 #define SH_MOBILE_SDHI_SCC_DTCNTL_TAPNUM_SHIFT	16
@@ -271,6 +279,40 @@ static int renesas_sdhi_start_signal_voltage_switch(struct mmc_host *mmc,
 #define SH_MOBILE_SDHI_SCC_TMPPORT2_HS400OSEL	BIT(4)
 #define SH_MOBILE_SDHI_SCC_TMPPORT2_HS400EN	BIT(31)
 
+/* Definitions for values the SH_MOBILE_SDHI_SCC_TMPPORT4 register */
+#define SH_MOBILE_SDHI_SCC_TMPPORT4_DLL_ACC_START	BIT(0)
+
+/* Definitions for values the SH_MOBILE_SDHI_SCC_TMPPORT5 register */
+#define SH_MOBILE_SDHI_SCC_TMPPORT5_DLL_RW_SEL_R	BIT(8)
+#define SH_MOBILE_SDHI_SCC_TMPPORT5_DLL_RW_SEL_W	(0 << 8)
+#define SH_MOBILE_SDHI_SCC_TMPPORT5_DLL_ADR_MASK	0x3F
+
+/* Definitions for values the SH_MOBILE_SDHI_SCC register */
+#define SH_MOBILE_SDHI_SCC_TMPPORT_DISABLE_WP_CODE	0xa5000000
+#define SH_MOBILE_SDHI_SCC_TMPPORT_CALIB_CODE_MASK	0x1f
+#define SH_MOBILE_SDHI_SCC_TMPPORT_MANUAL_MODE		BIT(7)
+
+static const u8 r8a7796_es13_calib_table[2][SDHI_CALIB_TABLE_MAX] = {
+	{ 3,  3,  3,  3,  3,  3,  3,  4,  4,  5,  6,  7,  8,  9, 10, 15,
+	 16, 16, 16, 16, 16, 16, 17, 18, 18, 19, 20, 21, 22, 23, 24, 25 },
+	{ 5,  5,  5,  5,  5,  5,  5,  5,  5,  5,  5,  5,  6,  7,  8, 11,
+	 12, 17, 18, 18, 18, 18, 18, 18, 18, 19, 20, 21, 22, 23, 25, 25 }
+};
+
+static const u8 r8a77965_calib_table[2][SDHI_CALIB_TABLE_MAX] = {
+	{ 1,  2,  6,  6,  7,  8,  9, 10, 11, 12, 13, 14, 15, 15, 15, 16,
+	 17, 18, 19, 20, 21, 22, 23, 24, 25, 25, 26, 27, 28, 29, 30, 31 },
+	{ 2,  3,  4,  4,  5,  6,  7,  9, 10, 11, 12, 13, 14, 15, 16, 17,
+	 17, 17, 20, 21, 22, 23, 24, 25, 27, 28, 29, 30, 31, 31, 31, 31 }
+};
+
+static const u8 r8a77990_calib_table[2][SDHI_CALIB_TABLE_MAX] = {
+	{ 0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,
+	  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0 },
+	{ 0,  0,  0,  1,  2,  3,  3,  4,  4,  4,  5,  5,  6,  8,  9, 10,
+	 11, 12, 13, 15, 16, 17, 17, 18, 18, 19, 20, 22, 24, 25, 26, 26 }
+};
+
 static inline u32 sd_scc_read32(struct tmio_mmc_host *host,
 				struct renesas_sdhi *priv, int addr)
 {
@@ -377,6 +419,9 @@ static void renesas_sdhi_hs400_complete(struct mmc_host *mmc)
 
 	sd_ctrl_write16(host, CTL_SD_CARD_CLK_CTL, CLK_CTL_SCLKEN |
 			sd_ctrl_read16(host, CTL_SD_CARD_CLK_CTL));
+
+	if (priv->adjust_hs400_calib_table)
+		priv->needs_adjust_hs400 = true;
 }
 
 static void renesas_sdhi_reset_scc(struct tmio_mmc_host *host,
@@ -407,6 +452,74 @@ static void renesas_sdhi_disable_scc(struct mmc_host *mmc)
 			sd_ctrl_read16(host, CTL_SD_CARD_CLK_CTL));
 }
 
+static u32 sd_scc_tmpport_read32(struct tmio_mmc_host *host,
+				 struct renesas_sdhi *priv, u32 addr)
+{
+	/* read mode */
+	sd_scc_write32(host, priv, SH_MOBILE_SDHI_SCC_TMPPORT5,
+		       SH_MOBILE_SDHI_SCC_TMPPORT5_DLL_RW_SEL_R |
+		       (SH_MOBILE_SDHI_SCC_TMPPORT5_DLL_ADR_MASK & addr));
+
+	/* access start and stop */
+	sd_scc_write32(host, priv, SH_MOBILE_SDHI_SCC_TMPPORT4,
+		       SH_MOBILE_SDHI_SCC_TMPPORT4_DLL_ACC_START);
+	sd_scc_write32(host, priv, SH_MOBILE_SDHI_SCC_TMPPORT4, 0);
+
+	return sd_scc_read32(host, priv, SH_MOBILE_SDHI_SCC_TMPPORT7);
+}
+
+static void sd_scc_tmpport_write32(struct tmio_mmc_host *host,
+				   struct renesas_sdhi *priv, u32 addr, u32 val)
+{
+	/* write mode */
+	sd_scc_write32(host, priv, SH_MOBILE_SDHI_SCC_TMPPORT5,
+		       SH_MOBILE_SDHI_SCC_TMPPORT5_DLL_RW_SEL_W |
+		       (SH_MOBILE_SDHI_SCC_TMPPORT5_DLL_ADR_MASK & addr));
+
+	sd_scc_write32(host, priv, SH_MOBILE_SDHI_SCC_TMPPORT6, val);
+
+	/* access start and stop */
+	sd_scc_write32(host, priv, SH_MOBILE_SDHI_SCC_TMPPORT4,
+		       SH_MOBILE_SDHI_SCC_TMPPORT4_DLL_ACC_START);
+	sd_scc_write32(host, priv, SH_MOBILE_SDHI_SCC_TMPPORT4, 0);
+}
+
+static void renesas_sdhi_adjust_hs400_mode_enable(struct tmio_mmc_host *host)
+{
+	struct renesas_sdhi *priv = host_to_priv(host);
+	u32 calib_code;
+
+	/* disable write protect */
+	sd_scc_tmpport_write32(host, priv, 0x00,
+			       SH_MOBILE_SDHI_SCC_TMPPORT_DISABLE_WP_CODE);
+	/* read calibration code and adjust */
+	calib_code = sd_scc_tmpport_read32(host, priv, 0x26);
+	calib_code &= SH_MOBILE_SDHI_SCC_TMPPORT_CALIB_CODE_MASK;
+
+	sd_scc_tmpport_write32(host, priv, 0x22,
+			       SH_MOBILE_SDHI_SCC_TMPPORT_MANUAL_MODE |
+			       priv->adjust_hs400_calib_table[calib_code]);
+
+	/* set offset value to TMPPORT3, hardcoded to OFFSET0 (= 0x3) for now */
+	sd_scc_write32(host, priv, SH_MOBILE_SDHI_SCC_TMPPORT3, 0x3);
+
+	/* adjustment done, clear flag */
+	priv->needs_adjust_hs400 = false;
+}
+
+static void renesas_sdhi_adjust_hs400_mode_disable(struct tmio_mmc_host *host)
+{
+	struct renesas_sdhi *priv = host_to_priv(host);
+
+	/* disable write protect */
+	sd_scc_tmpport_write32(host, priv, 0x00,
+			       SH_MOBILE_SDHI_SCC_TMPPORT_DISABLE_WP_CODE);
+	/* disable manual calibration */
+	sd_scc_tmpport_write32(host, priv, 0x22, 0);
+	/* clear offset value of TMPPORT3 */
+	sd_scc_write32(host, priv, SH_MOBILE_SDHI_SCC_TMPPORT3, 0);
+}
+
 static void renesas_sdhi_reset_hs400_mode(struct tmio_mmc_host *host,
 					  struct renesas_sdhi *priv)
 {
@@ -424,6 +537,9 @@ static void renesas_sdhi_reset_hs400_mode(struct tmio_mmc_host *host,
 			 SH_MOBILE_SDHI_SCC_TMPPORT2_HS400OSEL) &
 			sd_scc_read32(host, priv, SH_MOBILE_SDHI_SCC_TMPPORT2));
 
+	if (priv->adjust_hs400_calib_table)
+		renesas_sdhi_adjust_hs400_mode_disable(host);
+
 	sd_ctrl_write16(host, CTL_SD_CARD_CLK_CTL, CLK_CTL_SCLKEN |
 			sd_ctrl_read16(host, CTL_SD_CARD_CLK_CTL));
 }
@@ -442,6 +558,7 @@ static void renesas_sdhi_reset(struct tmio_mmc_host *host)
 
 	renesas_sdhi_reset_scc(host, priv);
 	renesas_sdhi_reset_hs400_mode(host, priv);
+	priv->needs_adjust_hs400 = false;
 
 	sd_ctrl_write16(host, CTL_SD_CARD_CLK_CTL, CLK_CTL_SCLKEN |
 			sd_ctrl_read16(host, CTL_SD_CARD_CLK_CTL));
@@ -717,6 +834,13 @@ static int renesas_sdhi_multi_io_quirk(struct mmc_card *card,
 	return blk_size;
 }
 
+static void renesas_sdhi_fixup_request(struct tmio_mmc_host *host, struct mmc_request *mrq)
+{
+	struct renesas_sdhi *priv = host_to_priv(host);
+
+	if (priv->needs_adjust_hs400 && mrq->cmd->opcode == MMC_SEND_STATUS)
+		renesas_sdhi_adjust_hs400_mode_enable(host);
+}
 static void renesas_sdhi_enable_dma(struct tmio_mmc_host *host, bool enable)
 {
 	/* Iff regs are 8 byte apart, sdbuf is 64 bit. Otherwise always 32. */
@@ -748,6 +872,21 @@ static const struct renesas_sdhi_quirks sdhi_quirks_bad_taps2367 = {
 	.hs400_bad_taps = BIT(2) | BIT(3) | BIT(6) | BIT(7),
 };
 
+static const struct renesas_sdhi_quirks sdhi_quirks_r8a7796_es13 = {
+	.hs400_4taps = true,
+	.hs400_bad_taps = BIT(2) | BIT(3) | BIT(6) | BIT(7),
+	.hs400_calib_table = r8a7796_es13_calib_table,
+};
+
+static const struct renesas_sdhi_quirks sdhi_quirks_r8a77965 = {
+	.hs400_bad_taps = BIT(2) | BIT(3) | BIT(6) | BIT(7),
+	.hs400_calib_table = r8a77965_calib_table,
+};
+
+static const struct renesas_sdhi_quirks sdhi_quirks_r8a77990 = {
+	.hs400_calib_table = r8a77990_calib_table,
+};
+
 /*
  * Note for r8a7796 / r8a774a1: we can't distinguish ES1.1 and 1.2 as of now.
  * So, we want to treat them equally and only have a match for ES1.2 to enforce
@@ -759,10 +898,11 @@ static const struct soc_device_attribute sdhi_quirks_match[]  = {
 	{ .soc_id = "r8a7795", .revision = "ES2.0", .data = &sdhi_quirks_4tap },
 	{ .soc_id = "r8a7795", .revision = "ES3.*", .data = &sdhi_quirks_bad_taps2367 },
 	{ .soc_id = "r8a7796", .revision = "ES1.[012]", .data = &sdhi_quirks_4tap_nohs400 },
-	{ .soc_id = "r8a7796", .revision = "ES1.*", .data = &sdhi_quirks_4tap },
+	{ .soc_id = "r8a7796", .revision = "ES1.*", .data = &sdhi_quirks_r8a7796_es13 },
 	{ .soc_id = "r8a7796", .revision = "ES3.*", .data = &sdhi_quirks_bad_taps1357 },
-	{ .soc_id = "r8a77965", .data = &sdhi_quirks_bad_taps2367 },
+	{ .soc_id = "r8a77965", .data = &sdhi_quirks_r8a77965 },
 	{ .soc_id = "r8a77980", .data = &sdhi_quirks_nohs400 },
+	{ .soc_id = "r8a77990", .data = &sdhi_quirks_r8a77990 },
 	{ /* Sentinel. */ },
 };
 
@@ -919,6 +1059,14 @@ int renesas_sdhi_probe(struct platform_device *pdev,
 	if (ver == SDHI_VER_GEN2_SDR50)
 		mmc_data->flags &= ~TMIO_MMC_HAVE_CBSY;
 
+	if (ver == SDHI_VER_GEN3_SDMMC && quirks && quirks->hs400_calib_table) {
+		host->fixup_request = renesas_sdhi_fixup_request;
+		priv->adjust_hs400_calib_table = *(
+			res->start == SDHI_GEN3_MMC0_ADDR ?
+			quirks->hs400_calib_table :
+			quirks->hs400_calib_table + 1);
+	}
+
 	ret = tmio_mmc_host_probe(host);
 	if (ret < 0)
 		goto edisclk;
-- 
2.20.1

