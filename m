Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 421422AE45E
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 11 Nov 2020 00:48:36 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731996AbgKJXsf (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 10 Nov 2020 18:48:35 -0500
Received: from bin-mail-out-05.binero.net ([195.74.38.228]:37706 "EHLO
        bin-mail-out-05.binero.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1731610AbgKJXsf (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 10 Nov 2020 18:48:35 -0500
X-Halon-ID: 3bfc375a-23af-11eb-954c-0050569116f7
Authorized-sender: niklas.soderlund@fsdn.se
Received: from bismarck.berto.se (p4fca2458.dip0.t-ipconnect.de [79.202.36.88])
        by bin-vsp-out-03.atm.binero.net (Halon) with ESMTPA
        id 3bfc375a-23af-11eb-954c-0050569116f7;
        Wed, 11 Nov 2020 00:48:29 +0100 (CET)
From:   =?UTF-8?q?Niklas=20S=C3=B6derlund?= 
        <niklas.soderlund+renesas@ragnatech.se>
To:     Geert Uytterhoeven <geert@linux-m68k.org>
Cc:     linux-renesas-soc@vger.kernel.org,
        =?UTF-8?q?Niklas=20S=C3=B6derlund?= 
        <niklas.soderlund+renesas@ragnatech.se>
Subject: [PATCH 4/4] pinctrl: renesas: r8a77965: Add vin{4,5}_g8 pins
Date:   Wed, 11 Nov 2020 00:47:52 +0100
Message-Id: <20201110234752.52846-5-niklas.soderlund+renesas@ragnatech.se>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20201110234752.52846-1-niklas.soderlund+renesas@ragnatech.se>
References: <20201110234752.52846-1-niklas.soderlund+renesas@ragnatech.se>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

This patch adds VIN{4,5}_g8 support to the R8A77965 SoC.

Signed-off-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
---
 drivers/pinctrl/renesas/pfc-r8a77965.c | 34 +++++++++++++++++++++++++-
 1 file changed, 33 insertions(+), 1 deletion(-)

diff --git a/drivers/pinctrl/renesas/pfc-r8a77965.c b/drivers/pinctrl/renesas/pfc-r8a77965.c
index 7a50b9b69a7dc4e3..20198e3b50191665 100644
--- a/drivers/pinctrl/renesas/pfc-r8a77965.c
+++ b/drivers/pinctrl/renesas/pfc-r8a77965.c
@@ -4285,6 +4285,20 @@ static const union vin_data vin4_data_b_mux = {
 	},
 };
 
+static const unsigned int vin4_g8_pins[] = {
+	RCAR_GP_PIN(1, 0),  RCAR_GP_PIN(1, 1),
+	RCAR_GP_PIN(1, 2),  RCAR_GP_PIN(1, 3),
+	RCAR_GP_PIN(1, 4),  RCAR_GP_PIN(1, 5),
+	RCAR_GP_PIN(1, 6),  RCAR_GP_PIN(1, 7),
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
 	/* VSYNC_N, HSYNC_N */
 	RCAR_GP_PIN(1, 17), RCAR_GP_PIN(1, 18),
@@ -4345,6 +4359,20 @@ static const union vin_data16 vin5_data_mux = {
 	},
 };
 
+static const unsigned int vin5_g8_pins[] = {
+	RCAR_GP_PIN(1, 12), RCAR_GP_PIN(1, 13),
+	RCAR_GP_PIN(1, 14), RCAR_GP_PIN(1, 15),
+	RCAR_GP_PIN(1, 4),  RCAR_GP_PIN(1, 5),
+	RCAR_GP_PIN(1, 6),  RCAR_GP_PIN(1, 7),
+};
+
+static const unsigned int vin5_g8_mux[] = {
+	VI5_DATA8_MARK,  VI5_DATA9_MARK,
+	VI5_DATA10_MARK, VI5_DATA11_MARK,
+	VI5_DATA12_MARK, VI5_DATA13_MARK,
+	VI5_DATA14_MARK, VI5_DATA15_MARK,
+};
+
 static const unsigned int vin5_sync_pins[] = {
 	/* VSYNC_N, HSYNC_N */
 	RCAR_GP_PIN(1, 9), RCAR_GP_PIN(1, 10),
@@ -4379,7 +4407,7 @@ static const unsigned int vin5_clk_mux[] = {
 };
 
 static const struct {
-	struct sh_pfc_pin_group common[318];
+	struct sh_pfc_pin_group common[320];
 	struct sh_pfc_pin_group automotive[30];
 } pinmux_groups = {
 	.common = {
@@ -4689,6 +4717,7 @@ static const struct {
 		SH_PFC_PIN_GROUP(vin4_data18_b),
 		VIN_DATA_PIN_GROUP(vin4_data, 20, _b),
 		VIN_DATA_PIN_GROUP(vin4_data, 24, _b),
+		SH_PFC_PIN_GROUP(vin4_g8),
 		SH_PFC_PIN_GROUP(vin4_sync),
 		SH_PFC_PIN_GROUP(vin4_field),
 		SH_PFC_PIN_GROUP(vin4_clkenb),
@@ -4697,6 +4726,7 @@ static const struct {
 		VIN_DATA_PIN_GROUP(vin5_data, 10),
 		VIN_DATA_PIN_GROUP(vin5_data, 12),
 		VIN_DATA_PIN_GROUP(vin5_data, 16),
+		SH_PFC_PIN_GROUP(vin5_g8),
 		SH_PFC_PIN_GROUP(vin5_sync),
 		SH_PFC_PIN_GROUP(vin5_field),
 		SH_PFC_PIN_GROUP(vin5_clkenb),
@@ -5231,6 +5261,7 @@ static const char * const vin4_groups[] = {
 	"vin4_data18_b",
 	"vin4_data20_b",
 	"vin4_data24_b",
+	"vin4_g8",
 	"vin4_sync",
 	"vin4_field",
 	"vin4_clkenb",
@@ -5242,6 +5273,7 @@ static const char * const vin5_groups[] = {
 	"vin5_data10",
 	"vin5_data12",
 	"vin5_data16",
+	"vin5_g8",
 	"vin5_sync",
 	"vin5_field",
 	"vin5_clkenb",
-- 
2.29.2

