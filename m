Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id CB4DBF88E
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 30 Apr 2019 14:13:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727387AbfD3MNV (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 30 Apr 2019 08:13:21 -0400
Received: from laurent.telenet-ops.be ([195.130.137.89]:35798 "EHLO
        laurent.telenet-ops.be" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727384AbfD3MNG (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 30 Apr 2019 08:13:06 -0400
Received: from ramsan ([84.194.111.163])
        by laurent.telenet-ops.be with bizsmtp
        id 6cCz2000v3XaVaC01cD0XN; Tue, 30 Apr 2019 14:13:04 +0200
Received: from rox.of.borg ([192.168.97.57])
        by ramsan with esmtp (Exim 4.90_1)
        (envelope-from <geert@linux-m68k.org>)
        id 1hLRd5-00086c-SV; Tue, 30 Apr 2019 14:12:59 +0200
Received: from geert by rox.of.borg with local (Exim 4.90_1)
        (envelope-from <geert@linux-m68k.org>)
        id 1hLRd5-0000zK-PK; Tue, 30 Apr 2019 14:12:59 +0200
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
Subject: [PATCH v2 4/5] ARM: dts: r7s72100: Add IRQC device node
Date:   Tue, 30 Apr 2019 14:12:53 +0200
Message-Id: <20190430121254.3737-5-geert+renesas@glider.be>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190430121254.3737-1-geert+renesas@glider.be>
References: <20190430121254.3737-1-geert+renesas@glider.be>
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
v2:
  - Add Reviewed-by,
  - Add "renesas,gic-spi-base".
---
 arch/arm/boot/dts/r7s72100.dtsi | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/arch/arm/boot/dts/r7s72100.dtsi b/arch/arm/boot/dts/r7s72100.dtsi
index 2211f88ede2ad351..52855db63a60580c 100644
--- a/arch/arm/boot/dts/r7s72100.dtsi
+++ b/arch/arm/boot/dts/r7s72100.dtsi
@@ -670,6 +670,15 @@
 			status = "disabled";
 		};
 
+		irqc: interrupt-controller@fcfef800 {
+			compatible = "renesas,r7s72100-irqc",
+				     "renesas,rza1-irqc";
+			#interrupt-cells = <2>;
+			interrupt-controller;
+			reg = <0xfcfef800 0x6>;
+			renesas,gic-spi-base = <0>;
+		};
+
 		mtu2: timer@fcff0000 {
 			compatible = "renesas,mtu2-r7s72100", "renesas,mtu2";
 			reg = <0xfcff0000 0x400>;
-- 
2.17.1

