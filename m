Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6E7264E3BFF
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 22 Mar 2022 10:55:30 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232165AbiCVJ4x (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 22 Mar 2022 05:56:53 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37790 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232214AbiCVJ4v (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 22 Mar 2022 05:56:51 -0400
Received: from mail.zeus03.de (www.zeus03.de [194.117.254.33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1E6756F497
        for <linux-renesas-soc@vger.kernel.org>; Tue, 22 Mar 2022 02:55:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple; d=sang-engineering.com; h=
        from:to:cc:subject:date:message-id:in-reply-to:references
        :mime-version:content-transfer-encoding; s=k1; bh=QQmOx57mY17P9j
        b3MBLI6DJhfV/MXZh4p6v3SRHmyHw=; b=MhDvWlN+dLlwADWavUgp2NyOgC5lY3
        Ruec7xnoYN2hrcC4IYZ+ppnk/UM23FlUm2lXETfSvFKAMsOnnvne9N3vEcb4Ko4Y
        q38pRH9ZqRaTFnWayv7KqF8MtYaNCaThPEeYVo5r9Z1jGwEoG0QvOPVVyRxQ1//e
        jTuGFyaFom/A0=
Received: (qmail 1276120 invoked from network); 22 Mar 2022 10:55:21 +0100
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 22 Mar 2022 10:55:21 +0100
X-UD-Smtp-Session: l3s3148p1@h29pnMvaROsgAQnoAGKBAIBddhzCa5pi
From:   Wolfram Sang <wsa+renesas@sang-engineering.com>
To:     linux-renesas-soc@vger.kernel.org
Cc:     devicetree@vger.kernel.org,
        Wolfram Sang <wsa+renesas@sang-engineering.com>
Subject: [PATCH 3/5] arm64: dts: renesas: rcar-gen3: add interrupt property to the watchdog node
Date:   Tue, 22 Mar 2022 10:55:10 +0100
Message-Id: <20220322095512.4707-4-wsa+renesas@sang-engineering.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220322095512.4707-1-wsa+renesas@sang-engineering.com>
References: <20220322095512.4707-1-wsa+renesas@sang-engineering.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-1.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FORGED_SPF_HELO,
        RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_PASS,SPF_NONE,
        T_SCC_BODY_TEXT_LINE autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Driver doesn't use it yet, but let's describe the HW properly.

Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
---
 arch/arm64/boot/dts/renesas/r8a77951.dtsi | 1 +
 arch/arm64/boot/dts/renesas/r8a77960.dtsi | 1 +
 arch/arm64/boot/dts/renesas/r8a77961.dtsi | 1 +
 arch/arm64/boot/dts/renesas/r8a77965.dtsi | 1 +
 arch/arm64/boot/dts/renesas/r8a77970.dtsi | 1 +
 arch/arm64/boot/dts/renesas/r8a77980.dtsi | 1 +
 arch/arm64/boot/dts/renesas/r8a77990.dtsi | 1 +
 arch/arm64/boot/dts/renesas/r8a77995.dtsi | 1 +
 8 files changed, 8 insertions(+)

diff --git a/arch/arm64/boot/dts/renesas/r8a77951.dtsi b/arch/arm64/boot/dts/renesas/r8a77951.dtsi
index 4e87e8776a2b..742834fa7097 100644
--- a/arch/arm64/boot/dts/renesas/r8a77951.dtsi
+++ b/arch/arm64/boot/dts/renesas/r8a77951.dtsi
@@ -369,6 +369,7 @@ soc: soc {
 		rwdt: watchdog@e6020000 {
 			compatible = "renesas,r8a7795-wdt", "renesas,rcar-gen3-wdt";
 			reg = <0 0xe6020000 0 0x0c>;
+			interrupts = <GIC_SPI 140 IRQ_TYPE_LEVEL_HIGH>;
 			clocks = <&cpg CPG_MOD 402>;
 			power-domains = <&sysc R8A7795_PD_ALWAYS_ON>;
 			resets = <&cpg 402>;
diff --git a/arch/arm64/boot/dts/renesas/r8a77960.dtsi b/arch/arm64/boot/dts/renesas/r8a77960.dtsi
index 6f79da8cc8c0..0f2635af7b58 100644
--- a/arch/arm64/boot/dts/renesas/r8a77960.dtsi
+++ b/arch/arm64/boot/dts/renesas/r8a77960.dtsi
@@ -334,6 +334,7 @@ rwdt: watchdog@e6020000 {
 			compatible = "renesas,r8a7796-wdt",
 				     "renesas,rcar-gen3-wdt";
 			reg = <0 0xe6020000 0 0x0c>;
+			interrupts = <GIC_SPI 140 IRQ_TYPE_LEVEL_HIGH>;
 			clocks = <&cpg CPG_MOD 402>;
 			power-domains = <&sysc R8A7796_PD_ALWAYS_ON>;
 			resets = <&cpg 402>;
diff --git a/arch/arm64/boot/dts/renesas/r8a77961.dtsi b/arch/arm64/boot/dts/renesas/r8a77961.dtsi
index 68cbbb322acf..a2d9959799e8 100644
--- a/arch/arm64/boot/dts/renesas/r8a77961.dtsi
+++ b/arch/arm64/boot/dts/renesas/r8a77961.dtsi
@@ -323,6 +323,7 @@ rwdt: watchdog@e6020000 {
 			compatible = "renesas,r8a77961-wdt",
 				     "renesas,rcar-gen3-wdt";
 			reg = <0 0xe6020000 0 0x0c>;
+			interrupts = <GIC_SPI 140 IRQ_TYPE_LEVEL_HIGH>;
 			clocks = <&cpg CPG_MOD 402>;
 			power-domains = <&sysc R8A77961_PD_ALWAYS_ON>;
 			resets = <&cpg 402>;
diff --git a/arch/arm64/boot/dts/renesas/r8a77965.dtsi b/arch/arm64/boot/dts/renesas/r8a77965.dtsi
index 9f858af8b762..bba07944228b 100644
--- a/arch/arm64/boot/dts/renesas/r8a77965.dtsi
+++ b/arch/arm64/boot/dts/renesas/r8a77965.dtsi
@@ -205,6 +205,7 @@ rwdt: watchdog@e6020000 {
 			compatible = "renesas,r8a77965-wdt",
 				     "renesas,rcar-gen3-wdt";
 			reg = <0 0xe6020000 0 0x0c>;
+			interrupts = <GIC_SPI 140 IRQ_TYPE_LEVEL_HIGH>;
 			clocks = <&cpg CPG_MOD 402>;
 			power-domains = <&sysc R8A77965_PD_ALWAYS_ON>;
 			resets = <&cpg 402>;
diff --git a/arch/arm64/boot/dts/renesas/r8a77970.dtsi b/arch/arm64/boot/dts/renesas/r8a77970.dtsi
index 517892cf6294..79718234d85f 100644
--- a/arch/arm64/boot/dts/renesas/r8a77970.dtsi
+++ b/arch/arm64/boot/dts/renesas/r8a77970.dtsi
@@ -108,6 +108,7 @@ rwdt: watchdog@e6020000 {
 			compatible = "renesas,r8a77970-wdt",
 				     "renesas,rcar-gen3-wdt";
 			reg = <0 0xe6020000 0 0x0c>;
+			interrupts = <GIC_SPI 140 IRQ_TYPE_LEVEL_HIGH>;
 			clocks = <&cpg CPG_MOD 402>;
 			power-domains = <&sysc R8A77970_PD_ALWAYS_ON>;
 			resets = <&cpg 402>;
diff --git a/arch/arm64/boot/dts/renesas/r8a77980.dtsi b/arch/arm64/boot/dts/renesas/r8a77980.dtsi
index 347c068ff2c5..148983130adf 100644
--- a/arch/arm64/boot/dts/renesas/r8a77980.dtsi
+++ b/arch/arm64/boot/dts/renesas/r8a77980.dtsi
@@ -138,6 +138,7 @@ rwdt: watchdog@e6020000 {
 			compatible = "renesas,r8a77980-wdt",
 				     "renesas,rcar-gen3-wdt";
 			reg = <0 0xe6020000 0 0x0c>;
+			interrupts = <GIC_SPI 140 IRQ_TYPE_LEVEL_HIGH>;
 			clocks = <&cpg CPG_MOD 402>;
 			power-domains = <&sysc R8A77980_PD_ALWAYS_ON>;
 			resets = <&cpg 402>;
diff --git a/arch/arm64/boot/dts/renesas/r8a77990.dtsi b/arch/arm64/boot/dts/renesas/r8a77990.dtsi
index 7e0f1aab2135..af61c67b093d 100644
--- a/arch/arm64/boot/dts/renesas/r8a77990.dtsi
+++ b/arch/arm64/boot/dts/renesas/r8a77990.dtsi
@@ -171,6 +171,7 @@ rwdt: watchdog@e6020000 {
 			compatible = "renesas,r8a77990-wdt",
 				     "renesas,rcar-gen3-wdt";
 			reg = <0 0xe6020000 0 0x0c>;
+			interrupts = <GIC_SPI 140 IRQ_TYPE_LEVEL_HIGH>;
 			clocks = <&cpg CPG_MOD 402>;
 			power-domains = <&sysc R8A77990_PD_ALWAYS_ON>;
 			resets = <&cpg 402>;
diff --git a/arch/arm64/boot/dts/renesas/r8a77995.dtsi b/arch/arm64/boot/dts/renesas/r8a77995.dtsi
index cac1f9467ffa..00254cf0aa92 100644
--- a/arch/arm64/boot/dts/renesas/r8a77995.dtsi
+++ b/arch/arm64/boot/dts/renesas/r8a77995.dtsi
@@ -94,6 +94,7 @@ rwdt: watchdog@e6020000 {
 			compatible = "renesas,r8a77995-wdt",
 				     "renesas,rcar-gen3-wdt";
 			reg = <0 0xe6020000 0 0x0c>;
+			interrupts = <GIC_SPI 140 IRQ_TYPE_LEVEL_HIGH>;
 			clocks = <&cpg CPG_MOD 402>;
 			power-domains = <&sysc R8A77995_PD_ALWAYS_ON>;
 			resets = <&cpg 402>;
-- 
2.34.1

