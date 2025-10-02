Return-Path: <linux-renesas-soc+bounces-22596-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 33FAFBB42F3
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 02 Oct 2025 16:41:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id C1626188134B
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  2 Oct 2025 14:41:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 74DC12EC08E;
	Thu,  2 Oct 2025 14:41:00 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5CDDA2C027F
	for <linux-renesas-soc@vger.kernel.org>; Thu,  2 Oct 2025 14:41:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759416060; cv=none; b=HW0tm0TEubwpn5Ox1M0+E8N7KDM8sBvBV49lPVLodwIbWK9EEf/F5D9wHlLmJUxv6FWp+vj+mvFOUaq0ILHoMB/90EFLSnLhdRhEb5W1ESFra2NCLD7xEzoN5nO7cAhzvGn5YM3SWrLUzeW6HDkOl0F0LWUWL44Z+MrSoNIBP6w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759416060; c=relaxed/simple;
	bh=ponv3eh9PQqWlR+s1X8ail29jxkOtpEDA39BbTy0YQk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=MQ0T5TVr9ltYZyXJH77gbTahg3NOcv/0V/C2gwzBp+qPGT3vNVig2syBixxLdavmHtwZpRmwjhBtckMtiBPhlI4ipMUPQuQfnnhUSgrkOSiFYNSqgqp2m4M50RVLCoF2CkqZSYVm8h8zYJeGg6+q83nIOdlsG5hlXgXUe5ZX4mc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E4E4EC4CEFD;
	Thu,  2 Oct 2025 14:40:58 +0000 (UTC)
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Magnus Damm <magnus.damm@gmail.com>,
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc: linux-arm-kernel@lists.infradead.org,
	linux-renesas-soc@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH 07/13] ARM: dts: renesas: r8a77470: Move interrupt-parent to root node
Date: Thu,  2 Oct 2025 16:40:35 +0200
Message-ID: <13edb8c780f21366343268a0c8f1ab5d54032c66.1759414774.git.geert+renesas@glider.be>
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
 arch/arm/boot/dts/renesas/r8a77470.dtsi | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/arch/arm/boot/dts/renesas/r8a77470.dtsi b/arch/arm/boot/dts/renesas/r8a77470.dtsi
index a8a12275c98a66c7..c61790e7667f589f 100644
--- a/arch/arm/boot/dts/renesas/r8a77470.dtsi
+++ b/arch/arm/boot/dts/renesas/r8a77470.dtsi
@@ -13,6 +13,7 @@ / {
 	compatible = "renesas,r8a77470";
 	#address-cells = <2>;
 	#size-cells = <2>;
+	interrupt-parent = <&gic>;
 
 	aliases {
 		i2c0 = &i2c0;
@@ -66,8 +67,8 @@ extal_clk: extal {
 
 	pmu {
 		compatible = "arm,cortex-a7-pmu";
-		interrupts-extended = <&gic GIC_SPI 82 IRQ_TYPE_LEVEL_HIGH>,
-				      <&gic GIC_SPI 83 IRQ_TYPE_LEVEL_HIGH>;
+		interrupts = <GIC_SPI 82 IRQ_TYPE_LEVEL_HIGH>,
+			     <GIC_SPI 83 IRQ_TYPE_LEVEL_HIGH>;
 		interrupt-affinity = <&cpu0>, <&cpu1>;
 	};
 
@@ -81,7 +82,6 @@ scif_clk: scif {
 
 	soc {
 		compatible = "simple-bus";
-		interrupt-parent = <&gic>;
 
 		#address-cells = <2>;
 		#size-cells = <2>;
@@ -1057,10 +1057,10 @@ cmt1: timer@e6130000 {
 
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


