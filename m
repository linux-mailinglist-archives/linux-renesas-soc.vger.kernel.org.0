Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 85FFB52309D
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 11 May 2022 12:25:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235216AbiEKKZI (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 11 May 2022 06:25:08 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46268 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230392AbiEKKZG (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 11 May 2022 06:25:06 -0400
Received: from baptiste.telenet-ops.be (baptiste.telenet-ops.be [IPv6:2a02:1800:120:4::f00:13])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CAF86419A9
        for <linux-renesas-soc@vger.kernel.org>; Wed, 11 May 2022 03:25:03 -0700 (PDT)
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed40:c9c1:6ba7:bb0d:8433])
        by baptiste.telenet-ops.be with bizsmtp
        id VNR1270051sk9zo01NR1h4; Wed, 11 May 2022 12:25:01 +0200
Received: from rox.of.borg ([192.168.97.57])
        by ramsan.of.borg with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
        (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1nojWe-003ihb-JW; Wed, 11 May 2022 12:25:00 +0200
Received: from geert by rox.of.borg with local (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1nojWe-004ebw-1x; Wed, 11 May 2022 12:25:00 +0200
From:   Geert Uytterhoeven <geert+renesas@glider.be>
To:     Magnus Damm <magnus.damm@gmail.com>
Cc:     Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        linux-renesas-soc@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH] arm64: dts: renesas: Rename numbered regulators
Date:   Wed, 11 May 2022 12:24:59 +0200
Message-Id: <b90dfeb834c4d7dabd22bf03396f33df58f54507.1652264651.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.4 required=5.0 tests=BAYES_00,
        HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_LOW,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Numbered regulators are prone to conflicts, causing silent overwrites
(see e.g. [1]).

Make conflicts less likely to happen by renaming all numbered regulators
to names reflecting the regulator's purposes.

[1] commit 45f5d5a9e34d3fe4 ("arm64: dts: renesas: r8a77995: draak: Fix
    backlight regulator name").

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
To be queued in renesas-devel for v5.20.

 arch/arm64/boot/dts/renesas/beacon-renesom-som.dtsi | 4 ++--
 arch/arm64/boot/dts/renesas/ebisu.dtsi              | 6 +++---
 arch/arm64/boot/dts/renesas/hihope-common.dtsi      | 4 ++--
 arch/arm64/boot/dts/renesas/rzg2l-smarc-som.dtsi    | 4 ++--
 arch/arm64/boot/dts/renesas/rzg2lc-smarc-som.dtsi   | 4 ++--
 arch/arm64/boot/dts/renesas/rzg2ul-smarc-som.dtsi   | 4 ++--
 arch/arm64/boot/dts/renesas/salvator-common.dtsi    | 6 +++---
 arch/arm64/boot/dts/renesas/ulcb.dtsi               | 4 ++--
 8 files changed, 18 insertions(+), 18 deletions(-)

diff --git a/arch/arm64/boot/dts/renesas/beacon-renesom-som.dtsi b/arch/arm64/boot/dts/renesas/beacon-renesom-som.dtsi
index 877d076ffcc9bf92..f5c1d74b738b9344 100644
--- a/arch/arm64/boot/dts/renesas/beacon-renesom-som.dtsi
+++ b/arch/arm64/boot/dts/renesas/beacon-renesom-som.dtsi
@@ -20,7 +20,7 @@ osc_32k: osc_32k {
 		clock-output-names = "osc_32k";
 	};
 
-	reg_1p8v: regulator0 {
+	reg_1p8v: regulator-1p8v {
 		compatible = "regulator-fixed";
 		regulator-name = "fixed-1.8V";
 		regulator-min-microvolt = <1800000>;
@@ -29,7 +29,7 @@ reg_1p8v: regulator0 {
 		regulator-always-on;
 	};
 
-	reg_3p3v: regulator1 {
+	reg_3p3v: regulator-3p3v {
 		compatible = "regulator-fixed";
 		regulator-name = "fixed-3.3V";
 		regulator-min-microvolt = <3300000>;
diff --git a/arch/arm64/boot/dts/renesas/ebisu.dtsi b/arch/arm64/boot/dts/renesas/ebisu.dtsi
index 72f359efa23e78d8..9c311906fdaf395f 100644
--- a/arch/arm64/boot/dts/renesas/ebisu.dtsi
+++ b/arch/arm64/boot/dts/renesas/ebisu.dtsi
@@ -145,7 +145,7 @@ memory@48000000 {
 		reg = <0x0 0x48000000 0x0 0x38000000>;
 	};
 
-	reg_1p8v: regulator0 {
+	reg_1p8v: regulator-1p8v {
 		compatible = "regulator-fixed";
 		regulator-name = "fixed-1.8V";
 		regulator-min-microvolt = <1800000>;
@@ -154,7 +154,7 @@ reg_1p8v: regulator0 {
 		regulator-always-on;
 	};
 
-	reg_3p3v: regulator1 {
+	reg_3p3v: regulator-3p3v {
 		compatible = "regulator-fixed";
 		regulator-name = "fixed-3.3V";
 		regulator-min-microvolt = <3300000>;
@@ -163,7 +163,7 @@ reg_3p3v: regulator1 {
 		regulator-always-on;
 	};
 
-	reg_12p0v: regulator2 {
+	reg_12p0v: regulator-12p0v {
 		compatible = "regulator-fixed";
 		regulator-name = "D12.0V";
 		regulator-min-microvolt = <12000000>;
diff --git a/arch/arm64/boot/dts/renesas/hihope-common.dtsi b/arch/arm64/boot/dts/renesas/hihope-common.dtsi
index 935d06515aa6130b..b062f41ee270124b 100644
--- a/arch/arm64/boot/dts/renesas/hihope-common.dtsi
+++ b/arch/arm64/boot/dts/renesas/hihope-common.dtsi
@@ -53,7 +53,7 @@ led4 {
 		};
 	};
 
-	reg_1p8v: regulator0 {
+	reg_1p8v: regulator-1p8v {
 		compatible = "regulator-fixed";
 		regulator-name = "fixed-1.8V";
 		regulator-min-microvolt = <1800000>;
@@ -62,7 +62,7 @@ reg_1p8v: regulator0 {
 		regulator-always-on;
 	};
 
-	reg_3p3v: regulator1 {
+	reg_3p3v: regulator-3p3v {
 		compatible = "regulator-fixed";
 		regulator-name = "fixed-3.3V";
 		regulator-min-microvolt = <3300000>;
diff --git a/arch/arm64/boot/dts/renesas/rzg2l-smarc-som.dtsi b/arch/arm64/boot/dts/renesas/rzg2l-smarc-som.dtsi
index aeacd22e9eb019a3..9410796c8ad6b72d 100644
--- a/arch/arm64/boot/dts/renesas/rzg2l-smarc-som.dtsi
+++ b/arch/arm64/boot/dts/renesas/rzg2l-smarc-som.dtsi
@@ -34,7 +34,7 @@ memory@48000000 {
 		reg = <0x0 0x48000000 0x0 0x78000000>;
 	};
 
-	reg_1p8v: regulator0 {
+	reg_1p8v: regulator-1p8v {
 		compatible = "regulator-fixed";
 		regulator-name = "fixed-1.8V";
 		regulator-min-microvolt = <1800000>;
@@ -43,7 +43,7 @@ reg_1p8v: regulator0 {
 		regulator-always-on;
 	};
 
-	reg_3p3v: regulator1 {
+	reg_3p3v: regulator-3p3v {
 		compatible = "regulator-fixed";
 		regulator-name = "fixed-3.3V";
 		regulator-min-microvolt = <3300000>;
diff --git a/arch/arm64/boot/dts/renesas/rzg2lc-smarc-som.dtsi b/arch/arm64/boot/dts/renesas/rzg2lc-smarc-som.dtsi
index 959a0ad1d3671063..78e6e2376b015ab8 100644
--- a/arch/arm64/boot/dts/renesas/rzg2lc-smarc-som.dtsi
+++ b/arch/arm64/boot/dts/renesas/rzg2lc-smarc-som.dtsi
@@ -23,7 +23,7 @@ memory@48000000 {
 		reg = <0x0 0x48000000 0x0 0x38000000>;
 	};
 
-	reg_1p8v: regulator0 {
+	reg_1p8v: regulator-1p8v {
 		compatible = "regulator-fixed";
 		regulator-name = "fixed-1.8V";
 		regulator-min-microvolt = <1800000>;
@@ -32,7 +32,7 @@ reg_1p8v: regulator0 {
 		regulator-always-on;
 	};
 
-	reg_3p3v: regulator1 {
+	reg_3p3v: regulator-3p3v {
 		compatible = "regulator-fixed";
 		regulator-name = "fixed-3.3V";
 		regulator-min-microvolt = <3300000>;
diff --git a/arch/arm64/boot/dts/renesas/rzg2ul-smarc-som.dtsi b/arch/arm64/boot/dts/renesas/rzg2ul-smarc-som.dtsi
index a663115f5aae616a..429bdde579c3f052 100644
--- a/arch/arm64/boot/dts/renesas/rzg2ul-smarc-som.dtsi
+++ b/arch/arm64/boot/dts/renesas/rzg2ul-smarc-som.dtsi
@@ -24,7 +24,7 @@ memory@48000000 {
 		reg = <0x0 0x48000000 0x0 0x38000000>;
 	};
 
-	reg_1p8v: regulator0 {
+	reg_1p8v: regulator-1p8v {
 		compatible = "regulator-fixed";
 		regulator-name = "fixed-1.8V";
 		regulator-min-microvolt = <1800000>;
@@ -33,7 +33,7 @@ reg_1p8v: regulator0 {
 		regulator-always-on;
 	};
 
-	reg_3p3v: regulator1 {
+	reg_3p3v: regulator-3p3v {
 		compatible = "regulator-fixed";
 		regulator-name = "fixed-3.3V";
 		regulator-min-microvolt = <3300000>;
diff --git a/arch/arm64/boot/dts/renesas/salvator-common.dtsi b/arch/arm64/boot/dts/renesas/salvator-common.dtsi
index 7efdf5c80b8ba2d6..5d7f67a1ad1d71b5 100644
--- a/arch/arm64/boot/dts/renesas/salvator-common.dtsi
+++ b/arch/arm64/boot/dts/renesas/salvator-common.dtsi
@@ -176,7 +176,7 @@ key-wakeup {
 		};
 	};
 
-	reg_1p8v: regulator0 {
+	reg_1p8v: regulator-1p8v {
 		compatible = "regulator-fixed";
 		regulator-name = "fixed-1.8V";
 		regulator-min-microvolt = <1800000>;
@@ -185,7 +185,7 @@ reg_1p8v: regulator0 {
 		regulator-always-on;
 	};
 
-	reg_3p3v: regulator1 {
+	reg_3p3v: regulator-3p3v {
 		compatible = "regulator-fixed";
 		regulator-name = "fixed-3.3V";
 		regulator-min-microvolt = <3300000>;
@@ -194,7 +194,7 @@ reg_3p3v: regulator1 {
 		regulator-always-on;
 	};
 
-	reg_12v: regulator2 {
+	reg_12v: regulator-12v {
 		compatible = "regulator-fixed";
 		regulator-name = "fixed-12V";
 		regulator-min-microvolt = <12000000>;
diff --git a/arch/arm64/boot/dts/renesas/ulcb.dtsi b/arch/arm64/boot/dts/renesas/ulcb.dtsi
index 90a4c0629d240fdb..d5f0f75b249b4681 100644
--- a/arch/arm64/boot/dts/renesas/ulcb.dtsi
+++ b/arch/arm64/boot/dts/renesas/ulcb.dtsi
@@ -76,7 +76,7 @@ led6 {
 		};
 	};
 
-	reg_1p8v: regulator0 {
+	reg_1p8v: regulator-1p8v {
 		compatible = "regulator-fixed";
 		regulator-name = "fixed-1.8V";
 		regulator-min-microvolt = <1800000>;
@@ -85,7 +85,7 @@ reg_1p8v: regulator0 {
 		regulator-always-on;
 	};
 
-	reg_3p3v: regulator1 {
+	reg_3p3v: regulator-3p3v {
 		compatible = "regulator-fixed";
 		regulator-name = "fixed-3.3V";
 		regulator-min-microvolt = <3300000>;
-- 
2.25.1

