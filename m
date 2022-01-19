Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4A03A493BA2
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 19 Jan 2022 15:03:01 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1354993AbiASOC5 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 19 Jan 2022 09:02:57 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38850 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1354994AbiASOCq (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 19 Jan 2022 09:02:46 -0500
Received: from andre.telenet-ops.be (andre.telenet-ops.be [IPv6:2a02:1800:120:4::f00:15])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AC9AEC061756
        for <linux-renesas-soc@vger.kernel.org>; Wed, 19 Jan 2022 06:02:43 -0800 (PST)
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed40:a44d:f245:bac9:611c])
        by andre.telenet-ops.be with bizsmtp
        id ke2g2600o2FKFx601e2g05; Wed, 19 Jan 2022 15:02:41 +0100
Received: from rox.of.borg ([192.168.97.57] helo=rox)
        by ramsan.of.borg with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
        (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1nABXs-00AS0r-Hn; Wed, 19 Jan 2022 15:02:40 +0100
Received: from geert by rox with local (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1nABXs-009iHV-3u; Wed, 19 Jan 2022 15:02:40 +0100
From:   Geert Uytterhoeven <geert+renesas@glider.be>
To:     linux-renesas-soc@vger.kernel.org
Cc:     LUU HOAI <hoai.luu.ub@renesas.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH/RFC 06/15] pinctrl: renesas: r8a779f0: Add I2C pins, groups, and functions
Date:   Wed, 19 Jan 2022 15:02:23 +0100
Message-Id: <f23e9e1323f59dedd8a8387366656cf880ba254e.1642599415.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1642599415.git.geert+renesas@glider.be>
References: <cover.1642599415.git.geert+renesas@glider.be>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Add pins, groups, and functions for the I2C Bus Interfaces (I2C) on the
Renesas R-Car S4-8 (R8A779F0) SoC.

Extracted from a larger patch in the BSP by LUU HOAI.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
 drivers/pinctrl/renesas/pfc-r8a779f0.c | 90 ++++++++++++++++++++++++++
 1 file changed, 90 insertions(+)

diff --git a/drivers/pinctrl/renesas/pfc-r8a779f0.c b/drivers/pinctrl/renesas/pfc-r8a779f0.c
index ba0a84b0acd24fbe..a76355305367b0f0 100644
--- a/drivers/pinctrl/renesas/pfc-r8a779f0.c
+++ b/drivers/pinctrl/renesas/pfc-r8a779f0.c
@@ -1242,6 +1242,60 @@ static const struct sh_pfc_pin pinmux_pins[] = {
 	PINMUX_GPIO_GP_ALL(),
 };
 
+/* - I2C0 ------------------------------------------------------------------- */
+static const unsigned int i2c0_pins[] = {
+	/* SDA0, SCL0 */
+	RCAR_GP_PIN(1, 1), RCAR_GP_PIN(1, 0),
+};
+static const unsigned int i2c0_mux[] = {
+	SDA0_MARK, SCL0_MARK,
+};
+
+/* - I2C1 ------------------------------------------------------------------- */
+static const unsigned int i2c1_pins[] = {
+	/* SDA1, SCL1 */
+	RCAR_GP_PIN(1, 3), RCAR_GP_PIN(1, 2),
+};
+static const unsigned int i2c1_mux[] = {
+	SDA1_MARK, SCL1_MARK,
+};
+
+/* - I2C2 ------------------------------------------------------------------- */
+static const unsigned int i2c2_pins[] = {
+	/* SDA2, SCL2 */
+	RCAR_GP_PIN(1, 5), RCAR_GP_PIN(1, 4),
+};
+static const unsigned int i2c2_mux[] = {
+	SDA2_MARK, SCL2_MARK,
+};
+
+/* - I2C3 ------------------------------------------------------------------- */
+static const unsigned int i2c3_pins[] = {
+	/* SDA3, SCL3 */
+	RCAR_GP_PIN(1, 7), RCAR_GP_PIN(1, 6),
+};
+static const unsigned int i2c3_mux[] = {
+	SDA3_MARK, SCL3_MARK,
+};
+
+/* - I2C4 ------------------------------------------------------------------- */
+static const unsigned int i2c4_pins[] = {
+	/* SDA4, SCL4 */
+	RCAR_GP_PIN(1, 9), RCAR_GP_PIN(1, 8),
+};
+static const unsigned int i2c4_mux[] = {
+	SDA4_MARK, SCL4_MARK,
+};
+
+/* - I2C5 ------------------------------------------------------------------- */
+static const unsigned int i2c5_pins[] = {
+	/* SDA5, SCL5 */
+	RCAR_GP_PIN(1, 11), RCAR_GP_PIN(1, 10),
+};
+static const unsigned int i2c5_mux[] = {
+	SDA5_MARK, SCL5_MARK,
+};
+
 /* - SCIF0 ------------------------------------------------------------------ */
 static const unsigned int scif0_data_pins[] = {
 	/* RX0, TX0 */
@@ -1344,6 +1398,12 @@ static const unsigned int scif_clk_mux[] = {
 };
 
 static const struct sh_pfc_pin_group pinmux_groups[] = {
+	SH_PFC_PIN_GROUP(i2c0),
+	SH_PFC_PIN_GROUP(i2c1),
+	SH_PFC_PIN_GROUP(i2c2),
+	SH_PFC_PIN_GROUP(i2c3),
+	SH_PFC_PIN_GROUP(i2c4),
+	SH_PFC_PIN_GROUP(i2c5),
 	SH_PFC_PIN_GROUP(scif0_data),
 	SH_PFC_PIN_GROUP(scif0_clk),
 	SH_PFC_PIN_GROUP(scif0_ctrl),
@@ -1359,6 +1419,30 @@ static const struct sh_pfc_pin_group pinmux_groups[] = {
 	SH_PFC_PIN_GROUP(scif_clk),
 };
 
+static const char * const i2c0_groups[] = {
+	"i2c0",
+};
+
+static const char * const i2c1_groups[] = {
+	"i2c1",
+};
+
+static const char * const i2c2_groups[] = {
+	"i2c2",
+};
+
+static const char * const i2c3_groups[] = {
+	"i2c3",
+};
+
+static const char * const i2c4_groups[] = {
+	"i2c4",
+};
+
+static const char * const i2c5_groups[] = {
+	"i2c5",
+};
+
 static const char * const scif0_groups[] = {
 	"scif0_data",
 	"scif0_clk",
@@ -1388,6 +1472,12 @@ static const char * const scif_clk_groups[] = {
 };
 
 static const struct sh_pfc_function pinmux_functions[] = {
+	SH_PFC_FUNCTION(i2c0),
+	SH_PFC_FUNCTION(i2c1),
+	SH_PFC_FUNCTION(i2c2),
+	SH_PFC_FUNCTION(i2c3),
+	SH_PFC_FUNCTION(i2c4),
+	SH_PFC_FUNCTION(i2c5),
 	SH_PFC_FUNCTION(scif0),
 	SH_PFC_FUNCTION(scif1),
 	SH_PFC_FUNCTION(scif3),
-- 
2.25.1

