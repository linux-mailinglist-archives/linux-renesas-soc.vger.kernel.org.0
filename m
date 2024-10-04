Return-Path: <linux-renesas-soc+bounces-9401-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A402990419
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  4 Oct 2024 15:27:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 454DA28212B
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  4 Oct 2024 13:27:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CB9E0215F67;
	Fri,  4 Oct 2024 13:22:45 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from albert.telenet-ops.be (albert.telenet-ops.be [195.130.137.90])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 88D16215F4F
	for <linux-renesas-soc@vger.kernel.org>; Fri,  4 Oct 2024 13:22:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.130.137.90
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728048165; cv=none; b=eHw0Yhuspl1OMqgNa4AS89INK2UPRKWyokNERK/rNmZeJUs2Nyfr6K9bCT3ZYUEJ+MrmbaFwMKqtvDW30HZH4lGibGTx6W6Z0l7tPPYZRhn0ldWDRQ0pE77J8z9y1f7RKGpEc5J8k/HXQK25g6nU/UXhtloBP2UqFxua3rQx7Ks=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728048165; c=relaxed/simple;
	bh=2Ct/W+/Fv9oGCuBYd22Dz0JWJDHs6dvBmldQc/twBK0=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=fvjsxa2b6aht9AmFYlUi5BgdurwE4NWwuzxPfSUOPv2bFtzTCJFmX0lmClOWgX9Mc1ktzytJ3+b8NEfrj/7MK/t3mLQE3AFXJJSAkD/zCk2OQ7esqgjiPv+5ESYNJV/PNJMPBRNvC5dTctKPEmQHLscfbqPStPTepnGar7hF/BE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=glider.be; spf=none smtp.mailfrom=linux-m68k.org; arc=none smtp.client-ip=195.130.137.90
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=glider.be
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux-m68k.org
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed80:5518:aeb:d9c0:fc7c])
	by albert.telenet-ops.be with cmsmtp
	id LDNc2D0064NXpdT06DNcJW; Fri, 04 Oct 2024 15:22:36 +0200
Received: from rox.of.borg ([192.168.97.57])
	by ramsan.of.borg with esmtp (Exim 4.95)
	(envelope-from <geert@linux-m68k.org>)
	id 1swiGJ-001ElL-Ph;
	Fri, 04 Oct 2024 15:22:36 +0200
Received: from geert by rox.of.borg with local (Exim 4.95)
	(envelope-from <geert@linux-m68k.org>)
	id 1swhnu-006yUu-OW;
	Fri, 04 Oct 2024 14:53:06 +0200
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Magnus Damm <magnus.damm@gmail.com>,
	Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: linux-renesas-soc@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH 16/20] arm64: dts: renesas: Use interrupts-extended for USB muxes
Date: Fri,  4 Oct 2024 14:52:58 +0200
Message-Id: <b65bc4b90074f13f7b36e61a8ea47afa07eb1221.1728045620.git.geert+renesas@glider.be>
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
 arch/arm64/boot/dts/renesas/beacon-renesom-baseboard.dtsi | 3 +--
 arch/arm64/boot/dts/renesas/r8a774c0-cat874.dts           | 3 +--
 2 files changed, 2 insertions(+), 4 deletions(-)

diff --git a/arch/arm64/boot/dts/renesas/beacon-renesom-baseboard.dtsi b/arch/arm64/boot/dts/renesas/beacon-renesom-baseboard.dtsi
index 9436b249ebdd9dcd..fd1dd2875644dd60 100644
--- a/arch/arm64/boot/dts/renesas/beacon-renesom-baseboard.dtsi
+++ b/arch/arm64/boot/dts/renesas/beacon-renesom-baseboard.dtsi
@@ -448,8 +448,7 @@ touchscreen@26 {
 	hd3ss3220@47 {
 		compatible = "ti,hd3ss3220";
 		reg = <0x47>;
-		interrupt-parent = <&gpio6>;
-		interrupts = <4 IRQ_TYPE_LEVEL_LOW>;
+		interrupts-extended = <&gpio6 4 IRQ_TYPE_LEVEL_LOW>;
 
 		ports {
 			#address-cells = <1>;
diff --git a/arch/arm64/boot/dts/renesas/r8a774c0-cat874.dts b/arch/arm64/boot/dts/renesas/r8a774c0-cat874.dts
index 486688b789b8cd58..94d85273064e9bc8 100644
--- a/arch/arm64/boot/dts/renesas/r8a774c0-cat874.dts
+++ b/arch/arm64/boot/dts/renesas/r8a774c0-cat874.dts
@@ -208,8 +208,7 @@ &i2c0 {
 	hd3ss3220@47 {
 		compatible = "ti,hd3ss3220";
 		reg = <0x47>;
-		interrupt-parent = <&gpio6>;
-		interrupts = <3 IRQ_TYPE_LEVEL_LOW>;
+		interrupts-extended = <&gpio6 3 IRQ_TYPE_LEVEL_LOW>;
 
 		ports {
 			#address-cells = <1>;
-- 
2.34.1


