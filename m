Return-Path: <linux-renesas-soc+bounces-8680-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 38BE996AD5F
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  4 Sep 2024 02:34:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 62EBA1C216B7
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  4 Sep 2024 00:34:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C2F6410F7;
	Wed,  4 Sep 2024 00:34:23 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from relmlie5.idc.renesas.com (relmlor1.renesas.com [210.160.252.171])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9DF6C1FA5
	for <linux-renesas-soc@vger.kernel.org>; Wed,  4 Sep 2024 00:34:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=210.160.252.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725410063; cv=none; b=GxBuwM0ZlDiocyMXbVzEbwjZ19XY5cCFMhfOwWxik5mRN9wjcFg2HQiBIFpe4E2tYFURyan1re0FVpL8yQba3qQH2n9o4TC01RzQGfZFB/PQCwLF5NvapAiODt2ZlO3Shpd318S/w4wA2Z97GP/CVUfYR4kO24FMfUK/9z6BdMw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725410063; c=relaxed/simple;
	bh=dIQlnqbEXdQBWI9mheFFrQ1Wu57rLJhB+1DuQcjkCSA=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=haf4u4+j6I4v2kkSQ4/ZJlu7f6NLNTJojIXtNzBX255t+8dNWZl3MXN0AfsvdbLKsz1Tcwi06KFqhd5QU/ypkUqdVp6bhfdt/OERhbU74qKaMgUet5jcB9vWkvlJwwCeI9LbAO6myq1q284flWm1Mj9hCk8/kQEClWqDxar2pCQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; arc=none smtp.client-ip=210.160.252.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
X-IronPort-AV: E=Sophos;i="6.10,200,1719846000"; 
   d="scan'208";a="217429960"
Received: from unknown (HELO relmlir5.idc.renesas.com) ([10.200.68.151])
  by relmlie5.idc.renesas.com with ESMTP; 04 Sep 2024 09:34:12 +0900
Received: from localhost.localdomain (unknown [10.166.13.99])
	by relmlir5.idc.renesas.com (Postfix) with ESMTP id 269184003FB8;
	Wed,  4 Sep 2024 09:34:12 +0900 (JST)
From: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
To: geert+renesas@glider.be,
	magnus.damm@gmail.com
Cc: linux-renesas-soc@vger.kernel.org,
	Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Subject: [PATCH 2/2] arm64: dts: renesas: r8a779h0: gray-hawk-single: Enable PCIe Host
Date: Wed,  4 Sep 2024 09:34:09 +0900
Message-Id: <20240904003409.1578212-3-yoshihiro.shimoda.uh@renesas.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240904003409.1578212-1-yoshihiro.shimoda.uh@renesas.com>
References: <20240904003409.1578212-1-yoshihiro.shimoda.uh@renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Enable PCIe Host controller on R-Car V4M Gray Hawk board.

Signed-off-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
---
 .../dts/renesas/r8a779h0-gray-hawk-single.dts | 29 +++++++++++++++++++
 1 file changed, 29 insertions(+)

diff --git a/arch/arm64/boot/dts/renesas/r8a779h0-gray-hawk-single.dts b/arch/arm64/boot/dts/renesas/r8a779h0-gray-hawk-single.dts
index 9a1917b87f61..a5faff87aa26 100644
--- a/arch/arm64/boot/dts/renesas/r8a779h0-gray-hawk-single.dts
+++ b/arch/arm64/boot/dts/renesas/r8a779h0-gray-hawk-single.dts
@@ -126,6 +126,12 @@ memory@480000000 {
 		reg = <0x4 0x80000000 0x1 0x80000000>;
 	};
 
+	pcie_clk: clk-9fgv0841-pci {
+		compatible = "fixed-clock";
+		clock-frequency = <100000000>;
+		#clock-cells = <0>;
+	};
+
 	reg_1p8v: regulator-1p8v {
 			compatible = "regulator-fixed";
 			regulator-name = "fixed-1.8V";
@@ -240,6 +246,17 @@ &i2c0 {
 	status = "okay";
 	clock-frequency = <400000>;
 
+	io_expander_a: gpio@20 {
+		compatible = "onnn,pca9654";
+		reg = <0x20>;
+		interrupt-parent = <&gpio0>;
+		interrupts = <0 IRQ_TYPE_LEVEL_LOW>;
+		gpio-controller;
+		#gpio-cells = <2>;
+		interrupt-controller;
+		#interrupt-cells = <2>;
+	};
+
 	eeprom@50 {
 		compatible = "rohm,br24g01", "atmel,24c01";
 		label = "cpu-board";
@@ -309,6 +326,18 @@ &mmc0 {
 	status = "okay";
 };
 
+&pcie0_clkref {
+	compatible = "gpio-gate-clock";
+	clocks = <&pcie_clk>;
+	enable-gpios = <&gpio4 21 GPIO_ACTIVE_LOW>;
+	/delete-property/ clock-frequency;
+};
+
+&pciec0 {
+	reset-gpio = <&io_expander_a 0 GPIO_ACTIVE_LOW>;
+	status = "okay";
+};
+
 &pfc {
 	pinctrl-0 = <&scif_clk_pins>, <&scif_clk2_pins>;
 	pinctrl-names = "default";
-- 
2.25.1


