Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AAB732DB700
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 16 Dec 2020 00:14:49 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726181AbgLOXOa (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 15 Dec 2020 18:14:30 -0500
Received: from perceval.ideasonboard.com ([213.167.242.64]:36670 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731421AbgLOXG6 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 15 Dec 2020 18:06:58 -0500
Received: from pendragon.lan (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id C46CD593;
        Wed, 16 Dec 2020 00:06:12 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1608073573;
        bh=UZOVe2TdEa6j7SooiqQDfo3XI5Guvj07BFrUJmDiG6w=;
        h=From:To:Cc:Subject:Date:From;
        b=u0IbVfiFndM9SeT10NdrNcNmHtu9AZii/QRcCrlZyYo9TNUos2PIempQpOHc1O4uG
         HBQVSJTr3CmCdNk74QSBsPhaBQLlgvz7QUKjJVTxJa9XhGtSG2PqLk3Djl8BvZRywU
         PqHJho6ZzCHxqeGXT+ICh3/FEdsYpDoi/DIzWOOw=
From:   Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
To:     dri-devel@lists.freedesktop.org
Cc:     linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org,
        Rob Herring <robh+dt@kernel.org>
Subject: [PATCH] dt-bindings: display: renesas,du: Convert binding to YAML
Date:   Wed, 16 Dec 2020 01:06:03 +0200
Message-Id: <20201215230603.7796-1-laurent.pinchart+renesas@ideasonboard.com>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Convert the Renesas R-Car DU text binding to YAML.

Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
---
Changes since v1:

- Use pattern instead of enum for dclkin
- Update MAINTAINERS
---
 .../bindings/display/renesas,du.txt           | 145 ---
 .../bindings/display/renesas,du.yaml          | 854 ++++++++++++++++++
 MAINTAINERS                                   |   2 +-
 3 files changed, 855 insertions(+), 146 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/display/renesas,du.txt
 create mode 100644 Documentation/devicetree/bindings/display/renesas,du.yaml

diff --git a/Documentation/devicetree/bindings/display/renesas,du.txt b/Documentation/devicetree/bindings/display/renesas,du.txt
deleted file mode 100644
index 7d65c24fcda8..000000000000
--- a/Documentation/devicetree/bindings/display/renesas,du.txt
+++ /dev/null
@@ -1,145 +0,0 @@
-* Renesas R-Car Display Unit (DU)
-
-Required Properties:
-
-  - compatible: must be one of the following.
-    - "renesas,du-r8a7742" for R8A7742 (RZ/G1H) compatible DU
-    - "renesas,du-r8a7743" for R8A7743 (RZ/G1M) compatible DU
-    - "renesas,du-r8a7744" for R8A7744 (RZ/G1N) compatible DU
-    - "renesas,du-r8a7745" for R8A7745 (RZ/G1E) compatible DU
-    - "renesas,du-r8a77470" for R8A77470 (RZ/G1C) compatible DU
-    - "renesas,du-r8a774a1" for R8A774A1 (RZ/G2M) compatible DU
-    - "renesas,du-r8a774b1" for R8A774B1 (RZ/G2N) compatible DU
-    - "renesas,du-r8a774c0" for R8A774C0 (RZ/G2E) compatible DU
-    - "renesas,du-r8a774e1" for R8A774E1 (RZ/G2H) compatible DU
-    - "renesas,du-r8a7779" for R8A7779 (R-Car H1) compatible DU
-    - "renesas,du-r8a7790" for R8A7790 (R-Car H2) compatible DU
-    - "renesas,du-r8a7791" for R8A7791 (R-Car M2-W) compatible DU
-    - "renesas,du-r8a7792" for R8A7792 (R-Car V2H) compatible DU
-    - "renesas,du-r8a7793" for R8A7793 (R-Car M2-N) compatible DU
-    - "renesas,du-r8a7794" for R8A7794 (R-Car E2) compatible DU
-    - "renesas,du-r8a7795" for R8A7795 (R-Car H3) compatible DU
-    - "renesas,du-r8a7796" for R8A7796 (R-Car M3-W) compatible DU
-    - "renesas,du-r8a77961" for R8A77961 (R-Car M3-W+) compatible DU
-    - "renesas,du-r8a77965" for R8A77965 (R-Car M3-N) compatible DU
-    - "renesas,du-r8a77970" for R8A77970 (R-Car V3M) compatible DU
-    - "renesas,du-r8a77980" for R8A77980 (R-Car V3H) compatible DU
-    - "renesas,du-r8a77990" for R8A77990 (R-Car E3) compatible DU
-    - "renesas,du-r8a77995" for R8A77995 (R-Car D3) compatible DU
-
-  - reg: the memory-mapped I/O registers base address and length
-
-  - interrupts: Interrupt specifiers for the DU interrupts.
-
-  - clocks: A list of phandles + clock-specifier pairs, one for each entry in
-    the clock-names property.
-  - clock-names: Name of the clocks. This property is model-dependent.
-    - R8A7779 uses a single functional clock. The clock doesn't need to be
-      named.
-    - All other DU instances use one functional clock per channel The
-      functional clocks must be named "du.x" with "x" being the channel
-      numerical index.
-    - In addition to the functional clocks, all DU versions also support
-      externally supplied pixel clocks. Those clocks are optional. When
-      supplied they must be named "dclkin.x" with "x" being the input clock
-      numerical index.
-
-  - renesas,cmms: A list of phandles to the CMM instances present in the SoC,
-    one for each available DU channel. The property shall not be specified for
-    SoCs that do not provide any CMM (such as V3M and V3H).
-
-  - renesas,vsps: A list of phandle and channel index tuples to the VSPs that
-    handle the memory interfaces for the DU channels. The phandle identifies the
-    VSP instance that serves the DU channel, and the channel index identifies
-    the LIF instance in that VSP.
-
-Optional properties:
-  - resets: A list of phandle + reset-specifier pairs, one for each entry in
-    the reset-names property.
-  - reset-names: Names of the resets. This property is model-dependent.
-    - All but R8A7779 use one reset for a group of one or more successive
-      channels. The resets must be named "du.x" with "x" being the numerical
-      index of the lowest channel in the group.
-
-Required nodes:
-
-The connections to the DU output video ports are modeled using the OF graph
-bindings specified in Documentation/devicetree/bindings/graph.txt.
-
-The following table lists for each supported model the port number
-corresponding to each DU output.
-
-                        Port0          Port1          Port2          Port3
------------------------------------------------------------------------------
- R8A7742 (RZ/G1H)       DPAD 0         LVDS 0         LVDS 1         -
- R8A7743 (RZ/G1M)       DPAD 0         LVDS 0         -              -
- R8A7744 (RZ/G1N)       DPAD 0         LVDS 0         -              -
- R8A7745 (RZ/G1E)       DPAD 0         DPAD 1         -              -
- R8A77470 (RZ/G1C)      DPAD 0         DPAD 1         LVDS 0         -
- R8A774A1 (RZ/G2M)      DPAD 0         HDMI 0         LVDS 0         -
- R8A774B1 (RZ/G2N)      DPAD 0         HDMI 0         LVDS 0         -
- R8A774C0 (RZ/G2E)      DPAD 0         LVDS 0         LVDS 1         -
- R8A774E1 (RZ/G2H)      DPAD 0         HDMI 0         LVDS 0         -
- R8A7779 (R-Car H1)     DPAD 0         DPAD 1         -              -
- R8A7790 (R-Car H2)     DPAD 0         LVDS 0         LVDS 1         -
- R8A7791 (R-Car M2-W)   DPAD 0         LVDS 0         -              -
- R8A7792 (R-Car V2H)    DPAD 0         DPAD 1         -              -
- R8A7793 (R-Car M2-N)   DPAD 0         LVDS 0         -              -
- R8A7794 (R-Car E2)     DPAD 0         DPAD 1         -              -
- R8A7795 (R-Car H3)     DPAD 0         HDMI 0         HDMI 1         LVDS 0
- R8A7796 (R-Car M3-W)   DPAD 0         HDMI 0         LVDS 0         -
- R8A77961 (R-Car M3-W+) DPAD 0         HDMI 0         LVDS 0         -
- R8A77965 (R-Car M3-N)  DPAD 0         HDMI 0         LVDS 0         -
- R8A77970 (R-Car V3M)   DPAD 0         LVDS 0         -              -
- R8A77980 (R-Car V3H)   DPAD 0         LVDS 0         -              -
- R8A77990 (R-Car E3)    DPAD 0         LVDS 0         LVDS 1         -
- R8A77995 (R-Car D3)    DPAD 0         LVDS 0         LVDS 1         -
-
-
-Example: R8A7795 (R-Car H3) ES2.0 DU
-
-	du: display@feb00000 {
-		compatible = "renesas,du-r8a7795";
-		reg = <0 0xfeb00000 0 0x80000>;
-		interrupts = <GIC_SPI 256 IRQ_TYPE_LEVEL_HIGH>,
-			     <GIC_SPI 268 IRQ_TYPE_LEVEL_HIGH>,
-			     <GIC_SPI 269 IRQ_TYPE_LEVEL_HIGH>,
-			     <GIC_SPI 270 IRQ_TYPE_LEVEL_HIGH>;
-		clocks = <&cpg CPG_MOD 724>,
-			 <&cpg CPG_MOD 723>,
-			 <&cpg CPG_MOD 722>,
-			 <&cpg CPG_MOD 721>;
-		clock-names = "du.0", "du.1", "du.2", "du.3";
-		resets = <&cpg 724>, <&cpg 722>;
-		reset-names = "du.0", "du.2";
-		renesas,cmms = <&cmm0>, <&cmm1>, <&cmm2>, <&cmm3>;
-		renesas,vsps = <&vspd0 0>, <&vspd1 0>, <&vspd2 0>, <&vspd0 1>;
-
-		ports {
-			#address-cells = <1>;
-			#size-cells = <0>;
-
-			port@0 {
-				reg = <0>;
-				du_out_rgb: endpoint {
-				};
-			};
-			port@1 {
-				reg = <1>;
-				du_out_hdmi0: endpoint {
-					remote-endpoint = <&dw_hdmi0_in>;
-				};
-			};
-			port@2 {
-				reg = <2>;
-				du_out_hdmi1: endpoint {
-					remote-endpoint = <&dw_hdmi1_in>;
-				};
-			};
-			port@3 {
-				reg = <3>;
-				du_out_lvds0: endpoint {
-				};
-			};
-		};
-	};
diff --git a/Documentation/devicetree/bindings/display/renesas,du.yaml b/Documentation/devicetree/bindings/display/renesas,du.yaml
new file mode 100644
index 000000000000..f56ef3eed742
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/renesas,du.yaml
@@ -0,0 +1,854 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/display/renesas,du.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Renesas R-Car Display Unit (DU)
+
+maintainers:
+  - Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
+
+description: |
+  These DT bindings describe the Display Unit embedded in the Renesas R-Car
+  Gen1, R-Car Gen2, R-Car Gen3, RZ/G1 and RZ/G2 SoCs.
+
+properties:
+  compatible:
+    enum:
+      - renesas,du-r8a7742 # for RZ/G1H compatible DU
+      - renesas,du-r8a7743 # for RZ/G1M compatible DU
+      - renesas,du-r8a7744 # for RZ/G1N compatible DU
+      - renesas,du-r8a7745 # for RZ/G1E compatible DU
+      - renesas,du-r8a77470 # for RZ/G1C compatible DU
+      - renesas,du-r8a774a1 # for RZ/G2M compatible DU
+      - renesas,du-r8a774b1 # for RZ/G2N compatible DU
+      - renesas,du-r8a774c0 # for RZ/G2E compatible DU
+      - renesas,du-r8a774e1 # for RZ/G2H compatible DU
+      - renesas,du-r8a7779 # for R-Car H1 compatible DU
+      - renesas,du-r8a7790 # for R-Car H2 compatible DU
+      - renesas,du-r8a7791 # for R-Car M2-W compatible DU
+      - renesas,du-r8a7792 # for R-Car V2H compatible DU
+      - renesas,du-r8a7793 # for R-Car M2-N compatible DU
+      - renesas,du-r8a7794 # for R-Car E2 compatible DU
+      - renesas,du-r8a7795 # for R-Car H3 compatible DU
+      - renesas,du-r8a7796 # for R-Car M3-W compatible DU
+      - renesas,du-r8a77961 # for R-Car M3-W+ compatible DU
+      - renesas,du-r8a77965 # for R-Car M3-N compatible DU
+      - renesas,du-r8a77970 # for R-Car V3M compatible DU
+      - renesas,du-r8a77980 # for R-Car V3H compatible DU
+      - renesas,du-r8a77990 # for R-Car E3 compatible DU
+      - renesas,du-r8a77995 # for R-Car D3 compatible DU
+
+  reg:
+    maxItems: 1
+
+  # See compatible-specific constraints below.
+  clocks: true
+  clock-names: true
+  interrupts: true
+  resets: true
+  reset-names: true
+
+  ports:
+    type: object
+    description: |
+      The connections to the DU output video ports are modeled using the OF
+      graph bindings specified in Documentation/devicetree/bindings/graph.txt.
+      The number of ports and their assignment are model-dependent. Each port
+      shall have a single endpoint.
+
+    properties:
+      '#address-cells':
+        const: 1
+
+      '#size-cells':
+        const: 0
+
+    patternProperties:
+      "^port@[0-3]$":
+        type: object
+
+        properties:
+          reg:
+            maxItems: 1
+
+          endpoint:
+            type: object
+
+            properties:
+              remote-endpoint:
+                $ref: /schemas/types.yaml#/definitions/phandle
+
+            required:
+              - remote-endpoint
+
+            additionalProperties: false
+
+        additionalProperties: false
+
+    required:
+      - port@0
+      - port@1
+
+    additionalProperties: false
+
+  renesas,cmms:
+    $ref: "/schemas/types.yaml#/definitions/phandle-array"
+    description:
+      A list of phandles to the CMM instances present in the SoC, one for each
+      available DU channel.
+
+  renesas,vsps:
+    $ref: "/schemas/types.yaml#/definitions/phandle-array"
+    description:
+      A list of phandle and channel index tuples to the VSPs that handle the
+      memory interfaces for the DU channels. The phandle identifies the VSP
+      instance that serves the DU channel, and the channel index identifies
+      the LIF instance in that VSP.
+
+required:
+  - compatible
+  - reg
+  - clocks
+  - interrupts
+  - resets
+  - ports
+
+allOf:
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: renesas,du-r8a7779
+    then:
+      properties:
+        clocks:
+          minItems: 1
+          maxItems: 3
+          items:
+            - description: Functional clock
+            - description: DU_DOTCLKIN0 input clock
+            - description: DU_DOTCLKIN1 input clock
+
+        clock-names:
+          minItems: 1
+          maxItems: 3
+          items:
+            - const: du.0
+            - pattern: "^dclkin\\.[01]$"
+            - pattern: "^dclkin\\.[01]$"
+
+        interrupts:
+          maxItems: 1
+
+        resets:
+          maxItems: 1
+
+        ports:
+          properties:
+            port@0:
+              description: DPAD 0
+            port@1:
+              description: DPAD 1
+            # port@2 is TCON, not supported yet
+            port@2: false
+            port@3: false
+
+          required:
+            - port@0
+            - port@1
+
+      required:
+        - interrupts
+
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - renesas,du-r8a7743
+              - renesas,du-r8a7744
+              - renesas,du-r8a7791
+              - renesas,du-r8a7793
+    then:
+      properties:
+        clocks:
+          minItems: 2
+          maxItems: 4
+          items:
+            - description: Functional clock for DU0
+            - description: Functional clock for DU1
+            - description: DU_DOTCLKIN0 input clock
+            - description: DU_DOTCLKIN1 input clock
+
+        clock-names:
+          minItems: 2
+          maxItems: 4
+          items:
+            - const: du.0
+            - const: du.1
+            - pattern: "^dclkin\\.[01]$"
+            - pattern: "^dclkin\\.[01]$"
+
+        interrupts:
+          maxItems: 2
+
+        resets:
+          maxItems: 1
+
+        reset-names:
+          items:
+            - const: du.0
+
+        ports:
+          properties:
+            port@0:
+              description: DPAD 0
+            port@1:
+              description: LVDS 0
+            # port@2 is TCON, not supported yet
+            port@2: false
+            port@3: false
+
+          required:
+            - port@0
+            - port@1
+
+      required:
+        - clock-names
+        - interrupts
+        - resets
+        - reset-names
+
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - renesas,du-r8a7745
+              - renesas,du-r8a7792
+    then:
+      properties:
+        clocks:
+          minItems: 2
+          maxItems: 4
+          items:
+            - description: Functional clock for DU0
+            - description: Functional clock for DU1
+            - description: DU_DOTCLKIN0 input clock
+            - description: DU_DOTCLKIN1 input clock
+
+        clock-names:
+          minItems: 2
+          maxItems: 4
+          items:
+            - const: du.0
+            - const: du.1
+            - pattern: "^dclkin\\.[01]$"
+            - pattern: "^dclkin\\.[01]$"
+
+        interrupts:
+          maxItems: 2
+
+        resets:
+          maxItems: 1
+
+        reset-names:
+          items:
+            - const: du.0
+
+        ports:
+          properties:
+            port@0:
+              description: DPAD 0
+            port@1:
+              description: DPAD 1
+            port@2: false
+            port@3: false
+
+          required:
+            - port@0
+            - port@1
+
+      required:
+        - clock-names
+        - interrupts
+        - resets
+        - reset-names
+
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - renesas,du-r8a7794
+    then:
+      properties:
+        clocks:
+          minItems: 2
+          maxItems: 4
+          items:
+            - description: Functional clock for DU0
+            - description: Functional clock for DU1
+            - description: DU_DOTCLKIN0 input clock
+            - description: DU_DOTCLKIN1 input clock
+
+        clock-names:
+          minItems: 2
+          maxItems: 4
+          items:
+            - const: du.0
+            - const: du.1
+            - pattern: "^dclkin\\.[01]$"
+            - pattern: "^dclkin\\.[01]$"
+
+        interrupts:
+          maxItems: 2
+
+        resets:
+          maxItems: 1
+
+        reset-names:
+          items:
+            - const: du.0
+
+        ports:
+          properties:
+            port@0:
+              description: DPAD 0
+            port@1:
+              description: DPAD 1
+            # port@2 is TCON, not supported yet
+            port@2: false
+            port@3: false
+
+          required:
+            - port@0
+            - port@1
+
+      required:
+        - clock-names
+        - interrupts
+        - resets
+        - reset-names
+
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - renesas,du-r8a77470
+    then:
+      properties:
+        clocks:
+          minItems: 2
+          maxItems: 4
+          items:
+            - description: Functional clock for DU0
+            - description: Functional clock for DU1
+            - description: DU_DOTCLKIN0 input clock
+            - description: DU_DOTCLKIN1 input clock
+
+        clock-names:
+          minItems: 2
+          maxItems: 4
+          items:
+            - const: du.0
+            - const: du.1
+            - pattern: "^dclkin\\.[01]$"
+            - pattern: "^dclkin\\.[01]$"
+
+        interrupts:
+          maxItems: 2
+
+        resets:
+          maxItems: 1
+
+        reset-names:
+          items:
+            - const: du.0
+
+        ports:
+          properties:
+            port@0:
+              description: DPAD 0
+            port@1:
+              description: DPAD 1
+            port@2:
+              description: LVDS 0
+            # port@3 is DVENC, not supported yet
+            port@3: false
+
+          required:
+            - port@0
+            - port@1
+            - port@2
+
+      required:
+        - clock-names
+        - interrupts
+        - resets
+        - reset-names
+
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - renesas,du-r8a7742
+              - renesas,du-r8a7790
+    then:
+      properties:
+        clocks:
+          minItems: 3
+          maxItems: 6
+          items:
+            - description: Functional clock for DU0
+            - description: Functional clock for DU1
+            - description: Functional clock for DU2
+            - description: DU_DOTCLKIN0 input clock
+            - description: DU_DOTCLKIN1 input clock
+            - description: DU_DOTCLKIN2 input clock
+
+        clock-names:
+          minItems: 3
+          maxItems: 6
+          items:
+            - const: du.0
+            - const: du.1
+            - const: du.2
+            - pattern: "^dclkin\\.[012]$"
+            - pattern: "^dclkin\\.[012]$"
+            - pattern: "^dclkin\\.[012]$"
+
+        interrupts:
+          maxItems: 3
+
+        resets:
+          maxItems: 1
+
+        reset-names:
+          items:
+            - const: du.0
+
+        ports:
+          properties:
+            port@0:
+              description: DPAD 0
+            port@1:
+              description: LVDS 0
+            port@2:
+              description: LVDS 1
+            # port@3 is TCON, not supported yet
+            port@3: false
+
+          required:
+            - port@0
+            - port@1
+            - port@2
+
+      required:
+        - clock-names
+        - interrupts
+        - resets
+        - reset-names
+
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - renesas,du-r8a7795
+    then:
+      properties:
+        clocks:
+          minItems: 4
+          maxItems: 8
+          items:
+            - description: Functional clock for DU0
+            - description: Functional clock for DU1
+            - description: Functional clock for DU2
+            - description: Functional clock for DU4
+            - description: DU_DOTCLKIN0 input clock
+            - description: DU_DOTCLKIN1 input clock
+            - description: DU_DOTCLKIN2 input clock
+            - description: DU_DOTCLKIN3 input clock
+
+        clock-names:
+          minItems: 4
+          maxItems: 8
+          items:
+            - const: du.0
+            - const: du.1
+            - const: du.2
+            - const: du.3
+            - pattern: "^dclkin\\.[0123]$"
+            - pattern: "^dclkin\\.[0123]$"
+            - pattern: "^dclkin\\.[0123]$"
+            - pattern: "^dclkin\\.[0123]$"
+
+        interrupts:
+          maxItems: 4
+
+        resets:
+          maxItems: 2
+
+        reset-names:
+          items:
+            - const: du.0
+            - const: du.2
+
+        ports:
+          properties:
+            port@0:
+              description: DPAD 0
+            port@1:
+              description: HDMI 0
+            port@2:
+              description: HDMI 1
+            port@3:
+              description: LVDS 0
+
+          required:
+            - port@0
+            - port@1
+            - port@2
+            - port@3
+
+        renesas,cmms:
+          minItems: 4
+
+        renesas,vsps:
+          minItems: 4
+
+      required:
+        - clock-names
+        - interrupts
+        - resets
+        - reset-names
+        - renesas,vsps
+
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - renesas,du-r8a774a1
+              - renesas,du-r8a7796
+              - renesas,du-r8a77961
+    then:
+      properties:
+        clocks:
+          minItems: 3
+          maxItems: 6
+          items:
+            - description: Functional clock for DU0
+            - description: Functional clock for DU1
+            - description: Functional clock for DU2
+            - description: DU_DOTCLKIN0 input clock
+            - description: DU_DOTCLKIN1 input clock
+            - description: DU_DOTCLKIN2 input clock
+
+        clock-names:
+          minItems: 3
+          maxItems: 6
+          items:
+            - const: du.0
+            - const: du.1
+            - const: du.2
+            - pattern: "^dclkin\\.[012]$"
+            - pattern: "^dclkin\\.[012]$"
+            - pattern: "^dclkin\\.[012]$"
+
+        interrupts:
+          maxItems: 3
+
+        resets:
+          maxItems: 2
+
+        reset-names:
+          items:
+            - const: du.0
+            - const: du.2
+
+        ports:
+          properties:
+            port@0:
+              description: DPAD 0
+            port@1:
+              description: HDMI 0
+            port@2:
+              description: LVDS 0
+            port@3: false
+
+          required:
+            - port@0
+            - port@1
+            - port@2
+
+        renesas,cmms:
+          minItems: 3
+
+        renesas,vsps:
+          minItems: 3
+
+      required:
+        - clock-names
+        - interrupts
+        - resets
+        - reset-names
+        - renesas,vsps
+
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - renesas,du-r8a774b1
+              - renesas,du-r8a774e1
+              - renesas,du-r8a77965
+    then:
+      properties:
+        clocks:
+          minItems: 3
+          maxItems: 6
+          items:
+            - description: Functional clock for DU0
+            - description: Functional clock for DU1
+            - description: Functional clock for DU3
+            - description: DU_DOTCLKIN0 input clock
+            - description: DU_DOTCLKIN1 input clock
+            - description: DU_DOTCLKIN3 input clock
+
+        clock-names:
+          minItems: 3
+          maxItems: 6
+          items:
+            - const: du.0
+            - const: du.1
+            - const: du.3
+            - pattern: "^dclkin\\.[013]$"
+            - pattern: "^dclkin\\.[013]$"
+            - pattern: "^dclkin\\.[013]$"
+
+        interrupts:
+          maxItems: 3
+
+        resets:
+          maxItems: 2
+
+        reset-names:
+          items:
+            - const: du.0
+            - const: du.3
+
+        ports:
+          properties:
+            port@0:
+              description: DPAD 0
+            port@1:
+              description: HDMI 0
+            port@2:
+              description: LVDS 0
+            port@3: false
+
+          required:
+            - port@0
+            - port@1
+            - port@2
+
+        renesas,cmms:
+          minItems: 3
+
+        renesas,vsps:
+          minItems: 3
+
+      required:
+        - clock-names
+        - interrupts
+        - resets
+        - reset-names
+        - renesas,vsps
+
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - renesas,du-r8a77970
+              - renesas,du-r8a77980
+    then:
+      properties:
+        clocks:
+          minItems: 1
+          maxItems: 2
+          items:
+            - description: Functional clock for DU0
+            - description: DU_DOTCLKIN0 input clock
+
+        clock-names:
+          minItems: 1
+          maxItems: 2
+          items:
+            - const: du.0
+            - const: dclkin.0
+
+        interrupts:
+          maxItems: 1
+
+        resets:
+          maxItems: 1
+
+        reset-names:
+          items:
+            - const: du.0
+
+        ports:
+          properties:
+            port@0:
+              description: DPAD 0
+            port@1:
+              description: LVDS 0
+            port@2: false
+            port@3: false
+
+          required:
+            - port@0
+            - port@1
+
+        renesas,vsps:
+          minItems: 1
+
+      required:
+        - clock-names
+        - interrupts
+        - resets
+        - reset-names
+        - renesas,vsps
+
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - renesas,du-r8a774c0
+              - renesas,du-r8a77990
+              - renesas,du-r8a77995
+    then:
+      properties:
+        clocks:
+          minItems: 2
+          maxItems: 4
+          items:
+            - description: Functional clock for DU0
+            - description: Functional clock for DU1
+            - description: DU_DOTCLKIN0 input clock
+            - description: DU_DOTCLKIN1 input clock
+
+        clock-names:
+          minItems: 2
+          maxItems: 4
+          items:
+            - const: du.0
+            - const: du.1
+            - pattern: "^dclkin\\.[01]$"
+            - pattern: "^dclkin\\.[01]$"
+
+        interrupts:
+          maxItems: 2
+
+        resets:
+          maxItems: 1
+
+        reset-names:
+          items:
+            - const: du.0
+
+        ports:
+          properties:
+            port@0:
+              description: DPAD 0
+            port@1:
+              description: LVDS 0
+            port@2:
+              description: LVDS 1
+            # port@3 is TCON, not supported yet
+            port@3: false
+
+          required:
+            - port@0
+            - port@1
+            - port@2
+
+        renesas,cmms:
+          minItems: 2
+
+        renesas,vsps:
+          minItems: 2
+
+      required:
+        - clock-names
+        - interrupts
+        - resets
+        - reset-names
+        - renesas,vsps
+
+additionalProperties: false
+
+examples:
+  # R-Car H3 ES2.0 DU
+  - |
+    #include <dt-bindings/clock/renesas-cpg-mssr.h>
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+
+    display@feb00000 {
+        compatible = "renesas,du-r8a7795";
+        reg = <0xfeb00000 0x80000>;
+        interrupts = <GIC_SPI 256 IRQ_TYPE_LEVEL_HIGH>,
+                     <GIC_SPI 268 IRQ_TYPE_LEVEL_HIGH>,
+                     <GIC_SPI 269 IRQ_TYPE_LEVEL_HIGH>,
+                     <GIC_SPI 270 IRQ_TYPE_LEVEL_HIGH>;
+        clocks = <&cpg CPG_MOD 724>,
+                 <&cpg CPG_MOD 723>,
+                 <&cpg CPG_MOD 722>,
+                 <&cpg CPG_MOD 721>;
+        clock-names = "du.0", "du.1", "du.2", "du.3";
+        resets = <&cpg 724>, <&cpg 722>;
+        reset-names = "du.0", "du.2";
+
+        renesas,cmms = <&cmm0>, <&cmm1>, <&cmm2>, <&cmm3>;
+        renesas,vsps = <&vspd0 0>, <&vspd1 0>, <&vspd2 0>, <&vspd0 1>;
+
+        ports {
+            #address-cells = <1>;
+            #size-cells = <0>;
+
+            port@0 {
+                reg = <0>;
+                endpoint {
+                    remote-endpoint = <&adv7123_in>;
+                };
+            };
+            port@1 {
+                reg = <1>;
+                endpoint {
+                    remote-endpoint = <&dw_hdmi0_in>;
+                };
+            };
+            port@2 {
+                reg = <2>;
+                endpoint {
+                    remote-endpoint = <&dw_hdmi1_in>;
+                };
+            };
+            port@3 {
+                reg = <3>;
+                endpoint {
+                    remote-endpoint = <&lvds0_in>;
+                };
+            };
+        };
+    };
+
+...
diff --git a/MAINTAINERS b/MAINTAINERS
index 7b073c41c3a0..22663c2cb3a8 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -5905,7 +5905,7 @@ S:	Supported
 T:	git git://linuxtv.org/pinchartl/media drm/du/next
 F:	Documentation/devicetree/bindings/display/bridge/renesas,dw-hdmi.txt
 F:	Documentation/devicetree/bindings/display/bridge/renesas,lvds.yaml
-F:	Documentation/devicetree/bindings/display/renesas,du.txt
+F:	Documentation/devicetree/bindings/display/renesas,du.yaml
 F:	drivers/gpu/drm/rcar-du/
 F:	drivers/gpu/drm/shmobile/
 F:	include/linux/platform_data/shmob_drm.h
-- 
Regards,

Laurent Pinchart

