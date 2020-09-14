Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CFCD02699C8
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 15 Sep 2020 01:38:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725994AbgINXiu (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 14 Sep 2020 19:38:50 -0400
Received: from bin-mail-out-06.binero.net ([195.74.38.229]:24430 "EHLO
        bin-mail-out-06.binero.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726031AbgINXir (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 14 Sep 2020 19:38:47 -0400
X-Halon-ID: 4df5d193-f6e3-11ea-b48b-0050569116f7
Authorized-sender: niklas.soderlund@fsdn.se
Received: from bismarck.berto.se (p54ac52a8.dip0.t-ipconnect.de [84.172.82.168])
        by bin-vsp-out-03.atm.binero.net (Halon) with ESMTPA
        id 4df5d193-f6e3-11ea-b48b-0050569116f7;
        Tue, 15 Sep 2020 01:37:51 +0200 (CEST)
From:   =?UTF-8?q?Niklas=20S=C3=B6derlund?= 
        <niklas.soderlund+renesas@ragnatech.se>
To:     Geert Uytterhoeven <geert@linux-m68k.org>
Cc:     linux-renesas-soc@vger.kernel.org,
        =?UTF-8?q?Niklas=20S=C3=B6derlund?= 
        <niklas.soderlund+renesas@ragnatech.se>
Subject: [PATCH 3/4] pinctrl: sh-pfc: r8a77990: Add VIN stf8 pins
Date:   Tue, 15 Sep 2020 01:37:43 +0200
Message-Id: <20200914233744.468175-4-niklas.soderlund+renesas@ragnatech.se>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20200914233744.468175-1-niklas.soderlund+renesas@ragnatech.se>
References: <20200914233744.468175-1-niklas.soderlund+renesas@ragnatech.se>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

This patch adds VIN{4,5} sft8 pins to the R8A77990 SoC.

Signed-off-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
---
 drivers/pinctrl/sh-pfc/pfc-r8a77990.c | 32 +++++++++++++++++++++++++++
 1 file changed, 32 insertions(+)

diff --git a/drivers/pinctrl/sh-pfc/pfc-r8a77990.c b/drivers/pinctrl/sh-pfc/pfc-r8a77990.c
index c926a59dd21ceadc..1304559f04e5de4e 100644
--- a/drivers/pinctrl/sh-pfc/pfc-r8a77990.c
+++ b/drivers/pinctrl/sh-pfc/pfc-r8a77990.c
@@ -3644,6 +3644,20 @@ static const union vin_data vin4_data_b_mux = {
 	},
 };
 
+static const unsigned int vin4_data8_sft8_pins[] = {
+	RCAR_GP_PIN(1, 4),  RCAR_GP_PIN(1, 5),
+	RCAR_GP_PIN(1, 6),  RCAR_GP_PIN(1, 7),
+	RCAR_GP_PIN(1, 3),  RCAR_GP_PIN(1, 10),
+	RCAR_GP_PIN(1, 13), RCAR_GP_PIN(1, 14),
+};
+
+static const unsigned int vin4_data8_sft8_mux[] = {
+	VI4_DATA8_MARK,  VI4_DATA9_MARK,
+	VI4_DATA10_MARK, VI4_DATA11_MARK,
+	VI4_DATA12_MARK, VI4_DATA13_MARK,
+	VI4_DATA14_MARK, VI4_DATA15_MARK,
+};
+
 static const unsigned int vin4_sync_pins[] = {
 	/* HSYNC, VSYNC */
 	RCAR_GP_PIN(2, 25), RCAR_GP_PIN(2, 24),
@@ -3718,6 +3732,20 @@ static const unsigned int vin5_data8_b_mux[] = {
 	VI5_DATA6_B_MARK,  VI5_DATA7_B_MARK,
 };
 
+static const unsigned int vin5_data8_sft8_pins[] = {
+	RCAR_GP_PIN(0, 12), RCAR_GP_PIN(0, 13),
+	RCAR_GP_PIN(0, 9),  RCAR_GP_PIN(0, 11),
+	RCAR_GP_PIN(0, 8),  RCAR_GP_PIN(0, 10),
+	RCAR_GP_PIN(0, 2),  RCAR_GP_PIN(0, 3),
+};
+
+static const unsigned int vin5_data8_sft8_mux[] = {
+	VI5_DATA8_A_MARK,  VI5_DATA9_A_MARK,
+	VI5_DATA10_A_MARK, VI5_DATA11_A_MARK,
+	VI5_DATA12_A_MARK, VI5_DATA13_A_MARK,
+	VI5_DATA14_A_MARK, VI5_DATA15_A_MARK,
+};
+
 static const unsigned int vin5_sync_a_pins[] = {
 	/* HSYNC_N, VSYNC_N */
 	RCAR_GP_PIN(1, 8), RCAR_GP_PIN(1, 9),
@@ -3997,6 +4025,7 @@ static const struct {
 		SH_PFC_PIN_GROUP(vin4_data18_b),
 		VIN_DATA_PIN_GROUP(vin4_data, 20, _b),
 		VIN_DATA_PIN_GROUP(vin4_data, 24, _b),
+		SH_PFC_PIN_GROUP(vin4_data8_sft8),
 		SH_PFC_PIN_GROUP(vin4_sync),
 		SH_PFC_PIN_GROUP(vin4_field),
 		SH_PFC_PIN_GROUP(vin4_clkenb),
@@ -4006,6 +4035,7 @@ static const struct {
 		VIN_DATA_PIN_GROUP(vin5_data, 12, _a),
 		VIN_DATA_PIN_GROUP(vin5_data, 16, _a),
 		SH_PFC_PIN_GROUP(vin5_data8_b),
+		SH_PFC_PIN_GROUP(vin5_data8_sft8),
 		SH_PFC_PIN_GROUP(vin5_sync_a),
 		SH_PFC_PIN_GROUP(vin5_field_a),
 		SH_PFC_PIN_GROUP(vin5_clkenb_a),
@@ -4439,6 +4469,7 @@ static const char * const vin4_groups[] = {
 	"vin4_data18_b",
 	"vin4_data20_b",
 	"vin4_data24_b",
+	"vin4_data8_sft8",
 	"vin4_sync",
 	"vin4_field",
 	"vin4_clkenb",
@@ -4451,6 +4482,7 @@ static const char * const vin5_groups[] = {
 	"vin5_data12_a",
 	"vin5_data16_a",
 	"vin5_data8_b",
+	"vin5_data8_sft8",
 	"vin5_sync_a",
 	"vin5_field_a",
 	"vin5_clkenb_a",
-- 
2.28.0

