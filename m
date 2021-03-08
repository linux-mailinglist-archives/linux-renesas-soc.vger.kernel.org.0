Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CB5BB3312B7
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  8 Mar 2021 17:01:28 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229757AbhCHQA7 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 8 Mar 2021 11:00:59 -0500
Received: from vsp-unauthed02.binero.net ([195.74.38.227]:35180 "EHLO
        vsp-unauthed02.binero.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229813AbhCHQAh (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 8 Mar 2021 11:00:37 -0500
X-Halon-ID: 69a1a20f-8027-11eb-a542-005056917a89
Authorized-sender: niklas.soderlund@fsdn.se
Received: from bismarck.berto.se (p54ac5521.dip0.t-ipconnect.de [84.172.85.33])
        by bin-vsp-out-01.atm.binero.net (Halon) with ESMTPA
        id 69a1a20f-8027-11eb-a542-005056917a89;
        Mon, 08 Mar 2021 17:00:33 +0100 (CET)
From:   =?UTF-8?q?Niklas=20S=C3=B6derlund?= 
        <niklas.soderlund+renesas@ragnatech.se>
To:     Geert Uytterhoeven <geert@linux-m68k.org>
Cc:     linux-renesas-soc@vger.kernel.org,
        =?UTF-8?q?Niklas=20S=C3=B6derlund?= 
        <niklas.soderlund+renesas@ragnatech.se>,
        Jacopo Mondi <jacopo+renesas@jmondi.org>
Subject: [PATCH v2 3/4] pinctrl: renesas: r8a77990: Add vin{4,5}_high8 pins
Date:   Mon,  8 Mar 2021 16:59:41 +0100
Message-Id: <20210308155942.1733341-4-niklas.soderlund+renesas@ragnatech.se>
X-Mailer: git-send-email 2.30.1
In-Reply-To: <20210308155942.1733341-1-niklas.soderlund+renesas@ragnatech.se>
References: <20210308155942.1733341-1-niklas.soderlund+renesas@ragnatech.se>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

This patch adds VIN{4,5}_high8 support to the R8A77990 SoC.

Signed-off-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
Reviewed-by: Jacopo Mondi <jacopo+renesas@jmondi.org>
---
* Changes since v1
- Rename g8 to high8 per Geerts suggestion.
- Rebase to renesas-pinctrl.
---
 drivers/pinctrl/renesas/pfc-r8a77990.c | 34 +++++++++++++++++++++++++-
 1 file changed, 33 insertions(+), 1 deletion(-)

diff --git a/drivers/pinctrl/renesas/pfc-r8a77990.c b/drivers/pinctrl/renesas/pfc-r8a77990.c
index 0a32e3c317c1a0c5..479dd6e9ed540abb 100644
--- a/drivers/pinctrl/renesas/pfc-r8a77990.c
+++ b/drivers/pinctrl/renesas/pfc-r8a77990.c
@@ -3697,6 +3697,20 @@ static const union vin_data vin4_data_b_mux = {
 	},
 };
 
+static const unsigned int vin4_high8_pins[] = {
+	RCAR_GP_PIN(1, 4),  RCAR_GP_PIN(1, 5),
+	RCAR_GP_PIN(1, 6),  RCAR_GP_PIN(1, 7),
+	RCAR_GP_PIN(1, 3),  RCAR_GP_PIN(1, 10),
+	RCAR_GP_PIN(1, 13), RCAR_GP_PIN(1, 14),
+};
+
+static const unsigned int vin4_high8_mux[] = {
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
+		SH_PFC_PIN_GROUP(vin4_high8),
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
+	"vin4_high8",
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

