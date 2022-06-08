Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id F3FD15437A3
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  8 Jun 2022 17:40:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S244140AbiFHPkf (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 8 Jun 2022 11:40:35 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60614 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S244517AbiFHPkc (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 8 Jun 2022 11:40:32 -0400
Received: from baptiste.telenet-ops.be (baptiste.telenet-ops.be [IPv6:2a02:1800:120:4::f00:13])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6E1FA1CC5E6
        for <linux-renesas-soc@vger.kernel.org>; Wed,  8 Jun 2022 08:40:26 -0700 (PDT)
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed30:243a:e14b:d107:1f56])
        by baptiste.telenet-ops.be with bizsmtp
        id gfgR270041qF9lr01fgRRD; Wed, 08 Jun 2022 17:40:25 +0200
Received: from rox.of.borg ([192.168.97.57])
        by ramsan.of.borg with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
        (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1nyxnE-003E0D-Jf; Wed, 08 Jun 2022 17:40:24 +0200
Received: from geert by rox.of.borg with local (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1nyxnE-008kJh-6g; Wed, 08 Jun 2022 17:40:24 +0200
From:   Geert Uytterhoeven <geert+renesas@glider.be>
To:     Magnus Damm <magnus.damm@gmail.com>,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Cc:     linux-renesas-soc@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        Tho Vu <tho.vu.wh@renesas.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH 3/4] arm64: dts: renesas: r8a779f0: Add CPUIdle support
Date:   Wed,  8 Jun 2022 17:40:21 +0200
Message-Id: <5310792ce4c06515a5373ff44ceb9b925f007489.1654701480.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1654701480.git.geert+renesas@glider.be>
References: <cover.1654701480.git.geert+renesas@glider.be>
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

From: Tho Vu <tho.vu.wh@renesas.com>

Support CPUIdle for ARM Cortex-A55 on R-Car S4-8.

Signed-off-by: Tho Vu <tho.vu.wh@renesas.com>
Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
 arch/arm64/boot/dts/renesas/r8a779f0.dtsi | 21 +++++++++++++++++++++
 1 file changed, 21 insertions(+)

diff --git a/arch/arm64/boot/dts/renesas/r8a779f0.dtsi b/arch/arm64/boot/dts/renesas/r8a779f0.dtsi
index 197e452c8623dffb..bcee482803e888cc 100644
--- a/arch/arm64/boot/dts/renesas/r8a779f0.dtsi
+++ b/arch/arm64/boot/dts/renesas/r8a779f0.dtsi
@@ -63,6 +63,7 @@ a55_0: cpu@0 {
 			power-domains = <&sysc R8A779F0_PD_A1E0D0C0>;
 			next-level-cache = <&L3_CA55_0>;
 			enable-method = "psci";
+			cpu-idle-states = <&CPU_SLEEP_0>;
 		};
 
 		a55_1: cpu@100 {
@@ -72,6 +73,7 @@ a55_1: cpu@100 {
 			power-domains = <&sysc R8A779F0_PD_A1E0D0C1>;
 			next-level-cache = <&L3_CA55_0>;
 			enable-method = "psci";
+			cpu-idle-states = <&CPU_SLEEP_0>;
 		};
 
 		a55_2: cpu@10000 {
@@ -81,6 +83,7 @@ a55_2: cpu@10000 {
 			power-domains = <&sysc R8A779F0_PD_A1E0D1C0>;
 			next-level-cache = <&L3_CA55_1>;
 			enable-method = "psci";
+			cpu-idle-states = <&CPU_SLEEP_0>;
 		};
 
 		a55_3: cpu@10100 {
@@ -90,6 +93,7 @@ a55_3: cpu@10100 {
 			power-domains = <&sysc R8A779F0_PD_A1E0D1C1>;
 			next-level-cache = <&L3_CA55_1>;
 			enable-method = "psci";
+			cpu-idle-states = <&CPU_SLEEP_0>;
 		};
 
 		a55_4: cpu@20000 {
@@ -99,6 +103,7 @@ a55_4: cpu@20000 {
 			power-domains = <&sysc R8A779F0_PD_A1E1D0C0>;
 			next-level-cache = <&L3_CA55_2>;
 			enable-method = "psci";
+			cpu-idle-states = <&CPU_SLEEP_0>;
 		};
 
 		a55_5: cpu@20100 {
@@ -108,6 +113,7 @@ a55_5: cpu@20100 {
 			power-domains = <&sysc R8A779F0_PD_A1E1D0C1>;
 			next-level-cache = <&L3_CA55_2>;
 			enable-method = "psci";
+			cpu-idle-states = <&CPU_SLEEP_0>;
 		};
 
 		a55_6: cpu@30000 {
@@ -117,6 +123,7 @@ a55_6: cpu@30000 {
 			power-domains = <&sysc R8A779F0_PD_A1E1D1C0>;
 			next-level-cache = <&L3_CA55_3>;
 			enable-method = "psci";
+			cpu-idle-states = <&CPU_SLEEP_0>;
 		};
 
 		a55_7: cpu@30100 {
@@ -126,6 +133,7 @@ a55_7: cpu@30100 {
 			power-domains = <&sysc R8A779F0_PD_A1E1D1C1>;
 			next-level-cache = <&L3_CA55_3>;
 			enable-method = "psci";
+			cpu-idle-states = <&CPU_SLEEP_0>;
 		};
 
 		L3_CA55_0: cache-controller-0 {
@@ -155,6 +163,19 @@ L3_CA55_3: cache-controller-3 {
 			cache-unified;
 			cache-level = <3>;
 		};
+
+		idle-states {
+			entry-method = "psci";
+
+			CPU_SLEEP_0: cpu-sleep-0 {
+				compatible = "arm,idle-state";
+				arm,psci-suspend-param = <0x0010000>;
+				local-timer-stop;
+				entry-latency-us = <400>;
+				exit-latency-us = <500>;
+				min-residency-us = <4000>;
+			};
+		};
 	};
 
 	extal_clk: extal {
-- 
2.25.1

