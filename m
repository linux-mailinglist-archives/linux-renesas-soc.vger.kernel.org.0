Return-Path: <linux-renesas-soc+bounces-31475-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id qDDaH02/52l6AQIAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-31475-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 21 Apr 2026 20:17:49 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A7DF43E92C
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 21 Apr 2026 20:17:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id D1A5E302D621
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 21 Apr 2026 18:13:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B81813D9DC5;
	Tue, 21 Apr 2026 18:13:04 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B99A7260F;
	Tue, 21 Apr 2026 18:13:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776795184; cv=none; b=gobZTFViIrPkN/Rr4lnnfJzjZQr6QQGhKCGx/CFrvCOHUyrUs4NpLP7b/N688CjGkiKylLSe9/Sxi1SAws9agwJy4pyad1VcoMV8YfewcYU/MiAPsHopv2zaPpL2wZImD7eYiRG/0CG5SsIvU2qdHW6bWBrnXhRDegbz3tzeLi8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776795184; c=relaxed/simple;
	bh=ohh6rjckmdTtX2BmrPnpL5dknnlXTW3T12A14bkCGNo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Y6sNfgqvLSVU9+bIRsc0jFQfyWo2kDO79XUFMEnGvSeO+Gso90wrMeNoLxx5L3PHqdVlwAs1KjVHBjWMKic+LgpR66YbNAmIsI8XCTPHM0e4i0hdDwvnf7d7hDbKcbLyqicSGEzeFaRTr2LCq49eMJ3zNdmXgbz51z7kS76gDmM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3B44BC2BCB7;
	Tue, 21 Apr 2026 18:12:59 +0000 (UTC)
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Sudeep Holla <sudeep.holla@kernel.org>,
	Cristian Marussi <cristian.marussi@arm.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Magnus Damm <magnus.damm@gmail.com>,
	Saravana Kannan <saravanak@kernel.org>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Ulf Hansson <ulfh@kernel.org>,
	"Rafael J . Wysocki" <rafael@kernel.org>,
	Kevin Hilman <khilman@baylibre.com>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Marek Vasut <marek.vasut+renesas@mailbox.org>,
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc: arm-scmi@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-renesas-soc@vger.kernel.org,
	linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-pm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH/RFC 13/14] arm64: dts: renesas: r8a78000: Add CPG/MDLC nodes
Date: Tue, 21 Apr 2026 20:11:46 +0200
Message-ID: <586b1266f9a8e5aaccc010d4a3a02276ea44f3c8.1776793163.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1776793163.git.geert+renesas@glider.be>
References: <cover.1776793163.git.geert+renesas@glider.be>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [0.54 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DMARC_NA(0.00)[glider.be];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-31475-lists,linux-renesas-soc=lfdr.de,renesas];
	FREEMAIL_TO(0.00)[kernel.org,arm.com,gmail.com,baylibre.com,pengutronix.de,broadcom.com,sang-engineering.com,mailbox.org,renesas.com];
	RCPT_COUNT_TWELVE(0.00)[25];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	FROM_NEQ_ENVFROM(0.00)[geert@glider.be,linux-renesas-soc@vger.kernel.org];
	R_DKIM_NA(0.00)[];
	NEURAL_HAM(-0.00)[-0.996];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-renesas-soc,dt,renesas];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 9A7DF43E92C
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Add device nodes for the Clock Pulse Generator (CPG) and Module Control
(MDLC) blocks on the R-Car X5H (R8A78000) SoC.

Convert all (H)SCIF serial ports from dummy to CPG clocks, and link them
to an MDLC for power domains and resets.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
Add all MDLC nodes from the start, or only when used/tested?
---
 arch/arm64/boot/dts/renesas/r8a78000.dtsi | 300 ++++++++++++++++++++--
 1 file changed, 275 insertions(+), 25 deletions(-)

diff --git a/arch/arm64/boot/dts/renesas/r8a78000.dtsi b/arch/arm64/boot/dts/renesas/r8a78000.dtsi
index 11922b1ac73b3af5..640b622435569461 100644
--- a/arch/arm64/boot/dts/renesas/r8a78000.dtsi
+++ b/arch/arm64/boot/dts/renesas/r8a78000.dtsi
@@ -5,6 +5,8 @@
  * Copyright (C) 2025 Renesas Electronics Corp.
  */
 
+#include <dt-bindings/clock/renesas,r8a78000-cpg.h>
+#include <dt-bindings/power/renesas,r8a78000-mdlc.h>
 #include <dt-bindings/interrupt-controller/arm-gic.h>
 
 / {
@@ -636,23 +638,6 @@ L3_CA720_7: cache-controller-37 {
 		};
 	};
 
-	/*
-	 * In the early phase, there is no clock control support,
-	 * so assume that the clocks are enabled by default.
-	 * Therefore, dummy clocks are used.
-	 */
-	dummy_clk_sgasyncd16: dummy-clk-sgasyncd16 {
-		compatible = "fixed-clock";
-		#clock-cells = <0>;
-		clock-frequency = <66666000>;
-	};
-
-	dummy_clk_sgasyncd4: dummy-clk-sgasyncd4 {
-		compatible = "fixed-clock";
-		#clock-cells = <0>;
-		clock-frequency = <266660000>;
-	};
-
 	extal_clk: extal-clk {
 		compatible = "fixed-clock";
 		#clock-cells = <0>;
@@ -813,8 +798,12 @@ scif0: serial@c0700000 {
 				     "renesas,rcar-gen5-scif", "renesas,scif";
 			reg = <0 0xc0700000 0 0x40>;
 			interrupts = <GIC_ESPI 10 IRQ_TYPE_LEVEL_HIGH>;
-			clocks = <&dummy_clk_sgasyncd16>, <&dummy_clk_sgasyncd4>, <&scif_clk>;
+			clocks = <&cpg R8A78000_CPG_SGASYNCD16_PERW_BUS>,
+				 <&cpg R8A78000_CPG_SGASYNCD4_PERW_BUS>,
+				 <&scif_clk>;
 			clock-names = "fck", "brg_int", "scif_clk";
+			power-domains = <&mdlc_perw R8A78000_MDLC_PD_APL 0x40>;
+			resets = <&mdlc_perw 0x40>;
 			status = "disabled";
 		};
 
@@ -823,8 +812,12 @@ scif1: serial@c0704000 {
 				     "renesas,rcar-gen5-scif", "renesas,scif";
 			reg = <0 0xc0704000 0 0x40>;
 			interrupts = <GIC_ESPI 11 IRQ_TYPE_LEVEL_HIGH>;
-			clocks = <&dummy_clk_sgasyncd16>, <&dummy_clk_sgasyncd4>, <&scif_clk>;
+			clocks = <&cpg R8A78000_CPG_SGASYNCD16_PERW_BUS>,
+				 <&cpg R8A78000_CPG_SGASYNCD4_PERW_BUS>,
+				 <&scif_clk>;
 			clock-names = "fck", "brg_int", "scif_clk";
+			power-domains = <&mdlc_perw R8A78000_MDLC_PD_APL 0x41>;
+			resets = <&mdlc_perw 0x41>;
 			status = "disabled";
 		};
 
@@ -833,8 +826,12 @@ scif3: serial@c0708000 {
 				     "renesas,rcar-gen5-scif", "renesas,scif";
 			reg = <0 0xc0708000 0 0x40>;
 			interrupts = <GIC_ESPI 12 IRQ_TYPE_LEVEL_HIGH>;
-			clocks = <&dummy_clk_sgasyncd16>, <&dummy_clk_sgasyncd4>, <&scif_clk>;
+			clocks = <&cpg R8A78000_CPG_SGASYNCD16_PERW_BUS>,
+				 <&cpg R8A78000_CPG_SGASYNCD4_PERW_BUS>,
+				 <&scif_clk>;
 			clock-names = "fck", "brg_int", "scif_clk";
+			power-domains = <&mdlc_perw R8A78000_MDLC_PD_APL 0x42>;
+			resets = <&mdlc_perw 0x42>;
 			status = "disabled";
 		};
 
@@ -843,8 +840,12 @@ scif4: serial@c070c000 {
 				     "renesas,rcar-gen5-scif", "renesas,scif";
 			reg = <0 0xc070c000 0 0x40>;
 			interrupts = <GIC_ESPI 13 IRQ_TYPE_LEVEL_HIGH>;
-			clocks = <&dummy_clk_sgasyncd16>, <&dummy_clk_sgasyncd4>, <&scif_clk>;
+			clocks = <&cpg R8A78000_CPG_SGASYNCD16_PERW_BUS>,
+				 <&cpg R8A78000_CPG_SGASYNCD4_PERW_BUS>,
+				 <&scif_clk>;
 			clock-names = "fck", "brg_int", "scif_clk";
+			power-domains = <&mdlc_perw R8A78000_MDLC_PD_APL 0x43>;
+			resets = <&mdlc_perw 0x43>;
 			status = "disabled";
 		};
 
@@ -853,8 +854,12 @@ hscif0: serial@c0710000 {
 				     "renesas,rcar-gen5-hscif", "renesas,hscif";
 			reg = <0 0xc0710000 0 0x60>;
 			interrupts = <GIC_ESPI 14 IRQ_TYPE_LEVEL_HIGH>;
-			clocks = <&dummy_clk_sgasyncd4>, <&dummy_clk_sgasyncd4>, <&scif_clk>;
+			clocks = <&cpg R8A78000_CPG_SGASYNCD4_PERW_BUS>,
+				 <&cpg R8A78000_CPG_SGASYNCD4_PERW_BUS>,
+				 <&scif_clk>;
 			clock-names = "fck", "brg_int", "scif_clk";
+			power-domains = <&mdlc_perw R8A78000_MDLC_PD_APL 0x54>;
+			resets = <&mdlc_perw 0x54>;
 			status = "disabled";
 		};
 
@@ -863,8 +868,12 @@ hscif1: serial@c0714000 {
 				     "renesas,rcar-gen5-hscif", "renesas,hscif";
 			reg = <0 0xc0714000 0 0x60>;
 			interrupts = <GIC_ESPI 15 IRQ_TYPE_LEVEL_HIGH>;
-			clocks = <&dummy_clk_sgasyncd4>, <&dummy_clk_sgasyncd4>, <&scif_clk>;
+			clocks = <&cpg R8A78000_CPG_SGASYNCD4_PERW_BUS>,
+				 <&cpg R8A78000_CPG_SGASYNCD4_PERW_BUS>,
+				 <&scif_clk>;
 			clock-names = "fck", "brg_int", "scif_clk";
+			power-domains = <&mdlc_perw R8A78000_MDLC_PD_APL 0x55>;
+			resets = <&mdlc_perw 0x55>;
 			status = "disabled";
 		};
 
@@ -873,8 +882,12 @@ hscif2: serial@c0718000 {
 				     "renesas,rcar-gen5-hscif", "renesas,hscif";
 			reg = <0 0xc0718000 0 0x60>;
 			interrupts = <GIC_ESPI 16 IRQ_TYPE_LEVEL_HIGH>;
-			clocks = <&dummy_clk_sgasyncd4>, <&dummy_clk_sgasyncd4>, <&scif_clk>;
+			clocks = <&cpg R8A78000_CPG_SGASYNCD4_PERW_BUS>,
+				 <&cpg R8A78000_CPG_SGASYNCD4_PERW_BUS>,
+				 <&scif_clk>;
 			clock-names = "fck", "brg_int", "scif_clk";
+			power-domains = <&mdlc_perw R8A78000_MDLC_PD_APL 0x56>;
+			resets = <&mdlc_perw 0x56>;
 			status = "disabled";
 		};
 
@@ -883,8 +896,12 @@ hscif3: serial@c071c000 {
 				     "renesas,rcar-gen5-hscif", "renesas,hscif";
 			reg = <0 0xc071c000 0 0x60>;
 			interrupts = <GIC_ESPI 17 IRQ_TYPE_LEVEL_HIGH>;
-			clocks = <&dummy_clk_sgasyncd4>, <&dummy_clk_sgasyncd4>, <&scif_clk>;
+			clocks = <&cpg R8A78000_CPG_SGASYNCD4_PERW_BUS>,
+				 <&cpg R8A78000_CPG_SGASYNCD4_PERW_BUS>,
+				 <&scif_clk>;
 			clock-names = "fck", "brg_int", "scif_clk";
+			power-domains = <&mdlc_perw R8A78000_MDLC_PD_APL 0x57>;
+			resets = <&mdlc_perw 0x57>;
 			status = "disabled";
 		};
 
@@ -897,6 +914,239 @@ scp_sram: sram@c1000000 {
 
 			/* scp-sram node must be set per board file */
 		};
+
+		cpg: clock-controller@c1320000 {
+			compatible = "renesas,r8a78000-cpg";
+			reg = <0 0xc1320000 0 0x10000>;
+			clocks = <&extal_clk>, <&extalr_clk>;
+			clock-names = "extal", "extalr";
+			#clock-cells = <1>;
+			bootph-all;
+		};
+
+		mdlc_vipn: system-controller@c3060000 {
+			compatible = "renesas,r8a78000-mdlc";
+			reg = <0 0xc3060000 0 0x1000>;
+			#power-domain-cells = <2>;
+			#reset-cells = <1>;
+			bootph-all;
+		};
+
+		mdlc_vips: system-controller@c3460000 {
+			compatible = "renesas,r8a78000-mdlc";
+			reg = <0 0xc3460000 0 0x1000>;
+			#power-domain-cells = <2>;
+			#reset-cells = <1>;
+			bootph-all;
+		};
+
+		mdlc_vio: system-controller@c5000000 {
+			compatible = "renesas,r8a78000-mdlc";
+			reg = <0 0xc5000000 0 0x1000>;
+			#power-domain-cells = <2>;
+			#reset-cells = <1>;
+			bootph-all;
+		};
+
+		mdlc_pere: system-controller@c08f0000 {
+			compatible = "renesas,r8a78000-mdlc";
+			reg = <0 0xc08f0000 0 0x1000>;
+			#power-domain-cells = <2>;
+			#reset-cells = <1>;
+			bootph-all;
+		};
+
+		mdlc_perw: system-controller@c05d0000 {
+			compatible = "renesas,r8a78000-mdlc";
+			reg = <0 0xc05d0000 0 0x1000>;
+			#power-domain-cells = <2>;
+			#reset-cells = <1>;
+			bootph-all;
+		};
+
+		mdlc_ddr0: system-controller@e8000000 {
+			compatible = "renesas,r8a78000-mdlc";
+			reg = <0 0xe8000000 0 0x1000>;
+			#power-domain-cells = <2>;
+			#reset-cells = <1>;
+			bootph-all;
+		};
+
+		mdlc_ddr1: system-controller@e8080000 {
+			compatible = "renesas,r8a78000-mdlc";
+			reg = <0 0xe8080000 0 0x1000>;
+			#power-domain-cells = <2>;
+			#reset-cells = <1>;
+			bootph-all;
+		};
+
+		mdlc_ddr2: system-controller@e8100000 {
+			compatible = "renesas,r8a78000-mdlc";
+			reg = <0 0xe8100000 0 0x1000>;
+			#power-domain-cells = <2>;
+			#reset-cells = <1>;
+			bootph-all;
+		};
+
+		mdlc_ddr3: system-controller@e8180000 {
+			compatible = "renesas,r8a78000-mdlc";
+			reg = <0 0xe8180000 0 0x1000>;
+			#power-domain-cells = <2>;
+			#reset-cells = <1>;
+			bootph-all;
+		};
+
+		mdlc_ddr4: system-controller@e8200000 {
+			compatible = "renesas,r8a78000-mdlc";
+			reg = <0 0xe8200000 0 0x1000>;
+			#power-domain-cells = <2>;
+			#reset-cells = <1>;
+			bootph-all;
+		};
+
+		mdlc_ddr5: system-controller@e8280000 {
+			compatible = "renesas,r8a78000-mdlc";
+			reg = <0 0xe8280000 0 0x1000>;
+			#power-domain-cells = <2>;
+			#reset-cells = <1>;
+			bootph-all;
+		};
+
+		mdlc_ddr6: system-controller@e8300000 {
+			compatible = "renesas,r8a78000-mdlc";
+			reg = <0 0xe8300000 0 0x1000>;
+			#power-domain-cells = <2>;
+			#reset-cells = <1>;
+			bootph-all;
+		};
+
+		mdlc_ddr7: system-controller@e8380000 {
+			compatible = "renesas,r8a78000-mdlc";
+			reg = <0 0xe8380000 0 0x1000>;
+			#power-domain-cells = <2>;
+			#reset-cells = <1>;
+			bootph-all;
+		};
+
+		mdlc_hscn: system-controller@c9c90000 {
+			compatible = "renesas,r8a78000-mdlc";
+			reg = <0 0xc9c90000 0 0x1000>;
+			#power-domain-cells = <2>;
+			#reset-cells = <1>;
+			bootph-all;
+		};
+
+		mdlc_rt: system-controller@19440000 {
+			compatible = "renesas,r8a78000-mdlc";
+			reg = <0 0x19440000 0 0x1000>;
+			#power-domain-cells = <2>;
+			#reset-cells = <1>;
+			bootph-all;
+		};
+
+		mdlc_top: system-controller@c6480000 {
+			compatible = "renesas,r8a78000-mdlc";
+			reg = <0 0xc6480000 0 0x1000>;
+			#power-domain-cells = <2>;
+			#reset-cells = <1>;
+			bootph-all;
+		};
+
+		mdlc_hscs: system-controller@de200000 {
+			compatible = "renesas,r8a78000-mdlc";
+			reg = <0 0xde200000 0 0x1000>;
+			#power-domain-cells = <2>;
+			#reset-cells = <1>;
+			bootph-all;
+		};
+
+		mdlc_imn: system-controller@c1990000 {
+			compatible = "renesas,r8a78000-mdlc";
+			reg = <0 0xc1990000 0 0x1000>;
+			#power-domain-cells = <2>;
+			#reset-cells = <1>;
+			bootph-all;
+		};
+
+		mdlc_ims: system-controller@c1d90000 {
+			compatible = "renesas,r8a78000-mdlc";
+			reg = <0 0xc1d90000 0 0x1000>;
+			#power-domain-cells = <2>;
+			#reset-cells = <1>;
+			bootph-all;
+		};
+
+		mdlc_gpc: system-controller@cb510000 {
+			compatible = "renesas,r8a78000-mdlc";
+			reg = <0 0xcb510000 0 0x1000>;
+			#power-domain-cells = <2>;
+			#reset-cells = <1>;
+			bootph-all;
+		};
+
+		mdlc_dsp: system-controller@cbe90000 {
+			compatible = "renesas,r8a78000-mdlc";
+			reg = <0 0xcbe90000 0 0x1000>;
+			#power-domain-cells = <2>;
+			#reset-cells = <1>;
+			bootph-all;
+		};
+
+		mdlc_mm: system-controller@e9980000 {
+			compatible = "renesas,r8a78000-mdlc";
+			reg = <0 0xe9980000 0 0x1000>;
+			#power-domain-cells = <2>;
+			#reset-cells = <1>;
+			bootph-all;
+		};
+
+		mdlc_npu0: system-controller@d2c30000 {
+			compatible = "renesas,r8a78000-mdlc";
+			reg = <0 0xd2c30000 0 0x1000>;
+			#power-domain-cells = <2>;
+			#reset-cells = <1>;
+			bootph-all;
+		};
+
+		mdlc_npu1: system-controller@d6c30000 {
+			compatible = "renesas,r8a78000-mdlc";
+			reg = <0 0xd6c30000 0 0x1000>;
+			#power-domain-cells = <2>;
+			#reset-cells = <1>;
+			bootph-all;
+		};
+
+		mdlc_cmnn: system-controller@ca410000 {
+			compatible = "renesas,r8a78000-mdlc";
+			reg = <0 0xca410000 0 0x1000>;
+			#power-domain-cells = <2>;
+			#reset-cells = <1>;
+			bootph-all;
+		};
+
+		mdlc_cmns: system-controller@ca510000 {
+			compatible = "renesas,r8a78000-mdlc";
+			reg = <0 0xca510000 0 0x1000>;
+			#power-domain-cells = <2>;
+			#reset-cells = <1>;
+			bootph-all;
+		};
+
+		mdlc_scp: system-controller@c1330000 {
+			compatible = "renesas,r8a78000-mdlc";
+			reg = <0 0xc1330000 0 0x1000>;
+			#power-domain-cells = <2>;
+			#reset-cells = <1>;
+			bootph-all;
+		};
+
+		mdlc_aon: system-controller@c1338000 {
+			compatible = "renesas,r8a78000-mdlc";
+			reg = <0 0xc1338000 0 0x1000>;
+			#power-domain-cells = <2>;
+			#reset-cells = <1>;
+			bootph-all;
+		};
 	};
 
 	timer {
-- 
2.43.0


