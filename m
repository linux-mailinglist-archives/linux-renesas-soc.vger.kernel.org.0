Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5BD4ABC4F7
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 24 Sep 2019 11:36:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2504275AbfIXJg7 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 24 Sep 2019 05:36:59 -0400
Received: from kirsty.vergenet.net ([202.4.237.240]:42618 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2504273AbfIXJg6 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 24 Sep 2019 05:36:58 -0400
Received: from reginn.horms.nl (watermunt.horms.nl [80.127.179.77])
        by kirsty.vergenet.net (Postfix) with ESMTPA id 49A8A25B7AD;
        Tue, 24 Sep 2019 19:36:51 +1000 (AEST)
Received: by reginn.horms.nl (Postfix, from userid 7100)
        id 1A432944113; Tue, 24 Sep 2019 11:36:49 +0200 (CEST)
From:   Simon Horman <horms+renesas@verge.net.au>
To:     Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Andy Gross <agross@kernel.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     Magnus Damm <magnus.damm@gmail.com>,
        Yoshihiro Kaneko <ykaneko0929@gmail.com>,
        devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org,
        Simon Horman <horms+renesas@verge.net.au>
Subject: [PATCH v3 1/3] dt-bindings: bus: simple-pm-bus: convert bindings to json-schema
Date:   Tue, 24 Sep 2019 11:36:07 +0200
Message-Id: <20190924093609.22895-2-horms+renesas@verge.net.au>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20190924093609.22895-1-horms+renesas@verge.net.au>
References: <20190924093609.22895-1-horms+renesas@verge.net.au>
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Convert Simple Power-Managed Bus bindings documentation to json-schema.

As a side effect of this change only simple-pm-bus is used in example. A
follow-up patch will provide an example for the separately documented
Renesas Bus State Controller (BSC) that uses "renesas,bsc-sh73a0" and
"renesas,bsc" compat strings.

Signed-off-by: Simon Horman <horms+renesas@verge.net.au>
---
* Based on v5.3
* Tested using:
  # ARCH=arm64 make dtbs_check DT_SCHEMA_FILES=Documentation/devicetree/bindings/bus/simple-pm-bus.yaml
  # ARCH=arm   make dtbs_check DT_SCHEMA_FILES=Documentation/devicetree/bindings/bus/simple-pm-bus.yaml

v2
* Add SPDX line
* Remove extra blank line
* Add $nodename
* Remove extra leading space in compatible
* Update compatible to allow override by other schemas
* Allow #size-cells to be 1 or 2
* Do not limit ranges or clocks to 1 item
* Add anyOf requirement on ranges or clocks
* Update example based on msm8996.dtsi
---
 .../devicetree/bindings/bus/simple-pm-bus.txt      | 44 -------------
 .../devicetree/bindings/bus/simple-pm-bus.yaml     | 75 ++++++++++++++++++++++
 2 files changed, 75 insertions(+), 44 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/bus/simple-pm-bus.txt
 create mode 100644 Documentation/devicetree/bindings/bus/simple-pm-bus.yaml

diff --git a/Documentation/devicetree/bindings/bus/simple-pm-bus.txt b/Documentation/devicetree/bindings/bus/simple-pm-bus.txt
deleted file mode 100644
index 6f15037131ed..000000000000
--- a/Documentation/devicetree/bindings/bus/simple-pm-bus.txt
+++ /dev/null
@@ -1,44 +0,0 @@
-Simple Power-Managed Bus
-========================
-
-A Simple Power-Managed Bus is a transparent bus that doesn't need a real
-driver, as it's typically initialized by the boot loader.
-
-However, its bus controller is part of a PM domain, or under the control of a
-functional clock.  Hence, the bus controller's PM domain and/or clock must be
-enabled for child devices connected to the bus (either on-SoC or externally)
-to function.
-
-While "simple-pm-bus" follows the "simple-bus" set of properties, as specified
-in the Devicetree Specification, it is not an extension of "simple-bus".
-
-
-Required properties:
-  - compatible: Must contain at least "simple-pm-bus".
-		Must not contain "simple-bus".
-		It's recommended to let this be preceded by one or more
-		vendor-specific compatible values.
-  - #address-cells, #size-cells, ranges: Must describe the mapping between
-		parent address and child address spaces.
-
-Optional platform-specific properties for clock or PM domain control (at least
-one of them is required):
-  - clocks: Must contain a reference to the functional clock(s),
-  - power-domains: Must contain a reference to the PM domain.
-Please refer to the binding documentation for the clock and/or PM domain
-providers for more details.
-
-
-Example:
-
-	bsc: bus@fec10000 {
-		compatible = "renesas,bsc-sh73a0", "renesas,bsc",
-			     "simple-pm-bus";
-		#address-cells = <1>;
-		#size-cells = <1>;
-		ranges = <0 0 0x20000000>;
-		reg = <0xfec10000 0x400>;
-		interrupts = <0 39 IRQ_TYPE_LEVEL_HIGH>;
-		clocks = <&zb_clk>;
-		power-domains = <&pd_a4s>;
-	};
diff --git a/Documentation/devicetree/bindings/bus/simple-pm-bus.yaml b/Documentation/devicetree/bindings/bus/simple-pm-bus.yaml
new file mode 100644
index 000000000000..598b71d779b1
--- /dev/null
+++ b/Documentation/devicetree/bindings/bus/simple-pm-bus.yaml
@@ -0,0 +1,75 @@
+# SPDX-License-Identifier: GPL-2.0
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/bus/simple-pm-bus.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Simple Power-Managed Bus
+
+maintainers:
+  - Geert Uytterhoeven <geert+renesas@glider.be>
+
+description: |
+  A Simple Power-Managed Bus is a transparent bus that doesn't need a real
+  driver, as it's typically initialized by the boot loader.
+
+  However, its bus controller is part of a PM domain, or under the control
+  of a functional clock.  Hence, the bus controller's PM domain and/or
+  clock must be enabled for child devices connected to the bus (either
+  on-SoC or externally) to function.
+
+  While "simple-pm-bus" follows the "simple-bus" set of properties, as
+  specified in the Devicetree Specification, it is not an extension of
+  "simple-bus".
+
+properties:
+  $nodename:
+    pattern: "^bus([@-][0-9a-f]+)?$"
+
+  compatible:
+    contains:
+      const: simple-pm-bus
+    description:
+      Shall contain "simple-pm-bus" in addition to a optional bus-specific
+      compatible strings defined in individual pm-bus bindings.
+
+  '#address-cells':
+    const: 1
+
+  '#size-cells':
+    enum: [ 1, 2 ]
+
+  ranges: true
+
+  clocks: true
+    # Functional clocks
+    # Required if power-domains is absent, optional otherwise
+
+  power-domains:
+    # Required if clocks is absent, optional otherwise
+    minItems: 1
+
+required:
+  - compatible
+  - '#address-cells'
+  - '#size-cells'
+  - ranges
+
+anyOf:
+  - required:
+      - clocks
+  - required:
+      - power-domains
+
+examples:
+  - |
+    #include <dt-bindings/clock/qcom,gcc-msm8996.h>
+    #include <dt-bindings/interrupt-controller/irq.h>
+
+    bus {
+        power-domains = <&gcc AGGRE0_NOC_GDSC>;
+        compatible = "simple-pm-bus";
+        #address-cells = <1>;
+        #size-cells = <1>;
+        ranges;
+    };
-- 
2.11.0

