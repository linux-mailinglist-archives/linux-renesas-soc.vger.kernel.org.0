Return-Path: <linux-renesas-soc+bounces-22597-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 748C0BB42F4
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 02 Oct 2025 16:41:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 1B6073C6095
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  2 Oct 2025 14:41:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 363ED2EC08E;
	Thu,  2 Oct 2025 14:41:02 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E0BC2C027F
	for <linux-renesas-soc@vger.kernel.org>; Thu,  2 Oct 2025 14:41:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759416062; cv=none; b=iS2lzr0zBxQhPl/G6O368I1WyhRc9/pAQ/+vXAgyVE2EzAHEyF2a/90dy6shJ9OfGW9WSMlYd3/16nIb4mvpOLIgvgHCynLOi30DuVgvq0GeMod8eu/FkK5Htzcelw5dMq2jLeY7Xec8q6mXswaDLMdIMRVgd70NwvX3mcrzNzA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759416062; c=relaxed/simple;
	bh=77bq5oFhuxAq5vTsbWz9cqCYEPGWJ6ZLfZPObAHKsx4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ufsN5u9htoKX1ffTVBFaKQaC4FN1dm5zY6Rb566Qycb77RKTfMWCNG8w5UsTLc/T7hUtjxW9ce74UrMtwuvhUfWl2VOGHK0UIbPVW6b0RcbHs1VMaZC0SZ3r+Kzt+lNwuzMYvrE7r2h7sY6nXyjRwZ7vOPkLv/KNaAEA2TRJhZg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 68B8DC4CEFB;
	Thu,  2 Oct 2025 14:41:00 +0000 (UTC)
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Magnus Damm <magnus.damm@gmail.com>,
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc: linux-arm-kernel@lists.infradead.org,
	linux-renesas-soc@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH 08/13] ARM: dts: renesas: r8a7790: Move interrupt-parent to root node
Date: Thu,  2 Oct 2025 16:40:36 +0200
Message-ID: <d98bdf49a93db0e17a73b9be6cae5cbc8da76488.1759414774.git.geert+renesas@glider.be>
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
 arch/arm/boot/dts/renesas/r8a7790.dtsi | 26 +++++++++++++-------------
 1 file changed, 13 insertions(+), 13 deletions(-)

diff --git a/arch/arm/boot/dts/renesas/r8a7790.dtsi b/arch/arm/boot/dts/renesas/r8a7790.dtsi
index 4f97c09dbc9fe957..12cce9bdc44991b7 100644
--- a/arch/arm/boot/dts/renesas/r8a7790.dtsi
+++ b/arch/arm/boot/dts/renesas/r8a7790.dtsi
@@ -16,6 +16,7 @@ / {
 	compatible = "renesas,r8a7790";
 	#address-cells = <2>;
 	#size-cells = <2>;
+	interrupt-parent = <&gic>;
 
 	aliases {
 		i2c0 = &i2c0;
@@ -239,19 +240,19 @@ pcie_bus_clk: pcie_bus {
 
 	pmu-0 {
 		compatible = "arm,cortex-a15-pmu";
-		interrupts-extended = <&gic GIC_SPI 72 IRQ_TYPE_LEVEL_HIGH>,
-				      <&gic GIC_SPI 73 IRQ_TYPE_LEVEL_HIGH>,
-				      <&gic GIC_SPI 74 IRQ_TYPE_LEVEL_HIGH>,
-				      <&gic GIC_SPI 75 IRQ_TYPE_LEVEL_HIGH>;
+		interrupts = <GIC_SPI 72 IRQ_TYPE_LEVEL_HIGH>,
+			     <GIC_SPI 73 IRQ_TYPE_LEVEL_HIGH>,
+			     <GIC_SPI 74 IRQ_TYPE_LEVEL_HIGH>,
+			     <GIC_SPI 75 IRQ_TYPE_LEVEL_HIGH>;
 		interrupt-affinity = <&cpu0>, <&cpu1>, <&cpu2>, <&cpu3>;
 	};
 
 	pmu-1 {
 		compatible = "arm,cortex-a7-pmu";
-		interrupts-extended = <&gic GIC_SPI 82 IRQ_TYPE_LEVEL_HIGH>,
-				      <&gic GIC_SPI 83 IRQ_TYPE_LEVEL_HIGH>,
-				      <&gic GIC_SPI 84 IRQ_TYPE_LEVEL_HIGH>,
-				      <&gic GIC_SPI 85 IRQ_TYPE_LEVEL_HIGH>;
+		interrupts = <GIC_SPI 82 IRQ_TYPE_LEVEL_HIGH>,
+			     <GIC_SPI 83 IRQ_TYPE_LEVEL_HIGH>,
+			     <GIC_SPI 84 IRQ_TYPE_LEVEL_HIGH>,
+			     <GIC_SPI 85 IRQ_TYPE_LEVEL_HIGH>;
 		interrupt-affinity = <&cpu4>, <&cpu5>, <&cpu6>, <&cpu7>;
 	};
 
@@ -265,7 +266,6 @@ scif_clk: scif {
 
 	soc {
 		compatible = "simple-bus";
-		interrupt-parent = <&gic>;
 		bootph-all;
 
 		#address-cells = <2>;
@@ -2012,10 +2012,10 @@ cooling-maps {
 
 	timer {
 		compatible = "arm,armv7-timer";
-		interrupts-extended = <&gic GIC_PPI 13 (GIC_CPU_MASK_SIMPLE(8) | IRQ_TYPE_LEVEL_LOW)>,
-				      <&gic GIC_PPI 14 (GIC_CPU_MASK_SIMPLE(8) | IRQ_TYPE_LEVEL_LOW)>,
-				      <&gic GIC_PPI 11 (GIC_CPU_MASK_SIMPLE(8) | IRQ_TYPE_LEVEL_LOW)>,
-				      <&gic GIC_PPI 10 (GIC_CPU_MASK_SIMPLE(8) | IRQ_TYPE_LEVEL_LOW)>;
+		interrupts = <GIC_PPI 13 (GIC_CPU_MASK_SIMPLE(8) | IRQ_TYPE_LEVEL_LOW)>,
+			     <GIC_PPI 14 (GIC_CPU_MASK_SIMPLE(8) | IRQ_TYPE_LEVEL_LOW)>,
+			     <GIC_PPI 11 (GIC_CPU_MASK_SIMPLE(8) | IRQ_TYPE_LEVEL_LOW)>,
+			     <GIC_PPI 10 (GIC_CPU_MASK_SIMPLE(8) | IRQ_TYPE_LEVEL_LOW)>;
 		interrupt-names = "sec-phys", "phys", "virt", "hyp-phys";
 	};
 
-- 
2.43.0


