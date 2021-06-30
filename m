Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 377673B7E1F
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 30 Jun 2021 09:31:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232937AbhF3Hd3 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 30 Jun 2021 03:33:29 -0400
Received: from relmlor2.renesas.com ([210.160.252.172]:58995 "EHLO
        relmlie6.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S232785AbhF3Hd3 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 30 Jun 2021 03:33:29 -0400
X-IronPort-AV: E=Sophos;i="5.83,311,1616425200"; 
   d="scan'208";a="85884706"
Received: from unknown (HELO relmlir6.idc.renesas.com) ([10.200.68.152])
  by relmlie6.idc.renesas.com with ESMTP; 30 Jun 2021 16:31:00 +0900
Received: from localhost.localdomain (unknown [10.226.93.82])
        by relmlir6.idc.renesas.com (Postfix) with ESMTP id E618441DBA50;
        Wed, 30 Jun 2021 16:30:57 +0900 (JST)
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
Subject: [PATCH v3 07/11] dt-bindings: phy: renesas,usb2-phy: Document RZ/G2L phy bindings
Date:   Wed, 30 Jun 2021 08:30:09 +0100
Message-Id: <20210630073013.22415-8-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210630073013.22415-1-biju.das.jz@bp.renesas.com>
References: <20210630073013.22415-1-biju.das.jz@bp.renesas.com>
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Document USB phy bindings for RZ/G2L SoC.

RZ/G2L USB2.0 phy uses line ctrl register for OTG_ID pin changes. Apart
from this it uses a different OTG-BC interrupt bit for device recognition.

Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
Reviewed-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
---
v2->v3
 * Created a new compatible for RZ/G2L as per Geert's suggestion.
 * Added resets required properties for RZ/G2L SoC.
---
 .../bindings/phy/renesas,usb2-phy.yaml         | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)

diff --git a/Documentation/devicetree/bindings/phy/renesas,usb2-phy.yaml b/Documentation/devicetree/bindings/phy/renesas,usb2-phy.yaml
index d5dc5a3cdceb..a7e585ff28dc 100644
--- a/Documentation/devicetree/bindings/phy/renesas,usb2-phy.yaml
+++ b/Documentation/devicetree/bindings/phy/renesas,usb2-phy.yaml
@@ -30,6 +30,9 @@ properties:
               - renesas,usb2-phy-r8a77995 # R-Car D3
           - const: renesas,rcar-gen3-usb2-phy
 
+      - items:
+          - const: renesas,usb2-phy-r9a07g044 # RZ/G2{L,LC}
+
   reg:
     maxItems: 1
 
@@ -91,6 +94,21 @@ required:
   - clocks
   - '#phy-cells'
 
+allOf:
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: renesas,usb2-phy-r9a07g044
+    then:
+      properties:
+        resets:
+          items:
+            - description: USB phy reset
+            - description: reset of USB 2.0 host side
+      required:
+        - resets
+
 additionalProperties: false
 
 examples:
-- 
2.17.1

