Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6B6DE627E8F
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 14 Nov 2022 13:49:11 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237196AbiKNMtK (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 14 Nov 2022 07:49:10 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41314 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237319AbiKNMtJ (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 14 Nov 2022 07:49:09 -0500
Received: from michel.telenet-ops.be (michel.telenet-ops.be [IPv6:2a02:1800:110:4::f00:18])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EAB423AB
        for <linux-renesas-soc@vger.kernel.org>; Mon, 14 Nov 2022 04:49:07 -0800 (PST)
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed10:9cda:b28b:1ded:8138])
        by michel.telenet-ops.be with bizsmtp
        id kCp6280013NlhLw06Cp6Ry; Mon, 14 Nov 2022 13:49:06 +0100
Received: from rox.of.borg ([192.168.97.57])
        by ramsan.of.borg with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
        (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1ouYtd-000UUC-K5; Mon, 14 Nov 2022 13:49:05 +0100
Received: from geert by rox.of.borg with local (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1ouYtd-003gzE-1W; Mon, 14 Nov 2022 13:49:05 +0100
From:   Geert Uytterhoeven <geert+renesas@glider.be>
To:     Magnus Damm <magnus.damm@gmail.com>
Cc:     linux-renesas-soc@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH 3/5] arm64: dts: renesas: r8a779g0: Add CPUIdle support
Date:   Mon, 14 Nov 2022 13:49:02 +0100
Message-Id: <f6d4076983eb45cf23595a045747f28cbdcdf4e6.1668429870.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1668429870.git.geert+renesas@glider.be>
References: <cover.1668429870.git.geert+renesas@glider.be>
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

Support CPUIdle for ARM Cortex-A76 on R-Car V4H.

Based on patches in the BSP by Tho Vu and Vincent Bryce.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
 arch/arm64/boot/dts/renesas/r8a779g0.dtsi | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)

diff --git a/arch/arm64/boot/dts/renesas/r8a779g0.dtsi b/arch/arm64/boot/dts/renesas/r8a779g0.dtsi
index dc5f27c114a7ad96..21baa4936b4fba3e 100644
--- a/arch/arm64/boot/dts/renesas/r8a779g0.dtsi
+++ b/arch/arm64/boot/dts/renesas/r8a779g0.dtsi
@@ -45,6 +45,7 @@ a76_0: cpu@0 {
 			power-domains = <&sysc R8A779G0_PD_A1E0D0C0>;
 			next-level-cache = <&L3_CA76_0>;
 			enable-method = "psci";
+			cpu-idle-states = <&CPU_SLEEP_0>;
 		};
 
 		a76_1: cpu@100 {
@@ -54,6 +55,7 @@ a76_1: cpu@100 {
 			power-domains = <&sysc R8A779G0_PD_A1E0D0C1>;
 			next-level-cache = <&L3_CA76_0>;
 			enable-method = "psci";
+			cpu-idle-states = <&CPU_SLEEP_0>;
 		};
 
 		a76_2: cpu@10000 {
@@ -63,6 +65,7 @@ a76_2: cpu@10000 {
 			power-domains = <&sysc R8A779G0_PD_A1E0D1C0>;
 			next-level-cache = <&L3_CA76_1>;
 			enable-method = "psci";
+			cpu-idle-states = <&CPU_SLEEP_0>;
 		};
 
 		a76_3: cpu@10100 {
@@ -72,8 +75,22 @@ a76_3: cpu@10100 {
 			power-domains = <&sysc R8A779G0_PD_A1E0D1C1>;
 			next-level-cache = <&L3_CA76_1>;
 			enable-method = "psci";
+			cpu-idle-states = <&CPU_SLEEP_0>;
 		};
 
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
+	       };
+
 		L3_CA76_0: cache-controller-0 {
 			compatible = "cache";
 			power-domains = <&sysc R8A779G0_PD_A2E0D0>;
-- 
2.25.1

