Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3965A23BF15
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  4 Aug 2020 19:48:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728064AbgHDRsp (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 4 Aug 2020 13:48:45 -0400
Received: from relmlor2.renesas.com ([210.160.252.172]:24954 "EHLO
        relmlie6.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1730138AbgHDRsl (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 4 Aug 2020 13:48:41 -0400
X-IronPort-AV: E=Sophos;i="5.75,434,1589209200"; 
   d="scan'208";a="53649489"
Received: from unknown (HELO relmlir6.idc.renesas.com) ([10.200.68.152])
  by relmlie6.idc.renesas.com with ESMTP; 05 Aug 2020 02:48:40 +0900
Received: from localhost.localdomain (unknown [172.29.52.222])
        by relmlir6.idc.renesas.com (Postfix) with ESMTP id A278640B92DF;
        Wed,  5 Aug 2020 02:48:37 +0900 (JST)
From:   Biju Das <biju.das.jz@bp.renesas.com>
To:     Rob Herring <robh+dt@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     Biju Das <biju.das.jz@bp.renesas.com>,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        Heikki Krogerus <heikki.krogerus@linux.intel.com>,
        linux-usb@vger.kernel.org, devicetree@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Biju Das <biju.das@bp.renesas.com>,
        Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        linux-renesas-soc@vger.kernel.org
Subject: [PATCH 2/5] dt-bindings: usb: renesas,usb3-peri: Document HS and SS data bus
Date:   Tue,  4 Aug 2020 18:48:25 +0100
Message-Id: <20200804174828.8339-3-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200804174828.8339-1-biju.das.jz@bp.renesas.com>
References: <20200804174828.8339-1-biju.das.jz@bp.renesas.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Document HS and SS data bus for the "usb-role-switch" enabled case.

Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
Reviewed-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
---
Ref:https://patchwork.kernel.org/patch/11669423/
---
 .../bindings/usb/renesas,usb3-peri.yaml       | 36 +++++++++++++++----
 1 file changed, 30 insertions(+), 6 deletions(-)

diff --git a/Documentation/devicetree/bindings/usb/renesas,usb3-peri.yaml b/Documentation/devicetree/bindings/usb/renesas,usb3-peri.yaml
index e3cdeab1199f..3eb964af37b8 100644
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
-        };
+    	ports {
+    		#address-cells = <1>;
+    		#size-cells = <0>;
+    		port@0 {
+    			reg = <0>;
+    			usb3_hs_ep: endpoint {
+    				remote-endpoint = <&hs_ep>;
+    			};
+    		};
+    		port@1 {
+    			reg = <1>;
+    			usb3_role_switch: endpoint {
+    				remote-endpoint = <&hd3ss3220_out_ep>;
+    			};
+    		};
+    	};
     };
-- 
2.17.1

