Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2607E3CD499
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 19 Jul 2021 14:20:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236965AbhGSLjU (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 19 Jul 2021 07:39:20 -0400
Received: from relmlor2.renesas.com ([210.160.252.172]:59972 "EHLO
        relmlie6.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S236845AbhGSLjU (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 19 Jul 2021 07:39:20 -0400
X-IronPort-AV: E=Sophos;i="5.84,252,1620658800"; 
   d="scan'208";a="88077936"
Received: from unknown (HELO relmlir5.idc.renesas.com) ([10.200.68.151])
  by relmlie6.idc.renesas.com with ESMTP; 19 Jul 2021 21:19:59 +0900
Received: from localhost.localdomain (unknown [10.226.92.6])
        by relmlir5.idc.renesas.com (Postfix) with ESMTP id 4C98B40061A1;
        Mon, 19 Jul 2021 21:19:57 +0900 (JST)
From:   Biju Das <biju.das.jz@bp.renesas.com>
To:     Rob Herring <robh+dt@kernel.org>
Cc:     Biju Das <biju.das.jz@bp.renesas.com>,
        Kishon Vijay Abraham I <kishon@ti.com>,
        Vinod Koul <vkoul@kernel.org>,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        linux-phy@lists.infradead.org, devicetree@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Biju Das <biju.das@bp.renesas.com>,
        Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        linux-renesas-soc@vger.kernel.org
Subject: [PATCH v4 06/10] dt-bindings: phy: renesas,usb2-phy: Document RZ/G2L phy bindings
Date:   Mon, 19 Jul 2021 13:19:34 +0100
Message-Id: <20210719121938.6532-7-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210719121938.6532-1-biju.das.jz@bp.renesas.com>
References: <20210719121938.6532-1-biju.das.jz@bp.renesas.com>
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Document USB phy bindings for RZ/G2L SoC.

RZ/G2L USB2.0 phy uses line ctrl register for OTG_ID pin changes. It uses
a different OTG-BC interrupt bit for device recognition. Apart from this,
the PHY reset is controlled by USBPHY control IP and Document reset is a
required property.

Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
Reviewed-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
---
v3->v4:
 * Removed second reset
 * Added family specific compatible string.
v2->v3
 * Created a new compatible for RZ/G2L as per Geert's suggestion.
 * Added resets required properties for RZ/G2L SoC.
---
 .../bindings/phy/renesas,usb2-phy.yaml        | 19 +++++++++++++++++++
 1 file changed, 19 insertions(+)

diff --git a/Documentation/devicetree/bindings/phy/renesas,usb2-phy.yaml b/Documentation/devicetree/bindings/phy/renesas,usb2-phy.yaml
index d5dc5a3cdceb..151158d7a224 100644
--- a/Documentation/devicetree/bindings/phy/renesas,usb2-phy.yaml
+++ b/Documentation/devicetree/bindings/phy/renesas,usb2-phy.yaml
@@ -30,6 +30,11 @@ properties:
               - renesas,usb2-phy-r8a77995 # R-Car D3
           - const: renesas,rcar-gen3-usb2-phy
 
+      - items:
+          - enum:
+              - renesas,usb2-phy-r9a07g044 # RZ/G2{L,LC}
+          - const: renesas,rzg2l-usb2-phy  # RZ/G2L family
+
   reg:
     maxItems: 1
 
@@ -91,6 +96,20 @@ required:
   - clocks
   - '#phy-cells'
 
+allOf:
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: renesas,rzg2l-usb2-phy
+    then:
+      properties:
+        resets:
+          description: |
+            USB/PHY reset associated with the port.
+      required:
+        - resets
+
 additionalProperties: false
 
 examples:
-- 
2.17.1

