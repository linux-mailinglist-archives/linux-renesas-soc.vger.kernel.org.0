Return-Path: <linux-renesas-soc+bounces-19002-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 02178AF0793
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  2 Jul 2025 02:58:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 0D744423A1D
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  2 Jul 2025 00:57:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 197BA6F073;
	Wed,  2 Jul 2025 00:57:29 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from relmlie5.idc.renesas.com (relmlor1.renesas.com [210.160.252.171])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BA9C64CE08;
	Wed,  2 Jul 2025 00:57:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=210.160.252.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751417849; cv=none; b=gLUyI6cZGB7DJsiwefj2LcO5iYx/mmp1c/H5ItxYzuA2sOHDsDKgdE8X2AUS8TIpmlSYBRLpTHUxdcXnrsIaRn+gy/4qSv3Ii/4C8LGD37/hVRchS/OB2kBAwCETqC2rue2g0QkSv5lgIaXv0TjLeoCX6F44x7BzC/1oh/Bt0N4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751417849; c=relaxed/simple;
	bh=sYI+2RKPQMFIhFORb+lNLJSYzcWBTLYQ3ACPTVmU1t0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=PygqSbPAvvA48R2uiFrZxKmBS4wCVybF4JkcayygsGSL/jTu/wUlNucwdpwpO0UQYS3fEHHOJtLH9xmZlskum2T67hSFk6CQDsFqEWiWeIXeZOvY6JZ0ALHBFvqjEloApVRpYm4c3Pfl3LLOQct5MDH1tdqQhI52cd4PHAxZU+U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; arc=none smtp.client-ip=210.160.252.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
X-CSE-ConnectionGUID: hZPHJrtoTNe1F2XWklxQ9Q==
X-CSE-MsgGUID: O0TUo7fSSuyzMs96njVo6Q==
Received: from unknown (HELO relmlir6.idc.renesas.com) ([10.200.68.152])
  by relmlie5.idc.renesas.com with ESMTP; 02 Jul 2025 09:57:26 +0900
Received: from ubuntu.adwin.renesas.com (unknown [10.226.92.9])
	by relmlir6.idc.renesas.com (Postfix) with ESMTP id 8DC9640E7741;
	Wed,  2 Jul 2025 09:57:21 +0900 (JST)
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
Subject: [PATCH v4 2/4] pinctrl: renesas: rzg2l: Pass OEN pin names
Date: Wed,  2 Jul 2025 02:57:04 +0200
Message-ID: <20250702005706.1200059-3-john.madieu.xa@bp.renesas.com>
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

Pass the OEN pin names via the SoC-specific hardware configuration
structure to allow reuse of rzv2h_oen_read() and rzv2h_oen_write()
on multiple SoCs.

On the RZ/V2H(P) and RZ/G3E SoCs, the PFC_OEN register is located at the
same offset. However, the register controls different pins on each SoC.
Hardcoding the pin names in the common logic prevents reusability.

Extend struct rzg2l_hwcfg to include an array of OEN pin names and its
length. Use these values in rzv2h_pin_to_oen_bit() to determine the bit
position dynamically based on the active SoC.

This enables shared handling of OEN register access while accounting for
SoC-specific pin mappings.

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
---

Changes:

v4: new patch

 drivers/pinctrl/renesas/pinctrl-rzg2l.c | 18 +++++++++++++-----
 1 file changed, 13 insertions(+), 5 deletions(-)

diff --git a/drivers/pinctrl/renesas/pinctrl-rzg2l.c b/drivers/pinctrl/renesas/pinctrl-rzg2l.c
index 78fa08ff0faa..792ca70bd9d1 100644
--- a/drivers/pinctrl/renesas/pinctrl-rzg2l.c
+++ b/drivers/pinctrl/renesas/pinctrl-rzg2l.c
@@ -257,6 +257,8 @@ enum rzg2l_iolh_index {
  * @func_base: base number for port function (see register PFC)
  * @oen_max_pin: the maximum pin number supporting output enable
  * @oen_max_port: the maximum port number supporting output enable
+ * @oen_pin_names: array of pin names for output enable
+ * @oen_pin_names_len: length of the oen_pin_names array
  */
 struct rzg2l_hwcfg {
 	const struct rzg2l_register_offsets regs;
@@ -269,6 +271,8 @@ struct rzg2l_hwcfg {
 	u8 func_base;
 	u8 oen_max_pin;
 	u8 oen_max_port;
+	const char * const *oen_pin_names;
+	u8 oen_pin_names_len;
 };
 
 struct rzg2l_dedicated_configs {
@@ -1213,14 +1217,11 @@ static int rzv2h_bias_param_to_hw(enum pin_config_param param)
 
 static u8 rzv2h_pin_to_oen_bit(struct rzg2l_pinctrl *pctrl, unsigned int _pin)
 {
-	static const char * const pin_names[] = { "ET0_TXC_TXCLK", "ET1_TXC_TXCLK",
-						  "XSPI0_RESET0N", "XSPI0_CS0N",
-						  "XSPI0_CKN", "XSPI0_CKP" };
 	const struct pinctrl_pin_desc *pin_desc = &pctrl->desc.pins[_pin];
 	unsigned int i;
 
-	for (i = 0; i < ARRAY_SIZE(pin_names); i++) {
-		if (!strcmp(pin_desc->name, pin_names[i]))
+	for (i = 0; i < pctrl->data->hwcfg->oen_pin_names_len; i++) {
+		if (!strcmp(pin_desc->name, pctrl->data->hwcfg->oen_pin_names[i]))
 			return i;
 	}
 
@@ -3277,11 +3278,18 @@ static const struct rzg2l_hwcfg rzg3s_hwcfg = {
 	.oen_max_port = 7, /* P7_1 is the maximum OEN port. */
 };
 
+static const char * const rzv2h_oen_pin_names[] = {
+	"ET0_TXC_TXCLK", "ET1_TXC_TXCLK", "XSPI0_RESET0N", "XSPI0_CS0N",
+	"XSPI0_CKN", "XSPI0_CKP"
+};
+
 static const struct rzg2l_hwcfg rzv2h_hwcfg = {
 	.regs = {
 		.pwpr = 0x3c04,
 	},
 	.tint_start_index = 17,
+	.oen_pin_names = rzv2h_oen_pin_names,
+	.oen_pin_names_len = ARRAY_SIZE(rzv2h_oen_pin_names),
 };
 
 static struct rzg2l_pinctrl_data r9a07g043_data = {
-- 
2.25.1


