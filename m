Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0593D332468
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  9 Mar 2021 12:50:36 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229815AbhCILuD (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 9 Mar 2021 06:50:03 -0500
Received: from vsp-unauthed02.binero.net ([195.74.38.227]:12859 "EHLO
        vsp-unauthed02.binero.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230075AbhCILty (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 9 Mar 2021 06:49:54 -0500
X-Halon-ID: 8f5981ca-80cd-11eb-a076-005056917f90
Authorized-sender: niklas.soderlund@fsdn.se
Received: from bismarck.berto.se (p54ac5521.dip0.t-ipconnect.de [84.172.85.33])
        by bin-vsp-out-02.atm.binero.net (Halon) with ESMTPA
        id 8f5981ca-80cd-11eb-a076-005056917f90;
        Tue, 09 Mar 2021 12:49:53 +0100 (CET)
From:   =?UTF-8?q?Niklas=20S=C3=B6derlund?= 
        <niklas.soderlund+renesas@ragnatech.se>
To:     Geert Uytterhoeven <geert@linux-m68k.org>
Cc:     linux-renesas-soc@vger.kernel.org,
        =?UTF-8?q?Niklas=20S=C3=B6derlund?= 
        <niklas.soderlund+renesas@ragnatech.se>,
        Jacopo Mondi <jacopo+renesas@jmondi.org>
Subject: [PATCH v3 3/4] pinctrl: renesas: r8a77990: Add vin4_g8 and vin5_high8 pins
Date:   Tue,  9 Mar 2021 12:49:29 +0100
Message-Id: <20210309114930.2433711-4-niklas.soderlund+renesas@ragnatech.se>
X-Mailer: git-send-email 2.30.1
In-Reply-To: <20210309114930.2433711-1-niklas.soderlund+renesas@ragnatech.se>
References: <20210309114930.2433711-1-niklas.soderlund+renesas@ragnatech.se>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

This patch adds vin4_g8 and vin5_high8 support to the R8A77990 SoC.

Signed-off-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
Reviewed-by: Jacopo Mondi <jacopo+renesas@jmondi.org>
---
* Changes since v1
- Rename g8 to high8 per Geerts suggestion.
- Rebase to renesas-pinctrl.

* Changes since v2
- Keep the _g8 suffix for vin4.
---
 drivers/pinctrl/renesas/pfc-r8a77990.c | 34 +++++++++++++++++++++++++-
 1 file changed, 33 insertions(+), 1 deletion(-)

diff --git a/drivers/pinctrl/renesas/pfc-r8a77990.c b/drivers/pinctrl/renesas/pfc-r8a77990.c
index 0a32e3c317c1a0c5..a243aa8c525336f5 100644
--- a/drivers/pinctrl/renesas/pfc-r8a77990.c
+++ b/drivers/pinctrl/renesas/pfc-r8a77990.c
@@ -3697,6 +3697,20 @@ static const union vin_data vin4_data_b_mux = {
 	},
 };
 
+static const unsigned int vin4_g8_pins[] = {
+	RCAR_GP_PIN(1, 4),  RCAR_GP_PIN(1, 5),
+	RCAR_GP_PIN(1, 6),  RCAR_GP_PIN(1, 7),
+	RCAR_GP_PIN(1, 3),  RCAR_GP_PIN(1, 10),
+	RCAR_GP_PIN(1, 13), RCAR_GP_PIN(1, 14),
+};
+
+static const unsigned int vin4_g8_mux[] = {
+	VI4_DATA8_MARK,  VI4_DATA9_MARK,
+	VI4_DATA10_MARK, VI4_DATA11_MARK,
+	VI4_DATA12_MARK, VI4_DATA13_MARK,
+	VI4_DATA14_MARK, VI4_DATA15_MARK,
+};
+
 static const unsigned int vin4_sync_pins[] = {
 	/* HSYNC, VSYNC */
 	RCAR_GP_PIN(2, 25), RCAR_GP_PIN(2, 24),
@@ -3771,6 +3785,20 @@ static const unsigned int vin5_data8_b_mux[] = {
 	VI5_DATA6_B_MARK,  VI5_DATA7_B_MARK,
 };
 
+static const unsigned int vin5_high8_pins[] = {
+	RCAR_GP_PIN(0, 12), RCAR_GP_PIN(0, 13),
+	RCAR_GP_PIN(0, 9),  RCAR_GP_PIN(0, 11),
+	RCAR_GP_PIN(0, 8),  RCAR_GP_PIN(0, 10),
+	RCAR_GP_PIN(0, 2),  RCAR_GP_PIN(0, 3),
+};
+
+static const unsigned int vin5_high8_mux[] = {
+	VI5_DATA8_A_MARK,  VI5_DATA9_A_MARK,
+	VI5_DATA10_A_MARK, VI5_DATA11_A_MARK,
+	VI5_DATA12_A_MARK, VI5_DATA13_A_MARK,
+	VI5_DATA14_A_MARK, VI5_DATA15_A_MARK,
+};
+
 static const unsigned int vin5_sync_a_pins[] = {
 	/* HSYNC_N, VSYNC_N */
 	RCAR_GP_PIN(1, 8), RCAR_GP_PIN(1, 9),
@@ -3813,7 +3841,7 @@ static const unsigned int vin5_clk_b_mux[] = {
 };
 
 static const struct {
-	struct sh_pfc_pin_group common[253];
+	struct sh_pfc_pin_group common[255];
 #ifdef CONFIG_PINCTRL_PFC_R8A77990
 	struct sh_pfc_pin_group automotive[21];
 #endif
@@ -4058,6 +4086,7 @@ static const struct {
 		SH_PFC_PIN_GROUP(vin4_data18_b),
 		VIN_DATA_PIN_GROUP(vin4_data, 20, _b),
 		VIN_DATA_PIN_GROUP(vin4_data, 24, _b),
+		SH_PFC_PIN_GROUP(vin4_g8),
 		SH_PFC_PIN_GROUP(vin4_sync),
 		SH_PFC_PIN_GROUP(vin4_field),
 		SH_PFC_PIN_GROUP(vin4_clkenb),
@@ -4067,6 +4096,7 @@ static const struct {
 		VIN_DATA_PIN_GROUP(vin5_data, 12, _a),
 		VIN_DATA_PIN_GROUP(vin5_data, 16, _a),
 		SH_PFC_PIN_GROUP(vin5_data8_b),
+		SH_PFC_PIN_GROUP(vin5_high8),
 		SH_PFC_PIN_GROUP(vin5_sync_a),
 		SH_PFC_PIN_GROUP(vin5_field_a),
 		SH_PFC_PIN_GROUP(vin5_clkenb_a),
@@ -4516,6 +4546,7 @@ static const char * const vin4_groups[] = {
 	"vin4_data18_b",
 	"vin4_data20_b",
 	"vin4_data24_b",
+	"vin4_g8",
 	"vin4_sync",
 	"vin4_field",
 	"vin4_clkenb",
@@ -4528,6 +4559,7 @@ static const char * const vin5_groups[] = {
 	"vin5_data12_a",
 	"vin5_data16_a",
 	"vin5_data8_b",
+	"vin5_high8",
 	"vin5_sync_a",
 	"vin5_field_a",
 	"vin5_clkenb_a",
-- 
2.30.1

