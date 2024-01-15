Return-Path: <linux-renesas-soc+bounces-1577-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 5BB0E82DA7A
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 15 Jan 2024 14:46:56 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D5EE6281302
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 15 Jan 2024 13:46:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D971317589;
	Mon, 15 Jan 2024 13:46:50 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from andre.telenet-ops.be (andre.telenet-ops.be [195.130.132.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0CBEA17586
	for <linux-renesas-soc@vger.kernel.org>; Mon, 15 Jan 2024 13:46:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=glider.be
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux-m68k.org
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed40:1376:70aa:e074:32d3])
	by andre.telenet-ops.be with bizsmtp
	id b1mk2B00P34Hgv9011mkyH; Mon, 15 Jan 2024 14:46:44 +0100
Received: from rox.of.borg ([192.168.97.57])
	by ramsan.of.borg with esmtp (Exim 4.95)
	(envelope-from <geert@linux-m68k.org>)
	id 1rPNHr-00FdxS-Ps;
	Mon, 15 Jan 2024 14:46:44 +0100
Received: from geert by rox.of.borg with local (Exim 4.95)
	(envelope-from <geert@linux-m68k.org>)
	id 1rPNIa-00C0Wk-IJ;
	Mon, 15 Jan 2024 14:46:44 +0100
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Magnus Damm <magnus.damm@gmail.com>,
	Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: linux-renesas-soc@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH 1/2] ARM: dts: renesas: Improve TMU interrupt descriptions
Date: Mon, 15 Jan 2024 14:46:39 +0100
Message-Id: <389a18ee2cea96726462c28463cf212330f74ee3.1705325654.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1705325654.git.geert+renesas@glider.be>
References: <cover.1705325654.git.geert+renesas@glider.be>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add the input capture interrupt on Timer Unit instances that have it.
Add "interrupt-names" properties for clarity.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
 arch/arm/boot/dts/renesas/r8a7740.dtsi | 2 ++
 arch/arm/boot/dts/renesas/r8a7778.dtsi | 9 +++++++--
 arch/arm/boot/dts/renesas/r8a7779.dtsi | 9 +++++++--
 3 files changed, 16 insertions(+), 4 deletions(-)

diff --git a/arch/arm/boot/dts/renesas/r8a7740.dtsi b/arch/arm/boot/dts/renesas/r8a7740.dtsi
index 55884ec701f8dab4..d13ab86c3ab47e37 100644
--- a/arch/arm/boot/dts/renesas/r8a7740.dtsi
+++ b/arch/arm/boot/dts/renesas/r8a7740.dtsi
@@ -459,6 +459,7 @@ tmu0: timer@fff80000 {
 		interrupts = <GIC_SPI 198 IRQ_TYPE_LEVEL_HIGH>,
 			     <GIC_SPI 199 IRQ_TYPE_LEVEL_HIGH>,
 			     <GIC_SPI 200 IRQ_TYPE_LEVEL_HIGH>;
+		interrupt-names = "tuni0", "tuni1", "tuni2";
 		clocks = <&mstp1_clks R8A7740_CLK_TMU0>;
 		clock-names = "fck";
 		power-domains = <&pd_a4r>;
@@ -474,6 +475,7 @@ tmu1: timer@fff90000 {
 		interrupts = <GIC_SPI 170 IRQ_TYPE_LEVEL_HIGH>,
 			     <GIC_SPI 171 IRQ_TYPE_LEVEL_HIGH>,
 			     <GIC_SPI 172 IRQ_TYPE_LEVEL_HIGH>;
+		interrupt-names = "tuni0", "tuni1", "tuni2";
 		clocks = <&mstp1_clks R8A7740_CLK_TMU1>;
 		clock-names = "fck";
 		power-domains = <&pd_a4r>;
diff --git a/arch/arm/boot/dts/renesas/r8a7778.dtsi b/arch/arm/boot/dts/renesas/r8a7778.dtsi
index 8d4530ed2fc6ad15..97f71c1f69dd7341 100644
--- a/arch/arm/boot/dts/renesas/r8a7778.dtsi
+++ b/arch/arm/boot/dts/renesas/r8a7778.dtsi
@@ -199,7 +199,9 @@ tmu0: timer@ffd80000 {
 		reg = <0xffd80000 0x30>;
 		interrupts = <GIC_SPI 32 IRQ_TYPE_LEVEL_HIGH>,
 			     <GIC_SPI 33 IRQ_TYPE_LEVEL_HIGH>,
-			     <GIC_SPI 34 IRQ_TYPE_LEVEL_HIGH>;
+			     <GIC_SPI 34 IRQ_TYPE_LEVEL_HIGH>,
+			     <GIC_SPI 35 IRQ_TYPE_LEVEL_HIGH>;
+		interrupt-names = "tuni0", "tuni1", "tuni2", "ticpi2";
 		clocks = <&mstp0_clks R8A7778_CLK_TMU0>;
 		clock-names = "fck";
 		power-domains = <&cpg_clocks>;
@@ -214,7 +216,9 @@ tmu1: timer@ffd81000 {
 		reg = <0xffd81000 0x30>;
 		interrupts = <GIC_SPI 36 IRQ_TYPE_LEVEL_HIGH>,
 			     <GIC_SPI 37 IRQ_TYPE_LEVEL_HIGH>,
-			     <GIC_SPI 38 IRQ_TYPE_LEVEL_HIGH>;
+			     <GIC_SPI 38 IRQ_TYPE_LEVEL_HIGH>,
+			     <GIC_SPI 39 IRQ_TYPE_LEVEL_HIGH>;
+		interrupt-names = "tuni0", "tuni1", "tuni2", "ticpi2";
 		clocks = <&mstp0_clks R8A7778_CLK_TMU1>;
 		clock-names = "fck";
 		power-domains = <&cpg_clocks>;
@@ -230,6 +234,7 @@ tmu2: timer@ffd82000 {
 		interrupts = <GIC_SPI 40 IRQ_TYPE_LEVEL_HIGH>,
 			     <GIC_SPI 41 IRQ_TYPE_LEVEL_HIGH>,
 			     <GIC_SPI 42 IRQ_TYPE_LEVEL_HIGH>;
+		interrupt-names = "tuni0", "tuni1", "tuni2";
 		clocks = <&mstp0_clks R8A7778_CLK_TMU2>;
 		clock-names = "fck";
 		power-domains = <&cpg_clocks>;
diff --git a/arch/arm/boot/dts/renesas/r8a7779.dtsi b/arch/arm/boot/dts/renesas/r8a7779.dtsi
index eaed2ae339383b34..77f6d93c2fe75a30 100644
--- a/arch/arm/boot/dts/renesas/r8a7779.dtsi
+++ b/arch/arm/boot/dts/renesas/r8a7779.dtsi
@@ -402,7 +402,9 @@ tmu0: timer@ffd80000 {
 		reg = <0xffd80000 0x30>;
 		interrupts = <GIC_SPI 32 IRQ_TYPE_LEVEL_HIGH>,
 			     <GIC_SPI 33 IRQ_TYPE_LEVEL_HIGH>,
-			     <GIC_SPI 34 IRQ_TYPE_LEVEL_HIGH>;
+			     <GIC_SPI 34 IRQ_TYPE_LEVEL_HIGH>,
+			     <GIC_SPI 35 IRQ_TYPE_LEVEL_HIGH>;
+		interrupt-names = "tuni0", "tuni1", "tuni2", "ticpi2";
 		clocks = <&mstp0_clks R8A7779_CLK_TMU0>;
 		clock-names = "fck";
 		power-domains = <&sysc R8A7779_PD_ALWAYS_ON>;
@@ -417,7 +419,9 @@ tmu1: timer@ffd81000 {
 		reg = <0xffd81000 0x30>;
 		interrupts = <GIC_SPI 36 IRQ_TYPE_LEVEL_HIGH>,
 			     <GIC_SPI 37 IRQ_TYPE_LEVEL_HIGH>,
-			     <GIC_SPI 38 IRQ_TYPE_LEVEL_HIGH>;
+			     <GIC_SPI 38 IRQ_TYPE_LEVEL_HIGH>,
+			     <GIC_SPI 39 IRQ_TYPE_LEVEL_HIGH>;
+		interrupt-names = "tuni0", "tuni1", "tuni2", "ticpi2";
 		clocks = <&mstp0_clks R8A7779_CLK_TMU1>;
 		clock-names = "fck";
 		power-domains = <&sysc R8A7779_PD_ALWAYS_ON>;
@@ -433,6 +437,7 @@ tmu2: timer@ffd82000 {
 		interrupts = <GIC_SPI 40 IRQ_TYPE_LEVEL_HIGH>,
 			     <GIC_SPI 41 IRQ_TYPE_LEVEL_HIGH>,
 			     <GIC_SPI 42 IRQ_TYPE_LEVEL_HIGH>;
+		interrupt-names = "tuni0", "tuni1", "tuni2";
 		clocks = <&mstp0_clks R8A7779_CLK_TMU2>;
 		clock-names = "fck";
 		power-domains = <&sysc R8A7779_PD_ALWAYS_ON>;
-- 
2.34.1


