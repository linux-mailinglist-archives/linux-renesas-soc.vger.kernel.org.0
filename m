Return-Path: <linux-renesas-soc+bounces-1579-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F15082DA7B
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 15 Jan 2024 14:46:58 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 28BED1C213D8
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 15 Jan 2024 13:46:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 96A091754C;
	Mon, 15 Jan 2024 13:46:56 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from baptiste.telenet-ops.be (baptiste.telenet-ops.be [195.130.132.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8ADA4171C1
	for <linux-renesas-soc@vger.kernel.org>; Mon, 15 Jan 2024 13:46:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=glider.be
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux-m68k.org
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed40:1376:70aa:e074:32d3])
	by baptiste.telenet-ops.be with bizsmtp
	id b1ml2B00U34Hgv9011mlrD; Mon, 15 Jan 2024 14:46:45 +0100
Received: from rox.of.borg ([192.168.97.57])
	by ramsan.of.borg with esmtp (Exim 4.95)
	(envelope-from <geert@linux-m68k.org>)
	id 1rPNHs-00FdxX-Ru;
	Mon, 15 Jan 2024 14:46:45 +0100
Received: from geert by rox.of.borg with local (Exim 4.95)
	(envelope-from <geert@linux-m68k.org>)
	id 1rPNIb-00C0Wp-Jp;
	Mon, 15 Jan 2024 14:46:45 +0100
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Magnus Damm <magnus.damm@gmail.com>,
	Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: linux-renesas-soc@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH 2/2] arm64: dts: renesas: Improve TMU interrupt descriptions
Date: Mon, 15 Jan 2024 14:46:40 +0100
Message-Id: <5c70ad8c2ea14333616c5add31a4a958f4a47081.1705325654.git.geert+renesas@glider.be>
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
 arch/arm64/boot/dts/renesas/r8a774a1.dtsi | 11 +++++++++--
 arch/arm64/boot/dts/renesas/r8a774b1.dtsi | 11 +++++++++--
 arch/arm64/boot/dts/renesas/r8a774c0.dtsi | 11 +++++++++--
 arch/arm64/boot/dts/renesas/r8a774e1.dtsi | 11 +++++++++--
 arch/arm64/boot/dts/renesas/r8a77951.dtsi | 11 +++++++++--
 arch/arm64/boot/dts/renesas/r8a77960.dtsi | 11 +++++++++--
 arch/arm64/boot/dts/renesas/r8a77961.dtsi | 11 +++++++++--
 arch/arm64/boot/dts/renesas/r8a77965.dtsi | 11 +++++++++--
 arch/arm64/boot/dts/renesas/r8a77970.dtsi | 11 +++++++++--
 arch/arm64/boot/dts/renesas/r8a77980.dtsi | 17 +++++++++++++----
 arch/arm64/boot/dts/renesas/r8a77990.dtsi | 11 +++++++++--
 arch/arm64/boot/dts/renesas/r8a77995.dtsi | 11 +++++++++--
 arch/arm64/boot/dts/renesas/r8a779a0.dtsi | 17 +++++++++++++----
 arch/arm64/boot/dts/renesas/r8a779f0.dtsi | 17 +++++++++++++----
 arch/arm64/boot/dts/renesas/r8a779g0.dtsi | 17 +++++++++++++----
 15 files changed, 151 insertions(+), 38 deletions(-)

diff --git a/arch/arm64/boot/dts/renesas/r8a774a1.dtsi b/arch/arm64/boot/dts/renesas/r8a774a1.dtsi
index 95b0a1f6debfcefb..a8a44fe5e83bbd5c 100644
--- a/arch/arm64/boot/dts/renesas/r8a774a1.dtsi
+++ b/arch/arm64/boot/dts/renesas/r8a774a1.dtsi
@@ -529,6 +529,7 @@ tmu0: timer@e61e0000 {
 			interrupts = <GIC_SPI 136 IRQ_TYPE_LEVEL_HIGH>,
 				     <GIC_SPI 137 IRQ_TYPE_LEVEL_HIGH>,
 				     <GIC_SPI 138 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-names = "tuni0", "tuni1", "tuni2";
 			clocks = <&cpg CPG_MOD 125>;
 			clock-names = "fck";
 			power-domains = <&sysc R8A774A1_PD_ALWAYS_ON>;
@@ -541,7 +542,9 @@ tmu1: timer@e6fc0000 {
 			reg = <0 0xe6fc0000 0 0x30>;
 			interrupts = <GIC_SPI 128 IRQ_TYPE_LEVEL_HIGH>,
 				     <GIC_SPI 129 IRQ_TYPE_LEVEL_HIGH>,
-				     <GIC_SPI 130 IRQ_TYPE_LEVEL_HIGH>;
+				     <GIC_SPI 130 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 147 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-names = "tuni0", "tuni1", "tuni2", "ticpi2";
 			clocks = <&cpg CPG_MOD 124>;
 			clock-names = "fck";
 			power-domains = <&sysc R8A774A1_PD_ALWAYS_ON>;
@@ -554,7 +557,9 @@ tmu2: timer@e6fd0000 {
 			reg = <0 0xe6fd0000 0 0x30>;
 			interrupts = <GIC_SPI 303 IRQ_TYPE_LEVEL_HIGH>,
 				     <GIC_SPI 304 IRQ_TYPE_LEVEL_HIGH>,
-				     <GIC_SPI 305 IRQ_TYPE_LEVEL_HIGH>;
+				     <GIC_SPI 305 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 306 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-names = "tuni0", "tuni1", "tuni2", "ticpi2";
 			clocks = <&cpg CPG_MOD 123>;
 			clock-names = "fck";
 			power-domains = <&sysc R8A774A1_PD_ALWAYS_ON>;
@@ -568,6 +573,7 @@ tmu3: timer@e6fe0000 {
 			interrupts = <GIC_SPI 131 IRQ_TYPE_LEVEL_HIGH>,
 				     <GIC_SPI 132 IRQ_TYPE_LEVEL_HIGH>,
 				     <GIC_SPI 133 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-names = "tuni0", "tuni1", "tuni2";
 			clocks = <&cpg CPG_MOD 122>;
 			clock-names = "fck";
 			power-domains = <&sysc R8A774A1_PD_ALWAYS_ON>;
@@ -581,6 +587,7 @@ tmu4: timer@ffc00000 {
 			interrupts = <GIC_SPI 406 IRQ_TYPE_LEVEL_HIGH>,
 				     <GIC_SPI 407 IRQ_TYPE_LEVEL_HIGH>,
 				     <GIC_SPI 408 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-names = "tuni0", "tuni1", "tuni2";
 			clocks = <&cpg CPG_MOD 121>;
 			clock-names = "fck";
 			power-domains = <&sysc R8A774A1_PD_ALWAYS_ON>;
diff --git a/arch/arm64/boot/dts/renesas/r8a774b1.dtsi b/arch/arm64/boot/dts/renesas/r8a774b1.dtsi
index 786660fcdea42b47..4fff511e994cf840 100644
--- a/arch/arm64/boot/dts/renesas/r8a774b1.dtsi
+++ b/arch/arm64/boot/dts/renesas/r8a774b1.dtsi
@@ -413,6 +413,7 @@ tmu0: timer@e61e0000 {
 			interrupts = <GIC_SPI 136 IRQ_TYPE_LEVEL_HIGH>,
 				     <GIC_SPI 137 IRQ_TYPE_LEVEL_HIGH>,
 				     <GIC_SPI 138 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-names = "tuni0", "tuni1", "tuni2";
 			clocks = <&cpg CPG_MOD 125>;
 			clock-names = "fck";
 			power-domains = <&sysc R8A774B1_PD_ALWAYS_ON>;
@@ -425,7 +426,9 @@ tmu1: timer@e6fc0000 {
 			reg = <0 0xe6fc0000 0 0x30>;
 			interrupts = <GIC_SPI 128 IRQ_TYPE_LEVEL_HIGH>,
 				     <GIC_SPI 129 IRQ_TYPE_LEVEL_HIGH>,
-				     <GIC_SPI 130 IRQ_TYPE_LEVEL_HIGH>;
+				     <GIC_SPI 130 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 147 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-names = "tuni0", "tuni1", "tuni2", "ticpi2";
 			clocks = <&cpg CPG_MOD 124>;
 			clock-names = "fck";
 			power-domains = <&sysc R8A774B1_PD_ALWAYS_ON>;
@@ -438,7 +441,9 @@ tmu2: timer@e6fd0000 {
 			reg = <0 0xe6fd0000 0 0x30>;
 			interrupts = <GIC_SPI 303 IRQ_TYPE_LEVEL_HIGH>,
 				     <GIC_SPI 304 IRQ_TYPE_LEVEL_HIGH>,
-				     <GIC_SPI 305 IRQ_TYPE_LEVEL_HIGH>;
+				     <GIC_SPI 305 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 306 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-names = "tuni0", "tuni1", "tuni2", "ticpi2";
 			clocks = <&cpg CPG_MOD 123>;
 			clock-names = "fck";
 			power-domains = <&sysc R8A774B1_PD_ALWAYS_ON>;
@@ -452,6 +457,7 @@ tmu3: timer@e6fe0000 {
 			interrupts = <GIC_SPI 131 IRQ_TYPE_LEVEL_HIGH>,
 				     <GIC_SPI 132 IRQ_TYPE_LEVEL_HIGH>,
 				     <GIC_SPI 133 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-names = "tuni0", "tuni1", "tuni2";
 			clocks = <&cpg CPG_MOD 122>;
 			clock-names = "fck";
 			power-domains = <&sysc R8A774B1_PD_ALWAYS_ON>;
@@ -465,6 +471,7 @@ tmu4: timer@ffc00000 {
 			interrupts = <GIC_SPI 406 IRQ_TYPE_LEVEL_HIGH>,
 				     <GIC_SPI 407 IRQ_TYPE_LEVEL_HIGH>,
 				     <GIC_SPI 408 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-names = "tuni0", "tuni1", "tuni2";
 			clocks = <&cpg CPG_MOD 121>;
 			clock-names = "fck";
 			power-domains = <&sysc R8A774B1_PD_ALWAYS_ON>;
diff --git a/arch/arm64/boot/dts/renesas/r8a774c0.dtsi b/arch/arm64/boot/dts/renesas/r8a774c0.dtsi
index eed94ffed7c11cbf..1ef43d78c3a5740b 100644
--- a/arch/arm64/boot/dts/renesas/r8a774c0.dtsi
+++ b/arch/arm64/boot/dts/renesas/r8a774c0.dtsi
@@ -384,6 +384,7 @@ tmu0: timer@e61e0000 {
 			interrupts = <GIC_SPI 136 IRQ_TYPE_LEVEL_HIGH>,
 				     <GIC_SPI 137 IRQ_TYPE_LEVEL_HIGH>,
 				     <GIC_SPI 138 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-names = "tuni0", "tuni1", "tuni2";
 			clocks = <&cpg CPG_MOD 125>;
 			clock-names = "fck";
 			power-domains = <&sysc R8A774C0_PD_ALWAYS_ON>;
@@ -396,7 +397,9 @@ tmu1: timer@e6fc0000 {
 			reg = <0 0xe6fc0000 0 0x30>;
 			interrupts = <GIC_SPI 128 IRQ_TYPE_LEVEL_HIGH>,
 				     <GIC_SPI 129 IRQ_TYPE_LEVEL_HIGH>,
-				     <GIC_SPI 130 IRQ_TYPE_LEVEL_HIGH>;
+				     <GIC_SPI 130 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 147 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-names = "tuni0", "tuni1", "tuni2", "ticpi2";
 			clocks = <&cpg CPG_MOD 124>;
 			clock-names = "fck";
 			power-domains = <&sysc R8A774C0_PD_ALWAYS_ON>;
@@ -409,7 +412,9 @@ tmu2: timer@e6fd0000 {
 			reg = <0 0xe6fd0000 0 0x30>;
 			interrupts = <GIC_SPI 303 IRQ_TYPE_LEVEL_HIGH>,
 				     <GIC_SPI 304 IRQ_TYPE_LEVEL_HIGH>,
-				     <GIC_SPI 305 IRQ_TYPE_LEVEL_HIGH>;
+				     <GIC_SPI 305 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 306 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-names = "tuni0", "tuni1", "tuni2", "ticpi2";
 			clocks = <&cpg CPG_MOD 123>;
 			clock-names = "fck";
 			power-domains = <&sysc R8A774C0_PD_ALWAYS_ON>;
@@ -423,6 +428,7 @@ tmu3: timer@e6fe0000 {
 			interrupts = <GIC_SPI 131 IRQ_TYPE_LEVEL_HIGH>,
 				     <GIC_SPI 132 IRQ_TYPE_LEVEL_HIGH>,
 				     <GIC_SPI 133 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-names = "tuni0", "tuni1", "tuni2";
 			clocks = <&cpg CPG_MOD 122>;
 			clock-names = "fck";
 			power-domains = <&sysc R8A774C0_PD_ALWAYS_ON>;
@@ -436,6 +442,7 @@ tmu4: timer@ffc00000 {
 			interrupts = <GIC_SPI 406 IRQ_TYPE_LEVEL_HIGH>,
 				     <GIC_SPI 407 IRQ_TYPE_LEVEL_HIGH>,
 				     <GIC_SPI 408 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-names = "tuni0", "tuni1", "tuni2";
 			clocks = <&cpg CPG_MOD 121>;
 			clock-names = "fck";
 			power-domains = <&sysc R8A774C0_PD_ALWAYS_ON>;
diff --git a/arch/arm64/boot/dts/renesas/r8a774e1.dtsi b/arch/arm64/boot/dts/renesas/r8a774e1.dtsi
index 175e5d296da6cec6..be55ae83944cf225 100644
--- a/arch/arm64/boot/dts/renesas/r8a774e1.dtsi
+++ b/arch/arm64/boot/dts/renesas/r8a774e1.dtsi
@@ -593,6 +593,7 @@ tmu0: timer@e61e0000 {
 			interrupts = <GIC_SPI 136 IRQ_TYPE_LEVEL_HIGH>,
 				     <GIC_SPI 137 IRQ_TYPE_LEVEL_HIGH>,
 				     <GIC_SPI 138 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-names = "tuni0", "tuni1", "tuni2";
 			clocks = <&cpg CPG_MOD 125>;
 			clock-names = "fck";
 			power-domains = <&sysc R8A774E1_PD_ALWAYS_ON>;
@@ -605,7 +606,9 @@ tmu1: timer@e6fc0000 {
 			reg = <0 0xe6fc0000 0 0x30>;
 			interrupts = <GIC_SPI 128 IRQ_TYPE_LEVEL_HIGH>,
 				     <GIC_SPI 129 IRQ_TYPE_LEVEL_HIGH>,
-				     <GIC_SPI 130 IRQ_TYPE_LEVEL_HIGH>;
+				     <GIC_SPI 130 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 147 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-names = "tuni0", "tuni1", "tuni2", "ticpi2";
 			clocks = <&cpg CPG_MOD 124>;
 			clock-names = "fck";
 			power-domains = <&sysc R8A774E1_PD_ALWAYS_ON>;
@@ -618,7 +621,9 @@ tmu2: timer@e6fd0000 {
 			reg = <0 0xe6fd0000 0 0x30>;
 			interrupts = <GIC_SPI 303 IRQ_TYPE_LEVEL_HIGH>,
 				     <GIC_SPI 304 IRQ_TYPE_LEVEL_HIGH>,
-				     <GIC_SPI 305 IRQ_TYPE_LEVEL_HIGH>;
+				     <GIC_SPI 305 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 306 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-names = "tuni0", "tuni1", "tuni2", "ticpi2";
 			clocks = <&cpg CPG_MOD 123>;
 			clock-names = "fck";
 			power-domains = <&sysc R8A774E1_PD_ALWAYS_ON>;
@@ -632,6 +637,7 @@ tmu3: timer@e6fe0000 {
 			interrupts = <GIC_SPI 131 IRQ_TYPE_LEVEL_HIGH>,
 				     <GIC_SPI 132 IRQ_TYPE_LEVEL_HIGH>,
 				     <GIC_SPI 133 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-names = "tuni0", "tuni1", "tuni2";
 			clocks = <&cpg CPG_MOD 122>;
 			clock-names = "fck";
 			power-domains = <&sysc R8A774E1_PD_ALWAYS_ON>;
@@ -645,6 +651,7 @@ tmu4: timer@ffc00000 {
 			interrupts = <GIC_SPI 406 IRQ_TYPE_LEVEL_HIGH>,
 				     <GIC_SPI 407 IRQ_TYPE_LEVEL_HIGH>,
 				     <GIC_SPI 408 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-names = "tuni0", "tuni1", "tuni2";
 			clocks = <&cpg CPG_MOD 121>;
 			clock-names = "fck";
 			power-domains = <&sysc R8A774E1_PD_ALWAYS_ON>;
diff --git a/arch/arm64/boot/dts/renesas/r8a77951.dtsi b/arch/arm64/boot/dts/renesas/r8a77951.dtsi
index a4260d9291bac365..bea4edd17d534909 100644
--- a/arch/arm64/boot/dts/renesas/r8a77951.dtsi
+++ b/arch/arm64/boot/dts/renesas/r8a77951.dtsi
@@ -614,6 +614,7 @@ tmu0: timer@e61e0000 {
 			interrupts = <GIC_SPI 136 IRQ_TYPE_LEVEL_HIGH>,
 				     <GIC_SPI 137 IRQ_TYPE_LEVEL_HIGH>,
 				     <GIC_SPI 138 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-names = "tuni0", "tuni1", "tuni2";
 			clocks = <&cpg CPG_MOD 125>;
 			clock-names = "fck";
 			power-domains = <&sysc R8A7795_PD_ALWAYS_ON>;
@@ -626,7 +627,9 @@ tmu1: timer@e6fc0000 {
 			reg = <0 0xe6fc0000 0 0x30>;
 			interrupts = <GIC_SPI 128 IRQ_TYPE_LEVEL_HIGH>,
 				     <GIC_SPI 129 IRQ_TYPE_LEVEL_HIGH>,
-				     <GIC_SPI 130 IRQ_TYPE_LEVEL_HIGH>;
+				     <GIC_SPI 130 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 147 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-names = "tuni0", "tuni1", "tuni2", "ticpi2";
 			clocks = <&cpg CPG_MOD 124>;
 			clock-names = "fck";
 			power-domains = <&sysc R8A7795_PD_ALWAYS_ON>;
@@ -639,7 +642,9 @@ tmu2: timer@e6fd0000 {
 			reg = <0 0xe6fd0000 0 0x30>;
 			interrupts = <GIC_SPI 303 IRQ_TYPE_LEVEL_HIGH>,
 				     <GIC_SPI 304 IRQ_TYPE_LEVEL_HIGH>,
-				     <GIC_SPI 305 IRQ_TYPE_LEVEL_HIGH>;
+				     <GIC_SPI 305 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 306 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-names = "tuni0", "tuni1", "tuni2", "ticpi2";
 			clocks = <&cpg CPG_MOD 123>;
 			clock-names = "fck";
 			power-domains = <&sysc R8A7795_PD_ALWAYS_ON>;
@@ -653,6 +658,7 @@ tmu3: timer@e6fe0000 {
 			interrupts = <GIC_SPI 131 IRQ_TYPE_LEVEL_HIGH>,
 				     <GIC_SPI 132 IRQ_TYPE_LEVEL_HIGH>,
 				     <GIC_SPI 133 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-names = "tuni0", "tuni1", "tuni2";
 			clocks = <&cpg CPG_MOD 122>;
 			clock-names = "fck";
 			power-domains = <&sysc R8A7795_PD_ALWAYS_ON>;
@@ -666,6 +672,7 @@ tmu4: timer@ffc00000 {
 			interrupts = <GIC_SPI 406 IRQ_TYPE_LEVEL_HIGH>,
 				     <GIC_SPI 407 IRQ_TYPE_LEVEL_HIGH>,
 				     <GIC_SPI 408 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-names = "tuni0", "tuni1", "tuni2";
 			clocks = <&cpg CPG_MOD 121>;
 			clock-names = "fck";
 			power-domains = <&sysc R8A7795_PD_ALWAYS_ON>;
diff --git a/arch/arm64/boot/dts/renesas/r8a77960.dtsi b/arch/arm64/boot/dts/renesas/r8a77960.dtsi
index a631ead171b29a43..7846fea8e40da725 100644
--- a/arch/arm64/boot/dts/renesas/r8a77960.dtsi
+++ b/arch/arm64/boot/dts/renesas/r8a77960.dtsi
@@ -578,6 +578,7 @@ tmu0: timer@e61e0000 {
 			interrupts = <GIC_SPI 136 IRQ_TYPE_LEVEL_HIGH>,
 				     <GIC_SPI 137 IRQ_TYPE_LEVEL_HIGH>,
 				     <GIC_SPI 138 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-names = "tuni0", "tuni1", "tuni2";
 			clocks = <&cpg CPG_MOD 125>;
 			clock-names = "fck";
 			power-domains = <&sysc R8A7796_PD_ALWAYS_ON>;
@@ -590,7 +591,9 @@ tmu1: timer@e6fc0000 {
 			reg = <0 0xe6fc0000 0 0x30>;
 			interrupts = <GIC_SPI 128 IRQ_TYPE_LEVEL_HIGH>,
 				     <GIC_SPI 129 IRQ_TYPE_LEVEL_HIGH>,
-				     <GIC_SPI 130 IRQ_TYPE_LEVEL_HIGH>;
+				     <GIC_SPI 130 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 147 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-names = "tuni0", "tuni1", "tuni2", "ticpi2";
 			clocks = <&cpg CPG_MOD 124>;
 			clock-names = "fck";
 			power-domains = <&sysc R8A7796_PD_ALWAYS_ON>;
@@ -603,7 +606,9 @@ tmu2: timer@e6fd0000 {
 			reg = <0 0xe6fd0000 0 0x30>;
 			interrupts = <GIC_SPI 303 IRQ_TYPE_LEVEL_HIGH>,
 				     <GIC_SPI 304 IRQ_TYPE_LEVEL_HIGH>,
-				     <GIC_SPI 305 IRQ_TYPE_LEVEL_HIGH>;
+				     <GIC_SPI 305 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 306 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-names = "tuni0", "tuni1", "tuni2", "ticpi2";
 			clocks = <&cpg CPG_MOD 123>;
 			clock-names = "fck";
 			power-domains = <&sysc R8A7796_PD_ALWAYS_ON>;
@@ -617,6 +622,7 @@ tmu3: timer@e6fe0000 {
 			interrupts = <GIC_SPI 131 IRQ_TYPE_LEVEL_HIGH>,
 				     <GIC_SPI 132 IRQ_TYPE_LEVEL_HIGH>,
 				     <GIC_SPI 133 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-names = "tuni0", "tuni1", "tuni2";
 			clocks = <&cpg CPG_MOD 122>;
 			clock-names = "fck";
 			power-domains = <&sysc R8A7796_PD_ALWAYS_ON>;
@@ -630,6 +636,7 @@ tmu4: timer@ffc00000 {
 			interrupts = <GIC_SPI 406 IRQ_TYPE_LEVEL_HIGH>,
 				     <GIC_SPI 407 IRQ_TYPE_LEVEL_HIGH>,
 				     <GIC_SPI 408 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-names = "tuni0", "tuni1", "tuni2";
 			clocks = <&cpg CPG_MOD 121>;
 			clock-names = "fck";
 			power-domains = <&sysc R8A7796_PD_ALWAYS_ON>;
diff --git a/arch/arm64/boot/dts/renesas/r8a77961.dtsi b/arch/arm64/boot/dts/renesas/r8a77961.dtsi
index 7254912a241f96f3..58f9286a5ab57534 100644
--- a/arch/arm64/boot/dts/renesas/r8a77961.dtsi
+++ b/arch/arm64/boot/dts/renesas/r8a77961.dtsi
@@ -578,6 +578,7 @@ tmu0: timer@e61e0000 {
 			interrupts = <GIC_SPI 136 IRQ_TYPE_LEVEL_HIGH>,
 				     <GIC_SPI 137 IRQ_TYPE_LEVEL_HIGH>,
 				     <GIC_SPI 138 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-names = "tuni0", "tuni1", "tuni2";
 			clocks = <&cpg CPG_MOD 125>;
 			clock-names = "fck";
 			power-domains = <&sysc R8A77961_PD_ALWAYS_ON>;
@@ -590,7 +591,9 @@ tmu1: timer@e6fc0000 {
 			reg = <0 0xe6fc0000 0 0x30>;
 			interrupts = <GIC_SPI 128 IRQ_TYPE_LEVEL_HIGH>,
 				     <GIC_SPI 129 IRQ_TYPE_LEVEL_HIGH>,
-				     <GIC_SPI 130 IRQ_TYPE_LEVEL_HIGH>;
+				     <GIC_SPI 130 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 147 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-names = "tuni0", "tuni1", "tuni2", "ticpi2";
 			clocks = <&cpg CPG_MOD 124>;
 			clock-names = "fck";
 			power-domains = <&sysc R8A77961_PD_ALWAYS_ON>;
@@ -603,7 +606,9 @@ tmu2: timer@e6fd0000 {
 			reg = <0 0xe6fd0000 0 0x30>;
 			interrupts = <GIC_SPI 303 IRQ_TYPE_LEVEL_HIGH>,
 				     <GIC_SPI 304 IRQ_TYPE_LEVEL_HIGH>,
-				     <GIC_SPI 305 IRQ_TYPE_LEVEL_HIGH>;
+				     <GIC_SPI 305 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 306 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-names = "tuni0", "tuni1", "tuni2", "ticpi2";
 			clocks = <&cpg CPG_MOD 123>;
 			clock-names = "fck";
 			power-domains = <&sysc R8A77961_PD_ALWAYS_ON>;
@@ -617,6 +622,7 @@ tmu3: timer@e6fe0000 {
 			interrupts = <GIC_SPI 131 IRQ_TYPE_LEVEL_HIGH>,
 				     <GIC_SPI 132 IRQ_TYPE_LEVEL_HIGH>,
 				     <GIC_SPI 133 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-names = "tuni0", "tuni1", "tuni2";
 			clocks = <&cpg CPG_MOD 122>;
 			clock-names = "fck";
 			power-domains = <&sysc R8A77961_PD_ALWAYS_ON>;
@@ -630,6 +636,7 @@ tmu4: timer@ffc00000 {
 			interrupts = <GIC_SPI 406 IRQ_TYPE_LEVEL_HIGH>,
 				     <GIC_SPI 407 IRQ_TYPE_LEVEL_HIGH>,
 				     <GIC_SPI 408 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-names = "tuni0", "tuni1", "tuni2";
 			clocks = <&cpg CPG_MOD 121>;
 			clock-names = "fck";
 			power-domains = <&sysc R8A77961_PD_ALWAYS_ON>;
diff --git a/arch/arm64/boot/dts/renesas/r8a77965.dtsi b/arch/arm64/boot/dts/renesas/r8a77965.dtsi
index e57b9027066eb6e7..692940662d38d89a 100644
--- a/arch/arm64/boot/dts/renesas/r8a77965.dtsi
+++ b/arch/arm64/boot/dts/renesas/r8a77965.dtsi
@@ -449,6 +449,7 @@ tmu0: timer@e61e0000 {
 			interrupts = <GIC_SPI 136 IRQ_TYPE_LEVEL_HIGH>,
 				     <GIC_SPI 137 IRQ_TYPE_LEVEL_HIGH>,
 				     <GIC_SPI 138 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-names = "tuni0", "tuni1", "tuni2";
 			clocks = <&cpg CPG_MOD 125>;
 			clock-names = "fck";
 			power-domains = <&sysc R8A77965_PD_ALWAYS_ON>;
@@ -461,7 +462,9 @@ tmu1: timer@e6fc0000 {
 			reg = <0 0xe6fc0000 0 0x30>;
 			interrupts = <GIC_SPI 128 IRQ_TYPE_LEVEL_HIGH>,
 				     <GIC_SPI 129 IRQ_TYPE_LEVEL_HIGH>,
-				     <GIC_SPI 130 IRQ_TYPE_LEVEL_HIGH>;
+				     <GIC_SPI 130 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 147 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-names = "tuni0", "tuni1", "tuni2", "ticpi2";
 			clocks = <&cpg CPG_MOD 124>;
 			clock-names = "fck";
 			power-domains = <&sysc R8A77965_PD_ALWAYS_ON>;
@@ -474,7 +477,9 @@ tmu2: timer@e6fd0000 {
 			reg = <0 0xe6fd0000 0 0x30>;
 			interrupts = <GIC_SPI 303 IRQ_TYPE_LEVEL_HIGH>,
 				     <GIC_SPI 304 IRQ_TYPE_LEVEL_HIGH>,
-				     <GIC_SPI 305 IRQ_TYPE_LEVEL_HIGH>;
+				     <GIC_SPI 305 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 306 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-names = "tuni0", "tuni1", "tuni2", "ticpi2";
 			clocks = <&cpg CPG_MOD 123>;
 			clock-names = "fck";
 			power-domains = <&sysc R8A77965_PD_ALWAYS_ON>;
@@ -488,6 +493,7 @@ tmu3: timer@e6fe0000 {
 			interrupts = <GIC_SPI 131 IRQ_TYPE_LEVEL_HIGH>,
 				     <GIC_SPI 132 IRQ_TYPE_LEVEL_HIGH>,
 				     <GIC_SPI 133 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-names = "tuni0", "tuni1", "tuni2";
 			clocks = <&cpg CPG_MOD 122>;
 			clock-names = "fck";
 			power-domains = <&sysc R8A77965_PD_ALWAYS_ON>;
@@ -501,6 +507,7 @@ tmu4: timer@ffc00000 {
 			interrupts = <GIC_SPI 406 IRQ_TYPE_LEVEL_HIGH>,
 				     <GIC_SPI 407 IRQ_TYPE_LEVEL_HIGH>,
 				     <GIC_SPI 408 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-names = "tuni0", "tuni1", "tuni2";
 			clocks = <&cpg CPG_MOD 121>;
 			clock-names = "fck";
 			power-domains = <&sysc R8A77965_PD_ALWAYS_ON>;
diff --git a/arch/arm64/boot/dts/renesas/r8a77970.dtsi b/arch/arm64/boot/dts/renesas/r8a77970.dtsi
index ed6e2e47c60479ef..d2d3cecc76d52f86 100644
--- a/arch/arm64/boot/dts/renesas/r8a77970.dtsi
+++ b/arch/arm64/boot/dts/renesas/r8a77970.dtsi
@@ -328,6 +328,7 @@ tmu0: timer@e61e0000 {
 			interrupts = <GIC_SPI 136 IRQ_TYPE_LEVEL_HIGH>,
 				     <GIC_SPI 137 IRQ_TYPE_LEVEL_HIGH>,
 				     <GIC_SPI 138 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-names = "tuni0", "tuni1", "tuni2";
 			clocks = <&cpg CPG_MOD 125>;
 			clock-names = "fck";
 			power-domains = <&sysc R8A77970_PD_ALWAYS_ON>;
@@ -340,7 +341,9 @@ tmu1: timer@e6fc0000 {
 			reg = <0 0xe6fc0000 0 0x30>;
 			interrupts = <GIC_SPI 128 IRQ_TYPE_LEVEL_HIGH>,
 				     <GIC_SPI 129 IRQ_TYPE_LEVEL_HIGH>,
-				     <GIC_SPI 130 IRQ_TYPE_LEVEL_HIGH>;
+				     <GIC_SPI 130 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 147 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-names = "tuni0", "tuni1", "tuni2", "ticpi2";
 			clocks = <&cpg CPG_MOD 124>;
 			clock-names = "fck";
 			power-domains = <&sysc R8A77970_PD_ALWAYS_ON>;
@@ -353,7 +356,9 @@ tmu2: timer@e6fd0000 {
 			reg = <0 0xe6fd0000 0 0x30>;
 			interrupts = <GIC_SPI 303 IRQ_TYPE_LEVEL_HIGH>,
 				     <GIC_SPI 304 IRQ_TYPE_LEVEL_HIGH>,
-				     <GIC_SPI 305 IRQ_TYPE_LEVEL_HIGH>;
+				     <GIC_SPI 305 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 306 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-names = "tuni0", "tuni1", "tuni2", "ticpi2";
 			clocks = <&cpg CPG_MOD 123>;
 			clock-names = "fck";
 			power-domains = <&sysc R8A77970_PD_ALWAYS_ON>;
@@ -367,6 +372,7 @@ tmu3: timer@e6fe0000 {
 			interrupts = <GIC_SPI 131 IRQ_TYPE_LEVEL_HIGH>,
 				     <GIC_SPI 132 IRQ_TYPE_LEVEL_HIGH>,
 				     <GIC_SPI 133 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-names = "tuni0", "tuni1", "tuni2";
 			clocks = <&cpg CPG_MOD 122>;
 			clock-names = "fck";
 			power-domains = <&sysc R8A77970_PD_ALWAYS_ON>;
@@ -380,6 +386,7 @@ tmu4: timer@ffc00000 {
 			interrupts = <GIC_SPI 116 IRQ_TYPE_LEVEL_HIGH>,
 				     <GIC_SPI 117 IRQ_TYPE_LEVEL_HIGH>,
 				     <GIC_SPI 118 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-names = "tuni0", "tuni1", "tuni2";
 			clocks = <&cpg CPG_MOD 121>;
 			clock-names = "fck";
 			power-domains = <&sysc R8A77970_PD_ALWAYS_ON>;
diff --git a/arch/arm64/boot/dts/renesas/r8a77980.dtsi b/arch/arm64/boot/dts/renesas/r8a77980.dtsi
index 5ed2daaca1f00649..c0ba110c74d6a3ac 100644
--- a/arch/arm64/boot/dts/renesas/r8a77980.dtsi
+++ b/arch/arm64/boot/dts/renesas/r8a77980.dtsi
@@ -357,6 +357,7 @@ tmu0: timer@e61e0000 {
 			interrupts = <GIC_SPI 136 IRQ_TYPE_LEVEL_HIGH>,
 				     <GIC_SPI 137 IRQ_TYPE_LEVEL_HIGH>,
 				     <GIC_SPI 138 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-names = "tuni0", "tuni1", "tuni2";
 			clocks = <&cpg CPG_MOD 125>;
 			clock-names = "fck";
 			power-domains = <&sysc R8A77980_PD_ALWAYS_ON>;
@@ -369,7 +370,9 @@ tmu1: timer@e6fc0000 {
 			reg = <0 0xe6fc0000 0 0x30>;
 			interrupts = <GIC_SPI 128 IRQ_TYPE_LEVEL_HIGH>,
 				     <GIC_SPI 129 IRQ_TYPE_LEVEL_HIGH>,
-				     <GIC_SPI 130 IRQ_TYPE_LEVEL_HIGH>;
+				     <GIC_SPI 130 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 147 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-names = "tuni0", "tuni1", "tuni2", "ticpi2";
 			clocks = <&cpg CPG_MOD 124>;
 			clock-names = "fck";
 			power-domains = <&sysc R8A77980_PD_ALWAYS_ON>;
@@ -382,7 +385,9 @@ tmu2: timer@e6fd0000 {
 			reg = <0 0xe6fd0000 0 0x30>;
 			interrupts = <GIC_SPI 303 IRQ_TYPE_LEVEL_HIGH>,
 				     <GIC_SPI 304 IRQ_TYPE_LEVEL_HIGH>,
-				     <GIC_SPI 305 IRQ_TYPE_LEVEL_HIGH>;
+				     <GIC_SPI 305 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 306 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-names = "tuni0", "tuni1", "tuni2", "ticpi2";
 			clocks = <&cpg CPG_MOD 123>;
 			clock-names = "fck";
 			power-domains = <&sysc R8A77980_PD_ALWAYS_ON>;
@@ -395,7 +400,9 @@ tmu3: timer@e6fe0000 {
 			reg = <0 0xe6fe0000 0 0x30>;
 			interrupts = <GIC_SPI 131 IRQ_TYPE_LEVEL_HIGH>,
 				     <GIC_SPI 132 IRQ_TYPE_LEVEL_HIGH>,
-				     <GIC_SPI 133 IRQ_TYPE_LEVEL_HIGH>;
+				     <GIC_SPI 133 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 146 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-names = "tuni0", "tuni1", "tuni2", "ticpi2";
 			clocks = <&cpg CPG_MOD 122>;
 			clock-names = "fck";
 			power-domains = <&sysc R8A77980_PD_ALWAYS_ON>;
@@ -408,7 +415,9 @@ tmu4: timer@ffc00000 {
 			reg = <0 0xffc00000 0 0x30>;
 			interrupts = <GIC_SPI 116 IRQ_TYPE_LEVEL_HIGH>,
 				     <GIC_SPI 117 IRQ_TYPE_LEVEL_HIGH>,
-				     <GIC_SPI 118 IRQ_TYPE_LEVEL_HIGH>;
+				     <GIC_SPI 118 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 369 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-names = "tuni0", "tuni1", "tuni2", "ticpi2";
 			clocks = <&cpg CPG_MOD 121>;
 			clock-names = "fck";
 			power-domains = <&sysc R8A77980_PD_ALWAYS_ON>;
diff --git a/arch/arm64/boot/dts/renesas/r8a77990.dtsi b/arch/arm64/boot/dts/renesas/r8a77990.dtsi
index 8c2b28342387c7f2..37063e3f4e1be06d 100644
--- a/arch/arm64/boot/dts/renesas/r8a77990.dtsi
+++ b/arch/arm64/boot/dts/renesas/r8a77990.dtsi
@@ -415,6 +415,7 @@ tmu0: timer@e61e0000 {
 			interrupts = <GIC_SPI 136 IRQ_TYPE_LEVEL_HIGH>,
 				     <GIC_SPI 137 IRQ_TYPE_LEVEL_HIGH>,
 				     <GIC_SPI 138 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-names = "tuni0", "tuni1", "tuni2";
 			clocks = <&cpg CPG_MOD 125>;
 			clock-names = "fck";
 			power-domains = <&sysc R8A77990_PD_ALWAYS_ON>;
@@ -427,7 +428,9 @@ tmu1: timer@e6fc0000 {
 			reg = <0 0xe6fc0000 0 0x30>;
 			interrupts = <GIC_SPI 128 IRQ_TYPE_LEVEL_HIGH>,
 				     <GIC_SPI 129 IRQ_TYPE_LEVEL_HIGH>,
-				     <GIC_SPI 130 IRQ_TYPE_LEVEL_HIGH>;
+				     <GIC_SPI 130 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 147 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-names = "tuni0", "tuni1", "tuni2", "ticpi2";
 			clocks = <&cpg CPG_MOD 124>;
 			clock-names = "fck";
 			power-domains = <&sysc R8A77990_PD_ALWAYS_ON>;
@@ -440,7 +443,9 @@ tmu2: timer@e6fd0000 {
 			reg = <0 0xe6fd0000 0 0x30>;
 			interrupts = <GIC_SPI 303 IRQ_TYPE_LEVEL_HIGH>,
 				     <GIC_SPI 304 IRQ_TYPE_LEVEL_HIGH>,
-				     <GIC_SPI 305 IRQ_TYPE_LEVEL_HIGH>;
+				     <GIC_SPI 305 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 306 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-names = "tuni0", "tuni1", "tuni2", "ticpi2";
 			clocks = <&cpg CPG_MOD 123>;
 			clock-names = "fck";
 			power-domains = <&sysc R8A77990_PD_ALWAYS_ON>;
@@ -454,6 +459,7 @@ tmu3: timer@e6fe0000 {
 			interrupts = <GIC_SPI 131 IRQ_TYPE_LEVEL_HIGH>,
 				     <GIC_SPI 132 IRQ_TYPE_LEVEL_HIGH>,
 				     <GIC_SPI 133 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-names = "tuni0", "tuni1", "tuni2";
 			clocks = <&cpg CPG_MOD 122>;
 			clock-names = "fck";
 			power-domains = <&sysc R8A77990_PD_ALWAYS_ON>;
@@ -467,6 +473,7 @@ tmu4: timer@ffc00000 {
 			interrupts = <GIC_SPI 406 IRQ_TYPE_LEVEL_HIGH>,
 				     <GIC_SPI 407 IRQ_TYPE_LEVEL_HIGH>,
 				     <GIC_SPI 408 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-names = "tuni0", "tuni1", "tuni2";
 			clocks = <&cpg CPG_MOD 121>;
 			clock-names = "fck";
 			power-domains = <&sysc R8A77990_PD_ALWAYS_ON>;
diff --git a/arch/arm64/boot/dts/renesas/r8a77995.dtsi b/arch/arm64/boot/dts/renesas/r8a77995.dtsi
index 8cf6473c63d37dd0..89990dd8ebf7f182 100644
--- a/arch/arm64/boot/dts/renesas/r8a77995.dtsi
+++ b/arch/arm64/boot/dts/renesas/r8a77995.dtsi
@@ -336,6 +336,7 @@ tmu0: timer@e61e0000 {
 			interrupts = <GIC_SPI 136 IRQ_TYPE_LEVEL_HIGH>,
 				     <GIC_SPI 137 IRQ_TYPE_LEVEL_HIGH>,
 				     <GIC_SPI 138 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-names = "tuni0", "tuni1", "tuni2";
 			clocks = <&cpg CPG_MOD 125>;
 			clock-names = "fck";
 			power-domains = <&sysc R8A77995_PD_ALWAYS_ON>;
@@ -348,7 +349,9 @@ tmu1: timer@e6fc0000 {
 			reg = <0 0xe6fc0000 0 0x30>;
 			interrupts = <GIC_SPI 128 IRQ_TYPE_LEVEL_HIGH>,
 				     <GIC_SPI 129 IRQ_TYPE_LEVEL_HIGH>,
-				     <GIC_SPI 130 IRQ_TYPE_LEVEL_HIGH>;
+				     <GIC_SPI 130 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 147 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-names = "tuni0", "tuni1", "tuni2", "ticpi2";
 			clocks = <&cpg CPG_MOD 124>;
 			clock-names = "fck";
 			power-domains = <&sysc R8A77995_PD_ALWAYS_ON>;
@@ -361,7 +364,9 @@ tmu2: timer@e6fd0000 {
 			reg = <0 0xe6fd0000 0 0x30>;
 			interrupts = <GIC_SPI 303 IRQ_TYPE_LEVEL_HIGH>,
 				     <GIC_SPI 304 IRQ_TYPE_LEVEL_HIGH>,
-				     <GIC_SPI 305 IRQ_TYPE_LEVEL_HIGH>;
+				     <GIC_SPI 305 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 306 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-names = "tuni0", "tuni1", "tuni2", "ticpi2";
 			clocks = <&cpg CPG_MOD 123>;
 			clock-names = "fck";
 			power-domains = <&sysc R8A77995_PD_ALWAYS_ON>;
@@ -375,6 +380,7 @@ tmu3: timer@e6fe0000 {
 			interrupts = <GIC_SPI 131 IRQ_TYPE_LEVEL_HIGH>,
 				     <GIC_SPI 132 IRQ_TYPE_LEVEL_HIGH>,
 				     <GIC_SPI 133 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-names = "tuni0", "tuni1", "tuni2";
 			clocks = <&cpg CPG_MOD 122>;
 			clock-names = "fck";
 			power-domains = <&sysc R8A77995_PD_ALWAYS_ON>;
@@ -388,6 +394,7 @@ tmu4: timer@ffc00000 {
 			interrupts = <GIC_SPI 406 IRQ_TYPE_LEVEL_HIGH>,
 				     <GIC_SPI 407 IRQ_TYPE_LEVEL_HIGH>,
 				     <GIC_SPI 408 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-names = "tuni0", "tuni1", "tuni2";
 			clocks = <&cpg CPG_MOD 121>;
 			clock-names = "fck";
 			power-domains = <&sysc R8A77995_PD_ALWAYS_ON>;
diff --git a/arch/arm64/boot/dts/renesas/r8a779a0.dtsi b/arch/arm64/boot/dts/renesas/r8a779a0.dtsi
index 4e67a03564971b89..2f8f2ccab8c23728 100644
--- a/arch/arm64/boot/dts/renesas/r8a779a0.dtsi
+++ b/arch/arm64/boot/dts/renesas/r8a779a0.dtsi
@@ -370,6 +370,7 @@ tmu0: timer@e61e0000 {
 			interrupts = <GIC_SPI 512 IRQ_TYPE_LEVEL_HIGH>,
 				     <GIC_SPI 513 IRQ_TYPE_LEVEL_HIGH>,
 				     <GIC_SPI 514 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-names = "tuni0", "tuni1", "tuni2";
 			clocks = <&cpg CPG_MOD 713>;
 			clock-names = "fck";
 			power-domains = <&sysc R8A779A0_PD_ALWAYS_ON>;
@@ -382,7 +383,9 @@ tmu1: timer@e6fc0000 {
 			reg = <0 0xe6fc0000 0 0x30>;
 			interrupts = <GIC_SPI 504 IRQ_TYPE_LEVEL_HIGH>,
 				     <GIC_SPI 505 IRQ_TYPE_LEVEL_HIGH>,
-				     <GIC_SPI 506 IRQ_TYPE_LEVEL_HIGH>;
+				     <GIC_SPI 506 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 507 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-names = "tuni0", "tuni1", "tuni2", "ticpi2";
 			clocks = <&cpg CPG_MOD 714>;
 			clock-names = "fck";
 			power-domains = <&sysc R8A779A0_PD_ALWAYS_ON>;
@@ -395,7 +398,9 @@ tmu2: timer@e6fd0000 {
 			reg = <0 0xe6fd0000 0 0x30>;
 			interrupts = <GIC_SPI 508 IRQ_TYPE_LEVEL_HIGH>,
 				     <GIC_SPI 509 IRQ_TYPE_LEVEL_HIGH>,
-				     <GIC_SPI 510 IRQ_TYPE_LEVEL_HIGH>;
+				     <GIC_SPI 510 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 511 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-names = "tuni0", "tuni1", "tuni2", "ticpi2";
 			clocks = <&cpg CPG_MOD 715>;
 			clock-names = "fck";
 			power-domains = <&sysc R8A779A0_PD_ALWAYS_ON>;
@@ -408,7 +413,9 @@ tmu3: timer@e6fe0000 {
 			reg = <0 0xe6fe0000 0 0x30>;
 			interrupts = <GIC_SPI 472 IRQ_TYPE_LEVEL_HIGH>,
 				     <GIC_SPI 473 IRQ_TYPE_LEVEL_HIGH>,
-				     <GIC_SPI 474 IRQ_TYPE_LEVEL_HIGH>;
+				     <GIC_SPI 474 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 475 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-names = "tuni0", "tuni1", "tuni2", "ticpi2";
 			clocks = <&cpg CPG_MOD 716>;
 			clock-names = "fck";
 			power-domains = <&sysc R8A779A0_PD_ALWAYS_ON>;
@@ -421,7 +428,9 @@ tmu4: timer@ffc00000 {
 			reg = <0 0xffc00000 0 0x30>;
 			interrupts = <GIC_SPI 476 IRQ_TYPE_LEVEL_HIGH>,
 				     <GIC_SPI 477 IRQ_TYPE_LEVEL_HIGH>,
-				     <GIC_SPI 478 IRQ_TYPE_LEVEL_HIGH>;
+				     <GIC_SPI 478 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 479 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-names = "tuni0", "tuni1", "tuni2", "ticpi2";
 			clocks = <&cpg CPG_MOD 717>;
 			clock-names = "fck";
 			power-domains = <&sysc R8A779A0_PD_ALWAYS_ON>;
diff --git a/arch/arm64/boot/dts/renesas/r8a779f0.dtsi b/arch/arm64/boot/dts/renesas/r8a779f0.dtsi
index 7fb4989cce8a63f1..72cf30341fc4d63e 100644
--- a/arch/arm64/boot/dts/renesas/r8a779f0.dtsi
+++ b/arch/arm64/boot/dts/renesas/r8a779f0.dtsi
@@ -501,6 +501,7 @@ tmu0: timer@e61e0000 {
 			interrupts = <GIC_SPI 474 IRQ_TYPE_LEVEL_HIGH>,
 				     <GIC_SPI 475 IRQ_TYPE_LEVEL_HIGH>,
 				     <GIC_SPI 476 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-names = "tuni0", "tuni1", "tuni2";
 			clocks = <&cpg CPG_MOD 713>;
 			clock-names = "fck";
 			power-domains = <&sysc R8A779F0_PD_ALWAYS_ON>;
@@ -513,7 +514,9 @@ tmu1: timer@e6fc0000 {
 			reg = <0 0xe6fc0000 0 0x30>;
 			interrupts = <GIC_SPI 477 IRQ_TYPE_LEVEL_HIGH>,
 				     <GIC_SPI 478 IRQ_TYPE_LEVEL_HIGH>,
-				     <GIC_SPI 479 IRQ_TYPE_LEVEL_HIGH>;
+				     <GIC_SPI 479 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 480 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-names = "tuni0", "tuni1", "tuni2", "ticpi2";
 			clocks = <&cpg CPG_MOD 714>;
 			clock-names = "fck";
 			power-domains = <&sysc R8A779F0_PD_ALWAYS_ON>;
@@ -526,7 +529,9 @@ tmu2: timer@e6fd0000 {
 			reg = <0 0xe6fd0000 0 0x30>;
 			interrupts = <GIC_SPI 481 IRQ_TYPE_LEVEL_HIGH>,
 				     <GIC_SPI 482 IRQ_TYPE_LEVEL_HIGH>,
-				     <GIC_SPI 483 IRQ_TYPE_LEVEL_HIGH>;
+				     <GIC_SPI 483 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 484 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-names = "tuni0", "tuni1", "tuni2", "ticpi2";
 			clocks = <&cpg CPG_MOD 715>;
 			clock-names = "fck";
 			power-domains = <&sysc R8A779F0_PD_ALWAYS_ON>;
@@ -539,7 +544,9 @@ tmu3: timer@e6fe0000 {
 			reg = <0 0xe6fe0000 0 0x30>;
 			interrupts = <GIC_SPI 485 IRQ_TYPE_LEVEL_HIGH>,
 				     <GIC_SPI 486 IRQ_TYPE_LEVEL_HIGH>,
-				     <GIC_SPI 487 IRQ_TYPE_LEVEL_HIGH>;
+				     <GIC_SPI 487 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 488 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-names = "tuni0", "tuni1", "tuni2", "ticpi2";
 			clocks = <&cpg CPG_MOD 716>;
 			clock-names = "fck";
 			power-domains = <&sysc R8A779F0_PD_ALWAYS_ON>;
@@ -552,7 +559,9 @@ tmu4: timer@ffc00000 {
 			reg = <0 0xffc00000 0 0x30>;
 			interrupts = <GIC_SPI 489 IRQ_TYPE_LEVEL_HIGH>,
 				     <GIC_SPI 490 IRQ_TYPE_LEVEL_HIGH>,
-				     <GIC_SPI 491 IRQ_TYPE_LEVEL_HIGH>;
+				     <GIC_SPI 491 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 492 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-names = "tuni0", "tuni1", "tuni2", "ticpi2";
 			clocks = <&cpg CPG_MOD 717>;
 			clock-names = "fck";
 			power-domains = <&sysc R8A779F0_PD_ALWAYS_ON>;
diff --git a/arch/arm64/boot/dts/renesas/r8a779g0.dtsi b/arch/arm64/boot/dts/renesas/r8a779g0.dtsi
index 3be1159982b204e9..0a46f315c307e3cb 100644
--- a/arch/arm64/boot/dts/renesas/r8a779g0.dtsi
+++ b/arch/arm64/boot/dts/renesas/r8a779g0.dtsi
@@ -479,6 +479,7 @@ tmu0: timer@e61e0000 {
 			interrupts = <GIC_SPI 289 IRQ_TYPE_LEVEL_HIGH>,
 				     <GIC_SPI 290 IRQ_TYPE_LEVEL_HIGH>,
 				     <GIC_SPI 291 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-names = "tuni0", "tuni1", "tuni2";
 			clocks = <&cpg CPG_MOD 713>;
 			clock-names = "fck";
 			power-domains = <&sysc R8A779G0_PD_ALWAYS_ON>;
@@ -491,7 +492,9 @@ tmu1: timer@e6fc0000 {
 			reg = <0 0xe6fc0000 0 0x30>;
 			interrupts = <GIC_SPI 292 IRQ_TYPE_LEVEL_HIGH>,
 				     <GIC_SPI 293 IRQ_TYPE_LEVEL_HIGH>,
-				     <GIC_SPI 294 IRQ_TYPE_LEVEL_HIGH>;
+				     <GIC_SPI 294 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 295 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-names = "tuni0", "tuni1", "tuni2", "ticpi2";
 			clocks = <&cpg CPG_MOD 714>;
 			clock-names = "fck";
 			power-domains = <&sysc R8A779G0_PD_ALWAYS_ON>;
@@ -504,7 +507,9 @@ tmu2: timer@e6fd0000 {
 			reg = <0 0xe6fd0000 0 0x30>;
 			interrupts = <GIC_SPI 296 IRQ_TYPE_LEVEL_HIGH>,
 				     <GIC_SPI 297 IRQ_TYPE_LEVEL_HIGH>,
-				     <GIC_SPI 298 IRQ_TYPE_LEVEL_HIGH>;
+				     <GIC_SPI 298 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 299 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-names = "tuni0", "tuni1", "tuni2", "ticpi2";
 			clocks = <&cpg CPG_MOD 715>;
 			clock-names = "fck";
 			power-domains = <&sysc R8A779G0_PD_ALWAYS_ON>;
@@ -517,7 +522,9 @@ tmu3: timer@e6fe0000 {
 			reg = <0 0xe6fe0000 0 0x30>;
 			interrupts = <GIC_SPI 300 IRQ_TYPE_LEVEL_HIGH>,
 				     <GIC_SPI 301 IRQ_TYPE_LEVEL_HIGH>,
-				     <GIC_SPI 302 IRQ_TYPE_LEVEL_HIGH>;
+				     <GIC_SPI 302 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 303 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-names = "tuni0", "tuni1", "tuni2", "ticpi2";
 			clocks = <&cpg CPG_MOD 716>;
 			clock-names = "fck";
 			power-domains = <&sysc R8A779G0_PD_ALWAYS_ON>;
@@ -530,7 +537,9 @@ tmu4: timer@ffc00000 {
 			reg = <0 0xffc00000 0 0x30>;
 			interrupts = <GIC_SPI 304 IRQ_TYPE_LEVEL_HIGH>,
 				     <GIC_SPI 305 IRQ_TYPE_LEVEL_HIGH>,
-				     <GIC_SPI 306 IRQ_TYPE_LEVEL_HIGH>;
+				     <GIC_SPI 306 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 307 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-names = "tuni0", "tuni1", "tuni2", "ticpi2";
 			clocks = <&cpg CPG_MOD 717>;
 			clock-names = "fck";
 			power-domains = <&sysc R8A779G0_PD_ALWAYS_ON>;
-- 
2.34.1


