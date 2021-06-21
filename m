Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CDBB43AE63D
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 21 Jun 2021 11:40:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230403AbhFUJmY (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 21 Jun 2021 05:42:24 -0400
Received: from relmlor2.renesas.com ([210.160.252.172]:12185 "EHLO
        relmlie6.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S230397AbhFUJmX (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 21 Jun 2021 05:42:23 -0400
X-IronPort-AV: E=Sophos;i="5.83,289,1616425200"; 
   d="scan'208";a="84924687"
Received: from unknown (HELO relmlir5.idc.renesas.com) ([10.200.68.151])
  by relmlie6.idc.renesas.com with ESMTP; 21 Jun 2021 18:40:08 +0900
Received: from localhost.localdomain (unknown [10.226.92.241])
        by relmlir5.idc.renesas.com (Postfix) with ESMTP id 2C53E400C4E6;
        Mon, 21 Jun 2021 18:40:05 +0900 (JST)
From:   Biju Das <biju.das.jz@bp.renesas.com>
To:     Rob Herring <robh+dt@kernel.org>
Cc:     Biju Das <biju.das.jz@bp.renesas.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        linux-usb@vger.kernel.org, devicetree@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Biju Das <biju.das@bp.renesas.com>,
        Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        linux-renesas-soc@vger.kernel.org
Subject: [PATCH v2 06/11] dt-bindings: usb: generic-ohci: Document RZ/G2L SoC bindings
Date:   Mon, 21 Jun 2021 10:39:38 +0100
Message-Id: <20210621093943.12143-7-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210621093943.12143-1-biju.das.jz@bp.renesas.com>
References: <20210621093943.12143-1-biju.das.jz@bp.renesas.com>
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Renesas RZ/G2L SoC has USBPHY Control and USB2.0 PHY module. We need to
turn on both these phy modules before accessing host registers.

Apart from this, document the optional property dr_mode present on both
RZ/G2 and R-Car Gen3 SoCs.

Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
Reviewed-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
---
 .../devicetree/bindings/usb/generic-ohci.yaml | 32 +++++++++++++++++--
 1 file changed, 30 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/usb/generic-ohci.yaml b/Documentation/devicetree/bindings/usb/generic-ohci.yaml
index 0f5f6ea702d0..c0644fae5db9 100644
--- a/Documentation/devicetree/bindings/usb/generic-ohci.yaml
+++ b/Documentation/devicetree/bindings/usb/generic-ohci.yaml
@@ -8,6 +8,26 @@ title: USB OHCI Controller Device Tree Bindings
 
 allOf:
   - $ref: "usb-hcd.yaml"
+  - if:
+      properties:
+        compatible:
+            contains:
+              const: renesas,r9a07g044-ohci
+    then:
+      properties:
+        phys:
+          maxItems: 2
+        phy-names:
+          items:
+            - const: usbphyctrl
+            - const: usb
+    else:
+      properties:
+        phys:
+          maxItems: 1
+        phy-names:
+          items:
+            - const: usb
 
 maintainers:
   - Greg Kroah-Hartman <gregkh@linuxfoundation.org>
@@ -43,6 +63,7 @@ properties:
               - brcm,bcm7435-ohci
               - ibm,476gtr-ohci
               - ingenic,jz4740-ohci
+              - renesas,r9a07g044-ohci
               - snps,hsdk-v1.0-ohci
           - const: generic-ohci
       - const: generic-ohci
@@ -101,14 +122,21 @@ properties:
       Overrides the detected port count
 
   phys:
-    maxItems: 1
+    minItems: 1
+    maxItems: 2
 
   phy-names:
-    const: usb
+    minItems: 1
+    maxItems: 2
 
   iommus:
     maxItems: 1
 
+  dr_mode:
+    enum:
+      - host
+      - otg
+
 required:
   - compatible
   - reg
-- 
2.17.1

