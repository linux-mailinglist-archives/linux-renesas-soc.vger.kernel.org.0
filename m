Return-Path: <linux-renesas-soc+bounces-9417-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 39E79990437
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  4 Oct 2024 15:27:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B0E0E1F2184A
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  4 Oct 2024 13:27:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AF3DB21F437;
	Fri,  4 Oct 2024 13:22:50 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from michel.telenet-ops.be (michel.telenet-ops.be [195.130.137.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F05DA215F51
	for <linux-renesas-soc@vger.kernel.org>; Fri,  4 Oct 2024 13:22:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.130.137.88
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728048170; cv=none; b=dJO/l5VwyLe/UqmKZ5lfTYDPl5AdNNwGl22Khbm2S7aKHVD6aEBlt/CZuaUjPdVbU3XGYzOY405AeXZ5KMbdWw+PrxBIzIIl8aDR64nC5wE5vWd/79U4Lzqnir4n9KECKgNuFMpphcYvEBjFNG9veJEUaEnd8aT6VhhRZwweSXY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728048170; c=relaxed/simple;
	bh=jpk7VjzAxBugPOgpcSJIRbSk08+KNEXlCBJd4foCZWc=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=AFbpqxLenSFMUAoqr5dPuQuwWfC/6S3+rZYXMqHv+D4VCkkQsjJF7Zo8+3g9XErYfTfwgrybtbCOGN2Ec8qEen4yl3pVp5K+QBH7yIjKYRA6aSmrnLehRn9n9OsoVZYgDVOT8nU9aaWu3esbH4gfEagHrWd1r45E1LV6QtbRkAQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=glider.be; spf=none smtp.mailfrom=linux-m68k.org; arc=none smtp.client-ip=195.130.137.88
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=glider.be
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux-m68k.org
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed80:5518:aeb:d9c0:fc7c])
	by michel.telenet-ops.be with cmsmtp
	id LDNc2D00C4NXpdT06DNce3; Fri, 04 Oct 2024 15:22:37 +0200
Received: from rox.of.borg ([192.168.97.57])
	by ramsan.of.borg with esmtp (Exim 4.95)
	(envelope-from <geert@linux-m68k.org>)
	id 1swiGK-001ElX-2I;
	Fri, 04 Oct 2024 15:22:36 +0200
Received: from geert by rox.of.borg with local (Exim 4.95)
	(envelope-from <geert@linux-m68k.org>)
	id 1swhnu-006yUf-K6;
	Fri, 04 Oct 2024 14:53:06 +0200
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Magnus Damm <magnus.damm@gmail.com>,
	Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: linux-renesas-soc@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH 13/20] arm64: dts: renesas: Use interrupts-extended for HDMI bridges
Date: Fri,  4 Oct 2024 14:52:55 +0200
Message-Id: <7aabc9085f9206a9824d52f306df870e7f3eed3c.1728045620.git.geert+renesas@glider.be>
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
 arch/arm64/boot/dts/renesas/condor-common.dtsi  | 3 +--
 arch/arm64/boot/dts/renesas/draak.dtsi          | 3 +--
 arch/arm64/boot/dts/renesas/ebisu.dtsi          | 3 +--
 arch/arm64/boot/dts/renesas/r8a774c0-cat874.dts | 3 +--
 arch/arm64/boot/dts/renesas/r8a77970-eagle.dts  | 3 +--
 arch/arm64/boot/dts/renesas/r8a77970-v3msk.dts  | 3 +--
 arch/arm64/boot/dts/renesas/r8a77980-v3hsk.dts  | 3 +--
 arch/arm64/boot/dts/renesas/rzg2l-smarc.dtsi    | 3 +--
 arch/arm64/boot/dts/renesas/rzg2lc-smarc.dtsi   | 3 +--
 arch/arm64/boot/dts/renesas/ulcb-kf.dtsi        | 3 +--
 10 files changed, 10 insertions(+), 20 deletions(-)

diff --git a/arch/arm64/boot/dts/renesas/condor-common.dtsi b/arch/arm64/boot/dts/renesas/condor-common.dtsi
index b2d99dfaa0cdf19d..375a56b20f267bf0 100644
--- a/arch/arm64/boot/dts/renesas/condor-common.dtsi
+++ b/arch/arm64/boot/dts/renesas/condor-common.dtsi
@@ -195,8 +195,7 @@ io_expander1: gpio@21 {
 	hdmi@39 {
 		compatible = "adi,adv7511w";
 		reg = <0x39>;
-		interrupt-parent = <&gpio1>;
-		interrupts = <20 IRQ_TYPE_LEVEL_LOW>;
+		interrupts-extended = <&gpio1 20 IRQ_TYPE_LEVEL_LOW>;
 		avdd-supply = <&d1_8v>;
 		dvdd-supply = <&d1_8v>;
 		pvdd-supply = <&d1_8v>;
diff --git a/arch/arm64/boot/dts/renesas/draak.dtsi b/arch/arm64/boot/dts/renesas/draak.dtsi
index 402112a37d75a8c5..05712cd96d28bbdf 100644
--- a/arch/arm64/boot/dts/renesas/draak.dtsi
+++ b/arch/arm64/boot/dts/renesas/draak.dtsi
@@ -367,8 +367,7 @@ hdmi-encoder@39 {
 		compatible = "adi,adv7511w";
 		reg = <0x39>, <0x3f>, <0x3c>, <0x38>;
 		reg-names = "main", "edid", "cec", "packet";
-		interrupt-parent = <&gpio1>;
-		interrupts = <28 IRQ_TYPE_LEVEL_LOW>;
+		interrupts-extended = <&gpio1 28 IRQ_TYPE_LEVEL_LOW>;
 
 		avdd-supply = <&reg_1p8v>;
 		dvdd-supply = <&reg_1p8v>;
diff --git a/arch/arm64/boot/dts/renesas/ebisu.dtsi b/arch/arm64/boot/dts/renesas/ebisu.dtsi
index 1aedd093fb41bf44..4d16b8f0eae5474b 100644
--- a/arch/arm64/boot/dts/renesas/ebisu.dtsi
+++ b/arch/arm64/boot/dts/renesas/ebisu.dtsi
@@ -399,8 +399,7 @@ io_expander: gpio@20 {
 	hdmi-encoder@39 {
 		compatible = "adi,adv7511w";
 		reg = <0x39>;
-		interrupt-parent = <&gpio1>;
-		interrupts = <1 IRQ_TYPE_LEVEL_LOW>;
+		interrupts-extended = <&gpio1 1 IRQ_TYPE_LEVEL_LOW>;
 
 		avdd-supply = <&reg_1p8v>;
 		dvdd-supply = <&reg_1p8v>;
diff --git a/arch/arm64/boot/dts/renesas/r8a774c0-cat874.dts b/arch/arm64/boot/dts/renesas/r8a774c0-cat874.dts
index d42e24d9c09b9162..486688b789b8cd58 100644
--- a/arch/arm64/boot/dts/renesas/r8a774c0-cat874.dts
+++ b/arch/arm64/boot/dts/renesas/r8a774c0-cat874.dts
@@ -232,8 +232,7 @@ hd3ss3220_out_ep: endpoint {
 	tda19988: tda19988@70 {
 		compatible = "nxp,tda998x";
 		reg = <0x70>;
-		interrupt-parent = <&gpio1>;
-		interrupts = <1 IRQ_TYPE_LEVEL_LOW>;
+		interrupts-extended = <&gpio1 1 IRQ_TYPE_LEVEL_LOW>;
 
 		video-ports = <0x234501>;
 
diff --git a/arch/arm64/boot/dts/renesas/r8a77970-eagle.dts b/arch/arm64/boot/dts/renesas/r8a77970-eagle.dts
index 7dd9e13cf0074442..32f07aa2731678a5 100644
--- a/arch/arm64/boot/dts/renesas/r8a77970-eagle.dts
+++ b/arch/arm64/boot/dts/renesas/r8a77970-eagle.dts
@@ -171,8 +171,7 @@ io_expander: gpio@20 {
 	hdmi@39 {
 		compatible = "adi,adv7511w";
 		reg = <0x39>;
-		interrupt-parent = <&gpio1>;
-		interrupts = <20 IRQ_TYPE_LEVEL_LOW>;
+		interrupts-extended = <&gpio1 20 IRQ_TYPE_LEVEL_LOW>;
 
 		avdd-supply = <&d1p8>;
 		dvdd-supply = <&d1p8>;
diff --git a/arch/arm64/boot/dts/renesas/r8a77970-v3msk.dts b/arch/arm64/boot/dts/renesas/r8a77970-v3msk.dts
index 0a103f93b14d71ad..118e77f4477e389c 100644
--- a/arch/arm64/boot/dts/renesas/r8a77970-v3msk.dts
+++ b/arch/arm64/boot/dts/renesas/r8a77970-v3msk.dts
@@ -148,8 +148,7 @@ hdmi@39 {
 		compatible = "adi,adv7511w";
 		#sound-dai-cells = <0>;
 		reg = <0x39>;
-		interrupt-parent = <&gpio1>;
-		interrupts = <20 IRQ_TYPE_LEVEL_LOW>;
+		interrupts-extended = <&gpio1 20 IRQ_TYPE_LEVEL_LOW>;
 		avdd-supply = <&vcc_d1_8v>;
 		dvdd-supply = <&vcc_d1_8v>;
 		pvdd-supply = <&vcc_d1_8v>;
diff --git a/arch/arm64/boot/dts/renesas/r8a77980-v3hsk.dts b/arch/arm64/boot/dts/renesas/r8a77980-v3hsk.dts
index a8a20c748ffcd1ed..b409a8d1737e629c 100644
--- a/arch/arm64/boot/dts/renesas/r8a77980-v3hsk.dts
+++ b/arch/arm64/boot/dts/renesas/r8a77980-v3hsk.dts
@@ -140,8 +140,7 @@ hdmi@39 {
 		compatible = "adi,adv7511w";
 		#sound-dai-cells = <0>;
 		reg = <0x39>;
-		interrupt-parent = <&gpio1>;
-		interrupts = <20 IRQ_TYPE_LEVEL_LOW>;
+		interrupts-extended = <&gpio1 20 IRQ_TYPE_LEVEL_LOW>;
 		avdd-supply = <&vcc1v8_d4>;
 		dvdd-supply = <&vcc1v8_d4>;
 		pvdd-supply = <&vcc1v8_d4>;
diff --git a/arch/arm64/boot/dts/renesas/rzg2l-smarc.dtsi b/arch/arm64/boot/dts/renesas/rzg2l-smarc.dtsi
index ee3d96fdb6168b56..789f7b0b5ebcadc7 100644
--- a/arch/arm64/boot/dts/renesas/rzg2l-smarc.dtsi
+++ b/arch/arm64/boot/dts/renesas/rzg2l-smarc.dtsi
@@ -64,8 +64,7 @@ adv7535: hdmi@3d {
 		compatible = "adi,adv7535";
 		reg = <0x3d>;
 
-		interrupt-parent = <&pinctrl>;
-		interrupts = <RZG2L_GPIO(2, 1) IRQ_TYPE_EDGE_FALLING>;
+		interrupts-extended = <&pinctrl RZG2L_GPIO(2, 1) IRQ_TYPE_EDGE_FALLING>;
 		clocks = <&osc1>;
 		clock-names = "cec";
 		avdd-supply = <&reg_1p8v>;
diff --git a/arch/arm64/boot/dts/renesas/rzg2lc-smarc.dtsi b/arch/arm64/boot/dts/renesas/rzg2lc-smarc.dtsi
index 377849cbb462eae9..345b779e4f6015da 100644
--- a/arch/arm64/boot/dts/renesas/rzg2lc-smarc.dtsi
+++ b/arch/arm64/boot/dts/renesas/rzg2lc-smarc.dtsi
@@ -86,8 +86,7 @@ adv7535: hdmi@3d {
 		compatible = "adi,adv7535";
 		reg = <0x3d>;
 
-		interrupt-parent = <&pinctrl>;
-		interrupts = <RZG2L_GPIO(43, 1) IRQ_TYPE_EDGE_FALLING>;
+		interrupts-extended = <&pinctrl RZG2L_GPIO(43, 1) IRQ_TYPE_EDGE_FALLING>;
 		clocks = <&osc1>;
 		clock-names = "cec";
 		avdd-supply = <&reg_1p8v>;
diff --git a/arch/arm64/boot/dts/renesas/ulcb-kf.dtsi b/arch/arm64/boot/dts/renesas/ulcb-kf.dtsi
index 431b37bf566192d2..5a5dd5ecb75e0e7c 100644
--- a/arch/arm64/boot/dts/renesas/ulcb-kf.dtsi
+++ b/arch/arm64/boot/dts/renesas/ulcb-kf.dtsi
@@ -150,8 +150,7 @@ hdmi@3d {
 				pinctrl-0 = <&hdmi1_pins>;
 				pinctrl-names = "default";
 
-				interrupt-parent = <&gpio2>;
-				interrupts = <14 IRQ_TYPE_LEVEL_LOW>;
+				interrupts-extended = <&gpio2 14 IRQ_TYPE_LEVEL_LOW>;
 
 				clocks = <&cs2000>;
 				clock-names = "cec";
-- 
2.34.1


