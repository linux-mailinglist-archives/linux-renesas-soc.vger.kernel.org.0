Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9CE8017E573
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  9 Mar 2020 18:12:04 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727198AbgCIRME (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 9 Mar 2020 13:12:04 -0400
Received: from baptiste.telenet-ops.be ([195.130.132.51]:49422 "EHLO
        baptiste.telenet-ops.be" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727101AbgCIRME (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 9 Mar 2020 13:12:04 -0400
Received: from ramsan ([84.195.182.253])
        by baptiste.telenet-ops.be with bizsmtp
        id CHC1220045USYZQ01HC10z; Mon, 09 Mar 2020 18:12:01 +0100
Received: from rox.of.borg ([192.168.97.57])
        by ramsan with esmtp (Exim 4.90_1)
        (envelope-from <geert@linux-m68k.org>)
        id 1jBLwf-0007LE-4G; Mon, 09 Mar 2020 18:12:01 +0100
Received: from geert by rox.of.borg with local (Exim 4.90_1)
        (envelope-from <geert@linux-m68k.org>)
        id 1jBLwf-0005X5-2i; Mon, 09 Mar 2020 18:12:01 +0100
From:   Geert Uytterhoeven <geert+renesas@glider.be>
To:     Magnus Damm <magnus.damm@gmail.com>
Cc:     Ulrich Hecht <uli+renesas@fpond.eu>,
        linux-renesas-soc@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        Takeshi Kihara <takeshi.kihara.df@renesas.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH] arm64: dts: renesas: r8a77990: Add CPUIdle support for CA53 cores
Date:   Mon,  9 Mar 2020 18:12:00 +0100
Message-Id: <20200309171200.21226-1-geert+renesas@glider.be>
X-Mailer: git-send-email 2.17.1
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

From: Takeshi Kihara <takeshi.kihara.df@renesas.com>

Enable cpuidle (core shutdown) support for the CA53 cores on R-Car E3.

Signed-off-by: Takeshi Kihara <takeshi.kihara.df@renesas.com>
Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
To be queued in renesas-devel for v5.7.

 arch/arm64/boot/dts/renesas/r8a77990.dtsi | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/arch/arm64/boot/dts/renesas/r8a77990.dtsi b/arch/arm64/boot/dts/renesas/r8a77990.dtsi
index 0ad20b78e6eb62fd..1543f18e834f4bea 100644
--- a/arch/arm64/boot/dts/renesas/r8a77990.dtsi
+++ b/arch/arm64/boot/dts/renesas/r8a77990.dtsi
@@ -88,6 +88,7 @@
 			power-domains = <&sysc R8A77990_PD_CA53_CPU0>;
 			next-level-cache = <&L2_CA53>;
 			enable-method = "psci";
+			cpu-idle-states = <&CPU_SLEEP_0>;
 			dynamic-power-coefficient = <277>;
 			clocks =<&cpg CPG_CORE R8A77990_CLK_Z2>;
 			operating-points-v2 = <&cluster1_opp>;
@@ -100,6 +101,7 @@
 			power-domains = <&sysc R8A77990_PD_CA53_CPU1>;
 			next-level-cache = <&L2_CA53>;
 			enable-method = "psci";
+			cpu-idle-states = <&CPU_SLEEP_0>;
 			clocks =<&cpg CPG_CORE R8A77990_CLK_Z2>;
 			operating-points-v2 = <&cluster1_opp>;
 		};
@@ -110,6 +112,19 @@
 			cache-unified;
 			cache-level = <2>;
 		};
+
+		idle-states {
+			entry-method = "psci";
+
+			CPU_SLEEP_0: cpu-sleep-0 {
+				compatible = "arm,idle-state";
+				arm,psci-suspend-param = <0x0010000>;
+				local-timer-stop;
+				entry-latency-us = <700>;
+				exit-latency-us = <700>;
+				min-residency-us = <5000>;
+			};
+		};
 	};
 
 	extal_clk: extal {
-- 
2.17.1

