Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7DB6026DCC8
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 17 Sep 2020 15:28:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726770AbgIQN2v (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 17 Sep 2020 09:28:51 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49224 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726794AbgIQN2u (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 17 Sep 2020 09:28:50 -0400
Received: from xavier.telenet-ops.be (xavier.telenet-ops.be [IPv6:2a02:1800:120:4::f00:14])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 20552C06174A
        for <linux-renesas-soc@vger.kernel.org>; Thu, 17 Sep 2020 06:21:22 -0700 (PDT)
Received: from ramsan ([84.195.186.194])
        by xavier.telenet-ops.be with bizsmtp
        id V1MK2300Z4C55Sk011MKYu; Thu, 17 Sep 2020 15:21:20 +0200
Received: from rox.of.borg ([192.168.97.57])
        by ramsan with esmtp (Exim 4.90_1)
        (envelope-from <geert@linux-m68k.org>)
        id 1kItqh-0000kO-R9; Thu, 17 Sep 2020 15:21:19 +0200
Received: from geert by rox.of.borg with local (Exim 4.90_1)
        (envelope-from <geert@linux-m68k.org>)
        id 1kItqh-0002EJ-Q9; Thu, 17 Sep 2020 15:21:19 +0200
From:   Geert Uytterhoeven <geert+renesas@glider.be>
To:     Magnus Damm <magnus.damm@gmail.com>
Cc:     linux-renesas-soc@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH 2/2] arm64: dts: renesas: r8a774c0: Fix MSIOF1 DMA channels
Date:   Thu, 17 Sep 2020 15:21:17 +0200
Message-Id: <20200917132117.8515-3-geert+renesas@glider.be>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200917132117.8515-1-geert+renesas@glider.be>
References: <20200917132117.8515-1-geert+renesas@glider.be>
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

According to Technical Update TN-RCT-S0352A/E, MSIOF1 DMA can only be
used with SYS-DMAC0 on R-Car E3.

Fixes: 62c0056f1c3eb15d ("arm64: dts: renesas: r8a774c0: Add MSIOF nodes")
Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
 arch/arm64/boot/dts/renesas/r8a774c0.dtsi | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/arch/arm64/boot/dts/renesas/r8a774c0.dtsi b/arch/arm64/boot/dts/renesas/r8a774c0.dtsi
index a51d3a36a4d3dc9c..e0e54342cd4c77d4 100644
--- a/arch/arm64/boot/dts/renesas/r8a774c0.dtsi
+++ b/arch/arm64/boot/dts/renesas/r8a774c0.dtsi
@@ -1215,9 +1215,8 @@
 			reg = <0 0xe6ea0000 0 0x0064>;
 			interrupts = <GIC_SPI 157 IRQ_TYPE_LEVEL_HIGH>;
 			clocks = <&cpg CPG_MOD 210>;
-			dmas = <&dmac1 0x43>, <&dmac1 0x42>,
-			       <&dmac2 0x43>, <&dmac2 0x42>;
-			dma-names = "tx", "rx", "tx", "rx";
+			dmas = <&dmac0 0x43>, <&dmac0 0x42>;
+			dma-names = "tx", "rx";
 			power-domains = <&sysc R8A774C0_PD_ALWAYS_ON>;
 			resets = <&cpg 210>;
 			#address-cells = <1>;
-- 
2.17.1

