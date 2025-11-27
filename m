Return-Path: <linux-renesas-soc+bounces-25267-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 77A21C8E622
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 27 Nov 2025 14:13:21 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 6472C4E16B6
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 27 Nov 2025 13:13:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7E36922F74D;
	Thu, 27 Nov 2025 13:13:18 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6552B194AD7
	for <linux-renesas-soc@vger.kernel.org>; Thu, 27 Nov 2025 13:13:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764249198; cv=none; b=WNtbuj0pJkvJ+pPbZwUfnYVg0+fzbokGst9UkMBgqDftKS/X99NrsSHcEWFmwMJIFDV/NydJPneUBOjXaHIlgM20cz+uxIjY1th5UcZIPqDNnAS2vMxZ8mvHiP/ZUkImNPyJBnPyHn2UIEqUAYLlKtt+ldWnxHj11cYtf0vsSlI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764249198; c=relaxed/simple;
	bh=azd8cbFw6AwactdXvZZYwpczjoayEdmnN9HbZ7U7drE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=cT7QgXGF1IK7ch+7Uj179Qmr9KRS+5ZUdubc8inzOt1WYHSYogB5MZ8C48CIGBeHtCSJGafQBTvC2w3gCnqj6b+Ml2/x9arQvYAmD8ZtnAT8gMFljneELfwFHQB8GmIXaIvMrBW2uI3Z/aveiLYyGaz+tHapxMibn2KbjgkaJgc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B0790C4CEF8;
	Thu, 27 Nov 2025 13:13:16 +0000 (UTC)
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: =?UTF-8?q?Cl=C3=A9ment=20L=C3=A9ger?= <clement.leger@bootlin.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Magnus Damm <magnus.damm@gmail.com>
Cc: linux-renesas-soc@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH] ARM: dts: renesas: r9a06g032: Add Ethernet switch interrupts
Date: Thu, 27 Nov 2025 14:13:13 +0100
Message-ID: <53d45eed3709cba589a4ef3e9ad198d7e44fd9a5.1764249063.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The Ethernet switch device node still lacks interrupts.  Add them.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
"[PATCH net-next 04/11] dt-bindings: net: dsa: renesas,rzn1-a5psw: Add
RZ/T2H and RZ/N2H ETHSW support"[1] will make interrupts and
interrupts-names required.

Based on the example in the DT bindings[2], Compile-tested only.
To be queued in renesas-devel for v6.20.

[1] https://lore.kernel.org/20251121113553.2955854-5-prabhakar.mahadev-lad.rj@bp.renesas.com
[2] Documentation/devicetree/bindings/net/dsa/renesas,rzn1-a5psw.yaml
---
 arch/arm/boot/dts/renesas/r9a06g032.dtsi | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/arch/arm/boot/dts/renesas/r9a06g032.dtsi b/arch/arm/boot/dts/renesas/r9a06g032.dtsi
index 71d655b0565af1a5..5530eb9e891fa45c 100644
--- a/arch/arm/boot/dts/renesas/r9a06g032.dtsi
+++ b/arch/arm/boot/dts/renesas/r9a06g032.dtsi
@@ -453,6 +453,12 @@ switch: switch@44050000 {
 				 <&sysctrl R9A06G032_CLK_SWITCH>;
 			clock-names = "hclk", "clk";
 			power-domains = <&sysctrl>;
+			interrupts = <GIC_SPI 40 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 42 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 43 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 44 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 45 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-names = "dlr", "switch", "prp", "hub", "ptrn";
 			status = "disabled";
 
 			ethernet-ports {
-- 
2.43.0


