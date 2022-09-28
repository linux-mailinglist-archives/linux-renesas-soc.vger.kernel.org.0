Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id AC45A5EDCE0
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 28 Sep 2022 14:36:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233839AbiI1MgP (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 28 Sep 2022 08:36:15 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52066 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234040AbiI1Mf4 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 28 Sep 2022 08:35:56 -0400
Received: from xavier.telenet-ops.be (xavier.telenet-ops.be [IPv6:2a02:1800:120:4::f00:14])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 25CC4E5C
        for <linux-renesas-soc@vger.kernel.org>; Wed, 28 Sep 2022 05:35:24 -0700 (PDT)
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed50:5556:1b6:16f5:2874])
        by xavier.telenet-ops.be with bizsmtp
        id RQb42800H40fT9J01Qb467; Wed, 28 Sep 2022 14:35:06 +0200
Received: from rox.of.borg ([192.168.97.57])
        by ramsan.of.borg with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
        (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1odWHI-0006kg-4P; Wed, 28 Sep 2022 14:35:04 +0200
Received: from geert by rox.of.borg with local (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1odWHH-0031i6-Ea; Wed, 28 Sep 2022 14:35:03 +0200
From:   Geert Uytterhoeven <geert+renesas@glider.be>
To:     linux-renesas-soc@vger.kernel.org
Cc:     Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH/RFC] pinctrl: renesas: r8a779g0: Add INTC-EX pins, groups, and function
Date:   Wed, 28 Sep 2022 14:35:02 +0200
Message-Id: <28fe05d41bea5a03ea6c8434f5a4fb6c80b48867.1664368425.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.3 required=5.0 tests=BAYES_00,
        HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_LOW,SPF_HELO_NONE,SPF_NONE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Add pins, groups, and function for the Interrupt Controller for External
Devices (INTC-EX) on the Renesas R-Car V4H (R8A779G0) SoC.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
The naming of alternate pins is inconsistent, but it does match the
current documentation (R-Car V4H rev. 0.51), e.g.:
  - IRQ0 and IRQ0_A,
  - IRQ3 and IRQ3_B,
  - IRQ4_A and IRQ4_B.
Perhaps this has been improved in a later revision?
---
 drivers/pinctrl/renesas/pfc-r8a779g0.c | 113 +++++++++++++++++++++++++
 1 file changed, 113 insertions(+)

diff --git a/drivers/pinctrl/renesas/pfc-r8a779g0.c b/drivers/pinctrl/renesas/pfc-r8a779g0.c
index 5dd1c2c7708a802b..24ea8e7f95eac915 100644
--- a/drivers/pinctrl/renesas/pfc-r8a779g0.c
+++ b/drivers/pinctrl/renesas/pfc-r8a779g0.c
@@ -1712,6 +1712,90 @@ static const unsigned int i2c5_mux[] = {
 	SDA5_MARK, SCL5_MARK,
 };
 
+/* - INTC-EX ---------------------------------------------------------------- */
+static const unsigned int intc_ex_irq0_pins[] = {
+	/* IRQ0 */
+	RCAR_GP_PIN(0, 6),
+};
+static const unsigned int intc_ex_irq0_mux[] = {
+	IRQ0_MARK,
+};
+static const unsigned int intc_ex_irq0_a_pins[] = {
+	/* IRQ0 */
+	RCAR_GP_PIN(1, 20),
+};
+static const unsigned int intc_ex_irq0_a_mux[] = {
+	IRQ0_A_MARK,
+};
+
+static const unsigned int intc_ex_irq1_pins[] = {
+	/* IRQ1 */
+	RCAR_GP_PIN(0, 5),
+};
+static const unsigned int intc_ex_irq1_mux[] = {
+	IRQ1_MARK,
+};
+static const unsigned int intc_ex_irq1_a_pins[] = {
+	/* IRQ1_A */
+	RCAR_GP_PIN(1, 21),
+};
+static const unsigned int intc_ex_irq1_a_mux[] = {
+	IRQ1_A_MARK,
+};
+
+static const unsigned int intc_ex_irq2_pins[] = {
+	/* IRQ2 */
+	RCAR_GP_PIN(0, 4),
+};
+static const unsigned int intc_ex_irq2_mux[] = {
+	IRQ2_MARK,
+};
+static const unsigned int intc_ex_irq2_a_pins[] = {
+	/* IRQ2_A */
+	RCAR_GP_PIN(0, 13),
+};
+static const unsigned int intc_ex_irq2_a_mux[] = {
+	IRQ2_A_MARK,
+};
+
+static const unsigned int intc_ex_irq3_pins[] = {
+	/* IRQ3 */
+	RCAR_GP_PIN(0, 3),
+};
+static const unsigned int intc_ex_irq3_mux[] = {
+	IRQ3_MARK,
+};
+static const unsigned int intc_ex_irq3_b_pins[] = {
+	/* IRQ3_B */
+	RCAR_GP_PIN(1, 23),
+};
+static const unsigned int intc_ex_irq3_b_mux[] = {
+	IRQ3_B_MARK,
+};
+
+static const unsigned int intc_ex_irq4_a_pins[] = {
+	/* IRQ4_A */
+	RCAR_GP_PIN(1, 17),
+};
+static const unsigned int intc_ex_irq4_a_mux[] = {
+	IRQ4_A_MARK,
+};
+static const unsigned int intc_ex_irq4_b_pins[] = {
+	/* IRQ4_B */
+	RCAR_GP_PIN(2, 3),
+};
+static const unsigned int intc_ex_irq4_b_mux[] = {
+	IRQ4_B_MARK,
+};
+
+static const unsigned int intc_ex_irq5_pins[] = {
+	/* IRQ5 */
+	RCAR_GP_PIN(2, 2),
+};
+static const unsigned int intc_ex_irq5_mux[] = {
+	IRQ5_MARK,
+};
+
 /* - MMC -------------------------------------------------------------------- */
 static const unsigned int mmc_data_pins[] = {
 	/* MMC_SD_D[0:3], MMC_D[4:7] */
@@ -2528,6 +2612,18 @@ static const struct sh_pfc_pin_group pinmux_groups[] = {
 	SH_PFC_PIN_GROUP(i2c4),
 	SH_PFC_PIN_GROUP(i2c5),
 
+	SH_PFC_PIN_GROUP(intc_ex_irq0),		/* suffix might be updated */
+	SH_PFC_PIN_GROUP(intc_ex_irq0_a),	/* suffix might be updated */
+	SH_PFC_PIN_GROUP(intc_ex_irq1),		/* suffix might be updated */
+	SH_PFC_PIN_GROUP(intc_ex_irq1_a),	/* suffix might be updated */
+	SH_PFC_PIN_GROUP(intc_ex_irq2),		/* suffix might be updated */
+	SH_PFC_PIN_GROUP(intc_ex_irq2_a),	/* suffix might be updated */
+	SH_PFC_PIN_GROUP(intc_ex_irq3),		/* suffix might be updated */
+	SH_PFC_PIN_GROUP(intc_ex_irq3_b),	/* suffix might be updated */
+	SH_PFC_PIN_GROUP(intc_ex_irq4_a),	/* suffix might be updated */
+	SH_PFC_PIN_GROUP(intc_ex_irq4_b),	/* suffix might be updated */
+	SH_PFC_PIN_GROUP(intc_ex_irq5),
+
 	BUS_DATA_PIN_GROUP(mmc_data, 1),
 	BUS_DATA_PIN_GROUP(mmc_data, 4),
 	BUS_DATA_PIN_GROUP(mmc_data, 8),
@@ -2770,6 +2866,21 @@ static const char * const i2c5_groups[] = {
 	"i2c5",
 };
 
+static const char * const intc_ex_groups[] = {
+	/* suffix might be updated */
+	"intc_ex_irq0",
+	"intc_ex_irq0_a",
+	"intc_ex_irq1",
+	"intc_ex_irq1_a",
+	"intc_ex_irq2",
+	"intc_ex_irq2_a",
+	"intc_ex_irq3",
+	"intc_ex_irq3_b",
+	"intc_ex_irq4_a",
+	"intc_ex_irq4_b",
+	"intc_ex_irq5",
+};
+
 static const char * const mmc_groups[] = {
 	"mmc_data1",
 	"mmc_data4",
@@ -2983,6 +3094,8 @@ static const struct sh_pfc_function pinmux_functions[] = {
 	SH_PFC_FUNCTION(i2c4),
 	SH_PFC_FUNCTION(i2c5),
 
+	SH_PFC_FUNCTION(intc_ex),
+
 	SH_PFC_FUNCTION(mmc),
 
 	SH_PFC_FUNCTION(msiof0),
-- 
2.25.1

