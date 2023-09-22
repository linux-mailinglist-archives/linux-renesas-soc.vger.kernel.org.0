Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1D5257AAC86
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 22 Sep 2023 10:25:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232651AbjIVIZW (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 22 Sep 2023 04:25:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53626 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232517AbjIVIZL (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 22 Sep 2023 04:25:11 -0400
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6BEBC10D3
        for <linux-renesas-soc@vger.kernel.org>; Fri, 22 Sep 2023 01:15:43 -0700 (PDT)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 21535C433C8;
        Fri, 22 Sep 2023 08:15:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1695370543;
        bh=J7c7CSpq+jJvt/X8SgS6zQzZjvo50bIOnu44mdhPcVo=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=jcXyy16U4chszJ31wBu5ayzrJliAmdcJTmJ2bXra0hoZIqcbzNWy5TWmIpktqcDW2
         Gx5hGNwGL5bOSaXgFAxdof8UnEdAPYGWn8eTbBblqXcyB4cmR9R1rfnFjoV782vdib
         rk/kzmAHw3aIPo3rDMVMlbFG4TNVOqUMsqj12IytjcrRGfY8WFYaCMDdj5YP/pkacP
         xMcynAQxsT4s5MOGc/DJZF0OR/mhvPNjI+pMc8T4tyt2eBdLhHJG5KZ1DulePXr7vn
         T+09ahZJCdjHAwCR06ZUVV43gcJwVI0pi0+wYfrmiOK5/90rzgOY0pXad+YehZvO5y
         2z3MDDsy3iFSQ==
From:   Conor Dooley <conor@kernel.org>
To:     linux-riscv@lists.infradead.org
Cc:     conor@kernel.org, Conor Dooley <conor.dooley@microchip.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Paul Walmsley <paul.walmsley@sifive.com>,
        Palmer Dabbelt <palmer@dabbelt.com>,
        Albert Ou <aou@eecs.berkeley.edu>,
        Chen-Yu Tsai <wens@csie.org>,
        Jernej Skrabec <jernej.skrabec@gmail.com>,
        Samuel Holland <samuel@sholland.org>,
        Daire McNamara <daire.mcnamara@microchip.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Magnus Damm <magnus.damm@gmail.com>,
        Emil Renner Berthing <kernel@esmil.dk>,
        Jisheng Zhang <jszhang@kernel.org>,
        Guo Ren <guoren@kernel.org>, Fu Wei <wefu@redhat.com>,
        Chen Wang <unicorn_wang@outlook.com>,
        devicetree@vger.kernel.org, linux-sunxi@lists.linux.dev,
        linux-renesas-soc@vger.kernel.org
Subject: [RFC v2 2/6] riscv: dts: sifive: convert isa detection to new properties
Date:   Fri, 22 Sep 2023 09:13:47 +0100
Message-ID: <20230922081351.30239-4-conor@kernel.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230922081351.30239-2-conor@kernel.org>
References: <20230922081351.30239-2-conor@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

From: Conor Dooley <conor.dooley@microchip.com>

Convert the fu540 and fu740 devicetrees to use the new properties
"riscv,isa-base" & "riscv,isa-extensions".
For compatibility with other projects, "riscv,isa" remains.

Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
---
 arch/riscv/boot/dts/sifive/fu540-c000.dtsi | 15 +++++++++++++++
 arch/riscv/boot/dts/sifive/fu740-c000.dtsi | 15 +++++++++++++++
 2 files changed, 30 insertions(+)

diff --git a/arch/riscv/boot/dts/sifive/fu540-c000.dtsi b/arch/riscv/boot/dts/sifive/fu540-c000.dtsi
index 24bba83bec77..156330a9bbf3 100644
--- a/arch/riscv/boot/dts/sifive/fu540-c000.dtsi
+++ b/arch/riscv/boot/dts/sifive/fu540-c000.dtsi
@@ -30,6 +30,9 @@ cpu0: cpu@0 {
 			i-cache-size = <16384>;
 			reg = <0>;
 			riscv,isa = "rv64imac";
+			riscv,isa-base = "rv64i";
+			riscv,isa-extensions = "i", "m", "a", "c", "zicntr", "zicsr", "zifencei",
+					       "zihpm";
 			status = "disabled";
 			cpu0_intc: interrupt-controller {
 				#interrupt-cells = <1>;
@@ -53,6 +56,9 @@ cpu1: cpu@1 {
 			mmu-type = "riscv,sv39";
 			reg = <1>;
 			riscv,isa = "rv64imafdc";
+			riscv,isa-base = "rv64i";
+			riscv,isa-extensions = "i", "m", "a", "f", "d", "c", "zicntr", "zicsr",
+					       "zifencei", "zihpm";
 			tlb-split;
 			next-level-cache = <&l2cache>;
 			cpu1_intc: interrupt-controller {
@@ -77,6 +83,9 @@ cpu2: cpu@2 {
 			mmu-type = "riscv,sv39";
 			reg = <2>;
 			riscv,isa = "rv64imafdc";
+			riscv,isa-base = "rv64i";
+			riscv,isa-extensions = "i", "m", "a", "f", "d", "c", "zicntr", "zicsr",
+					       "zifencei", "zihpm";
 			tlb-split;
 			next-level-cache = <&l2cache>;
 			cpu2_intc: interrupt-controller {
@@ -101,6 +110,9 @@ cpu3: cpu@3 {
 			mmu-type = "riscv,sv39";
 			reg = <3>;
 			riscv,isa = "rv64imafdc";
+			riscv,isa-base = "rv64i";
+			riscv,isa-extensions = "i", "m", "a", "f", "d", "c", "zicntr", "zicsr",
+					       "zifencei", "zihpm";
 			tlb-split;
 			next-level-cache = <&l2cache>;
 			cpu3_intc: interrupt-controller {
@@ -125,6 +137,9 @@ cpu4: cpu@4 {
 			mmu-type = "riscv,sv39";
 			reg = <4>;
 			riscv,isa = "rv64imafdc";
+			riscv,isa-base = "rv64i";
+			riscv,isa-extensions = "i", "m", "a", "f", "d", "c", "zicntr", "zicsr",
+					       "zifencei", "zihpm";
 			tlb-split;
 			next-level-cache = <&l2cache>;
 			cpu4_intc: interrupt-controller {
diff --git a/arch/riscv/boot/dts/sifive/fu740-c000.dtsi b/arch/riscv/boot/dts/sifive/fu740-c000.dtsi
index 5235fd1c9cb6..6150f3397bff 100644
--- a/arch/riscv/boot/dts/sifive/fu740-c000.dtsi
+++ b/arch/riscv/boot/dts/sifive/fu740-c000.dtsi
@@ -31,6 +31,9 @@ cpu0: cpu@0 {
 			next-level-cache = <&ccache>;
 			reg = <0x0>;
 			riscv,isa = "rv64imac";
+			riscv,isa-base = "rv64i";
+			riscv,isa-extensions = "i", "m", "a", "c", "zicntr", "zicsr", "zifencei",
+					       "zihpm";
 			status = "disabled";
 			cpu0_intc: interrupt-controller {
 				#interrupt-cells = <1>;
@@ -55,6 +58,9 @@ cpu1: cpu@1 {
 			next-level-cache = <&ccache>;
 			reg = <0x1>;
 			riscv,isa = "rv64imafdc";
+			riscv,isa-base = "rv64i";
+			riscv,isa-extensions = "i", "m", "a", "f", "d", "c", "zicntr", "zicsr",
+					       "zifencei", "zihpm";
 			tlb-split;
 			cpu1_intc: interrupt-controller {
 				#interrupt-cells = <1>;
@@ -79,6 +85,9 @@ cpu2: cpu@2 {
 			next-level-cache = <&ccache>;
 			reg = <0x2>;
 			riscv,isa = "rv64imafdc";
+			riscv,isa-base = "rv64i";
+			riscv,isa-extensions = "i", "m", "a", "f", "d", "c", "zicntr", "zicsr",
+					       "zifencei", "zihpm";
 			tlb-split;
 			cpu2_intc: interrupt-controller {
 				#interrupt-cells = <1>;
@@ -103,6 +112,9 @@ cpu3: cpu@3 {
 			next-level-cache = <&ccache>;
 			reg = <0x3>;
 			riscv,isa = "rv64imafdc";
+			riscv,isa-base = "rv64i";
+			riscv,isa-extensions = "i", "m", "a", "f", "d", "c", "zicntr", "zicsr",
+					       "zifencei", "zihpm";
 			tlb-split;
 			cpu3_intc: interrupt-controller {
 				#interrupt-cells = <1>;
@@ -127,6 +139,9 @@ cpu4: cpu@4 {
 			next-level-cache = <&ccache>;
 			reg = <0x4>;
 			riscv,isa = "rv64imafdc";
+			riscv,isa-base = "rv64i";
+			riscv,isa-extensions = "i", "m", "a", "f", "d", "c", "zicntr", "zicsr",
+					       "zifencei", "zihpm";
 			tlb-split;
 			cpu4_intc: interrupt-controller {
 				#interrupt-cells = <1>;
-- 
2.41.0

