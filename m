Return-Path: <linux-renesas-soc+bounces-9402-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id DD6F999041A
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  4 Oct 2024 15:27:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A641F281822
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  4 Oct 2024 13:27:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D29C5215F6B;
	Fri,  4 Oct 2024 13:22:45 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from andre.telenet-ops.be (andre.telenet-ops.be [195.130.132.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 76684215F43
	for <linux-renesas-soc@vger.kernel.org>; Fri,  4 Oct 2024 13:22:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.130.132.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728048165; cv=none; b=pPWmPgiPhedJcW5lqoWhnz4fJ8jwVMuZydyMnACkkLdHcZg5zXZxjAgO/2Fo3bjWZYqZAeY48O74zj4gQGejspdpcqUdYxJ66YKF69CoNVMBbS2QF3jmOxhdR8BztHCEmukn+jJFlWtErFdDHkx0bFINfYDZ6Ss17ya7KUjJWjQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728048165; c=relaxed/simple;
	bh=NnkVJOPLzPKaN9z9gyX044fIa3hBuJnK2zLgF9MC+ho=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=delkn0ESar8wJKPvFaEeNFPD9U4TqIgaRfVM1Ux4+SuLlsNSkrcwnBPHk56cw7+RAcw0NT72OCoL+5uvaq+1O2y05QFRy1B0ogAtP7vO1L/EmQokmbDyEAHkauqKqOdmrXouJ7R6j2XvEPpcEHVomNwPkmCGGLFu2GmFiMevniA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=glider.be; spf=none smtp.mailfrom=linux-m68k.org; arc=none smtp.client-ip=195.130.132.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=glider.be
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux-m68k.org
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed80:5518:aeb:d9c0:fc7c])
	by andre.telenet-ops.be with cmsmtp
	id LDNc2D0014NXpdT01DNcuP; Fri, 04 Oct 2024 15:22:36 +0200
Received: from rox.of.borg ([192.168.97.57])
	by ramsan.of.borg with esmtp (Exim 4.95)
	(envelope-from <geert@linux-m68k.org>)
	id 1swiGJ-001ElO-S1;
	Fri, 04 Oct 2024 15:22:36 +0200
Received: from geert by rox.of.borg with local (Exim 4.95)
	(envelope-from <geert@linux-m68k.org>)
	id 1swhnu-006yUp-NH;
	Fri, 04 Oct 2024 14:53:06 +0200
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Magnus Damm <magnus.damm@gmail.com>,
	Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: linux-renesas-soc@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH 15/20] arm64: dts: renesas: Use interrupts-extended for PMICs
Date: Fri,  4 Oct 2024 14:52:57 +0200
Message-Id: <14948b763694f3e78e8c4af35fa9c17ec91b2997.1728045620.git.geert+renesas@glider.be>
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
 arch/arm64/boot/dts/renesas/ebisu.dtsi           | 3 +--
 arch/arm64/boot/dts/renesas/salvator-common.dtsi | 3 +--
 arch/arm64/boot/dts/renesas/ulcb.dtsi            | 3 +--
 3 files changed, 3 insertions(+), 6 deletions(-)

diff --git a/arch/arm64/boot/dts/renesas/ebisu.dtsi b/arch/arm64/boot/dts/renesas/ebisu.dtsi
index 54ebffcd82d4337b..b4e0347d3617a83e 100644
--- a/arch/arm64/boot/dts/renesas/ebisu.dtsi
+++ b/arch/arm64/boot/dts/renesas/ebisu.dtsi
@@ -514,8 +514,7 @@ pmic: pmic@30 {
 
 		compatible = "rohm,bd9571mwv";
 		reg = <0x30>;
-		interrupt-parent = <&intc_ex>;
-		interrupts = <0 IRQ_TYPE_LEVEL_LOW>;
+		interrupts-extended = <&intc_ex 0 IRQ_TYPE_LEVEL_LOW>;
 		interrupt-controller;
 		#interrupt-cells = <2>;
 		gpio-controller;
diff --git a/arch/arm64/boot/dts/renesas/salvator-common.dtsi b/arch/arm64/boot/dts/renesas/salvator-common.dtsi
index ca0b5c070ae57dce..08f4e35c414ebbcf 100644
--- a/arch/arm64/boot/dts/renesas/salvator-common.dtsi
+++ b/arch/arm64/boot/dts/renesas/salvator-common.dtsi
@@ -617,8 +617,7 @@ pmic: pmic@30 {
 
 		compatible = "rohm,bd9571mwv";
 		reg = <0x30>;
-		interrupt-parent = <&intc_ex>;
-		interrupts = <0 IRQ_TYPE_LEVEL_LOW>;
+		interrupts-extended = <&intc_ex 0 IRQ_TYPE_LEVEL_LOW>;
 		interrupt-controller;
 		#interrupt-cells = <2>;
 		gpio-controller;
diff --git a/arch/arm64/boot/dts/renesas/ulcb.dtsi b/arch/arm64/boot/dts/renesas/ulcb.dtsi
index 4cf141a701c0625a..3d4a64d103b64bfa 100644
--- a/arch/arm64/boot/dts/renesas/ulcb.dtsi
+++ b/arch/arm64/boot/dts/renesas/ulcb.dtsi
@@ -247,8 +247,7 @@ pmic: pmic@30 {
 
 		compatible = "rohm,bd9571mwv";
 		reg = <0x30>;
-		interrupt-parent = <&intc_ex>;
-		interrupts = <0 IRQ_TYPE_LEVEL_LOW>;
+		interrupts-extended = <&intc_ex 0 IRQ_TYPE_LEVEL_LOW>;
 		interrupt-controller;
 		#interrupt-cells = <2>;
 		gpio-controller;
-- 
2.34.1


