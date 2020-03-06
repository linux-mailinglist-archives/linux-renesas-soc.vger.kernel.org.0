Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id EA2DF17B8DC
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  6 Mar 2020 10:00:58 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725959AbgCFJA6 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 6 Mar 2020 04:00:58 -0500
Received: from baptiste.telenet-ops.be ([195.130.132.51]:44260 "EHLO
        baptiste.telenet-ops.be" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725951AbgCFJA5 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 6 Mar 2020 04:00:57 -0500
Received: from ramsan ([84.195.182.253])
        by baptiste.telenet-ops.be with bizsmtp
        id Ax0r2200v5USYZQ01x0rkt; Fri, 06 Mar 2020 10:00:54 +0100
Received: from rox.of.borg ([192.168.97.57])
        by ramsan with esmtp (Exim 4.90_1)
        (envelope-from <geert@linux-m68k.org>)
        id 1jA8qh-0002iw-Ov; Fri, 06 Mar 2020 10:00:51 +0100
Received: from geert by rox.of.borg with local (Exim 4.90_1)
        (envelope-from <geert@linux-m68k.org>)
        id 1jA8qh-0002KB-Mc; Fri, 06 Mar 2020 10:00:51 +0100
From:   Geert Uytterhoeven <geert+renesas@glider.be>
To:     Rob Herring <robh+dt@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     Johan Hovold <johan@kernel.org>,
        "David S . Miller" <davem@davemloft.net>,
        Sean Wang <sean.wang@mediatek.com>,
        Shawn Guo <shawnguo@kernel.org>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        devicetree@vger.kernel.org, linux-serial@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH v2 1/2] dt-bindings: serial: Convert generic bindings to json-schema
Date:   Fri,  6 Mar 2020 10:00:45 +0100
Message-Id: <20200306090046.8890-2-geert+renesas@glider.be>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200306090046.8890-1-geert+renesas@glider.be>
References: <20200306090046.8890-1-geert+renesas@glider.be>
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Convert the generic serial interface Device Tree binding documentation
to json-schema.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
v2:
  - Update references to serial.txt,
  - Fix nodename pattern,
  - Add missing maxItems to *-gpios,
  - Express that uart-has-rtscts and [cr]ts-gpios are
    mutually-exclusive,
  - Drop examples.
---
 .../bindings/serial/fsl-imx-uart.txt          |  2 +-
 .../bindings/serial/renesas,sci-serial.txt    |  4 +-
 .../devicetree/bindings/serial/serial.txt     | 56 ---------------
 .../devicetree/bindings/serial/serial.yaml    | 71 +++++++++++++++++++
 4 files changed, 74 insertions(+), 59 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/serial/serial.txt
 create mode 100644 Documentation/devicetree/bindings/serial/serial.yaml

diff --git a/Documentation/devicetree/bindings/serial/fsl-imx-uart.txt b/Documentation/devicetree/bindings/serial/fsl-imx-uart.txt
index 35957cbf1571e4f6..556ad11c632fa628 100644
--- a/Documentation/devicetree/bindings/serial/fsl-imx-uart.txt
+++ b/Documentation/devicetree/bindings/serial/fsl-imx-uart.txt
@@ -15,7 +15,7 @@ Optional properties:
   the transceiver is actually CTS_B, not RTS_B. CTS_B is always output,
   and RTS_B is input, regardless of dte-mode.
 
-Please check Documentation/devicetree/bindings/serial/serial.txt
+Please check Documentation/devicetree/bindings/serial/serial.yaml
 for the complete list of generic properties.
 
 Note: Each uart controller should have an alias correctly numbered
diff --git a/Documentation/devicetree/bindings/serial/renesas,sci-serial.txt b/Documentation/devicetree/bindings/serial/renesas,sci-serial.txt
index a5edf4b70c7ab657..5816e7d739f618e4 100644
--- a/Documentation/devicetree/bindings/serial/renesas,sci-serial.txt
+++ b/Documentation/devicetree/bindings/serial/renesas,sci-serial.txt
@@ -128,9 +128,9 @@ Optional properties:
 	  transmission, and one for reception.
   - dma-names: Must contain a list of two DMA names, "tx" and "rx".
   - {cts,dsr,dcd,rng,rts,dtr}-gpios: Specify GPIOs for modem lines, cfr. the
-    generic serial DT bindings in serial.txt.
+    generic serial DT bindings in serial.yaml.
   - uart-has-rtscts: Indicates dedicated lines for RTS/CTS hardware flow
-    control, cfr. the generic serial DT bindings in serial.txt.
+    control, cfr. the generic serial DT bindings in serial.yaml.
 
 Example:
 	aliases {
diff --git a/Documentation/devicetree/bindings/serial/serial.txt b/Documentation/devicetree/bindings/serial/serial.txt
deleted file mode 100644
index 863c2893759e7151..0000000000000000
--- a/Documentation/devicetree/bindings/serial/serial.txt
+++ /dev/null
@@ -1,56 +0,0 @@
-Generic Serial DT Bindings
-
-This document lists a set of generic properties for describing UARTs in a
-device tree.  Whether these properties apply to a particular device depends on
-the DT bindings for the actual device.
-
-Optional properties:
-  - cts-gpios: Must contain a GPIO specifier, referring to the GPIO pin to be
-    used as the UART's CTS line.
-  - dcd-gpios: Must contain a GPIO specifier, referring to the GPIO pin to be
-    used as the UART's DCD line.
-  - dsr-gpios: Must contain a GPIO specifier, referring to the GPIO pin to be
-    used as the UART's DSR line.
-  - dtr-gpios: Must contain a GPIO specifier, referring to the GPIO pin to be
-    used as the UART's DTR line.
-  - rng-gpios: Must contain a GPIO specifier, referring to the GPIO pin to be
-    used as the UART's RNG line.
-  - rts-gpios: Must contain a GPIO specifier, referring to the GPIO pin to be
-    used as the UART's RTS line.
-
-  - uart-has-rtscts: The presence of this property indicates that the
-    UART has dedicated lines for RTS/CTS hardware flow control, and that
-    they are available for use (wired and enabled by pinmux configuration).
-    This depends on both the UART hardware and the board wiring.
-    Note that this property is mutually-exclusive with "cts-gpios" and
-    "rts-gpios" above, unless support is provided to switch between modes
-    dynamically.
-
-
-Examples:
-
-	uart1: serial@48022000 {
-		compatible = "ti,am3352-uart", "ti,omap3-uart";
-		ti,hwmods = "uart2";
-		clock-frequency = <48000000>;
-		reg = <0x48022000 0x2000>;
-		interrupts = <73>;
-		dmas = <&edma 28 0>, <&edma 29 0>;
-		dma-names = "tx", "rx";
-		dtr-gpios = <&gpio2 22 GPIO_ACTIVE_LOW>;
-		dsr-gpios = <&gpio2 23 GPIO_ACTIVE_LOW>;
-		dcd-gpios = <&gpio2 24 GPIO_ACTIVE_LOW>;
-		rng-gpios = <&gpio2 25 GPIO_ACTIVE_LOW>;
-		cts-gpios = <&gpio0 12 GPIO_ACTIVE_LOW>;
-		rts-gpios = <&gpio0 13 GPIO_ACTIVE_LOW>;
-	};
-
-	scifa4: serial@e6c80000 {
-		compatible = "renesas,scifa-sh73a0", "renesas,scifa";
-		reg = <0xe6c80000 0x100>;
-		interrupts = <GIC_SPI 78 IRQ_TYPE_LEVEL_HIGH>;
-		clocks = <&mstp2_clks SH73A0_CLK_SCIFA4>;
-		clock-names = "fck";
-		power-domains = <&pd_a3sp>;
-		uart-has-rtscts;
-	};
diff --git a/Documentation/devicetree/bindings/serial/serial.yaml b/Documentation/devicetree/bindings/serial/serial.yaml
new file mode 100644
index 0000000000000000..ca2ae755b560141c
--- /dev/null
+++ b/Documentation/devicetree/bindings/serial/serial.yaml
@@ -0,0 +1,71 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: "http://devicetree.org/schemas/serial/serial.yaml#"
+$schema: "http://devicetree.org/meta-schemas/core.yaml#"
+
+title: Serial Interface Generic DT Bindings
+
+maintainers:
+  - Greg Kroah-Hartman <gregkh@linuxfoundation.org>
+
+description:
+  This document lists a set of generic properties for describing UARTs in a
+  device tree.  Whether these properties apply to a particular device depends
+  on the DT bindings for the actual device.
+
+properties:
+  $nodename:
+    pattern: "^serial(@.*)?$"
+
+  cts-gpios:
+    maxItems: 1
+    description:
+      Must contain a GPIO specifier, referring to the GPIO pin to be used as
+      the UART's CTS line.
+
+  dcd-gpios:
+    maxItems: 1
+    description:
+      Must contain a GPIO specifier, referring to the GPIO pin to be used as
+      the UART's DCD line.
+
+  dsr-gpios:
+    maxItems: 1
+    description:
+      Must contain a GPIO specifier, referring to the GPIO pin to be used as
+      the UART's DSR line.
+
+  dtr-gpios:
+    maxItems: 1
+    description:
+      Must contain a GPIO specifier, referring to the GPIO pin to be used as
+      the UART's DTR line.
+
+  rng-gpios:
+    maxItems: 1
+    description:
+      Must contain a GPIO specifier, referring to the GPIO pin to be used as
+      the UART's RNG line.
+
+  rts-gpios:
+    maxItems: 1
+    description:
+      Must contain a GPIO specifier, referring to the GPIO pin to be used as
+      the UART's RTS line.
+
+  uart-has-rtscts:
+    $ref: /schemas/types.yaml#/definitions/flag
+    description:
+      The presence of this property indicates that the UART has dedicated lines
+      for RTS/CTS hardware flow control, and that they are available for use
+      (wired and enabled by pinmux configuration).  This depends on both the
+      UART hardware and the board wiring.
+
+if:
+  required:
+    - uart-has-rtscts
+then:
+  properties:
+    cts-gpios: false
+    rts-gpios: false
-- 
2.17.1

