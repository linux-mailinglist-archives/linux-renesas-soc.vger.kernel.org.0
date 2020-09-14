Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7BCF12699C7
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 15 Sep 2020 01:38:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726019AbgINXir (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 14 Sep 2020 19:38:47 -0400
Received: from bin-mail-out-05.binero.net ([195.74.38.228]:59486 "EHLO
        bin-mail-out-05.binero.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1725994AbgINXiq (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 14 Sep 2020 19:38:46 -0400
X-Halon-ID: 4d7769da-f6e3-11ea-b48b-0050569116f7
Authorized-sender: niklas.soderlund@fsdn.se
Received: from bismarck.berto.se (p54ac52a8.dip0.t-ipconnect.de [84.172.82.168])
        by bin-vsp-out-03.atm.binero.net (Halon) with ESMTPA
        id 4d7769da-f6e3-11ea-b48b-0050569116f7;
        Tue, 15 Sep 2020 01:37:51 +0200 (CEST)
From:   =?UTF-8?q?Niklas=20S=C3=B6derlund?= 
        <niklas.soderlund+renesas@ragnatech.se>
To:     Geert Uytterhoeven <geert@linux-m68k.org>
Cc:     linux-renesas-soc@vger.kernel.org,
        Takeshi Kihara <takeshi.kihara.df@renesas.com>,
        =?UTF-8?q?Niklas=20S=C3=B6derlund?= 
        <niklas.soderlund+renesas@ragnatech.se>
Subject: [PATCH 2/4] pinctrl: sh-pfc: r8a7796: Add VIN pins, groups and functions
Date:   Tue, 15 Sep 2020 01:37:42 +0200
Message-Id: <20200914233744.468175-3-niklas.soderlund+renesas@ragnatech.se>
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

From: Takeshi Kihara <takeshi.kihara.df@renesas.com>

This patch adds VIN{4,5} pins, groups and functions to the R8A7796 SoC.

Signed-off-by: Takeshi Kihara <takeshi.kihara.df@renesas.com>
[Niklas: Rework to fit upstream driver]
Signed-off-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
---
 drivers/pinctrl/sh-pfc/pfc-r8a7796.c | 28 ++++++++++++++++++++++++++++
 1 file changed, 28 insertions(+)

diff --git a/drivers/pinctrl/sh-pfc/pfc-r8a7796.c b/drivers/pinctrl/sh-pfc/pfc-r8a7796.c
index a2496baca85d23f8..a50beb81a342f636 100644
--- a/drivers/pinctrl/sh-pfc/pfc-r8a7796.c
+++ b/drivers/pinctrl/sh-pfc/pfc-r8a7796.c
@@ -4048,6 +4048,18 @@ static const union vin_data vin4_data_b_mux = {
 		VI4_DATA22_MARK, VI4_DATA23_MARK,
 	},
 };
+static const unsigned int vin4_data8_sft8_pins[] = {
+	RCAR_GP_PIN(1, 0),  RCAR_GP_PIN(1, 1),
+	RCAR_GP_PIN(1, 2),  RCAR_GP_PIN(1, 3),
+	RCAR_GP_PIN(1, 4),  RCAR_GP_PIN(1, 5),
+	RCAR_GP_PIN(1, 6),  RCAR_GP_PIN(1, 7),
+};
+static const unsigned int vin4_data8_sft8_mux[] = {
+	VI4_DATA8_MARK,  VI4_DATA9_MARK,
+	VI4_DATA10_MARK, VI4_DATA11_MARK,
+	VI4_DATA12_MARK, VI4_DATA13_MARK,
+	VI4_DATA14_MARK, VI4_DATA15_MARK,
+};
 static const unsigned int vin4_sync_pins[] = {
 	/* HSYNC#, VSYNC# */
 	RCAR_GP_PIN(1, 18), RCAR_GP_PIN(1, 17),
@@ -4102,6 +4114,18 @@ static const union vin_data16 vin5_data_mux = {
 		VI5_DATA14_MARK, VI5_DATA15_MARK,
 	},
 };
+static const unsigned int vin5_data8_sft8_pins[] = {
+	RCAR_GP_PIN(1, 12), RCAR_GP_PIN(1, 13),
+	RCAR_GP_PIN(1, 14), RCAR_GP_PIN(1, 15),
+	RCAR_GP_PIN(1, 4),  RCAR_GP_PIN(1, 5),
+	RCAR_GP_PIN(1, 6),  RCAR_GP_PIN(1, 7),
+};
+static const unsigned int vin5_data8_sft8_mux[] = {
+	VI5_DATA8_MARK,  VI5_DATA9_MARK,
+	VI5_DATA10_MARK, VI5_DATA11_MARK,
+	VI5_DATA12_MARK, VI5_DATA13_MARK,
+	VI5_DATA14_MARK, VI5_DATA15_MARK,
+};
 static const unsigned int vin5_sync_pins[] = {
 	/* HSYNC#, VSYNC# */
 	RCAR_GP_PIN(1, 10), RCAR_GP_PIN(1, 9),
@@ -4440,6 +4464,7 @@ static const struct {
 		SH_PFC_PIN_GROUP(vin4_data18_b),
 		VIN_DATA_PIN_GROUP(vin4_data, 20, _b),
 		VIN_DATA_PIN_GROUP(vin4_data, 24, _b),
+		SH_PFC_PIN_GROUP(vin4_data8_sft8),
 		SH_PFC_PIN_GROUP(vin4_sync),
 		SH_PFC_PIN_GROUP(vin4_field),
 		SH_PFC_PIN_GROUP(vin4_clkenb),
@@ -4448,6 +4473,7 @@ static const struct {
 		VIN_DATA_PIN_GROUP(vin5_data, 10),
 		VIN_DATA_PIN_GROUP(vin5_data, 12),
 		VIN_DATA_PIN_GROUP(vin5_data, 16),
+		SH_PFC_PIN_GROUP(vin5_data8_sft8),
 		SH_PFC_PIN_GROUP(vin5_sync),
 		SH_PFC_PIN_GROUP(vin5_field),
 		SH_PFC_PIN_GROUP(vin5_clkenb),
@@ -4978,6 +5004,7 @@ static const char * const vin4_groups[] = {
 	"vin4_data18_b",
 	"vin4_data20_b",
 	"vin4_data24_b",
+	"vin4_data8_sft8",
 	"vin4_sync",
 	"vin4_field",
 	"vin4_clkenb",
@@ -4989,6 +5016,7 @@ static const char * const vin5_groups[] = {
 	"vin5_data10",
 	"vin5_data12",
 	"vin5_data16",
+	"vin5_data8_sft8",
 	"vin5_sync",
 	"vin5_field",
 	"vin5_clkenb",
-- 
2.28.0

