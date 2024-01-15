Return-Path: <linux-renesas-soc+bounces-1565-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 52B8082D800
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 15 Jan 2024 12:03:31 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id ECCA51F21FB6
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 15 Jan 2024 11:03:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EA6781E867;
	Mon, 15 Jan 2024 11:03:21 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from laurent.telenet-ops.be (laurent.telenet-ops.be [195.130.137.89])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B3E5C1FCA
	for <linux-renesas-soc@vger.kernel.org>; Mon, 15 Jan 2024 11:03:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=glider.be
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux-m68k.org
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed40:1376:70aa:e074:32d3])
	by laurent.telenet-ops.be with bizsmtp
	id az3A2B00P34Hgv901z3AbV; Mon, 15 Jan 2024 12:03:11 +0100
Received: from rox.of.borg ([192.168.97.57])
	by ramsan.of.borg with esmtp (Exim 4.95)
	(envelope-from <geert@linux-m68k.org>)
	id 1rPKjZ-00Fdgy-UW;
	Mon, 15 Jan 2024 12:03:10 +0100
Received: from geert by rox.of.borg with local (Exim 4.95)
	(envelope-from <geert@linux-m68k.org>)
	id 1rPKkI-00Bz8p-N9;
	Mon, 15 Jan 2024 12:03:10 +0100
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Magnus Damm <magnus.damm@gmail.com>
Cc: Ulrich Hecht <ulrich.hecht+renesas@gmail.com>,
	linux-renesas-soc@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH 2/3] ARM: dts: renesas: r8a73a4: Add cp clock
Date: Mon, 15 Jan 2024 12:03:04 +0100
Message-Id: <f9826b0755207a1e16871c17daca109fb11f3868.1705315614.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1705315614.git.geert+renesas@glider.be>
References: <cover.1705315614.git.geert+renesas@glider.be>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add the Common Peripheral (CP) clock, which is driven by the main
clock / 2 during normal system operation, but may be driven by EXTALR
during early system boot, when SYSCLK_EN is still low.  As the latter is
irrelevant to Linux, just model it as a fixed clock driven from
main_div2_clk.

Switch all users of main_div2_clk that are documented to be clocked by
the CP clock to cp_clk, to better reflect the actual clock topology.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
 arch/arm/boot/dts/renesas/r8a73a4.dtsi | 12 +++++++++---
 1 file changed, 9 insertions(+), 3 deletions(-)

diff --git a/arch/arm/boot/dts/renesas/r8a73a4.dtsi b/arch/arm/boot/dts/renesas/r8a73a4.dtsi
index b9c20e8ac14f2156..6847acaecc809eaa 100644
--- a/arch/arm/boot/dts/renesas/r8a73a4.dtsi
+++ b/arch/arm/boot/dts/renesas/r8a73a4.dtsi
@@ -727,6 +727,13 @@ main_div2_clk: main_div2 {
 			clock-div = <2>;
 			clock-mult = <1>;
 		};
+		cp_clk: cp {
+			compatible = "fixed-factor-clock";
+			clocks = <&main_div2_clk>;
+			#clock-cells = <0>;
+			clock-div = <1>;
+			clock-mult = <1>;
+		};
 		pll0_div2_clk: pll0_div2 {
 			compatible = "fixed-factor-clock";
 			clocks = <&cpg_clocks R8A73A4_CLK_PLL0>;
@@ -792,9 +799,8 @@ R8A73A4_CLK_CMT1
 		mstp4_clks: mstp4_clks@e6150140 {
 			compatible = "renesas,r8a73a4-mstp-clocks", "renesas,cpg-mstp-clocks";
 			reg = <0 0xe6150140 0 4>, <0 0xe615004c 0 4>;
-			clocks = <&main_div2_clk>, <&cpg_clocks R8A73A4_CLK_ZS>,
-				 <&main_div2_clk>,
-				 <&cpg_clocks R8A73A4_CLK_HP>,
+			clocks = <&cp_clk>, <&cpg_clocks R8A73A4_CLK_ZS>,
+				 <&cp_clk>, <&cpg_clocks R8A73A4_CLK_HP>,
 				 <&cpg_clocks R8A73A4_CLK_HP>;
 			#clock-cells = <1>;
 			clock-indices = <
-- 
2.34.1


