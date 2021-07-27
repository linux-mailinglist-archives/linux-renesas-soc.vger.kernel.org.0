Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8A1383D7E1B
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 27 Jul 2021 20:55:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230270AbhG0Szv (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 27 Jul 2021 14:55:51 -0400
Received: from relmlor2.renesas.com ([210.160.252.172]:35412 "EHLO
        relmlie6.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S230290AbhG0Szv (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 27 Jul 2021 14:55:51 -0400
X-IronPort-AV: E=Sophos;i="5.84,274,1620658800"; 
   d="scan'208";a="88899508"
Received: from unknown (HELO relmlir5.idc.renesas.com) ([10.200.68.151])
  by relmlie6.idc.renesas.com with ESMTP; 28 Jul 2021 03:55:50 +0900
Received: from localhost.localdomain (unknown [10.226.92.236])
        by relmlir5.idc.renesas.com (Postfix) with ESMTP id BCEFF4005161;
        Wed, 28 Jul 2021 03:55:47 +0900 (JST)
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
Subject: [PATCH v5 5/6] dt-bindings: usb: renesas,usbhs: Document RZ/G2L bindings
Date:   Tue, 27 Jul 2021 19:55:26 +0100
Message-Id: <20210727185527.19907-6-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210727185527.19907-1-biju.das.jz@bp.renesas.com>
References: <20210727185527.19907-1-biju.das.jz@bp.renesas.com>
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Document RZ/G2L (R9A07G044L) SoC bindings.

Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
Reviewed-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
---
v4->v5:
 * Added interrupts maxitems=1 for SoC's other than RZ/G2L.
v3->v4:
 * Added maxitems in interrupt property as per Rob's suggestion.
v3:
 * Updated the bindings as per the USBPHY control IP.
---
 .../bindings/usb/renesas,usbhs.yaml           | 26 +++++++++++++++++--
 1 file changed, 24 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/usb/renesas,usbhs.yaml b/Documentation/devicetree/bindings/usb/renesas,usbhs.yaml
index ad73339ffe1d..012fe80a7611 100644
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
@@ -59,7 +61,8 @@ properties:
       - description: USB 2.0 clock selector
 
   interrupts:
-    maxItems: 1
+    minItems: 1
+    maxItems: 4
 
   renesas,buswait:
     $ref: /schemas/types.yaml#/definitions/uint32
@@ -108,6 +111,25 @@ required:
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
+    else:
+      properties:
+        interrupts:
+          maxItems: 1
+
 additionalProperties: false
 
 examples:
-- 
2.17.1

