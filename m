Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5B72227149D
	for <lists+linux-renesas-soc@lfdr.de>; Sun, 20 Sep 2020 15:49:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726315AbgITNtU (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Sun, 20 Sep 2020 09:49:20 -0400
Received: from relmlor1.renesas.com ([210.160.252.171]:8429 "EHLO
        relmlie5.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726305AbgITNtT (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Sun, 20 Sep 2020 09:49:19 -0400
X-IronPort-AV: E=Sophos;i="5.77,282,1596466800"; 
   d="scan'208";a="57728990"
Received: from unknown (HELO relmlir5.idc.renesas.com) ([10.200.68.151])
  by relmlie5.idc.renesas.com with ESMTP; 20 Sep 2020 22:49:18 +0900
Received: from localhost.localdomain (unknown [172.29.52.129])
        by relmlir5.idc.renesas.com (Postfix) with ESMTP id E436D40078C8;
        Sun, 20 Sep 2020 22:49:15 +0900 (JST)
From:   Biju Das <biju.das.jz@bp.renesas.com>
To:     Rob Herring <robh+dt@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Cc:     Biju Das <biju.das.jz@bp.renesas.com>,
        Heikki Krogerus <heikki.krogerus@linux.intel.com>,
        linux-usb@vger.kernel.org, devicetree@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Biju Das <biju.das@bp.renesas.com>,
        Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        linux-renesas-soc@vger.kernel.org
Subject: [PATCH v4 3/6] dt-bindings: usb: renesas,usb3-peri: Document HS and SS data bus
Date:   Sun, 20 Sep 2020 14:49:02 +0100
Message-Id: <20200920134905.4370-4-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200920134905.4370-1-biju.das.jz@bp.renesas.com>
References: <20200920134905.4370-1-biju.das.jz@bp.renesas.com>
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Document HS and SS data bus for the "usb-role-switch" enabled case.

Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
Reviewed-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Reviewed-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Reviewed-by: Rob Herring <robh@kernel.org>
---
v3->v4: Added Rb tags
v2->v3: Replaced Tabs with spaces
        Ref:https://patchwork.kernel.org/patch/11708831/
v1->v2: No change
        Ref:https://patchwork.kernel.org/patch/11669423/
---
 .../bindings/usb/renesas,usb3-peri.yaml       | 34 ++++++++++++++++---
 1 file changed, 29 insertions(+), 5 deletions(-)

diff --git a/Documentation/devicetree/bindings/usb/renesas,usb3-peri.yaml b/Documentation/devicetree/bindings/usb/renesas,usb3-peri.yaml
index e3cdeab1199f..86df8cdd9993 100644
--- a/Documentation/devicetree/bindings/usb/renesas,usb3-peri.yaml
+++ b/Documentation/devicetree/bindings/usb/renesas,usb3-peri.yaml
@@ -52,11 +52,24 @@ properties:
     $ref: /schemas/types.yaml#/definitions/phandle
     description: phandle of a companion.
 
-  port:
+  ports:
     description: |
       any connector to the data bus of this controller should be modelled
       using the OF graph bindings specified, if the "usb-role-switch"
       property is used.
+    type: object
+    properties:
+      port@0:
+        type: object
+        description: High Speed (HS) data bus.
+
+      port@1:
+        type: object
+        description: Super Speed (SS) data bus.
+
+    required:
+      - port@0
+      - port@1
 
 required:
   - compatible
@@ -79,9 +92,20 @@ examples:
         companion = <&xhci0>;
         usb-role-switch;
 
-        port {
-            usb3_role_switch: endpoint {
-                remote-endpoint = <&hd3ss3220_ep>;
-            };
+        ports {
+                #address-cells = <1>;
+                #size-cells = <0>;
+                port@0 {
+                        reg = <0>;
+                        usb3_hs_ep: endpoint {
+                                remote-endpoint = <&hs_ep>;
+                        };
+                };
+                port@1 {
+                        reg = <1>;
+                        usb3_role_switch: endpoint {
+                                remote-endpoint = <&hd3ss3220_out_ep>;
+                        };
+                };
         };
     };
-- 
2.17.1

