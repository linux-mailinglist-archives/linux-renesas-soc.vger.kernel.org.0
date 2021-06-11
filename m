Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7997F3A4334
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 11 Jun 2021 15:46:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230409AbhFKNss (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 11 Jun 2021 09:48:48 -0400
Received: from relmlor1.renesas.com ([210.160.252.171]:2891 "EHLO
        relmlie5.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S230373AbhFKNss (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 11 Jun 2021 09:48:48 -0400
X-IronPort-AV: E=Sophos;i="5.83,265,1616425200"; 
   d="scan'208";a="84106301"
Received: from unknown (HELO relmlir6.idc.renesas.com) ([10.200.68.152])
  by relmlie5.idc.renesas.com with ESMTP; 11 Jun 2021 22:46:50 +0900
Received: from localhost.localdomain (unknown [10.226.92.121])
        by relmlir6.idc.renesas.com (Postfix) with ESMTP id DB1B24274BD0;
        Fri, 11 Jun 2021 22:46:47 +0900 (JST)
From:   Biju Das <biju.das.jz@bp.renesas.com>
To:     Rob Herring <robh+dt@kernel.org>
Cc:     Biju Das <biju.das.jz@bp.renesas.com>,
        Kishon Vijay Abraham I <kishon@ti.com>,
        Vinod Koul <vkoul@kernel.org>, linux-phy@lists.infradead.org,
        devicetree@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Biju Das <biju.das@bp.renesas.com>,
        Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        linux-renesas-soc@vger.kernel.org
Subject: [PATCH 1/6] dt-bindings: phy: renesas: Document RZ/G2L USB PHY Control bindings
Date:   Fri, 11 Jun 2021 14:46:37 +0100
Message-Id: <20210611134642.24029-2-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210611134642.24029-1-biju.das.jz@bp.renesas.com>
References: <20210611134642.24029-1-biju.das.jz@bp.renesas.com>
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Add device tree binding document for RZ/G2L USB PHY control driver.

Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
Reviewed-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
---
 .../phy/renesas,rzg2l-usbphyctrl.yaml         | 50 +++++++++++++++++++
 1 file changed, 50 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/phy/renesas,rzg2l-usbphyctrl.yaml

diff --git a/Documentation/devicetree/bindings/phy/renesas,rzg2l-usbphyctrl.yaml b/Documentation/devicetree/bindings/phy/renesas,rzg2l-usbphyctrl.yaml
new file mode 100644
index 000000000000..5fd316a2e79e
--- /dev/null
+++ b/Documentation/devicetree/bindings/phy/renesas,rzg2l-usbphyctrl.yaml
@@ -0,0 +1,50 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/phy/renesas,rzg2l-usbphyctrl.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Renesas RZ/G2L USB2.0 PHY Control
+
+maintainers:
+  - Biju Das <biju.das.jz@bp.renesas.com>
+
+description:
+  The RZ/G2L USB2.0 PHY Control mainly controls reset and power down of the
+  USB/PHY.
+
+properties:
+  compatible:
+    items:
+      - enum:
+          - renesas,r9a07g044-usbphyctrl # RZ/G2{L,LC}
+      - const: renesas,rzg2l-usbphyctrl
+
+  reg:
+    maxItems: 1
+
+  '#phy-cells':
+    # see phy-bindings.txt in the same directory
+    const: 1
+    description: |
+      The phandle's argument in the PHY specifier is the phy reset control bit
+      of usb phy control.
+      0 = Port 1 Phy reset
+      1 = Port 2 Phy reset
+    enum: [ 0, 1 ]
+
+required:
+  - compatible
+  - reg
+  - '#phy-cells'
+
+additionalProperties: false
+
+examples:
+  - |
+    usbphyctrl@11c40000 {
+        compatible = "renesas,r9a07g044-usbphyctrl",
+                     "renesas,rzg2l-usbphyctrl";
+        reg = <0x11c40000 0x10000>;
+        #phy-cells = <1>;
+    };
-- 
2.17.1

