Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 785A5DF92
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 29 Apr 2019 11:36:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727525AbfD2Jgw (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 29 Apr 2019 05:36:52 -0400
Received: from xavier.telenet-ops.be ([195.130.132.52]:41466 "EHLO
        xavier.telenet-ops.be" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727774AbfD2Jgn (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 29 Apr 2019 05:36:43 -0400
Received: from ramsan ([84.194.111.163])
        by xavier.telenet-ops.be with bizsmtp
        id 69cd2000G3XaVaC019cdVz; Mon, 29 Apr 2019 11:36:40 +0200
Received: from rox.of.borg ([192.168.97.57])
        by ramsan with esmtp (Exim 4.90_1)
        (envelope-from <geert@linux-m68k.org>)
        id 1hL2iD-0000wf-3R; Mon, 29 Apr 2019 11:36:37 +0200
Received: from geert by rox.of.borg with local (Exim 4.90_1)
        (envelope-from <geert@linux-m68k.org>)
        id 1hL2iD-0002p2-2E; Mon, 29 Apr 2019 11:36:37 +0200
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
Subject: [PATCH 1/5] dt-bindings: interrupt-controller: Add Renesas RZ/A1 Interrupt Controller
Date:   Mon, 29 Apr 2019 11:36:27 +0200
Message-Id: <20190429093631.10799-2-geert+renesas@glider.be>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190429093631.10799-1-geert+renesas@glider.be>
References: <20190429093631.10799-1-geert+renesas@glider.be>
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Add DT bindings for the Renesas RZ/A1 Interrupt Controller.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
 .../renesas,rza1-irqc.txt                     | 27 +++++++++++++++++++
 1 file changed, 27 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/interrupt-controller/renesas,rza1-irqc.txt

diff --git a/Documentation/devicetree/bindings/interrupt-controller/renesas,rza1-irqc.txt b/Documentation/devicetree/bindings/interrupt-controller/renesas,rza1-irqc.txt
new file mode 100644
index 0000000000000000..0914d3d216c3bdac
--- /dev/null
+++ b/Documentation/devicetree/bindings/interrupt-controller/renesas,rza1-irqc.txt
@@ -0,0 +1,27 @@
+DT bindings for the Renesas RZ/A1 Interrupt Controller
+
+The RZ/A1 Interrupt Controller is a front-end for the GIC found on Renesas
+RZ/A1 SoCs:
+  - IRQ sense select for 8 external interrupts, 1:1-mapped to 8 GIC SPI
+    interrupts,
+  - NMI edge select.
+
+Required properties:
+  - compatible: Must be "renesas,<soctype>-irqc", and "renesas,rza1-irqc" as
+		fallback.
+		Examples with soctypes are:
+		  - "renesas,r7s72100-irqc" (RZ/A1H)
+  - #interrupt-cells: Must be 2 (an interrupt index and flags, as defined
+				 in interrupts.txt in this directory)
+  - interrupt-controller: Marks the device as an interrupt controller
+  - reg: Base address and length of the memory resource used by the interrupt
+         controller
+
+Example:
+
+	irqc: interrupt-controller@fcfef800 {
+		compatible = "renesas,r7s72100-irqc", "renesas,rza1-irqc";
+		#interrupt-cells = <2>;
+		interrupt-controller;
+		reg = <0xfcfef800 0x6>;
+	};
-- 
2.17.1

