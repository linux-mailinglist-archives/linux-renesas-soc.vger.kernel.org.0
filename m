Return-Path: <linux-renesas-soc+bounces-2591-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id DA4DD8509A0
	for <lists+linux-renesas-soc@lfdr.de>; Sun, 11 Feb 2024 15:31:07 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 80A901F21BB6
	for <lists+linux-renesas-soc@lfdr.de>; Sun, 11 Feb 2024 14:31:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EB80A1E519;
	Sun, 11 Feb 2024 14:31:03 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from michel.telenet-ops.be (michel.telenet-ops.be [195.130.137.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B9722570
	for <linux-renesas-soc@vger.kernel.org>; Sun, 11 Feb 2024 14:31:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.130.137.88
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707661863; cv=none; b=C7Lmtv/yrWkj/TKuvTsNHDbYD2ujgm7LkPtoP4RPF0GhsVaWVWJVrsFOKeHW6vhXnojvnOmZMZBFtgnBLyLO1Bd4zUhyWSxtkXlA4yDCTK6quWkE3B1DAXOBJERPFq9VEKHysCw/aT96HHozXh4u03zNnqQhqrfnc7qIbY0sjms=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707661863; c=relaxed/simple;
	bh=XEEoRYisx7ifXpPEg8mrSb/ndQgT3QQwlgrN2E7Djjk=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=Gff1Ta/pNM+Uy60NFuc0zcDm9YXe+c8v3huLvwY4wE84h8OYQhTcdCYN7dvYAWy0rhRFwwpB5EgU5E0z2weWXpyNKNe+mhRgX32PVuDMnssyCyUlg7+V5yuU5oetnsEN9ot4yAMlewf22gjXqMUNSTN+uFnNTe18M+j8OuzSdwA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=glider.be; spf=none smtp.mailfrom=linux-m68k.org; arc=none smtp.client-ip=195.130.137.88
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=glider.be
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux-m68k.org
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed40:5c16:aeff:e73f:ad67])
	by michel.telenet-ops.be with bizsmtp
	id lqWz2B00A493aJM06qWzUW; Sun, 11 Feb 2024 15:31:00 +0100
Received: from rox.of.borg ([192.168.97.57])
	by ramsan.of.borg with esmtp (Exim 4.95)
	(envelope-from <geert@linux-m68k.org>)
	id 1rZAr8-000Qhi-Hs;
	Sun, 11 Feb 2024 15:30:59 +0100
Received: from geert by rox.of.borg with local (Exim 4.95)
	(envelope-from <geert@linux-m68k.org>)
	id 1rZArD-006Wul-H9;
	Sun, 11 Feb 2024 15:30:59 +0100
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: linux-renesas-soc@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org,
	Thanh Quan <thanh.quan.xn@renesas.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH 2/2] arm64: dts: renesas: gray-hawk-single: Add Ethernet support
Date: Sun, 11 Feb 2024 15:30:46 +0100
Message-Id: <b83b21b6477a0e31f99eaedbd36c03014b72ec8a.1707661382.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1707661382.git.geert+renesas@glider.be>
References: <cover.1707661382.git.geert+renesas@glider.be>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Thanh Quan <thanh.quan.xn@renesas.com>

Describe the wiring of the first Ethernet AVB instance to the Micrel
KSZ9031RNXVB PHY.

Signed-off-by: Thanh Quan <thanh.quan.xn@renesas.com>
Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
Changes compared to the BSP:
  - Split in separate commits for SoC and board support,
  - Apply to r8a779h0-gray-hawk-single.dts.
---
 .../dts/renesas/r8a779h0-gray-hawk-single.dts | 37 +++++++++++++++++++
 1 file changed, 37 insertions(+)

diff --git a/arch/arm64/boot/dts/renesas/r8a779h0-gray-hawk-single.dts b/arch/arm64/boot/dts/renesas/r8a779h0-gray-hawk-single.dts
index 1bee27b2284d2eee..625e7448bc9fc1ce 100644
--- a/arch/arm64/boot/dts/renesas/r8a779h0-gray-hawk-single.dts
+++ b/arch/arm64/boot/dts/renesas/r8a779h0-gray-hawk-single.dts
@@ -15,6 +15,7 @@ / {
 
 	aliases {
 		serial0 = &hscif0;
+		ethernet0 = &avb0;
 	};
 
 	chosen {
@@ -34,6 +35,24 @@ memory@480000000 {
 	};
 };
 
+&avb0 {
+	pinctrl-0 = <&avb0_pins>;
+	pinctrl-names = "default";
+	phy-handle = <&phy0>;
+	tx-internal-delay-ps = <2000>;
+	status = "okay";
+
+	phy0: ethernet-phy@0 {
+		compatible = "ethernet-phy-id0022.1622",
+			     "ethernet-phy-ieee802.3-c22";
+		rxc-skew-ps = <1500>;
+		reg = <0>;
+		interrupt-parent = <&gpio7>;
+		interrupts = <5 IRQ_TYPE_LEVEL_LOW>;
+		reset-gpios = <&gpio7 10 GPIO_ACTIVE_LOW>;
+	};
+};
+
 &extal_clk {
 	clock-frequency = <16666666>;
 };
@@ -90,6 +109,24 @@ &pfc {
 	pinctrl-0 = <&scif_clk_pins>;
 	pinctrl-names = "default";
 
+	avb0_pins: avb0 {
+		mux {
+			groups = "avb0_link", "avb0_mdio", "avb0_rgmii",
+				 "avb0_txcrefclk";
+			function = "avb0";
+		};
+
+		pins_mdio {
+			groups = "avb0_mdio";
+			drive-strength = <21>;
+		};
+
+		pins_mii {
+			groups = "avb0_rgmii";
+			drive-strength = <21>;
+		};
+	};
+
 	hscif0_pins: hscif0 {
 		groups = "hscif0_data", "hscif0_ctrl";
 		function = "hscif0";
-- 
2.34.1


