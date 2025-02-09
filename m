Return-Path: <linux-renesas-soc+bounces-12965-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 31A8CA2DFB8
	for <lists+linux-renesas-soc@lfdr.de>; Sun,  9 Feb 2025 19:07:10 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 1724F7A187A
	for <lists+linux-renesas-soc@lfdr.de>; Sun,  9 Feb 2025 18:06:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 591681E1A3B;
	Sun,  9 Feb 2025 18:06:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="C/LILRsI";
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="TgbRXOdy"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mout-p-101.mailbox.org (mout-p-101.mailbox.org [80.241.56.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7344D1E0E18;
	Sun,  9 Feb 2025 18:06:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.241.56.151
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739124416; cv=none; b=QIbJYQV7VzvLd759N3CVpWCWPKo+g4+IcgvBI47J7bYogGDcjKOc2TPFVveBpKRs1z8dCIs3zLddF2KvT7UU3f+D9L80R/pvxJuoCrUnsxgVD1tTY2Dhann6PPwSU1YCNrD/rJVvSbasEIkE4pRzsTE33J+WYA47Or/u8iAuKOs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739124416; c=relaxed/simple;
	bh=kguC3861lS0dfZzjXrrYwIkhwDcWdgm1JRz4UH6uIbE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=pjDQYDi7fcVH3c3tD4fygFEgbebwl4Z30dUCGSB+OE+BZ+hh0xgU2v4PLE/+55XYY5TCOsOlTHyGP/OLOp1ih9rCveNzi0iOYD5JRT0pTgqYKHGu8VQCy4a43c6OlFBNVDZI77gSssRaYo1a9gqo6iym5rEYrM7x62h7Qfyd2QU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org; spf=pass smtp.mailfrom=mailbox.org; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=C/LILRsI; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=TgbRXOdy; arc=none smtp.client-ip=80.241.56.151
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mailbox.org
Received: from smtp2.mailbox.org (smtp2.mailbox.org [10.196.197.2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-101.mailbox.org (Postfix) with ESMTPS id 4YrbJC36VFz9syb;
	Sun,  9 Feb 2025 19:06:51 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1739124411;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=wJKDfculBOHtXbp+LXdjmesbR5G8ZOrp7jrKY9ENQi4=;
	b=C/LILRsIo4dn0sV0YEBvXKWd63dW8wArQmfM5MR2bkiPaZ2zpowEm6hEw4uGtbW8WL3YMH
	AkQWG9eAp2Em/MMUla1K7lx/CNj+04oEIp3/vJ2H+ST3TSR/p4hgtN3VjzTPE2vBVoIljl
	rZC/yXcSmuTrq9vQwH+QRQdPNu98WLYCH5jl89WzrCCulofrG3tl5nOdoizb8t02k0IdFC
	904lwsU7DPgjgZvqyP2DnrUUCwW85NIn6hEOJDFdk3Gud9PAjCQG1tyZeMiJ74tleNxYfO
	3xdAYCZwryqxIATOB7u/xXltFTjKphWgxZZalu5kbGd9Jq5apvK3Gg24/bltvA==
From: Marek Vasut <marek.vasut+renesas@mailbox.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1739124409;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=wJKDfculBOHtXbp+LXdjmesbR5G8ZOrp7jrKY9ENQi4=;
	b=TgbRXOdyeSH5qbAx71L2kv3/YuzH+TxoPwQilILZWAtFiwcJ2tuNH7/HTC3qL9AwNAIH8O
	SeYfdiOq2hxPp3FumQJt7dUz1KbnGpYcaneYVLRkpb0xlsA7OmPbNyXr4hoOxpA1Zky8yP
	nUWe22aQa44ro/0ICOBP3yvjSZNQIJE76kPKqIN1pk4vR/7XLTe10TPbSMTcb8DWiahuZp
	Nx4iVKUU+hz5fZ77GxSA2OKDOmeRZI+j2li6flIUd7fGxkMNoo5Cg2rlDGqA28SspHW4BO
	nLAduO0x3za4X919eqq8SONI3YUNeGLaWHKscbEhg4A9BgWUHDrvVCTRdPvBNA==
To: linux-arm-kernel@lists.infradead.org
Cc: Marek Vasut <marek.vasut+renesas@mailbox.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Magnus Damm <magnus.damm@gmail.com>,
	Rob Herring <robh@kernel.org>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org
Subject: [PATCH 3/3] arm64: dts: renesas: Add boot phase tags marking to Renesas RZ/G2
Date: Sun,  9 Feb 2025 19:05:06 +0100
Message-ID: <20250209180616.160253-3-marek.vasut+renesas@mailbox.org>
In-Reply-To: <20250209180616.160253-1-marek.vasut+renesas@mailbox.org>
References: <20250209180616.160253-1-marek.vasut+renesas@mailbox.org>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-MBO-RS-ID: c7858d5b6611a482886
X-MBO-RS-META: sswwhmetmsnqycbsxqobmkbrftm115ge

bootph-all as phase tag was added to dt-schema (dtschema/schemas/bootph.yaml)
to describe various node usage during boot phases with DT. Add bootph-all for
all nodes that are used in the bootloader on Renesas RZ/G2 SoC.

All SoC require CPG clock and its input clock, RST Reset, PFC pin control and
PRR ID register access during all stages of the boot process, those are marked
using bootph-all property, and so is the SoC bus node which contains these IP.

Each board console UART is also marked as bootph-all to make it available in
all stages of the boot process.

Signed-off-by: Marek Vasut <marek.vasut+renesas@mailbox.org>
---
Cc: Conor Dooley <conor+dt@kernel.org>
Cc: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>
Cc: Magnus Damm <magnus.damm@gmail.com>
Cc: Rob Herring <robh@kernel.org>
Cc: devicetree@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
Cc: linux-renesas-soc@vger.kernel.org
---
 arch/arm64/boot/dts/renesas/beacon-renesom-som.dtsi | 1 +
 arch/arm64/boot/dts/renesas/hihope-common.dtsi      | 1 +
 arch/arm64/boot/dts/renesas/r8a774a1.dtsi           | 8 ++++++++
 arch/arm64/boot/dts/renesas/r8a774b1.dtsi           | 8 ++++++++
 arch/arm64/boot/dts/renesas/r8a774c0-cat874.dts     | 1 +
 arch/arm64/boot/dts/renesas/r8a774c0.dtsi           | 7 +++++++
 arch/arm64/boot/dts/renesas/r8a774e1.dtsi           | 8 ++++++++
 arch/arm64/boot/dts/renesas/rz-smarc-common.dtsi    | 1 +
 8 files changed, 35 insertions(+)

diff --git a/arch/arm64/boot/dts/renesas/beacon-renesom-som.dtsi b/arch/arm64/boot/dts/renesas/beacon-renesom-som.dtsi
index 43f88c199b788..1489bc8d2f4e6 100644
--- a/arch/arm64/boot/dts/renesas/beacon-renesom-som.dtsi
+++ b/arch/arm64/boot/dts/renesas/beacon-renesom-som.dtsi
@@ -282,6 +282,7 @@ &scif_clk {
 &scif2 {
 	pinctrl-0 = <&scif2_pins>;
 	pinctrl-names = "default";
+	bootph-all;
 	status = "okay";
 };
 
diff --git a/arch/arm64/boot/dts/renesas/hihope-common.dtsi b/arch/arm64/boot/dts/renesas/hihope-common.dtsi
index 659ae1fed2faa..4e78139d52f6c 100644
--- a/arch/arm64/boot/dts/renesas/hihope-common.dtsi
+++ b/arch/arm64/boot/dts/renesas/hihope-common.dtsi
@@ -289,6 +289,7 @@ &rwdt {
 &scif2 {
 	pinctrl-0 = <&scif2_pins>;
 	pinctrl-names = "default";
+	bootph-all;
 
 	status = "okay";
 };
diff --git a/arch/arm64/boot/dts/renesas/r8a774a1.dtsi b/arch/arm64/boot/dts/renesas/r8a774a1.dtsi
index f065ee90649a4..c8b87aed92a36 100644
--- a/arch/arm64/boot/dts/renesas/r8a774a1.dtsi
+++ b/arch/arm64/boot/dts/renesas/r8a774a1.dtsi
@@ -215,6 +215,7 @@ extal_clk: extal {
 		#clock-cells = <0>;
 		/* This value must be overridden by the board */
 		clock-frequency = <0>;
+		bootph-all;
 	};
 
 	extalr_clk: extalr {
@@ -222,6 +223,7 @@ extalr_clk: extalr {
 		#clock-cells = <0>;
 		/* This value must be overridden by the board */
 		clock-frequency = <0>;
+		bootph-all;
 	};
 
 	/* External PCIe clock - can be overridden by the board */
@@ -262,6 +264,8 @@ scif_clk: scif {
 	soc {
 		compatible = "simple-bus";
 		interrupt-parent = <&gic>;
+		bootph-all;
+
 		#address-cells = <2>;
 		#size-cells = <2>;
 		ranges;
@@ -400,6 +404,7 @@ gpio7: gpio@e6055800 {
 		pfc: pinctrl@e6060000 {
 			compatible = "renesas,pfc-r8a774a1";
 			reg = <0 0xe6060000 0 0x50c>;
+			bootph-all;
 		};
 
 		cmt0: timer@e60f0000 {
@@ -480,11 +485,13 @@ cpg: clock-controller@e6150000 {
 			#clock-cells = <2>;
 			#power-domain-cells = <0>;
 			#reset-cells = <1>;
+			bootph-all;
 		};
 
 		rst: reset-controller@e6160000 {
 			compatible = "renesas,r8a774a1-rst";
 			reg = <0 0xe6160000 0 0x018c>;
+			bootph-all;
 		};
 
 		sysc: system-controller@e6180000 {
@@ -2785,6 +2792,7 @@ port@1 {
 		prr: chipid@fff00044 {
 			compatible = "renesas,prr";
 			reg = <0 0xfff00044 0 4>;
+			bootph-all;
 		};
 	};
 
diff --git a/arch/arm64/boot/dts/renesas/r8a774b1.dtsi b/arch/arm64/boot/dts/renesas/r8a774b1.dtsi
index 117cb6950f91f..f2fc2a2035a1d 100644
--- a/arch/arm64/boot/dts/renesas/r8a774b1.dtsi
+++ b/arch/arm64/boot/dts/renesas/r8a774b1.dtsi
@@ -108,6 +108,7 @@ extal_clk: extal {
 		#clock-cells = <0>;
 		/* This value must be overridden by the board */
 		clock-frequency = <0>;
+		bootph-all;
 	};
 
 	extalr_clk: extalr {
@@ -115,6 +116,7 @@ extalr_clk: extalr {
 		#clock-cells = <0>;
 		/* This value must be overridden by the board */
 		clock-frequency = <0>;
+		bootph-all;
 	};
 
 	/* External PCIe clock - can be overridden by the board */
@@ -146,6 +148,8 @@ scif_clk: scif {
 	soc {
 		compatible = "simple-bus";
 		interrupt-parent = <&gic>;
+		bootph-all;
+
 		#address-cells = <2>;
 		#size-cells = <2>;
 		ranges;
@@ -284,6 +288,7 @@ gpio7: gpio@e6055800 {
 		pfc: pinctrl@e6060000 {
 			compatible = "renesas,pfc-r8a774b1";
 			reg = <0 0xe6060000 0 0x50c>;
+			bootph-all;
 		};
 
 		cmt0: timer@e60f0000 {
@@ -364,11 +369,13 @@ cpg: clock-controller@e6150000 {
 			#clock-cells = <2>;
 			#power-domain-cells = <0>;
 			#reset-cells = <1>;
+			bootph-all;
 		};
 
 		rst: reset-controller@e6160000 {
 			compatible = "renesas,r8a774b1-rst";
 			reg = <0 0xe6160000 0 0x0200>;
+			bootph-all;
 		};
 
 		sysc: system-controller@e6180000 {
@@ -2661,6 +2668,7 @@ port@1 {
 		prr: chipid@fff00044 {
 			compatible = "renesas,prr";
 			reg = <0 0xfff00044 0 4>;
+			bootph-all;
 		};
 	};
 
diff --git a/arch/arm64/boot/dts/renesas/r8a774c0-cat874.dts b/arch/arm64/boot/dts/renesas/r8a774c0-cat874.dts
index b78dbd807d155..57a281fc49775 100644
--- a/arch/arm64/boot/dts/renesas/r8a774c0-cat874.dts
+++ b/arch/arm64/boot/dts/renesas/r8a774c0-cat874.dts
@@ -378,6 +378,7 @@ &rwdt {
 &scif2 {
 	pinctrl-0 = <&scif2_pins>;
 	pinctrl-names = "default";
+	bootph-all;
 
 	status = "okay";
 };
diff --git a/arch/arm64/boot/dts/renesas/r8a774c0.dtsi b/arch/arm64/boot/dts/renesas/r8a774c0.dtsi
index 7655d5e3a0341..cc7f7e13c664f 100644
--- a/arch/arm64/boot/dts/renesas/r8a774c0.dtsi
+++ b/arch/arm64/boot/dts/renesas/r8a774c0.dtsi
@@ -103,6 +103,7 @@ extal_clk: extal {
 		#clock-cells = <0>;
 		/* This value must be overridden by the board */
 		clock-frequency = <0>;
+		bootph-all;
 	};
 
 	/* External PCIe clock - can be overridden by the board */
@@ -134,6 +135,8 @@ scif_clk: scif {
 	soc: soc {
 		compatible = "simple-bus";
 		interrupt-parent = <&gic>;
+		bootph-all;
+
 		#address-cells = <2>;
 		#size-cells = <2>;
 		ranges;
@@ -257,6 +260,7 @@ gpio6: gpio@e6055400 {
 		pfc: pinctrl@e6060000 {
 			compatible = "renesas,pfc-r8a774c0";
 			reg = <0 0xe6060000 0 0x508>;
+			bootph-all;
 		};
 
 		cmt0: timer@e60f0000 {
@@ -337,11 +341,13 @@ cpg: clock-controller@e6150000 {
 			#clock-cells = <2>;
 			#power-domain-cells = <0>;
 			#reset-cells = <1>;
+			bootph-all;
 		};
 
 		rst: reset-controller@e6160000 {
 			compatible = "renesas,r8a774c0-rst";
 			reg = <0 0xe6160000 0 0x0200>;
+			bootph-all;
 		};
 
 		sysc: system-controller@e6180000 {
@@ -1953,6 +1959,7 @@ port@1 {
 		prr: chipid@fff00044 {
 			compatible = "renesas,prr";
 			reg = <0 0xfff00044 0 4>;
+			bootph-all;
 		};
 	};
 
diff --git a/arch/arm64/boot/dts/renesas/r8a774e1.dtsi b/arch/arm64/boot/dts/renesas/r8a774e1.dtsi
index f845ca604de06..e4dbda8c34d9e 100644
--- a/arch/arm64/boot/dts/renesas/r8a774e1.dtsi
+++ b/arch/arm64/boot/dts/renesas/r8a774e1.dtsi
@@ -277,6 +277,7 @@ extal_clk: extal {
 		#clock-cells = <0>;
 		/* This value must be overridden by the board */
 		clock-frequency = <0>;
+		bootph-all;
 	};
 
 	extalr_clk: extalr {
@@ -284,6 +285,7 @@ extalr_clk: extalr {
 		#clock-cells = <0>;
 		/* This value must be overridden by the board */
 		clock-frequency = <0>;
+		bootph-all;
 	};
 
 	/* External PCIe clock - can be overridden by the board */
@@ -326,6 +328,8 @@ scif_clk: scif {
 	soc {
 		compatible = "simple-bus";
 		interrupt-parent = <&gic>;
+		bootph-all;
+
 		#address-cells = <2>;
 		#size-cells = <2>;
 		ranges;
@@ -464,6 +468,7 @@ gpio7: gpio@e6055800 {
 		pfc: pinctrl@e6060000 {
 			compatible = "renesas,pfc-r8a774e1";
 			reg = <0 0xe6060000 0 0x50c>;
+			bootph-all;
 		};
 
 		cmt0: timer@e60f0000 {
@@ -544,11 +549,13 @@ cpg: clock-controller@e6150000 {
 			#clock-cells = <2>;
 			#power-domain-cells = <0>;
 			#reset-cells = <1>;
+			bootph-all;
 		};
 
 		rst: reset-controller@e6160000 {
 			compatible = "renesas,r8a774e1-rst";
 			reg = <0 0xe6160000 0 0x0200>;
+			bootph-all;
 		};
 
 		sysc: system-controller@e6180000 {
@@ -2917,6 +2924,7 @@ port@1 {
 		prr: chipid@fff00044 {
 			compatible = "renesas,prr";
 			reg = <0 0xfff00044 0 4>;
+			bootph-all;
 		};
 	};
 
diff --git a/arch/arm64/boot/dts/renesas/rz-smarc-common.dtsi b/arch/arm64/boot/dts/renesas/rz-smarc-common.dtsi
index 63fa5cf1061b3..b9746ee99ba80 100644
--- a/arch/arm64/boot/dts/renesas/rz-smarc-common.dtsi
+++ b/arch/arm64/boot/dts/renesas/rz-smarc-common.dtsi
@@ -136,6 +136,7 @@ &phyrst {
 &scif0 {
 	pinctrl-0 = <&scif0_pins>;
 	pinctrl-names = "default";
+	bootph-all;
 	status = "okay";
 };
 
-- 
2.47.2


