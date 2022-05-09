Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 46CFF51FD27
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  9 May 2022 14:45:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234742AbiEIMpi (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 9 May 2022 08:45:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38556 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234735AbiEIMpi (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 9 May 2022 08:45:38 -0400
Received: from andre.telenet-ops.be (andre.telenet-ops.be [IPv6:2a02:1800:120:4::f00:15])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0FEC42DA80
        for <linux-renesas-soc@vger.kernel.org>; Mon,  9 May 2022 05:41:43 -0700 (PDT)
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed40:8886:2b92:63eb:2922])
        by andre.telenet-ops.be with bizsmtp
        id Uchg2700Y0moLbn01chgfJ; Mon, 09 May 2022 14:41:41 +0200
Received: from rox.of.borg ([192.168.97.57])
        by ramsan.of.borg with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
        (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1no2ho-003XWs-9j; Mon, 09 May 2022 14:41:40 +0200
Received: from geert by rox.of.borg with local (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1no2hn-003Gm1-S8; Mon, 09 May 2022 14:41:39 +0200
From:   Geert Uytterhoeven <geert+renesas@glider.be>
To:     Kishon Vijay Abraham I <kishon@ti.com>,
        Vinod Koul <vkoul@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Cc:     Wolfram Sang <wsa+renesas@sang-engineering.com>,
        linux-phy@lists.infradead.org, devicetree@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH] dt-bindings: phy: renesas,rcar-gen2-usb-phy: Convert to json-schema
Date:   Mon,  9 May 2022 14:41:38 +0200
Message-Id: <8e48edc5e7b65f8dfd8b76c583e0265b9b97e62b.1652099944.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.4 required=5.0 tests=BAYES_00,
        HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_LOW,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Convert the Renesas R-Car Gen2 USB PHY Device Tree binding documentation
to json-schema.

Add missing properties.
Drop the second example, as it doesn't add any value.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
Validation gives:

    Documentation/devicetree/bindings/phy/renesas,rcar-gen2-usb-phy.example.dtb: usb
    -phy@e6590100: '#phy-cells' is a required property
	    From schema: dt-schema/dtschema/schemas/phy/phy-provider.yaml

The latter considers '#phy-cells' a required property, as the node name
matches "usb-phy".  But in this binding the actual PHY providers are the
child nodes.

Is there a way to fix this? Overriding "#phy-cells" to "false" doesn't
work.
Should all nodes and child nodes be renamed? The (Linux) driver doesn't
care about the names of the children.

---
This is the final conversion to json-schema of DT bindings for Renesas
ARM SoCs, hurray!

Note that there are still a few plain text bindings left for Renesas IP
cores that are present on non-Renesas SoCs (nbpfaxi and usdhi6rol0).
And H8/300 is being removed.
---
 .../devicetree/bindings/phy/rcar-gen2-phy.txt | 112 ----------------
 .../phy/renesas,rcar-gen2-usb-phy.yaml        | 123 ++++++++++++++++++
 2 files changed, 123 insertions(+), 112 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/phy/rcar-gen2-phy.txt
 create mode 100644 Documentation/devicetree/bindings/phy/renesas,rcar-gen2-usb-phy.yaml

diff --git a/Documentation/devicetree/bindings/phy/rcar-gen2-phy.txt b/Documentation/devicetree/bindings/phy/rcar-gen2-phy.txt
deleted file mode 100644
index a3bd1c4499b75bdb..0000000000000000
--- a/Documentation/devicetree/bindings/phy/rcar-gen2-phy.txt
+++ /dev/null
@@ -1,112 +0,0 @@
-* Renesas R-Car generation 2 USB PHY
-
-This file provides information on what the device node for the R-Car generation
-2 USB PHY contains.
-
-Required properties:
-- compatible: "renesas,usb-phy-r8a7742" if the device is a part of R8A7742 SoC.
-	      "renesas,usb-phy-r8a7743" if the device is a part of R8A7743 SoC.
-	      "renesas,usb-phy-r8a7744" if the device is a part of R8A7744 SoC.
-	      "renesas,usb-phy-r8a7745" if the device is a part of R8A7745 SoC.
-	      "renesas,usb-phy-r8a77470" if the device is a part of R8A77470 SoC.
-	      "renesas,usb-phy-r8a7790" if the device is a part of R8A7790 SoC.
-	      "renesas,usb-phy-r8a7791" if the device is a part of R8A7791 SoC.
-	      "renesas,usb-phy-r8a7794" if the device is a part of R8A7794 SoC.
-	      "renesas,rcar-gen2-usb-phy" for a generic R-Car Gen2 or
-					  RZ/G1 compatible device.
-
-	      When compatible with the generic version, nodes must list the
-	      SoC-specific version corresponding to the platform first
-	      followed by the generic version.
-
-- reg: offset and length of the register block.
-- #address-cells: number of address cells for the USB channel subnodes, must
-		  be <1>.
-- #size-cells: number of size cells for the USB channel subnodes, must be <0>.
-- clocks: clock phandle and specifier pair.
-- clock-names: string, clock input name, must be "usbhs".
-
-The USB PHY device tree node should have the subnodes corresponding to the USB
-channels. These subnodes must contain the following properties:
-- reg: the USB controller selector; see the table below for the values.
-- #phy-cells: see phy-bindings.txt in the same directory, must be <1>.
-
-The phandle's argument in the PHY specifier is the USB controller selector for
-the USB channel other than r8a77470 SoC; see the selector meanings below:
-
-+-----------+---------------+---------------+
-|\ Selector |               |               |
-+ --------- +       0       |       1       |
-| Channel  \|               |               |
-+-----------+---------------+---------------+
-| 0         | PCI EHCI/OHCI | HS-USB        |
-| 2         | PCI EHCI/OHCI | xHCI          |
-+-----------+---------------+---------------+
-
-For r8a77470 SoC;see the selector meaning below:
-
-+-----------+---------------+---------------+
-|\ Selector |               |               |
-+ --------- +       0       |       1       |
-| Channel  \|               |               |
-+-----------+---------------+---------------+
-| 0         | EHCI/OHCI     | HS-USB        |
-+-----------+---------------+---------------+
-
-Example (Lager board):
-
-	usb-phy@e6590100 {
-		compatible = "renesas,usb-phy-r8a7790", "renesas,rcar-gen2-usb-phy";
-		reg = <0 0xe6590100 0 0x100>;
-		#address-cells = <1>;
-		#size-cells = <0>;
-		clocks = <&cpg CPG_MOD 704>;
-		clock-names = "usbhs";
-		power-domains = <&sysc R8A7790_PD_ALWAYS_ON>;
-		resets = <&cpg 704>;
-
-		usb0: usb-channel@0 {
-			reg = <0>;
-			#phy-cells = <1>;
-		};
-		usb2: usb-channel@2 {
-			reg = <2>;
-			#phy-cells = <1>;
-		};
-	};
-
-Example (iWave RZ/G1C sbc):
-
-	usbphy0: usb-phy0@e6590100 {
-		compatible = "renesas,usb-phy-r8a77470",
-			     "renesas,rcar-gen2-usb-phy";
-		reg = <0 0xe6590100 0 0x100>;
-		#address-cells = <1>;
-		#size-cells = <0>;
-		clocks = <&cpg CPG_MOD 704>;
-		clock-names = "usbhs";
-		power-domains = <&sysc R8A77470_PD_ALWAYS_ON>;
-		resets = <&cpg 704>;
-
-		usb0: usb-channel@0 {
-			reg = <0>;
-			#phy-cells = <1>;
-		};
-	};
-
-	usbphy1: usb-phy@e6598100 {
-		compatible = "renesas,usb-phy-r8a77470",
-			     "renesas,rcar-gen2-usb-phy";
-		reg = <0 0xe6598100 0 0x100>;
-		#address-cells = <1>;
-		#size-cells = <0>;
-		clocks = <&cpg CPG_MOD 706>;
-		clock-names = "usbhs";
-		power-domains = <&sysc R8A77470_PD_ALWAYS_ON>;
-		resets = <&cpg 706>;
-
-		usb1: usb-channel@0 {
-			reg = <0>;
-			#phy-cells = <1>;
-		};
-	};
diff --git a/Documentation/devicetree/bindings/phy/renesas,rcar-gen2-usb-phy.yaml b/Documentation/devicetree/bindings/phy/renesas,rcar-gen2-usb-phy.yaml
new file mode 100644
index 0000000000000000..aa2bbc7e35dd4ace
--- /dev/null
+++ b/Documentation/devicetree/bindings/phy/renesas,rcar-gen2-usb-phy.yaml
@@ -0,0 +1,123 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/phy/renesas,rcar-gen2-usb-phy.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Renesas R-Car Gen2 USB PHY
+
+maintainers:
+  - Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
+
+properties:
+  compatible:
+    items:
+      - enum:
+          - renesas,usb-phy-r8a7742      # RZ/G1H
+          - renesas,usb-phy-r8a7743      # RZ/G1M
+          - renesas,usb-phy-r8a7744      # RZ/G1N
+          - renesas,usb-phy-r8a7745      # RZ/G1E
+          - renesas,usb-phy-r8a77470     # RZ/G1C
+          - renesas,usb-phy-r8a7790      # R-Car H2
+          - renesas,usb-phy-r8a7791      # R-Car M2-W
+          - renesas,usb-phy-r8a7794      # R-Car E2
+      - const: renesas,rcar-gen2-usb-phy # R-Car Gen2 or RZ/G1
+
+  reg:
+    maxItems: 1
+
+  '#address-cells':
+    const: 1
+
+  '#size-cells':
+    const: 0
+
+  clocks:
+    maxItems: 1
+
+  clock-names:
+    items:
+      - const: usbhs
+
+  power-domains:
+    maxItems: 1
+
+  resets:
+    maxItems: 1
+
+patternProperties:
+  "^usb-channel@[02]$":
+    type: object
+    description: Subnode corresponding to a USB channel.
+
+    properties:
+      reg:
+        description: FIXME RZ/G1C supports channel 0 only
+        enum: [0, 2]
+
+      '#phy-cells':
+        description: |
+          The phandle's argument in the PHY specifier is the USB controller
+          selector for the USB channel.
+          For RZ/G1C:
+            - 0 for EHCI/OHCI
+            - 1 for HS-USB
+          For all other SoCS:
+            - 0 for PCI EHCI/OHCI
+            - 1 for HS-USB (channel 0) or xHCI (channel 2)
+        const: 1
+
+    required:
+      - reg
+      - '#phy-cells'
+
+    additionalProperties: false
+
+required:
+  - compatible
+  - reg
+  - '#address-cells'
+  - '#size-cells'
+  - clocks
+  - clock-names
+  - resets
+  - power-domains
+  - usb-channel@0
+
+if:
+  properties:
+    compatible:
+      contains:
+        const: renesas,usb-phy-r8a77470
+then:
+  properties:
+    usb-channel@2: false
+else:
+  required:
+    - usb-channel@2
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/clock/r8a7790-cpg-mssr.h>
+    #include <dt-bindings/power/r8a7790-sysc.h>
+    usb-phy@e6590100 {
+        compatible = "renesas,usb-phy-r8a7790", "renesas,rcar-gen2-usb-phy";
+        reg = <0xe6590100 0x100>;
+        #address-cells = <1>;
+        #size-cells = <0>;
+        clocks = <&cpg CPG_MOD 704>;
+        clock-names = "usbhs";
+        power-domains = <&sysc R8A7790_PD_ALWAYS_ON>;
+        resets = <&cpg 704>;
+
+        usb0: usb-channel@0 {
+            reg = <0>;
+            #phy-cells = <1>;
+        };
+        usb2: usb-channel@2 {
+            reg = <2>;
+            #phy-cells = <1>;
+        };
+    };
-- 
2.25.1

