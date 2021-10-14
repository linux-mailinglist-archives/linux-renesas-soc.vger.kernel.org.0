Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B97F642D52C
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 14 Oct 2021 10:36:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230051AbhJNIiS (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 14 Oct 2021 04:38:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43562 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230078AbhJNIiS (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 14 Oct 2021 04:38:18 -0400
Received: from xavier.telenet-ops.be (xavier.telenet-ops.be [IPv6:2a02:1800:120:4::f00:14])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 89CCDC061570
        for <linux-renesas-soc@vger.kernel.org>; Thu, 14 Oct 2021 01:36:13 -0700 (PDT)
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed20:ad48:4534:27c0:db4b])
        by xavier.telenet-ops.be with bizsmtp
        id 5kc92600X0SQF6f01kc9nR; Thu, 14 Oct 2021 10:36:10 +0200
Received: from rox.of.borg ([192.168.97.57])
        by ramsan.of.borg with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
        (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1mawDh-004lmr-FP; Thu, 14 Oct 2021 10:36:09 +0200
Received: from geert by rox.of.borg with local (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1mawDg-003TLs-LI; Thu, 14 Oct 2021 10:36:08 +0200
From:   Geert Uytterhoeven <geert+renesas@glider.be>
To:     Magnus Damm <magnus.damm@gmail.com>
Cc:     linux-renesas-soc@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH v2] arm64: dts: renesas: rcar-gen3e: Add Cortex-A57 2 GHz opps
Date:   Thu, 14 Oct 2021 10:36:07 +0200
Message-Id: <08a0f27f50b8ad4a78c05186190bebcfb364fe8f.1634200489.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Add operating points for running the Cortex-A57 CPU cores on R-Car
H3e-2G, M3e-2G, and M3Ne-2G at 2 GHz.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
v2:
  - Merge 3 patches,
  - Change 2 GHz opps from 1.02V to 0.96V.
    According to the R-Car Series, 3rd Generation-e Hardware User's
    Manual Rev.0.80, the performance mode on R-Car Gen3e-2G SoCs is 2
    GHz, compared to 1.7 on R-Car H3 and 1.8 GHz on R-Car M3-W+ and
    M3-N, but the typical core supply voltages are unchanged.
---
To be queued in renesas-devel for v5.16.

 arch/arm64/boot/dts/renesas/r8a779m1.dtsi | 9 +++++++++
 arch/arm64/boot/dts/renesas/r8a779m3.dtsi | 9 +++++++++
 arch/arm64/boot/dts/renesas/r8a779m5.dtsi | 9 +++++++++
 3 files changed, 27 insertions(+)

diff --git a/arch/arm64/boot/dts/renesas/r8a779m1.dtsi b/arch/arm64/boot/dts/renesas/r8a779m1.dtsi
index 0e9b04469b83c661..b6e855f52adf99b5 100644
--- a/arch/arm64/boot/dts/renesas/r8a779m1.dtsi
+++ b/arch/arm64/boot/dts/renesas/r8a779m1.dtsi
@@ -10,3 +10,12 @@
 / {
 	compatible = "renesas,r8a779m1", "renesas,r8a7795";
 };
+
+&cluster0_opp {
+	opp-2000000000 {
+		opp-hz = /bits/ 64 <2000000000>;
+		opp-microvolt = <960000>;
+		clock-latency-ns = <300000>;
+		turbo-mode;
+	};
+};
diff --git a/arch/arm64/boot/dts/renesas/r8a779m3.dtsi b/arch/arm64/boot/dts/renesas/r8a779m3.dtsi
index 65bb6188ccf5470a..6cff38a6d20b47ea 100644
--- a/arch/arm64/boot/dts/renesas/r8a779m3.dtsi
+++ b/arch/arm64/boot/dts/renesas/r8a779m3.dtsi
@@ -10,3 +10,12 @@
 / {
 	compatible = "renesas,r8a779m3", "renesas,r8a77961";
 };
+
+&cluster0_opp {
+	opp-2000000000 {
+		opp-hz = /bits/ 64 <2000000000>;
+		opp-microvolt = <960000>;
+		clock-latency-ns = <300000>;
+		turbo-mode;
+	};
+};
diff --git a/arch/arm64/boot/dts/renesas/r8a779m5.dtsi b/arch/arm64/boot/dts/renesas/r8a779m5.dtsi
index f0ef765f6cf87319..8c9c0557fe77ed7d 100644
--- a/arch/arm64/boot/dts/renesas/r8a779m5.dtsi
+++ b/arch/arm64/boot/dts/renesas/r8a779m5.dtsi
@@ -10,3 +10,12 @@
 / {
 	compatible = "renesas,r8a779m5", "renesas,r8a77965";
 };
+
+&cluster0_opp {
+	opp-2000000000 {
+		opp-hz = /bits/ 64 <2000000000>;
+		opp-microvolt = <960000>;
+		clock-latency-ns = <300000>;
+		turbo-mode;
+	};
+};
-- 
2.25.1

