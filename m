Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 76D47332469
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  9 Mar 2021 12:50:36 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229837AbhCILuD (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 9 Mar 2021 06:50:03 -0500
Received: from bin-mail-out-05.binero.net ([195.74.38.228]:12841 "EHLO
        bin-mail-out-05.binero.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S229815AbhCILtw (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 9 Mar 2021 06:49:52 -0500
X-Halon-ID: 8e421378-80cd-11eb-a076-005056917f90
Authorized-sender: niklas.soderlund@fsdn.se
Received: from bismarck.berto.se (p54ac5521.dip0.t-ipconnect.de [84.172.85.33])
        by bin-vsp-out-02.atm.binero.net (Halon) with ESMTPA
        id 8e421378-80cd-11eb-a076-005056917f90;
        Tue, 09 Mar 2021 12:49:51 +0100 (CET)
From:   =?UTF-8?q?Niklas=20S=C3=B6derlund?= 
        <niklas.soderlund+renesas@ragnatech.se>
To:     Geert Uytterhoeven <geert@linux-m68k.org>
Cc:     linux-renesas-soc@vger.kernel.org,
        =?UTF-8?q?Niklas=20S=C3=B6derlund?= 
        <niklas.soderlund+renesas@ragnatech.se>,
        Jacopo Mondi <jacopo+renesas@jmondi.org>
Subject: [PATCH v3 1/4] pinctrl: renesas: r8a77951: Add vin4_g8 and vin5_high8 pins
Date:   Tue,  9 Mar 2021 12:49:27 +0100
Message-Id: <20210309114930.2433711-2-niklas.soderlund+renesas@ragnatech.se>
X-Mailer: git-send-email 2.30.1
In-Reply-To: <20210309114930.2433711-1-niklas.soderlund+renesas@ragnatech.se>
References: <20210309114930.2433711-1-niklas.soderlund+renesas@ragnatech.se>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

This patch adds vin4_g8 and vin5_high8 support to the R8A77951 SoC.

Signed-off-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
Reviewed-by: Jacopo Mondi <jacopo+renesas@jmondi.org>
---
* Changes since v1
- Rename g8 to high8 per Geerts suggestion.
- Rebase to renesas-pinctrl.

* Changes since v2
- Keep the _g8 suffix for vin4.
---
 drivers/pinctrl/renesas/pfc-r8a77951.c | 30 +++++++++++++++++++++++++-
 1 file changed, 29 insertions(+), 1 deletion(-)

diff --git a/drivers/pinctrl/renesas/pfc-r8a77951.c b/drivers/pinctrl/renesas/pfc-r8a77951.c
index bdd605e41303bf3a..6f3a1625d7890dff 100644
--- a/drivers/pinctrl/renesas/pfc-r8a77951.c
+++ b/drivers/pinctrl/renesas/pfc-r8a77951.c
@@ -4126,6 +4126,18 @@ static const union vin_data vin4_data_b_mux = {
 		VI4_DATA22_MARK, VI4_DATA23_MARK,
 	},
 };
+static const unsigned int vin4_g8_pins[] = {
+	RCAR_GP_PIN(1, 0),  RCAR_GP_PIN(1, 1),
+	RCAR_GP_PIN(1, 2),  RCAR_GP_PIN(1, 3),
+	RCAR_GP_PIN(1, 4),  RCAR_GP_PIN(1, 5),
+	RCAR_GP_PIN(1, 6),  RCAR_GP_PIN(1, 7),
+};
+static const unsigned int vin4_g8_mux[] = {
+	VI4_DATA8_MARK,  VI4_DATA9_MARK,
+	VI4_DATA10_MARK, VI4_DATA11_MARK,
+	VI4_DATA12_MARK, VI4_DATA13_MARK,
+	VI4_DATA14_MARK, VI4_DATA15_MARK,
+};
 static const unsigned int vin4_sync_pins[] = {
 	/* HSYNC#, VSYNC# */
 	RCAR_GP_PIN(1, 18), RCAR_GP_PIN(1, 17),
@@ -4180,6 +4192,18 @@ static const union vin_data16 vin5_data_mux = {
 		VI5_DATA14_MARK, VI5_DATA15_MARK,
 	},
 };
+static const unsigned int vin5_high8_pins[] = {
+	RCAR_GP_PIN(1, 12), RCAR_GP_PIN(1, 13),
+	RCAR_GP_PIN(1, 14), RCAR_GP_PIN(1, 15),
+	RCAR_GP_PIN(1, 4),  RCAR_GP_PIN(1, 5),
+	RCAR_GP_PIN(1, 6),  RCAR_GP_PIN(1, 7),
+};
+static const unsigned int vin5_high8_mux[] = {
+	VI5_DATA8_MARK,  VI5_DATA9_MARK,
+	VI5_DATA10_MARK, VI5_DATA11_MARK,
+	VI5_DATA12_MARK, VI5_DATA13_MARK,
+	VI5_DATA14_MARK, VI5_DATA15_MARK,
+};
 static const unsigned int vin5_sync_pins[] = {
 	/* HSYNC#, VSYNC# */
 	RCAR_GP_PIN(1, 10), RCAR_GP_PIN(1, 9),
@@ -4210,7 +4234,7 @@ static const unsigned int vin5_clk_mux[] = {
 };
 
 static const struct {
-	struct sh_pfc_pin_group common[326];
+	struct sh_pfc_pin_group common[328];
 #ifdef CONFIG_PINCTRL_PFC_R8A77951
 	struct sh_pfc_pin_group automotive[30];
 #endif
@@ -4530,6 +4554,7 @@ static const struct {
 		SH_PFC_PIN_GROUP(vin4_data18_b),
 		VIN_DATA_PIN_GROUP(vin4_data, 20, _b),
 		VIN_DATA_PIN_GROUP(vin4_data, 24, _b),
+		SH_PFC_PIN_GROUP(vin4_g8),
 		SH_PFC_PIN_GROUP(vin4_sync),
 		SH_PFC_PIN_GROUP(vin4_field),
 		SH_PFC_PIN_GROUP(vin4_clkenb),
@@ -4538,6 +4563,7 @@ static const struct {
 		VIN_DATA_PIN_GROUP(vin5_data, 10),
 		VIN_DATA_PIN_GROUP(vin5_data, 12),
 		VIN_DATA_PIN_GROUP(vin5_data, 16),
+		SH_PFC_PIN_GROUP(vin5_high8),
 		SH_PFC_PIN_GROUP(vin5_sync),
 		SH_PFC_PIN_GROUP(vin5_field),
 		SH_PFC_PIN_GROUP(vin5_clkenb),
@@ -5097,6 +5123,7 @@ static const char * const vin4_groups[] = {
 	"vin4_data18_b",
 	"vin4_data20_b",
 	"vin4_data24_b",
+	"vin4_g8",
 	"vin4_sync",
 	"vin4_field",
 	"vin4_clkenb",
@@ -5108,6 +5135,7 @@ static const char * const vin5_groups[] = {
 	"vin5_data10",
 	"vin5_data12",
 	"vin5_data16",
+	"vin5_high8",
 	"vin5_sync",
 	"vin5_field",
 	"vin5_clkenb",
-- 
2.30.1

