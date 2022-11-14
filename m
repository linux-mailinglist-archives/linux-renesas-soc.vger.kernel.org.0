Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 707BB627E95
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 14 Nov 2022 13:49:15 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237345AbiKNMtO (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 14 Nov 2022 07:49:14 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41350 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237333AbiKNMtM (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 14 Nov 2022 07:49:12 -0500
Received: from albert.telenet-ops.be (albert.telenet-ops.be [IPv6:2a02:1800:110:4::f00:1a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3473AF49
        for <linux-renesas-soc@vger.kernel.org>; Mon, 14 Nov 2022 04:49:11 -0800 (PST)
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed10:9cda:b28b:1ded:8138])
        by albert.telenet-ops.be with bizsmtp
        id kCp62800E3NlhLw06Cp6XY; Mon, 14 Nov 2022 13:49:09 +0100
Received: from rox.of.borg ([192.168.97.57])
        by ramsan.of.borg with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
        (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1ouYtd-000UUD-Ro; Mon, 14 Nov 2022 13:49:05 +0100
Received: from geert by rox.of.borg with local (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1ouYtd-003gzL-31; Mon, 14 Nov 2022 13:49:05 +0100
From:   Geert Uytterhoeven <geert+renesas@glider.be>
To:     Magnus Damm <magnus.damm@gmail.com>
Cc:     linux-renesas-soc@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH 4/5] arm64: dts: renesas: r8a779g0: Add CPU core clocks
Date:   Mon, 14 Nov 2022 13:49:03 +0100
Message-Id: <aa6e9ae21e451ebd40d54d986bd0296571128d5b.1668429870.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1668429870.git.geert+renesas@glider.be>
References: <cover.1668429870.git.geert+renesas@glider.be>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.3 required=5.0 tests=BAYES_00,
        HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_LOW,SPF_HELO_NONE,SPF_NONE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Describe the clocks for the four Cortex-A76 CPU cores.
CA76 Sub-Systems 0/1 (both clusters / all CPU cores) are clocked by Z0φ.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
 arch/arm64/boot/dts/renesas/r8a779g0.dtsi | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/arm64/boot/dts/renesas/r8a779g0.dtsi b/arch/arm64/boot/dts/renesas/r8a779g0.dtsi
index 21baa4936b4fba3e..9cbe337220ed4dfc 100644
--- a/arch/arm64/boot/dts/renesas/r8a779g0.dtsi
+++ b/arch/arm64/boot/dts/renesas/r8a779g0.dtsi
@@ -46,6 +46,7 @@ a76_0: cpu@0 {
 			next-level-cache = <&L3_CA76_0>;
 			enable-method = "psci";
 			cpu-idle-states = <&CPU_SLEEP_0>;
+			clocks = <&cpg CPG_CORE R8A779G0_CLK_Z0>;
 		};
 
 		a76_1: cpu@100 {
@@ -56,6 +57,7 @@ a76_1: cpu@100 {
 			next-level-cache = <&L3_CA76_0>;
 			enable-method = "psci";
 			cpu-idle-states = <&CPU_SLEEP_0>;
+			clocks = <&cpg CPG_CORE R8A779G0_CLK_Z0>;
 		};
 
 		a76_2: cpu@10000 {
@@ -66,6 +68,7 @@ a76_2: cpu@10000 {
 			next-level-cache = <&L3_CA76_1>;
 			enable-method = "psci";
 			cpu-idle-states = <&CPU_SLEEP_0>;
+			clocks = <&cpg CPG_CORE R8A779G0_CLK_Z0>;
 		};
 
 		a76_3: cpu@10100 {
@@ -76,6 +79,7 @@ a76_3: cpu@10100 {
 			next-level-cache = <&L3_CA76_1>;
 			enable-method = "psci";
 			cpu-idle-states = <&CPU_SLEEP_0>;
+			clocks = <&cpg CPG_CORE R8A779G0_CLK_Z0>;
 		};
 
 		idle-states {
-- 
2.25.1

