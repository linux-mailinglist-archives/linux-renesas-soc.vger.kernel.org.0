Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E605E7AAC35
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 22 Sep 2023 10:17:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232623AbjIVIQ1 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 22 Sep 2023 04:16:27 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46814 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232824AbjIVIQQ (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 22 Sep 2023 04:16:16 -0400
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9DBBBE76
        for <linux-renesas-soc@vger.kernel.org>; Fri, 22 Sep 2023 01:15:48 -0700 (PDT)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E3A6BC433C9;
        Fri, 22 Sep 2023 08:15:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1695370548;
        bh=vlviu2tG9WGCaiJkQbOLu/vrDYST7pugzrdM9DdK2ak=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=a2i5MXdidcPs8u+tMHnhxw17vMWux2e425//v2jOFM3ChgSuYKllZD+Fdszz+4uGK
         2wrs44rBAYy8XM4jGOY1qecDOPTiIfN1H79o/AYtPuGTrSTGQVtR2Fxjq6Le8x2qic
         TXogaK+hkh5OWYkwbA58PUFjqCOd+IB8unx9ofLs6JsBep5wJJP2ikL/WdvCukSgdG
         NmIgrXGiVSwb09T+W2Bk8awQ/+KBEF+LO2O7gLvTaWGKA3rzegWv31PUqv9QQPNghr
         XGnGRe7xXDCNeweX6LbFMs/2K8bYOBBREWJVOAokarO4cOReFs0m+tPZ0MwpY5u5h8
         0UTbimGtASV4g==
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
Subject: [RFC v2 3/6] riscv: dts: starfive: convert isa detection to new properties
Date:   Fri, 22 Sep 2023 09:13:48 +0100
Message-ID: <20230922081351.30239-5-conor@kernel.org>
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

Convert the jh7100 and jh7110 devicetrees to use the new properties
"riscv,isa-base" & "riscv,isa-extensions".
For compatibility with other projects, "riscv,isa" remains.

Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
---
 arch/riscv/boot/dts/starfive/jh7100.dtsi |  6 ++++++
 arch/riscv/boot/dts/starfive/jh7110.dtsi | 15 +++++++++++++++
 2 files changed, 21 insertions(+)

diff --git a/arch/riscv/boot/dts/starfive/jh7100.dtsi b/arch/riscv/boot/dts/starfive/jh7100.dtsi
index 35ab54fb235f..e68cafe7545f 100644
--- a/arch/riscv/boot/dts/starfive/jh7100.dtsi
+++ b/arch/riscv/boot/dts/starfive/jh7100.dtsi
@@ -33,6 +33,9 @@ U74_0: cpu@0 {
 			i-tlb-size = <32>;
 			mmu-type = "riscv,sv39";
 			riscv,isa = "rv64imafdc";
+			riscv,isa-base = "rv64i";
+			riscv,isa-extensions = "i", "m", "a", "f", "d", "c", "zicntr", "zicsr",
+					       "zifencei", "zihpm";
 			tlb-split;
 
 			cpu0_intc: interrupt-controller {
@@ -58,6 +61,9 @@ U74_1: cpu@1 {
 			i-tlb-size = <32>;
 			mmu-type = "riscv,sv39";
 			riscv,isa = "rv64imafdc";
+			riscv,isa-base = "rv64i";
+			riscv,isa-extensions = "i", "m", "a", "f", "d", "c", "zicntr", "zicsr",
+					       "zifencei", "zihpm";
 			tlb-split;
 
 			cpu1_intc: interrupt-controller {
diff --git a/arch/riscv/boot/dts/starfive/jh7110.dtsi b/arch/riscv/boot/dts/starfive/jh7110.dtsi
index e85464c328d0..90b35be9aa6c 100644
--- a/arch/riscv/boot/dts/starfive/jh7110.dtsi
+++ b/arch/riscv/boot/dts/starfive/jh7110.dtsi
@@ -28,6 +28,9 @@ S7_0: cpu@0 {
 			i-cache-size = <16384>;
 			next-level-cache = <&ccache>;
 			riscv,isa = "rv64imac_zba_zbb";
+			riscv,isa-base = "rv64i";
+			riscv,isa-extensions = "i", "m", "a", "c", "zba", "zbb", "zicntr", "zicsr",
+					       "zifencei", "zihpm";
 			status = "disabled";
 
 			cpu0_intc: interrupt-controller {
@@ -54,6 +57,9 @@ U74_1: cpu@1 {
 			mmu-type = "riscv,sv39";
 			next-level-cache = <&ccache>;
 			riscv,isa = "rv64imafdc_zba_zbb";
+			riscv,isa-base = "rv64i";
+			riscv,isa-extensions = "i", "m", "a", "f", "d", "c", "zba", "zbb", "zicntr",
+					       "zicsr", "zifencei", "zihpm";
 			tlb-split;
 			operating-points-v2 = <&cpu_opp>;
 			clocks = <&syscrg JH7110_SYSCLK_CPU_CORE>;
@@ -84,6 +90,9 @@ U74_2: cpu@2 {
 			mmu-type = "riscv,sv39";
 			next-level-cache = <&ccache>;
 			riscv,isa = "rv64imafdc_zba_zbb";
+			riscv,isa-base = "rv64i";
+			riscv,isa-extensions = "i", "m", "a", "f", "d", "c", "zba", "zbb", "zicntr",
+					       "zicsr", "zifencei", "zihpm";
 			tlb-split;
 			operating-points-v2 = <&cpu_opp>;
 			clocks = <&syscrg JH7110_SYSCLK_CPU_CORE>;
@@ -114,6 +123,9 @@ U74_3: cpu@3 {
 			mmu-type = "riscv,sv39";
 			next-level-cache = <&ccache>;
 			riscv,isa = "rv64imafdc_zba_zbb";
+			riscv,isa-base = "rv64i";
+			riscv,isa-extensions = "i", "m", "a", "f", "d", "c", "zba", "zbb", "zicntr",
+					       "zicsr", "zifencei", "zihpm";
 			tlb-split;
 			operating-points-v2 = <&cpu_opp>;
 			clocks = <&syscrg JH7110_SYSCLK_CPU_CORE>;
@@ -144,6 +156,9 @@ U74_4: cpu@4 {
 			mmu-type = "riscv,sv39";
 			next-level-cache = <&ccache>;
 			riscv,isa = "rv64imafdc_zba_zbb";
+			riscv,isa-base = "rv64i";
+			riscv,isa-extensions = "i", "m", "a", "f", "d", "c", "zba", "zbb", "zicntr",
+					       "zicsr", "zifencei", "zihpm";
 			tlb-split;
 			operating-points-v2 = <&cpu_opp>;
 			clocks = <&syscrg JH7110_SYSCLK_CPU_CORE>;
-- 
2.41.0

