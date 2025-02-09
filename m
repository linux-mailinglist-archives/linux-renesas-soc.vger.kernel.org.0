Return-Path: <linux-renesas-soc+bounces-12963-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id B4956A2DFB2
	for <lists+linux-renesas-soc@lfdr.de>; Sun,  9 Feb 2025 19:06:53 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 535B6164844
	for <lists+linux-renesas-soc@lfdr.de>; Sun,  9 Feb 2025 18:06:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7FAA41E0DBA;
	Sun,  9 Feb 2025 18:06:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="LT0YSKEO";
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="CbxD3MUm"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mout-p-201.mailbox.org (mout-p-201.mailbox.org [80.241.56.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 30DE31DED7B;
	Sun,  9 Feb 2025 18:06:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.241.56.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739124411; cv=none; b=h2OdgASFhz1pIEuHnX+D27Yv7tKa6TxdhFErGiyR+RF1mrxTzooVfgJTEZqrngTq8oXOA7FWxmLYwgBNQax3Gw+cBUQUQMqISKtOG32efPO/A/nYZMZ8SiNNGi8nmLkNc+AUkkq0Abs3oma+UYa6WmYytAoDksyCh8I6quHPPX8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739124411; c=relaxed/simple;
	bh=wROsXHBZE2aYv+GIrY4VjtMCQniSAtS385enm4ggRIw=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=VAvjVWvuNunvZwsZLYiP5E3tkC6ls1t5/yzqnZ4fv0F4JwYJHw6t9ipVF+/7j4kVu8AnYzoK21VEe+R96MdCc3P7JAnxJTy1/T+Q46S9+2CEWu4Ks8mKIY46qXbYZxaur/FpNzr0j6fAxIP3bI9gC5YunV/IWo8VeGVyellvDsk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org; spf=pass smtp.mailfrom=mailbox.org; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=LT0YSKEO; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=CbxD3MUm; arc=none smtp.client-ip=80.241.56.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mailbox.org
Received: from smtp2.mailbox.org (smtp2.mailbox.org [IPv6:2001:67c:2050:b231:465::2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-201.mailbox.org (Postfix) with ESMTPS id 4YrbJ70hSXz9sT9;
	Sun,  9 Feb 2025 19:06:47 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1739124407;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=nm11C/vSYVh8GDGZHfUDlNWNTOIXtOIJnLqiD9TfA30=;
	b=LT0YSKEO3djex7KccBfSv4i9sBZRBCpbZulGIXRWB//eIALQSvu+jXYJ6t2nLYxtU9LY+o
	QlY+HYZeIaSqKAFWhyUJ3H/tMDyNcCyHqnemZPgd0z1Jn58J3qmDPJ2/5Pglfdxa0Ajz1h
	ryy8X3XZizY4oZ46SqLaVMiDvPPNMF1TRLD1aLHmvAu3SUFeQ/EeXYu9ktjSlGj4BMVXFg
	kSEjHVmNedOHGzMLFmc+tkHM12bzDNMyS+E7g5dx3qscuvTyqnZGScVcziTZTH45u+xaNO
	EkPqJydcaZEO6r7kIYcCJ+wddtVYY3WfZYp41keoDf51YReFZAulGynXuUWDgw==
From: Marek Vasut <marek.vasut+renesas@mailbox.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1739124405;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=nm11C/vSYVh8GDGZHfUDlNWNTOIXtOIJnLqiD9TfA30=;
	b=CbxD3MUmPHTnrpZ3WCNsog2yv5L1Bl4V7TcfZ58C5Xz5KqPU9pRuXwJVhGI2x4qbtCgt88
	B3aPlZJ9kmlrGGnWiWpoUU+dRM9EO00ihmsQgx0Rt1TX/+49tGw8B7LRFFnG/NsfZR+9I2
	yk0Woz80IsOhjv/VX1qkUhgepFo1cVGL6w4li76kihQeFpV7sWLn/YJsiXZEtHMkgOZ6tA
	iGF88JsoG6K+7NiwD3OEYq7wWwi7lWIloy0KgsO3fTCKejkWYVFaEN3zm8T1lMay0BpjRy
	B1rpKEZFhs3a+JM7nDxdfO+wjJyPXe2hvG9iUvO/aD6Cx5xeyy5FsOG51dp4hQ==
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
Subject: [PATCH 1/3] ARM: dts: renesas: Add boot phase tags marking to Renesas R-Car Gen2
Date: Sun,  9 Feb 2025 19:05:04 +0100
Message-ID: <20250209180616.160253-1-marek.vasut+renesas@mailbox.org>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-MBO-RS-ID: 8782ec19eb1986f3ac3
X-MBO-RS-META: eipw4xkzyxtdpo8sx8gou768iuz3unnu
X-Rspamd-Queue-Id: 4YrbJ70hSXz9sT9

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
 arch/arm/boot/dts/renesas/r8a7790-lager.dts   | 1 +
 arch/arm/boot/dts/renesas/r8a7790-stout.dts   | 1 +
 arch/arm/boot/dts/renesas/r8a7790.dtsi        | 7 +++++++
 arch/arm/boot/dts/renesas/r8a7791-koelsch.dts | 1 +
 arch/arm/boot/dts/renesas/r8a7791-porter.dts  | 1 +
 arch/arm/boot/dts/renesas/r8a7791.dtsi        | 7 +++++++
 arch/arm/boot/dts/renesas/r8a7792-blanche.dts | 1 +
 arch/arm/boot/dts/renesas/r8a7792-wheat.dts   | 1 +
 arch/arm/boot/dts/renesas/r8a7792.dtsi        | 6 ++++++
 arch/arm/boot/dts/renesas/r8a7793-gose.dts    | 1 +
 arch/arm/boot/dts/renesas/r8a7793.dtsi        | 7 +++++++
 arch/arm/boot/dts/renesas/r8a7794-alt.dts     | 1 +
 arch/arm/boot/dts/renesas/r8a7794-silk.dts    | 1 +
 arch/arm/boot/dts/renesas/r8a7794.dtsi        | 7 +++++++
 14 files changed, 43 insertions(+)

diff --git a/arch/arm/boot/dts/renesas/r8a7790-lager.dts b/arch/arm/boot/dts/renesas/r8a7790-lager.dts
index 3bce5876a9d81..4f002aa7fbafc 100644
--- a/arch/arm/boot/dts/renesas/r8a7790-lager.dts
+++ b/arch/arm/boot/dts/renesas/r8a7790-lager.dts
@@ -754,6 +754,7 @@ partition@440000 {
 &scif0 {
 	pinctrl-0 = <&scif0_pins>;
 	pinctrl-names = "default";
+	bootph-all;
 
 	status = "okay";
 };
diff --git a/arch/arm/boot/dts/renesas/r8a7790-stout.dts b/arch/arm/boot/dts/renesas/r8a7790-stout.dts
index d7c0a9574ce83..b1e20579e0710 100644
--- a/arch/arm/boot/dts/renesas/r8a7790-stout.dts
+++ b/arch/arm/boot/dts/renesas/r8a7790-stout.dts
@@ -268,6 +268,7 @@ partition@100000 {
 &scifa0 {
 	pinctrl-0 = <&scifa0_pins>;
 	pinctrl-names = "default";
+	bootph-all;
 
 	status = "okay";
 };
diff --git a/arch/arm/boot/dts/renesas/r8a7790.dtsi b/arch/arm/boot/dts/renesas/r8a7790.dtsi
index f746f0b9e686b..4f97c09dbc9fe 100644
--- a/arch/arm/boot/dts/renesas/r8a7790.dtsi
+++ b/arch/arm/boot/dts/renesas/r8a7790.dtsi
@@ -227,6 +227,7 @@ extal_clk: extal {
 		#clock-cells = <0>;
 		/* This value must be overridden by the board. */
 		clock-frequency = <0>;
+		bootph-all;
 	};
 
 	/* External PCIe clock - can be overridden by the board */
@@ -265,6 +266,7 @@ scif_clk: scif {
 	soc {
 		compatible = "simple-bus";
 		interrupt-parent = <&gic>;
+		bootph-all;
 
 		#address-cells = <2>;
 		#size-cells = <2>;
@@ -374,6 +376,7 @@ gpio5: gpio@e6055000 {
 		pfc: pinctrl@e6060000 {
 			compatible = "renesas,pfc-r8a7790";
 			reg = <0 0xe6060000 0 0x250>;
+			bootph-all;
 		};
 
 		tpu: pwm@e60f0000 {
@@ -395,6 +398,7 @@ cpg: clock-controller@e6150000 {
 			#clock-cells = <2>;
 			#power-domain-cells = <0>;
 			#reset-cells = <1>;
+			bootph-all;
 		};
 
 		apmu@e6151000 {
@@ -412,6 +416,7 @@ apmu@e6152000 {
 		rst: reset-controller@e6160000 {
 			compatible = "renesas,r8a7790-rst";
 			reg = <0 0xe6160000 0 0x0100>;
+			bootph-all;
 		};
 
 		sysc: system-controller@e6180000 {
@@ -1948,6 +1953,7 @@ lvds1_out: endpoint {
 		prr: chipid@ff000044 {
 			compatible = "renesas,prr";
 			reg = <0 0xff000044 0 4>;
+			bootph-all;
 		};
 
 		cmt0: timer@ffca0000 {
@@ -2018,5 +2024,6 @@ usb_extal_clk: usb_extal {
 		compatible = "fixed-clock";
 		#clock-cells = <0>;
 		clock-frequency = <48000000>;
+		bootph-all;
 	};
 };
diff --git a/arch/arm/boot/dts/renesas/r8a7791-koelsch.dts b/arch/arm/boot/dts/renesas/r8a7791-koelsch.dts
index e4e1d9c98c617..e9f90fa44d551 100644
--- a/arch/arm/boot/dts/renesas/r8a7791-koelsch.dts
+++ b/arch/arm/boot/dts/renesas/r8a7791-koelsch.dts
@@ -679,6 +679,7 @@ &sata0 {
 &scif0 {
 	pinctrl-0 = <&scif0_pins>;
 	pinctrl-names = "default";
+	bootph-all;
 
 	status = "okay";
 };
diff --git a/arch/arm/boot/dts/renesas/r8a7791-porter.dts b/arch/arm/boot/dts/renesas/r8a7791-porter.dts
index 08381498350aa..f518eadd8b9cd 100644
--- a/arch/arm/boot/dts/renesas/r8a7791-porter.dts
+++ b/arch/arm/boot/dts/renesas/r8a7791-porter.dts
@@ -312,6 +312,7 @@ audio_clk_pins: audio_clk {
 &scif0 {
 	pinctrl-0 = <&scif0_pins>;
 	pinctrl-names = "default";
+	bootph-all;
 
 	status = "okay";
 };
diff --git a/arch/arm/boot/dts/renesas/r8a7791.dtsi b/arch/arm/boot/dts/renesas/r8a7791.dtsi
index e57567adff558..5023b41c28b36 100644
--- a/arch/arm/boot/dts/renesas/r8a7791.dtsi
+++ b/arch/arm/boot/dts/renesas/r8a7791.dtsi
@@ -125,6 +125,7 @@ extal_clk: extal {
 		#clock-cells = <0>;
 		/* This value must be overridden by the board. */
 		clock-frequency = <0>;
+		bootph-all;
 	};
 
 	/* External PCIe clock - can be overridden by the board */
@@ -152,6 +153,7 @@ scif_clk: scif {
 	soc {
 		compatible = "simple-bus";
 		interrupt-parent = <&gic>;
+		bootph-all;
 
 		#address-cells = <2>;
 		#size-cells = <2>;
@@ -291,6 +293,7 @@ gpio7: gpio@e6055800 {
 		pfc: pinctrl@e6060000 {
 			compatible = "renesas,pfc-r8a7791";
 			reg = <0 0xe6060000 0 0x250>;
+			bootph-all;
 		};
 
 		tpu: pwm@e60f0000 {
@@ -312,6 +315,7 @@ cpg: clock-controller@e6150000 {
 			#clock-cells = <2>;
 			#power-domain-cells = <0>;
 			#reset-cells = <1>;
+			bootph-all;
 		};
 
 		apmu@e6152000 {
@@ -323,6 +327,7 @@ apmu@e6152000 {
 		rst: reset-controller@e6160000 {
 			compatible = "renesas,r8a7791-rst";
 			reg = <0 0xe6160000 0 0x0100>;
+			bootph-all;
 		};
 
 		sysc: system-controller@e6180000 {
@@ -1875,6 +1880,7 @@ lvds0_out: endpoint {
 		prr: chipid@ff000044 {
 			compatible = "renesas,prr";
 			reg = <0 0xff000044 0 4>;
+			bootph-all;
 		};
 
 		cmt0: timer@ffca0000 {
@@ -1945,5 +1951,6 @@ usb_extal_clk: usb_extal {
 		compatible = "fixed-clock";
 		#clock-cells = <0>;
 		clock-frequency = <48000000>;
+		bootph-all;
 	};
 };
diff --git a/arch/arm/boot/dts/renesas/r8a7792-blanche.dts b/arch/arm/boot/dts/renesas/r8a7792-blanche.dts
index a3986076d8e3e..23ec0f8a66510 100644
--- a/arch/arm/boot/dts/renesas/r8a7792-blanche.dts
+++ b/arch/arm/boot/dts/renesas/r8a7792-blanche.dts
@@ -301,6 +301,7 @@ &rwdt {
 &scif0 {
 	pinctrl-0 = <&scif0_pins>;
 	pinctrl-names = "default";
+	bootph-all;
 
 	status = "okay";
 };
diff --git a/arch/arm/boot/dts/renesas/r8a7792-wheat.dts b/arch/arm/boot/dts/renesas/r8a7792-wheat.dts
index bfc780f7e396b..93bd81723c8fb 100644
--- a/arch/arm/boot/dts/renesas/r8a7792-wheat.dts
+++ b/arch/arm/boot/dts/renesas/r8a7792-wheat.dts
@@ -183,6 +183,7 @@ &rwdt {
 &scif0 {
 	pinctrl-0 = <&scif0_pins>;
 	pinctrl-names = "default";
+	bootph-all;
 
 	status = "okay";
 };
diff --git a/arch/arm/boot/dts/renesas/r8a7792.dtsi b/arch/arm/boot/dts/renesas/r8a7792.dtsi
index 08cbe6c13cee4..7513afc1c9585 100644
--- a/arch/arm/boot/dts/renesas/r8a7792.dtsi
+++ b/arch/arm/boot/dts/renesas/r8a7792.dtsi
@@ -82,6 +82,7 @@ extal_clk: extal {
 		#clock-cells = <0>;
 		/* This value must be overridden by the board. */
 		clock-frequency = <0>;
+		bootph-all;
 	};
 
 	lbsc: bus {
@@ -109,6 +110,7 @@ scif_clk: scif {
 	soc {
 		compatible = "simple-bus";
 		interrupt-parent = <&gic>;
+		bootph-all;
 
 		#address-cells = <2>;
 		#size-cells = <2>;
@@ -308,6 +310,7 @@ gpio11: gpio@e6055600 {
 		pfc: pinctrl@e6060000 {
 			compatible = "renesas,pfc-r8a7792";
 			reg = <0 0xe6060000 0 0x144>;
+			bootph-all;
 		};
 
 		cpg: clock-controller@e6150000 {
@@ -318,6 +321,7 @@ cpg: clock-controller@e6150000 {
 			#clock-cells = <2>;
 			#power-domain-cells = <0>;
 			#reset-cells = <1>;
+			bootph-all;
 		};
 
 		apmu@e6152000 {
@@ -329,6 +333,7 @@ apmu@e6152000 {
 		rst: reset-controller@e6160000 {
 			compatible = "renesas,r8a7792-rst";
 			reg = <0 0xe6160000 0 0x0100>;
+			bootph-all;
 		};
 
 		sysc: system-controller@e6180000 {
@@ -947,6 +952,7 @@ du_out_rgb1: endpoint {
 		prr: chipid@ff000044 {
 			compatible = "renesas,prr";
 			reg = <0 0xff000044 0 4>;
+			bootph-all;
 		};
 
 		cmt0: timer@ffca0000 {
diff --git a/arch/arm/boot/dts/renesas/r8a7793-gose.dts b/arch/arm/boot/dts/renesas/r8a7793-gose.dts
index 2c05d7c2b3776..45b267ec26794 100644
--- a/arch/arm/boot/dts/renesas/r8a7793-gose.dts
+++ b/arch/arm/boot/dts/renesas/r8a7793-gose.dts
@@ -642,6 +642,7 @@ &rwdt {
 &scif0 {
 	pinctrl-0 = <&scif0_pins>;
 	pinctrl-names = "default";
+	bootph-all;
 
 	status = "okay";
 };
diff --git a/arch/arm/boot/dts/renesas/r8a7793.dtsi b/arch/arm/boot/dts/renesas/r8a7793.dtsi
index e48e43cc6b03d..fc6d3bcca2961 100644
--- a/arch/arm/boot/dts/renesas/r8a7793.dtsi
+++ b/arch/arm/boot/dts/renesas/r8a7793.dtsi
@@ -117,6 +117,7 @@ extal_clk: extal {
 		#clock-cells = <0>;
 		/* This value must be overridden by the board. */
 		clock-frequency = <0>;
+		bootph-all;
 	};
 
 	pmu {
@@ -137,6 +138,7 @@ scif_clk: scif {
 	soc {
 		compatible = "simple-bus";
 		interrupt-parent = <&gic>;
+		bootph-all;
 
 		#address-cells = <2>;
 		#size-cells = <2>;
@@ -276,6 +278,7 @@ gpio7: gpio@e6055800 {
 		pfc: pinctrl@e6060000 {
 			compatible = "renesas,pfc-r8a7793";
 			reg = <0 0xe6060000 0 0x250>;
+			bootph-all;
 		};
 
 		/* Special CPG clocks */
@@ -287,6 +290,7 @@ cpg: clock-controller@e6150000 {
 			#clock-cells = <2>;
 			#power-domain-cells = <0>;
 			#reset-cells = <1>;
+			bootph-all;
 		};
 
 		apmu@e6152000 {
@@ -298,6 +302,7 @@ apmu@e6152000 {
 		rst: reset-controller@e6160000 {
 			compatible = "renesas,r8a7793-rst";
 			reg = <0 0xe6160000 0 0x0100>;
+			bootph-all;
 		};
 
 		sysc: system-controller@e6180000 {
@@ -1454,6 +1459,7 @@ lvds0_out: endpoint {
 		prr: chipid@ff000044 {
 			compatible = "renesas,prr";
 			reg = <0 0xff000044 0 4>;
+			bootph-all;
 		};
 
 		cmt0: timer@ffca0000 {
@@ -1524,5 +1530,6 @@ usb_extal_clk: usb_extal {
 		compatible = "fixed-clock";
 		#clock-cells = <0>;
 		clock-frequency = <48000000>;
+		bootph-all;
 	};
 };
diff --git a/arch/arm/boot/dts/renesas/r8a7794-alt.dts b/arch/arm/boot/dts/renesas/r8a7794-alt.dts
index f70e26aa83a0a..3f06a7f67d62a 100644
--- a/arch/arm/boot/dts/renesas/r8a7794-alt.dts
+++ b/arch/arm/boot/dts/renesas/r8a7794-alt.dts
@@ -479,6 +479,7 @@ vin0ep: endpoint {
 &scif2 {
 	pinctrl-0 = <&scif2_pins>;
 	pinctrl-names = "default";
+	bootph-all;
 
 	status = "okay";
 };
diff --git a/arch/arm/boot/dts/renesas/r8a7794-silk.dts b/arch/arm/boot/dts/renesas/r8a7794-silk.dts
index 2a0819311a3c4..3428256057680 100644
--- a/arch/arm/boot/dts/renesas/r8a7794-silk.dts
+++ b/arch/arm/boot/dts/renesas/r8a7794-silk.dts
@@ -394,6 +394,7 @@ audio_clk_pins: audio_clk {
 &scif2 {
 	pinctrl-0 = <&scif2_pins>;
 	pinctrl-names = "default";
+	bootph-all;
 
 	status = "okay";
 };
diff --git a/arch/arm/boot/dts/renesas/r8a7794.dtsi b/arch/arm/boot/dts/renesas/r8a7794.dtsi
index bc16c896c0f9b..92010d09f6c40 100644
--- a/arch/arm/boot/dts/renesas/r8a7794.dtsi
+++ b/arch/arm/boot/dts/renesas/r8a7794.dtsi
@@ -99,6 +99,7 @@ extal_clk: extal {
 		#clock-cells = <0>;
 		/* This value must be overridden by the board. */
 		clock-frequency = <0>;
+		bootph-all;
 	};
 
 	pmu {
@@ -119,6 +120,7 @@ scif_clk: scif {
 	soc {
 		compatible = "simple-bus";
 		interrupt-parent = <&gic>;
+		bootph-all;
 
 		#address-cells = <2>;
 		#size-cells = <2>;
@@ -243,6 +245,7 @@ gpio6: gpio@e6055400 {
 		pfc: pinctrl@e6060000 {
 			compatible = "renesas,pfc-r8a7794";
 			reg = <0 0xe6060000 0 0x11c>;
+			bootph-all;
 		};
 
 		cpg: clock-controller@e6150000 {
@@ -253,6 +256,7 @@ cpg: clock-controller@e6150000 {
 			#clock-cells = <2>;
 			#power-domain-cells = <0>;
 			#reset-cells = <1>;
+			bootph-all;
 		};
 
 		apmu@e6151000 {
@@ -264,6 +268,7 @@ apmu@e6151000 {
 		rst: reset-controller@e6160000 {
 			compatible = "renesas,r8a7794-rst";
 			reg = <0 0xe6160000 0 0x0100>;
+			bootph-all;
 		};
 
 		sysc: system-controller@e6180000 {
@@ -1440,6 +1445,7 @@ du_out_rgb1: endpoint {
 		prr: chipid@ff000044 {
 			compatible = "renesas,prr";
 			reg = <0 0xff000044 0 4>;
+			bootph-all;
 		};
 
 		cmt0: timer@ffca0000 {
@@ -1491,5 +1497,6 @@ usb_extal_clk: usb_extal {
 		compatible = "fixed-clock";
 		#clock-cells = <0>;
 		clock-frequency = <48000000>;
+		bootph-all;
 	};
 };
-- 
2.47.2


