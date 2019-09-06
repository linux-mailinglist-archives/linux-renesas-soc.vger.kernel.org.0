Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 37531AB6F4
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  6 Sep 2019 13:14:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728155AbfIFLOm (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 6 Sep 2019 07:14:42 -0400
Received: from kirsty.vergenet.net ([202.4.237.240]:33328 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726073AbfIFLOm (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 6 Sep 2019 07:14:42 -0400
Received: from reginn.horms.nl (watermunt.horms.nl [80.127.179.77])
        by kirsty.vergenet.net (Postfix) with ESMTPA id 5A6AC25B7AD;
        Fri,  6 Sep 2019 21:14:40 +1000 (AEST)
Received: by reginn.horms.nl (Postfix, from userid 7100)
        id 46A179445E7; Fri,  6 Sep 2019 13:14:38 +0200 (CEST)
From:   Simon Horman <horms+renesas@verge.net.au>
To:     Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     Magnus Damm <magnus.damm@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        devicetree@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        Simon Horman <horms+renesas@verge.net.au>
Subject: [PATCH] dt-bindings: arm: renesas: Convert 'renesas,prr' to json-schema
Date:   Fri,  6 Sep 2019 13:14:35 +0200
Message-Id: <20190906111435.5706-1-horms+renesas@verge.net.au>
X-Mailer: git-send-email 2.11.0
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Convert Renesas Product Register bindings documentation to json-schema.

Signed-off-by: Simon Horman <horms+renesas@verge.net.au>
---
Based on v5.3-rc1
Tested using:
  make dtbs_check DT_SCHEMA_FILES=Documentation/devicetree/bindings/arm/renesas,prr.yaml
---
 .../devicetree/bindings/arm/renesas,prr.txt        | 20 ------------
 .../devicetree/bindings/arm/renesas,prr.yaml       | 36 ++++++++++++++++++++++
 2 files changed, 36 insertions(+), 20 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/arm/renesas,prr.txt
 create mode 100644 Documentation/devicetree/bindings/arm/renesas,prr.yaml

diff --git a/Documentation/devicetree/bindings/arm/renesas,prr.txt b/Documentation/devicetree/bindings/arm/renesas,prr.txt
deleted file mode 100644
index 08e482e953ca..000000000000
--- a/Documentation/devicetree/bindings/arm/renesas,prr.txt
+++ /dev/null
@@ -1,20 +0,0 @@
-Renesas Product Register
-
-Most Renesas ARM SoCs have a Product Register or Boundary Scan ID Register that
-allows to retrieve SoC product and revision information.  If present, a device
-node for this register should be added.
-
-Required properties:
-  - compatible: Must be one of:
-    "renesas,prr"
-    "renesas,bsid"
-  - reg: Base address and length of the register block.
-
-
-Examples
---------
-
-	prr: chipid@ff000044 {
-		compatible = "renesas,prr";
-		reg = <0 0xff000044 0 4>;
-	};
diff --git a/Documentation/devicetree/bindings/arm/renesas,prr.yaml b/Documentation/devicetree/bindings/arm/renesas,prr.yaml
new file mode 100644
index 000000000000..9df003041456
--- /dev/null
+++ b/Documentation/devicetree/bindings/arm/renesas,prr.yaml
@@ -0,0 +1,36 @@
+# SPDX-License-Identifier: GPL-2.0
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/arm/renesas,prr.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Renesas Product Register
+
+maintainers:
+  - Geert Uytterhoeven <geert+renesas@glider.be>
+  - Magnus Damm <magnus.damm@gmail.com>
+
+description: |
+  Most Renesas ARM SoCs have a Product Register or Boundary Scan ID
+  Register that allows to retrieve SoC product and revision information.
+  If present, a device node for this register should be added.
+
+properties:
+  compatible:
+    oneOf:
+        - const: "renesas,prr"
+        - const: "renesas,bsid"
+  reg:
+    items:
+      - description: Base address and length of the register block.
+
+required:
+  - compatible
+  - reg
+
+examples:
+  - |
+    prr: chipid@ff000044 {
+        compatible = "renesas,prr";
+        reg = <0 0xff000044 0 4>;
+    };
-- 
2.11.0

