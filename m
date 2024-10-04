Return-Path: <linux-renesas-soc+bounces-9399-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id E50C3990413
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  4 Oct 2024 15:27:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 74B711F20F8D
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  4 Oct 2024 13:27:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4BD4C2139DB;
	Fri,  4 Oct 2024 13:22:41 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from baptiste.telenet-ops.be (baptiste.telenet-ops.be [195.130.132.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F8D72141C1
	for <linux-renesas-soc@vger.kernel.org>; Fri,  4 Oct 2024 13:22:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.130.132.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728048161; cv=none; b=RMcbfdub1eZNvMNoemB1JHN4FxPVm41wCU6MPgbfpeunuzRGBuJHCRn+xWQJPNST2XhM6tasEJ57NCRf4U3tqi1df8G/36+AJfScVl564cPPNptdxhULaL5nWlJ9pnMcc0lTYLJl6rrBkMdWfUom2rOP93xnqlUtNAV4Ix5UvpY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728048161; c=relaxed/simple;
	bh=UTaXKNFcV5kJyka6FmennBYK3InD4FV80nrO2FLnDQ4=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=akCYL6zDnvtD6L5I4G0N63qq42Xdo56joZQenjXDXHdS/aAgnpxZvD9sM0UgrBxpp8AygfVq4PCpaOcYEQR3gZdObn2j62epeoD9Zxnp/fQZkjkel6RGidsUr0mhphhePD0ayobLIAVHQJJnuXKFzf0LdJaIqM4lvvJFLDXK61U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=glider.be; spf=none smtp.mailfrom=linux-m68k.org; arc=none smtp.client-ip=195.130.132.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=glider.be
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux-m68k.org
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed80:5518:aeb:d9c0:fc7c])
	by baptiste.telenet-ops.be with cmsmtp
	id LDNd2D00E4NXpdT01DNdjq; Fri, 04 Oct 2024 15:22:37 +0200
Received: from rox.of.borg ([192.168.97.57])
	by ramsan.of.borg with esmtp (Exim 4.95)
	(envelope-from <geert@linux-m68k.org>)
	id 1swiGL-001Em8-7L;
	Fri, 04 Oct 2024 15:22:37 +0200
Received: from geert by rox.of.borg with local (Exim 4.95)
	(envelope-from <geert@linux-m68k.org>)
	id 1swhnu-006yTr-8y;
	Fri, 04 Oct 2024 14:53:06 +0200
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Magnus Damm <magnus.damm@gmail.com>,
	Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: linux-renesas-soc@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH 03/20] ARM: dts: renesas: Use interrupts-extended for HDMI bridges
Date: Fri,  4 Oct 2024 14:52:45 +0200
Message-Id: <850317c7818b100f9afe026e80b6d685affe81a0.1728045620.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1728045620.git.geert+renesas@glider.be>
References: <cover.1728045620.git.geert+renesas@glider.be>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Use the more concise interrupts-extended property to fully describe the
interrupts.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
 arch/arm/boot/dts/renesas/iwg20d-q7-dbcm-ca.dtsi            | 3 +--
 arch/arm/boot/dts/renesas/r8a7745-iwg22d-sodimm-dbhd-ca.dts | 3 +--
 arch/arm/boot/dts/renesas/r8a77470-iwg23s-sbc.dts           | 3 +--
 arch/arm/boot/dts/renesas/r8a7790-lager.dts                 | 3 +--
 arch/arm/boot/dts/renesas/r8a7790-stout.dts                 | 3 +--
 arch/arm/boot/dts/renesas/r8a7791-koelsch.dts               | 3 +--
 arch/arm/boot/dts/renesas/r8a7791-porter.dts                | 3 +--
 arch/arm/boot/dts/renesas/r8a7792-blanche.dts               | 3 +--
 arch/arm/boot/dts/renesas/r8a7793-gose.dts                  | 3 +--
 arch/arm/boot/dts/renesas/r8a7794-silk.dts                  | 3 +--
 10 files changed, 10 insertions(+), 20 deletions(-)

diff --git a/arch/arm/boot/dts/renesas/iwg20d-q7-dbcm-ca.dtsi b/arch/arm/boot/dts/renesas/iwg20d-q7-dbcm-ca.dtsi
index de52218ceaa4c0e0..ca58ea93f58fbbb1 100644
--- a/arch/arm/boot/dts/renesas/iwg20d-q7-dbcm-ca.dtsi
+++ b/arch/arm/boot/dts/renesas/iwg20d-q7-dbcm-ca.dtsi
@@ -73,8 +73,7 @@ &i2c5 {
 	hdmi@39 {
 		compatible = "adi,adv7511w";
 		reg = <0x39>;
-		interrupt-parent = <&gpio0>;
-		interrupts = <13 IRQ_TYPE_LEVEL_LOW>;
+		interrupts-extended = <&gpio0 13 IRQ_TYPE_LEVEL_LOW>;
 		clocks = <&cec_clock>;
 		clock-names = "cec";
 
diff --git a/arch/arm/boot/dts/renesas/r8a7745-iwg22d-sodimm-dbhd-ca.dts b/arch/arm/boot/dts/renesas/r8a7745-iwg22d-sodimm-dbhd-ca.dts
index a0b574398055ad2d..5903c1f1356f26c6 100644
--- a/arch/arm/boot/dts/renesas/r8a7745-iwg22d-sodimm-dbhd-ca.dts
+++ b/arch/arm/boot/dts/renesas/r8a7745-iwg22d-sodimm-dbhd-ca.dts
@@ -84,8 +84,7 @@ &i2c1 {
 	hdmi@39 {
 		compatible = "adi,adv7511w";
 		reg = <0x39>;
-		interrupt-parent = <&gpio1>;
-		interrupts = <0 IRQ_TYPE_LEVEL_LOW>;
+		interrupts-extended = <&gpio1 0 IRQ_TYPE_LEVEL_LOW>;
 		clocks = <&cec_clock>;
 		clock-names = "cec";
 		pd-gpios = <&gpio2 24 GPIO_ACTIVE_HIGH>;
diff --git a/arch/arm/boot/dts/renesas/r8a77470-iwg23s-sbc.dts b/arch/arm/boot/dts/renesas/r8a77470-iwg23s-sbc.dts
index 7c7a9f257567d4f8..e511eb425bc550e9 100644
--- a/arch/arm/boot/dts/renesas/r8a77470-iwg23s-sbc.dts
+++ b/arch/arm/boot/dts/renesas/r8a77470-iwg23s-sbc.dts
@@ -150,8 +150,7 @@ &i2c4 {
 	hdmi@39 {
 		compatible = "sil,sii9022";
 		reg = <0x39>;
-		interrupt-parent = <&gpio2>;
-		interrupts = <29 IRQ_TYPE_LEVEL_LOW>;
+		interrupts-extended = <&gpio2 29 IRQ_TYPE_LEVEL_LOW>;
 
 		ports {
 			#address-cells = <1>;
diff --git a/arch/arm/boot/dts/renesas/r8a7790-lager.dts b/arch/arm/boot/dts/renesas/r8a7790-lager.dts
index 97c13b31f476505c..5ef87f8088c4c81c 100644
--- a/arch/arm/boot/dts/renesas/r8a7790-lager.dts
+++ b/arch/arm/boot/dts/renesas/r8a7790-lager.dts
@@ -365,8 +365,7 @@ adv7180: endpoint {
 		hdmi@39 {
 			compatible = "adi,adv7511w";
 			reg = <0x39>;
-			interrupt-parent = <&gpio1>;
-			interrupts = <15 IRQ_TYPE_LEVEL_LOW>;
+			interrupts-extended = <&gpio1 15 IRQ_TYPE_LEVEL_LOW>;
 			clocks = <&cec_clock>;
 			clock-names = "cec";
 
diff --git a/arch/arm/boot/dts/renesas/r8a7790-stout.dts b/arch/arm/boot/dts/renesas/r8a7790-stout.dts
index 1593609064104ae4..9287724187ef3b69 100644
--- a/arch/arm/boot/dts/renesas/r8a7790-stout.dts
+++ b/arch/arm/boot/dts/renesas/r8a7790-stout.dts
@@ -299,8 +299,7 @@ &iic2	{
 	hdmi@39 {
 		compatible = "adi,adv7511w";
 		reg = <0x39>;
-		interrupt-parent = <&gpio1>;
-		interrupts = <15 IRQ_TYPE_LEVEL_LOW>;
+		interrupts-extended = <&gpio1 15 IRQ_TYPE_LEVEL_LOW>;
 		clocks = <&osc4_clk>;
 		clock-names = "cec";
 
diff --git a/arch/arm/boot/dts/renesas/r8a7791-koelsch.dts b/arch/arm/boot/dts/renesas/r8a7791-koelsch.dts
index 758d8331e7af66c4..bce93db4c9df5e18 100644
--- a/arch/arm/boot/dts/renesas/r8a7791-koelsch.dts
+++ b/arch/arm/boot/dts/renesas/r8a7791-koelsch.dts
@@ -397,8 +397,7 @@ adv7180: endpoint {
 		hdmi@39 {
 			compatible = "adi,adv7511w";
 			reg = <0x39>;
-			interrupt-parent = <&gpio3>;
-			interrupts = <29 IRQ_TYPE_LEVEL_LOW>;
+			interrupts-extended = <&gpio3 29 IRQ_TYPE_LEVEL_LOW>;
 			clocks = <&cec_clock>;
 			clock-names = "cec";
 
diff --git a/arch/arm/boot/dts/renesas/r8a7791-porter.dts b/arch/arm/boot/dts/renesas/r8a7791-porter.dts
index 267b3623655fbc38..92b54e043795ba08 100644
--- a/arch/arm/boot/dts/renesas/r8a7791-porter.dts
+++ b/arch/arm/boot/dts/renesas/r8a7791-porter.dts
@@ -194,8 +194,7 @@ adv7180: endpoint {
 		hdmi@39 {
 			compatible = "adi,adv7511w";
 			reg = <0x39>;
-			interrupt-parent = <&gpio3>;
-			interrupts = <29 IRQ_TYPE_LEVEL_LOW>;
+			interrupts-extended = <&gpio3 29 IRQ_TYPE_LEVEL_LOW>;
 
 			avdd-supply = <&reg_1p8v>;
 			dvdd-supply = <&reg_1p8v>;
diff --git a/arch/arm/boot/dts/renesas/r8a7792-blanche.dts b/arch/arm/boot/dts/renesas/r8a7792-blanche.dts
index 7eefa227d65514a9..69009535814406fe 100644
--- a/arch/arm/boot/dts/renesas/r8a7792-blanche.dts
+++ b/arch/arm/boot/dts/renesas/r8a7792-blanche.dts
@@ -335,8 +335,7 @@ &i2c1 {
 	hdmi@39 {
 		compatible = "adi,adv7511w";
 		reg = <0x39>;
-		interrupt-parent = <&irqc>;
-		interrupts = <3 IRQ_TYPE_EDGE_FALLING>;
+		interrupts-extended = <&irqc 3 IRQ_TYPE_EDGE_FALLING>;
 
 		avdd-supply = <&d1_8v>;
 		dvdd-supply = <&d1_8v>;
diff --git a/arch/arm/boot/dts/renesas/r8a7793-gose.dts b/arch/arm/boot/dts/renesas/r8a7793-gose.dts
index f3f62206088348c6..45ef1d1900245a11 100644
--- a/arch/arm/boot/dts/renesas/r8a7793-gose.dts
+++ b/arch/arm/boot/dts/renesas/r8a7793-gose.dts
@@ -383,8 +383,7 @@ adv7180_out: endpoint {
 		hdmi@39 {
 			compatible = "adi,adv7511w";
 			reg = <0x39>;
-			interrupt-parent = <&gpio3>;
-			interrupts = <29 IRQ_TYPE_LEVEL_LOW>;
+			interrupts-extended = <&gpio3 29 IRQ_TYPE_LEVEL_LOW>;
 
 			avdd-supply = <&reg_1p8v>;
 			dvdd-supply = <&reg_1p8v>;
diff --git a/arch/arm/boot/dts/renesas/r8a7794-silk.dts b/arch/arm/boot/dts/renesas/r8a7794-silk.dts
index 8857bb4a9b91d969..5ed5b426f9639775 100644
--- a/arch/arm/boot/dts/renesas/r8a7794-silk.dts
+++ b/arch/arm/boot/dts/renesas/r8a7794-silk.dts
@@ -262,8 +262,7 @@ adv7180: endpoint {
 		hdmi@39 {
 			compatible = "adi,adv7511w";
 			reg = <0x39>;
-			interrupt-parent = <&gpio5>;
-			interrupts = <23 IRQ_TYPE_LEVEL_LOW>;
+			interrupts-extended = <&gpio5 23 IRQ_TYPE_LEVEL_LOW>;
 
 			avdd-supply = <&d1_8v>;
 			dvdd-supply = <&d1_8v>;
-- 
2.34.1


