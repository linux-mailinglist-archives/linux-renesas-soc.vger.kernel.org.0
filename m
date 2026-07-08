Return-Path: <linux-renesas-soc+bounces-34857-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id BOD9LzUlTmopEAIAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-34857-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 08 Jul 2026 12:23:49 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 60D177243D2
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 08 Jul 2026 12:23:49 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=none;
	dmarc=none;
	spf=pass (mail.lfdr.de: domain of "linux-renesas-soc+bounces-34857-lists+linux-renesas-soc=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-renesas-soc+bounces-34857-lists+linux-renesas-soc=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 192D63137FC7
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  8 Jul 2026 10:16:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CD70E39B49C;
	Wed,  8 Jul 2026 10:15:44 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 72EBB39A05C;
	Wed,  8 Jul 2026 10:15:43 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783505744; cv=none; b=Jxz1VbSEO6Q5yrlLlaLK6s3nysKgpNmQpep9j9KHtYdUrgJV/sa4DTMhZFKxxE/c+y8Sj6TOeGYb4KRvvSXuMRYZhMe/bBPdaEdoIybRyXcOMWF7RzvIP/jiEEk7gVDOkpYzw+4x0q1K5bqR9UR6VwxA0xQ8Pp18IX8MnR2qtas=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783505744; c=relaxed/simple;
	bh=lAgoIw5M85m3vwfGh3ElGRa4k7a1Fv0Q2YZHBqgV6lE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=k0aI93UpwRnOzk0PsQF4GdVtbTJFoL2BE6y3qlpzN0WVZgO7n9IXGE024q7MUvGcyLZwmK3SnSP0WE3UOmtarcV9Vt6ysRsdjtaL/+VfQAm1Jt6F4bM/ZCMnhKm2OXtPxB5ri2lFVJJRHWrU8s3Zj9YSC/7Ygy/47VebImSH0qY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E8BC41F00A3A;
	Wed,  8 Jul 2026 10:15:39 +0000 (UTC)
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Brian Masney <bmasney@redhat.com>,
	Ulf Hansson <ulfh@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Marek Vasut <marek.vasut+renesas@mailbox.org>,
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc: devicetree@vger.kernel.org,
	linux-clk@vger.kernel.org,
	linux-pm@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH v2 6/6] arm64: dts: renesas: r8a78000: Add MDLC nodes
Date: Wed,  8 Jul 2026 12:15:11 +0200
Message-ID: <dca2c4940ba38b897f04b6fb67591de9835900e1.1783505142.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1783505142.git.geert+renesas@glider.be>
References: <cover.1783505142.git.geert+renesas@glider.be>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Action: no action
X-Spamd-Result: default: False [0.54 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	DMARC_NA(0.00)[glider.be];
	TAGGED_FROM(0.00)[bounces-34857-lists,linux-renesas-soc=lfdr.de,renesas];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER(0.00)[geert@glider.be,linux-renesas-soc@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[18];
	FORGED_RECIPIENTS(0.00)[m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:mturquette@baylibre.com,m:sboyd@kernel.org,m:bmasney@redhat.com,m:ulfh@kernel.org,m:p.zabel@pengutronix.de,m:wsa+renesas@sang-engineering.com,m:marek.vasut+renesas@mailbox.org,m:kuninori.morimoto.gx@renesas.com,m:devicetree@vger.kernel.org,m:linux-clk@vger.kernel.org,m:linux-pm@vger.kernel.org,m:linux-renesas-soc@vger.kernel.org,m:linux-arm-kernel@lists.infradead.org,m:linux-kernel@vger.kernel.org,m:geert+renesas@glider.be,m:krzk@kernel.org,m:conor@kernel.org,m:wsa@sang-engineering.com,m:marek.vasut@mailbox.org,m:geert@glider.be,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[geert@glider.be,linux-renesas-soc@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	R_DKIM_NA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-renesas-soc,dt,renesas];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,vger.kernel.org:from_smtp,glider.be:from_mime,glider.be:email,glider.be:mid]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 60D177243D2

Add device nodes for the Module Control (MDLC) blocks on the R-Car X5H
(R8A78000) SoC.

Complete hardware desciption of all (H)SCIF serial ports, by linking
them to an MDLC for power domains and resets.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
v2:
  - Split in separate CPG and MDLC patches.
---
 arch/arm64/boot/dts/renesas/r8a78000.dtsi | 241 ++++++++++++++++++++++
 1 file changed, 241 insertions(+)

diff --git a/arch/arm64/boot/dts/renesas/r8a78000.dtsi b/arch/arm64/boot/dts/renesas/r8a78000.dtsi
index 1fe078c7822c01a5..c256d7cf22872bbc 100644
--- a/arch/arm64/boot/dts/renesas/r8a78000.dtsi
+++ b/arch/arm64/boot/dts/renesas/r8a78000.dtsi
@@ -6,6 +6,7 @@
  */
 
 #include <dt-bindings/clock/renesas,r8a78000-cpg.h>
+#include <dt-bindings/power/renesas,r8a78000-mdlc.h>
 #include <dt-bindings/interrupt-controller/arm-gic.h>
 
 / {
@@ -870,6 +871,8 @@ scif0: serial@c0700000 {
 				 <&cpg R8A78000_CPG_SGASYNCD4_PERW_BUS>,
 				 <&scif_clk>;
 			clock-names = "fck", "brg_int", "scif_clk";
+			power-domains = <&mdlc_perw R8A78000_MDLC_PD_APL 0x40>;
+			resets = <&mdlc_perw 0x40>;
 			status = "disabled";
 		};
 
@@ -882,6 +885,8 @@ scif1: serial@c0704000 {
 				 <&cpg R8A78000_CPG_SGASYNCD4_PERW_BUS>,
 				 <&scif_clk>;
 			clock-names = "fck", "brg_int", "scif_clk";
+			power-domains = <&mdlc_perw R8A78000_MDLC_PD_APL 0x41>;
+			resets = <&mdlc_perw 0x41>;
 			status = "disabled";
 		};
 
@@ -894,6 +899,8 @@ scif3: serial@c0708000 {
 				 <&cpg R8A78000_CPG_SGASYNCD4_PERW_BUS>,
 				 <&scif_clk>;
 			clock-names = "fck", "brg_int", "scif_clk";
+			power-domains = <&mdlc_perw R8A78000_MDLC_PD_APL 0x42>;
+			resets = <&mdlc_perw 0x42>;
 			status = "disabled";
 		};
 
@@ -906,6 +913,8 @@ scif4: serial@c070c000 {
 				 <&cpg R8A78000_CPG_SGASYNCD4_PERW_BUS>,
 				 <&scif_clk>;
 			clock-names = "fck", "brg_int", "scif_clk";
+			power-domains = <&mdlc_perw R8A78000_MDLC_PD_APL 0x43>;
+			resets = <&mdlc_perw 0x43>;
 			status = "disabled";
 		};
 
@@ -918,6 +927,8 @@ hscif0: serial@c0710000 {
 				 <&cpg R8A78000_CPG_SGASYNCD4_PERW_BUS>,
 				 <&scif_clk>;
 			clock-names = "fck", "brg_int", "scif_clk";
+			power-domains = <&mdlc_perw R8A78000_MDLC_PD_APL 0x54>;
+			resets = <&mdlc_perw 0x54>;
 			status = "disabled";
 		};
 
@@ -930,6 +941,8 @@ hscif1: serial@c0714000 {
 				 <&cpg R8A78000_CPG_SGASYNCD4_PERW_BUS>,
 				 <&scif_clk>;
 			clock-names = "fck", "brg_int", "scif_clk";
+			power-domains = <&mdlc_perw R8A78000_MDLC_PD_APL 0x55>;
+			resets = <&mdlc_perw 0x55>;
 			status = "disabled";
 		};
 
@@ -942,6 +955,8 @@ hscif2: serial@c0718000 {
 				 <&cpg R8A78000_CPG_SGASYNCD4_PERW_BUS>,
 				 <&scif_clk>;
 			clock-names = "fck", "brg_int", "scif_clk";
+			power-domains = <&mdlc_perw R8A78000_MDLC_PD_APL 0x56>;
+			resets = <&mdlc_perw 0x56>;
 			status = "disabled";
 		};
 
@@ -954,6 +969,8 @@ hscif3: serial@c071c000 {
 				 <&cpg R8A78000_CPG_SGASYNCD4_PERW_BUS>,
 				 <&scif_clk>;
 			clock-names = "fck", "brg_int", "scif_clk";
+			power-domains = <&mdlc_perw R8A78000_MDLC_PD_APL 0x57>;
+			resets = <&mdlc_perw 0x57>;
 			status = "disabled";
 		};
 
@@ -974,6 +991,230 @@ cpg: clock-controller@c1320000 {
 			#clock-cells = <1>;
 			bootph-all;
 		};
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


