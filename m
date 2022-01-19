Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 64D4A493B99
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 19 Jan 2022 15:02:51 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1354983AbiASOCs (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 19 Jan 2022 09:02:48 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38820 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1354974AbiASOCo (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 19 Jan 2022 09:02:44 -0500
Received: from andre.telenet-ops.be (andre.telenet-ops.be [IPv6:2a02:1800:120:4::f00:15])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6C38AC06173F
        for <linux-renesas-soc@vger.kernel.org>; Wed, 19 Jan 2022 06:02:43 -0800 (PST)
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed40:a44d:f245:bac9:611c])
        by andre.telenet-ops.be with bizsmtp
        id ke2h260042FKFx601e2h0A; Wed, 19 Jan 2022 15:02:41 +0100
Received: from rox.of.borg ([192.168.97.57] helo=rox)
        by ramsan.of.borg with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
        (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1nABXs-00AS0q-RA; Wed, 19 Jan 2022 15:02:40 +0100
Received: from geert by rox with local (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1nABXs-009iHO-3F; Wed, 19 Jan 2022 15:02:40 +0100
From:   Geert Uytterhoeven <geert+renesas@glider.be>
To:     linux-renesas-soc@vger.kernel.org
Cc:     LUU HOAI <hoai.luu.ub@renesas.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH/RFC 05/15] pinctrl: renesas: r8a779f0: Add SCIF pins, groups, and functions
Date:   Wed, 19 Jan 2022 15:02:22 +0100
Message-Id: <5b52f1a82a46b06ffb023c6fc7fb7745dc0dd6c9.1642599415.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1642599415.git.geert+renesas@glider.be>
References: <cover.1642599415.git.geert+renesas@glider.be>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Add pins, groups, and functions for the Serial Communication Interfaces
with FIFO (SCIF) on the Renesas R-Car S4-8 (R8A779F0) SoC.

Extracted from a larger patch in the BSP by LUU HOAI.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
 drivers/pinctrl/renesas/pfc-r8a779f0.c | 147 +++++++++++++++++++++++++
 1 file changed, 147 insertions(+)

diff --git a/drivers/pinctrl/renesas/pfc-r8a779f0.c b/drivers/pinctrl/renesas/pfc-r8a779f0.c
index 1598aa6ebc34f8a8..ba0a84b0acd24fbe 100644
--- a/drivers/pinctrl/renesas/pfc-r8a779f0.c
+++ b/drivers/pinctrl/renesas/pfc-r8a779f0.c
@@ -1242,10 +1242,157 @@ static const struct sh_pfc_pin pinmux_pins[] = {
 	PINMUX_GPIO_GP_ALL(),
 };
 
+/* - SCIF0 ------------------------------------------------------------------ */
+static const unsigned int scif0_data_pins[] = {
+	/* RX0, TX0 */
+	RCAR_GP_PIN(0, 6), RCAR_GP_PIN(0, 7),
+};
+static const unsigned int scif0_data_mux[] = {
+	RX0_MARK, TX0_MARK,
+};
+static const unsigned int scif0_clk_pins[] = {
+	/* SCK0 */
+	RCAR_GP_PIN(0, 8),
+};
+static const unsigned int scif0_clk_mux[] = {
+	SCK0_MARK,
+};
+static const unsigned int scif0_ctrl_pins[] = {
+	/* RTS0#, CTS0# */
+	RCAR_GP_PIN(0, 9), RCAR_GP_PIN(0, 10),
+};
+static const unsigned int scif0_ctrl_mux[] = {
+	RTS0_N_MARK, CTS0_N_MARK,
+};
+
+/* - SCIF1 ------------------------------------------------------------------ */
+static const unsigned int scif1_data_pins[] = {
+	/* RX1, TX1 */
+	RCAR_GP_PIN(0, 12), RCAR_GP_PIN(0, 13),
+};
+static const unsigned int scif1_data_mux[] = {
+	RX1_MARK, TX1_MARK,
+};
+static const unsigned int scif1_clk_pins[] = {
+	/* SCK1 */
+	RCAR_GP_PIN(0, 14),
+};
+static const unsigned int scif1_clk_mux[] = {
+	SCK1_MARK,
+};
+static const unsigned int scif1_ctrl_pins[] = {
+	/* RTS1#, CTS1# */
+	RCAR_GP_PIN(0, 15), RCAR_GP_PIN(0, 11),
+};
+static const unsigned int scif1_ctrl_mux[] = {
+	RTS1_N_MARK, CTS1_N_MARK,
+};
+
+/* - SCIF3 ------------------------------------------------------------------ */
+static const unsigned int scif3_data_pins[] = {
+	/* RX3, TX3 */
+	RCAR_GP_PIN(0, 2), RCAR_GP_PIN(0, 3),
+};
+static const unsigned int scif3_data_mux[] = {
+	RX3_MARK, TX3_MARK,
+};
+static const unsigned int scif3_clk_pins[] = {
+	/* SCK3 */
+	RCAR_GP_PIN(0, 1),
+};
+static const unsigned int scif3_clk_mux[] = {
+	SCK3_MARK,
+};
+static const unsigned int scif3_ctrl_pins[] = {
+	/* RTS3#, CTS3# */
+	RCAR_GP_PIN(0, 5), RCAR_GP_PIN(0, 4),
+};
+static const unsigned int scif3_ctrl_mux[] = {
+	RTS3_N_MARK, CTS3_N_MARK,
+};
+
+/* - SCIF4 ------------------------------------------------------------------ */
+static const unsigned int scif4_data_pins[] = {
+	/* RX4, TX4 */
+	RCAR_GP_PIN(1, 6), RCAR_GP_PIN(1, 7),
+};
+static const unsigned int scif4_data_mux[] = {
+	RX4_MARK, TX4_MARK,
+};
+static const unsigned int scif4_clk_pins[] = {
+	/* SCK4 */
+	RCAR_GP_PIN(1, 5),
+};
+static const unsigned int scif4_clk_mux[] = {
+	SCK4_MARK,
+};
+static const unsigned int scif4_ctrl_pins[] = {
+	/* RTS4#, CTS4# */
+	RCAR_GP_PIN(1, 4), RCAR_GP_PIN(1, 3),
+};
+static const unsigned int scif4_ctrl_mux[] = {
+	RTS4_N_MARK, CTS4_N_MARK,
+};
+
+/* - SCIF Clock ------------------------------------------------------------- */
+static const unsigned int scif_clk_pins[] = {
+	/* SCIF_CLK */
+	RCAR_GP_PIN(0, 0),
+};
+static const unsigned int scif_clk_mux[] = {
+	SCIF_CLK_MARK,
+};
+
 static const struct sh_pfc_pin_group pinmux_groups[] = {
+	SH_PFC_PIN_GROUP(scif0_data),
+	SH_PFC_PIN_GROUP(scif0_clk),
+	SH_PFC_PIN_GROUP(scif0_ctrl),
+	SH_PFC_PIN_GROUP(scif1_data),
+	SH_PFC_PIN_GROUP(scif1_clk),
+	SH_PFC_PIN_GROUP(scif1_ctrl),
+	SH_PFC_PIN_GROUP(scif3_data),
+	SH_PFC_PIN_GROUP(scif3_clk),
+	SH_PFC_PIN_GROUP(scif3_ctrl),
+	SH_PFC_PIN_GROUP(scif4_data),
+	SH_PFC_PIN_GROUP(scif4_clk),
+	SH_PFC_PIN_GROUP(scif4_ctrl),
+	SH_PFC_PIN_GROUP(scif_clk),
+};
+
+static const char * const scif0_groups[] = {
+	"scif0_data",
+	"scif0_clk",
+	"scif0_ctrl",
+};
+
+static const char * const scif1_groups[] = {
+	"scif1_data",
+	"scif1_clk",
+	"scif1_ctrl",
+};
+
+static const char * const scif3_groups[] = {
+	"scif3_data",
+	"scif3_clk",
+	"scif3_ctrl",
+};
+
+static const char * const scif4_groups[] = {
+	"scif4_data",
+	"scif4_clk",
+	"scif4_ctrl",
+};
+
+static const char * const scif_clk_groups[] = {
+	"scif_clk",
 };
 
 static const struct sh_pfc_function pinmux_functions[] = {
+	SH_PFC_FUNCTION(scif0),
+	SH_PFC_FUNCTION(scif1),
+	SH_PFC_FUNCTION(scif3),
+	SH_PFC_FUNCTION(scif4),
+	SH_PFC_FUNCTION(scif_clk),
 };
 
 static const struct pinmux_cfg_reg pinmux_config_regs[] = {
-- 
2.25.1

