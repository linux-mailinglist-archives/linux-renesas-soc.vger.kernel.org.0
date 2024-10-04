Return-Path: <linux-renesas-soc+bounces-9404-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A93B999041C
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  4 Oct 2024 15:27:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id C95C41C21AC7
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  4 Oct 2024 13:27:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F1E90215F79;
	Fri,  4 Oct 2024 13:22:45 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from andre.telenet-ops.be (andre.telenet-ops.be [195.130.132.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8140D215F4E
	for <linux-renesas-soc@vger.kernel.org>; Fri,  4 Oct 2024 13:22:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.130.132.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728048165; cv=none; b=YejZujk52mF81lkQekMmrPqdJK4+842K8INI7ZySY9F19HhUVOOxP67nSJNKQnqeDhTgQlcC2xhP6yf/jyBL4ghhXSDPhovSjjIkcsXkr1L/UsEsTyntfmwYzyUn80wyTRTD44Dl7P3DSKZsJKSlgzO90nsa99D+JQHIHZSBiug=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728048165; c=relaxed/simple;
	bh=Jh3qKrTaOj2w5tjJHj692w4uRA9EFFya8hsY23WXa3g=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=VE0GVbi/DRMq6p9yj/10shpDzk3+Nb05ErCioXuk1BHyPCpniZn/9RWUgGEH9I+jEqIG2IwfYHlDVco23x7YsvWdgbkPWWDGo+QZmPjDYmVFHS3r+eSbs6vLcEXj+eFBddjCsbbYO/Tz7JYayTN+TgoRXQSmocFda683v/OTdS0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=glider.be; spf=none smtp.mailfrom=linux-m68k.org; arc=none smtp.client-ip=195.130.132.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=glider.be
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux-m68k.org
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed80:5518:aeb:d9c0:fc7c])
	by andre.telenet-ops.be with cmsmtp
	id LDNb2D00J4NXpdT01DNbuL; Fri, 04 Oct 2024 15:22:36 +0200
Received: from rox.of.borg ([192.168.97.57])
	by ramsan.of.borg with esmtp (Exim 4.95)
	(envelope-from <geert@linux-m68k.org>)
	id 1swiGJ-001El6-Dw;
	Fri, 04 Oct 2024 15:22:35 +0200
Received: from geert by rox.of.borg with local (Exim 4.95)
	(envelope-from <geert@linux-m68k.org>)
	id 1swhnu-006yTh-6k;
	Fri, 04 Oct 2024 14:53:06 +0200
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Magnus Damm <magnus.damm@gmail.com>,
	Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: linux-renesas-soc@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH 01/20] ARM: dts: renesas: Use interrupts-extended for Ethernet MACs
Date: Fri,  4 Oct 2024 14:52:43 +0200
Message-Id: <f51de53cb003f850751e13fdbddea64ad942ee7b.1728045620.git.geert+renesas@glider.be>
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
 arch/arm/boot/dts/renesas/emev2-kzm9d.dts     | 3 +--
 arch/arm/boot/dts/renesas/r8a73a4-ape6evm.dts | 3 +--
 arch/arm/boot/dts/renesas/r8a7778-bockw.dts   | 3 +--
 arch/arm/boot/dts/renesas/r8a7779-marzen.dts  | 3 +--
 arch/arm/boot/dts/renesas/r8a7792-blanche.dts | 3 +--
 arch/arm/boot/dts/renesas/r8a7792-wheat.dts   | 3 +--
 arch/arm/boot/dts/renesas/sh73a0-kzm9g.dts    | 3 +--
 7 files changed, 7 insertions(+), 14 deletions(-)

diff --git a/arch/arm/boot/dts/renesas/emev2-kzm9d.dts b/arch/arm/boot/dts/renesas/emev2-kzm9d.dts
index 89495dd373585e94..c624fd61578b3b72 100644
--- a/arch/arm/boot/dts/renesas/emev2-kzm9d.dts
+++ b/arch/arm/boot/dts/renesas/emev2-kzm9d.dts
@@ -83,8 +83,7 @@ ethernet@20000000 {
 		compatible = "smsc,lan9221", "smsc,lan9115";
 		reg = <0x20000000 0x10000>;
 		phy-mode = "mii";
-		interrupt-parent = <&gpio0>;
-		interrupts = <1 IRQ_TYPE_EDGE_RISING>;
+		interrupts-extended = <&gpio0 1 IRQ_TYPE_EDGE_RISING>;
 		reg-io-width = <4>;
 		smsc,irq-active-high;
 		smsc,irq-push-pull;
diff --git a/arch/arm/boot/dts/renesas/r8a73a4-ape6evm.dts b/arch/arm/boot/dts/renesas/r8a73a4-ape6evm.dts
index ae656ee27124c745..94a39ffc4297b788 100644
--- a/arch/arm/boot/dts/renesas/r8a73a4-ape6evm.dts
+++ b/arch/arm/boot/dts/renesas/r8a73a4-ape6evm.dts
@@ -207,8 +207,7 @@ partition@80000 {
 	ethernet@8000000 {
 		compatible = "smsc,lan9220", "smsc,lan9115";
 		reg = <0x08000000 0x1000>;
-		interrupt-parent = <&irqc1>;
-		interrupts = <8 IRQ_TYPE_LEVEL_HIGH>;
+		interrupts-extended = <&irqc1 8 IRQ_TYPE_LEVEL_HIGH>;
 		phy-mode = "mii";
 		reg-io-width = <4>;
 		smsc,irq-active-high;
diff --git a/arch/arm/boot/dts/renesas/r8a7778-bockw.dts b/arch/arm/boot/dts/renesas/r8a7778-bockw.dts
index a3f9d74e8877b72b..e27d7dd8c869bb2d 100644
--- a/arch/arm/boot/dts/renesas/r8a7778-bockw.dts
+++ b/arch/arm/boot/dts/renesas/r8a7778-bockw.dts
@@ -96,8 +96,7 @@ ethernet@18300000 {
 		reg = <0x18300000 0x1000>;
 
 		phy-mode = "mii";
-		interrupt-parent = <&irqpin>;
-		interrupts = <0 IRQ_TYPE_EDGE_FALLING>;
+		interrupts-extended = <&irqpin 0 IRQ_TYPE_EDGE_FALLING>;
 		reg-io-width = <4>;
 		vddvario-supply = <&fixedregulator3v3>;
 		vdd33a-supply = <&fixedregulator3v3>;
diff --git a/arch/arm/boot/dts/renesas/r8a7779-marzen.dts b/arch/arm/boot/dts/renesas/r8a7779-marzen.dts
index fec08562d12c1813..9793d8781d6e9425 100644
--- a/arch/arm/boot/dts/renesas/r8a7779-marzen.dts
+++ b/arch/arm/boot/dts/renesas/r8a7779-marzen.dts
@@ -261,8 +261,7 @@ ethernet@18000000 {
 		pinctrl-names = "default";
 
 		phy-mode = "mii";
-		interrupt-parent = <&irqpin0>;
-		interrupts = <1 IRQ_TYPE_EDGE_FALLING>;
+		interrupts-extended = <&irqpin0 1 IRQ_TYPE_EDGE_FALLING>;
 		smsc,irq-push-pull;
 		reg-io-width = <4>;
 		vddvario-supply = <&fixedregulator3v3>;
diff --git a/arch/arm/boot/dts/renesas/r8a7792-blanche.dts b/arch/arm/boot/dts/renesas/r8a7792-blanche.dts
index 540a9ad28f28ac1a..7eefa227d65514a9 100644
--- a/arch/arm/boot/dts/renesas/r8a7792-blanche.dts
+++ b/arch/arm/boot/dts/renesas/r8a7792-blanche.dts
@@ -224,8 +224,7 @@ ethernet@18000000 {
 		compatible = "smsc,lan89218", "smsc,lan9115";
 		reg = <0x18000000 0x100>;
 		phy-mode = "mii";
-		interrupt-parent = <&irqc>;
-		interrupts = <0 IRQ_TYPE_EDGE_FALLING>;
+		interrupts-extended = <&irqc 0 IRQ_TYPE_EDGE_FALLING>;
 		smsc,irq-push-pull;
 		reg-io-width = <4>;
 		vddvario-supply = <&d3_3v>;
diff --git a/arch/arm/boot/dts/renesas/r8a7792-wheat.dts b/arch/arm/boot/dts/renesas/r8a7792-wheat.dts
index 000f21a2a8630a8e..bfc780f7e396b408 100644
--- a/arch/arm/boot/dts/renesas/r8a7792-wheat.dts
+++ b/arch/arm/boot/dts/renesas/r8a7792-wheat.dts
@@ -115,8 +115,7 @@ ethernet@18000000 {
 		compatible = "smsc,lan89218", "smsc,lan9115";
 		reg = <0x18000000 0x100>;
 		phy-mode = "mii";
-		interrupt-parent = <&irqc>;
-		interrupts = <0 IRQ_TYPE_EDGE_FALLING>;
+		interrupts-extended = <&irqc 0 IRQ_TYPE_EDGE_FALLING>;
 		smsc,irq-push-pull;
 		smsc,save-mac-address;
 		reg-io-width = <4>;
diff --git a/arch/arm/boot/dts/renesas/sh73a0-kzm9g.dts b/arch/arm/boot/dts/renesas/sh73a0-kzm9g.dts
index 98897f710063a91b..15d89c20618a16b7 100644
--- a/arch/arm/boot/dts/renesas/sh73a0-kzm9g.dts
+++ b/arch/arm/boot/dts/renesas/sh73a0-kzm9g.dts
@@ -172,8 +172,7 @@ ethernet@10000000 {
 		compatible = "smsc,lan9221", "smsc,lan9115";
 		reg = <0x10000000 0x100>;
 		phy-mode = "mii";
-		interrupt-parent = <&irqpin0>;
-		interrupts = <3 IRQ_TYPE_EDGE_FALLING>;
+		interrupts-extended = <&irqpin0 3 IRQ_TYPE_EDGE_FALLING>;
 		reg-io-width = <4>;
 		smsc,irq-push-pull;
 		smsc,save-mac-address;
-- 
2.34.1


