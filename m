Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B90207AAC3E
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 22 Sep 2023 10:17:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232459AbjIVIQY (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 22 Sep 2023 04:16:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34956 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232511AbjIVIQI (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 22 Sep 2023 04:16:08 -0400
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 09EEDE4F
        for <linux-renesas-soc@vger.kernel.org>; Fri, 22 Sep 2023 01:15:39 -0700 (PDT)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EDD78C433CA;
        Fri, 22 Sep 2023 08:15:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1695370538;
        bh=ym/P79iMnlKHrq0wlF+lNRu7pe3fGRLDF///W24nvOA=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=Z7Zjbao64P6dk3zub1HiXIuYgEEEN/iJ4tY2c/xeCqTU5tOWJ0LhBKItOnLpiGXH8
         2MNOKZ965+bFeS4D2UEnj2l8UUHXoYWnyUSlqpToj9PozVx1N6yV43+F6iHCJg+ZJG
         MwzT8tNwKkxYjc8fTTBUFi18QLdgrfJjLjDFDoOifQwGnaJSarGKvBMTOwTJtE9aKM
         up7F9Evj3t8FD1kIfnevznljBP5MEEvQvjyKeTLiBtCwRGdtR94hDcjkzufd3/xpWh
         gNwU7H/y8adsL6jub5ic9+1Imb+WSzw8908CTpzMxTSz0QEiaErGnVRGZBkGM6r76H
         8DA6AVGA7DURA==
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
Subject: [RFC v2 1/6] riscv: dts: microchip: convert isa detection to new properties
Date:   Fri, 22 Sep 2023 09:13:46 +0100
Message-ID: <20230922081351.30239-3-conor@kernel.org>
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

Convert the PolarFire SoC devicetrees to use the new properties
"riscv,isa-base" & "riscv,isa-extensions".
For compatibility with other projects, "riscv,isa" remains.

Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
---
 arch/riscv/boot/dts/microchip/mpfs.dtsi | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/arch/riscv/boot/dts/microchip/mpfs.dtsi b/arch/riscv/boot/dts/microchip/mpfs.dtsi
index 104504352e99..a6faf24f1dba 100644
--- a/arch/riscv/boot/dts/microchip/mpfs.dtsi
+++ b/arch/riscv/boot/dts/microchip/mpfs.dtsi
@@ -22,6 +22,9 @@ cpu0: cpu@0 {
 			i-cache-size = <16384>;
 			reg = <0>;
 			riscv,isa = "rv64imac";
+			riscv,isa-base = "rv64i";
+			riscv,isa-extensions = "i", "m", "a", "c", "zicntr", "zicsr", "zifencei",
+					       "zihpm";
 			clocks = <&clkcfg CLK_CPU>;
 			status = "disabled";
 
@@ -48,6 +51,9 @@ cpu1: cpu@1 {
 			mmu-type = "riscv,sv39";
 			reg = <1>;
 			riscv,isa = "rv64imafdc";
+			riscv,isa-base = "rv64i";
+			riscv,isa-extensions = "i", "m", "a", "f", "d", "c", "zicntr", "zicsr",
+					       "zifencei", "zihpm";
 			clocks = <&clkcfg CLK_CPU>;
 			tlb-split;
 			next-level-cache = <&cctrllr>;
@@ -76,6 +82,9 @@ cpu2: cpu@2 {
 			mmu-type = "riscv,sv39";
 			reg = <2>;
 			riscv,isa = "rv64imafdc";
+			riscv,isa-base = "rv64i";
+			riscv,isa-extensions = "i", "m", "a", "f", "d", "c", "zicntr", "zicsr",
+					       "zifencei", "zihpm";
 			clocks = <&clkcfg CLK_CPU>;
 			tlb-split;
 			next-level-cache = <&cctrllr>;
@@ -104,6 +113,9 @@ cpu3: cpu@3 {
 			mmu-type = "riscv,sv39";
 			reg = <3>;
 			riscv,isa = "rv64imafdc";
+			riscv,isa-base = "rv64i";
+			riscv,isa-extensions = "i", "m", "a", "f", "d", "c", "zicntr", "zicsr",
+					       "zifencei", "zihpm";
 			clocks = <&clkcfg CLK_CPU>;
 			tlb-split;
 			next-level-cache = <&cctrllr>;
@@ -132,6 +144,9 @@ cpu4: cpu@4 {
 			mmu-type = "riscv,sv39";
 			reg = <4>;
 			riscv,isa = "rv64imafdc";
+			riscv,isa-base = "rv64i";
+			riscv,isa-extensions = "i", "m", "a", "f", "d", "c", "zicntr", "zicsr",
+					       "zifencei", "zihpm";
 			clocks = <&clkcfg CLK_CPU>;
 			tlb-split;
 			next-level-cache = <&cctrllr>;
-- 
2.41.0

