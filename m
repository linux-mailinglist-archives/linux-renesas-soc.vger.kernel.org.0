Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B6457A18FF
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 29 Aug 2019 13:38:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727176AbfH2Lir (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 29 Aug 2019 07:38:47 -0400
Received: from relmlor1.renesas.com ([210.160.252.171]:5115 "EHLO
        relmlie5.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1727736AbfH2Lir (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 29 Aug 2019 07:38:47 -0400
X-IronPort-AV: E=Sophos;i="5.64,442,1559487600"; 
   d="scan'208";a="25249618"
Received: from unknown (HELO relmlir5.idc.renesas.com) ([10.200.68.151])
  by relmlie5.idc.renesas.com with ESMTP; 29 Aug 2019 20:38:45 +0900
Received: from fabrizio-dev.ree.adwin.renesas.com (unknown [10.226.36.196])
        by relmlir5.idc.renesas.com (Postfix) with ESMTP id 2BD6B400C423;
        Thu, 29 Aug 2019 20:38:40 +0900 (JST)
From:   Fabrizio Castro <fabrizio.castro@bp.renesas.com>
To:     Geert Uytterhoeven <geert+renesas@glider.be>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Thierry Reding <thierry.reding@gmail.com>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>
Cc:     Fabrizio Castro <fabrizio.castro@bp.renesas.com>,
        Sam Ravnborg <sam@ravnborg.org>,
        Simon Horman <horms@verge.net.au>,
        Magnus Damm <magnus.damm@gmail.com>,
        dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org, linux-kernel@vger.kernel.org,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Biju Das <biju.das@bp.renesas.com>,
        Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
        Jacopo Mondi <jacopo+renesas@jmondi.org>,
        xu_shunji@hoperun.com, ebiharaml@si-linux.co.jp
Subject: [PATCH v2 1/2] dt-bindings: display: Add idk-1110wr binding
Date:   Thu, 29 Aug 2019 12:38:32 +0100
Message-Id: <1567078713-29361-2-git-send-email-fabrizio.castro@bp.renesas.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1567078713-29361-1-git-send-email-fabrizio.castro@bp.renesas.com>
References: <1567078713-29361-1-git-send-email-fabrizio.castro@bp.renesas.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Add binding for the idk-1110wr LVDS panel from Advantech.

Some panel-specific documentation can be found here:
https://buy.advantech.eu/Displays/Embedded-LCD-Kits-LCD-Kit-Modules/model-IDK-1110WR-55WSA1E.htm

Signed-off-by: Fabrizio Castro <fabrizio.castro@bp.renesas.com>
---
v1->v2:
* no change

 .../display/panel/advantech,idk-1110wr.yaml        | 69 ++++++++++++++++++++++
 1 file changed, 69 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/display/panel/advantech,idk-1110wr.yaml

diff --git a/Documentation/devicetree/bindings/display/panel/advantech,idk-1110wr.yaml b/Documentation/devicetree/bindings/display/panel/advantech,idk-1110wr.yaml
new file mode 100644
index 0000000..e5fdaa0
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/panel/advantech,idk-1110wr.yaml
@@ -0,0 +1,69 @@
+# SPDX-License-Identifier: GPL-2.0
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/display/panel/advantech,idk-1110wr.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Advantech IDK-1110WR 10.1" WSVGA LVDS Display Panel
+
+maintainers:
+  - Fabrizio Castro <fabrizio.castro@bp.renesas.com>
+  - Thierry Reding <thierry.reding@gmail.com>
+
+allOf:
+  - $ref: lvds.yaml#
+
+properties:
+  compatible:
+    items:
+      - const: advantech,idk-1110wr
+      - {} # panel-lvds, but not listed here to avoid false select
+
+  data-mapping:
+    const: jeida-24
+
+  width-mm:
+    const: 223
+
+  height-mm:
+    const: 125
+
+  panel-timing: true
+  port: true
+
+additionalProperties: false
+
+required:
+  - compatible
+
+examples:
+  - |+
+    panel {
+      compatible = "advantech,idk-1110wr", "panel-lvds";
+
+      width-mm = <223>;
+      height-mm = <125>;
+
+      data-mapping = "jeida-24";
+
+      panel-timing {
+        /* 1024x600 @60Hz */
+        clock-frequency = <51200000>;
+        hactive = <1024>;
+        vactive = <600>;
+        hsync-len = <240>;
+        hfront-porch = <40>;
+        hback-porch = <40>;
+        vsync-len = <10>;
+        vfront-porch = <15>;
+        vback-porch = <10>;
+      };
+
+      port {
+        panel_in: endpoint {
+          remote-endpoint = <&lvds_encoder>;
+        };
+      };
+    };
+
+...
-- 
2.7.4

