Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 049055FC11A
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 12 Oct 2022 09:12:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229729AbiJLHMv (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 12 Oct 2022 03:12:51 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56626 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229733AbiJLHMp (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 12 Oct 2022 03:12:45 -0400
Received: from xavier.telenet-ops.be (xavier.telenet-ops.be [IPv6:2a02:1800:120:4::f00:14])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D006BAD9B7
        for <linux-renesas-soc@vger.kernel.org>; Wed, 12 Oct 2022 00:12:39 -0700 (PDT)
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed50:3da6:62e6:8ab0:ff90])
        by xavier.telenet-ops.be with bizsmtp
        id WvCd2800c32x5mf01vCdY5; Wed, 12 Oct 2022 09:12:38 +0200
Received: from rox.of.borg ([192.168.97.57])
        by ramsan.of.borg with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
        (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1oiVuv-001M7a-AP; Wed, 12 Oct 2022 09:12:37 +0200
Received: from geert by rox.of.borg with local (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1oiVuu-007fp7-SJ; Wed, 12 Oct 2022 09:12:36 +0200
From:   Geert Uytterhoeven <geert+renesas@glider.be>
To:     Magnus Damm <magnus.damm@gmail.com>
Cc:     Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>,
        linux-renesas-soc@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH 1/2] arm64: dts: renesas: r8a779g0: Add SDHI node
Date:   Wed, 12 Oct 2022 09:12:33 +0200
Message-Id: <d2d5cf982a380699483edf7a632441628ee73183.1665558371.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1665558371.git.geert+renesas@glider.be>
References: <cover.1665558371.git.geert+renesas@glider.be>
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

Add a device node for the SD Card/MMC Interface on the Renesas R-Car V4H
(R8A779G0) SoC.

Based on a patch in the BSP by Takeshi Kihara.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
Changes compared to the BSP:
  - Add "clkh" clock and clock-names property.
---
 arch/arm64/boot/dts/renesas/r8a779g0.dtsi | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/arch/arm64/boot/dts/renesas/r8a779g0.dtsi b/arch/arm64/boot/dts/renesas/r8a779g0.dtsi
index ea96ed20906b9e12..33d9df39a9cc7149 100644
--- a/arch/arm64/boot/dts/renesas/r8a779g0.dtsi
+++ b/arch/arm64/boot/dts/renesas/r8a779g0.dtsi
@@ -907,6 +907,20 @@ dmac1: dma-controller@e7351000 {
 			dma-channels = <16>;
 		};
 
+		mmc0: mmc@ee140000 {
+			compatible = "renesas,sdhi-r8a779g0",
+				     "renesas,rcar-gen4-sdhi";
+			reg = <0 0xee140000 0 0x2000>;
+			interrupts = <GIC_SPI 440 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&cpg CPG_MOD 706>,
+				 <&cpg CPG_CORE R8A779G0_CLK_SD0H>;
+			clock-names = "core", "clkh";
+			power-domains = <&sysc R8A779G0_PD_ALWAYS_ON>;
+			resets = <&cpg 706>;
+			max-frequency = <200000000>;
+			status = "disabled";
+		};
+
 		gic: interrupt-controller@f1000000 {
 			compatible = "arm,gic-v3";
 			#interrupt-cells = <3>;
-- 
2.25.1

