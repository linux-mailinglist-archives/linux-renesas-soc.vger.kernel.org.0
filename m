Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 843642C5A76
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 26 Nov 2020 18:25:19 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2404278AbgKZRYH (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 26 Nov 2020 12:24:07 -0500
Received: from mo4-p01-ob.smtp.rzone.de ([81.169.146.167]:33954 "EHLO
        mo4-p01-ob.smtp.rzone.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2404192AbgKZRYG (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 26 Nov 2020 12:24:06 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1606411444;
        s=strato-dkim-0002; d=fpond.eu;
        h=References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
        X-RZG-CLASS-ID:X-RZG-AUTH:From:Subject:Sender;
        bh=FldTtdWzHcegkjBfR1chEZcXagtcK/b7QAUryK+3t5A=;
        b=gfhktBGIMMzX398fWwd5nPLzHNr5I4S2nHyQIjqHEiWQisBIm7C6vYJiwpAsox0HU2
        9IJXugiFiaaxNbPLwpDlSd+z6xRPMgse+vUAzOiOYYWjaJnPukCmGW1c8jpFwVDPWtTg
        x87mZRQI2/q291GmLVd81BIWM9SB8JPSTLYJ8fip2xFwjLazyQzeR5cg58t5T0bKYh5N
        ZFQOetlMtEDsONX78VSp5hEPgT4oj0Sa65kQhlYh8VPwTHMMFBI55s4UwpH3QZCfIDkO
        6j/nhO8KgdbgZ69yA9C4+F3AZ3H1OdQwvCZDs62OSIZ+5DDDp6Iw5m1mEk1rxXfg/opl
        bhLQ==
X-RZG-AUTH: ":OWANVUa4dPFUgKR/3dpvnYP0Np73dmm4I5W0/AvA67Ot4fvR82ped3jxkhQ="
X-RZG-CLASS-ID: mo00
Received: from groucho.site
        by smtp.strato.de (RZmta 47.3.3 DYNA|AUTH)
        with ESMTPSA id 60ba70wAQHL8MpO
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
        (Client did not present a certificate);
        Thu, 26 Nov 2020 18:21:08 +0100 (CET)
From:   Ulrich Hecht <uli+renesas@fpond.eu>
To:     linux-renesas-soc@vger.kernel.org
Cc:     wsa@the-dreams.de, geert@linux-m68k.org, hoai.luu.ub@renesas.com,
        Ulrich Hecht <uli+renesas@fpond.eu>
Subject: [PATCH 3/3] pinctrl: renesas: r8a779a0: Add SCIF pins, groups and functions
Date:   Thu, 26 Nov 2020 18:20:58 +0100
Message-Id: <20201126172058.25275-4-uli+renesas@fpond.eu>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20201126172058.25275-1-uli+renesas@fpond.eu>
References: <20201126172058.25275-1-uli+renesas@fpond.eu>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

This patch adds SCIF0, 1, 3 and 4 pins, groups and functions for the
R8A779A0 (V3U) SoC.

Signed-off-by: Ulrich Hecht <uli+renesas@fpond.eu>
---
 drivers/pinctrl/renesas/pfc-r8a779a0.c | 147 +++++++++++++++++++++++++
 1 file changed, 147 insertions(+)

diff --git a/drivers/pinctrl/renesas/pfc-r8a779a0.c b/drivers/pinctrl/renesas/pfc-r8a779a0.c
index bbfa5f5c59d7..8ce7238e8ad3 100644
--- a/drivers/pinctrl/renesas/pfc-r8a779a0.c
+++ b/drivers/pinctrl/renesas/pfc-r8a779a0.c
@@ -1199,10 +1199,157 @@ static const struct sh_pfc_pin pinmux_pins[] = {
 	PINMUX_GPIO_GP_ALL(),
 };
 
+/* - SCIF0 ------------------------------------------------------------------ */
+static const unsigned int scif0_data_pins[] = {
+	/* RX0, TX0 */
+	RCAR_GP_PIN(1, 1), RCAR_GP_PIN(1, 5),
+};
+static const unsigned int scif0_data_mux[] = {
+	RX0_MARK, TX0_MARK,
+};
+static const unsigned int scif0_clk_pins[] = {
+	/* SCK0 */
+	RCAR_GP_PIN(1, 2),
+};
+static const unsigned int scif0_clk_mux[] = {
+	SCK0_MARK,
+};
+static const unsigned int scif0_ctrl_pins[] = {
+	/* RTS0#, CTS0# */
+	RCAR_GP_PIN(1, 3), RCAR_GP_PIN(1, 4),
+};
+static const unsigned int scif0_ctrl_mux[] = {
+	RTS0_N_MARK, CTS0_N_MARK,
+};
+
+/* - SCIF1 ------------------------------------------------------------------ */
+static const unsigned int scif1_data_pins[] = {
+	/* RX1, TX1 */
+	RCAR_GP_PIN(1, 21), RCAR_GP_PIN(1, 22),
+};
+static const unsigned int scif1_data_mux[] = {
+	RX1_MARK, TX1_MARK,
+};
+static const unsigned int scif1_clk_pins[] = {
+	/* SCK1 */
+	RCAR_GP_PIN(1, 18),
+};
+static const unsigned int scif1_clk_mux[] = {
+	SCK1_MARK,
+};
+static const unsigned int scif1_ctrl_pins[] = {
+	/* RTS1#, CTS1# */
+	RCAR_GP_PIN(1, 20), RCAR_GP_PIN(1, 19),
+};
+static const unsigned int scif1_ctrl_mux[] = {
+	RTS1_N_MARK, CTS1_N_MARK,
+};
+
+/* - SCIF3 ------------------------------------------------------------------ */
+static const unsigned int scif3_data_pins[] = {
+	/* RX3, TX3 */
+	RCAR_GP_PIN(1, 16), RCAR_GP_PIN(1, 17),
+};
+static const unsigned int scif3_data_mux[] = {
+	RX3_MARK, TX3_MARK,
+};
+static const unsigned int scif3_clk_pins[] = {
+	/* SCK3 */
+	RCAR_GP_PIN(1, 13),
+};
+static const unsigned int scif3_clk_mux[] = {
+	SCK3_MARK,
+};
+static const unsigned int scif3_ctrl_pins[] = {
+	/* RTS3#, CTS3# */
+	RCAR_GP_PIN(1, 15), RCAR_GP_PIN(1, 14),
+};
+static const unsigned int scif3_ctrl_mux[] = {
+	RTS3_N_MARK, CTS3_N_MARK,
+};
+
+/* - SCIF4 ------------------------------------------------------------------ */
+static const unsigned int scif4_data_pins[] = {
+	/* RX4, TX4 */
+	RCAR_GP_PIN(2, 8), RCAR_GP_PIN(2, 9),
+};
+static const unsigned int scif4_data_mux[] = {
+	RX4_MARK, TX4_MARK,
+};
+static const unsigned int scif4_clk_pins[] = {
+	/* SCK4 */
+	RCAR_GP_PIN(2, 5),
+};
+static const unsigned int scif4_clk_mux[] = {
+	SCK4_MARK,
+};
+static const unsigned int scif4_ctrl_pins[] = {
+	/* RTS4#, CTS4# */
+	RCAR_GP_PIN(2, 7), RCAR_GP_PIN(2, 6),
+};
+static const unsigned int scif4_ctrl_mux[] = {
+	RTS4_N_MARK, CTS4_N_MARK,
+};
+
+/* - SCIF Clock ------------------------------------------------------------- */
+static const unsigned int scif_clk_pins[] = {
+	/* SCIF_CLK */
+	RCAR_GP_PIN(1, 0),
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
2.20.1

