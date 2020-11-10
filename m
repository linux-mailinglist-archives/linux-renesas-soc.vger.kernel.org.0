Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B67BE2AE45C
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 11 Nov 2020 00:48:31 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726706AbgKJXsb (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 10 Nov 2020 18:48:31 -0500
Received: from bin-mail-out-05.binero.net ([195.74.38.228]:16215 "EHLO
        bin-mail-out-05.binero.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1731657AbgKJXsb (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 10 Nov 2020 18:48:31 -0500
X-Halon-ID: 3aef1ded-23af-11eb-954c-0050569116f7
Authorized-sender: niklas.soderlund@fsdn.se
Received: from bismarck.berto.se (p4fca2458.dip0.t-ipconnect.de [79.202.36.88])
        by bin-vsp-out-03.atm.binero.net (Halon) with ESMTPA
        id 3aef1ded-23af-11eb-954c-0050569116f7;
        Wed, 11 Nov 2020 00:48:28 +0100 (CET)
From:   =?UTF-8?q?Niklas=20S=C3=B6derlund?= 
        <niklas.soderlund+renesas@ragnatech.se>
To:     Geert Uytterhoeven <geert@linux-m68k.org>
Cc:     linux-renesas-soc@vger.kernel.org,
        =?UTF-8?q?Niklas=20S=C3=B6derlund?= 
        <niklas.soderlund+renesas@ragnatech.se>
Subject: [PATCH 1/4] pinctrl: renesas: r8a77951: Add vin{4,5}_g8 pins
Date:   Wed, 11 Nov 2020 00:47:49 +0100
Message-Id: <20201110234752.52846-2-niklas.soderlund+renesas@ragnatech.se>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20201110234752.52846-1-niklas.soderlund+renesas@ragnatech.se>
References: <20201110234752.52846-1-niklas.soderlund+renesas@ragnatech.se>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

This patch adds VIN{4,5}_g8 support to the R8A77951 SoC.

Signed-off-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
---
 drivers/pinctrl/renesas/pfc-r8a77951.c | 30 +++++++++++++++++++++++++-
 1 file changed, 29 insertions(+), 1 deletion(-)

diff --git a/drivers/pinctrl/renesas/pfc-r8a77951.c b/drivers/pinctrl/renesas/pfc-r8a77951.c
index a94ebe0bf5d06127..21864223c880b3ec 100644
--- a/drivers/pinctrl/renesas/pfc-r8a77951.c
+++ b/drivers/pinctrl/renesas/pfc-r8a77951.c
@@ -4074,6 +4074,18 @@ static const union vin_data vin4_data_b_mux = {
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
@@ -4128,6 +4140,18 @@ static const union vin_data16 vin5_data_mux = {
 		VI5_DATA14_MARK, VI5_DATA15_MARK,
 	},
 };
+static const unsigned int vin5_g8_pins[] = {
+	RCAR_GP_PIN(1, 12), RCAR_GP_PIN(1, 13),
+	RCAR_GP_PIN(1, 14), RCAR_GP_PIN(1, 15),
+	RCAR_GP_PIN(1, 4),  RCAR_GP_PIN(1, 5),
+	RCAR_GP_PIN(1, 6),  RCAR_GP_PIN(1, 7),
+};
+static const unsigned int vin5_g8_mux[] = {
+	VI5_DATA8_MARK,  VI5_DATA9_MARK,
+	VI5_DATA10_MARK, VI5_DATA11_MARK,
+	VI5_DATA12_MARK, VI5_DATA13_MARK,
+	VI5_DATA14_MARK, VI5_DATA15_MARK,
+};
 static const unsigned int vin5_sync_pins[] = {
 	/* HSYNC#, VSYNC# */
 	RCAR_GP_PIN(1, 10), RCAR_GP_PIN(1, 9),
@@ -4158,7 +4182,7 @@ static const unsigned int vin5_clk_mux[] = {
 };
 
 static const struct {
-	struct sh_pfc_pin_group common[320];
+	struct sh_pfc_pin_group common[322];
 	struct sh_pfc_pin_group automotive[30];
 } pinmux_groups = {
 	.common = {
@@ -4470,6 +4494,7 @@ static const struct {
 		SH_PFC_PIN_GROUP(vin4_data18_b),
 		VIN_DATA_PIN_GROUP(vin4_data, 20, _b),
 		VIN_DATA_PIN_GROUP(vin4_data, 24, _b),
+		SH_PFC_PIN_GROUP(vin4_g8),
 		SH_PFC_PIN_GROUP(vin4_sync),
 		SH_PFC_PIN_GROUP(vin4_field),
 		SH_PFC_PIN_GROUP(vin4_clkenb),
@@ -4478,6 +4503,7 @@ static const struct {
 		VIN_DATA_PIN_GROUP(vin5_data, 10),
 		VIN_DATA_PIN_GROUP(vin5_data, 12),
 		VIN_DATA_PIN_GROUP(vin5_data, 16),
+		SH_PFC_PIN_GROUP(vin5_g8),
 		SH_PFC_PIN_GROUP(vin5_sync),
 		SH_PFC_PIN_GROUP(vin5_field),
 		SH_PFC_PIN_GROUP(vin5_clkenb),
@@ -5022,6 +5048,7 @@ static const char * const vin4_groups[] = {
 	"vin4_data18_b",
 	"vin4_data20_b",
 	"vin4_data24_b",
+	"vin4_g8",
 	"vin4_sync",
 	"vin4_field",
 	"vin4_clkenb",
@@ -5033,6 +5060,7 @@ static const char * const vin5_groups[] = {
 	"vin5_data10",
 	"vin5_data12",
 	"vin5_data16",
+	"vin5_g8",
 	"vin5_sync",
 	"vin5_field",
 	"vin5_clkenb",
-- 
2.29.2

