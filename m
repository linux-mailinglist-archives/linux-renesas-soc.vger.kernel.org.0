Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D8C5326DCBC
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 17 Sep 2020 15:25:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727090AbgIQNXH (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 17 Sep 2020 09:23:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48186 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727032AbgIQNWD (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 17 Sep 2020 09:22:03 -0400
Received: from baptiste.telenet-ops.be (baptiste.telenet-ops.be [IPv6:2a02:1800:120:4::f00:13])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 29FD5C061788
        for <linux-renesas-soc@vger.kernel.org>; Thu, 17 Sep 2020 06:21:22 -0700 (PDT)
Received: from ramsan ([84.195.186.194])
        by baptiste.telenet-ops.be with bizsmtp
        id V1MK2300W4C55Sk011MKNw; Thu, 17 Sep 2020 15:21:20 +0200
Received: from rox.of.borg ([192.168.97.57])
        by ramsan with esmtp (Exim 4.90_1)
        (envelope-from <geert@linux-m68k.org>)
        id 1kItqh-0000kN-Qi; Thu, 17 Sep 2020 15:21:19 +0200
Received: from geert by rox.of.borg with local (Exim 4.90_1)
        (envelope-from <geert@linux-m68k.org>)
        id 1kItqh-0002EH-PQ; Thu, 17 Sep 2020 15:21:19 +0200
From:   Geert Uytterhoeven <geert+renesas@glider.be>
To:     Magnus Damm <magnus.damm@gmail.com>
Cc:     linux-renesas-soc@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH 1/2] arm64: dts: renesas: r8a77990: Fix MSIOF1 DMA channels
Date:   Thu, 17 Sep 2020 15:21:16 +0200
Message-Id: <20200917132117.8515-2-geert+renesas@glider.be>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200917132117.8515-1-geert+renesas@glider.be>
References: <20200917132117.8515-1-geert+renesas@glider.be>
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

According to Technical Update TN-RCT-S0352A/E, MSIOF1 DMA can only be
used with SYS-DMAC0 on R-Car E3.

Fixes: 8517042060b55a37 ("arm64: dts: renesas: r8a77990: Add DMA properties to MSIOF nodes")
Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
 arch/arm64/boot/dts/renesas/r8a77990.dtsi | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/arch/arm64/boot/dts/renesas/r8a77990.dtsi b/arch/arm64/boot/dts/renesas/r8a77990.dtsi
index 2cdf766fe3651809..87d41bc076a99d95 100644
--- a/arch/arm64/boot/dts/renesas/r8a77990.dtsi
+++ b/arch/arm64/boot/dts/renesas/r8a77990.dtsi
@@ -1193,9 +1193,8 @@
 			reg = <0 0xe6ea0000 0 0x0064>;
 			interrupts = <GIC_SPI 157 IRQ_TYPE_LEVEL_HIGH>;
 			clocks = <&cpg CPG_MOD 210>;
-			dmas = <&dmac1 0x43>, <&dmac1 0x42>,
-			       <&dmac2 0x43>, <&dmac2 0x42>;
-			dma-names = "tx", "rx", "tx", "rx";
+			dmas = <&dmac0 0x43>, <&dmac0 0x42>;
+			dma-names = "tx", "rx";
 			power-domains = <&sysc R8A77990_PD_ALWAYS_ON>;
 			resets = <&cpg 210>;
 			#address-cells = <1>;
-- 
2.17.1

