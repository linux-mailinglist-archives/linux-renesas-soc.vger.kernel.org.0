Return-Path: <linux-renesas-soc+bounces-2782-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D245F854BF5
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 14 Feb 2024 15:57:54 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 565B4B2374C
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 14 Feb 2024 14:57:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 87B9A5A7A1;
	Wed, 14 Feb 2024 14:57:48 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from baptiste.telenet-ops.be (baptiste.telenet-ops.be [195.130.132.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C54595A7A9
	for <linux-renesas-soc@vger.kernel.org>; Wed, 14 Feb 2024 14:57:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.130.132.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707922668; cv=none; b=qEUJ1biRO0ZIGAhtH9Lh2cC6C+ER9JCZ/0EmltB3kM0qtZ56f/EYE33IqHgrML4TOE7pWj3vE6fvHL3Lnp5aS6yyDuqPJx/ydtyCdcch+WPTyYRbKrilDODQ0PO2gW49Qt2sAKZFvbUFR12t7+x4ytAPkhemeg9cE53NMnRK9MQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707922668; c=relaxed/simple;
	bh=JNu3wJCqQpkq9skzdOvOu2yizzZ/3KMxo50qPCiBqSU=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=jSlaSexFVzOhl0pJiHRaV0noodbachhjqzaH6blTaoZIz2BWwapfFOtMlHdPavpqxXv3T8dEZ/DEE9KR0MwNv5PFeejHyoNd57uH6tBhNYNbtAceS9ajHiB0mwGqcaKWsrONzEmKmqtpxgNNuGiKQLiluijxCutXa4Gu/JI2ITI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=glider.be; spf=none smtp.mailfrom=linux-m68k.org; arc=none smtp.client-ip=195.130.132.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=glider.be
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux-m68k.org
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed40:ac52:3a54:2a84:d65a])
	by baptiste.telenet-ops.be with bizsmtp
	id n2xj2B00A0LVNSS012xjoh; Wed, 14 Feb 2024 15:57:43 +0100
Received: from rox.of.borg ([192.168.97.57])
	by ramsan.of.borg with esmtp (Exim 4.95)
	(envelope-from <geert@linux-m68k.org>)
	id 1raGhc-000dCc-Ue;
	Wed, 14 Feb 2024 15:57:43 +0100
Received: from geert by rox.of.borg with local (Exim 4.95)
	(envelope-from <geert@linux-m68k.org>)
	id 1raGhj-00H27l-I2;
	Wed, 14 Feb 2024 15:57:43 +0100
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Rob Herring <robh@kernel.org>
Cc: linux-renesas-soc@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH] ARM: dts: renesas: rcar-gen2: Add missing #interrupt-cells to DA9063 nodes
Date: Wed, 14 Feb 2024 15:57:42 +0100
Message-Id: <a351e503ea97fb1af68395843f513925ff1bdf26.1707922460.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

make dtbs_check W=2:

    arch/arm/boot/dts/renesas/r8a7790-lager.dts:444.11-458.5: Warning (interrupt_provider): /i2c-mux4/pmic@58: Missing '#interrupt-cells' in interrupt provider
    ...

Fix this by adding the missing #interrupt-cells properties.

Reported-by: Rob Herring <robh@kernel.org>
Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
To be queued in renesas-devel for v6.9.

 arch/arm/boot/dts/renesas/r8a7790-lager.dts   | 1 +
 arch/arm/boot/dts/renesas/r8a7790-stout.dts   | 1 +
 arch/arm/boot/dts/renesas/r8a7791-koelsch.dts | 1 +
 arch/arm/boot/dts/renesas/r8a7791-porter.dts  | 1 +
 arch/arm/boot/dts/renesas/r8a7792-blanche.dts | 1 +
 arch/arm/boot/dts/renesas/r8a7793-gose.dts    | 1 +
 arch/arm/boot/dts/renesas/r8a7794-alt.dts     | 1 +
 arch/arm/boot/dts/renesas/r8a7794-silk.dts    | 1 +
 8 files changed, 8 insertions(+)

diff --git a/arch/arm/boot/dts/renesas/r8a7790-lager.dts b/arch/arm/boot/dts/renesas/r8a7790-lager.dts
index 2fba4d084001b964..8590981245a62057 100644
--- a/arch/arm/boot/dts/renesas/r8a7790-lager.dts
+++ b/arch/arm/boot/dts/renesas/r8a7790-lager.dts
@@ -447,6 +447,7 @@ pmic@58 {
 			interrupt-parent = <&irqc0>;
 			interrupts = <2 IRQ_TYPE_LEVEL_LOW>;
 			interrupt-controller;
+			#interrupt-cells = <2>;
 
 			rtc {
 				compatible = "dlg,da9063-rtc";
diff --git a/arch/arm/boot/dts/renesas/r8a7790-stout.dts b/arch/arm/boot/dts/renesas/r8a7790-stout.dts
index f9bc5b4f019d0213..683f7395fab0b696 100644
--- a/arch/arm/boot/dts/renesas/r8a7790-stout.dts
+++ b/arch/arm/boot/dts/renesas/r8a7790-stout.dts
@@ -347,6 +347,7 @@ pmic@58 {
 		interrupt-parent = <&irqc0>;
 		interrupts = <2 IRQ_TYPE_LEVEL_LOW>;
 		interrupt-controller;
+		#interrupt-cells = <2>;
 
 		onkey {
 			compatible = "dlg,da9063-onkey";
diff --git a/arch/arm/boot/dts/renesas/r8a7791-koelsch.dts b/arch/arm/boot/dts/renesas/r8a7791-koelsch.dts
index e9c13bb03772af44..0efd9f98c75aced0 100644
--- a/arch/arm/boot/dts/renesas/r8a7791-koelsch.dts
+++ b/arch/arm/boot/dts/renesas/r8a7791-koelsch.dts
@@ -819,6 +819,7 @@ pmic@58 {
 		interrupt-parent = <&irqc0>;
 		interrupts = <2 IRQ_TYPE_LEVEL_LOW>;
 		interrupt-controller;
+		#interrupt-cells = <2>;
 
 		rtc {
 			compatible = "dlg,da9063-rtc";
diff --git a/arch/arm/boot/dts/renesas/r8a7791-porter.dts b/arch/arm/boot/dts/renesas/r8a7791-porter.dts
index 7e8bc06715f6564b..93c86e9216455577 100644
--- a/arch/arm/boot/dts/renesas/r8a7791-porter.dts
+++ b/arch/arm/boot/dts/renesas/r8a7791-porter.dts
@@ -413,6 +413,7 @@ pmic@5a {
 		interrupt-parent = <&irqc0>;
 		interrupts = <2 IRQ_TYPE_LEVEL_LOW>;
 		interrupt-controller;
+		#interrupt-cells = <2>;
 
 		watchdog {
 			compatible = "dlg,da9063-watchdog";
diff --git a/arch/arm/boot/dts/renesas/r8a7792-blanche.dts b/arch/arm/boot/dts/renesas/r8a7792-blanche.dts
index 4f9838cf97ee4fb6..540a9ad28f28ac1a 100644
--- a/arch/arm/boot/dts/renesas/r8a7792-blanche.dts
+++ b/arch/arm/boot/dts/renesas/r8a7792-blanche.dts
@@ -381,6 +381,7 @@ pmic@58 {
 		interrupt-parent = <&irqc>;
 		interrupts = <2 IRQ_TYPE_LEVEL_LOW>;
 		interrupt-controller;
+		#interrupt-cells = <2>;
 
 		rtc {
 			compatible = "dlg,da9063-rtc";
diff --git a/arch/arm/boot/dts/renesas/r8a7793-gose.dts b/arch/arm/boot/dts/renesas/r8a7793-gose.dts
index 1744fdbf9e0ce08d..1ea6c757893bc0bf 100644
--- a/arch/arm/boot/dts/renesas/r8a7793-gose.dts
+++ b/arch/arm/boot/dts/renesas/r8a7793-gose.dts
@@ -759,6 +759,7 @@ pmic@58 {
 		interrupt-parent = <&irqc0>;
 		interrupts = <2 IRQ_TYPE_LEVEL_LOW>;
 		interrupt-controller;
+		#interrupt-cells = <2>;
 
 		rtc {
 			compatible = "dlg,da9063-rtc";
diff --git a/arch/arm/boot/dts/renesas/r8a7794-alt.dts b/arch/arm/boot/dts/renesas/r8a7794-alt.dts
index c0d067df22a03d4e..b5ecafbb2e4de582 100644
--- a/arch/arm/boot/dts/renesas/r8a7794-alt.dts
+++ b/arch/arm/boot/dts/renesas/r8a7794-alt.dts
@@ -453,6 +453,7 @@ pmic@58 {
 		interrupt-parent = <&gpio3>;
 		interrupts = <31 IRQ_TYPE_LEVEL_LOW>;
 		interrupt-controller;
+		#interrupt-cells = <2>;
 
 		rtc {
 			compatible = "dlg,da9063-rtc";
diff --git a/arch/arm/boot/dts/renesas/r8a7794-silk.dts b/arch/arm/boot/dts/renesas/r8a7794-silk.dts
index 43d480a7f3eacc21..595e074085eb4cd3 100644
--- a/arch/arm/boot/dts/renesas/r8a7794-silk.dts
+++ b/arch/arm/boot/dts/renesas/r8a7794-silk.dts
@@ -439,6 +439,7 @@ pmic@58 {
 		interrupt-parent = <&gpio3>;
 		interrupts = <31 IRQ_TYPE_LEVEL_LOW>;
 		interrupt-controller;
+		#interrupt-cells = <2>;
 
 		onkey {
 			compatible = "dlg,da9063-onkey";
-- 
2.34.1


