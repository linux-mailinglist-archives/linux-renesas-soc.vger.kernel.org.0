Return-Path: <linux-renesas-soc+bounces-22595-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 3AD4CBB42F2
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 02 Oct 2025 16:41:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B890A19E2E8D
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  2 Oct 2025 14:41:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B53E13115B5;
	Thu,  2 Oct 2025 14:40:58 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D0042C027F
	for <linux-renesas-soc@vger.kernel.org>; Thu,  2 Oct 2025 14:40:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759416058; cv=none; b=HLGQUgyc9PZ6r40VDOVmBsjLTeLU68GeQ0FQ3JQQesdTsevWliOHUmjP/i6AT7Qp0zJ6GlBg76B3GH3C0Fy+UAUxAXgNxZESY00vFNf5L9MmgrKf5Ghg4SbsI1z/JRICIfdIARcPzSGOXpzunKyehy3EM22BOihq/CcLnIjjqds=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759416058; c=relaxed/simple;
	bh=PKlmKOQSPSj/WPBr5hNwvo3usQkBv4uhGwGOCnQFrlQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=SMj8JH54DyHBqsQj3KJZK4yvsCPJHqL/hSrrwv0Q14PH337rJuDwLQSZO6tDi5gD6zbElYgNzUGrYrPOmyi0xNbj863vFy9fV45xmu5FDbf6GlyvqIOpfEav5zb6t7/V1EMLbtfMJXxhubO408auQmRnk/5voFtvhsKVCmpwJ5M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 68763C4CEFC;
	Thu,  2 Oct 2025 14:40:57 +0000 (UTC)
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Magnus Damm <magnus.damm@gmail.com>,
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc: linux-arm-kernel@lists.infradead.org,
	linux-renesas-soc@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH 06/13] ARM: dts: renesas: r8a7745: Move interrupt-parent to root node
Date: Thu,  2 Oct 2025 16:40:34 +0200
Message-ID: <fc23a6b5b7c8d92334089770854535f088201d58.1759414774.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1759414774.git.geert+renesas@glider.be>
References: <cover.1759414774.git.geert+renesas@glider.be>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Move the "interrupt-parent = <&gic>" property from the soc node to the
root node, and simplify "interrupts-extended = <&gic ...>" to
"interrupts = <...>".

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
 arch/arm/boot/dts/renesas/r8a7745.dtsi | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/arch/arm/boot/dts/renesas/r8a7745.dtsi b/arch/arm/boot/dts/renesas/r8a7745.dtsi
index 704fa6f3cbd088e5..5424a73562ddba3c 100644
--- a/arch/arm/boot/dts/renesas/r8a7745.dtsi
+++ b/arch/arm/boot/dts/renesas/r8a7745.dtsi
@@ -14,6 +14,7 @@ / {
 	compatible = "renesas,r8a7745";
 	#address-cells = <2>;
 	#size-cells = <2>;
+	interrupt-parent = <&gic>;
 
 	aliases {
 		i2c0 = &i2c0;
@@ -105,8 +106,8 @@ extal_clk: extal {
 
 	pmu {
 		compatible = "arm,cortex-a7-pmu";
-		interrupts-extended = <&gic GIC_SPI 82 IRQ_TYPE_LEVEL_HIGH>,
-				      <&gic GIC_SPI 83 IRQ_TYPE_LEVEL_HIGH>;
+		interrupts = <GIC_SPI 82 IRQ_TYPE_LEVEL_HIGH>,
+			     <GIC_SPI 83 IRQ_TYPE_LEVEL_HIGH>;
 		interrupt-affinity = <&cpu0>, <&cpu1>;
 	};
 
@@ -120,7 +121,6 @@ scif_clk: scif {
 
 	soc {
 		compatible = "simple-bus";
-		interrupt-parent = <&gic>;
 
 		#address-cells = <2>;
 		#size-cells = <2>;
@@ -1631,10 +1631,10 @@ cmt1: timer@e6130000 {
 
 	timer {
 		compatible = "arm,armv7-timer";
-		interrupts-extended = <&gic GIC_PPI 13 (GIC_CPU_MASK_SIMPLE(2) | IRQ_TYPE_LEVEL_LOW)>,
-				      <&gic GIC_PPI 14 (GIC_CPU_MASK_SIMPLE(2) | IRQ_TYPE_LEVEL_LOW)>,
-				      <&gic GIC_PPI 11 (GIC_CPU_MASK_SIMPLE(2) | IRQ_TYPE_LEVEL_LOW)>,
-				      <&gic GIC_PPI 10 (GIC_CPU_MASK_SIMPLE(2) | IRQ_TYPE_LEVEL_LOW)>;
+		interrupts = <GIC_PPI 13 (GIC_CPU_MASK_SIMPLE(2) | IRQ_TYPE_LEVEL_LOW)>,
+			     <GIC_PPI 14 (GIC_CPU_MASK_SIMPLE(2) | IRQ_TYPE_LEVEL_LOW)>,
+			     <GIC_PPI 11 (GIC_CPU_MASK_SIMPLE(2) | IRQ_TYPE_LEVEL_LOW)>,
+			     <GIC_PPI 10 (GIC_CPU_MASK_SIMPLE(2) | IRQ_TYPE_LEVEL_LOW)>;
 		interrupt-names = "sec-phys", "phys", "virt", "hyp-phys";
 	};
 
-- 
2.43.0


