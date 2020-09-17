Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5793B26E5F6
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 17 Sep 2020 21:59:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726234AbgIQT7b (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 17 Sep 2020 15:59:31 -0400
Received: from relmlor2.renesas.com ([210.160.252.172]:21940 "EHLO
        relmlie6.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1725874AbgIQT7b (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 17 Sep 2020 15:59:31 -0400
X-IronPort-AV: E=Sophos;i="5.77,271,1596466800"; 
   d="scan'208";a="57339497"
Received: from unknown (HELO relmlir5.idc.renesas.com) ([10.200.68.151])
  by relmlie6.idc.renesas.com with ESMTP; 18 Sep 2020 04:59:29 +0900
Received: from localhost.localdomain (unknown [10.226.36.204])
        by relmlir5.idc.renesas.com (Postfix) with ESMTP id 6FBFD4005E24;
        Fri, 18 Sep 2020 04:59:27 +0900 (JST)
From:   Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To:     Geert Uytterhoeven <geert+renesas@glider.be>,
        Linus Walleij <linus.walleij@linaro.org>,
        linux-renesas-soc@vger.kernel.org, linux-gpio@vger.kernel.org
Cc:     linux-kernel@vger.kernel.org,
        Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        Biju Das <biju.das.jz@bp.renesas.com>,
        "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Subject: [PATCH v3] pinctrl: renesas: r8a7790: Add VIN1-B and VIN2-G pins, groups and functions
Date:   Thu, 17 Sep 2020 20:59:24 +0100
Message-Id: <20200917195924.20384-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.17.1
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Add pins, groups and functions for the VIN1-B [data/sync/field/clkenb/clk]
and VIN2-G8.

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Reviewed-by: Biju Das <biju.das.jz@bp.renesas.com>
---
v2->v3:
* Included vin1_data4_b, field_b  and clkenb_b
* Renamed vin2_data8g to vin2_g8
* Rebased patch on latest changes

v1->v2:
* Added complete list of VIN1-B pins
* Renamed vin2_data8_g to vin2_data8g
* Sorted vin1_sync_b pins

v1 - https://patchwork.kernel.org/patch/11761191/
---
 drivers/pinctrl/renesas/pfc-r8a7790.c | 132 +++++++++++++++++++++++++-
 1 file changed, 131 insertions(+), 1 deletion(-)

diff --git a/drivers/pinctrl/renesas/pfc-r8a7790.c b/drivers/pinctrl/renesas/pfc-r8a7790.c
index 60f973c5dffe..3f48d3d879f7 100644
--- a/drivers/pinctrl/renesas/pfc-r8a7790.c
+++ b/drivers/pinctrl/renesas/pfc-r8a7790.c
@@ -3866,6 +3866,72 @@ static const unsigned int vin1_data18_mux[] = {
 	VI1_R4_MARK, VI1_R5_MARK,
 	VI1_R6_MARK, VI1_R7_MARK,
 };
+static const union vin_data vin1_data_b_pins = {
+	.data24 = {
+		/* B */
+		RCAR_GP_PIN(3, 0), RCAR_GP_PIN(3, 1),
+		RCAR_GP_PIN(3, 2), RCAR_GP_PIN(3, 3),
+		RCAR_GP_PIN(3, 4), RCAR_GP_PIN(3, 5),
+		RCAR_GP_PIN(3, 6), RCAR_GP_PIN(3, 7),
+		/* G */
+		RCAR_GP_PIN(1, 14), RCAR_GP_PIN(1, 15),
+		RCAR_GP_PIN(1, 17), RCAR_GP_PIN(1, 20),
+		RCAR_GP_PIN(1, 22), RCAR_GP_PIN(1, 12),
+		RCAR_GP_PIN(1, 9), RCAR_GP_PIN(1, 7),
+		/* R */
+		RCAR_GP_PIN(0, 27), RCAR_GP_PIN(0, 28),
+		RCAR_GP_PIN(0, 29), RCAR_GP_PIN(1, 4),
+		RCAR_GP_PIN(1, 5), RCAR_GP_PIN(1, 6),
+		RCAR_GP_PIN(1, 10), RCAR_GP_PIN(1, 8),
+	},
+};
+static const union vin_data vin1_data_b_mux = {
+	.data24 = {
+		/* B */
+		VI1_DATA0_VI1_B0_B_MARK, VI1_DATA1_VI1_B1_B_MARK,
+		VI1_DATA2_VI1_B2_B_MARK, VI1_DATA3_VI1_B3_B_MARK,
+		VI1_DATA4_VI1_B4_B_MARK, VI1_DATA5_VI1_B5_B_MARK,
+		VI1_DATA6_VI1_B6_B_MARK, VI1_DATA7_VI1_B7_B_MARK,
+		/* G */
+		VI1_G0_B_MARK, VI1_G1_B_MARK,
+		VI1_G2_B_MARK, VI1_G3_B_MARK,
+		VI1_G4_B_MARK, VI1_G5_B_MARK,
+		VI1_G6_B_MARK, VI1_G7_B_MARK,
+		/* R */
+		VI1_R0_B_MARK, VI1_R1_B_MARK,
+		VI1_R2_B_MARK, VI1_R3_B_MARK,
+		VI1_R4_B_MARK, VI1_R5_B_MARK,
+		VI1_R6_B_MARK, VI1_R7_B_MARK,
+	},
+};
+static const unsigned int vin1_data18_b_pins[] = {
+	/* B */
+	RCAR_GP_PIN(3, 2), RCAR_GP_PIN(3, 3),
+	RCAR_GP_PIN(3, 4), RCAR_GP_PIN(3, 5),
+	RCAR_GP_PIN(3, 6), RCAR_GP_PIN(3, 7),
+	/* G */
+	RCAR_GP_PIN(1, 17), RCAR_GP_PIN(1, 20),
+	RCAR_GP_PIN(1, 22), RCAR_GP_PIN(1, 12),
+	RCAR_GP_PIN(1, 9), RCAR_GP_PIN(1, 7),
+	/* R */
+	RCAR_GP_PIN(0, 29), RCAR_GP_PIN(1, 4),
+	RCAR_GP_PIN(1, 5), RCAR_GP_PIN(1, 6),
+	RCAR_GP_PIN(1, 10), RCAR_GP_PIN(1, 8),
+};
+static const unsigned int vin1_data18_b_mux[] = {
+	/* B */
+	VI1_DATA2_VI1_B2_B_MARK, VI1_DATA3_VI1_B3_B_MARK,
+	VI1_DATA4_VI1_B4_B_MARK, VI1_DATA5_VI1_B5_B_MARK,
+	VI1_DATA6_VI1_B6_B_MARK, VI1_DATA7_VI1_B7_B_MARK,
+	/* G */
+	VI1_G2_B_MARK, VI1_G3_B_MARK,
+	VI1_G4_B_MARK, VI1_G5_B_MARK,
+	VI1_G6_B_MARK, VI1_G7_B_MARK,
+	/* R */
+	VI1_R2_B_MARK, VI1_R3_B_MARK,
+	VI1_R4_B_MARK, VI1_R5_B_MARK,
+	VI1_R6_B_MARK, VI1_R7_B_MARK,
+};
 static const unsigned int vin1_sync_pins[] = {
 	RCAR_GP_PIN(1, 24), /* HSYNC */
 	RCAR_GP_PIN(1, 25), /* VSYNC */
@@ -3874,24 +3940,50 @@ static const unsigned int vin1_sync_mux[] = {
 	VI1_HSYNC_N_MARK,
 	VI1_VSYNC_N_MARK,
 };
+static const unsigned int vin1_sync_b_pins[] = {
+	RCAR_GP_PIN(1, 24), /* HSYNC */
+	RCAR_GP_PIN(1, 25), /* VSYNC */
+};
+static const unsigned int vin1_sync_b_mux[] = {
+	VI1_HSYNC_N_B_MARK,
+	VI1_VSYNC_N_B_MARK,
+};
 static const unsigned int vin1_field_pins[] = {
 	RCAR_GP_PIN(1, 13),
 };
 static const unsigned int vin1_field_mux[] = {
 	VI1_FIELD_MARK,
 };
+static const unsigned int vin1_field_b_pins[] = {
+	RCAR_GP_PIN(1, 13),
+};
+static const unsigned int vin1_field_b_mux[] = {
+	VI1_FIELD_B_MARK,
+};
 static const unsigned int vin1_clkenb_pins[] = {
 	RCAR_GP_PIN(1, 26),
 };
 static const unsigned int vin1_clkenb_mux[] = {
 	VI1_CLKENB_MARK,
 };
+static const unsigned int vin1_clkenb_b_pins[] = {
+	RCAR_GP_PIN(1, 26),
+};
+static const unsigned int vin1_clkenb_b_mux[] = {
+	VI1_CLKENB_B_MARK,
+};
 static const unsigned int vin1_clk_pins[] = {
 	RCAR_GP_PIN(2, 9),
 };
 static const unsigned int vin1_clk_mux[] = {
 	VI1_CLK_MARK,
 };
+static const unsigned int vin1_clk_b_pins[] = {
+	RCAR_GP_PIN(3, 15),
+};
+static const unsigned int vin1_clk_b_mux[] = {
+	VI1_CLK_B_MARK,
+};
 /* - VIN2 ----------------------------------------------------------------- */
 static const union vin_data vin2_data_pins = {
 	.data24 = {
@@ -3959,6 +4051,18 @@ static const unsigned int vin2_data18_mux[] = {
 	VI2_R4_MARK, VI2_R5_MARK,
 	VI2_R6_MARK, VI2_R7_MARK,
 };
+static const unsigned int vin2_g8_pins[] = {
+	RCAR_GP_PIN(0, 27), RCAR_GP_PIN(0, 28),
+	RCAR_GP_PIN(0, 29), RCAR_GP_PIN(1, 10),
+	RCAR_GP_PIN(1, 4), RCAR_GP_PIN(1, 5),
+	RCAR_GP_PIN(1, 6), RCAR_GP_PIN(1, 7),
+};
+static const unsigned int vin2_g8_mux[] = {
+	VI2_G0_MARK, VI2_G1_MARK,
+	VI2_G2_MARK, VI2_G3_MARK,
+	VI2_G4_MARK, VI2_G5_MARK,
+	VI2_G6_MARK, VI2_G7_MARK,
+};
 static const unsigned int vin2_sync_pins[] = {
 	RCAR_GP_PIN(1, 16), /* HSYNC */
 	RCAR_GP_PIN(1, 21), /* VSYNC */
@@ -4026,7 +4130,7 @@ static const unsigned int vin3_clk_mux[] = {
 };
 
 static const struct {
-	struct sh_pfc_pin_group common[298];
+	struct sh_pfc_pin_group common[311];
 	struct sh_pfc_pin_group automotive[1];
 } pinmux_groups = {
 	.common = {
@@ -4310,15 +4414,28 @@ static const struct {
 		VIN_DATA_PIN_GROUP(vin1_data, 10),
 		VIN_DATA_PIN_GROUP(vin1_data, 8),
 		VIN_DATA_PIN_GROUP(vin1_data, 4),
+		VIN_DATA_PIN_GROUP(vin1_data, 24, _b),
+		VIN_DATA_PIN_GROUP(vin1_data, 20, _b),
+		SH_PFC_PIN_GROUP(vin1_data18_b),
+		VIN_DATA_PIN_GROUP(vin1_data, 16, _b),
+		VIN_DATA_PIN_GROUP(vin1_data, 12, _b),
+		VIN_DATA_PIN_GROUP(vin1_data, 10, _b),
+		VIN_DATA_PIN_GROUP(vin1_data, 8, _b),
+		VIN_DATA_PIN_GROUP(vin1_data, 4, _b),
 		SH_PFC_PIN_GROUP(vin1_sync),
+		SH_PFC_PIN_GROUP(vin1_sync_b),
 		SH_PFC_PIN_GROUP(vin1_field),
+		SH_PFC_PIN_GROUP(vin1_field_b),
 		SH_PFC_PIN_GROUP(vin1_clkenb),
+		SH_PFC_PIN_GROUP(vin1_clkenb_b),
 		SH_PFC_PIN_GROUP(vin1_clk),
+		SH_PFC_PIN_GROUP(vin1_clk_b),
 		VIN_DATA_PIN_GROUP(vin2_data, 24),
 		SH_PFC_PIN_GROUP(vin2_data18),
 		VIN_DATA_PIN_GROUP(vin2_data, 16),
 		VIN_DATA_PIN_GROUP(vin2_data, 8),
 		VIN_DATA_PIN_GROUP(vin2_data, 4),
+		SH_PFC_PIN_GROUP(vin2_g8),
 		SH_PFC_PIN_GROUP(vin2_sync),
 		SH_PFC_PIN_GROUP(vin2_field),
 		SH_PFC_PIN_GROUP(vin2_clkenb),
@@ -4784,10 +4901,22 @@ static const char * const vin1_groups[] = {
 	"vin1_data10",
 	"vin1_data8",
 	"vin1_data4",
+	"vin1_data24_b",
+	"vin1_data20_b",
+	"vin1_data18_b",
+	"vin1_data16_b",
+	"vin1_data12_b",
+	"vin1_data10_b",
+	"vin1_data8_b",
+	"vin1_data4_b",
 	"vin1_sync",
+	"vin1_sync_b",
 	"vin1_field",
+	"vin1_field_b",
 	"vin1_clkenb",
+	"vin1_clkenb_b",
 	"vin1_clk",
+	"vin1_clk_b",
 };
 
 static const char * const vin2_groups[] = {
@@ -4796,6 +4925,7 @@ static const char * const vin2_groups[] = {
 	"vin2_data16",
 	"vin2_data8",
 	"vin2_data4",
+	"vin2_g8",
 	"vin2_sync",
 	"vin2_field",
 	"vin2_clkenb",
-- 
2.17.1

