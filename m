Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7AAA836EAA3
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 29 Apr 2021 14:39:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233011AbhD2MkF (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 29 Apr 2021 08:40:05 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44100 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232657AbhD2MkF (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 29 Apr 2021 08:40:05 -0400
Received: from albert.telenet-ops.be (albert.telenet-ops.be [IPv6:2a02:1800:110:4::f00:1a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7679AC06138B
        for <linux-renesas-soc@vger.kernel.org>; Thu, 29 Apr 2021 05:39:18 -0700 (PDT)
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed20:d4dd:70b4:3264:8d97])
        by albert.telenet-ops.be with bizsmtp
        id ycfE2400Q4p6Y3806cfEhq; Thu, 29 Apr 2021 14:39:15 +0200
Received: from rox.of.borg ([192.168.97.57])
        by ramsan.of.borg with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
        (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1lc5wo-001F5N-9j; Thu, 29 Apr 2021 14:39:14 +0200
Received: from geert by rox.of.borg with local (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1lc5wn-009VUP-Rb; Thu, 29 Apr 2021 14:39:13 +0200
From:   Geert Uytterhoeven <geert+renesas@glider.be>
To:     Magnus Damm <magnus.damm@gmail.com>
Cc:     linux-renesas-soc@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH] arm64: dts: renesas: r8a7796[01]: Fix OPP table entry voltages
Date:   Thu, 29 Apr 2021 14:39:12 +0200
Message-Id: <b9e9db907514790574429b83d070c823b36085ef.1619699909.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Correct the voltages in the "Power Optimized" (<= 1.5 GHz) Cortex-A57
operating point table entries for the R-Car M3-W and M3-W+ SoCs from
0.82V to 0.83V, as per the R-Car Gen3 EC Manual Errata for Revision
0.53.

Based on a patch for R-Car M3-W in the BSP by Takeshi Kihara
<takeshi.kihara.df@renesas.com>.

Fixes: da7e3113344fda50 ("arm64: dts: renesas: r8a7796: Add OPPs table for cpu devices")
Fixes: f51746ad7d1ff6b4 ("arm64: dts: renesas: Add Renesas R8A77961 SoC support")
Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
To be queued in renesas-devel for v5.14.

 arch/arm64/boot/dts/renesas/r8a77960.dtsi | 6 +++---
 arch/arm64/boot/dts/renesas/r8a77961.dtsi | 6 +++---
 2 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/arch/arm64/boot/dts/renesas/r8a77960.dtsi b/arch/arm64/boot/dts/renesas/r8a77960.dtsi
index 63bb395a6a64499a..2bd8169735d351b2 100644
--- a/arch/arm64/boot/dts/renesas/r8a77960.dtsi
+++ b/arch/arm64/boot/dts/renesas/r8a77960.dtsi
@@ -63,17 +63,17 @@ cluster0_opp: opp_table0 {
 
 		opp-500000000 {
 			opp-hz = /bits/ 64 <500000000>;
-			opp-microvolt = <820000>;
+			opp-microvolt = <830000>;
 			clock-latency-ns = <300000>;
 		};
 		opp-1000000000 {
 			opp-hz = /bits/ 64 <1000000000>;
-			opp-microvolt = <820000>;
+			opp-microvolt = <830000>;
 			clock-latency-ns = <300000>;
 		};
 		opp-1500000000 {
 			opp-hz = /bits/ 64 <1500000000>;
-			opp-microvolt = <820000>;
+			opp-microvolt = <830000>;
 			clock-latency-ns = <300000>;
 			opp-suspend;
 		};
diff --git a/arch/arm64/boot/dts/renesas/r8a77961.dtsi b/arch/arm64/boot/dts/renesas/r8a77961.dtsi
index c8b73108a4c8185d..3c73ee47791542a9 100644
--- a/arch/arm64/boot/dts/renesas/r8a77961.dtsi
+++ b/arch/arm64/boot/dts/renesas/r8a77961.dtsi
@@ -52,17 +52,17 @@ cluster0_opp: opp_table0 {
 
 		opp-500000000 {
 			opp-hz = /bits/ 64 <500000000>;
-			opp-microvolt = <820000>;
+			opp-microvolt = <830000>;
 			clock-latency-ns = <300000>;
 		};
 		opp-1000000000 {
 			opp-hz = /bits/ 64 <1000000000>;
-			opp-microvolt = <820000>;
+			opp-microvolt = <830000>;
 			clock-latency-ns = <300000>;
 		};
 		opp-1500000000 {
 			opp-hz = /bits/ 64 <1500000000>;
-			opp-microvolt = <820000>;
+			opp-microvolt = <830000>;
 			clock-latency-ns = <300000>;
 			opp-suspend;
 		};
-- 
2.25.1

