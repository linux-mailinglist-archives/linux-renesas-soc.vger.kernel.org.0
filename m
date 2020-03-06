Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3538717B8FB
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  6 Mar 2020 10:07:37 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725959AbgCFJHf (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 6 Mar 2020 04:07:35 -0500
Received: from laurent.telenet-ops.be ([195.130.137.89]:36438 "EHLO
        laurent.telenet-ops.be" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725935AbgCFJHf (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 6 Mar 2020 04:07:35 -0500
Received: from ramsan ([84.195.182.253])
        by laurent.telenet-ops.be with bizsmtp
        id Ax7R2200T5USYZQ01x7RuK; Fri, 06 Mar 2020 10:07:27 +0100
Received: from rox.of.borg ([192.168.97.57])
        by ramsan with esmtp (Exim 4.90_1)
        (envelope-from <geert@linux-m68k.org>)
        id 1jA8x3-0002mh-M8; Fri, 06 Mar 2020 10:07:25 +0100
Received: from geert by rox.of.borg with local (Exim 4.90_1)
        (envelope-from <geert@linux-m68k.org>)
        id 1jA8x3-0002Rt-I5; Fri, 06 Mar 2020 10:07:25 +0100
From:   Geert Uytterhoeven <geert+renesas@glider.be>
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Rob Herring <robh+dt@kernel.org>
Cc:     Ulrich Hecht <uli+renesas@fpond.eu>,
        Chris Brandt <chris.brandt@renesas.com>,
        Yoshinori Sato <ysato@users.sourceforge.jp>,
        Rich Felker <dalias@libc.org>, linux-serial@vger.kernel.org,
        devicetree@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        linux-sh@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH] dt-bindings: serial: sh-sci: Convert to json-schema
Date:   Fri,  6 Mar 2020 10:07:20 +0100
Message-Id: <20200306090720.9365-1-geert+renesas@glider.be>
X-Mailer: git-send-email 2.17.1
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Convert the Renesas Serial Communication Interface ((H)SCI(F)(A|B))
Device Tree binding documentation to json-schema.

Split the bindings in 5 files, one per major type, to ease expressing
constraints.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
This depends on "[PATCH v2 1/2] dt-bindings: serial: Convert generic
bindings to json-schema".
https://lore.kernel.org/linux-devicetree/20200306090046.8890-2-geert+renesas@glider.be/
---
 .../bindings/serial/renesas,hscif.yaml        | 138 ++++++++++++++
 .../bindings/serial/renesas,sci-serial.txt    | 150 ----------------
 .../bindings/serial/renesas,sci.yaml          |  79 ++++++++
 .../bindings/serial/renesas,scif.yaml         | 168 ++++++++++++++++++
 .../bindings/serial/renesas,scifa.yaml        | 110 ++++++++++++
 .../bindings/serial/renesas,scifb.yaml        | 101 +++++++++++
 6 files changed, 596 insertions(+), 150 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/serial/renesas,hscif.yaml
 delete mode 100644 Documentation/devicetree/bindings/serial/renesas,sci-serial.txt
 create mode 100644 Documentation/devicetree/bindings/serial/renesas,sci.yaml
 create mode 100644 Documentation/devicetree/bindings/serial/renesas,scif.yaml
 create mode 100644 Documentation/devicetree/bindings/serial/renesas,scifa.yaml
 create mode 100644 Documentation/devicetree/bindings/serial/renesas,scifb.yaml

diff --git a/Documentation/devicetree/bindings/serial/renesas,hscif.yaml b/Documentation/devicetree/bindings/serial/renesas,hscif.yaml
new file mode 100644
index 0000000000000000..2af15ff7f4f24020
--- /dev/null
+++ b/Documentation/devicetree/bindings/serial/renesas,hscif.yaml
@@ -0,0 +1,138 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: "http://devicetree.org/schemas/serial/renesas,hscif.yaml#"
+$schema: "http://devicetree.org/meta-schemas/core.yaml#"
+
+title: Renesas High Speed Serial Communication Interface with FIFO (HSCIF)
+
+maintainers:
+  - Geert Uytterhoeven <geert+renesas@glider.be>
+
+description:
+  Each enabled UART may have an optional "serialN" alias in the "aliases" node,
+  where N is the port number (non-negative decimal integer) as printed on the
+  label next to the physical port.
+
+allOf:
+  - $ref: serial.yaml#
+
+properties:
+  compatible:
+    oneOf:
+      - items:
+          - enum:
+              - renesas,hscif-r8a7778      # R-Car M1
+              - renesas,hscif-r8a7779      # R-Car H1
+          - const: renesas,rcar-gen1-hscif # R-Car Gen1
+          - const: renesas,hscif           # generic HSCIF compatible UART
+
+      - items:
+          - enum:
+              - renesas,hscif-r8a7743      # RZ/G1M
+              - renesas,hscif-r8a7744      # RZ/G1N
+              - renesas,hscif-r8a7745      # RZ/G1E
+              - renesas,hscif-r8a77470     # RZ/G1C
+              - renesas,hscif-r8a7790      # R-Car H2
+              - renesas,hscif-r8a7791      # R-Car M2-W
+              - renesas,hscif-r8a7792      # R-Car V2H
+              - renesas,hscif-r8a7793      # R-Car M2-N
+              - renesas,hscif-r8a7794      # R-Car E2
+          - const: renesas,rcar-gen2-hscif # R-Car Gen2 and RZ/G1
+          - const: renesas,hscif           # generic HSCIF compatible UART
+
+      - items:
+          - enum:
+              - renesas,hscif-r8a774a1     # RZ/G2M
+              - renesas,hscif-r8a774b1     # RZ/G2N
+              - renesas,hscif-r8a774c0     # RZ/G2E
+              - renesas,hscif-r8a7795      # R-Car H3
+              - renesas,hscif-r8a7796      # R-Car M3-W
+              - renesas,hscif-r8a77961     # R-Car M3-W+
+              - renesas,hscif-r8a77965     # R-Car M3-N
+              - renesas,hscif-r8a77970     # R-Car V3M
+              - renesas,hscif-r8a77980     # R-Car V3H
+              - renesas,hscif-r8a77990     # R-Car E3
+              - renesas,hscif-r8a77995     # R-Car D3
+          - const: renesas,rcar-gen3-hscif # R-Car Gen3 and RZ/G2
+          - const: renesas,hscif           # generic HSCIF compatible UART
+
+  reg:
+    maxItems: 1
+
+  interrupts:
+    maxItems: 1
+
+  clocks:
+    minItems: 1
+    maxItems: 4
+
+  clock-names:
+    minItems: 1
+    maxItems: 4
+    items:
+      enum:
+        - fck # UART functional clock
+        - hsck # optional external clock input
+        - brg_int # optional internal clock source for BRG frequency divider
+        - scif_clk # optional external clock source for BRG frequency divider
+
+  power-domains: true
+
+  resets: true
+
+  dmas:
+    description:
+      Must contain a list of pairs of references to DMA specifiers, one for
+      transmission, and one for reception.
+
+  dma-names:
+    minItems: 2
+    maxItems: 4
+    items:
+      enum:
+        - tx
+        - rx
+
+required:
+  - compatible
+  - reg
+  - interrupts
+  - clocks
+  - clock-names
+  - power-domains
+
+if:
+  properties:
+    compatible:
+      contains:
+        enum:
+          - renesas,rcar-gen2-hscif
+          - renesas,rcar-gen3-hscif
+then:
+  required:
+    - resets
+
+examples:
+  - |
+    #include <dt-bindings/clock/r8a7795-cpg-mssr.h>
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+    #include <dt-bindings/power/r8a7795-sysc.h>
+    aliases {
+            serial1 = &hscif1;
+    };
+
+    hscif1: serial@e6550000 {
+            compatible = "renesas,hscif-r8a7795", "renesas,rcar-gen3-hscif",
+                         "renesas,hscif";
+            reg = <0xe6550000 96>;
+            interrupts = <GIC_SPI 155 IRQ_TYPE_LEVEL_HIGH>;
+            clocks = <&cpg CPG_MOD 519>, <&cpg CPG_CORE R8A7795_CLK_S3D1>,
+                     <&scif_clk>;
+            clock-names = "fck", "brg_int", "scif_clk";
+            dmas = <&dmac1 0x33>, <&dmac1 0x32>, <&dmac2 0x33>, <&dmac2 0x32>;
+            dma-names = "tx", "rx", "tx", "rx";
+            power-domains = <&sysc R8A7795_PD_ALWAYS_ON>;
+            resets = <&cpg 519>;
+            uart-has-rtscts;
+    };
diff --git a/Documentation/devicetree/bindings/serial/renesas,sci-serial.txt b/Documentation/devicetree/bindings/serial/renesas,sci-serial.txt
deleted file mode 100644
index 5816e7d739f618e4..0000000000000000
--- a/Documentation/devicetree/bindings/serial/renesas,sci-serial.txt
+++ /dev/null
@@ -1,150 +0,0 @@
-* Renesas SH-Mobile Serial Communication Interface
-
-Required properties:
-
-  - compatible: Must contain one or more of the following:
-
-    - "renesas,scif-r7s72100" for R7S72100 (RZ/A1H) SCIF compatible UART.
-    - "renesas,scif-r7s9210" for R7S9210 (RZ/A2) SCIF compatible UART.
-    - "renesas,scifa-r8a73a4" for R8A73A4 (R-Mobile APE6) SCIFA compatible UART.
-    - "renesas,scifb-r8a73a4" for R8A73A4 (R-Mobile APE6) SCIFB compatible UART.
-    - "renesas,scifa-r8a7740" for R8A7740 (R-Mobile A1) SCIFA compatible UART.
-    - "renesas,scifb-r8a7740" for R8A7740 (R-Mobile A1) SCIFB compatible UART.
-    - "renesas,scif-r8a7743" for R8A7743 (RZ/G1M) SCIF compatible UART.
-    - "renesas,scifa-r8a7743" for R8A7743 (RZ/G1M) SCIFA compatible UART.
-    - "renesas,scifb-r8a7743" for R8A7743 (RZ/G1M) SCIFB compatible UART.
-    - "renesas,hscif-r8a7743" for R8A7743 (RZ/G1M) HSCIF compatible UART.
-    - "renesas,scif-r8a7744" for R8A7744 (RZ/G1N) SCIF compatible UART.
-    - "renesas,scifa-r8a7744" for R8A7744 (RZ/G1N) SCIFA compatible UART.
-    - "renesas,scifb-r8a7744" for R8A7744 (RZ/G1N) SCIFB compatible UART.
-    - "renesas,hscif-r8a7744" for R8A7744 (RZ/G1N) HSCIF compatible UART.
-    - "renesas,scif-r8a7745" for R8A7745 (RZ/G1E) SCIF compatible UART.
-    - "renesas,scifa-r8a7745" for R8A7745 (RZ/G1E) SCIFA compatible UART.
-    - "renesas,scifb-r8a7745" for R8A7745 (RZ/G1E) SCIFB compatible UART.
-    - "renesas,hscif-r8a7745" for R8A7745 (RZ/G1E) HSCIF compatible UART.
-    - "renesas,scif-r8a77470" for R8A77470 (RZ/G1C) SCIF compatible UART.
-    - "renesas,hscif-r8a77470" for R8A77470 (RZ/G1C) HSCIF compatible UART.
-    - "renesas,scif-r8a774a1" for R8A774A1 (RZ/G2M) SCIF compatible UART.
-    - "renesas,hscif-r8a774a1" for R8A774A1 (RZ/G2M) HSCIF compatible UART.
-    - "renesas,scif-r8a774b1" for R8A774B1 (RZ/G2N) SCIF compatible UART.
-    - "renesas,hscif-r8a774b1" for R8A774B1 (RZ/G2N) HSCIF compatible UART.
-    - "renesas,scif-r8a774c0" for R8A774C0 (RZ/G2E) SCIF compatible UART.
-    - "renesas,hscif-r8a774c0" for R8A774C0 (RZ/G2E) HSCIF compatible UART.
-    - "renesas,scif-r8a7778" for R8A7778 (R-Car M1) SCIF compatible UART.
-    - "renesas,hscif-r8a7778" for R8A7778 (R-Car M1) HSCIF compatible UART.
-    - "renesas,scif-r8a7779" for R8A7779 (R-Car H1) SCIF compatible UART.
-    - "renesas,hscif-r8a7779" for R8A7779 (R-Car H1) HSCIF compatible UART.
-    - "renesas,scif-r8a7790" for R8A7790 (R-Car H2) SCIF compatible UART.
-    - "renesas,scifa-r8a7790" for R8A7790 (R-Car H2) SCIFA compatible UART.
-    - "renesas,scifb-r8a7790" for R8A7790 (R-Car H2) SCIFB compatible UART.
-    - "renesas,hscif-r8a7790" for R8A7790 (R-Car H2) HSCIF compatible UART.
-    - "renesas,scif-r8a7791" for R8A7791 (R-Car M2-W) SCIF compatible UART.
-    - "renesas,scifa-r8a7791" for R8A7791 (R-Car M2-W) SCIFA compatible UART.
-    - "renesas,scifb-r8a7791" for R8A7791 (R-Car M2-W) SCIFB compatible UART.
-    - "renesas,hscif-r8a7791" for R8A7791 (R-Car M2-W) HSCIF compatible UART.
-    - "renesas,scif-r8a7792" for R8A7792 (R-Car V2H) SCIF compatible UART.
-    - "renesas,hscif-r8a7792" for R8A7792 (R-Car V2H) HSCIF compatible UART.
-    - "renesas,scif-r8a7793" for R8A7793 (R-Car M2-N) SCIF compatible UART.
-    - "renesas,scifa-r8a7793" for R8A7793 (R-Car M2-N) SCIFA compatible UART.
-    - "renesas,scifb-r8a7793" for R8A7793 (R-Car M2-N) SCIFB compatible UART.
-    - "renesas,hscif-r8a7793" for R8A7793 (R-Car M2-N) HSCIF compatible UART.
-    - "renesas,scif-r8a7794" for R8A7794 (R-Car E2) SCIF compatible UART.
-    - "renesas,scifa-r8a7794" for R8A7794 (R-Car E2) SCIFA compatible UART.
-    - "renesas,scifb-r8a7794" for R8A7794 (R-Car E2) SCIFB compatible UART.
-    - "renesas,hscif-r8a7794" for R8A7794 (R-Car E2) HSCIF compatible UART.
-    - "renesas,scif-r8a7795" for R8A7795 (R-Car H3) SCIF compatible UART.
-    - "renesas,hscif-r8a7795" for R8A7795 (R-Car H3) HSCIF compatible UART.
-    - "renesas,scif-r8a7796" for R8A77960 (R-Car M3-W) SCIF compatible UART.
-    - "renesas,hscif-r8a7796" for R8A77960 (R-Car M3-W) HSCIF compatible UART.
-    - "renesas,scif-r8a77961" for R8A77961 (R-Car M3-W+) SCIF compatible UART.
-    - "renesas,hscif-r8a77961" for R8A77961 (R-Car M3-W+) HSCIF compatible UART.
-    - "renesas,scif-r8a77965" for R8A77965 (R-Car M3-N) SCIF compatible UART.
-    - "renesas,hscif-r8a77965" for R8A77965 (R-Car M3-N) HSCIF compatible UART.
-    - "renesas,scif-r8a77970" for R8A77970 (R-Car V3M) SCIF compatible UART.
-    - "renesas,hscif-r8a77970" for R8A77970 (R-Car V3M) HSCIF compatible UART.
-    - "renesas,scif-r8a77980" for R8A77980 (R-Car V3H) SCIF compatible UART.
-    - "renesas,hscif-r8a77980" for R8A77980 (R-Car V3H) HSCIF compatible UART.
-    - "renesas,scif-r8a77990" for R8A77990 (R-Car E3) SCIF compatible UART.
-    - "renesas,hscif-r8a77990" for R8A77990 (R-Car E3) HSCIF compatible UART.
-    - "renesas,scif-r8a77995" for R8A77995 (R-Car D3) SCIF compatible UART.
-    - "renesas,hscif-r8a77995" for R8A77995 (R-Car D3) HSCIF compatible UART.
-    - "renesas,scifa-sh73a0" for SH73A0 (SH-Mobile AG5) SCIFA compatible UART.
-    - "renesas,scifb-sh73a0" for SH73A0 (SH-Mobile AG5) SCIFB compatible UART.
-    - "renesas,rcar-gen1-scif" for R-Car Gen1 SCIF compatible UART,
-    - "renesas,rcar-gen2-scif" for R-Car Gen2 and RZ/G1 SCIF compatible UART,
-    - "renesas,rcar-gen3-scif" for R-Car Gen3 and RZ/G2 SCIF compatible UART,
-    - "renesas,rcar-gen2-scifa" for R-Car Gen2 and RZ/G1 SCIFA compatible UART,
-    - "renesas,rcar-gen2-scifb" for R-Car Gen2 and RZ/G1 SCIFB compatible UART,
-    - "renesas,rcar-gen1-hscif" for R-Car Gen1 HSCIF compatible UART,
-    - "renesas,rcar-gen2-hscif" for R-Car Gen2 and RZ/G1 HSCIF compatible UART,
-    - "renesas,rcar-gen3-hscif" for R-Car Gen3 and RZ/G2 HSCIF compatible UART,
-    - "renesas,scif" for generic SCIF compatible UART.
-    - "renesas,scifa" for generic SCIFA compatible UART.
-    - "renesas,scifb" for generic SCIFB compatible UART.
-    - "renesas,hscif" for generic HSCIF compatible UART.
-    - "renesas,sci" for generic SCI compatible UART.
-
-    When compatible with the generic version, nodes must list the
-    SoC-specific version corresponding to the platform first, followed by the
-    family-specific and/or generic versions.
-
-  - reg: Base address and length of the I/O registers used by the UART.
-  - interrupts: Must contain one or more interrupt-specifiers for the SCIx.
-                If a single interrupt is expressed, then all events are
-                multiplexed into this single interrupt.
-
-                If multiple interrupts are provided by the hardware, the order
-                in which the interrupts are listed must match order below. Note
-                that some HW interrupt events may be muxed together resulting
-                in duplicate entries.
-                The interrupt order is as follows:
-                  1. Error (ERI)
-                  2. Receive buffer full (RXI)
-                  3. Transmit buffer empty (TXI)
-                  4. Break (BRI)
-                  5. Data Ready (DRI)
-                  6. Transmit End (TEI)
-
-  - clocks: Must contain a phandle and clock-specifier pair for each entry
-    in clock-names.
-  - clock-names: Must contain "fck" for the SCIx UART functional clock.
-    Apart from the divided functional clock, there may be other possible
-    sources for the sampling clock, depending on SCIx variant.
-    On (H)SCI(F) and some SCIFA, an additional clock may be specified:
-      - "hsck" for the optional external clock input (on HSCIF),
-      - "sck" for the optional external clock input (on other variants).
-    On UARTs equipped with a Baud Rate Generator for External Clock (BRG)
-    (some SCIF and HSCIF), additional clocks may be specified:
-      - "brg_int" for the optional internal clock source for the frequency
-	divider (typically the (AXI or SHwy) bus clock),
-      - "scif_clk" for the optional external clock source for the frequency
-	divider (SCIF_CLK).
-
-Note: Each enabled SCIx UART may have an optional "serialN" alias in the
-"aliases" node.
-
-Optional properties:
-  - dmas: Must contain a list of two references to DMA specifiers, one for
-	  transmission, and one for reception.
-  - dma-names: Must contain a list of two DMA names, "tx" and "rx".
-  - {cts,dsr,dcd,rng,rts,dtr}-gpios: Specify GPIOs for modem lines, cfr. the
-    generic serial DT bindings in serial.yaml.
-  - uart-has-rtscts: Indicates dedicated lines for RTS/CTS hardware flow
-    control, cfr. the generic serial DT bindings in serial.yaml.
-
-Example:
-	aliases {
-		serial0 = &scifa0;
-	};
-
-	scifa0: serial@e6c40000 {
-		compatible = "renesas,scifa-r8a7790",
-			     "renesas,rcar-gen2-scifa", "renesas,scifa";
-		reg = <0 0xe6c40000 0 64>;
-		interrupt-parent = <&gic>;
-		interrupts = <0 144 IRQ_TYPE_LEVEL_HIGH>;
-		clocks = <&mstp2_clks R8A7790_CLK_SCIFA0>;
-		clock-names = "fck";
-		dmas = <&dmac0 0x21>, <&dmac0 0x22>;
-		dma-names = "tx", "rx";
-	};
diff --git a/Documentation/devicetree/bindings/serial/renesas,sci.yaml b/Documentation/devicetree/bindings/serial/renesas,sci.yaml
new file mode 100644
index 0000000000000000..720b3a5c944f9fe9
--- /dev/null
+++ b/Documentation/devicetree/bindings/serial/renesas,sci.yaml
@@ -0,0 +1,79 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: "http://devicetree.org/schemas/serial/renesas,sci.yaml#"
+$schema: "http://devicetree.org/meta-schemas/core.yaml#"
+
+title: Renesas Serial Communication Interface
+
+maintainers:
+  - Geert Uytterhoeven <geert+renesas@glider.be>
+
+description:
+  Each enabled UART may have an optional "serialN" alias in the "aliases" node,
+  where N is the port number (non-negative decimal integer) as printed on the
+  label next to the physical port.
+
+allOf:
+  - $ref: serial.yaml#
+
+properties:
+  compatible:
+    oneOf:
+      - items:
+          - const: renesas,sci
+
+  reg:
+    maxItems: 1
+
+  interrupts:
+    description: |
+      Must contain four interrupt-specifiers for the serial interface.
+      The order in which the interrupts are listed must match order below.
+    minItems: 4
+    maxItems: 4
+
+  interrupt-names:
+    minItems: 4
+    maxItems: 4
+    items:
+      enum:
+        - eri # Error
+        - rxi # Receive buffer full
+        - txi # Transmit buffer empty
+        - tei # Transmit End
+
+  clocks:
+    minItems: 1
+    maxItems: 2
+
+  clock-names:
+    minItems: 1
+    maxItems: 2
+    items:
+      enum:
+        - fck # UART functional clock
+        - sck # optional external clock input
+
+  uart-has-rtscts: false
+
+required:
+  - compatible
+  - reg
+  - interrupts
+  - clocks
+  - clock-names
+
+examples:
+  - |
+    aliases {
+            serial0 = &sci0;
+    };
+
+    sci0: serial@ffff78 {
+            compatible = "renesas,sci";
+            reg = <0xffff78 8>;
+            interrupts = <88 0>, <89 0>, <90 0>, <91 0>;
+            clocks = <&fclk>;
+            clock-names = "fck";
+    };
diff --git a/Documentation/devicetree/bindings/serial/renesas,scif.yaml b/Documentation/devicetree/bindings/serial/renesas,scif.yaml
new file mode 100644
index 0000000000000000..28a7f99547990295
--- /dev/null
+++ b/Documentation/devicetree/bindings/serial/renesas,scif.yaml
@@ -0,0 +1,168 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: "http://devicetree.org/schemas/serial/renesas,scif.yaml#"
+$schema: "http://devicetree.org/meta-schemas/core.yaml#"
+
+title: Renesas Serial Communication Interface with FIFO (SCIF)
+
+maintainers:
+  - Geert Uytterhoeven <geert+renesas@glider.be>
+
+description:
+  Each enabled UART may have an optional "serialN" alias in the "aliases" node,
+  where N is the port number (non-negative decimal integer) as printed on the
+  label next to the physical port.
+
+allOf:
+  - $ref: serial.yaml#
+
+properties:
+  compatible:
+    oneOf:
+      - items:
+          - enum:
+              - renesas,scif-r7s72100     # RZ/A1H
+          - const: renesas,scif           # generic SCIF compatible UART
+
+      - items:
+          - enum:
+              - renesas,scif-r7s9210      # RZ/A2
+
+      - items:
+          - enum:
+              - renesas,scif-r8a7778      # R-Car M1
+              - renesas,scif-r8a7779      # R-Car H1
+          - const: renesas,rcar-gen1-scif # R-Car Gen1
+          - const: renesas,scif           # generic SCIF compatible UART
+
+      - items:
+          - enum:
+              - renesas,scif-r8a7743      # RZ/G1M
+              - renesas,scif-r8a7744      # RZ/G1N
+              - renesas,scif-r8a7745      # RZ/G1E
+              - renesas,scif-r8a77470     # RZ/G1C
+              - renesas,scif-r8a7790      # R-Car H2
+              - renesas,scif-r8a7791      # R-Car M2-W
+              - renesas,scif-r8a7792      # R-Car V2H
+              - renesas,scif-r8a7793      # R-Car M2-N
+              - renesas,scif-r8a7794      # R-Car E2
+          - const: renesas,rcar-gen2-scif # R-Car Gen2 and RZ/G1
+          - const: renesas,scif           # generic SCIF compatible UART
+
+      - items:
+          - enum:
+              - renesas,scif-r8a774a1     # RZ/G2M
+              - renesas,scif-r8a774b1     # RZ/G2N
+              - renesas,scif-r8a774c0     # RZ/G2E
+              - renesas,scif-r8a7795      # R-Car H3
+              - renesas,scif-r8a7796      # R-Car M3-W
+              - renesas,scif-r8a77961     # R-Car M3-W+
+              - renesas,scif-r8a77965     # R-Car M3-N
+              - renesas,scif-r8a77970     # R-Car V3M
+              - renesas,scif-r8a77980     # R-Car V3H
+              - renesas,scif-r8a77990     # R-Car E3
+              - renesas,scif-r8a77995     # R-Car D3
+          - const: renesas,rcar-gen3-scif # R-Car Gen3 and RZ/G2
+          - const: renesas,scif           # generic SCIF compatible UART
+
+  reg:
+    maxItems: 1
+
+  interrupts:
+    description: |
+      Must contain one or more interrupt-specifiers for the serial interface.
+      If a single interrupt is expressed, then all events are
+      multiplexed into this single interrupt.
+
+      If multiple interrupts are provided by the hardware, the order
+      in which the interrupts are listed must match order below. Note
+      that some HW interrupt events may be muxed together resulting
+      in duplicate entries.
+    minItems: 1
+    maxItems: 6
+
+  interrupt-names:
+    minItems: 1
+    maxItems: 6
+    items:
+      enum:
+        - eri # Error
+        - rxi # Receive buffer full
+        - txi # Transmit buffer empty
+        - bri # Break
+        - dri # Data Ready
+        - tei # Transmit End
+
+  clocks:
+    minItems: 1
+    maxItems: 4
+
+  clock-names:
+    minItems: 1
+    maxItems: 4
+    items:
+      enum:
+        - fck # UART functional clock
+        - sck # optional external clock input
+        - brg_int # optional internal clock source for BRG frequency divider
+        - scif_clk # optional external clock source for BRG frequency divider
+
+  power-domains: true
+
+  resets: true
+
+  dmas:
+    description:
+      Must contain a list of pairs of references to DMA specifiers, one for
+      transmission, and one for reception.
+
+  dma-names:
+    minItems: 2
+    maxItems: 4
+    items:
+      enum:
+        - tx
+        - rx
+
+required:
+  - compatible
+  - reg
+  - interrupts
+  - clocks
+  - clock-names
+  - power-domains
+
+if:
+  properties:
+    compatible:
+      contains:
+        enum:
+          - renesas,rcar-gen2-scif
+          - renesas,rcar-gen3-scif
+then:
+  required:
+    - resets
+
+examples:
+  - |
+    #include <dt-bindings/clock/r8a7791-cpg-mssr.h>
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+    #include <dt-bindings/power/r8a7791-sysc.h>
+    aliases {
+            serial0 = &scif0;
+    };
+
+    scif0: serial@e6e60000 {
+            compatible = "renesas,scif-r8a7791", "renesas,rcar-gen2-scif",
+                         "renesas,scif";
+            reg = <0xe6e60000 64>;
+            interrupts = <GIC_SPI 152 IRQ_TYPE_LEVEL_HIGH>;
+            clocks = <&cpg CPG_MOD 721>, <&cpg CPG_CORE R8A7791_CLK_ZS>,
+                     <&scif_clk>;
+            clock-names = "fck", "brg_int", "scif_clk";
+            dmas = <&dmac0 0x29>, <&dmac0 0x2a>, <&dmac1 0x29>, <&dmac1 0x2a>;
+            dma-names = "tx", "rx", "tx", "rx";
+            power-domains = <&sysc R8A7791_PD_ALWAYS_ON>;
+            resets = <&cpg 721>;
+    };
diff --git a/Documentation/devicetree/bindings/serial/renesas,scifa.yaml b/Documentation/devicetree/bindings/serial/renesas,scifa.yaml
new file mode 100644
index 0000000000000000..5d847d45d7013425
--- /dev/null
+++ b/Documentation/devicetree/bindings/serial/renesas,scifa.yaml
@@ -0,0 +1,110 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: "http://devicetree.org/schemas/serial/renesas,scifa.yaml#"
+$schema: "http://devicetree.org/meta-schemas/core.yaml#"
+
+title: Renesas Serial Communications Interface with FIFO A (SCIFA)
+
+maintainers:
+  - Geert Uytterhoeven <geert+renesas@glider.be>
+
+description:
+  Each enabled UART may have an optional "serialN" alias in the "aliases" node,
+  where N is the port number (non-negative decimal integer) as printed on the
+  label next to the physical port.
+
+allOf:
+  - $ref: serial.yaml#
+
+properties:
+  compatible:
+    oneOf:
+      - items:
+          - enum:
+              - renesas,scifa-r8a73a4      # R-Mobile APE6
+              - renesas,scifa-r8a7740      # R-Mobile A1
+              - renesas,scifa-sh73a0       # SH-Mobile AG5
+          - const: renesas,scifa           # generic SCIFA compatible UART
+
+      - items:
+          - enum:
+              - renesas,scifa-r8a7743      # R8A7743 RZ/G1M
+              - renesas,scifa-r8a7744      # R8A7744 RZ/G1N
+              - renesas,scifa-r8a7745      # R8A7745 RZ/G1E
+              - renesas,scifa-r8a7790      # R8A7790 R-Car H2
+              - renesas,scifa-r8a7791      # R8A7791 R-Car M2-W
+              - renesas,scifa-r8a7793      # R8A7793 R-Car M2-N
+              - renesas,scifa-r8a7794      # R8A7794 R-Car E2
+          - const: renesas,rcar-gen2-scifa # R-Car Gen2 and RZ/G1
+          - const: renesas,scifa           # generic SCIFA compatible UART
+
+  reg:
+    maxItems: 1
+
+  interrupts:
+    maxItems: 1
+
+  clocks:
+    maxItems: 1
+
+  clock-names:
+    enum:
+      - fck # UART functional clock
+
+  power-domains: true
+
+  resets: true
+
+  dmas:
+    description:
+      Must contain a list of pairs of references to DMA specifiers, one for
+      transmission, and one for reception.
+
+  dma-names:
+    minItems: 2
+    maxItems: 4
+    items:
+      enum:
+        - tx
+        - rx
+
+required:
+  - compatible
+  - reg
+  - interrupts
+  - clocks
+  - clock-names
+  - power-domains
+
+if:
+  properties:
+    compatible:
+      contains:
+        enum:
+          - renesas,rcar-gen2-scifa
+then:
+  required:
+    - resets
+
+examples:
+  - |
+    #include <dt-bindings/clock/r8a7790-cpg-mssr.h>
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+    #include <dt-bindings/power/r8a7790-sysc.h>
+    aliases {
+            serial0 = &scifa0;
+    };
+
+    scifa0: serial@e6c40000 {
+            compatible = "renesas,scifa-r8a7790", "renesas,rcar-gen2-scifa",
+                         "renesas,scifa";
+            reg = <0xe6c40000 64>;
+            interrupts = <GIC_SPI 144 IRQ_TYPE_LEVEL_HIGH>;
+            clocks = <&cpg CPG_MOD 204>;
+            clock-names = "fck";
+            power-domains = <&sysc R8A7790_PD_ALWAYS_ON>;
+            resets = <&cpg 204>;
+            dmas = <&dmac0 0x21>, <&dmac0 0x22>, <&dmac1 0x21>, <&dmac1 0x22>;
+            dma-names = "tx", "rx", "tx", "rx";
+    };
diff --git a/Documentation/devicetree/bindings/serial/renesas,scifb.yaml b/Documentation/devicetree/bindings/serial/renesas,scifb.yaml
new file mode 100644
index 0000000000000000..432d057a7b31755b
--- /dev/null
+++ b/Documentation/devicetree/bindings/serial/renesas,scifb.yaml
@@ -0,0 +1,101 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: "http://devicetree.org/schemas/serial/renesas,scifb.yaml#"
+$schema: "http://devicetree.org/meta-schemas/core.yaml#"
+
+title: Renesas Serial Communications Interface with FIFO B (SCIFB)
+
+maintainers:
+  - Geert Uytterhoeven <geert+renesas@glider.be>
+
+description:
+  Each enabled UART may have an optional "serialN" alias in the "aliases" node,
+  where N is the port number (non-negative decimal integer) as printed on the
+  label next to the physical port.
+
+allOf:
+  - $ref: serial.yaml#
+
+properties:
+  compatible:
+    oneOf:
+      - items:
+          - enum:
+              - renesas,scifb-r8a73a4      # R-Mobile APE6
+              - renesas,scifb-r8a7740      # R-Mobile A1
+              - renesas,scifb-sh73a0       # SH-Mobile AG5
+          - const: renesas,scifb           # generic SCIFB compatible UART
+
+      - items:
+          - enum:
+              - renesas,scifb-r8a7743      # RZ/G1M
+              - renesas,scifb-r8a7744      # RZ/G1N
+              - renesas,scifb-r8a7745      # RZ/G1E
+              - renesas,scifb-r8a7790      # R-Car H2
+              - renesas,scifb-r8a7791      # R-Car M2-W
+              - renesas,scifb-r8a7793      # R-Car M2-N
+              - renesas,scifb-r8a7794      # R-Car E2
+          - const: renesas,rcar-gen2-scifb # R-Car Gen2 and RZ/G1
+          - const: renesas,scifb           # generic SCIFB compatible UART
+
+  reg:
+    maxItems: 1
+
+  interrupts:
+    maxItems: 1
+
+  clocks:
+    maxItems: 1
+
+  clock-names:
+    enum:
+      - fck # UART functional clock
+
+  power-domains: true
+
+  resets: true
+
+  dmas:
+    description:
+      Must contain a list of pairs of references to DMA specifiers, one for
+      transmission, and one for reception.
+
+  dma-names:
+    minItems: 2
+    maxItems: 4
+    items:
+      enum:
+        - tx
+        - rx
+
+required:
+  - compatible
+  - reg
+  - interrupts
+  - clocks
+  - clock-names
+  - power-domains
+
+if:
+  properties:
+    compatible:
+      contains:
+        enum:
+          - renesas,rcar-gen2-scifb
+then:
+  required:
+    - resets
+
+examples:
+  - |
+    #include <dt-bindings/clock/r8a7740-clock.h>
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+    scifb: serial@e6c30000 {
+            compatible = "renesas,scifb-r8a7740", "renesas,scifb";
+            reg = <0xe6c30000 0x100>;
+            interrupts = <GIC_SPI 108 IRQ_TYPE_LEVEL_HIGH>;
+            clocks = <&mstp2_clks R8A7740_CLK_SCIFB>;
+            clock-names = "fck";
+            power-domains = <&pd_a3sp>;
+    };
-- 
2.17.1

