Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E42CC617FA6
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  3 Nov 2022 15:34:56 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229742AbiKCOey (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 3 Nov 2022 10:34:54 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54642 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229791AbiKCOew (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 3 Nov 2022 10:34:52 -0400
Received: from mail.zeus03.de (www.zeus03.de [194.117.254.33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B572A2701
        for <linux-renesas-soc@vger.kernel.org>; Thu,  3 Nov 2022 07:34:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple; d=sang-engineering.com; h=
        from:to:cc:subject:date:message-id:in-reply-to:references
        :mime-version:content-transfer-encoding; s=k1; bh=WgpyQzvr/iVtCc
        QvH06d6ZLQFZzfM2/Vc6C5Mt41riw=; b=fxKNXBAX+oOWtRbztVdE8yhQVQtymA
        oL04VFqSayE/+cRXSwwljt3z2Y1RIMhYha8FSzio3Fz0cFkqXlYPIPiIj/vswVdO
        hO18GW942tZjYFhHfLfZRHzNDsRz4yA32bScU6O40VYNJuxeY0faiF3op7b+KGao
        IvWNC7z83iOnU=
Received: (qmail 2669755 invoked from network); 3 Nov 2022 15:34:49 +0100
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 3 Nov 2022 15:34:49 +0100
X-UD-Smtp-Session: l3s3148p1@RC7925HsWrUujns0
From:   Wolfram Sang <wsa+renesas@sang-engineering.com>
To:     linux-renesas-soc@vger.kernel.org
Cc:     Geert Uytterhoeven <geert+renesas@glider.be>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>
Subject: [PATCH 3/4] arm64: dts: renesas: r8a779f0: Fix HSCIF "brg_int" clock
Date:   Thu,  3 Nov 2022 15:34:39 +0100
Message-Id: <20221103143440.46449-4-wsa+renesas@sang-engineering.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20221103143440.46449-1-wsa+renesas@sang-engineering.com>
References: <20221103143440.46449-1-wsa+renesas@sang-engineering.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-1.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FORGED_SPF_HELO,
        RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_PASS,SPF_NONE
        autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

As serial communication requires a clock signal, the High Speed Serial
Communication Interfaces with FIFO (HSCIF) are clocked by a clock that
is not affected by Spread Spectrum or Fractional Multiplication.

Hence change the clock input for the HSCIF Baud Rate Generator internal
clock from the S0D3_PER clock to the SASYNCPERD1 clock (which has the
same clock rate), cfr. R-Car S4-8 Hardware User's Manual rev. 0.81.

Fixes: 01a787f78bfd ("arm64: dts: renesas: r8a779f0: Add HSCIF nodes")
Reported-by: Geert Uytterhoeven <geert+renesas@glider.be>
Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
---
 arch/arm64/boot/dts/renesas/r8a779f0.dtsi | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/arch/arm64/boot/dts/renesas/r8a779f0.dtsi b/arch/arm64/boot/dts/renesas/r8a779f0.dtsi
index c2f152bcf10e..3be577dc9a93 100644
--- a/arch/arm64/boot/dts/renesas/r8a779f0.dtsi
+++ b/arch/arm64/boot/dts/renesas/r8a779f0.dtsi
@@ -577,7 +577,7 @@ hscif0: serial@e6540000 {
 			reg = <0 0xe6540000 0 0x60>;
 			interrupts = <GIC_SPI 245 IRQ_TYPE_LEVEL_HIGH>;
 			clocks = <&cpg CPG_MOD 514>,
-				 <&cpg CPG_CORE R8A779F0_CLK_S0D3>,
+				 <&cpg CPG_CORE R8A779F0_CLK_SASYNCPERD1>,
 				 <&scif_clk>;
 			clock-names = "fck", "brg_int", "scif_clk";
 			dmas = <&dmac0 0x31>, <&dmac0 0x30>,
@@ -594,7 +594,7 @@ hscif1: serial@e6550000 {
 			reg = <0 0xe6550000 0 0x60>;
 			interrupts = <GIC_SPI 246 IRQ_TYPE_LEVEL_HIGH>;
 			clocks = <&cpg CPG_MOD 515>,
-				 <&cpg CPG_CORE R8A779F0_CLK_S0D3>,
+				 <&cpg CPG_CORE R8A779F0_CLK_SASYNCPERD1>,
 				 <&scif_clk>;
 			clock-names = "fck", "brg_int", "scif_clk";
 			dmas = <&dmac0 0x33>, <&dmac0 0x32>,
@@ -611,7 +611,7 @@ hscif2: serial@e6560000 {
 			reg = <0 0xe6560000 0 0x60>;
 			interrupts = <GIC_SPI 247 IRQ_TYPE_LEVEL_HIGH>;
 			clocks = <&cpg CPG_MOD 516>,
-				 <&cpg CPG_CORE R8A779F0_CLK_S0D3>,
+				 <&cpg CPG_CORE R8A779F0_CLK_SASYNCPERD1>,
 				 <&scif_clk>;
 			clock-names = "fck", "brg_int", "scif_clk";
 			dmas = <&dmac0 0x35>, <&dmac0 0x34>,
@@ -628,7 +628,7 @@ hscif3: serial@e66a0000 {
 			reg = <0 0xe66a0000 0 0x60>;
 			interrupts = <GIC_SPI 248 IRQ_TYPE_LEVEL_HIGH>;
 			clocks = <&cpg CPG_MOD 517>,
-				 <&cpg CPG_CORE R8A779F0_CLK_S0D3>,
+				 <&cpg CPG_CORE R8A779F0_CLK_SASYNCPERD1>,
 				 <&scif_clk>;
 			clock-names = "fck", "brg_int", "scif_clk";
 			dmas = <&dmac0 0x37>, <&dmac0 0x36>,
-- 
2.35.1

