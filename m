Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DC80645C7F4
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 24 Nov 2021 15:49:14 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1357766AbhKXOwW (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 24 Nov 2021 09:52:22 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51560 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1355433AbhKXOwE (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 24 Nov 2021 09:52:04 -0500
Received: from andre.telenet-ops.be (andre.telenet-ops.be [IPv6:2a02:1800:120:4::f00:15])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A4521C052917
        for <linux-renesas-soc@vger.kernel.org>; Wed, 24 Nov 2021 06:39:47 -0800 (PST)
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed20:844e:fa22:e340:cb8c])
        by andre.telenet-ops.be with bizsmtp
        id NEfi2600600MmeS01Efi0u; Wed, 24 Nov 2021 15:39:44 +0100
Received: from rox.of.borg ([192.168.97.57])
        by ramsan.of.borg with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
        (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1mptQz-00Emf0-P7; Wed, 24 Nov 2021 15:39:41 +0100
Received: from geert by rox.of.borg with local (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1mptQz-001PHz-9G; Wed, 24 Nov 2021 15:39:41 +0100
From:   Geert Uytterhoeven <geert+renesas@glider.be>
To:     Magnus Damm <magnus.damm@gmail.com>
Cc:     linux-renesas-soc@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH] arm64: dts: renesas: Fix operating point table node names
Date:   Wed, 24 Nov 2021 15:39:40 +0100
Message-Id: <ac885456ffb00fa4cc4069b9967761df2c98c3d8.1637764588.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Align the node names of device nodes representing operating point v2
tables with the expectations of the DT bindings in
Documentation/devicetree/bindings/opp/opp-v2.yaml.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
To be queued in renesas-devel for v5.17.
---
 arch/arm64/boot/dts/renesas/r8a774a1.dtsi | 4 ++--
 arch/arm64/boot/dts/renesas/r8a774b1.dtsi | 2 +-
 arch/arm64/boot/dts/renesas/r8a774c0.dtsi | 2 +-
 arch/arm64/boot/dts/renesas/r8a774e1.dtsi | 4 ++--
 arch/arm64/boot/dts/renesas/r8a77951.dtsi | 4 ++--
 arch/arm64/boot/dts/renesas/r8a77960.dtsi | 4 ++--
 arch/arm64/boot/dts/renesas/r8a77961.dtsi | 4 ++--
 arch/arm64/boot/dts/renesas/r8a77965.dtsi | 2 +-
 arch/arm64/boot/dts/renesas/r8a77990.dtsi | 2 +-
 9 files changed, 14 insertions(+), 14 deletions(-)

diff --git a/arch/arm64/boot/dts/renesas/r8a774a1.dtsi b/arch/arm64/boot/dts/renesas/r8a774a1.dtsi
index 98963bb96a2ceb56..eda6a840371a8c15 100644
--- a/arch/arm64/boot/dts/renesas/r8a774a1.dtsi
+++ b/arch/arm64/boot/dts/renesas/r8a774a1.dtsi
@@ -58,7 +58,7 @@ can_clk: can {
 		clock-frequency = <0>;
 	};
 
-	cluster0_opp: opp_table0 {
+	cluster0_opp: opp-table-0 {
 		compatible = "operating-points-v2";
 		opp-shared;
 
@@ -80,7 +80,7 @@ opp-1500000000 {
 		};
 	};
 
-	cluster1_opp: opp_table1 {
+	cluster1_opp: opp-table-1 {
 		compatible = "operating-points-v2";
 		opp-shared;
 
diff --git a/arch/arm64/boot/dts/renesas/r8a774b1.dtsi b/arch/arm64/boot/dts/renesas/r8a774b1.dtsi
index dcd65b1e15ab6a07..44f79fbd75dc9e48 100644
--- a/arch/arm64/boot/dts/renesas/r8a774b1.dtsi
+++ b/arch/arm64/boot/dts/renesas/r8a774b1.dtsi
@@ -47,7 +47,7 @@ can_clk: can {
 		clock-frequency = <0>;
 	};
 
-	cluster0_opp: opp_table0 {
+	cluster0_opp: opp-table-0 {
 		compatible = "operating-points-v2";
 		opp-shared;
 
diff --git a/arch/arm64/boot/dts/renesas/r8a774c0.dtsi b/arch/arm64/boot/dts/renesas/r8a774c0.dtsi
index 5e16f6b1771e5c44..b8dcbbbf3db5397f 100644
--- a/arch/arm64/boot/dts/renesas/r8a774c0.dtsi
+++ b/arch/arm64/boot/dts/renesas/r8a774c0.dtsi
@@ -44,7 +44,7 @@ can_clk: can {
 		clock-frequency = <0>;
 	};
 
-	cluster1_opp: opp_table10 {
+	cluster1_opp: opp-table-1 {
 		compatible = "operating-points-v2";
 		opp-shared;
 		opp-800000000 {
diff --git a/arch/arm64/boot/dts/renesas/r8a774e1.dtsi b/arch/arm64/boot/dts/renesas/r8a774e1.dtsi
index 4b1019a0a6cecc0c..e6d8610730a84ab8 100644
--- a/arch/arm64/boot/dts/renesas/r8a774e1.dtsi
+++ b/arch/arm64/boot/dts/renesas/r8a774e1.dtsi
@@ -47,7 +47,7 @@ can_clk: can {
 		clock-frequency = <0>;
 	};
 
-	cluster0_opp: opp_table0 {
+	cluster0_opp: opp-table-0 {
 		compatible = "operating-points-v2";
 		opp-shared;
 
@@ -69,7 +69,7 @@ opp-1500000000 {
 		};
 	};
 
-	cluster1_opp: opp_table1 {
+	cluster1_opp: opp-table-1 {
 		compatible = "operating-points-v2";
 		opp-shared;
 
diff --git a/arch/arm64/boot/dts/renesas/r8a77951.dtsi b/arch/arm64/boot/dts/renesas/r8a77951.dtsi
index 3be403ca4cd94fc2..9265a5702792c3f2 100644
--- a/arch/arm64/boot/dts/renesas/r8a77951.dtsi
+++ b/arch/arm64/boot/dts/renesas/r8a77951.dtsi
@@ -62,7 +62,7 @@ can_clk: can {
 		clock-frequency = <0>;
 	};
 
-	cluster0_opp: opp_table0 {
+	cluster0_opp: opp-table-0 {
 		compatible = "operating-points-v2";
 		opp-shared;
 
@@ -96,7 +96,7 @@ opp-1700000000 {
 		};
 	};
 
-	cluster1_opp: opp_table1 {
+	cluster1_opp: opp-table-1 {
 		compatible = "operating-points-v2";
 		opp-shared;
 
diff --git a/arch/arm64/boot/dts/renesas/r8a77960.dtsi b/arch/arm64/boot/dts/renesas/r8a77960.dtsi
index 616f44aaa55b0bec..26f7103d11da5985 100644
--- a/arch/arm64/boot/dts/renesas/r8a77960.dtsi
+++ b/arch/arm64/boot/dts/renesas/r8a77960.dtsi
@@ -57,7 +57,7 @@ can_clk: can {
 		clock-frequency = <0>;
 	};
 
-	cluster0_opp: opp_table0 {
+	cluster0_opp: opp-table-0 {
 		compatible = "operating-points-v2";
 		opp-shared;
 
@@ -97,7 +97,7 @@ opp-1800000000 {
 		};
 	};
 
-	cluster1_opp: opp_table1 {
+	cluster1_opp: opp-table-1 {
 		compatible = "operating-points-v2";
 		opp-shared;
 
diff --git a/arch/arm64/boot/dts/renesas/r8a77961.dtsi b/arch/arm64/boot/dts/renesas/r8a77961.dtsi
index 724a6a09f4579bf7..ac9b587f6fc513c1 100644
--- a/arch/arm64/boot/dts/renesas/r8a77961.dtsi
+++ b/arch/arm64/boot/dts/renesas/r8a77961.dtsi
@@ -46,7 +46,7 @@ can_clk: can {
 		clock-frequency = <0>;
 	};
 
-	cluster0_opp: opp_table0 {
+	cluster0_opp: opp-table-0 {
 		compatible = "operating-points-v2";
 		opp-shared;
 
@@ -86,7 +86,7 @@ opp-1800000000 {
 		};
 	};
 
-	cluster1_opp: opp_table1 {
+	cluster1_opp: opp-table-1 {
 		compatible = "operating-points-v2";
 		opp-shared;
 
diff --git a/arch/arm64/boot/dts/renesas/r8a77965.dtsi b/arch/arm64/boot/dts/renesas/r8a77965.dtsi
index b625cdd16a92ecc8..f898aad72b9d263c 100644
--- a/arch/arm64/boot/dts/renesas/r8a77965.dtsi
+++ b/arch/arm64/boot/dts/renesas/r8a77965.dtsi
@@ -62,7 +62,7 @@ can_clk: can {
 		clock-frequency = <0>;
 	};
 
-	cluster0_opp: opp_table0 {
+	cluster0_opp: opp-table-0 {
 		compatible = "operating-points-v2";
 		opp-shared;
 
diff --git a/arch/arm64/boot/dts/renesas/r8a77990.dtsi b/arch/arm64/boot/dts/renesas/r8a77990.dtsi
index 29b2a94d5ab6566d..bc0a4f8f20c337e1 100644
--- a/arch/arm64/boot/dts/renesas/r8a77990.dtsi
+++ b/arch/arm64/boot/dts/renesas/r8a77990.dtsi
@@ -55,7 +55,7 @@ can_clk: can {
 		clock-frequency = <0>;
 	};
 
-	cluster1_opp: opp_table10 {
+	cluster1_opp: opp-table-1 {
 		compatible = "operating-points-v2";
 		opp-shared;
 		opp-800000000 {
-- 
2.25.1

