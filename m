Return-Path: <linux-renesas-soc+bounces-12964-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D93DA2DFB5
	for <lists+linux-renesas-soc@lfdr.de>; Sun,  9 Feb 2025 19:07:03 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E8CF33A5B81
	for <lists+linux-renesas-soc@lfdr.de>; Sun,  9 Feb 2025 18:06:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 81C5F1E04B9;
	Sun,  9 Feb 2025 18:06:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="euk5EVPS";
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="Hkw5AEJb"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mout-p-102.mailbox.org (mout-p-102.mailbox.org [80.241.56.152])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C92581E0DE3;
	Sun,  9 Feb 2025 18:06:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.241.56.152
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739124414; cv=none; b=KJLpmm+H62+2in7MKg8Fro/qD//Qk+g11D+93k+YqPnH5ysUUUdkpPZ5k6zO0xiV4cltCoJyATQUf3kUCjlYw/XLsLgMTpvycdb87LMRJy7B2UaZ8UYqeKjoq8HLOpsJiaEI+kvtum/ec3UZr7rjSaqby7x2v8ZxkVzZHNyb6Rg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739124414; c=relaxed/simple;
	bh=3yC6zX6tpEjKBs5vKc6UgMGsd/cu6e8MkXyPCMpdB4A=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=O8ML514aN5yOvSXAfrkb4sRMagM1iNQ7HCywBnWvauo/Lph4E9ubnTOsvi8NClKM17MYGv4aZSRTCQnO2GXF+RaRPS5QHU7HoEYijVY1GZC0ZLSTCtdUkpKqgFZJRIYBVPVraYfE8OI3AUkUdGGrJ/g+YLjhmvjPxusxcCAoCQY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org; spf=pass smtp.mailfrom=mailbox.org; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=euk5EVPS; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=Hkw5AEJb; arc=none smtp.client-ip=80.241.56.152
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mailbox.org
Received: from smtp2.mailbox.org (smtp2.mailbox.org [10.196.197.2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-102.mailbox.org (Postfix) with ESMTPS id 4YrbJ95QwQz9tSR;
	Sun,  9 Feb 2025 19:06:49 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1739124409;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=njWNxD93LiZzgdoClk+Taq8PHVuP66MHoc2qhaqa6+0=;
	b=euk5EVPSl4Ml2wO5WUCXh2UP2AFyId4nODoLs28jRzY3tu1lgMlh1yPQHEINjAUodPE3un
	ZOloq5wTIuLClHR0IMYziiuKuByjM9EhIaEMPgPHpIUrUODWoIJm+UbdY0Zh+t96AEN9we
	DGT7vn7KCMBBl8cA2TauSovI8qUOBb6l2BNGy6jwRj1eWb60pX0K4rRIoulgI4/8on7wTS
	++TaellwpvrRNbYEO4qANIOJjf7fYI0sZ0pTiZfPzLHLddocyb6AkD2je83meJd1uR1+Ld
	cAMXwyaYrdKiRJmxTEGegz4eyGWWrJmcNu7BEitvJ+ScOl+Ki0kKtZrRtXYx9Q==
From: Marek Vasut <marek.vasut+renesas@mailbox.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1739124407;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=njWNxD93LiZzgdoClk+Taq8PHVuP66MHoc2qhaqa6+0=;
	b=Hkw5AEJbfqRvo9gLpQ31b8o4r2rJcNDrW7u/xoCu91iFBmvhSQomeN7yY/0QnctIZt3u5O
	xa7Zt3E6+oMTXTy55R1vNX/N0o6UDBynGsDMcrXKAEXg0r/34wGh5v0ULvLcBzLG41QlTt
	BayE7nJ/FSiIWNzHEwKURKmAMoie2ZIgx95j0Kyv6oFQP4Zw4aV+KL4e7wE2zys8umfE+m
	J9PNSd+T9DcUXZ8JqVT6jtF5XcQoi0KRa6b7L1hgHdgJyX9ugAd1WLhFOFjRCWk/i8H0rC
	NMP57QrFkjqLVwUK4q/Y3mhAgci54IEtZGLpGJTGLRZujH6RD2Rtn94Hd09o5w==
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
Subject: [PATCH 2/3] arm64: dts: renesas: Add boot phase tags marking to Renesas R-Car Gen3 and Gen4
Date: Sun,  9 Feb 2025 19:05:05 +0100
Message-ID: <20250209180616.160253-2-marek.vasut+renesas@mailbox.org>
In-Reply-To: <20250209180616.160253-1-marek.vasut+renesas@mailbox.org>
References: <20250209180616.160253-1-marek.vasut+renesas@mailbox.org>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-MBO-RS-ID: 49541a8469b0a801d4d
X-MBO-RS-META: bcmjzj3isfhauryr1ty8x49ef44dg538

bootph-all as phase tag was added to dt-schema (dtschema/schemas/bootph.yaml)
to describe various node usage during boot phases with DT. Add bootph-all for
all nodes that are used in the bootloader on Renesas R-Car SoC.

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
 arch/arm64/boot/dts/renesas/condor-common.dtsi            | 1 +
 arch/arm64/boot/dts/renesas/draak.dtsi                    | 1 +
 arch/arm64/boot/dts/renesas/ebisu.dtsi                    | 1 +
 arch/arm64/boot/dts/renesas/r8a77951.dtsi                 | 7 +++++++
 arch/arm64/boot/dts/renesas/r8a77960.dtsi                 | 8 ++++++++
 arch/arm64/boot/dts/renesas/r8a77961.dtsi                 | 8 ++++++++
 arch/arm64/boot/dts/renesas/r8a77965.dtsi                 | 8 ++++++++
 arch/arm64/boot/dts/renesas/r8a77970-eagle.dts            | 1 +
 arch/arm64/boot/dts/renesas/r8a77970-v3msk.dts            | 1 +
 arch/arm64/boot/dts/renesas/r8a77970.dtsi                 | 7 +++++++
 arch/arm64/boot/dts/renesas/r8a77980-v3hsk.dts            | 1 +
 arch/arm64/boot/dts/renesas/r8a77980.dtsi                 | 7 +++++++
 arch/arm64/boot/dts/renesas/r8a77990.dtsi                 | 7 +++++++
 arch/arm64/boot/dts/renesas/r8a77995.dtsi                 | 7 +++++++
 arch/arm64/boot/dts/renesas/r8a779a0-falcon-cpu.dtsi      | 1 +
 arch/arm64/boot/dts/renesas/r8a779a0.dtsi                 | 8 ++++++++
 arch/arm64/boot/dts/renesas/r8a779f0-spider-cpu.dtsi      | 1 +
 arch/arm64/boot/dts/renesas/r8a779f0.dtsi                 | 8 ++++++++
 arch/arm64/boot/dts/renesas/r8a779f4-s4sk.dts             | 1 +
 arch/arm64/boot/dts/renesas/r8a779g0.dtsi                 | 8 ++++++++
 arch/arm64/boot/dts/renesas/r8a779h0-gray-hawk-single.dts | 1 +
 arch/arm64/boot/dts/renesas/r8a779h0.dtsi                 | 8 ++++++++
 arch/arm64/boot/dts/renesas/salvator-common.dtsi          | 1 +
 arch/arm64/boot/dts/renesas/ulcb.dtsi                     | 1 +
 arch/arm64/boot/dts/renesas/white-hawk-cpu-common.dtsi    | 1 +
 25 files changed, 104 insertions(+)

diff --git a/arch/arm64/boot/dts/renesas/condor-common.dtsi b/arch/arm64/boot/dts/renesas/condor-common.dtsi
index 375a56b20f267..a105841505718 100644
--- a/arch/arm64/boot/dts/renesas/condor-common.dtsi
+++ b/arch/arm64/boot/dts/renesas/condor-common.dtsi
@@ -544,6 +544,7 @@ &rwdt {
 &scif0 {
 	pinctrl-0 = <&scif0_pins>, <&scif_clk_pins>;
 	pinctrl-names = "default";
+	bootph-all;
 
 	status = "okay";
 };
diff --git a/arch/arm64/boot/dts/renesas/draak.dtsi b/arch/arm64/boot/dts/renesas/draak.dtsi
index 05712cd96d28b..380b857fd273e 100644
--- a/arch/arm64/boot/dts/renesas/draak.dtsi
+++ b/arch/arm64/boot/dts/renesas/draak.dtsi
@@ -695,6 +695,7 @@ &rwdt {
 &scif2 {
 	pinctrl-0 = <&scif2_pins>;
 	pinctrl-names = "default";
+	bootph-all;
 
 	status = "okay";
 };
diff --git a/arch/arm64/boot/dts/renesas/ebisu.dtsi b/arch/arm64/boot/dts/renesas/ebisu.dtsi
index ab82836566600..4f38b01ae18de 100644
--- a/arch/arm64/boot/dts/renesas/ebisu.dtsi
+++ b/arch/arm64/boot/dts/renesas/ebisu.dtsi
@@ -786,6 +786,7 @@ &rwdt {
 &scif2 {
 	pinctrl-0 = <&scif2_pins>;
 	pinctrl-names = "default";
+	bootph-all;
 
 	status = "okay";
 };
diff --git a/arch/arm64/boot/dts/renesas/r8a77951.dtsi b/arch/arm64/boot/dts/renesas/r8a77951.dtsi
index 96f3b5fe7e92c..6ee9cdeb5a3ab 100644
--- a/arch/arm64/boot/dts/renesas/r8a77951.dtsi
+++ b/arch/arm64/boot/dts/renesas/r8a77951.dtsi
@@ -292,6 +292,7 @@ extal_clk: extal {
 		#clock-cells = <0>;
 		/* This value must be overridden by the board */
 		clock-frequency = <0>;
+		bootph-all;
 	};
 
 	extalr_clk: extalr {
@@ -299,6 +300,7 @@ extalr_clk: extalr {
 		#clock-cells = <0>;
 		/* This value must be overridden by the board */
 		clock-frequency = <0>;
+		bootph-all;
 	};
 
 	/* External PCIe clock - can be overridden by the board */
@@ -347,6 +349,7 @@ scif_clk: scif {
 	soc: soc {
 		compatible = "simple-bus";
 		interrupt-parent = <&gic>;
+		bootph-all;
 
 		#address-cells = <2>;
 		#size-cells = <2>;
@@ -485,6 +488,7 @@ gpio7: gpio@e6055800 {
 		pfc: pinctrl@e6060000 {
 			compatible = "renesas,pfc-r8a7795";
 			reg = <0 0xe6060000 0 0x50c>;
+			bootph-all;
 		};
 
 		cmt0: timer@e60f0000 {
@@ -565,11 +569,13 @@ cpg: clock-controller@e6150000 {
 			#clock-cells = <2>;
 			#power-domain-cells = <0>;
 			#reset-cells = <1>;
+			bootph-all;
 		};
 
 		rst: reset-controller@e6160000 {
 			compatible = "renesas,r8a7795-rst";
 			reg = <0 0xe6160000 0 0x0200>;
+			bootph-all;
 		};
 
 		sysc: system-controller@e6180000 {
@@ -3398,6 +3404,7 @@ port@1 {
 		prr: chipid@fff00044 {
 			compatible = "renesas,prr";
 			reg = <0 0xfff00044 0 4>;
+			bootph-all;
 		};
 	};
 
diff --git a/arch/arm64/boot/dts/renesas/r8a77960.dtsi b/arch/arm64/boot/dts/renesas/r8a77960.dtsi
index ee80f52dc7cf4..a323ac47ca70f 100644
--- a/arch/arm64/boot/dts/renesas/r8a77960.dtsi
+++ b/arch/arm64/boot/dts/renesas/r8a77960.dtsi
@@ -264,6 +264,7 @@ extal_clk: extal {
 		#clock-cells = <0>;
 		/* This value must be overridden by the board */
 		clock-frequency = <0>;
+		bootph-all;
 	};
 
 	extalr_clk: extalr {
@@ -271,6 +272,7 @@ extalr_clk: extalr {
 		#clock-cells = <0>;
 		/* This value must be overridden by the board */
 		clock-frequency = <0>;
+		bootph-all;
 	};
 
 	/* External PCIe clock - can be overridden by the board */
@@ -311,6 +313,8 @@ scif_clk: scif {
 	soc {
 		compatible = "simple-bus";
 		interrupt-parent = <&gic>;
+		bootph-all;
+
 		#address-cells = <2>;
 		#size-cells = <2>;
 		ranges;
@@ -449,6 +453,7 @@ gpio7: gpio@e6055800 {
 		pfc: pinctrl@e6060000 {
 			compatible = "renesas,pfc-r8a7796";
 			reg = <0 0xe6060000 0 0x50c>;
+			bootph-all;
 		};
 
 		cmt0: timer@e60f0000 {
@@ -529,11 +534,13 @@ cpg: clock-controller@e6150000 {
 			#clock-cells = <2>;
 			#power-domain-cells = <0>;
 			#reset-cells = <1>;
+			bootph-all;
 		};
 
 		rst: reset-controller@e6160000 {
 			compatible = "renesas,r8a7796-rst";
 			reg = <0 0xe6160000 0 0x0200>;
+			bootph-all;
 		};
 
 		sysc: system-controller@e6180000 {
@@ -2996,6 +3003,7 @@ port@1 {
 		prr: chipid@fff00044 {
 			compatible = "renesas,prr";
 			reg = <0 0xfff00044 0 4>;
+			bootph-all;
 		};
 	};
 
diff --git a/arch/arm64/boot/dts/renesas/r8a77961.dtsi b/arch/arm64/boot/dts/renesas/r8a77961.dtsi
index 3b9066043a71e..49f6d31c5903b 100644
--- a/arch/arm64/boot/dts/renesas/r8a77961.dtsi
+++ b/arch/arm64/boot/dts/renesas/r8a77961.dtsi
@@ -264,6 +264,7 @@ extal_clk: extal {
 		#clock-cells = <0>;
 		/* This value must be overridden by the board */
 		clock-frequency = <0>;
+		bootph-all;
 	};
 
 	extalr_clk: extalr {
@@ -271,6 +272,7 @@ extalr_clk: extalr {
 		#clock-cells = <0>;
 		/* This value must be overridden by the board */
 		clock-frequency = <0>;
+		bootph-all;
 	};
 
 	/* External PCIe clock - can be overridden by the board */
@@ -311,6 +313,8 @@ scif_clk: scif {
 	soc {
 		compatible = "simple-bus";
 		interrupt-parent = <&gic>;
+		bootph-all;
+
 		#address-cells = <2>;
 		#size-cells = <2>;
 		ranges;
@@ -449,6 +453,7 @@ gpio7: gpio@e6055800 {
 		pfc: pinctrl@e6060000 {
 			compatible = "renesas,pfc-r8a77961";
 			reg = <0 0xe6060000 0 0x50c>;
+			bootph-all;
 		};
 
 		cmt0: timer@e60f0000 {
@@ -529,11 +534,13 @@ cpg: clock-controller@e6150000 {
 			#clock-cells = <2>;
 			#power-domain-cells = <0>;
 			#reset-cells = <1>;
+			bootph-all;
 		};
 
 		rst: reset-controller@e6160000 {
 			compatible = "renesas,r8a77961-rst";
 			reg = <0 0xe6160000 0 0x0200>;
+			bootph-all;
 		};
 
 		sysc: system-controller@e6180000 {
@@ -2817,6 +2824,7 @@ port@1 {
 		prr: chipid@fff00044 {
 			compatible = "renesas,prr";
 			reg = <0 0xfff00044 0 4>;
+			bootph-all;
 		};
 	};
 
diff --git a/arch/arm64/boot/dts/renesas/r8a77965.dtsi b/arch/arm64/boot/dts/renesas/r8a77965.dtsi
index 557bdf8fab179..136a22ca50b78 100644
--- a/arch/arm64/boot/dts/renesas/r8a77965.dtsi
+++ b/arch/arm64/boot/dts/renesas/r8a77965.dtsi
@@ -143,6 +143,7 @@ extal_clk: extal {
 		#clock-cells = <0>;
 		/* This value must be overridden by the board */
 		clock-frequency = <0>;
+		bootph-all;
 	};
 
 	extalr_clk: extalr {
@@ -150,6 +151,7 @@ extalr_clk: extalr {
 		#clock-cells = <0>;
 		/* This value must be overridden by the board */
 		clock-frequency = <0>;
+		bootph-all;
 	};
 
 	/* External PCIe clock - can be overridden by the board */
@@ -182,6 +184,8 @@ scif_clk: scif {
 	soc {
 		compatible = "simple-bus";
 		interrupt-parent = <&gic>;
+		bootph-all;
+
 		#address-cells = <2>;
 		#size-cells = <2>;
 		ranges;
@@ -320,6 +324,7 @@ gpio7: gpio@e6055800 {
 		pfc: pinctrl@e6060000 {
 			compatible = "renesas,pfc-r8a77965";
 			reg = <0 0xe6060000 0 0x50c>;
+			bootph-all;
 		};
 
 		cmt0: timer@e60f0000 {
@@ -400,11 +405,13 @@ cpg: clock-controller@e6150000 {
 			#clock-cells = <2>;
 			#power-domain-cells = <0>;
 			#reset-cells = <1>;
+			bootph-all;
 		};
 
 		rst: reset-controller@e6160000 {
 			compatible = "renesas,r8a77965-rst";
 			reg = <0 0xe6160000 0 0x0200>;
+			bootph-all;
 		};
 
 		sysc: system-controller@e6180000 {
@@ -2828,6 +2835,7 @@ port@1 {
 		prr: chipid@fff00044 {
 			compatible = "renesas,prr";
 			reg = <0 0xfff00044 0 4>;
+			bootph-all;
 		};
 	};
 
diff --git a/arch/arm64/boot/dts/renesas/r8a77970-eagle.dts b/arch/arm64/boot/dts/renesas/r8a77970-eagle.dts
index 32f07aa273167..8b594e9e9dc10 100644
--- a/arch/arm64/boot/dts/renesas/r8a77970-eagle.dts
+++ b/arch/arm64/boot/dts/renesas/r8a77970-eagle.dts
@@ -409,6 +409,7 @@ &rwdt {
 &scif0 {
 	pinctrl-0 = <&scif0_pins>;
 	pinctrl-names = "default";
+	bootph-all;
 
 	status = "okay";
 };
diff --git a/arch/arm64/boot/dts/renesas/r8a77970-v3msk.dts b/arch/arm64/boot/dts/renesas/r8a77970-v3msk.dts
index 118e77f4477e3..445f5dd7c983f 100644
--- a/arch/arm64/boot/dts/renesas/r8a77970-v3msk.dts
+++ b/arch/arm64/boot/dts/renesas/r8a77970-v3msk.dts
@@ -296,6 +296,7 @@ user@1bc0000 {
 &scif0 {
 	pinctrl-0 = <&scif0_pins>;
 	pinctrl-names = "default";
+	bootph-all;
 
 	status = "okay";
 };
diff --git a/arch/arm64/boot/dts/renesas/r8a77970.dtsi b/arch/arm64/boot/dts/renesas/r8a77970.dtsi
index 38145fd6acf02..01744496805c3 100644
--- a/arch/arm64/boot/dts/renesas/r8a77970.dtsi
+++ b/arch/arm64/boot/dts/renesas/r8a77970.dtsi
@@ -60,6 +60,7 @@ extal_clk: extal {
 		#clock-cells = <0>;
 		/* This value must be overridden by the board */
 		clock-frequency = <0>;
+		bootph-all;
 	};
 
 	extalr_clk: extalr {
@@ -67,6 +68,7 @@ extalr_clk: extalr {
 		#clock-cells = <0>;
 		/* This value must be overridden by the board */
 		clock-frequency = <0>;
+		bootph-all;
 	};
 
 	pmu_a53 {
@@ -91,6 +93,7 @@ scif_clk: scif {
 	soc {
 		compatible = "simple-bus";
 		interrupt-parent = <&gic>;
+		bootph-all;
 
 		#address-cells = <2>;
 		#size-cells = <2>;
@@ -200,6 +203,7 @@ gpio5: gpio@e6055000 {
 		pfc: pinctrl@e6060000 {
 			compatible = "renesas,pfc-r8a77970";
 			reg = <0 0xe6060000 0 0x504>;
+			bootph-all;
 		};
 
 		cmt0: timer@e60f0000 {
@@ -280,11 +284,13 @@ cpg: clock-controller@e6150000 {
 			#clock-cells = <2>;
 			#power-domain-cells = <0>;
 			#reset-cells = <1>;
+			bootph-all;
 		};
 
 		rst: reset-controller@e6160000 {
 			compatible = "renesas,r8a77970-rst";
 			reg = <0 0xe6160000 0 0x200>;
+			bootph-all;
 		};
 
 		sysc: system-controller@e6180000 {
@@ -1196,6 +1202,7 @@ port@1 {
 		prr: chipid@fff00044 {
 			compatible = "renesas,prr";
 			reg = <0 0xfff00044 0 4>;
+			bootph-all;
 		};
 	};
 
diff --git a/arch/arm64/boot/dts/renesas/r8a77980-v3hsk.dts b/arch/arm64/boot/dts/renesas/r8a77980-v3hsk.dts
index b409a8d1737e6..c2692d6fd00d7 100644
--- a/arch/arm64/boot/dts/renesas/r8a77980-v3hsk.dts
+++ b/arch/arm64/boot/dts/renesas/r8a77980-v3hsk.dts
@@ -282,6 +282,7 @@ &rwdt {
 &scif0 {
 	pinctrl-0 = <&scif0_pins>, <&scif_clk_pins>;
 	pinctrl-names = "default";
+	bootph-all;
 
 	status = "okay";
 };
diff --git a/arch/arm64/boot/dts/renesas/r8a77980.dtsi b/arch/arm64/boot/dts/renesas/r8a77980.dtsi
index 55a6c622f8732..f7e506ad7a211 100644
--- a/arch/arm64/boot/dts/renesas/r8a77980.dtsi
+++ b/arch/arm64/boot/dts/renesas/r8a77980.dtsi
@@ -80,6 +80,7 @@ extal_clk: extal {
 		#clock-cells = <0>;
 		/* This value must be overridden by the board */
 		clock-frequency = <0>;
+		bootph-all;
 	};
 
 	extalr_clk: extalr {
@@ -87,6 +88,7 @@ extalr_clk: extalr {
 		#clock-cells = <0>;
 		/* This value must be overridden by the board */
 		clock-frequency = <0>;
+		bootph-all;
 	};
 
 	/* External PCIe clock - can be overridden by the board */
@@ -120,6 +122,7 @@ scif_clk: scif {
 	soc {
 		compatible = "simple-bus";
 		interrupt-parent = <&gic>;
+		bootph-all;
 
 		#address-cells = <2>;
 		#size-cells = <2>;
@@ -229,6 +232,7 @@ gpio5: gpio@e6055000 {
 		pfc: pinctrl@e6060000 {
 			compatible = "renesas,pfc-r8a77980";
 			reg = <0 0xe6060000 0 0x50c>;
+			bootph-all;
 		};
 
 		cmt0: timer@e60f0000 {
@@ -309,11 +313,13 @@ cpg: clock-controller@e6150000 {
 			#clock-cells = <2>;
 			#power-domain-cells = <0>;
 			#reset-cells = <1>;
+			bootph-all;
 		};
 
 		rst: reset-controller@e6160000 {
 			compatible = "renesas,r8a77980-rst";
 			reg = <0 0xe6160000 0 0x200>;
+			bootph-all;
 		};
 
 		sysc: system-controller@e6180000 {
@@ -1579,6 +1585,7 @@ port@1 {
 		prr: chipid@fff00044 {
 			compatible = "renesas,prr";
 			reg = <0 0xfff00044 0 4>;
+			bootph-all;
 		};
 	};
 
diff --git a/arch/arm64/boot/dts/renesas/r8a77990.dtsi b/arch/arm64/boot/dts/renesas/r8a77990.dtsi
index 233af3081e84a..5fa6aee50c114 100644
--- a/arch/arm64/boot/dts/renesas/r8a77990.dtsi
+++ b/arch/arm64/boot/dts/renesas/r8a77990.dtsi
@@ -118,6 +118,7 @@ extal_clk: extal {
 		#clock-cells = <0>;
 		/* This value must be overridden by the board */
 		clock-frequency = <0>;
+		bootph-all;
 	};
 
 	/* External PCIe clock - can be overridden by the board */
@@ -149,6 +150,8 @@ scif_clk: scif {
 	soc: soc {
 		compatible = "simple-bus";
 		interrupt-parent = <&gic>;
+		bootph-all;
+
 		#address-cells = <2>;
 		#size-cells = <2>;
 		ranges;
@@ -272,6 +275,7 @@ gpio6: gpio@e6055400 {
 		pfc: pinctrl@e6060000 {
 			compatible = "renesas,pfc-r8a77990";
 			reg = <0 0xe6060000 0 0x508>;
+			bootph-all;
 		};
 
 		i2c_dvfs: i2c@e60b0000 {
@@ -368,11 +372,13 @@ cpg: clock-controller@e6150000 {
 			#clock-cells = <2>;
 			#power-domain-cells = <0>;
 			#reset-cells = <1>;
+			bootph-all;
 		};
 
 		rst: reset-controller@e6160000 {
 			compatible = "renesas,r8a77990-rst";
 			reg = <0 0xe6160000 0 0x0200>;
+			bootph-all;
 		};
 
 		sysc: system-controller@e6180000 {
@@ -2117,6 +2123,7 @@ port@1 {
 		prr: chipid@fff00044 {
 			compatible = "renesas,prr";
 			reg = <0 0xfff00044 0 4>;
+			bootph-all;
 		};
 	};
 
diff --git a/arch/arm64/boot/dts/renesas/r8a77995.dtsi b/arch/arm64/boot/dts/renesas/r8a77995.dtsi
index 5f0828a4675b6..b66cd7c90d53f 100644
--- a/arch/arm64/boot/dts/renesas/r8a77995.dtsi
+++ b/arch/arm64/boot/dts/renesas/r8a77995.dtsi
@@ -65,6 +65,7 @@ extal_clk: extal {
 		#clock-cells = <0>;
 		/* This value must be overridden by the board */
 		clock-frequency = <0>;
+		bootph-all;
 	};
 
 	pmu_a53 {
@@ -86,6 +87,8 @@ scif_clk: scif {
 	soc {
 		compatible = "simple-bus";
 		interrupt-parent = <&gic>;
+		bootph-all;
+
 		#address-cells = <2>;
 		#size-cells = <2>;
 		ranges;
@@ -209,6 +212,7 @@ gpio6: gpio@e6055400 {
 		pfc: pinctrl@e6060000 {
 			compatible = "renesas,pfc-r8a77995";
 			reg = <0 0xe6060000 0 0x508>;
+			bootph-all;
 		};
 
 		cmt0: timer@e60f0000 {
@@ -289,11 +293,13 @@ cpg: clock-controller@e6150000 {
 			#clock-cells = <2>;
 			#power-domain-cells = <0>;
 			#reset-cells = <1>;
+			bootph-all;
 		};
 
 		rst: reset-controller@e6160000 {
 			compatible = "renesas,r8a77995-rst";
 			reg = <0 0xe6160000 0 0x0200>;
+			bootph-all;
 		};
 
 		sysc: system-controller@e6180000 {
@@ -1448,6 +1454,7 @@ port@1 {
 		prr: chipid@fff00044 {
 			compatible = "renesas,prr";
 			reg = <0 0xfff00044 0 4>;
+			bootph-all;
 		};
 	};
 
diff --git a/arch/arm64/boot/dts/renesas/r8a779a0-falcon-cpu.dtsi b/arch/arm64/boot/dts/renesas/r8a779a0-falcon-cpu.dtsi
index e8c8fca48b696..0916fd57d1f1a 100644
--- a/arch/arm64/boot/dts/renesas/r8a779a0-falcon-cpu.dtsi
+++ b/arch/arm64/boot/dts/renesas/r8a779a0-falcon-cpu.dtsi
@@ -348,6 +348,7 @@ &rwdt {
 &scif0 {
 	pinctrl-0 = <&scif0_pins>;
 	pinctrl-names = "default";
+	bootph-all;
 
 	uart-has-rtscts;
 	status = "okay";
diff --git a/arch/arm64/boot/dts/renesas/r8a779a0.dtsi b/arch/arm64/boot/dts/renesas/r8a779a0.dtsi
index 905285b83f0c4..f1613bfd16320 100644
--- a/arch/arm64/boot/dts/renesas/r8a779a0.dtsi
+++ b/arch/arm64/boot/dts/renesas/r8a779a0.dtsi
@@ -47,6 +47,7 @@ extal_clk: extal {
 		#clock-cells = <0>;
 		/* This value must be overridden by the board */
 		clock-frequency = <0>;
+		bootph-all;
 	};
 
 	extalr_clk: extalr {
@@ -54,6 +55,7 @@ extalr_clk: extalr {
 		#clock-cells = <0>;
 		/* This value must be overridden by the board */
 		clock-frequency = <0>;
+		bootph-all;
 	};
 
 	pmu_a76 {
@@ -71,6 +73,8 @@ scif_clk: scif {
 	soc: soc {
 		compatible = "simple-bus";
 		interrupt-parent = <&gic>;
+		bootph-all;
+
 		#address-cells = <2>;
 		#size-cells = <2>;
 		ranges;
@@ -93,6 +97,7 @@ pfc: pinctrl@e6050000 {
 			      <0 0xe6060000 0 0x16c>, <0 0xe6060800 0 0x16c>,
 			      <0 0xe6068000 0 0x16c>, <0 0xe6068800 0 0x16c>,
 			      <0 0xe6069000 0 0x16c>, <0 0xe6069800 0 0x16c>;
+			bootph-all;
 		};
 
 		gpio0: gpio@e6058180 {
@@ -331,11 +336,13 @@ cpg: clock-controller@e6150000 {
 			#clock-cells = <2>;
 			#power-domain-cells = <0>;
 			#reset-cells = <1>;
+			bootph-all;
 		};
 
 		rst: reset-controller@e6160000 {
 			compatible = "renesas,r8a779a0-rst";
 			reg = <0 0xe6160000 0 0x4000>;
+			bootph-all;
 		};
 
 		sysc: system-controller@e6180000 {
@@ -2973,6 +2980,7 @@ port@1 {
 		prr: chipid@fff00044 {
 			compatible = "renesas,prr";
 			reg = <0 0xfff00044 0 4>;
+			bootph-all;
 		};
 	};
 
diff --git a/arch/arm64/boot/dts/renesas/r8a779f0-spider-cpu.dtsi b/arch/arm64/boot/dts/renesas/r8a779f0-spider-cpu.dtsi
index e03baefb6a98b..1781bb79a6196 100644
--- a/arch/arm64/boot/dts/renesas/r8a779f0-spider-cpu.dtsi
+++ b/arch/arm64/boot/dts/renesas/r8a779f0-spider-cpu.dtsi
@@ -101,6 +101,7 @@ &extalr_clk {
 &hscif0 {
 	pinctrl-0 = <&hscif0_pins>;
 	pinctrl-names = "default";
+	bootph-all;
 
 	uart-has-rtscts;
 	status = "okay";
diff --git a/arch/arm64/boot/dts/renesas/r8a779f0.dtsi b/arch/arm64/boot/dts/renesas/r8a779f0.dtsi
index fdc466b84d510..b496495c59a6d 100644
--- a/arch/arm64/boot/dts/renesas/r8a779f0.dtsi
+++ b/arch/arm64/boot/dts/renesas/r8a779f0.dtsi
@@ -253,6 +253,7 @@ extal_clk: extal {
 		#clock-cells = <0>;
 		/* This value must be overridden by the board */
 		clock-frequency = <0>;
+		bootph-all;
 	};
 
 	extalr_clk: extalr {
@@ -260,6 +261,7 @@ extalr_clk: extalr {
 		#clock-cells = <0>;
 		/* This value must be overridden by the board */
 		clock-frequency = <0>;
+		bootph-all;
 	};
 
 	pcie0_clkref: pcie0-clkref {
@@ -296,6 +298,8 @@ scif_clk: scif {
 	soc: soc {
 		compatible = "simple-bus";
 		interrupt-parent = <&gic>;
+		bootph-all;
+
 		#address-cells = <2>;
 		#size-cells = <2>;
 		ranges;
@@ -315,6 +319,7 @@ pfc: pinctrl@e6050000 {
 			compatible = "renesas,pfc-r8a779f0";
 			reg = <0 0xe6050000 0 0x16c>, <0 0xe6050800 0 0x16c>,
 			      <0 0xe6051000 0 0x16c>, <0 0xe6051800 0 0x16c>;
+			bootph-all;
 		};
 
 		gpio0: gpio@e6050180 {
@@ -463,11 +468,13 @@ cpg: clock-controller@e6150000 {
 			#clock-cells = <2>;
 			#power-domain-cells = <0>;
 			#reset-cells = <1>;
+			bootph-all;
 		};
 
 		rst: reset-controller@e6160000 {
 			compatible = "renesas,r8a779f0-rst";
 			reg = <0 0xe6160000 0 0x4000>;
+			bootph-all;
 		};
 
 		sysc: system-controller@e6180000 {
@@ -1283,6 +1290,7 @@ gic: interrupt-controller@f1000000 {
 		prr: chipid@fff00044 {
 			compatible = "renesas,prr";
 			reg = <0 0xfff00044 0 4>;
+			bootph-all;
 		};
 	};
 
diff --git a/arch/arm64/boot/dts/renesas/r8a779f4-s4sk.dts b/arch/arm64/boot/dts/renesas/r8a779f4-s4sk.dts
index df652e7b85c95..67b18f2bffbd0 100644
--- a/arch/arm64/boot/dts/renesas/r8a779f4-s4sk.dts
+++ b/arch/arm64/boot/dts/renesas/r8a779f4-s4sk.dts
@@ -68,6 +68,7 @@ &extalr_clk {
 &hscif0 {
 	pinctrl-0 = <&hscif0_pins>;
 	pinctrl-names = "default";
+	bootph-all;
 
 	uart-has-rtscts;
 	status = "okay";
diff --git a/arch/arm64/boot/dts/renesas/r8a779g0.dtsi b/arch/arm64/boot/dts/renesas/r8a779g0.dtsi
index 550e7dabd1da1..1760720b71287 100644
--- a/arch/arm64/boot/dts/renesas/r8a779g0.dtsi
+++ b/arch/arm64/boot/dts/renesas/r8a779g0.dtsi
@@ -166,6 +166,7 @@ extal_clk: extal {
 		#clock-cells = <0>;
 		/* This value must be overridden by the board */
 		clock-frequency = <0>;
+		bootph-all;
 	};
 
 	extalr_clk: extalr {
@@ -173,6 +174,7 @@ extalr_clk: extalr {
 		#clock-cells = <0>;
 		/* This value must be overridden by the board */
 		clock-frequency = <0>;
+		bootph-all;
 	};
 
 	pcie0_clkref: pcie0-clkref {
@@ -215,6 +217,8 @@ scif_clk2: scif2 {
 	soc: soc {
 		compatible = "simple-bus";
 		interrupt-parent = <&gic>;
+		bootph-all;
+
 		#address-cells = <2>;
 		#size-cells = <2>;
 		ranges;
@@ -237,6 +241,7 @@ pfc: pinctrl@e6050000 {
 			      <0 0xe6060000 0 0x16c>, <0 0xe6060800 0 0x16c>,
 			      <0 0xe6061000 0 0x16c>, <0 0xe6061800 0 0x16c>,
 			      <0 0xe6068000 0 0x16c>;
+			bootph-all;
 		};
 
 		gpio0: gpio@e6050180 {
@@ -452,11 +457,13 @@ cpg: clock-controller@e6150000 {
 			#clock-cells = <2>;
 			#power-domain-cells = <0>;
 			#reset-cells = <1>;
+			bootph-all;
 		};
 
 		rst: reset-controller@e6160000 {
 			compatible = "renesas,r8a779g0-rst";
 			reg = <0 0xe6160000 0 0x4000>;
+			bootph-all;
 		};
 
 		sysc: system-controller@e6180000 {
@@ -2496,6 +2503,7 @@ port@1 {
 		prr: chipid@fff00044 {
 			compatible = "renesas,prr";
 			reg = <0 0xfff00044 0 4>;
+			bootph-all;
 		};
 	};
 
diff --git a/arch/arm64/boot/dts/renesas/r8a779h0-gray-hawk-single.dts b/arch/arm64/boot/dts/renesas/r8a779h0-gray-hawk-single.dts
index 99bbb8a1b7b54..4d890e0617aff 100644
--- a/arch/arm64/boot/dts/renesas/r8a779h0-gray-hawk-single.dts
+++ b/arch/arm64/boot/dts/renesas/r8a779h0-gray-hawk-single.dts
@@ -361,6 +361,7 @@ audio-power-hog {
 &hscif0 {
 	pinctrl-0 = <&hscif0_pins>;
 	pinctrl-names = "default";
+	bootph-all;
 
 	uart-has-rtscts;
 	status = "okay";
diff --git a/arch/arm64/boot/dts/renesas/r8a779h0.dtsi b/arch/arm64/boot/dts/renesas/r8a779h0.dtsi
index 196b433bf82c8..8524a1e7205ea 100644
--- a/arch/arm64/boot/dts/renesas/r8a779h0.dtsi
+++ b/arch/arm64/boot/dts/renesas/r8a779h0.dtsi
@@ -138,6 +138,7 @@ extal_clk: extal-clk {
 		#clock-cells = <0>;
 		/* This value must be overridden by the board */
 		clock-frequency = <0>;
+		bootph-all;
 	};
 
 	extalr_clk: extalr-clk {
@@ -145,6 +146,7 @@ extalr_clk: extalr-clk {
 		#clock-cells = <0>;
 		/* This value must be overridden by the board */
 		clock-frequency = <0>;
+		bootph-all;
 	};
 
 	pcie0_clkref: pcie0-clkref {
@@ -180,6 +182,8 @@ scif_clk2: scif-clk2 {
 	soc: soc {
 		compatible = "simple-bus";
 		interrupt-parent = <&gic>;
+		bootph-all;
+
 		#address-cells = <2>;
 		#size-cells = <2>;
 		ranges;
@@ -201,6 +205,7 @@ pfc: pinctrl@e6050000 {
 			      <0 0xe6058000 0 0x16c>, <0 0xe6058800 0 0x16c>,
 			      <0 0xe6060000 0 0x16c>, <0 0xe6060800 0 0x16c>,
 			      <0 0xe6061000 0 0x16c>, <0 0xe6061800 0 0x16c>;
+			bootph-all;
 		};
 
 		gpio0: gpio@e6050180 {
@@ -401,11 +406,13 @@ cpg: clock-controller@e6150000 {
 			#clock-cells = <2>;
 			#power-domain-cells = <0>;
 			#reset-cells = <1>;
+			bootph-all;
 		};
 
 		rst: reset-controller@e6160000 {
 			compatible = "renesas,r8a779h0-rst";
 			reg = <0 0xe6160000 0 0x4000>;
+			bootph-all;
 		};
 
 		sysc: system-controller@e6180000 {
@@ -2158,6 +2165,7 @@ port@1 {
 		prr: chipid@fff00044 {
 			compatible = "renesas,prr";
 			reg = <0 0xfff00044 0 4>;
+			bootph-all;
 		};
 	};
 
diff --git a/arch/arm64/boot/dts/renesas/salvator-common.dtsi b/arch/arm64/boot/dts/renesas/salvator-common.dtsi
index 06c7e9746304f..68971c870d172 100644
--- a/arch/arm64/boot/dts/renesas/salvator-common.dtsi
+++ b/arch/arm64/boot/dts/renesas/salvator-common.dtsi
@@ -940,6 +940,7 @@ &scif1 {
 &scif2 {
 	pinctrl-0 = <&scif2_pins>;
 	pinctrl-names = "default";
+	bootph-all;
 
 	status = "okay";
 };
diff --git a/arch/arm64/boot/dts/renesas/ulcb.dtsi b/arch/arm64/boot/dts/renesas/ulcb.dtsi
index 0c58d816c375f..fcab957b54f70 100644
--- a/arch/arm64/boot/dts/renesas/ulcb.dtsi
+++ b/arch/arm64/boot/dts/renesas/ulcb.dtsi
@@ -448,6 +448,7 @@ &rwdt {
 &scif2 {
 	pinctrl-0 = <&scif2_pins>;
 	pinctrl-names = "default";
+	bootph-all;
 
 	status = "okay";
 };
diff --git a/arch/arm64/boot/dts/renesas/white-hawk-cpu-common.dtsi b/arch/arm64/boot/dts/renesas/white-hawk-cpu-common.dtsi
index f24814d7c924e..b4024e85ae5aa 100644
--- a/arch/arm64/boot/dts/renesas/white-hawk-cpu-common.dtsi
+++ b/arch/arm64/boot/dts/renesas/white-hawk-cpu-common.dtsi
@@ -201,6 +201,7 @@ &extalr_clk {
 &hscif0 {
 	pinctrl-0 = <&hscif0_pins>;
 	pinctrl-names = "default";
+	bootph-all;
 
 	status = "okay";
 };
-- 
2.47.2


