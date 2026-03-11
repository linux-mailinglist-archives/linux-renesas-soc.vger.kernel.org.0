Return-Path: <linux-renesas-soc+bounces-29214-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id +LK5Dp2EsWmjCwAAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-29214-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 11 Mar 2026 16:05:01 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id B5DC9265FB3
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 11 Mar 2026 16:05:00 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id E9B473048B2B
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 11 Mar 2026 14:58:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A3F2C344DB7;
	Wed, 11 Mar 2026 14:58:12 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8BA4428000F
	for <linux-renesas-soc@vger.kernel.org>; Wed, 11 Mar 2026 14:58:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773241092; cv=none; b=lJaN9Dzf6m0JnjNm/d79RexuNp94MUUXsTlNx4YOw9mtOx1DdfKPeDqCPJkZ66Gqbbx4WSPM9CRruwhVv92JxzdRQrQsx1+9wGr+jLkumSPn4/sTjUuSYt2atXHvZwTYuBPVLfBCWUBR7ZEHArU2o+4ChkVPVkzO93VKLkHhl4A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773241092; c=relaxed/simple;
	bh=x+69OvlsC3W4IsTFqwQ8NuafbHViL9ICwh/vnOJg3to=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=JgJ74WDfAJEfxIFRH9w6WgftEXtBsZCB+Fn3Wgd/E2dYMqDQ8tBEOCRi2JouJZz5iP60C+pagNIhUUcIJMEYHzuiNCXy/k/YLY8hBshGc3t18MfIoXw0STWp+16L3mteJy4QXCikOS7SpRtiqJTqh64B9Z5bd0XncLtvxRbVo0I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BA66BC4CEF7;
	Wed, 11 Mar 2026 14:58:10 +0000 (UTC)
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	=?UTF-8?q?Herv=C3=A9=20Codina?= <herve.codina@bootlin.com>,
	Magnus Damm <magnus.damm@gmail.com>
Cc: linux-renesas-soc@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH] ARM: dts: renesas: r9a06g032-rzn1d400-db: Do not use underscores in node names
Date: Wed, 11 Mar 2026 15:58:07 +0100
Message-ID: <1c1fc11f1f183a8e72f168bf6eb35a40e01ecacb.1773240961.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [0.54 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-29214-lists,linux-renesas-soc=lfdr.de,renesas];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FREEMAIL_TO(0.00)[sang-engineering.com,bootlin.com,gmail.com];
	DMARC_NA(0.00)[glider.be];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[geert@glider.be,linux-renesas-soc@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-0.989];
	RCPT_COUNT_SEVEN(0.00)[7];
	R_DKIM_NA(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,glider.be:email,glider.be:mid]
X-Rspamd-Queue-Id: B5DC9265FB3
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Node names should not contain underscores; replace them by hyphens.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
To be queued in renesas-devel for v7.1.

 arch/arm/boot/dts/renesas/r9a06g032-rzn1d400-db.dts | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/arch/arm/boot/dts/renesas/r9a06g032-rzn1d400-db.dts b/arch/arm/boot/dts/renesas/r9a06g032-rzn1d400-db.dts
index b720c001e77680a9..d0956950472c1fde 100644
--- a/arch/arm/boot/dts/renesas/r9a06g032-rzn1d400-db.dts
+++ b/arch/arm/boot/dts/renesas/r9a06g032-rzn1d400-db.dts
@@ -237,13 +237,13 @@ &pinctrl {
 	pinctrl-names = "default";
 	pinctrl-0 = <&pins_cpld>;
 
-	pins_can0: pins_can0 {
+	pins_can0: pins-can0 {
 		pinmux = <RZN1_PINMUX(162, RZN1_FUNC_CAN)>,	/* CAN0_TXD */
 			 <RZN1_PINMUX(163, RZN1_FUNC_CAN)>;	/* CAN0_RXD */
 		drive-strength = <6>;
 	};
 
-	pins_can1: pins_can1 {
+	pins_can1: pins-can1 {
 		pinmux = <RZN1_PINMUX(109, RZN1_FUNC_CAN)>,	/* CAN1_TXD */
 			 <RZN1_PINMUX(110, RZN1_FUNC_CAN)>;	/* CAN1_RXD */
 		drive-strength = <6>;
@@ -256,7 +256,7 @@ pins_cpld: pins-cpld {
 			 <RZN1_PINMUX(122, RZN1_FUNC_USB)>;
 	};
 
-	pins_eth3: pins_eth3 {
+	pins_eth3: pins-eth3 {
 		pinmux = <RZN1_PINMUX(36, RZN1_FUNC_CLK_ETH_MII_RGMII_RMII)>,
 			 <RZN1_PINMUX(37, RZN1_FUNC_CLK_ETH_MII_RGMII_RMII)>,
 			 <RZN1_PINMUX(38, RZN1_FUNC_CLK_ETH_MII_RGMII_RMII)>,
@@ -273,7 +273,7 @@ pins_eth3: pins_eth3 {
 		bias-disable;
 	};
 
-	pins_eth4: pins_eth4 {
+	pins_eth4: pins-eth4 {
 		pinmux = <RZN1_PINMUX(48, RZN1_FUNC_CLK_ETH_MII_RGMII_RMII)>,
 			 <RZN1_PINMUX(49, RZN1_FUNC_CLK_ETH_MII_RGMII_RMII)>,
 			 <RZN1_PINMUX(50, RZN1_FUNC_CLK_ETH_MII_RGMII_RMII)>,
@@ -290,13 +290,13 @@ pins_eth4: pins_eth4 {
 		bias-disable;
 	};
 
-	pins_i2c2: pins_i2c2 {
+	pins_i2c2: pins-i2c2 {
 		pinmux = <RZN1_PINMUX(115, RZN1_FUNC_I2C)>,
 			 <RZN1_PINMUX(116, RZN1_FUNC_I2C)>;
 		drive-strength = <12>;
 	};
 
-	pins_mdio1: pins_mdio1 {
+	pins_mdio1: pins-mdio1 {
 		pinmux = <RZN1_PINMUX(152, RZN1_FUNC_MDIO1_SWITCH)>,
 			 <RZN1_PINMUX(153, RZN1_FUNC_MDIO1_SWITCH)>;
 	};
-- 
2.43.0


