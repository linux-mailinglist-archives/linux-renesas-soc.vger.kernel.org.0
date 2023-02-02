Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 741D1687AE2
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  2 Feb 2023 11:53:24 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232460AbjBBKxV (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 2 Feb 2023 05:53:21 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54456 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231989AbjBBKxU (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 2 Feb 2023 05:53:20 -0500
Received: from laurent.telenet-ops.be (laurent.telenet-ops.be [IPv6:2a02:1800:110:4::f00:19])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 627368AC24
        for <linux-renesas-soc@vger.kernel.org>; Thu,  2 Feb 2023 02:52:49 -0800 (PST)
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed50:f3de:d156:24ca:e691])
        by laurent.telenet-ops.be with bizsmtp
        id GAsk290031R5m7k01AskLa; Thu, 02 Feb 2023 11:52:46 +0100
Received: from rox.of.borg ([192.168.97.57])
        by ramsan.of.borg with esmtp (Exim 4.95)
        (envelope-from <geert@linux-m68k.org>)
        id 1pNXCf-0082pv-G9;
        Thu, 02 Feb 2023 11:52:44 +0100
Received: from geert by rox.of.borg with local (Exim 4.95)
        (envelope-from <geert@linux-m68k.org>)
        id 1pNXCu-001odL-B6;
        Thu, 02 Feb 2023 11:52:44 +0100
From:   Geert Uytterhoeven <geert+renesas@glider.be>
To:     Magnus Damm <magnus.damm@gmail.com>
Cc:     linux-renesas-soc@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH] arm64: dts: renesas: rcar-gen3: Remove bogus "turbo-mode" properties
Date:   Thu,  2 Feb 2023 11:52:41 +0100
Message-Id: <866d06aec09e5a86dba11970f93a728b3e34e9f5.1675335086.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.3 required=5.0 tests=BAYES_00,
        HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_LOW,SPF_HELO_NONE,SPF_NONE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On several R-Car Gen3(e) SoCs, multiple (up to 4) operating points in
the same cluster are marked with the "turbo-mode" property, which is
meant only for operating points beyond "Normal Mode".

Fix this by dropping the property from all operating points but the
"High Performance" one.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
To be queued in renesas-devel for v6.4.
---
 arch/arm64/boot/dts/renesas/r8a77951.dtsi | 1 -
 arch/arm64/boot/dts/renesas/r8a77960.dtsi | 2 --
 arch/arm64/boot/dts/renesas/r8a77961.dtsi | 2 --
 arch/arm64/boot/dts/renesas/r8a77965.dtsi | 2 --
 arch/arm64/boot/dts/renesas/r8a779m1.dtsi | 3 +++
 arch/arm64/boot/dts/renesas/r8a779m3.dtsi | 3 +++
 arch/arm64/boot/dts/renesas/r8a779m5.dtsi | 3 +++
 7 files changed, 9 insertions(+), 7 deletions(-)

diff --git a/arch/arm64/boot/dts/renesas/r8a77951.dtsi b/arch/arm64/boot/dts/renesas/r8a77951.dtsi
index f770d160e9485aad..10b91e9733bf6fa1 100644
--- a/arch/arm64/boot/dts/renesas/r8a77951.dtsi
+++ b/arch/arm64/boot/dts/renesas/r8a77951.dtsi
@@ -75,7 +75,6 @@ opp-1600000000 {
 			opp-hz = /bits/ 64 <1600000000>;
 			opp-microvolt = <900000>;
 			clock-latency-ns = <300000>;
-			turbo-mode;
 		};
 		opp-1700000000 {
 			opp-hz = /bits/ 64 <1700000000>;
diff --git a/arch/arm64/boot/dts/renesas/r8a77960.dtsi b/arch/arm64/boot/dts/renesas/r8a77960.dtsi
index 09c61696f7fb45c4..3ea8572e917f82dd 100644
--- a/arch/arm64/boot/dts/renesas/r8a77960.dtsi
+++ b/arch/arm64/boot/dts/renesas/r8a77960.dtsi
@@ -70,13 +70,11 @@ opp-1600000000 {
 			opp-hz = /bits/ 64 <1600000000>;
 			opp-microvolt = <900000>;
 			clock-latency-ns = <300000>;
-			turbo-mode;
 		};
 		opp-1700000000 {
 			opp-hz = /bits/ 64 <1700000000>;
 			opp-microvolt = <900000>;
 			clock-latency-ns = <300000>;
-			turbo-mode;
 		};
 		opp-1800000000 {
 			opp-hz = /bits/ 64 <1800000000>;
diff --git a/arch/arm64/boot/dts/renesas/r8a77961.dtsi b/arch/arm64/boot/dts/renesas/r8a77961.dtsi
index 59a18dfcb8cc342b..d52cb0b67d80c6fb 100644
--- a/arch/arm64/boot/dts/renesas/r8a77961.dtsi
+++ b/arch/arm64/boot/dts/renesas/r8a77961.dtsi
@@ -70,13 +70,11 @@ opp-1600000000 {
 			opp-hz = /bits/ 64 <1600000000>;
 			opp-microvolt = <900000>;
 			clock-latency-ns = <300000>;
-			turbo-mode;
 		};
 		opp-1700000000 {
 			opp-hz = /bits/ 64 <1700000000>;
 			opp-microvolt = <900000>;
 			clock-latency-ns = <300000>;
-			turbo-mode;
 		};
 		opp-1800000000 {
 			opp-hz = /bits/ 64 <1800000000>;
diff --git a/arch/arm64/boot/dts/renesas/r8a77965.dtsi b/arch/arm64/boot/dts/renesas/r8a77965.dtsi
index 9b4f7ad95ca84ee2..9584115c6b17769b 100644
--- a/arch/arm64/boot/dts/renesas/r8a77965.dtsi
+++ b/arch/arm64/boot/dts/renesas/r8a77965.dtsi
@@ -75,13 +75,11 @@ opp-1600000000 {
 			opp-hz = /bits/ 64 <1600000000>;
 			opp-microvolt = <900000>;
 			clock-latency-ns = <300000>;
-			turbo-mode;
 		};
 		opp-1700000000 {
 			opp-hz = /bits/ 64 <1700000000>;
 			opp-microvolt = <900000>;
 			clock-latency-ns = <300000>;
-			turbo-mode;
 		};
 		opp-1800000000 {
 			opp-hz = /bits/ 64 <1800000000>;
diff --git a/arch/arm64/boot/dts/renesas/r8a779m1.dtsi b/arch/arm64/boot/dts/renesas/r8a779m1.dtsi
index b6e855f52adf99b5..1064a87a0c77771e 100644
--- a/arch/arm64/boot/dts/renesas/r8a779m1.dtsi
+++ b/arch/arm64/boot/dts/renesas/r8a779m1.dtsi
@@ -12,6 +12,9 @@ / {
 };
 
 &cluster0_opp {
+	opp-1700000000 {
+		/delete-property/ turbo-mode;
+	};
 	opp-2000000000 {
 		opp-hz = /bits/ 64 <2000000000>;
 		opp-microvolt = <960000>;
diff --git a/arch/arm64/boot/dts/renesas/r8a779m3.dtsi b/arch/arm64/boot/dts/renesas/r8a779m3.dtsi
index 6cff38a6d20b47ea..7fdbdd97ed4bb926 100644
--- a/arch/arm64/boot/dts/renesas/r8a779m3.dtsi
+++ b/arch/arm64/boot/dts/renesas/r8a779m3.dtsi
@@ -12,6 +12,9 @@ / {
 };
 
 &cluster0_opp {
+	opp-1800000000 {
+		/delete-property/ turbo-mode;
+	};
 	opp-2000000000 {
 		opp-hz = /bits/ 64 <2000000000>;
 		opp-microvolt = <960000>;
diff --git a/arch/arm64/boot/dts/renesas/r8a779m5.dtsi b/arch/arm64/boot/dts/renesas/r8a779m5.dtsi
index 8c9c0557fe77ed7d..df51e0ff5986a1ae 100644
--- a/arch/arm64/boot/dts/renesas/r8a779m5.dtsi
+++ b/arch/arm64/boot/dts/renesas/r8a779m5.dtsi
@@ -12,6 +12,9 @@ / {
 };
 
 &cluster0_opp {
+	opp-1800000000 {
+		/delete-property/ turbo-mode;
+	};
 	opp-2000000000 {
 		opp-hz = /bits/ 64 <2000000000>;
 		opp-microvolt = <960000>;
-- 
2.34.1

