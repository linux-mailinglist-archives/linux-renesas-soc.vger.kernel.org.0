Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 45412617FA4
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  3 Nov 2022 15:34:56 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229935AbiKCOex (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 3 Nov 2022 10:34:53 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54644 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229600AbiKCOew (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 3 Nov 2022 10:34:52 -0400
Received: from mail.zeus03.de (www.zeus03.de [194.117.254.33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 336EAE0E1
        for <linux-renesas-soc@vger.kernel.org>; Thu,  3 Nov 2022 07:34:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple; d=sang-engineering.com; h=
        from:to:cc:subject:date:message-id:in-reply-to:references
        :mime-version:content-transfer-encoding; s=k1; bh=f82GwmJB3R5DIv
        44ipDu5wGr6AZlM2NxhIGCII4DEt0=; b=3T9jza9owHoam3vCv98kwbfH3kZQm+
        ED5g/qwlF0lVIY5aEfIQhodv4ZKDRQsew0tlaReyLM0xkxMYCGPn8fHR0FwRz2+G
        RpbAudQCOss2Q0rjoTTYDQwSlNi8Zcc1An09Qyb/4EvrFgjzLu/3ZWl98O9OQqbM
        UkKXCdtQer3+k=
Received: (qmail 2669780 invoked from network); 3 Nov 2022 15:34:49 +0100
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 3 Nov 2022 15:34:49 +0100
X-UD-Smtp-Session: l3s3148p1@db8E3JHsJOoujns0
From:   Wolfram Sang <wsa+renesas@sang-engineering.com>
To:     linux-renesas-soc@vger.kernel.org
Cc:     Geert Uytterhoeven <geert+renesas@glider.be>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>
Subject: [PATCH 4/4] arm64: dts: renesas: r8a779f0: Fix SCIF "brg_int" clock
Date:   Thu,  3 Nov 2022 15:34:40 +0100
Message-Id: <20221103143440.46449-5-wsa+renesas@sang-engineering.com>
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

As serial communication requires a clock signal, the Serial
Communication Interfaces with FIFO (SCIF) are clocked by a clock that
is not affected by Spread Spectrum or Fractional Multiplication.

Hence change the clock input for the SCIF Baud Rate Generator internal
clock from the S0D3_PER clock to the SASYNCPERD1 clock (which has the
same clock rate), cfr. R-Car S4-8 Hardware User's Manual rev. 0.81.

Fixes: c62331e8222f ("arm64: dts: renesas: Add Renesas R8A779F0 SoC support")
Fixes: 40753144256b ("arm64: dts: renesas: r8a779f0: Add SCIF nodes")
Reported-by: Geert Uytterhoeven <geert+renesas@glider.be>
Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
---
 arch/arm64/boot/dts/renesas/r8a779f0.dtsi | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/arch/arm64/boot/dts/renesas/r8a779f0.dtsi b/arch/arm64/boot/dts/renesas/r8a779f0.dtsi
index 3be577dc9a93..4092c0016035 100644
--- a/arch/arm64/boot/dts/renesas/r8a779f0.dtsi
+++ b/arch/arm64/boot/dts/renesas/r8a779f0.dtsi
@@ -657,7 +657,7 @@ scif0: serial@e6e60000 {
 			reg = <0 0xe6e60000 0 64>;
 			interrupts = <GIC_SPI 249 IRQ_TYPE_LEVEL_HIGH>;
 			clocks = <&cpg CPG_MOD 702>,
-				 <&cpg CPG_CORE R8A779F0_CLK_S0D3_PER>,
+				 <&cpg CPG_CORE R8A779F0_CLK_SASYNCPERD1>,
 				 <&scif_clk>;
 			clock-names = "fck", "brg_int", "scif_clk";
 			dmas = <&dmac0 0x51>, <&dmac0 0x50>,
@@ -674,7 +674,7 @@ scif1: serial@e6e68000 {
 			reg = <0 0xe6e68000 0 64>;
 			interrupts = <GIC_SPI 250 IRQ_TYPE_LEVEL_HIGH>;
 			clocks = <&cpg CPG_MOD 703>,
-				 <&cpg CPG_CORE R8A779F0_CLK_S0D3_PER>,
+				 <&cpg CPG_CORE R8A779F0_CLK_SASYNCPERD1>,
 				 <&scif_clk>;
 			clock-names = "fck", "brg_int", "scif_clk";
 			dmas = <&dmac0 0x53>, <&dmac0 0x52>,
@@ -691,7 +691,7 @@ scif3: serial@e6c50000 {
 			reg = <0 0xe6c50000 0 64>;
 			interrupts = <GIC_SPI 252 IRQ_TYPE_LEVEL_HIGH>;
 			clocks = <&cpg CPG_MOD 704>,
-				 <&cpg CPG_CORE R8A779F0_CLK_S0D3_PER>,
+				 <&cpg CPG_CORE R8A779F0_CLK_SASYNCPERD1>,
 				 <&scif_clk>;
 			clock-names = "fck", "brg_int", "scif_clk";
 			dmas = <&dmac0 0x57>, <&dmac0 0x56>,
@@ -708,7 +708,7 @@ scif4: serial@e6c40000 {
 			reg = <0 0xe6c40000 0 64>;
 			interrupts = <GIC_SPI 253 IRQ_TYPE_LEVEL_HIGH>;
 			clocks = <&cpg CPG_MOD 705>,
-				 <&cpg CPG_CORE R8A779F0_CLK_S0D3_PER>,
+				 <&cpg CPG_CORE R8A779F0_CLK_SASYNCPERD1>,
 				 <&scif_clk>;
 			clock-names = "fck", "brg_int", "scif_clk";
 			dmas = <&dmac0 0x59>, <&dmac0 0x58>,
-- 
2.35.1

