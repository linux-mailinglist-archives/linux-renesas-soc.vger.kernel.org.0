Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EB6283CD494
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 19 Jul 2021 14:19:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236937AbhGSLjK (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 19 Jul 2021 07:39:10 -0400
Received: from relmlor2.renesas.com ([210.160.252.172]:59972 "EHLO
        relmlie6.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S236916AbhGSLjK (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 19 Jul 2021 07:39:10 -0400
X-IronPort-AV: E=Sophos;i="5.84,252,1620658800"; 
   d="scan'208";a="88077919"
Received: from unknown (HELO relmlir5.idc.renesas.com) ([10.200.68.151])
  by relmlie6.idc.renesas.com with ESMTP; 19 Jul 2021 21:19:49 +0900
Received: from localhost.localdomain (unknown [10.226.92.6])
        by relmlir5.idc.renesas.com (Postfix) with ESMTP id C1A7D400855B;
        Mon, 19 Jul 2021 21:19:47 +0900 (JST)
From:   Biju Das <biju.das.jz@bp.renesas.com>
To:     Philipp Zabel <p.zabel@pengutronix.de>,
        Rob Herring <robh+dt@kernel.org>
Cc:     Biju Das <biju.das.jz@bp.renesas.com>, devicetree@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Biju Das <biju.das@bp.renesas.com>,
        Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        linux-renesas-soc@vger.kernel.org
Subject: [PATCH v4 03/10] dt-bindings: reset: Document RZ/G2L USBPHY Control bindings
Date:   Mon, 19 Jul 2021 13:19:31 +0100
Message-Id: <20210719121938.6532-4-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210719121938.6532-1-biju.das.jz@bp.renesas.com>
References: <20210719121938.6532-1-biju.das.jz@bp.renesas.com>
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Add device tree binding document for RZ/G2L USBPHY Control Device.
It mainly controls reset and power down of the USB/PHY.

Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
Reviewed-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Reviewed-by: Rob Herring <robh@kernel.org>
---
v3->v4:
  * Dropped reset reference.
  * Added Rb-tag from Rob.
 v3:
  * New patch.
  * Modelled USBPHY control from phy bindings to reset bindings, since the
    IP mainly contols the reset of USB PHY.     
---
 .../reset/renesas,rzg2l-usbphy-ctrl.yaml      | 65 +++++++++++++++++++
 1 file changed, 65 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/reset/renesas,rzg2l-usbphy-ctrl.yaml

diff --git a/Documentation/devicetree/bindings/reset/renesas,rzg2l-usbphy-ctrl.yaml b/Documentation/devicetree/bindings/reset/renesas,rzg2l-usbphy-ctrl.yaml
new file mode 100644
index 000000000000..b13514e6783d
--- /dev/null
+++ b/Documentation/devicetree/bindings/reset/renesas,rzg2l-usbphy-ctrl.yaml
@@ -0,0 +1,65 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/reset/renesas,rzg2l-usbphy-ctrl.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Renesas RZ/G2L USBPHY Control
+
+maintainers:
+  - Biju Das <biju.das.jz@bp.renesas.com>
+
+description:
+  The RZ/G2L USBPHY Control mainly controls reset and power down of the
+  USB/PHY.
+
+properties:
+  compatible:
+    items:
+      - enum:
+          - renesas,r9a07g044-usbphy-ctrl # RZ/G2{L,LC}
+      - const: renesas,rzg2l-usbphy-ctrl
+
+  reg:
+    maxItems: 1
+
+  clocks:
+    maxItems: 1
+
+  resets:
+    maxItems: 1
+
+  power-domains:
+    maxItems: 1
+
+  '#reset-cells':
+    const: 1
+    description: |
+      The phandle's argument in the reset specifier is the PHY reset associated
+      with the USB port.
+      0 = Port 1 Phy reset
+      1 = Port 2 Phy reset
+
+required:
+  - compatible
+  - reg
+  - clocks
+  - resets
+  - power-domains
+  - '#reset-cells'
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/clock/r9a07g044-cpg.h>
+
+    phyrst: usbphy-ctrl@11c40000 {
+        compatible = "renesas,r9a07g044-usbphy-ctrl",
+                     "renesas,rzg2l-usbphy-ctrl";
+        reg = <0x11c40000 0x10000>;
+        clocks = <&cpg CPG_MOD R9A07G044_USB_PCLK>;
+        resets = <&cpg R9A07G044_USB_PRESETN>;
+        power-domains = <&cpg>;
+        #reset-cells = <1>;
+    };
-- 
2.17.1

