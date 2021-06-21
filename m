Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 81DF63AE63F
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 21 Jun 2021 11:40:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230415AbhFUJm0 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 21 Jun 2021 05:42:26 -0400
Received: from relmlor1.renesas.com ([210.160.252.171]:3143 "EHLO
        relmlie5.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S229641AbhFUJm0 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 21 Jun 2021 05:42:26 -0400
X-IronPort-AV: E=Sophos;i="5.83,289,1616425200"; 
   d="scan'208";a="85045918"
Received: from unknown (HELO relmlir5.idc.renesas.com) ([10.200.68.151])
  by relmlie5.idc.renesas.com with ESMTP; 21 Jun 2021 18:40:11 +0900
Received: from localhost.localdomain (unknown [10.226.92.241])
        by relmlir5.idc.renesas.com (Postfix) with ESMTP id 4D8A2400C4E6;
        Mon, 21 Jun 2021 18:40:09 +0900 (JST)
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
Subject: [PATCH v2 07/11] dt-bindings: usb: generic-ehci: Document RZ/G2L SoC bindings
Date:   Mon, 21 Jun 2021 10:39:39 +0100
Message-Id: <20210621093943.12143-8-biju.das.jz@bp.renesas.com>
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
 .../devicetree/bindings/usb/generic-ehci.yaml | 33 +++++++++++++++++--
 1 file changed, 31 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/usb/generic-ehci.yaml b/Documentation/devicetree/bindings/usb/generic-ehci.yaml
index 8089dc956ba3..822e667e28a5 100644
--- a/Documentation/devicetree/bindings/usb/generic-ehci.yaml
+++ b/Documentation/devicetree/bindings/usb/generic-ehci.yaml
@@ -22,6 +22,27 @@ allOf:
         reg:
           maxItems: 1
 
+  - if:
+      properties:
+        compatible:
+            contains:
+              const: renesas,r9a07g044-ehci
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
+
 properties:
   compatible:
     oneOf:
@@ -57,6 +78,7 @@ properties:
               - ibm,476gtr-ehci
               - nxp,lpc1850-ehci
               - qca,ar7100-ehci
+              - renesas,r9a07g044-ehci
               - snps,hsdk-v1.0-ehci
               - socionext,uniphier-ehci
           - const: generic-ehci
@@ -134,14 +156,21 @@ properties:
       Phandle of a companion.
 
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

