Return-Path: <linux-renesas-soc+bounces-9408-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E3DC990421
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  4 Oct 2024 15:27:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E028D28195B
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  4 Oct 2024 13:27:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A334821F415;
	Fri,  4 Oct 2024 13:22:47 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from andre.telenet-ops.be (andre.telenet-ops.be [195.130.132.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B6D4215F54
	for <linux-renesas-soc@vger.kernel.org>; Fri,  4 Oct 2024 13:22:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.130.132.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728048167; cv=none; b=XDw3c+O7v5mP9K6Zx+I2q04RYiVNInIo+g0tA/pKaej6at3/Fv7gixXgdk7GeC5k9Hah2oVzYJjCT3Ub9rHHl3ifWy9Hqq3CR+xGKBNy1cFp9LsWXO5FeX4PB4T8mKzOYW2SE4bBe0x8cmHXpeIxLLJVy8q5nNXpxkzsb1cvsg8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728048167; c=relaxed/simple;
	bh=CsSThBkH3mJsHpGJwjUjSDfT69e8TlJkvmQT9Y1UOzs=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=JAkPbEUHS8rhCzUC/wz4ZFPgrCdlAbYXI74EjZ1W+CfKKvuEZ76Utu/QyTFt3ThEBwEd9/6wI6NSnEwrvR4uqls4ccbImRF025nOKG1YicPR70j7NgkcmfOZatKXefFfwlD2IXmaVuqJ16d67RJ1jg94DiUJA0SjvkDbOl0FKrU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=glider.be; spf=none smtp.mailfrom=linux-m68k.org; arc=none smtp.client-ip=195.130.132.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=glider.be
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux-m68k.org
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed80:5518:aeb:d9c0:fc7c])
	by andre.telenet-ops.be with cmsmtp
	id LDNd2D00D4NXpdT01DNdus; Fri, 04 Oct 2024 15:22:37 +0200
Received: from rox.of.borg ([192.168.97.57])
	by ramsan.of.borg with esmtp (Exim 4.95)
	(envelope-from <geert@linux-m68k.org>)
	id 1swiGL-001Em4-3j;
	Fri, 04 Oct 2024 15:22:37 +0200
Received: from geert by rox.of.borg with local (Exim 4.95)
	(envelope-from <geert@linux-m68k.org>)
	id 1swhnu-006yTw-A2;
	Fri, 04 Oct 2024 14:53:06 +0200
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Magnus Damm <magnus.damm@gmail.com>,
	Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: linux-renesas-soc@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH 04/20] ARM: dts: renesas: Use interrupts-extended for PMICs
Date: Fri,  4 Oct 2024 14:52:46 +0200
Message-Id: <934b9b9992dacd72dbad0f5433728aac292a3cfc.1728045620.git.geert+renesas@glider.be>
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
 arch/arm/boot/dts/renesas/r8a7790-lager.dts   | 6 ++----
 arch/arm/boot/dts/renesas/r8a7790-stout.dts   | 9 +++------
 arch/arm/boot/dts/renesas/r8a7791-koelsch.dts | 6 ++----
 arch/arm/boot/dts/renesas/r8a7791-porter.dts  | 6 ++----
 arch/arm/boot/dts/renesas/r8a7792-blanche.dts | 3 +--
 arch/arm/boot/dts/renesas/r8a7793-gose.dts    | 6 ++----
 arch/arm/boot/dts/renesas/r8a7794-alt.dts     | 3 +--
 arch/arm/boot/dts/renesas/r8a7794-silk.dts    | 3 +--
 8 files changed, 14 insertions(+), 28 deletions(-)

diff --git a/arch/arm/boot/dts/renesas/r8a7790-lager.dts b/arch/arm/boot/dts/renesas/r8a7790-lager.dts
index 5ef87f8088c4c81c..47ffa278a0dfd79e 100644
--- a/arch/arm/boot/dts/renesas/r8a7790-lager.dts
+++ b/arch/arm/boot/dts/renesas/r8a7790-lager.dts
@@ -443,8 +443,7 @@ i2cpwr: i2c-mux4 {
 		pmic@58 {
 			compatible = "dlg,da9063";
 			reg = <0x58>;
-			interrupt-parent = <&irqc0>;
-			interrupts = <2 IRQ_TYPE_LEVEL_LOW>;
+			interrupts-extended = <&irqc0 2 IRQ_TYPE_LEVEL_LOW>;
 			interrupt-controller;
 			#interrupt-cells = <2>;
 
@@ -460,8 +459,7 @@ watchdog {
 		vdd_dvfs: regulator@68 {
 			compatible = "dlg,da9210";
 			reg = <0x68>;
-			interrupt-parent = <&irqc0>;
-			interrupts = <2 IRQ_TYPE_LEVEL_LOW>;
+			interrupts-extended = <&irqc0 2 IRQ_TYPE_LEVEL_LOW>;
 
 			regulator-min-microvolt = <1000000>;
 			regulator-max-microvolt = <1000000>;
diff --git a/arch/arm/boot/dts/renesas/r8a7790-stout.dts b/arch/arm/boot/dts/renesas/r8a7790-stout.dts
index 9287724187ef3b69..d7c0a9574ce83144 100644
--- a/arch/arm/boot/dts/renesas/r8a7790-stout.dts
+++ b/arch/arm/boot/dts/renesas/r8a7790-stout.dts
@@ -342,8 +342,7 @@ &iic3 {
 	pmic@58 {
 		compatible = "dlg,da9063";
 		reg = <0x58>;
-		interrupt-parent = <&irqc0>;
-		interrupts = <2 IRQ_TYPE_LEVEL_LOW>;
+		interrupts-extended = <&irqc0 2 IRQ_TYPE_LEVEL_LOW>;
 		interrupt-controller;
 		#interrupt-cells = <2>;
 
@@ -363,8 +362,7 @@ watchdog {
 	vdd_dvfs: regulator@68 {
 		compatible = "dlg,da9210";
 		reg = <0x68>;
-		interrupt-parent = <&irqc0>;
-		interrupts = <2 IRQ_TYPE_LEVEL_LOW>;
+		interrupts-extended = <&irqc0 2 IRQ_TYPE_LEVEL_LOW>;
 
 		regulator-min-microvolt = <1000000>;
 		regulator-max-microvolt = <1000000>;
@@ -375,8 +373,7 @@ vdd_dvfs: regulator@68 {
 	vdd: regulator@70 {
 		compatible = "dlg,da9210";
 		reg = <0x70>;
-		interrupt-parent = <&irqc0>;
-		interrupts = <2 IRQ_TYPE_LEVEL_LOW>;
+		interrupts-extended = <&irqc0 2 IRQ_TYPE_LEVEL_LOW>;
 
 		regulator-min-microvolt = <1000000>;
 		regulator-max-microvolt = <1000000>;
diff --git a/arch/arm/boot/dts/renesas/r8a7791-koelsch.dts b/arch/arm/boot/dts/renesas/r8a7791-koelsch.dts
index bce93db4c9df5e18..1a0d2c6ed0e83ce7 100644
--- a/arch/arm/boot/dts/renesas/r8a7791-koelsch.dts
+++ b/arch/arm/boot/dts/renesas/r8a7791-koelsch.dts
@@ -814,8 +814,7 @@ &i2c6 {
 	pmic@58 {
 		compatible = "dlg,da9063";
 		reg = <0x58>;
-		interrupt-parent = <&irqc0>;
-		interrupts = <2 IRQ_TYPE_LEVEL_LOW>;
+		interrupts-extended = <&irqc0 2 IRQ_TYPE_LEVEL_LOW>;
 		interrupt-controller;
 		#interrupt-cells = <2>;
 
@@ -831,8 +830,7 @@ watchdog {
 	vdd_dvfs: regulator@68 {
 		compatible = "dlg,da9210";
 		reg = <0x68>;
-		interrupt-parent = <&irqc0>;
-		interrupts = <2 IRQ_TYPE_LEVEL_LOW>;
+		interrupts-extended = <&irqc0 2 IRQ_TYPE_LEVEL_LOW>;
 
 		regulator-min-microvolt = <1000000>;
 		regulator-max-microvolt = <1000000>;
diff --git a/arch/arm/boot/dts/renesas/r8a7791-porter.dts b/arch/arm/boot/dts/renesas/r8a7791-porter.dts
index 92b54e043795ba08..08381498350aacde 100644
--- a/arch/arm/boot/dts/renesas/r8a7791-porter.dts
+++ b/arch/arm/boot/dts/renesas/r8a7791-porter.dts
@@ -408,8 +408,7 @@ &i2c6 {
 	pmic@5a {
 		compatible = "dlg,da9063l";
 		reg = <0x5a>;
-		interrupt-parent = <&irqc0>;
-		interrupts = <2 IRQ_TYPE_LEVEL_LOW>;
+		interrupts-extended = <&irqc0 2 IRQ_TYPE_LEVEL_LOW>;
 		interrupt-controller;
 		#interrupt-cells = <2>;
 
@@ -421,8 +420,7 @@ watchdog {
 	vdd_dvfs: regulator@68 {
 		compatible = "dlg,da9210";
 		reg = <0x68>;
-		interrupt-parent = <&irqc0>;
-		interrupts = <2 IRQ_TYPE_LEVEL_LOW>;
+		interrupts-extended = <&irqc0 2 IRQ_TYPE_LEVEL_LOW>;
 
 		regulator-min-microvolt = <1000000>;
 		regulator-max-microvolt = <1000000>;
diff --git a/arch/arm/boot/dts/renesas/r8a7792-blanche.dts b/arch/arm/boot/dts/renesas/r8a7792-blanche.dts
index 69009535814406fe..a3986076d8e3e993 100644
--- a/arch/arm/boot/dts/renesas/r8a7792-blanche.dts
+++ b/arch/arm/boot/dts/renesas/r8a7792-blanche.dts
@@ -376,8 +376,7 @@ pmic@58 {
 		reg = <0x58>;
 		pinctrl-names = "default";
 		pinctrl-0 = <&pmic_irq_pins>;
-		interrupt-parent = <&irqc>;
-		interrupts = <2 IRQ_TYPE_LEVEL_LOW>;
+		interrupts-extended = <&irqc 2 IRQ_TYPE_LEVEL_LOW>;
 		interrupt-controller;
 		#interrupt-cells = <2>;
 
diff --git a/arch/arm/boot/dts/renesas/r8a7793-gose.dts b/arch/arm/boot/dts/renesas/r8a7793-gose.dts
index 45ef1d1900245a11..5334af25c10111c8 100644
--- a/arch/arm/boot/dts/renesas/r8a7793-gose.dts
+++ b/arch/arm/boot/dts/renesas/r8a7793-gose.dts
@@ -754,8 +754,7 @@ &i2c6 {
 	pmic@58 {
 		compatible = "dlg,da9063";
 		reg = <0x58>;
-		interrupt-parent = <&irqc0>;
-		interrupts = <2 IRQ_TYPE_LEVEL_LOW>;
+		interrupts-extended = <&irqc0 2 IRQ_TYPE_LEVEL_LOW>;
 		interrupt-controller;
 		#interrupt-cells = <2>;
 
@@ -771,8 +770,7 @@ watchdog {
 	vdd_dvfs: regulator@68 {
 		compatible = "dlg,da9210";
 		reg = <0x68>;
-		interrupt-parent = <&irqc0>;
-		interrupts = <2 IRQ_TYPE_LEVEL_LOW>;
+		interrupts-extended = <&irqc0 2 IRQ_TYPE_LEVEL_LOW>;
 
 		regulator-min-microvolt = <1000000>;
 		regulator-max-microvolt = <1000000>;
diff --git a/arch/arm/boot/dts/renesas/r8a7794-alt.dts b/arch/arm/boot/dts/renesas/r8a7794-alt.dts
index 1e04b8630ef3f3ca..882644cd7c1875c1 100644
--- a/arch/arm/boot/dts/renesas/r8a7794-alt.dts
+++ b/arch/arm/boot/dts/renesas/r8a7794-alt.dts
@@ -449,8 +449,7 @@ &i2c7 {
 	pmic@58 {
 		compatible = "dlg,da9063";
 		reg = <0x58>;
-		interrupt-parent = <&gpio3>;
-		interrupts = <31 IRQ_TYPE_LEVEL_LOW>;
+		interrupts-extended = <&gpio3 31 IRQ_TYPE_LEVEL_LOW>;
 		interrupt-controller;
 		#interrupt-cells = <2>;
 
diff --git a/arch/arm/boot/dts/renesas/r8a7794-silk.dts b/arch/arm/boot/dts/renesas/r8a7794-silk.dts
index 5ed5b426f9639775..2a0819311a3c4ef3 100644
--- a/arch/arm/boot/dts/renesas/r8a7794-silk.dts
+++ b/arch/arm/boot/dts/renesas/r8a7794-silk.dts
@@ -434,8 +434,7 @@ &i2c7 {
 	pmic@58 {
 		compatible = "dlg,da9063";
 		reg = <0x58>;
-		interrupt-parent = <&gpio3>;
-		interrupts = <31 IRQ_TYPE_LEVEL_LOW>;
+		interrupts-extended = <&gpio3 31 IRQ_TYPE_LEVEL_LOW>;
 		interrupt-controller;
 		#interrupt-cells = <2>;
 
-- 
2.34.1


