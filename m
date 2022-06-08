Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9DD3F5437A5
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  8 Jun 2022 17:40:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S244468AbiFHPke (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 8 Jun 2022 11:40:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60596 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S244521AbiFHPkc (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 8 Jun 2022 11:40:32 -0400
Received: from baptiste.telenet-ops.be (baptiste.telenet-ops.be [IPv6:2a02:1800:120:4::f00:13])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6F58F1CC5ED
        for <linux-renesas-soc@vger.kernel.org>; Wed,  8 Jun 2022 08:40:26 -0700 (PDT)
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed30:243a:e14b:d107:1f56])
        by baptiste.telenet-ops.be with bizsmtp
        id gfgR2700G1qF9lr01fgRRE; Wed, 08 Jun 2022 17:40:25 +0200
Received: from rox.of.borg ([192.168.97.57])
        by ramsan.of.borg with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
        (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1nyxnE-003E0E-OF; Wed, 08 Jun 2022 17:40:24 +0200
Received: from geert by rox.of.borg with local (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1nyxnE-008kJo-7J; Wed, 08 Jun 2022 17:40:24 +0200
From:   Geert Uytterhoeven <geert+renesas@glider.be>
To:     Magnus Damm <magnus.damm@gmail.com>,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Cc:     linux-renesas-soc@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH 4/4] arm64: dts: renesas: r8a779f0: Add CPU core clocks
Date:   Wed,  8 Jun 2022 17:40:22 +0200
Message-Id: <c502087f9affa86dd665def0d990d277a51cc75c.1654701480.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1654701480.git.geert+renesas@glider.be>
References: <cover.1654701480.git.geert+renesas@glider.be>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.4 required=5.0 tests=BAYES_00,
        HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_LOW,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Describe the clocks for the eight Cortex-A55 CPU cores.
CA55 Sub-System 0 (first 2 clusters / CPU cores 0-3) is clocked by Z0φ.
CA55 Sub-System 1 (last 2 clusters / CPU cores 4-7) is clocked by Z1φ.

For now no operating points are defined.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
 arch/arm64/boot/dts/renesas/r8a779f0.dtsi | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/arch/arm64/boot/dts/renesas/r8a779f0.dtsi b/arch/arm64/boot/dts/renesas/r8a779f0.dtsi
index bcee482803e888cc..9ec23b46891f8d96 100644
--- a/arch/arm64/boot/dts/renesas/r8a779f0.dtsi
+++ b/arch/arm64/boot/dts/renesas/r8a779f0.dtsi
@@ -64,6 +64,7 @@ a55_0: cpu@0 {
 			next-level-cache = <&L3_CA55_0>;
 			enable-method = "psci";
 			cpu-idle-states = <&CPU_SLEEP_0>;
+			clocks = <&cpg CPG_CORE R8A779F0_CLK_Z0>;
 		};
 
 		a55_1: cpu@100 {
@@ -74,6 +75,7 @@ a55_1: cpu@100 {
 			next-level-cache = <&L3_CA55_0>;
 			enable-method = "psci";
 			cpu-idle-states = <&CPU_SLEEP_0>;
+			clocks = <&cpg CPG_CORE R8A779F0_CLK_Z0>;
 		};
 
 		a55_2: cpu@10000 {
@@ -84,6 +86,7 @@ a55_2: cpu@10000 {
 			next-level-cache = <&L3_CA55_1>;
 			enable-method = "psci";
 			cpu-idle-states = <&CPU_SLEEP_0>;
+			clocks = <&cpg CPG_CORE R8A779F0_CLK_Z0>;
 		};
 
 		a55_3: cpu@10100 {
@@ -94,6 +97,7 @@ a55_3: cpu@10100 {
 			next-level-cache = <&L3_CA55_1>;
 			enable-method = "psci";
 			cpu-idle-states = <&CPU_SLEEP_0>;
+			clocks = <&cpg CPG_CORE R8A779F0_CLK_Z0>;
 		};
 
 		a55_4: cpu@20000 {
@@ -104,6 +108,7 @@ a55_4: cpu@20000 {
 			next-level-cache = <&L3_CA55_2>;
 			enable-method = "psci";
 			cpu-idle-states = <&CPU_SLEEP_0>;
+			clocks = <&cpg CPG_CORE R8A779F0_CLK_Z1>;
 		};
 
 		a55_5: cpu@20100 {
@@ -114,6 +119,7 @@ a55_5: cpu@20100 {
 			next-level-cache = <&L3_CA55_2>;
 			enable-method = "psci";
 			cpu-idle-states = <&CPU_SLEEP_0>;
+			clocks = <&cpg CPG_CORE R8A779F0_CLK_Z1>;
 		};
 
 		a55_6: cpu@30000 {
@@ -124,6 +130,7 @@ a55_6: cpu@30000 {
 			next-level-cache = <&L3_CA55_3>;
 			enable-method = "psci";
 			cpu-idle-states = <&CPU_SLEEP_0>;
+			clocks = <&cpg CPG_CORE R8A779F0_CLK_Z1>;
 		};
 
 		a55_7: cpu@30100 {
@@ -134,6 +141,7 @@ a55_7: cpu@30100 {
 			next-level-cache = <&L3_CA55_3>;
 			enable-method = "psci";
 			cpu-idle-states = <&CPU_SLEEP_0>;
+			clocks = <&cpg CPG_CORE R8A779F0_CLK_Z1>;
 		};
 
 		L3_CA55_0: cache-controller-0 {
-- 
2.25.1

