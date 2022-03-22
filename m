Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8C1F04E3BFA
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 22 Mar 2022 10:55:28 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232271AbiCVJ4w (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 22 Mar 2022 05:56:52 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37654 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232053AbiCVJ4v (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 22 Mar 2022 05:56:51 -0400
Received: from mail.zeus03.de (www.zeus03.de [194.117.254.33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3C2346BDD2
        for <linux-renesas-soc@vger.kernel.org>; Tue, 22 Mar 2022 02:55:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple; d=sang-engineering.com; h=
        from:to:cc:subject:date:message-id:in-reply-to:references
        :mime-version:content-transfer-encoding; s=k1; bh=v4TU6n+0IjTs8E
        6rTT022lrYu3Lmvg3F7yMkGKc4Je8=; b=2RkHTD01v2/+AQ1Fm+PzgehyEDZ7DW
        Je0gE08xukT6nni7SpEVfXilsN1Twb9KzOl7wt3JwKMx0T1toKHFHWzhafS5vvzb
        lzbup/QDVuU+PQq8IhdTOxI7jVXdtNyYvwwHoZebhXqgDiYNTGSTM2VG1wpmIMKr
        t4c1HWfRJGsAk=
Received: (qmail 1276064 invoked from network); 22 Mar 2022 10:55:19 +0100
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 22 Mar 2022 10:55:19 +0100
X-UD-Smtp-Session: l3s3148p1@Hy5UnMvaQOsgAQnoAGKBAIBddhzCa5pi
From:   Wolfram Sang <wsa+renesas@sang-engineering.com>
To:     linux-renesas-soc@vger.kernel.org
Cc:     devicetree@vger.kernel.org,
        Wolfram Sang <wsa+renesas@sang-engineering.com>
Subject: [PATCH 1/5] ARM: dts: rcar-gen2: add interrupt property to the watchdog node
Date:   Tue, 22 Mar 2022 10:55:08 +0100
Message-Id: <20220322095512.4707-2-wsa+renesas@sang-engineering.com>
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
 arch/arm/boot/dts/r8a7790.dtsi | 1 +
 arch/arm/boot/dts/r8a7791.dtsi | 1 +
 arch/arm/boot/dts/r8a7792.dtsi | 1 +
 arch/arm/boot/dts/r8a7793.dtsi | 1 +
 arch/arm/boot/dts/r8a7794.dtsi | 1 +
 5 files changed, 5 insertions(+)

diff --git a/arch/arm/boot/dts/r8a7790.dtsi b/arch/arm/boot/dts/r8a7790.dtsi
index ed6dd4fcc503..a640488d513b 100644
--- a/arch/arm/boot/dts/r8a7790.dtsi
+++ b/arch/arm/boot/dts/r8a7790.dtsi
@@ -274,6 +274,7 @@ rwdt: watchdog@e6020000 {
 			compatible = "renesas,r8a7790-wdt",
 				     "renesas,rcar-gen2-wdt";
 			reg = <0 0xe6020000 0 0x0c>;
+			interrupts = <GIC_SPI 140 IRQ_TYPE_LEVEL_HIGH>;
 			clocks = <&cpg CPG_MOD 402>;
 			power-domains = <&sysc R8A7790_PD_ALWAYS_ON>;
 			resets = <&cpg 402>;
diff --git a/arch/arm/boot/dts/r8a7791.dtsi b/arch/arm/boot/dts/r8a7791.dtsi
index 0ccc162d3c2c..542ed0a71872 100644
--- a/arch/arm/boot/dts/r8a7791.dtsi
+++ b/arch/arm/boot/dts/r8a7791.dtsi
@@ -161,6 +161,7 @@ rwdt: watchdog@e6020000 {
 			compatible = "renesas,r8a7791-wdt",
 				     "renesas,rcar-gen2-wdt";
 			reg = <0 0xe6020000 0 0x0c>;
+			interrupts = <GIC_SPI 140 IRQ_TYPE_LEVEL_HIGH>;
 			clocks = <&cpg CPG_MOD 402>;
 			power-domains = <&sysc R8A7791_PD_ALWAYS_ON>;
 			resets = <&cpg 402>;
diff --git a/arch/arm/boot/dts/r8a7792.dtsi b/arch/arm/boot/dts/r8a7792.dtsi
index 9cdb73894ac2..a6d9367f8fa0 100644
--- a/arch/arm/boot/dts/r8a7792.dtsi
+++ b/arch/arm/boot/dts/r8a7792.dtsi
@@ -111,6 +111,7 @@ rwdt: watchdog@e6020000 {
 			compatible = "renesas,r8a7792-wdt",
 				     "renesas,rcar-gen2-wdt";
 			reg = <0 0xe6020000 0 0x0c>;
+			interrupts = <GIC_SPI 140 IRQ_TYPE_LEVEL_HIGH>;
 			clocks = <&cpg CPG_MOD 402>;
 			power-domains = <&sysc R8A7792_PD_ALWAYS_ON>;
 			resets = <&cpg 402>;
diff --git a/arch/arm/boot/dts/r8a7793.dtsi b/arch/arm/boot/dts/r8a7793.dtsi
index dea4b1e108af..9ebe7bfaf0ed 100644
--- a/arch/arm/boot/dts/r8a7793.dtsi
+++ b/arch/arm/boot/dts/r8a7793.dtsi
@@ -146,6 +146,7 @@ rwdt: watchdog@e6020000 {
 			compatible = "renesas,r8a7793-wdt",
 				     "renesas,rcar-gen2-wdt";
 			reg = <0 0xe6020000 0 0x0c>;
+			interrupts = <GIC_SPI 140 IRQ_TYPE_LEVEL_HIGH>;
 			clocks = <&cpg CPG_MOD 402>;
 			power-domains = <&sysc R8A7793_PD_ALWAYS_ON>;
 			resets = <&cpg 402>;
diff --git a/arch/arm/boot/dts/r8a7794.dtsi b/arch/arm/boot/dts/r8a7794.dtsi
index eac9ed8df0be..b601ee6f7580 100644
--- a/arch/arm/boot/dts/r8a7794.dtsi
+++ b/arch/arm/boot/dts/r8a7794.dtsi
@@ -128,6 +128,7 @@ rwdt: watchdog@e6020000 {
 			compatible = "renesas,r8a7794-wdt",
 				     "renesas,rcar-gen2-wdt";
 			reg = <0 0xe6020000 0 0x0c>;
+			interrupts = <GIC_SPI 140 IRQ_TYPE_LEVEL_HIGH>;
 			clocks = <&cpg CPG_MOD 402>;
 			power-domains = <&sysc R8A7794_PD_ALWAYS_ON>;
 			resets = <&cpg 402>;
-- 
2.34.1

