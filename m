Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C4B5A2C5A8E
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 26 Nov 2020 18:28:21 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726677AbgKZR2E (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 26 Nov 2020 12:28:04 -0500
Received: from mo4-p02-ob.smtp.rzone.de ([85.215.255.81]:31201 "EHLO
        mo4-p02-ob.smtp.rzone.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2403903AbgKZR2E (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 26 Nov 2020 12:28:04 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1606411682;
        s=strato-dkim-0002; d=fpond.eu;
        h=References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
        X-RZG-CLASS-ID:X-RZG-AUTH:From:Subject:Sender;
        bh=W/nEZ1q0CLOJohuQCNEhetGMctpjI7eyhO6G1XEczTc=;
        b=Dyey/hykZ/OeY4GcZlnzrlzoFRiOD5x/f6kvIMM77TPE3PCNor9gKK8DgQr73ngHgd
        y5Gpc0InK9VBWLjnfQb8pjCfMJ7rgywQv7I0vRN7tpmVO+FU+xM0Gj0HGdTYzWbVJD2k
        MJWQJaRqnZ5aZ+2Re8gvh0d71snD8CoZxBgUX70jLkZ+lZS1qB2ux92FogC8VHem1D0c
        sgr97at2KRbI+wgHFqlns3a9uLakq6yKHP5NyAJZKCcmUuOeM1gFaLilbfJi689fIMuX
        AT5JAJBNSU9xMvutVvqFjBOCwpLR0WEkL5Zvv1Qh+IifY2eI1SMvxy5WbXtapQlQBjrB
        AyWg==
X-RZG-AUTH: ":OWANVUa4dPFUgKR/3dpvnYP0Np73dmm4I5W0/AvA67Ot4fvR82ped3jxkhQ="
X-RZG-CLASS-ID: mo00
Received: from groucho.site
        by smtp.strato.de (RZmta 47.3.3 DYNA|AUTH)
        with ESMTPSA id 60ba70wAQHM3Mpj
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
        (Client did not present a certificate);
        Thu, 26 Nov 2020 18:22:03 +0100 (CET)
From:   Ulrich Hecht <uli+renesas@fpond.eu>
To:     linux-renesas-soc@vger.kernel.org
Cc:     wsa@the-dreams.de, geert@linux-m68k.org, hoai.luu.ub@renesas.com,
        Ulrich Hecht <uli+renesas@fpond.eu>
Subject: [PATCH 06/11] pinctrl: renesas: r8a779a0: Add MMC pins, groups and functions
Date:   Thu, 26 Nov 2020 18:21:49 +0100
Message-Id: <20201126172154.25625-7-uli+renesas@fpond.eu>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20201126172154.25625-1-uli+renesas@fpond.eu>
References: <20201126172154.25625-1-uli+renesas@fpond.eu>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

This patch adds MMC pins, groups and functions to R8A779A0 (V3U) SoC.

Signed-off-by: Ulrich Hecht <uli+renesas@fpond.eu>
---
 drivers/pinctrl/renesas/pfc-r8a779a0.c | 79 ++++++++++++++++++++++++++
 1 file changed, 79 insertions(+)

diff --git a/drivers/pinctrl/renesas/pfc-r8a779a0.c b/drivers/pinctrl/renesas/pfc-r8a779a0.c
index 8b5313a7917a..854b60653d0c 100644
--- a/drivers/pinctrl/renesas/pfc-r8a779a0.c
+++ b/drivers/pinctrl/renesas/pfc-r8a779a0.c
@@ -1983,6 +1983,65 @@ static const unsigned int intc_ex_irq5_mux[] = {
 	IRQ5_MARK,
 };
 
+/* - MMC -------------------------------------------------------------------- */
+static const unsigned int mmc_data1_pins[] = {
+	/* MMC_SD_D0 */
+	RCAR_GP_PIN(0, 19),
+};
+static const unsigned int mmc_data1_mux[] = {
+	MMC_SD_D0_MARK,
+};
+static const unsigned int mmc_data4_pins[] = {
+	/* MMC_SD_D[0:3] */
+	RCAR_GP_PIN(0, 19), RCAR_GP_PIN(0, 20),
+	RCAR_GP_PIN(0, 21), RCAR_GP_PIN(0, 22),
+};
+static const unsigned int mmc_data4_mux[] = {
+	MMC_SD_D0_MARK, MMC_SD_D1_MARK,
+	MMC_SD_D2_MARK, MMC_SD_D3_MARK,
+};
+static const unsigned int mmc_data8_pins[] = {
+	/* MMC_SD_D[0:3], MMC_D[4:7] */
+	RCAR_GP_PIN(0, 19), RCAR_GP_PIN(0, 20),
+	RCAR_GP_PIN(0, 21), RCAR_GP_PIN(0, 22),
+	RCAR_GP_PIN(0, 24), RCAR_GP_PIN(0, 25),
+	RCAR_GP_PIN(0, 26), RCAR_GP_PIN(0, 27),
+};
+static const unsigned int mmc_data8_mux[] = {
+	MMC_SD_D0_MARK, MMC_SD_D1_MARK,
+	MMC_SD_D2_MARK, MMC_SD_D3_MARK,
+	MMC_D4_MARK, MMC_D5_MARK,
+	MMC_D6_MARK, MMC_D7_MARK,
+};
+static const unsigned int mmc_ctrl_pins[] = {
+	/* MMC_SD_CLK, MMC_SD_CMD */
+	RCAR_GP_PIN(0, 23), RCAR_GP_PIN(0, 18),
+};
+static const unsigned int mmc_ctrl_mux[] = {
+	MMC_SD_CLK_MARK, MMC_SD_CMD_MARK,
+};
+static const unsigned int mmc_cd_pins[] = {
+	/* SD_CD */
+	RCAR_GP_PIN(0, 16),
+};
+static const unsigned int mmc_cd_mux[] = {
+	SD_CD_MARK,
+};
+static const unsigned int mmc_wp_pins[] = {
+	/* SD_WP */
+	RCAR_GP_PIN(0, 15),
+};
+static const unsigned int mmc_wp_mux[] = {
+	SD_WP_MARK,
+};
+static const unsigned int mmc_ds_pins[] = {
+	/* MMC_DS */
+	RCAR_GP_PIN(0, 17),
+};
+static const unsigned int mmc_ds_mux[] = {
+	MMC_DS_MARK,
+};
+
 /* - SCIF0 ------------------------------------------------------------------ */
 static const unsigned int scif0_data_pins[] = {
 	/* RX0, TX0 */
@@ -2189,6 +2248,14 @@ static const struct sh_pfc_pin_group pinmux_groups[] = {
 	SH_PFC_PIN_GROUP(intc_ex_irq4),
 	SH_PFC_PIN_GROUP(intc_ex_irq5),
 
+	SH_PFC_PIN_GROUP(mmc_data1),
+	SH_PFC_PIN_GROUP(mmc_data4),
+	SH_PFC_PIN_GROUP(mmc_data8),
+	SH_PFC_PIN_GROUP(mmc_ctrl),
+	SH_PFC_PIN_GROUP(mmc_cd),
+	SH_PFC_PIN_GROUP(mmc_wp),
+	SH_PFC_PIN_GROUP(mmc_ds),
+
 	SH_PFC_PIN_GROUP(scif0_data),
 	SH_PFC_PIN_GROUP(scif0_clk),
 	SH_PFC_PIN_GROUP(scif0_ctrl),
@@ -2382,6 +2449,16 @@ static const char * const intc_ex_groups[] = {
 	"intc_ex_irq5",
 };
 
+static const char * const mmc_groups[] = {
+	"mmc_data1",
+	"mmc_data4",
+	"mmc_data8",
+	"mmc_ctrl",
+	"mmc_cd",
+	"mmc_wp",
+	"mmc_ds",
+};
+
 static const char * const scif0_groups[] = {
 	"scif0_data",
 	"scif0_clk",
@@ -2445,6 +2522,8 @@ static const struct sh_pfc_function pinmux_functions[] = {
 
 	SH_PFC_FUNCTION(intc_ex),
 
+	SH_PFC_FUNCTION(mmc),
+
 	SH_PFC_FUNCTION(scif0),
 	SH_PFC_FUNCTION(scif1),
 	SH_PFC_FUNCTION(scif3),
-- 
2.20.1

