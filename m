Return-Path: <linux-renesas-soc+bounces-6256-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 94A3C908EB6
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 14 Jun 2024 17:27:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 1169C289F48
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 14 Jun 2024 15:27:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A544F49649;
	Fri, 14 Jun 2024 15:26:52 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from albert.telenet-ops.be (albert.telenet-ops.be [195.130.137.90])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 63FF516B754
	for <linux-renesas-soc@vger.kernel.org>; Fri, 14 Jun 2024 15:26:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.130.137.90
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718378812; cv=none; b=mTUiorGl79kf1YK5CJZxMY18vfUKFbIlNOXXLh7Ck5SXSi+HmuDOTPTdU6q9RxcUdOvPZrq0ZGmWnXxw+lOJJaNagh5w7t5WmCnbu9vLaMIEGSwOk+MvrFEM3xMGLvbGwJJg1t6yGVKrtFSqdbw4HwGIphVvOyAGj3QfmhVB9KA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718378812; c=relaxed/simple;
	bh=sHYsLAv0+vweZ392rVswNLI27gkDomwoePP+aZWoyCY=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=pdFojA0bg06pN/iSmXABtx9uKqXLPshB3PWZYnQLWpH3glBIkM3mVxNGX2R6P37SOqA+SreMptDaPiQa622ka6beA4WWKVBtXr9RidK3sM/xHpI5ah5Qnw+gM53W9zA+VevgcARBYB/XxmzzLu5vmfF9ehj2uJ1za2IxRf1Bx8A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=glider.be; spf=none smtp.mailfrom=linux-m68k.org; arc=none smtp.client-ip=195.130.137.90
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=glider.be
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux-m68k.org
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed80:be2a:f066:50f0:dff7])
	by albert.telenet-ops.be with bizsmtp
	id bTSn2C0023w30qz06TSnZf; Fri, 14 Jun 2024 17:26:47 +0200
Received: from rox.of.borg ([192.168.97.57])
	by ramsan.of.borg with esmtp (Exim 4.95)
	(envelope-from <geert@linux-m68k.org>)
	id 1sI8o8-00CdsI-EK;
	Fri, 14 Jun 2024 17:26:47 +0200
Received: from geert by rox.of.borg with local (Exim 4.95)
	(envelope-from <geert@linux-m68k.org>)
	id 1sI8pD-00FqER-03;
	Fri, 14 Jun 2024 17:26:47 +0200
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Sergey Shtylyov <s.shtylyov@omp.ru>,
	Paul Barker <paul.barker.ct@bp.renesas.com>,
	=?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
Cc: linux-renesas-soc@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH/RFC] pinctrl: renesas: r8a779h0: Add AVB MII pins and groups
Date: Fri, 14 Jun 2024 17:26:45 +0200
Message-Id: <4a0a12227f2145ef53b18bc08f45b19dcd745fc6.1718378739.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

EtherAVB instances 0 and 1 support both RGMII and MII interfaces.
Add the missing pins and groups for MII.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
Compile-test only, as all AVB interfaces on the Gray Hawk Single
development board are connected to RGMII PHYs.
---
 drivers/pinctrl/renesas/pfc-r8a779h0.c | 52 ++++++++++++++++++++++++++
 1 file changed, 52 insertions(+)

diff --git a/drivers/pinctrl/renesas/pfc-r8a779h0.c b/drivers/pinctrl/renesas/pfc-r8a779h0.c
index 438d1f2739dd4bcd..944bf927449ddc1b 100644
--- a/drivers/pinctrl/renesas/pfc-r8a779h0.c
+++ b/drivers/pinctrl/renesas/pfc-r8a779h0.c
@@ -1236,6 +1236,30 @@ static const unsigned int avb0_mdio_pins[] = {
 static const unsigned int avb0_mdio_mux[] = {
 	AVB0_MDC_MARK, AVB0_MDIO_MARK,
 };
+static const unsigned int avb0_mii_pins[] = {
+	/*
+	 * AVB0_MII_TD0, AVB0_MII_TD1, AVB0_MII_TD2,
+	 * AVB0_MII_TD3, AVB0_MII_RD0, AVB0_MII_RD1,
+	 * AVB0_MII_RD2, AVB0_MII_RD3, AVB0_MII_TXC,
+	 * AVB0_MII_TX_EN, AVB0_MII_TX_ER, AVB0_MII_RXC,
+	 * AVB0_MII_RX_DV, AVB0_MII_RX_ER, AVB0_MII_CRS,
+	 * AVB0_MII_COL
+	 */
+	RCAR_GP_PIN(7, 11), RCAR_GP_PIN(7,  7), RCAR_GP_PIN(7,  6),
+	RCAR_GP_PIN(7,  3), RCAR_GP_PIN(7, 18), RCAR_GP_PIN(7, 17),
+	RCAR_GP_PIN(7, 12), RCAR_GP_PIN(7,  8), RCAR_GP_PIN(7, 15),
+	RCAR_GP_PIN(7, 16), RCAR_GP_PIN(7,  4), RCAR_GP_PIN(7, 19),
+	RCAR_GP_PIN(7, 20), RCAR_GP_PIN(7,  2), RCAR_GP_PIN(7,  1),
+	RCAR_GP_PIN(7,  0),
+};
+static const unsigned int avb0_mii_mux[] = {
+	AVB0_MII_TD0_MARK, AVB0_MII_TD1_MARK, AVB0_MII_TD2_MARK,
+	AVB0_MII_TD3_MARK, AVB0_MII_RD0_MARK, AVB0_MII_RD1_MARK,
+	AVB0_MII_RD2_MARK, AVB0_MII_RD3_MARK, AVB0_MII_TXC_MARK,
+	AVB0_MII_TX_EN_MARK, AVB0_MII_TX_ER_MARK, AVB0_MII_RXC_MARK,
+	AVB0_MII_RX_DV_MARK, AVB0_MII_RX_ER_MARK, AVB0_MII_CRS_MARK,
+	AVB0_MII_COL_MARK,
+};
 static const unsigned int avb0_rgmii_pins[] = {
 	/*
 	 * AVB0_TX_CTL, AVB0_TXC, AVB0_TD0, AVB0_TD1, AVB0_TD2, AVB0_TD3,
@@ -1314,6 +1338,30 @@ static const unsigned int avb1_mdio_pins[] = {
 static const unsigned int avb1_mdio_mux[] = {
 	AVB1_MDC_MARK, AVB1_MDIO_MARK,
 };
+static const unsigned int avb1_mii_pins[] = {
+	/*
+	 * AVB1_MII_TD0, AVB1_MII_TD1, AVB1_MII_TD2,
+	 * AVB1_MII_TD3, AVB1_MII_RD0, AVB1_MII_RD1,
+	 * AVB1_MII_RD2, AVB1_MII_RD3, AVB1_MII_TXC,
+	 * AVB1_MII_TX_EN, AVB1_MII_TX_ER, AVB1_MII_RXC,
+	 * AVB1_MII_RX_DV, AVB1_MII_RX_ER, AVB1_MII_CRS,
+	 * AVB1_MII_COL
+	 */
+	RCAR_GP_PIN(6, 13), RCAR_GP_PIN(6, 12), RCAR_GP_PIN(6, 16),
+	RCAR_GP_PIN(6, 18), RCAR_GP_PIN(6, 15), RCAR_GP_PIN(6, 14),
+	RCAR_GP_PIN(6, 17), RCAR_GP_PIN(6, 19), RCAR_GP_PIN(6,  6),
+	RCAR_GP_PIN(6,  7), RCAR_GP_PIN(6,  4), RCAR_GP_PIN(6,  8),
+	RCAR_GP_PIN(6,  9), RCAR_GP_PIN(6,  5), RCAR_GP_PIN(6, 11),
+	RCAR_GP_PIN(6, 10),
+};
+static const unsigned int avb1_mii_mux[] = {
+	AVB1_MII_TD0_MARK, AVB1_MII_TD1_MARK, AVB1_MII_TD2_MARK,
+	AVB1_MII_TD3_MARK, AVB1_MII_RD0_MARK, AVB1_MII_RD1_MARK,
+	AVB1_MII_RD2_MARK, AVB1_MII_RD3_MARK, AVB1_MII_TXC_MARK,
+	AVB1_MII_TX_EN_MARK, AVB1_MII_TX_ER_MARK, AVB1_MII_RXC_MARK,
+	AVB1_MII_RX_DV_MARK, AVB1_MII_RX_ER_MARK, AVB1_MII_CRS_MARK,
+	AVB1_MII_COL_MARK,
+};
 static const unsigned int avb1_rgmii_pins[] = {
 	/*
 	 * AVB1_TX_CTL, AVB1_TXC, AVB1_TD0, AVB1_TD1, AVB1_TD2, AVB1_TD3,
@@ -2444,6 +2492,7 @@ static const struct sh_pfc_pin_group pinmux_groups[] = {
 	SH_PFC_PIN_GROUP(avb0_magic),
 	SH_PFC_PIN_GROUP(avb0_phy_int),
 	SH_PFC_PIN_GROUP(avb0_mdio),
+	SH_PFC_PIN_GROUP(avb0_mii),
 	SH_PFC_PIN_GROUP(avb0_rgmii),
 	SH_PFC_PIN_GROUP(avb0_txcrefclk),
 	SH_PFC_PIN_GROUP(avb0_avtp_pps),
@@ -2454,6 +2503,7 @@ static const struct sh_pfc_pin_group pinmux_groups[] = {
 	SH_PFC_PIN_GROUP(avb1_magic),
 	SH_PFC_PIN_GROUP(avb1_phy_int),
 	SH_PFC_PIN_GROUP(avb1_mdio),
+	SH_PFC_PIN_GROUP(avb1_mii),
 	SH_PFC_PIN_GROUP(avb1_rgmii),
 	SH_PFC_PIN_GROUP(avb1_txcrefclk),
 	SH_PFC_PIN_GROUP(avb1_avtp_pps),
@@ -2628,6 +2678,7 @@ static const char * const avb0_groups[] = {
 	"avb0_magic",
 	"avb0_phy_int",
 	"avb0_mdio",
+	"avb0_mii",
 	"avb0_rgmii",
 	"avb0_txcrefclk",
 	"avb0_avtp_pps",
@@ -2640,6 +2691,7 @@ static const char * const avb1_groups[] = {
 	"avb1_magic",
 	"avb1_phy_int",
 	"avb1_mdio",
+	"avb1_mii",
 	"avb1_rgmii",
 	"avb1_txcrefclk",
 	"avb1_avtp_pps",
-- 
2.34.1


