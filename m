Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D37095F7A6A
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  7 Oct 2022 17:20:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229703AbiJGPUR (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 7 Oct 2022 11:20:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53378 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229542AbiJGPUR (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 7 Oct 2022 11:20:17 -0400
Received: from laurent.telenet-ops.be (laurent.telenet-ops.be [IPv6:2a02:1800:110:4::f00:19])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D14A91D663
        for <linux-renesas-soc@vger.kernel.org>; Fri,  7 Oct 2022 08:20:14 -0700 (PDT)
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed50:a4a4:fd15:fba:df3b])
        by laurent.telenet-ops.be with bizsmtp
        id V3LA280025Lh0ZK013LASc; Fri, 07 Oct 2022 17:20:12 +0200
Received: from rox.of.borg ([192.168.97.57])
        by ramsan.of.borg with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
        (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1ogp8z-000ueh-MG; Fri, 07 Oct 2022 17:20:09 +0200
Received: from geert by rox.of.borg with local (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1ogp8z-00CQ7b-9T; Fri, 07 Oct 2022 17:20:09 +0200
From:   Geert Uytterhoeven <geert+renesas@glider.be>
To:     Magnus Damm <magnus.damm@gmail.com>
Cc:     Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        linux-renesas-soc@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH] arm64: dts: renesas: r8a779g0: Fix HSCIF0 "brg_int" clock
Date:   Fri,  7 Oct 2022 17:20:03 +0200
Message-Id: <a5bd4148f92806f7c8e577d383370f810315f586.1665155947.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.25.1
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

As serial communication requires a clock signal, the High Speed Serial
Communication Interfaces with FIFO (HSCIF) are clocked by a clock that
is not affected by Spread Spectrum or Fractional Multiplication.

Hence change the clock input for the HSCIF0 Baud Rate Generator internal
clock from the S0D3_PER clock to the SASYNCPERD1 clock (which has the
same clock rate), cfr. R-Car V4H Hardware User's Manual rev. 0.54.

Fixes: 987da486d84a5643 ("arm64: dts: renesas: Add Renesas R8A779G0 SoC support")
Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
For full proper operation, this depends on "[PATCH 1/5] clk: renesas:
r8a779g0: Add SASYNCPER clocks"[1].
However, as the "brg_int" clock is optional, the serial driver will keep
on functioning without it, and just resort to a less optimal clock
input/divider combination, which is still good enough for the serial
console.

[1] https://lore.kernel.org/r/d0f35c35e1f96c5a649ab477e7ba5d8025957cd0.1665147497.git.geert+renesas@glider.be
---
 arch/arm64/boot/dts/renesas/r8a779g0.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/renesas/r8a779g0.dtsi b/arch/arm64/boot/dts/renesas/r8a779g0.dtsi
index edabd1519ccc979d..c941054f4980667b 100644
--- a/arch/arm64/boot/dts/renesas/r8a779g0.dtsi
+++ b/arch/arm64/boot/dts/renesas/r8a779g0.dtsi
@@ -360,7 +360,7 @@ hscif0: serial@e6540000 {
 			reg = <0 0xe6540000 0 96>;
 			interrupts = <GIC_SPI 246 IRQ_TYPE_LEVEL_HIGH>;
 			clocks = <&cpg CPG_MOD 514>,
-				 <&cpg CPG_CORE R8A779G0_CLK_S0D3_PER>,
+				 <&cpg CPG_CORE R8A779G0_CLK_SASYNCPERD1>,
 				 <&scif_clk>;
 			clock-names = "fck", "brg_int", "scif_clk";
 			dmas = <&dmac0 0x31>, <&dmac0 0x30>,
-- 
2.25.1

