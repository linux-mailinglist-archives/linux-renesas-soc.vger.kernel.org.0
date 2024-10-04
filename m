Return-Path: <linux-renesas-soc+bounces-9415-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id C7E51990433
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  4 Oct 2024 15:27:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id CA50C1C21378
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  4 Oct 2024 13:27:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D858E21F432;
	Fri,  4 Oct 2024 13:22:49 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from michel.telenet-ops.be (michel.telenet-ops.be [195.130.137.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E8661215F6E
	for <linux-renesas-soc@vger.kernel.org>; Fri,  4 Oct 2024 13:22:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.130.137.88
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728048169; cv=none; b=dMvc9D+ujC5lV0tFLe6odLN3XlkxPIaTgfoxX0cw4Iid9pWSwbpUO2OuAXrEvx3NQcMntsLI+pB3wuu0QEsm0EL+yShHK2BOX816PNPfwX3dFVYGgg+OQauT5vUSIXwVfh2RGDJRCVem2qAYwj2T2ytgvk4fITL3IPrc1sXnEVM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728048169; c=relaxed/simple;
	bh=nSCiRyBhb7XWwNDJkAxoDMCLym9z0V+Ht/ajwX+lt3w=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=rC2DkLfHkG6jY8epNPTWpSPvrnw0YCuJx4RK8hNmWk6lNM18b1Ulh0h8GbfBNpu+RRr2eSxd8dtBkKq79Yg26mVS8aNhGtyqMZYGs/4TXLEqF8QT/GI1Y3BHUru66RtwmCMnrWJPH8PhuAosyaCEZSytlkva/FFMhHsgS6L1T2Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=glider.be; spf=none smtp.mailfrom=linux-m68k.org; arc=none smtp.client-ip=195.130.137.88
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=glider.be
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux-m68k.org
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed80:5518:aeb:d9c0:fc7c])
	by michel.telenet-ops.be with cmsmtp
	id LDNd2D00J4NXpdT06DNdeB; Fri, 04 Oct 2024 15:22:37 +0200
Received: from rox.of.borg ([192.168.97.57])
	by ramsan.of.borg with esmtp (Exim 4.95)
	(envelope-from <geert@linux-m68k.org>)
	id 1swiGL-001EmB-9z;
	Fri, 04 Oct 2024 15:22:37 +0200
Received: from geert by rox.of.borg with local (Exim 4.95)
	(envelope-from <geert@linux-m68k.org>)
	id 1swhnu-006yTm-7u;
	Fri, 04 Oct 2024 14:53:06 +0200
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Magnus Damm <magnus.damm@gmail.com>,
	Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: linux-renesas-soc@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH 02/20] ARM: dts: renesas: Use interrupts-extended for Ethernet PHYs
Date: Fri,  4 Oct 2024 14:52:44 +0200
Message-Id: <623645456e7636f43150a70f8603114b26304818.1728045620.git.geert+renesas@glider.be>
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
 arch/arm/boot/dts/renesas/r8a7743-sk-rzg1m.dts    | 3 +--
 arch/arm/boot/dts/renesas/r8a7745-sk-rzg1e.dts    | 3 +--
 arch/arm/boot/dts/renesas/r8a77470-iwg23s-sbc.dts | 3 +--
 arch/arm/boot/dts/renesas/r8a7790-lager.dts       | 3 +--
 arch/arm/boot/dts/renesas/r8a7790-stout.dts       | 3 +--
 arch/arm/boot/dts/renesas/r8a7791-koelsch.dts     | 3 +--
 arch/arm/boot/dts/renesas/r8a7791-porter.dts      | 3 +--
 arch/arm/boot/dts/renesas/r8a7793-gose.dts        | 3 +--
 arch/arm/boot/dts/renesas/r8a7794-alt.dts         | 3 +--
 arch/arm/boot/dts/renesas/r8a7794-silk.dts        | 3 +--
 10 files changed, 10 insertions(+), 20 deletions(-)

diff --git a/arch/arm/boot/dts/renesas/r8a7743-sk-rzg1m.dts b/arch/arm/boot/dts/renesas/r8a7743-sk-rzg1m.dts
index ff274bfcb6646ea7..9b16fe7ce713c903 100644
--- a/arch/arm/boot/dts/renesas/r8a7743-sk-rzg1m.dts
+++ b/arch/arm/boot/dts/renesas/r8a7743-sk-rzg1m.dts
@@ -73,8 +73,7 @@ phy1: ethernet-phy@1 {
 		compatible = "ethernet-phy-id0022.1537",
 			     "ethernet-phy-ieee802.3-c22";
 		reg = <1>;
-		interrupt-parent = <&irqc>;
-		interrupts = <0 IRQ_TYPE_LEVEL_LOW>;
+		interrupts-extended = <&irqc 0 IRQ_TYPE_LEVEL_LOW>;
 		micrel,led-mode = <1>;
 		reset-gpios = <&gpio5 22 GPIO_ACTIVE_LOW>;
 	};
diff --git a/arch/arm/boot/dts/renesas/r8a7745-sk-rzg1e.dts b/arch/arm/boot/dts/renesas/r8a7745-sk-rzg1e.dts
index 0a75e8c79acc0e58..571615a506207169 100644
--- a/arch/arm/boot/dts/renesas/r8a7745-sk-rzg1e.dts
+++ b/arch/arm/boot/dts/renesas/r8a7745-sk-rzg1e.dts
@@ -68,8 +68,7 @@ phy1: ethernet-phy@1 {
 		compatible = "ethernet-phy-id0022.1537",
 			     "ethernet-phy-ieee802.3-c22";
 		reg = <1>;
-		interrupt-parent = <&irqc>;
-		interrupts = <8 IRQ_TYPE_LEVEL_LOW>;
+		interrupts-extended = <&irqc 8 IRQ_TYPE_LEVEL_LOW>;
 		micrel,led-mode = <1>;
 		reset-gpios = <&gpio1 24 GPIO_ACTIVE_LOW>;
 	};
diff --git a/arch/arm/boot/dts/renesas/r8a77470-iwg23s-sbc.dts b/arch/arm/boot/dts/renesas/r8a77470-iwg23s-sbc.dts
index 6448022852491661..7c7a9f257567d4f8 100644
--- a/arch/arm/boot/dts/renesas/r8a77470-iwg23s-sbc.dts
+++ b/arch/arm/boot/dts/renesas/r8a77470-iwg23s-sbc.dts
@@ -82,8 +82,7 @@ phy3: ethernet-phy@3 {
 		compatible = "ethernet-phy-id0022.1622",
 			     "ethernet-phy-ieee802.3-c22";
 		reg = <3>;
-		interrupt-parent = <&gpio5>;
-		interrupts = <16 IRQ_TYPE_LEVEL_LOW>;
+		interrupts-extended = <&gpio5 16 IRQ_TYPE_LEVEL_LOW>;
 		micrel,led-mode = <1>;
 	};
 };
diff --git a/arch/arm/boot/dts/renesas/r8a7790-lager.dts b/arch/arm/boot/dts/renesas/r8a7790-lager.dts
index 826a29064d27f663..97c13b31f476505c 100644
--- a/arch/arm/boot/dts/renesas/r8a7790-lager.dts
+++ b/arch/arm/boot/dts/renesas/r8a7790-lager.dts
@@ -692,8 +692,7 @@ phy1: ethernet-phy@1 {
 		compatible = "ethernet-phy-id0022.1537",
 			     "ethernet-phy-ieee802.3-c22";
 		reg = <1>;
-		interrupt-parent = <&irqc0>;
-		interrupts = <0 IRQ_TYPE_LEVEL_LOW>;
+		interrupts-extended = <&irqc0 0 IRQ_TYPE_LEVEL_LOW>;
 		micrel,led-mode = <1>;
 		reset-gpios = <&gpio5 31 GPIO_ACTIVE_LOW>;
 	};
diff --git a/arch/arm/boot/dts/renesas/r8a7790-stout.dts b/arch/arm/boot/dts/renesas/r8a7790-stout.dts
index 683f7395fab0b696..1593609064104ae4 100644
--- a/arch/arm/boot/dts/renesas/r8a7790-stout.dts
+++ b/arch/arm/boot/dts/renesas/r8a7790-stout.dts
@@ -211,8 +211,7 @@ phy1: ethernet-phy@1 {
 		compatible = "ethernet-phy-id0022.1537",
 			     "ethernet-phy-ieee802.3-c22";
 		reg = <1>;
-		interrupt-parent = <&irqc0>;
-		interrupts = <1 IRQ_TYPE_LEVEL_LOW>;
+		interrupts-extended = <&irqc0 1 IRQ_TYPE_LEVEL_LOW>;
 		micrel,led-mode = <1>;
 		reset-gpios = <&gpio3 31 GPIO_ACTIVE_LOW>;
 	};
diff --git a/arch/arm/boot/dts/renesas/r8a7791-koelsch.dts b/arch/arm/boot/dts/renesas/r8a7791-koelsch.dts
index 0a8eac57135f2e81..758d8331e7af66c4 100644
--- a/arch/arm/boot/dts/renesas/r8a7791-koelsch.dts
+++ b/arch/arm/boot/dts/renesas/r8a7791-koelsch.dts
@@ -659,8 +659,7 @@ phy1: ethernet-phy@1 {
 		compatible = "ethernet-phy-id0022.1537",
 			     "ethernet-phy-ieee802.3-c22";
 		reg = <1>;
-		interrupt-parent = <&irqc0>;
-		interrupts = <0 IRQ_TYPE_LEVEL_LOW>;
+		interrupts-extended = <&irqc0 0 IRQ_TYPE_LEVEL_LOW>;
 		micrel,led-mode = <1>;
 		reset-gpios = <&gpio5 22 GPIO_ACTIVE_LOW>;
 	};
diff --git a/arch/arm/boot/dts/renesas/r8a7791-porter.dts b/arch/arm/boot/dts/renesas/r8a7791-porter.dts
index 93c86e9216455577..267b3623655fbc38 100644
--- a/arch/arm/boot/dts/renesas/r8a7791-porter.dts
+++ b/arch/arm/boot/dts/renesas/r8a7791-porter.dts
@@ -329,8 +329,7 @@ phy1: ethernet-phy@1 {
 		compatible = "ethernet-phy-id0022.1537",
 			     "ethernet-phy-ieee802.3-c22";
 		reg = <1>;
-		interrupt-parent = <&irqc0>;
-		interrupts = <0 IRQ_TYPE_LEVEL_LOW>;
+		interrupts-extended = <&irqc0 0 IRQ_TYPE_LEVEL_LOW>;
 		micrel,led-mode = <1>;
 		reset-gpios = <&gpio5 22 GPIO_ACTIVE_LOW>;
 	};
diff --git a/arch/arm/boot/dts/renesas/r8a7793-gose.dts b/arch/arm/boot/dts/renesas/r8a7793-gose.dts
index 1ea6c757893bc0bf..f3f62206088348c6 100644
--- a/arch/arm/boot/dts/renesas/r8a7793-gose.dts
+++ b/arch/arm/boot/dts/renesas/r8a7793-gose.dts
@@ -622,8 +622,7 @@ phy1: ethernet-phy@1 {
 		compatible = "ethernet-phy-id0022.1537",
 			     "ethernet-phy-ieee802.3-c22";
 		reg = <1>;
-		interrupt-parent = <&irqc0>;
-		interrupts = <0 IRQ_TYPE_LEVEL_LOW>;
+		interrupts-extended = <&irqc0 0 IRQ_TYPE_LEVEL_LOW>;
 		micrel,led-mode = <1>;
 		reset-gpios = <&gpio5 22 GPIO_ACTIVE_LOW>;
 	};
diff --git a/arch/arm/boot/dts/renesas/r8a7794-alt.dts b/arch/arm/boot/dts/renesas/r8a7794-alt.dts
index b5ecafbb2e4de582..1e04b8630ef3f3ca 100644
--- a/arch/arm/boot/dts/renesas/r8a7794-alt.dts
+++ b/arch/arm/boot/dts/renesas/r8a7794-alt.dts
@@ -381,8 +381,7 @@ phy1: ethernet-phy@1 {
 		compatible = "ethernet-phy-id0022.1537",
 			     "ethernet-phy-ieee802.3-c22";
 		reg = <1>;
-		interrupt-parent = <&irqc0>;
-		interrupts = <8 IRQ_TYPE_LEVEL_LOW>;
+		interrupts-extended = <&irqc0 8 IRQ_TYPE_LEVEL_LOW>;
 		micrel,led-mode = <1>;
 		reset-gpios = <&gpio1 24 GPIO_ACTIVE_LOW>;
 	};
diff --git a/arch/arm/boot/dts/renesas/r8a7794-silk.dts b/arch/arm/boot/dts/renesas/r8a7794-silk.dts
index 595e074085eb4cd3..8857bb4a9b91d969 100644
--- a/arch/arm/boot/dts/renesas/r8a7794-silk.dts
+++ b/arch/arm/boot/dts/renesas/r8a7794-silk.dts
@@ -415,8 +415,7 @@ phy1: ethernet-phy@1 {
 		compatible = "ethernet-phy-id0022.1537",
 			     "ethernet-phy-ieee802.3-c22";
 		reg = <1>;
-		interrupt-parent = <&irqc0>;
-		interrupts = <8 IRQ_TYPE_LEVEL_LOW>;
+		interrupts-extended = <&irqc0 8 IRQ_TYPE_LEVEL_LOW>;
 		micrel,led-mode = <1>;
 		reset-gpios = <&gpio1 24 GPIO_ACTIVE_LOW>;
 	};
-- 
2.34.1


