Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 13BBB4E2D7
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 21 Jun 2019 11:14:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726509AbfFUJN7 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 21 Jun 2019 05:13:59 -0400
Received: from kirsty.vergenet.net ([202.4.237.240]:33940 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726518AbfFUJN7 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 21 Jun 2019 05:13:59 -0400
Received: from reginn.horms.nl (watermunt.horms.nl [80.127.179.77])
        by kirsty.vergenet.net (Postfix) with ESMTPA id A849B25BE01;
        Fri, 21 Jun 2019 19:13:52 +1000 (AEST)
Received: by reginn.horms.nl (Postfix, from userid 7100)
        id B0EB1940ACC; Fri, 21 Jun 2019 11:13:50 +0200 (CEST)
From:   Simon Horman <horms+renesas@verge.net.au>
To:     linux-renesas-soc@vger.kernel.org
Cc:     linux-arm-kernel@lists.infradead.org,
        Magnus Damm <magnus.damm@gmail.com>,
        Chris Brandt <chris.brandt@renesas.com>,
        Simon Horman <horms+renesas@verge.net.au>
Subject: [PATCH 04/22] ARM: dts: r7s9210: Add SDHI support
Date:   Fri, 21 Jun 2019 11:13:31 +0200
Message-Id: <a49f76cddaee89ffe7e72cf6e38c3635b97058b8.1561104194.git.horms+renesas@verge.net.au>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <cover.1561104194.git.horms+renesas@verge.net.au>
References: <cover.1561104194.git.horms+renesas@verge.net.au>
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

From: Chris Brandt <chris.brandt@renesas.com>

Add SDHI support for the R7S9210 (RZ/A2) SoC.

Signed-off-by: Chris Brandt <chris.brandt@renesas.com>
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
Signed-off-by: Simon Horman <horms+renesas@verge.net.au>
---
 arch/arm/boot/dts/r7s9210.dtsi | 24 ++++++++++++++++++++++++
 1 file changed, 24 insertions(+)

diff --git a/arch/arm/boot/dts/r7s9210.dtsi b/arch/arm/boot/dts/r7s9210.dtsi
index 1cd982c9920f..2eaa5eeba509 100644
--- a/arch/arm/boot/dts/r7s9210.dtsi
+++ b/arch/arm/boot/dts/r7s9210.dtsi
@@ -322,6 +322,30 @@
 			status = "disabled";
 		};
 
+		sdhi0: sd@e8228000 {
+			compatible = "renesas,sdhi-r7s9210";
+			reg = <0xe8228000 0x8c0>;
+			interrupts = <GIC_SPI 322 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&cpg CPG_MOD 103>, <&cpg CPG_MOD 102>;
+			clock-names = "core", "cd";
+			power-domains = <&cpg>;
+			cap-sd-highspeed;
+			cap-sdio-irq;
+			status = "disabled";
+		};
+
+		sdhi1: sd@e822a000 {
+			compatible = "renesas,sdhi-r7s9210";
+			reg = <0xe822a000 0x8c0>;
+			interrupts = <GIC_SPI 324 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&cpg CPG_MOD 101>, <&cpg CPG_MOD 100>;
+			clock-names = "core", "cd";
+			power-domains = <&cpg>;
+			cap-sd-highspeed;
+			cap-sdio-irq;
+			status = "disabled";
+		};
+
 		gic: interrupt-controller@e8221000 {
 			compatible = "arm,gic-400";
 			#interrupt-cells = <3>;
-- 
2.11.0

