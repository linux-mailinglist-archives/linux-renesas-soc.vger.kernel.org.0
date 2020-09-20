Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 25C2427149B
	for <lists+linux-renesas-soc@lfdr.de>; Sun, 20 Sep 2020 15:49:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726342AbgITNtO (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Sun, 20 Sep 2020 09:49:14 -0400
Received: from relmlor1.renesas.com ([210.160.252.171]:8429 "EHLO
        relmlie5.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726305AbgITNtN (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Sun, 20 Sep 2020 09:49:13 -0400
X-IronPort-AV: E=Sophos;i="5.77,282,1596466800"; 
   d="scan'208";a="57728981"
Received: from unknown (HELO relmlir5.idc.renesas.com) ([10.200.68.151])
  by relmlie5.idc.renesas.com with ESMTP; 20 Sep 2020 22:49:12 +0900
Received: from localhost.localdomain (unknown [172.29.52.129])
        by relmlir5.idc.renesas.com (Postfix) with ESMTP id 1970440078C5;
        Sun, 20 Sep 2020 22:49:08 +0900 (JST)
From:   Biju Das <biju.das.jz@bp.renesas.com>
To:     Rob Herring <robh+dt@kernel.org>
Cc:     Biju Das <biju.das.jz@bp.renesas.com>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Wesley Cheng <wcheng@codeaurora.org>,
        Maxime Ripard <mripard@kernel.org>,
        Lee Jones <lee.jones@linaro.org>,
        Mark Brown <broonie@kernel.org>,
        Thierry Reding <treding@nvidia.com>,
        Prashant Malani <pmalani@chromium.org>,
        devicetree@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Biju Das <biju.das@bp.renesas.com>,
        Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        linux-renesas-soc@vger.kernel.org
Subject: [PATCH v4 1/6] dt-bindings: update usb-c-connector example
Date:   Sun, 20 Sep 2020 14:49:00 +0100
Message-Id: <20200920134905.4370-2-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200920134905.4370-1-biju.das.jz@bp.renesas.com>
References: <20200920134905.4370-1-biju.das.jz@bp.renesas.com>
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Some hardware designs have USB typec connector attached to both
SoC and super speed mux. We need to use separate connector node for
such design.

Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
 * New patch
---
 .../bindings/connector/usb-connector.yaml     | 30 ++++++++++++++++++-
 1 file changed, 29 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/connector/usb-connector.yaml b/Documentation/devicetree/bindings/connector/usb-connector.yaml
index 9bd52e63c935..0df6cb788b2e 100644
--- a/Documentation/devicetree/bindings/connector/usb-connector.yaml
+++ b/Documentation/devicetree/bindings/connector/usb-connector.yaml
@@ -11,7 +11,8 @@ maintainers:
 
 description:
   A USB connector node represents a physical USB connector. It should be a child
-  of a USB interface controller.
+  of a USB interface controller or a separate node when it is attached to both
+  MUX and USB interface controller.
 
 properties:
   compatible:
@@ -221,6 +222,33 @@ examples:
       };
     };
 
+  # USB-C connector attached to SoC and USB3 typec port controller(hd3ss3220)
+  # with SS 2:1 MUX. HS lines routed to SoC, SS lines routed to the MUX and
+  # the output of MUX is connected to the SoC.
+  - |
+    connector {
+        compatible = "usb-c-connector";
+        label = "USB-C";
+        data-role = "dual";
+
+        ports {
+                #address-cells = <1>;
+                #size-cells = <0>;
+                port@0 {
+                        reg = <0>;
+                        hs_ep: endpoint {
+                                remote-endpoint = <&usb3_hs_ep>;
+                        };
+                };
+                port@1 {
+                        reg = <1>;
+                        ss_ep: endpoint {
+                                remote-endpoint = <&hd3ss3220_in_ep>;
+                        };
+                };
+        };
+    };
+
   # USB connector with GPIO control lines
   - |
     #include <dt-bindings/gpio/gpio.h>
-- 
2.17.1

