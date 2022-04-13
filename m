Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0004E4FFC4E
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 13 Apr 2022 19:24:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235737AbiDMR0q (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 13 Apr 2022 13:26:46 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:32864 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237286AbiDMR0o (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 13 Apr 2022 13:26:44 -0400
Received: from xavier.telenet-ops.be (xavier.telenet-ops.be [IPv6:2a02:1800:120:4::f00:14])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CA023DFC
        for <linux-renesas-soc@vger.kernel.org>; Wed, 13 Apr 2022 10:24:17 -0700 (PDT)
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed40:c9b8:20d3:ee2b:1cda])
        by xavier.telenet-ops.be with bizsmtp
        id JHQF2700a2t8Arn01HQFtC; Wed, 13 Apr 2022 19:24:15 +0200
Received: from rox.of.borg ([192.168.97.57])
        by ramsan.of.borg with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
        (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1negj1-000TqG-9u; Wed, 13 Apr 2022 19:24:15 +0200
Received: from geert by rox.of.borg with local (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1negj0-00DfV7-VV; Wed, 13 Apr 2022 19:24:14 +0200
From:   Geert Uytterhoeven <geert+renesas@glider.be>
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     linux-gpio@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH 29/50] pinctrl: renesas: r8a77951: Optimize fixed-width reserved fields
Date:   Wed, 13 Apr 2022 19:23:51 +0200
Message-Id: <cd59cc2e0f55f0dcede1356f73a9e69fe09bf5eb.1649865241.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1649865241.git.geert+renesas@glider.be>
References: <cover.1649865241.git.geert+renesas@glider.be>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.4 required=5.0 tests=BAYES_00,
        HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_LOW,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Describe registers with fixed-width register fields and many reserved
fields using the PINMUX_CFG_REG_VAR() macro, as the latter supports a
shorthand not requiring dummy values.

This reduces kernel size by 496 bytes.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
 drivers/pinctrl/renesas/pfc-r8a77951.c | 137 ++++++-------------------
 1 file changed, 32 insertions(+), 105 deletions(-)

diff --git a/drivers/pinctrl/renesas/pfc-r8a77951.c b/drivers/pinctrl/renesas/pfc-r8a77951.c
index ada84f5e8578cd9a..d4d271dff055462d 100644
--- a/drivers/pinctrl/renesas/pfc-r8a77951.c
+++ b/drivers/pinctrl/renesas/pfc-r8a77951.c
@@ -5139,23 +5139,11 @@ static const struct {
 static const struct pinmux_cfg_reg pinmux_config_regs[] = {
 #define F_(x, y)	FN_##y
 #define FM(x)		FN_##x
-	{ PINMUX_CFG_REG("GPSR0", 0xe6060100, 32, 1, GROUP(
-		0, 0,
-		0, 0,
-		0, 0,
-		0, 0,
-		0, 0,
-		0, 0,
-		0, 0,
-		0, 0,
-		0, 0,
-		0, 0,
-		0, 0,
-		0, 0,
-		0, 0,
-		0, 0,
-		0, 0,
-		0, 0,
+	{ PINMUX_CFG_REG_VAR("GPSR0", 0xe6060100, 32,
+			     GROUP(-16, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1,
+				   1, 1, 1, 1, 1),
+			     GROUP(
+		/* GP0_31_16 RESERVED */
 		GP_0_15_FN,	GPSR0_15,
 		GP_0_14_FN,	GPSR0_14,
 		GP_0_13_FN,	GPSR0_13,
@@ -5207,24 +5195,11 @@ static const struct pinmux_cfg_reg pinmux_config_regs[] = {
 		GP_1_1_FN,	GPSR1_1,
 		GP_1_0_FN,	GPSR1_0, ))
 	},
-	{ PINMUX_CFG_REG("GPSR2", 0xe6060108, 32, 1, GROUP(
-		0, 0,
-		0, 0,
-		0, 0,
-		0, 0,
-		0, 0,
-		0, 0,
-		0, 0,
-		0, 0,
-		0, 0,
-		0, 0,
-		0, 0,
-		0, 0,
-		0, 0,
-		0, 0,
-		0, 0,
-		0, 0,
-		0, 0,
+	{ PINMUX_CFG_REG_VAR("GPSR2", 0xe6060108, 32,
+			     GROUP(-17, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1,
+				   1, 1, 1, 1),
+			     GROUP(
+		/* GP2_31_15 RESERVED */
 		GP_2_14_FN,	GPSR2_14,
 		GP_2_13_FN,	GPSR2_13,
 		GP_2_12_FN,	GPSR2_12,
@@ -5241,23 +5216,11 @@ static const struct pinmux_cfg_reg pinmux_config_regs[] = {
 		GP_2_1_FN,	GPSR2_1,
 		GP_2_0_FN,	GPSR2_0, ))
 	},
-	{ PINMUX_CFG_REG("GPSR3", 0xe606010c, 32, 1, GROUP(
-		0, 0,
-		0, 0,
-		0, 0,
-		0, 0,
-		0, 0,
-		0, 0,
-		0, 0,
-		0, 0,
-		0, 0,
-		0, 0,
-		0, 0,
-		0, 0,
-		0, 0,
-		0, 0,
-		0, 0,
-		0, 0,
+	{ PINMUX_CFG_REG_VAR("GPSR3", 0xe606010c, 32,
+			     GROUP(-16, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1,
+				   1, 1, 1, 1, 1),
+			     GROUP(
+		/* GP3_31_16 RESERVED */
 		GP_3_15_FN,	GPSR3_15,
 		GP_3_14_FN,	GPSR3_14,
 		GP_3_13_FN,	GPSR3_13,
@@ -5275,21 +5238,11 @@ static const struct pinmux_cfg_reg pinmux_config_regs[] = {
 		GP_3_1_FN,	GPSR3_1,
 		GP_3_0_FN,	GPSR3_0, ))
 	},
-	{ PINMUX_CFG_REG("GPSR4", 0xe6060110, 32, 1, GROUP(
-		0, 0,
-		0, 0,
-		0, 0,
-		0, 0,
-		0, 0,
-		0, 0,
-		0, 0,
-		0, 0,
-		0, 0,
-		0, 0,
-		0, 0,
-		0, 0,
-		0, 0,
-		0, 0,
+	{ PINMUX_CFG_REG_VAR("GPSR4", 0xe6060110, 32,
+			     GROUP(-14, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1,
+				   1, 1, 1, 1, 1, 1, 1),
+			     GROUP(
+		/* GP4_31_18 RESERVED */
 		GP_4_17_FN,	GPSR4_17,
 		GP_4_16_FN,	GPSR4_16,
 		GP_4_15_FN,	GPSR4_15,
@@ -5377,35 +5330,10 @@ static const struct pinmux_cfg_reg pinmux_config_regs[] = {
 		GP_6_1_FN,	GPSR6_1,
 		GP_6_0_FN,	GPSR6_0, ))
 	},
-	{ PINMUX_CFG_REG("GPSR7", 0xe606011c, 32, 1, GROUP(
-		0, 0,
-		0, 0,
-		0, 0,
-		0, 0,
-		0, 0,
-		0, 0,
-		0, 0,
-		0, 0,
-		0, 0,
-		0, 0,
-		0, 0,
-		0, 0,
-		0, 0,
-		0, 0,
-		0, 0,
-		0, 0,
-		0, 0,
-		0, 0,
-		0, 0,
-		0, 0,
-		0, 0,
-		0, 0,
-		0, 0,
-		0, 0,
-		0, 0,
-		0, 0,
-		0, 0,
-		0, 0,
+	{ PINMUX_CFG_REG_VAR("GPSR7", 0xe606011c, 32,
+			     GROUP(-28, 1, 1, 1, 1),
+			     GROUP(
+		/* GP7_31_4 RESERVED */
 		GP_7_3_FN, GPSR7_3,
 		GP_7_2_FN, GPSR7_2,
 		GP_7_1_FN, GPSR7_1,
@@ -5486,12 +5414,14 @@ static const struct pinmux_cfg_reg pinmux_config_regs[] = {
 		IP6_7_4
 		IP6_3_0 ))
 	},
-	{ PINMUX_CFG_REG("IPSR7", 0xe606021c, 32, 4, GROUP(
+	{ PINMUX_CFG_REG_VAR("IPSR7", 0xe606021c, 32,
+			     GROUP(4, 4, 4, 4, -4, 4, 4, 4),
+			     GROUP(
 		IP7_31_28
 		IP7_27_24
 		IP7_23_20
 		IP7_19_16
-		/* IP7_15_12 */ 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
+		/* IP7_15_12 RESERVED */
 		IP7_11_8
 		IP7_7_4
 		IP7_3_0 ))
@@ -5596,13 +5526,10 @@ static const struct pinmux_cfg_reg pinmux_config_regs[] = {
 		IP17_7_4
 		IP17_3_0 ))
 	},
-	{ PINMUX_CFG_REG("IPSR18", 0xe6060248, 32, 4, GROUP(
-		/* IP18_31_28 */ 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
-		/* IP18_27_24 */ 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
-		/* IP18_23_20 */ 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
-		/* IP18_19_16 */ 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
-		/* IP18_15_12 */ 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
-		/* IP18_11_8  */ 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
+	{ PINMUX_CFG_REG_VAR("IPSR18", 0xe6060248, 32,
+			     GROUP(-24, 4, 4),
+			     GROUP(
+		/* IP18_31_8 RESERVED */
 		IP18_7_4
 		IP18_3_0 ))
 	},
-- 
2.25.1

