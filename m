Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B27505AD40
	for <lists+linux-renesas-soc@lfdr.de>; Sat, 29 Jun 2019 21:56:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726961AbfF2T42 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Sat, 29 Jun 2019 15:56:28 -0400
Received: from sauhun.de ([88.99.104.3]:36204 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726952AbfF2T41 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Sat, 29 Jun 2019 15:56:27 -0400
Received: from localhost (p5486CA23.dip0.t-ipconnect.de [84.134.202.35])
        by pokefinder.org (Postfix) with ESMTPSA id EB9E63E43D1;
        Sat, 29 Jun 2019 21:56:24 +0200 (CEST)
From:   Wolfram Sang <wsa+renesas@sang-engineering.com>
To:     linux-mmc@vger.kernel.org
Cc:     linux-renesas-soc@vger.kernel.org,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Takeshi Saito <takeshi.saito.xv@renesas.com>
Subject: [PATCH v2 RFT 4/4] mmc: renesas_sdhi: support manual calibration
Date:   Sat, 29 Jun 2019 21:54:43 +0200
Message-Id: <20190629195443.366-5-wsa+renesas@sang-engineering.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190629195443.366-1-wsa+renesas@sang-engineering.com>
References: <20190629195443.366-1-wsa+renesas@sang-engineering.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Some R-Car Gen3 SoCs need some manual correction of timing parameters
after the automatic tuning has finished but before next CMD13 is
completed. This patch implements that by this state machine:

- introducing a configuration flag ('manual_calibration') to mark
  affected SoCs
- iff the configuration flag is set the 'fixup_request' callback is
  populated during probe
- iff the configuration flag is set, a runtime flag ('needs_adjust_hs400')
  is set when HS400 tuning gets prepared
- if tuning HS400 fails, the runtime flag is cleared again
- the callback will check the runtime flag and enable the corrected
  manual mode if the flag is set and CMD13 is encountered
- at the end of the enablement the runtime flag is cleared
- iff the configuration flag is set, the manual mode will be disabled
  when HS400 gets downgraded

There also some helper functions added to access the TMPPORT registers.
The actual fixup value is SoC specific and also added to the quirks
struct.

Signed-off-by: Takeshi Saito <takeshi.saito.xv@renesas.com>
Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
---
 drivers/mmc/host/renesas_sdhi.h      |   3 +
 drivers/mmc/host/renesas_sdhi_core.c | 121 ++++++++++++++++++++++++++-
 2 files changed, 123 insertions(+), 1 deletion(-)

diff --git a/drivers/mmc/host/renesas_sdhi.h b/drivers/mmc/host/renesas_sdhi.h
index 88d05a617d43..f45180d16985 100644
--- a/drivers/mmc/host/renesas_sdhi.h
+++ b/drivers/mmc/host/renesas_sdhi.h
@@ -36,6 +36,8 @@ struct renesas_sdhi_of_data {
 struct renesas_sdhi_quirks {
 	bool hs400_disabled;
 	bool hs400_4taps;
+	bool manual_calibration;
+	u8 manual_calibration_fixup;
 };
 
 struct tmio_mmc_dma {
@@ -57,6 +59,7 @@ struct renesas_sdhi {
 	void __iomem *scc_ctl;
 	u32 scc_tappos;
 	u32 scc_tappos_hs400;
+	bool needs_adjust_hs400;
 };
 
 #define host_to_priv(host) \
diff --git a/drivers/mmc/host/renesas_sdhi_core.c b/drivers/mmc/host/renesas_sdhi_core.c
index bce1779229a8..6aaaa788de81 100644
--- a/drivers/mmc/host/renesas_sdhi_core.c
+++ b/drivers/mmc/host/renesas_sdhi_core.c
@@ -25,6 +25,7 @@
 #include <linux/of_device.h>
 #include <linux/platform_device.h>
 #include <linux/mmc/host.h>
+#include <linux/mmc/mmc.h>
 #include <linux/mmc/slot-gpio.h>
 #include <linux/mfd/tmio.h>
 #include <linux/sh_dma.h>
@@ -248,6 +249,11 @@ static int renesas_sdhi_start_signal_voltage_switch(struct mmc_host *mmc,
 #define SH_MOBILE_SDHI_SCC_RVSCNTL	0x008
 #define SH_MOBILE_SDHI_SCC_RVSREQ	0x00A
 #define SH_MOBILE_SDHI_SCC_TMPPORT2	0x00E
+#define SH_MOBILE_SDHI_SCC_TMPPORT3	0x014
+#define SH_MOBILE_SDHI_SCC_TMPPORT4	0x016
+#define SH_MOBILE_SDHI_SCC_TMPPORT5	0x018
+#define SH_MOBILE_SDHI_SCC_TMPPORT6	0x01A
+#define SH_MOBILE_SDHI_SCC_TMPPORT7	0x01C
 
 /* Definitions for values the SH_MOBILE_SDHI_SCC_DTCNTL register */
 #define SH_MOBILE_SDHI_SCC_DTCNTL_TAPEN		BIT(0)
@@ -264,6 +270,19 @@ static int renesas_sdhi_start_signal_voltage_switch(struct mmc_host *mmc,
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
 static inline u32 sd_scc_read32(struct tmio_mmc_host *host,
 				struct renesas_sdhi *priv, int addr)
 {
@@ -386,6 +405,76 @@ static void renesas_sdhi_disable_scc(struct tmio_mmc_host *host)
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
+	if (calib_code > priv->quirks->manual_calibration_fixup)
+		calib_code -= priv->quirks->manual_calibration_fixup;
+	else
+		calib_code = 0;
+	/* enable manual calibration */
+	sd_scc_tmpport_write32(host, priv, 0x22,
+			       SH_MOBILE_SDHI_SCC_TMPPORT_MANUAL_MODE | calib_code);
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
@@ -403,13 +492,20 @@ static void renesas_sdhi_reset_hs400_mode(struct tmio_mmc_host *host,
 			 SH_MOBILE_SDHI_SCC_TMPPORT2_HS400OSEL) &
 			sd_scc_read32(host, priv, SH_MOBILE_SDHI_SCC_TMPPORT2));
 
+	if (priv->quirks && priv->quirks->manual_calibration)
+		renesas_sdhi_adjust_hs400_mode_disable(host);
+
 	sd_ctrl_write16(host, CTL_SD_CARD_CLK_CTL, CLK_CTL_SCLKEN |
 			sd_ctrl_read16(host, CTL_SD_CARD_CLK_CTL));
 }
 
 static void renesas_sdhi_prepare_hs400_tuning(struct tmio_mmc_host *host)
 {
-	renesas_sdhi_reset_hs400_mode(host, host_to_priv(host));
+	struct renesas_sdhi *priv = host_to_priv(host);
+
+	renesas_sdhi_reset_hs400_mode(host, priv);
+	if (priv->quirks && priv->quirks->manual_calibration)
+		priv->needs_adjust_hs400 = true;
 }
 
 #define SH_MOBILE_SDHI_MAX_TAP 3
@@ -520,6 +616,7 @@ static void renesas_sdhi_hw_reset(struct tmio_mmc_host *host)
 
 	renesas_sdhi_reset_scc(host, priv);
 	renesas_sdhi_reset_hs400_mode(host, priv);
+	priv->needs_adjust_hs400 = false;
 
 	sd_ctrl_write16(host, CTL_SD_CARD_CLK_CTL, CLK_CTL_SCLKEN |
 			sd_ctrl_read16(host, CTL_SD_CARD_CLK_CTL));
@@ -596,6 +693,13 @@ static int renesas_sdhi_multi_io_quirk(struct mmc_card *card,
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
@@ -618,12 +722,24 @@ static const struct renesas_sdhi_quirks sdhi_quirks_nohs400 = {
 	.hs400_disabled = true,
 };
 
+static const struct renesas_sdhi_quirks sdhi_quirks_manual_calib0 = {
+	.manual_calibration = true,
+	.manual_calibration_fixup = 0,
+};
+
+static const struct renesas_sdhi_quirks sdhi_quirks_manual_calib4 = {
+	.manual_calibration = true,
+	.manual_calibration_fixup = 4,
+};
+
 static const struct soc_device_attribute sdhi_quirks_match[]  = {
 	{ .soc_id = "r8a774a1", .revision = "ES1.[012]", .data = &sdhi_quirks_4tap_nohs400 },
 	{ .soc_id = "r8a7795", .revision = "ES1.*", .data = &sdhi_quirks_4tap_nohs400 },
 	{ .soc_id = "r8a7795", .revision = "ES2.0", .data = &sdhi_quirks_4tap },
 	{ .soc_id = "r8a7796", .revision = "ES1.[012]", .data = &sdhi_quirks_4tap_nohs400 },
+	{ .soc_id = "r8a77965", .data = &sdhi_quirks_manual_calib0 },
 	{ .soc_id = "r8a77980", .data = &sdhi_quirks_nohs400 },
+	{ .soc_id = "r8a77990", .data = &sdhi_quirks_manual_calib4 },
 	{ /* Sentinel. */ },
 };
 
@@ -720,6 +836,9 @@ int renesas_sdhi_probe(struct platform_device *pdev,
 	if (quirks && quirks->hs400_4taps)
 		mmc_data->flags |= TMIO_MMC_HAVE_4TAP_HS400;
 
+	if (quirks && quirks->manual_calibration)
+		host->fixup_request = renesas_sdhi_fixup_request;
+
 	/* For some SoC, we disable internal WP. GPIO may override this */
 	if (mmc_can_gpio_ro(host->mmc))
 		mmc_data->capabilities2 &= ~MMC_CAP2_NO_WRITE_PROTECT;
-- 
2.20.1

