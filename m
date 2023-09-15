Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8200C7A19ED
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 15 Sep 2023 11:06:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233269AbjIOJGa (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 15 Sep 2023 05:06:30 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57744 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232633AbjIOJG2 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 15 Sep 2023 05:06:28 -0400
Received: from weierstrass.telenet-ops.be (weierstrass.telenet-ops.be [IPv6:2a02:1800:110:4::f00:11])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CEC0049DC
        for <linux-renesas-soc@vger.kernel.org>; Fri, 15 Sep 2023 02:04:52 -0700 (PDT)
Received: from andre.telenet-ops.be (andre.telenet-ops.be [IPv6:2a02:1800:120:4::f00:15])
        by weierstrass.telenet-ops.be (Postfix) with ESMTPS id 4Rn7YZ2hCnz4wyV2
        for <linux-renesas-soc@vger.kernel.org>; Fri, 15 Sep 2023 11:04:50 +0200 (CEST)
Received: from ramsan.of.borg ([84.195.187.55])
        by andre.telenet-ops.be with bizsmtp
        id m94q2A0031C8whw0194qoL; Fri, 15 Sep 2023 11:04:50 +0200
Received: from rox.of.borg ([192.168.97.57])
        by ramsan.of.borg with esmtp (Exim 4.95)
        (envelope-from <geert@linux-m68k.org>)
        id 1qh4kZ-003lJe-1R;
        Fri, 15 Sep 2023 11:04:50 +0200
Received: from geert by rox.of.borg with local (Exim 4.95)
        (envelope-from <geert@linux-m68k.org>)
        id 1qh4ks-00Gdl4-2C;
        Fri, 15 Sep 2023 11:04:50 +0200
From:   Geert Uytterhoeven <geert+renesas@glider.be>
To:     Magnus Damm <magnus.damm@gmail.com>
Cc:     linux-renesas-soc@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH/RFT 1/2] pinctrl: renesas: r8a7778: Add LBSC pins, groups, and functions
Date:   Fri, 15 Sep 2023 11:04:45 +0200
Message-Id: <347b9f7627871b45aec04a3351d50219d4d260fe.1694768311.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1694768311.git.geert+renesas@glider.be>
References: <cover.1694768311.git.geert+renesas@glider.be>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-1.6 required=5.0 tests=BAYES_00,
        HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,
        SPF_NONE autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Add pins, groups, and functions for the Local Bus State Controller
(LBSC) on the Renesas R-Car M1A (R8A7778) SoC.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
 drivers/pinctrl/renesas/pfc-r8a7778.c | 38 +++++++++++++++++++++++++++
 1 file changed, 38 insertions(+)

diff --git a/drivers/pinctrl/renesas/pfc-r8a7778.c b/drivers/pinctrl/renesas/pfc-r8a7778.c
index c52761d80f7bed16..db92d6d91d8ee943 100644
--- a/drivers/pinctrl/renesas/pfc-r8a7778.c
+++ b/drivers/pinctrl/renesas/pfc-r8a7778.c
@@ -1424,6 +1424,24 @@ I2C_PFC_MUX(i2c3_b,	SDA3_B,			SCL3_B);
 I2C_PFC_PIN(i2c3_c,	RCAR_GP_PIN(1, 22),	RCAR_GP_PIN(1, 23));
 I2C_PFC_MUX(i2c3_c,	SDA3_C,			SCL3_C);
 
+/* - LBSC ------------------------------------------------------------------- */
+SH_PFC_PINS(lbsc_cs0,		PIN_CS0);
+SH_PFC_MUX1(lbsc_cs0,		CS0);
+SH_PFC_PINS(lbsc_cs1,		PIN_CS1_A26);
+SH_PFC_MUX1(lbsc_cs1,		CS1_A26);
+SH_PFC_PINS(lbsc_ex_cs0,	RCAR_GP_PIN(1, 3));
+SH_PFC_MUX1(lbsc_ex_cs0,	EX_CS0);
+SH_PFC_PINS(lbsc_ex_cs1,	RCAR_GP_PIN(1, 4));
+SH_PFC_MUX1(lbsc_ex_cs1,	EX_CS1);
+SH_PFC_PINS(lbsc_ex_cs2,	RCAR_GP_PIN(1, 5));
+SH_PFC_MUX1(lbsc_ex_cs2,	EX_CS2);
+SH_PFC_PINS(lbsc_ex_cs3,	RCAR_GP_PIN(1, 6));
+SH_PFC_MUX1(lbsc_ex_cs3,	EX_CS3);
+SH_PFC_PINS(lbsc_ex_cs4,	RCAR_GP_PIN(1, 7));
+SH_PFC_MUX1(lbsc_ex_cs4,	EX_CS4);
+SH_PFC_PINS(lbsc_ex_cs5,	RCAR_GP_PIN(1, 8));
+SH_PFC_MUX1(lbsc_ex_cs5,	EX_CS5);
+
 /* - MMC macro -------------------------------------------------------------- */
 #define MMC_PFC_PINS(name, args...)		SH_PFC_PINS(name, args)
 #define MMC_PFC_CTRL(name, clk, cmd)		SH_PFC_MUX2(name, clk, cmd)
@@ -1724,6 +1742,14 @@ static const struct sh_pfc_pin_group pinmux_groups[] = {
 	SH_PFC_PIN_GROUP(i2c3_a),
 	SH_PFC_PIN_GROUP(i2c3_b),
 	SH_PFC_PIN_GROUP(i2c3_c),
+	SH_PFC_PIN_GROUP(lbsc_cs0),
+	SH_PFC_PIN_GROUP(lbsc_cs1),
+	SH_PFC_PIN_GROUP(lbsc_ex_cs0),
+	SH_PFC_PIN_GROUP(lbsc_ex_cs1),
+	SH_PFC_PIN_GROUP(lbsc_ex_cs2),
+	SH_PFC_PIN_GROUP(lbsc_ex_cs3),
+	SH_PFC_PIN_GROUP(lbsc_ex_cs4),
+	SH_PFC_PIN_GROUP(lbsc_ex_cs5),
 	SH_PFC_PIN_GROUP(mmc_ctrl),
 	BUS_DATA_PIN_GROUP(mmc_data, 1),
 	BUS_DATA_PIN_GROUP(mmc_data, 4),
@@ -1897,6 +1923,17 @@ static const char * const i2c3_groups[] = {
 	"i2c3_c",
 };
 
+static const char * const lbsc_groups[] = {
+	"lbsc_cs0",
+	"lbsc_cs1",
+	"lbsc_ex_cs0",
+	"lbsc_ex_cs1",
+	"lbsc_ex_cs2",
+	"lbsc_ex_cs3",
+	"lbsc_ex_cs4",
+	"lbsc_ex_cs5",
+};
+
 static const char * const mmc_groups[] = {
 	"mmc_ctrl",
 	"mmc_data1",
@@ -2049,6 +2086,7 @@ static const struct sh_pfc_function pinmux_functions[] = {
 	SH_PFC_FUNCTION(i2c1),
 	SH_PFC_FUNCTION(i2c2),
 	SH_PFC_FUNCTION(i2c3),
+	SH_PFC_FUNCTION(lbsc),
 	SH_PFC_FUNCTION(mmc),
 	SH_PFC_FUNCTION(scif_clk),
 	SH_PFC_FUNCTION(scif0),
-- 
2.34.1

