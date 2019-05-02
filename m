Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5D54D11924
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  2 May 2019 14:33:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726562AbfEBMct (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 2 May 2019 08:32:49 -0400
Received: from albert.telenet-ops.be ([195.130.137.90]:56512 "EHLO
        albert.telenet-ops.be" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726455AbfEBMc1 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 2 May 2019 08:32:27 -0400
Received: from ramsan ([84.194.111.163])
        by albert.telenet-ops.be with bizsmtp
        id 7QYP200013XaVaC06QYPKk; Thu, 02 May 2019 14:32:26 +0200
Received: from rox.of.borg ([192.168.97.57])
        by ramsan with esmtp (Exim 4.90_1)
        (envelope-from <geert@linux-m68k.org>)
        id 1hMAsw-0007e4-Ul; Thu, 02 May 2019 14:32:22 +0200
Received: from geert by rox.of.borg with local (Exim 4.90_1)
        (envelope-from <geert@linux-m68k.org>)
        id 1hMAsw-0000ng-Sk; Thu, 02 May 2019 14:32:22 +0200
From:   Geert Uytterhoeven <geert+renesas@glider.be>
To:     Thomas Gleixner <tglx@linutronix.de>,
        Jason Cooper <jason@lakedaemon.net>,
        Marc Zyngier <marc.zyngier@arm.com>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Simon Horman <horms@verge.net.au>,
        Magnus Damm <magnus.damm@gmail.com>,
        Chris Brandt <chris.brandt@renesas.com>
Cc:     devicetree@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH v3 4/5] ARM: dts: r7s72100: Add IRQC device node
Date:   Thu,  2 May 2019 14:32:19 +0200
Message-Id: <20190502123220.3016-5-geert+renesas@glider.be>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190502123220.3016-1-geert+renesas@glider.be>
References: <20190502123220.3016-1-geert+renesas@glider.be>
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Enable support for the IRQC on RZ/A1H, which is a small front-end to the
GIC.  This allows to use up to 8 external interrupts with configurable
sense select.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
Reviewed-by: Simon Horman <horms+renesas@verge.net.au>
---
v3:
  - Use interrupt-map (+ #address-cells and interrupt-map-mask) instead
    of renesas,gic-spi-base,

v2:
  - Add Reviewed-by,
  - Add "renesas,gic-spi-base".
---
 arch/arm/boot/dts/r7s72100.dtsi | 19 +++++++++++++++++++
 1 file changed, 19 insertions(+)

diff --git a/arch/arm/boot/dts/r7s72100.dtsi b/arch/arm/boot/dts/r7s72100.dtsi
index 2211f88ede2ad351..d03dcd919d6f5cfb 100644
--- a/arch/arm/boot/dts/r7s72100.dtsi
+++ b/arch/arm/boot/dts/r7s72100.dtsi
@@ -670,6 +670,25 @@
 			status = "disabled";
 		};
 
+		irqc: interrupt-controller@fcfef800 {
+			compatible = "renesas,r7s72100-irqc",
+				     "renesas,rza1-irqc";
+			#interrupt-cells = <2>;
+			#address-cells = <0>;
+			interrupt-controller;
+			reg = <0xfcfef800 0x6>;
+			interrupt-map =
+				<0 0 &gic GIC_SPI 0 IRQ_TYPE_LEVEL_HIGH>,
+				<1 0 &gic GIC_SPI 1 IRQ_TYPE_LEVEL_HIGH>,
+				<2 0 &gic GIC_SPI 2 IRQ_TYPE_LEVEL_HIGH>,
+				<3 0 &gic GIC_SPI 3 IRQ_TYPE_LEVEL_HIGH>,
+				<4 0 &gic GIC_SPI 4 IRQ_TYPE_LEVEL_HIGH>,
+				<5 0 &gic GIC_SPI 5 IRQ_TYPE_LEVEL_HIGH>,
+				<6 0 &gic GIC_SPI 6 IRQ_TYPE_LEVEL_HIGH>,
+				<7 0 &gic GIC_SPI 7 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-map-mask = <7 0>;
+		};
+
 		mtu2: timer@fcff0000 {
 			compatible = "renesas,mtu2-r7s72100", "renesas,mtu2";
 			reg = <0xfcff0000 0x400>;
-- 
2.17.1

