Return-Path: <linux-renesas-soc+bounces-22593-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id A31E6BB42F0
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 02 Oct 2025 16:40:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 67A36326B39
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  2 Oct 2025 14:40:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 22CBD2EC08E;
	Thu,  2 Oct 2025 14:40:56 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A2FC2C027F
	for <linux-renesas-soc@vger.kernel.org>; Thu,  2 Oct 2025 14:40:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759416056; cv=none; b=G7CCmz9bWnEUo6IJnqeheC1cHf3xsMTHkzyDx91trz9Er0U9Wh/RBwyvT8aHxHTvLawoO8B+3LbBSzbSWhBa1C9vkxv5pdG6ixZMFsyfIlPBMRIIHgrSYtSwLd0z3EoipFX48VwQo9aOLIgs8amZ8goTRU+yi703C9LMxjfNVAI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759416056; c=relaxed/simple;
	bh=aZ5B2MXabTeO9+IkheRs+9bDPEFyqbRViYFvzzV5EsQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=UNfTlthWB5qnd31iTlkldcE1vnIYiYPpHbLMvFZWXk2N6RrQhh/dLGdxbsq5DCClUIUtiTmjZC5FmfsgzqHUOqjyVtwK7Xb7IipMGinTVRD8N5SSb2wYA7JWTSW9mmtRQRJ3q7b7Y9Yv2NxBHxcpQSdOFM7jFS5DR3vL6MwTevc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5A41CC4CEFD;
	Thu,  2 Oct 2025 14:40:54 +0000 (UTC)
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Magnus Damm <magnus.damm@gmail.com>,
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc: linux-arm-kernel@lists.infradead.org,
	linux-renesas-soc@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH 04/13] ARM: dts: renesas: r8a7743: Move interrupt-parent to root node
Date: Thu,  2 Oct 2025 16:40:32 +0200
Message-ID: <0c96651b9b7307cad03c42da88e4115629c5ae60.1759414774.git.geert+renesas@glider.be>
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
 arch/arm/boot/dts/renesas/r8a7743.dtsi | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/arch/arm/boot/dts/renesas/r8a7743.dtsi b/arch/arm/boot/dts/renesas/r8a7743.dtsi
index 58a06cf37784c381..c697942387e1d594 100644
--- a/arch/arm/boot/dts/renesas/r8a7743.dtsi
+++ b/arch/arm/boot/dts/renesas/r8a7743.dtsi
@@ -14,6 +14,7 @@ / {
 	compatible = "renesas,r8a7743";
 	#address-cells = <2>;
 	#size-cells = <2>;
+	interrupt-parent = <&gic>;
 
 	/*
 	 * The external audio clocks are configured as 0 Hz fixed frequency
@@ -115,8 +116,8 @@ pcie_bus_clk: pcie_bus {
 
 	pmu {
 		compatible = "arm,cortex-a15-pmu";
-		interrupts-extended = <&gic GIC_SPI 72 IRQ_TYPE_LEVEL_HIGH>,
-				      <&gic GIC_SPI 73 IRQ_TYPE_LEVEL_HIGH>;
+		interrupts = <GIC_SPI 72 IRQ_TYPE_LEVEL_HIGH>,
+			     <GIC_SPI 73 IRQ_TYPE_LEVEL_HIGH>;
 		interrupt-affinity = <&cpu0>, <&cpu1>;
 	};
 
@@ -130,7 +131,6 @@ scif_clk: scif {
 
 	soc {
 		compatible = "simple-bus";
-		interrupt-parent = <&gic>;
 
 		#address-cells = <2>;
 		#size-cells = <2>;
@@ -1841,10 +1841,10 @@ cooling-maps {
 
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


