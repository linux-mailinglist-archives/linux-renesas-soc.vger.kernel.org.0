Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5E86830FA97
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  4 Feb 2021 19:06:20 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238838AbhBDSDL (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 4 Feb 2021 13:03:11 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43660 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238824AbhBDSDE (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 4 Feb 2021 13:03:04 -0500
Received: from andre.telenet-ops.be (andre.telenet-ops.be [IPv6:2a02:1800:120:4::f00:15])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BE53AC0613D6
        for <linux-renesas-soc@vger.kernel.org>; Thu,  4 Feb 2021 10:02:18 -0800 (PST)
Received: from ramsan.of.borg ([84.195.186.194])
        by andre.telenet-ops.be with bizsmtp
        id R62G2400D4C55Sk0162GjV; Thu, 04 Feb 2021 19:02:16 +0100
Received: from rox.of.borg ([192.168.97.57])
        by ramsan.of.borg with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
        (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1l7im7-003Fgj-A9; Thu, 04 Feb 2021 18:50:39 +0100
Received: from geert by rox.of.borg with local (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1l7eK2-006uUj-4v; Thu, 04 Feb 2021 14:05:22 +0100
From:   Geert Uytterhoeven <geert+renesas@glider.be>
To:     Magnus Damm <magnus.damm@gmail.com>
Cc:     linux-renesas-soc@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH 1/5] ARM: dts: renesas: Group tuples in APMU cpus properties
Date:   Thu,  4 Feb 2021 14:05:13 +0100
Message-Id: <20210204130517.1647073-2-geert+renesas@glider.be>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210204130517.1647073-1-geert+renesas@glider.be>
References: <20210204130517.1647073-1-geert+renesas@glider.be>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

To improve human readability and enable automatic validation, the tuples
in "cpus" properties in device nodes for Advanced Power Management Units
for AP-System Core (APMU) should be grouped using angle brackets.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
 arch/arm/boot/dts/r8a7742.dtsi  | 4 ++--
 arch/arm/boot/dts/r8a7743.dtsi  | 2 +-
 arch/arm/boot/dts/r8a7744.dtsi  | 2 +-
 arch/arm/boot/dts/r8a7745.dtsi  | 2 +-
 arch/arm/boot/dts/r8a77470.dtsi | 2 +-
 arch/arm/boot/dts/r8a7790.dtsi  | 4 ++--
 arch/arm/boot/dts/r8a7791.dtsi  | 2 +-
 arch/arm/boot/dts/r8a7792.dtsi  | 2 +-
 arch/arm/boot/dts/r8a7793.dtsi  | 2 +-
 arch/arm/boot/dts/r8a7794.dtsi  | 2 +-
 10 files changed, 12 insertions(+), 12 deletions(-)

diff --git a/arch/arm/boot/dts/r8a7742.dtsi b/arch/arm/boot/dts/r8a7742.dtsi
index 6a78c813057b610f..dd1b976d2a6c81c7 100644
--- a/arch/arm/boot/dts/r8a7742.dtsi
+++ b/arch/arm/boot/dts/r8a7742.dtsi
@@ -367,13 +367,13 @@ cpg: clock-controller@e6150000 {
 		apmu@e6151000 {
 			compatible = "renesas,r8a7742-apmu", "renesas,apmu";
 			reg = <0 0xe6151000 0 0x188>;
-			cpus = <&cpu4 &cpu5 &cpu6 &cpu7>;
+			cpus = <&cpu4>, <&cpu5>, <&cpu6>, <&cpu7>;
 		};
 
 		apmu@e6152000 {
 			compatible = "renesas,r8a7742-apmu", "renesas,apmu";
 			reg = <0 0xe6152000 0 0x188>;
-			cpus = <&cpu0 &cpu1 &cpu2 &cpu3>;
+			cpus = <&cpu0>, <&cpu1>, <&cpu2>, <&cpu3>;
 		};
 
 		rst: reset-controller@e6160000 {
diff --git a/arch/arm/boot/dts/r8a7743.dtsi b/arch/arm/boot/dts/r8a7743.dtsi
index f444e418f4085a26..6e37b8da278b9170 100644
--- a/arch/arm/boot/dts/r8a7743.dtsi
+++ b/arch/arm/boot/dts/r8a7743.dtsi
@@ -293,7 +293,7 @@ cpg: clock-controller@e6150000 {
 		apmu@e6152000 {
 			compatible = "renesas,r8a7743-apmu", "renesas,apmu";
 			reg = <0 0xe6152000 0 0x188>;
-			cpus = <&cpu0 &cpu1>;
+			cpus = <&cpu0>, <&cpu1>;
 		};
 
 		rst: reset-controller@e6160000 {
diff --git a/arch/arm/boot/dts/r8a7744.dtsi b/arch/arm/boot/dts/r8a7744.dtsi
index 0442aad4f9dba024..ace20861c0c496cb 100644
--- a/arch/arm/boot/dts/r8a7744.dtsi
+++ b/arch/arm/boot/dts/r8a7744.dtsi
@@ -293,7 +293,7 @@ cpg: clock-controller@e6150000 {
 		apmu@e6152000 {
 			compatible = "renesas,r8a7744-apmu", "renesas,apmu";
 			reg = <0 0xe6152000 0 0x188>;
-			cpus = <&cpu0 &cpu1>;
+			cpus = <&cpu0>, <&cpu1>;
 		};
 
 		rst: reset-controller@e6160000 {
diff --git a/arch/arm/boot/dts/r8a7745.dtsi b/arch/arm/boot/dts/r8a7745.dtsi
index 0f14ac22921de7d4..be33bdabe45281e8 100644
--- a/arch/arm/boot/dts/r8a7745.dtsi
+++ b/arch/arm/boot/dts/r8a7745.dtsi
@@ -258,7 +258,7 @@ cpg: clock-controller@e6150000 {
 		apmu@e6151000 {
 			compatible = "renesas,r8a7745-apmu", "renesas,apmu";
 			reg = <0 0xe6151000 0 0x188>;
-			cpus = <&cpu0 &cpu1>;
+			cpus = <&cpu0>, <&cpu1>;
 		};
 
 		rst: reset-controller@e6160000 {
diff --git a/arch/arm/boot/dts/r8a77470.dtsi b/arch/arm/boot/dts/r8a77470.dtsi
index 691b1a131c870df3..a1d7f6e7a2e34bff 100644
--- a/arch/arm/boot/dts/r8a77470.dtsi
+++ b/arch/arm/boot/dts/r8a77470.dtsi
@@ -205,7 +205,7 @@ cpg: clock-controller@e6150000 {
 		apmu@e6151000 {
 			compatible = "renesas,r8a77470-apmu", "renesas,apmu";
 			reg = <0 0xe6151000 0 0x188>;
-			cpus = <&cpu0 &cpu1>;
+			cpus = <&cpu0>, <&cpu1>;
 		};
 
 		rst: reset-controller@e6160000 {
diff --git a/arch/arm/boot/dts/r8a7790.dtsi b/arch/arm/boot/dts/r8a7790.dtsi
index b0569b4ea5c8ae96..de29394eed63605e 100644
--- a/arch/arm/boot/dts/r8a7790.dtsi
+++ b/arch/arm/boot/dts/r8a7790.dtsi
@@ -381,13 +381,13 @@ cpg: clock-controller@e6150000 {
 		apmu@e6151000 {
 			compatible = "renesas,r8a7790-apmu", "renesas,apmu";
 			reg = <0 0xe6151000 0 0x188>;
-			cpus = <&cpu4 &cpu5 &cpu6 &cpu7>;
+			cpus = <&cpu4>, <&cpu5>, <&cpu6>, <&cpu7>;
 		};
 
 		apmu@e6152000 {
 			compatible = "renesas,r8a7790-apmu", "renesas,apmu";
 			reg = <0 0xe6152000 0 0x188>;
-			cpus = <&cpu0 &cpu1 &cpu2 &cpu3>;
+			cpus = <&cpu0>, <&cpu1>, <&cpu2>, <&cpu3>;
 		};
 
 		rst: reset-controller@e6160000 {
diff --git a/arch/arm/boot/dts/r8a7791.dtsi b/arch/arm/boot/dts/r8a7791.dtsi
index 6590b91cbcc70dc3..34aacc5386c3fea0 100644
--- a/arch/arm/boot/dts/r8a7791.dtsi
+++ b/arch/arm/boot/dts/r8a7791.dtsi
@@ -316,7 +316,7 @@ cpg: clock-controller@e6150000 {
 		apmu@e6152000 {
 			compatible = "renesas,r8a7791-apmu", "renesas,apmu";
 			reg = <0 0xe6152000 0 0x188>;
-			cpus = <&cpu0 &cpu1>;
+			cpus = <&cpu0>, <&cpu1>;
 		};
 
 		rst: reset-controller@e6160000 {
diff --git a/arch/arm/boot/dts/r8a7792.dtsi b/arch/arm/boot/dts/r8a7792.dtsi
index f5b299bfcb23796c..253e8bf643d1821d 100644
--- a/arch/arm/boot/dts/r8a7792.dtsi
+++ b/arch/arm/boot/dts/r8a7792.dtsi
@@ -314,7 +314,7 @@ cpg: clock-controller@e6150000 {
 		apmu@e6152000 {
 			compatible = "renesas,r8a7792-apmu", "renesas,apmu";
 			reg = <0 0xe6152000 0 0x188>;
-			cpus = <&cpu0 &cpu1>;
+			cpus = <&cpu0>, <&cpu1>;
 		};
 
 		rst: reset-controller@e6160000 {
diff --git a/arch/arm/boot/dts/r8a7793.dtsi b/arch/arm/boot/dts/r8a7793.dtsi
index f930f69f7bcce43a..6d74475030edfeb6 100644
--- a/arch/arm/boot/dts/r8a7793.dtsi
+++ b/arch/arm/boot/dts/r8a7793.dtsi
@@ -290,7 +290,7 @@ cpg: clock-controller@e6150000 {
 		apmu@e6152000 {
 			compatible = "renesas,r8a7793-apmu", "renesas,apmu";
 			reg = <0 0xe6152000 0 0x188>;
-			cpus = <&cpu0 &cpu1>;
+			cpus = <&cpu0>, <&cpu1>;
 		};
 
 		rst: reset-controller@e6160000 {
diff --git a/arch/arm/boot/dts/r8a7794.dtsi b/arch/arm/boot/dts/r8a7794.dtsi
index cd5e2904068abd69..330dc516ecd15150 100644
--- a/arch/arm/boot/dts/r8a7794.dtsi
+++ b/arch/arm/boot/dts/r8a7794.dtsi
@@ -256,7 +256,7 @@ cpg: clock-controller@e6150000 {
 		apmu@e6151000 {
 			compatible = "renesas,r8a7794-apmu", "renesas,apmu";
 			reg = <0 0xe6151000 0 0x188>;
-			cpus = <&cpu0 &cpu1>;
+			cpus = <&cpu0>, <&cpu1>;
 		};
 
 		rst: reset-controller@e6160000 {
-- 
2.25.1

