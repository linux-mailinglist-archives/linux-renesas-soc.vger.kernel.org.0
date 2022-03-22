Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A7BB74E3BFD
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 22 Mar 2022 10:55:29 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232214AbiCVJ4y (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 22 Mar 2022 05:56:54 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37788 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232210AbiCVJ4v (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 22 Mar 2022 05:56:51 -0400
Received: from mail.zeus03.de (www.zeus03.de [194.117.254.33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 570786BDD5
        for <linux-renesas-soc@vger.kernel.org>; Tue, 22 Mar 2022 02:55:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple; d=sang-engineering.com; h=
        from:to:cc:subject:date:message-id:in-reply-to:references
        :mime-version:content-transfer-encoding; s=k1; bh=jPsVI5nbxnVsRM
        n4xV6Vn9h8fmD3g9MyygC+3bWcQ4o=; b=NCT21sTOGcUk+yd6cV+yO/j2a1c0xe
        VmtscrNdb20Vp3oAO9DejM4unB/4dMX7dkYAZjXWhpFL7IT/Uqs6QbvonIt/VGCI
        4wDfkkeJFmaKLXOuBod9LGrrTJQ76MuqcBas6av9V2f9APuBK6W/tlqvTGkxdbVQ
        geEqPVwZHyCrw=
Received: (qmail 1276093 invoked from network); 22 Mar 2022 10:55:20 +0100
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 22 Mar 2022 10:55:20 +0100
X-UD-Smtp-Session: l3s3148p1@ERBhnMvaQusgAQnoAGKBAIBddhzCa5pi
From:   Wolfram Sang <wsa+renesas@sang-engineering.com>
To:     linux-renesas-soc@vger.kernel.org
Cc:     devicetree@vger.kernel.org,
        Wolfram Sang <wsa+renesas@sang-engineering.com>
Subject: [PATCH 2/5] ARM: dts: rzg1: add interrupt property to the watchdog node
Date:   Tue, 22 Mar 2022 10:55:09 +0100
Message-Id: <20220322095512.4707-3-wsa+renesas@sang-engineering.com>
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
 arch/arm/boot/dts/r8a7743.dtsi  | 1 +
 arch/arm/boot/dts/r8a7744.dtsi  | 1 +
 arch/arm/boot/dts/r8a7745.dtsi  | 1 +
 arch/arm/boot/dts/r8a77470.dtsi | 1 +
 4 files changed, 4 insertions(+)

diff --git a/arch/arm/boot/dts/r8a7743.dtsi b/arch/arm/boot/dts/r8a7743.dtsi
index 3502b5dcc04f..c0c145a5fe8d 100644
--- a/arch/arm/boot/dts/r8a7743.dtsi
+++ b/arch/arm/boot/dts/r8a7743.dtsi
@@ -140,6 +140,7 @@ rwdt: watchdog@e6020000 {
 			compatible = "renesas,r8a7743-wdt",
 				     "renesas,rcar-gen2-wdt";
 			reg = <0 0xe6020000 0 0x0c>;
+			interrupts = <GIC_SPI 140 IRQ_TYPE_LEVEL_HIGH>;
 			clocks = <&cpg CPG_MOD 402>;
 			power-domains = <&sysc R8A7743_PD_ALWAYS_ON>;
 			resets = <&cpg 402>;
diff --git a/arch/arm/boot/dts/r8a7744.dtsi b/arch/arm/boot/dts/r8a7744.dtsi
index f5d4b8b85b6d..3f4fb53dd6df 100644
--- a/arch/arm/boot/dts/r8a7744.dtsi
+++ b/arch/arm/boot/dts/r8a7744.dtsi
@@ -140,6 +140,7 @@ rwdt: watchdog@e6020000 {
 			compatible = "renesas,r8a7744-wdt",
 				     "renesas,rcar-gen2-wdt";
 			reg = <0 0xe6020000 0 0x0c>;
+			interrupts = <GIC_SPI 140 IRQ_TYPE_LEVEL_HIGH>;
 			clocks = <&cpg CPG_MOD 402>;
 			power-domains = <&sysc R8A7744_PD_ALWAYS_ON>;
 			resets = <&cpg 402>;
diff --git a/arch/arm/boot/dts/r8a7745.dtsi b/arch/arm/boot/dts/r8a7745.dtsi
index f877c51f769c..fe8e98a66d93 100644
--- a/arch/arm/boot/dts/r8a7745.dtsi
+++ b/arch/arm/boot/dts/r8a7745.dtsi
@@ -270,6 +270,7 @@ rst: reset-controller@e6160000 {
 		rwdt: watchdog@e6020000 {
 			compatible = "renesas,r8a7745-wdt",
 				     "renesas,rcar-gen2-wdt";
+			interrupts = <GIC_SPI 140 IRQ_TYPE_LEVEL_HIGH>;
 			reg = <0 0xe6020000 0 0x0c>;
 			clocks = <&cpg CPG_MOD 402>;
 			power-domains = <&sysc R8A7745_PD_ALWAYS_ON>;
diff --git a/arch/arm/boot/dts/r8a77470.dtsi b/arch/arm/boot/dts/r8a77470.dtsi
index 13ef1e9bf4d5..c90f2a270214 100644
--- a/arch/arm/boot/dts/r8a77470.dtsi
+++ b/arch/arm/boot/dts/r8a77470.dtsi
@@ -91,6 +91,7 @@ rwdt: watchdog@e6020000 {
 			compatible = "renesas,r8a77470-wdt",
 				     "renesas,rcar-gen2-wdt";
 			reg = <0 0xe6020000 0 0x0c>;
+			interrupts = <GIC_SPI 140 IRQ_TYPE_LEVEL_HIGH>;
 			clocks = <&cpg CPG_MOD 402>;
 			power-domains = <&sysc R8A77470_PD_ALWAYS_ON>;
 			resets = <&cpg 402>;
-- 
2.34.1

