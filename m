Return-Path: <linux-renesas-soc+bounces-19003-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 054E0AF0797
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  2 Jul 2025 02:58:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id E6F36175ED7
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  2 Jul 2025 00:58:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CFF5A72610;
	Wed,  2 Jul 2025 00:57:34 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from relmlie5.idc.renesas.com (relmlor1.renesas.com [210.160.252.171])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 834594CE08;
	Wed,  2 Jul 2025 00:57:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=210.160.252.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751417854; cv=none; b=C0tKFuJd1MbPHZOa1v0gQ+3aPBwZDL6WfnRf3HxGPAePYCzEUciefbcWX3zMIrKTq7FUNlUji7Gh9mwJiEUrlXM3jcYWRj/R8HGWN+W/PXSdaEnj2HgxzRLxH7lP8UxulCmspBDFPggaazup/B6WQ4q3PdAXK5zZCIRbb8KKkhk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751417854; c=relaxed/simple;
	bh=ewupN6XCluzN0hVRWWcWXTXwPeGmjsxOrZFgAL31lUU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=SYmSOvgqDbCFshdTrXFQB/HM4kG3X486D7NlxPxNfiIAfOSluLzozP/+Eu4sq15BFVk1fTdOFCA3Dn973EWLv59IhF08qnt0jb3/uIob3H2Q9csKbZ27ln8YUFEqdkRaZC6olYGBbJBIOcue0gU4SjHUH+ezZ5NvcoWiuWyxaeE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; arc=none smtp.client-ip=210.160.252.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
X-CSE-ConnectionGUID: 8Rk1S18fRMqKRm7qqoC1Gw==
X-CSE-MsgGUID: Sje2jBtMT1uFs0aUznFt+w==
Received: from unknown (HELO relmlir6.idc.renesas.com) ([10.200.68.152])
  by relmlie5.idc.renesas.com with ESMTP; 02 Jul 2025 09:57:32 +0900
Received: from ubuntu.adwin.renesas.com (unknown [10.226.92.9])
	by relmlir6.idc.renesas.com (Postfix) with ESMTP id 1DB9640E798E;
	Wed,  2 Jul 2025 09:57:26 +0900 (JST)
From: John Madieu <john.madieu.xa@bp.renesas.com>
To: geert+renesas@glider.be,
	magnus.damm@gmail.com,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	mturquette@baylibre.com,
	sboyd@kernel.org,
	richardcochran@gmail.com,
	prabhakar.mahadev-lad.rj@bp.renesas.com
Cc: linux-renesas-soc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-clk@vger.kernel.org,
	netdev@vger.kernel.org,
	biju.das.jz@bp.renesas.com,
	john.madieu@gmail.com
Subject: [PATCH v4 3/4] pinctrl: renesas: rzg2l: Add PFC_OEN support for RZ/G3E SoC
Date: Wed,  2 Jul 2025 02:57:05 +0200
Message-ID: <20250702005706.1200059-4-john.madieu.xa@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250702005706.1200059-1-john.madieu.xa@bp.renesas.com>
References: <20250702005706.1200059-1-john.madieu.xa@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Add support to configure the PFC_OEN register on the RZ/G3E SoC for
specific pins that require direction control via output-enable.

On the RZ/G3E SoC, certain pins such as TXC_TXCLK must be switchable
between input and output modes depending on the PHY interface mode
(MII or RGMII). This behavior maps to the `output-enable` property in
the device tree and requires configuring the PFC_OEN register.

Update the r9a09g047_variable_pin_cfg array to include PB1, PE1, PL0,
PL1, PL2, and PL4 with PIN_CFG_OEN flags to indicate support for this
feature. Define a new rzg3e_hwcfg structure with SoC-specific pin names
used for OEN bit mapping.

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
---

Changes:

v4: new patch

 drivers/pinctrl/renesas/pinctrl-rzg2l.c | 45 ++++++++++++++++++++++---
 1 file changed, 41 insertions(+), 4 deletions(-)

diff --git a/drivers/pinctrl/renesas/pinctrl-rzg2l.c b/drivers/pinctrl/renesas/pinctrl-rzg2l.c
index 792ca70bd9d1..00847a743d1f 100644
--- a/drivers/pinctrl/renesas/pinctrl-rzg2l.c
+++ b/drivers/pinctrl/renesas/pinctrl-rzg2l.c
@@ -398,6 +398,14 @@ static const u64 r9a09g047_variable_pin_cfg[] = {
 	RZG2L_VARIABLE_PIN_CFG_PACK(RZG3E_PA, 5, RZV2H_MPXED_PIN_FUNCS),
 	RZG2L_VARIABLE_PIN_CFG_PACK(RZG3E_PA, 6, RZV2H_MPXED_PIN_FUNCS),
 	RZG2L_VARIABLE_PIN_CFG_PACK(RZG3E_PA, 7, RZV2H_MPXED_PIN_FUNCS),
+	RZG2L_VARIABLE_PIN_CFG_PACK(RZG3E_PB, 0, RZV2H_MPXED_PIN_FUNCS),
+	RZG2L_VARIABLE_PIN_CFG_PACK(RZG3E_PB, 1, RZV2H_MPXED_PIN_FUNCS | PIN_CFG_OEN),
+	RZG2L_VARIABLE_PIN_CFG_PACK(RZG3E_PB, 2, RZV2H_MPXED_PIN_FUNCS),
+	RZG2L_VARIABLE_PIN_CFG_PACK(RZG3E_PB, 3, RZV2H_MPXED_PIN_FUNCS),
+	RZG2L_VARIABLE_PIN_CFG_PACK(RZG3E_PB, 4, RZV2H_MPXED_PIN_FUNCS),
+	RZG2L_VARIABLE_PIN_CFG_PACK(RZG3E_PB, 5, RZV2H_MPXED_PIN_FUNCS),
+	RZG2L_VARIABLE_PIN_CFG_PACK(RZG3E_PB, 6, RZV2H_MPXED_PIN_FUNCS),
+	RZG2L_VARIABLE_PIN_CFG_PACK(RZG3E_PB, 7, RZV2H_MPXED_PIN_FUNCS),
 	RZG2L_VARIABLE_PIN_CFG_PACK(RZG3E_PD, 0, RZV2H_MPXED_PIN_FUNCS | PIN_CFG_IEN),
 	RZG2L_VARIABLE_PIN_CFG_PACK(RZG3E_PD, 1, RZV2H_MPXED_PIN_FUNCS),
 	RZG2L_VARIABLE_PIN_CFG_PACK(RZG3E_PD, 2, RZV2H_MPXED_PIN_FUNCS),
@@ -406,6 +414,14 @@ static const u64 r9a09g047_variable_pin_cfg[] = {
 	RZG2L_VARIABLE_PIN_CFG_PACK(RZG3E_PD, 5, RZV2H_MPXED_PIN_FUNCS),
 	RZG2L_VARIABLE_PIN_CFG_PACK(RZG3E_PD, 6, RZV2H_MPXED_PIN_FUNCS),
 	RZG2L_VARIABLE_PIN_CFG_PACK(RZG3E_PD, 7, RZV2H_MPXED_PIN_FUNCS),
+	RZG2L_VARIABLE_PIN_CFG_PACK(RZG3E_PE, 0, RZV2H_MPXED_PIN_FUNCS),
+	RZG2L_VARIABLE_PIN_CFG_PACK(RZG3E_PE, 1, RZV2H_MPXED_PIN_FUNCS | PIN_CFG_OEN),
+	RZG2L_VARIABLE_PIN_CFG_PACK(RZG3E_PE, 2, RZV2H_MPXED_PIN_FUNCS),
+	RZG2L_VARIABLE_PIN_CFG_PACK(RZG3E_PE, 3, RZV2H_MPXED_PIN_FUNCS),
+	RZG2L_VARIABLE_PIN_CFG_PACK(RZG3E_PE, 4, RZV2H_MPXED_PIN_FUNCS),
+	RZG2L_VARIABLE_PIN_CFG_PACK(RZG3E_PE, 5, RZV2H_MPXED_PIN_FUNCS),
+	RZG2L_VARIABLE_PIN_CFG_PACK(RZG3E_PE, 6, RZV2H_MPXED_PIN_FUNCS),
+	RZG2L_VARIABLE_PIN_CFG_PACK(RZG3E_PE, 7, RZV2H_MPXED_PIN_FUNCS),
 	RZG2L_VARIABLE_PIN_CFG_PACK(RZG3E_PG, 0, RZV2H_MPXED_PIN_FUNCS),
 	RZG2L_VARIABLE_PIN_CFG_PACK(RZG3E_PG, 1, RZV2H_MPXED_PIN_FUNCS | PIN_CFG_IEN),
 	RZG2L_VARIABLE_PIN_CFG_PACK(RZG3E_PG, 2, RZV2H_MPXED_PIN_FUNCS | PIN_CFG_IEN),
@@ -425,6 +441,14 @@ static const u64 r9a09g047_variable_pin_cfg[] = {
 	RZG2L_VARIABLE_PIN_CFG_PACK(RZG3E_PJ, 2, RZV2H_MPXED_PIN_FUNCS),
 	RZG2L_VARIABLE_PIN_CFG_PACK(RZG3E_PJ, 3, RZV2H_MPXED_PIN_FUNCS),
 	RZG2L_VARIABLE_PIN_CFG_PACK(RZG3E_PJ, 4, RZV2H_MPXED_PIN_FUNCS),
+	RZG2L_VARIABLE_PIN_CFG_PACK(RZG3E_PL, 0, RZV2H_MPXED_PIN_FUNCS | PIN_CFG_OEN),
+	RZG2L_VARIABLE_PIN_CFG_PACK(RZG3E_PL, 1, RZV2H_MPXED_PIN_FUNCS | PIN_CFG_OEN),
+	RZG2L_VARIABLE_PIN_CFG_PACK(RZG3E_PL, 2, RZV2H_MPXED_PIN_FUNCS | PIN_CFG_OEN),
+	RZG2L_VARIABLE_PIN_CFG_PACK(RZG3E_PL, 3, RZV2H_MPXED_PIN_FUNCS),
+	RZG2L_VARIABLE_PIN_CFG_PACK(RZG3E_PL, 4, RZV2H_MPXED_PIN_FUNCS | PIN_CFG_OEN),
+	RZG2L_VARIABLE_PIN_CFG_PACK(RZG3E_PL, 5, RZV2H_MPXED_PIN_FUNCS),
+	RZG2L_VARIABLE_PIN_CFG_PACK(RZG3E_PL, 6, RZV2H_MPXED_PIN_FUNCS),
+	RZG2L_VARIABLE_PIN_CFG_PACK(RZG3E_PL, 7, RZV2H_MPXED_PIN_FUNCS),
 };
 
 static const u64 r9a09g057_variable_pin_cfg[] = {
@@ -2052,17 +2076,17 @@ static const u64 r9a09g047_gpio_configs[] = {
 	RZG2L_GPIO_PORT_PACK(6, 0x28, RZV2H_MPXED_PIN_FUNCS),	/* P8 */
 	0x0,
 	RZG2L_GPIO_PORT_PACK_VARIABLE(8, 0x2a),			/* PA */
-	RZG2L_GPIO_PORT_PACK(8, 0x2b, RZV2H_MPXED_PIN_FUNCS),	/* PB */
+	RZG2L_GPIO_PORT_PACK_VARIABLE(8, 0x2b),			/* PB */
 	RZG2L_GPIO_PORT_PACK(3, 0x2c, RZV2H_MPXED_PIN_FUNCS),	/* PC */
 	RZG2L_GPIO_PORT_PACK_VARIABLE(8, 0x2d),			/* PD */
-	RZG2L_GPIO_PORT_PACK(8, 0x2e, RZV2H_MPXED_PIN_FUNCS),	/* PE */
+	RZG2L_GPIO_PORT_PACK_VARIABLE(8, 0x2e),			/* PE */
 	RZG2L_GPIO_PORT_PACK(3, 0x2f, RZV2H_MPXED_PIN_FUNCS),	/* PF */
 	RZG2L_GPIO_PORT_PACK_VARIABLE(8, 0x30),			/* PG */
 	RZG2L_GPIO_PORT_PACK_VARIABLE(6, 0x31),			/* PH */
 	0x0,
 	RZG2L_GPIO_PORT_PACK_VARIABLE(5, 0x33),			/* PJ */
 	RZG2L_GPIO_PORT_PACK(4, 0x34, RZV2H_MPXED_PIN_FUNCS),	/* PK */
-	RZG2L_GPIO_PORT_PACK(8, 0x35, RZV2H_MPXED_PIN_FUNCS),	/* PL */
+	RZG2L_GPIO_PORT_PACK_VARIABLE(8, 0x35),			/* PL */
 	RZG2L_GPIO_PORT_PACK(8, 0x36, RZV2H_MPXED_PIN_FUNCS),	/* PM */
 	0x0,
 	0x0,
@@ -3283,6 +3307,19 @@ static const char * const rzv2h_oen_pin_names[] = {
 	"XSPI0_CKN", "XSPI0_CKP"
 };
 
+static const char * const rzg3e_oen_pin_names[] = {
+	"PB1", "PE1", "PL4", "PL1", "PL2", "PL0"
+};
+
+static const struct rzg2l_hwcfg rzg3e_hwcfg = {
+	.regs = {
+		.pwpr = 0x3c04,
+	},
+	.tint_start_index = 17,
+	.oen_pin_names = rzg3e_oen_pin_names,
+	.oen_pin_names_len = ARRAY_SIZE(rzg3e_oen_pin_names),
+};
+
 static const struct rzg2l_hwcfg rzv2h_hwcfg = {
 	.regs = {
 		.pwpr = 0x3c04,
@@ -3352,7 +3389,7 @@ static struct rzg2l_pinctrl_data r9a09g047_data = {
 	.dedicated_pins = rzg3e_dedicated_pins,
 	.n_port_pins = ARRAY_SIZE(r9a09g047_gpio_configs) * RZG2L_PINS_PER_PORT,
 	.n_dedicated_pins = ARRAY_SIZE(rzg3e_dedicated_pins),
-	.hwcfg = &rzv2h_hwcfg,
+	.hwcfg = &rzg3e_hwcfg,
 	.variable_pin_cfg = r9a09g047_variable_pin_cfg,
 	.n_variable_pin_cfg = ARRAY_SIZE(r9a09g047_variable_pin_cfg),
 	.num_custom_params = ARRAY_SIZE(renesas_rzv2h_custom_bindings),
-- 
2.25.1


