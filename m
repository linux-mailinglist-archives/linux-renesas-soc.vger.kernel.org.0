Return-Path: <linux-renesas-soc+bounces-5951-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E76990009C
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  7 Jun 2024 12:22:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 709B71C21B44
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  7 Jun 2024 10:22:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 63B6F7A15B;
	Fri,  7 Jun 2024 10:21:23 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from cantor.telenet-ops.be (cantor.telenet-ops.be [195.130.132.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9AB6915CD7D
	for <linux-renesas-soc@vger.kernel.org>; Fri,  7 Jun 2024 10:21:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.130.132.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717755683; cv=none; b=s/BDMyXLH8NyKUen4v+RCvDH4oD2OsoCBlvSeWTi3i7qXlIxAvL4gG2ur0bNVvV9o02iSYKwZvt3Ha5siB0tIATPSAcIPu9o8lnLkvjQyd4gXsrnD4mIqA6e1T5sUAe24naDTy3EkaEa5PGgv7R1ppJWejz+BIbmuDGVMpDFIf0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717755683; c=relaxed/simple;
	bh=TGvgsKtiDJsjKYynHkMXhlqDCgDvDNiOqoQYnj+F7Vw=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=lBhb6ntvH3csqs7kBr12r6ZykC5KeAhoZH49mL53XvJ+jWfTaMq9xAaJ3OrRWQcVwyUwrc1ynriMPJHiJucIyOvkZOZ0st1ZEMDDCVUYBD+xcWXh4ZdvWZNTE9c6j5fri97eBhVL5TinE+PpnprZTo6RCyEuyhlueFpywS+n1Oc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=glider.be; spf=none smtp.mailfrom=linux-m68k.org; arc=none smtp.client-ip=195.130.132.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=glider.be
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux-m68k.org
Received: from baptiste.telenet-ops.be (baptiste.telenet-ops.be [IPv6:2a02:1800:120:4::f00:13])
	by cantor.telenet-ops.be (Postfix) with ESMTPS id 4VwcVm6dn4z4xJkd
	for <linux-renesas-soc@vger.kernel.org>; Fri, 07 Jun 2024 12:14:08 +0200 (CEST)
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed80:5ffd:9c1a:d9c:cf6])
	by baptiste.telenet-ops.be with bizsmtp
	id YaDz2C00L45NznL01aDz7f; Fri, 07 Jun 2024 12:14:01 +0200
Received: from rox.of.borg ([192.168.97.57])
	by ramsan.of.borg with esmtp (Exim 4.95)
	(envelope-from <geert@linux-m68k.org>)
	id 1sFWad-00ECgH-V3;
	Fri, 07 Jun 2024 12:13:59 +0200
Received: from geert by rox.of.borg with local (Exim 4.95)
	(envelope-from <geert@linux-m68k.org>)
	id 1sFWbf-00200X-ET;
	Fri, 07 Jun 2024 12:13:59 +0200
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Linus Walleij <linus.walleij@linaro.org>,
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc: Takeshi Kihara <takeshi.kihara.df@renesas.com>,
	LUU HOAI <hoai.luu.ub@renesas.com>,
	Kazuya Mizuguch <kazuya.mizuguchi.ks@renesas.com>,
	Phong Hoang <phong.hoang.wz@renesas.com>,
	CongDang <cong.dang.xn@renesas.com>,
	Thanh Quan <thanh.quan.xn@renesas.com>,
	linux-renesas-soc@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH 1/8] pinctrl: renesas: r8a779g0: Fix CANFD5 suffix
Date: Fri,  7 Jun 2024 12:13:48 +0200
Message-Id: <10b22d54086ed11cdfeb0004583029ccf249bdb9.1717754960.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1717754960.git.geert+renesas@glider.be>
References: <cover.1717754960.git.geert+renesas@glider.be>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

CAN-FD instance 5 has two alternate pin groups: "canfd5" and "canfd5_b".
Rename the former to "canfd5_a" to increase uniformity.

While at it, remove the unneeded separator.

Fixes: ad9bb2fec66262b0 ("pinctrl: renesas: Initial R8A779G0 (R-Car V4H) PFC support")
Fixes: 050442ae4c74f830 ("pinctrl: renesas: r8a779g0: Add pins, groups and functions")
Fixes: c2b4b2cd632d17e7 ("pinctrl: renesas: r8a779g0: Add missing CANFD5_B")
Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
 drivers/pinctrl/renesas/pfc-r8a779g0.c | 24 +++++++++++-------------
 1 file changed, 11 insertions(+), 13 deletions(-)

diff --git a/drivers/pinctrl/renesas/pfc-r8a779g0.c b/drivers/pinctrl/renesas/pfc-r8a779g0.c
index d2de526a3b588689..d90ba8b6b4b423ed 100644
--- a/drivers/pinctrl/renesas/pfc-r8a779g0.c
+++ b/drivers/pinctrl/renesas/pfc-r8a779g0.c
@@ -341,8 +341,8 @@
 /* IP0SR2 */		/* 0 */			/* 1 */			/* 2 */			/* 3		4	 5	  6	   7	    8	     9	      A	       B	C	 D	  E	   F */
 #define IP0SR2_3_0	FM(FXR_TXDA)		FM(CANFD1_TX)		FM(TPU0TO2_A)		F_(0, 0)	F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0)
 #define IP0SR2_7_4	FM(FXR_TXENA_N)		FM(CANFD1_RX)		FM(TPU0TO3_A)		F_(0, 0)	F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0)
-#define IP0SR2_11_8	FM(RXDA_EXTFXR)		FM(CANFD5_TX)		FM(IRQ5)		F_(0, 0)	F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0)
-#define IP0SR2_15_12	FM(CLK_EXTFXR)		FM(CANFD5_RX)		FM(IRQ4_B)		F_(0, 0)	F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0)
+#define IP0SR2_11_8	FM(RXDA_EXTFXR)		FM(CANFD5_TX_A)		FM(IRQ5)		F_(0, 0)	F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0)
+#define IP0SR2_15_12	FM(CLK_EXTFXR)		FM(CANFD5_RX_A)		FM(IRQ4_B)		F_(0, 0)	F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0)
 #define IP0SR2_19_16	FM(RXDB_EXTFXR)		F_(0, 0)		F_(0, 0)		F_(0, 0)	F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0)
 #define IP0SR2_23_20	FM(FXR_TXENB_N)		F_(0, 0)		F_(0, 0)		F_(0, 0)	F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0)
 #define IP0SR2_27_24	FM(FXR_TXDB)		F_(0, 0)		F_(0, 0)		F_(0, 0)	F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0)
@@ -896,11 +896,11 @@ static const u16 pinmux_data[] = {
 	PINMUX_IPSR_GPSR(IP0SR2_7_4,	TPU0TO3_A),
 
 	PINMUX_IPSR_GPSR(IP0SR2_11_8,	RXDA_EXTFXR),
-	PINMUX_IPSR_GPSR(IP0SR2_11_8,	CANFD5_TX),
+	PINMUX_IPSR_GPSR(IP0SR2_11_8,	CANFD5_TX_A),
 	PINMUX_IPSR_GPSR(IP0SR2_11_8,	IRQ5),
 
 	PINMUX_IPSR_GPSR(IP0SR2_15_12,	CLK_EXTFXR),
-	PINMUX_IPSR_GPSR(IP0SR2_15_12,	CANFD5_RX),
+	PINMUX_IPSR_GPSR(IP0SR2_15_12,	CANFD5_RX_A),
 	PINMUX_IPSR_GPSR(IP0SR2_15_12,	IRQ4_B),
 
 	PINMUX_IPSR_GPSR(IP0SR2_19_16,	RXDB_EXTFXR),
@@ -1531,15 +1531,14 @@ static const unsigned int canfd4_data_mux[] = {
 };
 
 /* - CANFD5 ----------------------------------------------------------------- */
-static const unsigned int canfd5_data_pins[] = {
-	/* CANFD5_TX, CANFD5_RX */
+static const unsigned int canfd5_data_a_pins[] = {
+	/* CANFD5_TX_A, CANFD5_RX_A */
 	RCAR_GP_PIN(2, 2), RCAR_GP_PIN(2, 3),
 };
-static const unsigned int canfd5_data_mux[] = {
-	CANFD5_TX_MARK, CANFD5_RX_MARK,
+static const unsigned int canfd5_data_a_mux[] = {
+	CANFD5_TX_A_MARK, CANFD5_RX_A_MARK,
 };
 
-/* - CANFD5_B ----------------------------------------------------------------- */
 static const unsigned int canfd5_data_b_pins[] = {
 	/* CANFD5_TX_B, CANFD5_RX_B */
 	RCAR_GP_PIN(1, 8), RCAR_GP_PIN(1, 9),
@@ -2578,8 +2577,8 @@ static const struct sh_pfc_pin_group pinmux_groups[] = {
 	SH_PFC_PIN_GROUP(canfd2_data),
 	SH_PFC_PIN_GROUP(canfd3_data),
 	SH_PFC_PIN_GROUP(canfd4_data),
-	SH_PFC_PIN_GROUP(canfd5_data),		/* suffix might be updated */
-	SH_PFC_PIN_GROUP(canfd5_data_b),	/* suffix might be updated */
+	SH_PFC_PIN_GROUP(canfd5_data_a),
+	SH_PFC_PIN_GROUP(canfd5_data_b),
 	SH_PFC_PIN_GROUP(canfd6_data),
 	SH_PFC_PIN_GROUP(canfd7_data),
 	SH_PFC_PIN_GROUP(can_clk),
@@ -2788,8 +2787,7 @@ static const char * const canfd4_groups[] = {
 };
 
 static const char * const canfd5_groups[] = {
-	/* suffix might be updated */
-	"canfd5_data",
+	"canfd5_data_a",
 	"canfd5_data_b",
 };
 
-- 
2.34.1


