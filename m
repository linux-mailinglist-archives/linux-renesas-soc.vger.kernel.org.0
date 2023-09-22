Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B267F7AAC87
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 22 Sep 2023 10:25:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232332AbjIVIZ2 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 22 Sep 2023 04:25:28 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49396 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232616AbjIVIZV (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 22 Sep 2023 04:25:21 -0400
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DF9EC19B5
        for <linux-renesas-soc@vger.kernel.org>; Fri, 22 Sep 2023 01:15:58 -0700 (PDT)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 84F5DC433CD;
        Fri, 22 Sep 2023 08:15:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1695370557;
        bh=nPbrg4k7TDBSAiDREwya4kBzfJcwU51YnoJ26drHudk=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=vIfhMJp98T6FV2x2YUGLVQPEgw8B2oskkCAVypHXg9s0Aqc5W0/bfz1xFoOR8Dpvv
         RYZbhqo0IhFr/nUImQzQ5pOrVqr2cOsqSgaXmwlv2hXh92JrDaJegfbtU/+NEDox87
         V4mnSLhPmOxEW7ylDdth1bTnn+26LSYVPwgHOFKA6XPO1yPj1B8cS+XvXi9J9J9u1g
         5w9/86S2ldBNMm7WmBBfQmM8B4fMG1R86gSyv0Z/ohCAA+0ohCCMdn4k3fHHOUkIMP
         4jMsEHNkIHpsx28upwv8SbO8RHW6ZAxq0hLi7loxSgq9Ic0VE7YdRdOWDmUFcFINK5
         p+ak9LnzvwPbw==
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
Subject: [RFC v2 5/6] riscv: dts: allwinner: convert isa detection to new properties
Date:   Fri, 22 Sep 2023 09:13:50 +0100
Message-ID: <20230922081351.30239-7-conor@kernel.org>
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

Convert the D1 devicetrees to use the new properties
"riscv,isa-base" & "riscv,isa-extensions".
For compatibility with other projects, "riscv,isa" remains.

Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
---
 arch/riscv/boot/dts/allwinner/sun20i-d1s.dtsi | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/arch/riscv/boot/dts/allwinner/sun20i-d1s.dtsi b/arch/riscv/boot/dts/allwinner/sun20i-d1s.dtsi
index 8275630af977..947e975d2476 100644
--- a/arch/riscv/boot/dts/allwinner/sun20i-d1s.dtsi
+++ b/arch/riscv/boot/dts/allwinner/sun20i-d1s.dtsi
@@ -25,6 +25,9 @@ cpu0: cpu@0 {
 			mmu-type = "riscv,sv39";
 			operating-points-v2 = <&opp_table_cpu>;
 			riscv,isa = "rv64imafdc";
+			riscv,isa-base = "rv64i";
+			riscv,isa-extensions = "i", "m", "a", "f", "d", "c", "zicntr", "zicsr",
+					       "zifencei", "zihpm";
 			#cooling-cells = <2>;
 
 			cpu0_intc: interrupt-controller {
-- 
2.41.0

