Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3318A378EE5
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 10 May 2021 15:52:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236753AbhEJNcO (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 10 May 2021 09:32:14 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33368 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1343771AbhEJMOY (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 10 May 2021 08:14:24 -0400
Received: from michel.telenet-ops.be (michel.telenet-ops.be [IPv6:2a02:1800:110:4::f00:18])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3D396C061760
        for <linux-renesas-soc@vger.kernel.org>; Mon, 10 May 2021 05:10:44 -0700 (PDT)
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed20:f937:4595:45ff:bcbf])
        by michel.telenet-ops.be with bizsmtp
        id 30Ai2500c4jQ7kl060AilM; Mon, 10 May 2021 14:10:42 +0200
Received: from rox.of.borg ([192.168.97.57])
        by ramsan.of.borg with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
        (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1lg4kE-004QgL-2e; Mon, 10 May 2021 14:10:42 +0200
Received: from geert by rox.of.borg with local (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1lg4kD-00HQCb-Jd; Mon, 10 May 2021 14:10:41 +0200
From:   Geert Uytterhoeven <geert+renesas@glider.be>
To:     Rob Herring <robh+dt@kernel.org>,
        Kishon Vijay Abraham I <kishon@ti.com>,
        Vinod Koul <vkoul@kernel.org>,
        Sergei Shtylyov <sergei.shtylyov@gmail.com>
Cc:     devicetree@vger.kernel.org, linux-phy@lists.infradead.org,
        linux-renesas-soc@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH] dt-bindings: phy: renesas,rcar-gen3-pcie-phy: Convert to json-schema
Date:   Mon, 10 May 2021 14:10:40 +0200
Message-Id: <0301c3a7dae9afde115b6437a11c23ab85cb8b75.1620648490.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Convert the Renesas R-Car Gen3 PCIe PHY Device Tree binding
documentation to json-schema.

Update the example to match reality.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
I have listed Sergei as the maintainer, as he wrote the original driver
and bindings.  Sergei: Please scream if this is inappropriate ;-)
---
 .../bindings/phy/rcar-gen3-phy-pcie.txt       | 24 ---------
 .../phy/renesas,rcar-gen3-pcie-phy.yaml       | 53 +++++++++++++++++++
 2 files changed, 53 insertions(+), 24 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/phy/rcar-gen3-phy-pcie.txt
 create mode 100644 Documentation/devicetree/bindings/phy/renesas,rcar-gen3-pcie-phy.yaml

diff --git a/Documentation/devicetree/bindings/phy/rcar-gen3-phy-pcie.txt b/Documentation/devicetree/bindings/phy/rcar-gen3-phy-pcie.txt
deleted file mode 100644
index 63853b35e0830d21..0000000000000000
--- a/Documentation/devicetree/bindings/phy/rcar-gen3-phy-pcie.txt
+++ /dev/null
@@ -1,24 +0,0 @@
-* Renesas R-Car generation 3 PCIe PHY
-
-This file provides information on what the device node for the R-Car
-generation 3 PCIe PHY contains.
-
-Required properties:
-- compatible: "renesas,r8a77980-pcie-phy" if the device is a part of the
-	      R8A77980 SoC.
-- reg: offset and length of the register block.
-- clocks: clock phandle and specifier pair.
-- power-domains: power domain phandle and specifier pair.
-- resets: reset phandle and specifier pair.
-- #phy-cells: see phy-bindings.txt in the same directory, must be <0>.
-
-Example (R-Car V3H):
-
-	pcie-phy@e65d0000 {
-		compatible = "renesas,r8a77980-pcie-phy";
-		reg = <0 0xe65d0000 0 0x8000>;
-		#phy-cells = <0>;
-		clocks = <&cpg CPG_MOD 319>;
-		power-domains = <&sysc 32>;
-		resets = <&cpg 319>;
-	};
diff --git a/Documentation/devicetree/bindings/phy/renesas,rcar-gen3-pcie-phy.yaml b/Documentation/devicetree/bindings/phy/renesas,rcar-gen3-pcie-phy.yaml
new file mode 100644
index 0000000000000000..247ef7c47cf5b52b
--- /dev/null
+++ b/Documentation/devicetree/bindings/phy/renesas,rcar-gen3-pcie-phy.yaml
@@ -0,0 +1,53 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/phy/renesas,rcar-gen3-pcie-phy.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Renesas R-Car Generation 3 PCIe PHY
+
+maintainers:
+  - Sergei Shtylyov <sergei.shtylyov@gmail.com>
+
+properties:
+  compatible:
+    const: renesas,r8a77980-pcie-phy
+
+  reg:
+    maxItems: 1
+
+  clocks:
+    maxItems: 1
+
+  power-domains:
+    maxItems: 1
+
+  resets:
+    maxItems: 1
+
+  '#phy-cells':
+    const: 0
+
+required:
+  - compatible
+  - reg
+  - clocks
+  - power-domains
+  - resets
+  - '#phy-cells'
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/clock/r8a77980-cpg-mssr.h>
+    #include <dt-bindings/power/r8a77980-sysc.h>
+
+    pcie-phy@e65d0000 {
+            compatible = "renesas,r8a77980-pcie-phy";
+            reg = <0xe65d0000 0x8000>;
+            #phy-cells = <0>;
+            clocks = <&cpg CPG_MOD 319>;
+            power-domains = <&sysc R8A77980_PD_ALWAYS_ON>;
+            resets = <&cpg 319>;
+    };
-- 
2.25.1

