Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7C41D3AE645
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 21 Jun 2021 11:40:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230397AbhFUJmb (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 21 Jun 2021 05:42:31 -0400
Received: from relmlor1.renesas.com ([210.160.252.171]:3143 "EHLO
        relmlie5.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S230429AbhFUJmb (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 21 Jun 2021 05:42:31 -0400
X-IronPort-AV: E=Sophos;i="5.83,289,1616425200"; 
   d="scan'208";a="85045934"
Received: from unknown (HELO relmlir5.idc.renesas.com) ([10.200.68.151])
  by relmlie5.idc.renesas.com with ESMTP; 21 Jun 2021 18:40:17 +0900
Received: from localhost.localdomain (unknown [10.226.92.241])
        by relmlir5.idc.renesas.com (Postfix) with ESMTP id 9FAB9400C75A;
        Mon, 21 Jun 2021 18:40:14 +0900 (JST)
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
Subject: [PATCH v2 09/11] dt-bindings: usb: renesas,usbhs: Document RZ/G2L bindings
Date:   Mon, 21 Jun 2021 10:39:41 +0100
Message-Id: <20210621093943.12143-10-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210621093943.12143-1-biju.das.jz@bp.renesas.com>
References: <20210621093943.12143-1-biju.das.jz@bp.renesas.com>
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Document RZ/G2L (R9A07G044L) SoC bindings.

Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
Reviewed-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
---
 .../bindings/usb/renesas,usbhs.yaml           | 44 ++++++++++++++++---
 1 file changed, 39 insertions(+), 5 deletions(-)

diff --git a/Documentation/devicetree/bindings/usb/renesas,usbhs.yaml b/Documentation/devicetree/bindings/usb/renesas,usbhs.yaml
index e67223d90bb7..d1f4bbf774c6 100644
--- a/Documentation/devicetree/bindings/usb/renesas,usbhs.yaml
+++ b/Documentation/devicetree/bindings/usb/renesas,usbhs.yaml
@@ -17,7 +17,9 @@ properties:
           - const: renesas,rza1-usbhs
 
       - items:
-          - const: renesas,usbhs-r7s9210 # RZ/A2
+          - enum:
+              - renesas,usbhs-r7s9210   # RZ/A2
+              - renesas,usbhs-r9a07g044 # RZ/G2{L,LC}
           - const: renesas,rza2-usbhs
 
       - items:
@@ -60,7 +62,8 @@ properties:
       - description: USB 2.0 clock selector
 
   interrupts:
-    maxItems: 1
+    minItems: 1
+    maxItems: 4
 
   renesas,buswait:
     $ref: /schemas/types.yaml#/definitions/uint32
@@ -74,11 +77,12 @@ properties:
       enabled.
 
   phys:
-    maxItems: 1
+    minItems: 1
+    maxItems: 2
 
   phy-names:
-    items:
-      - const: usb
+    minItems: 1
+    maxItems: 2
 
   dmas:
     minItems: 2
@@ -111,6 +115,36 @@ required:
   - clocks
   - interrupts
 
+allOf:
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: renesas,usbhs-r9a07g044
+    then:
+      properties:
+        interrupts:
+          items:
+            - description: U2P_IXL_INT
+            - description: U2P_INT_DMA[0]
+            - description: U2P_INT_DMA[1]
+            - description: U2P_INT_DMAERR
+        phys:
+          maxItems: 2
+        phy-names:
+          items:
+            - const: usbphyctrl
+            - const: usb
+    else:
+      properties:
+        interrupts:
+          maxItems: 1
+        phys:
+          maxItems: 1
+        phy-names:
+          items:
+            - const: usb
+
 additionalProperties: false
 
 examples:
-- 
2.17.1

