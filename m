Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id BE976F881
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 30 Apr 2019 14:13:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727594AbfD3MNF (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 30 Apr 2019 08:13:05 -0400
Received: from xavier.telenet-ops.be ([195.130.132.52]:35100 "EHLO
        xavier.telenet-ops.be" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726197AbfD3MNF (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 30 Apr 2019 08:13:05 -0400
Received: from ramsan ([84.194.111.163])
        by xavier.telenet-ops.be with bizsmtp
        id 6cCz2000k3XaVaC01cCzoq; Tue, 30 Apr 2019 14:13:03 +0200
Received: from rox.of.borg ([192.168.97.57])
        by ramsan with esmtp (Exim 4.90_1)
        (envelope-from <geert@linux-m68k.org>)
        id 1hLRd5-00086V-N4; Tue, 30 Apr 2019 14:12:59 +0200
Received: from geert by rox.of.borg with local (Exim 4.90_1)
        (envelope-from <geert@linux-m68k.org>)
        id 1hLRd5-0000zB-KS; Tue, 30 Apr 2019 14:12:59 +0200
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
Subject: [PATCH v2 1/5] dt-bindings: interrupt-controller: Add Renesas RZ/A1 Interrupt Controller
Date:   Tue, 30 Apr 2019 14:12:50 +0200
Message-Id: <20190430121254.3737-2-geert+renesas@glider.be>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190430121254.3737-1-geert+renesas@glider.be>
References: <20190430121254.3737-1-geert+renesas@glider.be>
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Add DT bindings for the Renesas RZ/A1 Interrupt Controller.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
v2:
  - Add "renesas,gic-spi-base",
  - Document RZ/A2M.
---
 .../renesas,rza1-irqc.txt                     | 30 +++++++++++++++++++
 1 file changed, 30 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/interrupt-controller/renesas,rza1-irqc.txt

diff --git a/Documentation/devicetree/bindings/interrupt-controller/renesas,rza1-irqc.txt b/Documentation/devicetree/bindings/interrupt-controller/renesas,rza1-irqc.txt
new file mode 100644
index 0000000000000000..ea8ddb6955338ccd
--- /dev/null
+++ b/Documentation/devicetree/bindings/interrupt-controller/renesas,rza1-irqc.txt
@@ -0,0 +1,30 @@
+DT bindings for the Renesas RZ/A1 Interrupt Controller
+
+The RZ/A1 Interrupt Controller is a front-end for the GIC found on Renesas
+RZ/A1 and RZ/A2 SoCs:
+  - IRQ sense select for 8 external interrupts, 1:1-mapped to 8 GIC SPI
+    interrupts,
+  - NMI edge select.
+
+Required properties:
+  - compatible: Must be "renesas,<soctype>-irqc", and "renesas,rza1-irqc" as
+		fallback.
+		Examples with soctypes are:
+		  - "renesas,r7s72100-irqc" (RZ/A1H)
+		  - "renesas,r7s9210-irqc" (RZ/A2M)
+  - #interrupt-cells: Must be 2 (an interrupt index and flags, as defined
+				 in interrupts.txt in this directory)
+  - interrupt-controller: Marks the device as an interrupt controller
+  - reg: Base address and length of the memory resource used by the interrupt
+         controller
+  - renesas,gic-spi-base: Lowest GIC SPI interrupt number this block maps to.
+
+Example:
+
+	irqc: interrupt-controller@fcfef800 {
+		compatible = "renesas,r7s72100-irqc", "renesas,rza1-irqc";
+		#interrupt-cells = <2>;
+		interrupt-controller;
+		reg = <0xfcfef800 0x6>;
+		renesas,gic-spi-base = <0>;
+	};
-- 
2.17.1

