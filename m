Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F1605360946
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 15 Apr 2021 14:25:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232797AbhDOM0A (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 15 Apr 2021 08:26:00 -0400
Received: from relay5-d.mail.gandi.net ([217.70.183.197]:42133 "EHLO
        relay5-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232743AbhDOMZ6 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 15 Apr 2021 08:25:58 -0400
X-Originating-IP: 93.61.96.190
Received: from uno.LocalDomain (93-61-96-190.ip145.fastwebnet.it [93.61.96.190])
        (Authenticated sender: jacopo@jmondi.org)
        by relay5-d.mail.gandi.net (Postfix) with ESMTPSA id 06D051C0007;
        Thu, 15 Apr 2021 12:25:32 +0000 (UTC)
From:   Jacopo Mondi <jacopo+renesas@jmondi.org>
To:     Geert Uytterhoeven <geert+renesas@glider.be>,
        Magnus Damm <magnus.damm@gmail.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Kieran Bingham <kieran.bingham@ideasonboard.com>,
        Rob Herring <robh+dt@kernel.org>
Cc:     Jacopo Mondi <jacopo+renesas@jmondi.org>,
        linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH v4 2/7] dt-bindings: media: max9286: Define 'maxim,gpio-poc'
Date:   Thu, 15 Apr 2021 14:25:57 +0200
Message-Id: <20210415122602.87697-3-jacopo+renesas@jmondi.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210415122602.87697-1-jacopo+renesas@jmondi.org>
References: <20210415122602.87697-1-jacopo+renesas@jmondi.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Define a new vendor property in the maxim,max9286 binding schema.

The new property allows to declare that the remote camera
power-over-coax is controlled by one of the MAX9286 gpio lines.

As it is currently not possible to establish a regulator as consumer
of the MAX9286 gpio controller for this purpose, the property allows to
declare that the camera power is controlled by the MAX9286 directly.

The property accepts a gpio-index (0 or 1) and one line polarity
flag as defined by dt-bindings/gpio/gpio.h.

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Signed-off-by: Jacopo Mondi <jacopo+renesas@jmondi.org>
---
 .../bindings/media/i2c/maxim,max9286.yaml     | 71 ++++++++++++++++++-
 1 file changed, 70 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/media/i2c/maxim,max9286.yaml b/Documentation/devicetree/bindings/media/i2c/maxim,max9286.yaml
index 0e7162998b77..e2422241b7d0 100644
--- a/Documentation/devicetree/bindings/media/i2c/maxim,max9286.yaml
+++ b/Documentation/devicetree/bindings/media/i2c/maxim,max9286.yaml
@@ -70,6 +70,28 @@ properties:
       a remote serializer whose high-threshold noise immunity is not enabled
       is 100000 micro volts
 
+  maxim,gpio-poc:
+    $ref: '/schemas/types.yaml#/definitions/uint32-array'
+    minItems: 2
+    maxItems: 2
+    description: |
+      Index of the MAX9286 gpio output line (0 or 1) that controls Power over
+      Coax to the cameras and its associated polarity flag.
+
+      The property accepts an array of two unsigned integers, the first being
+      the gpio line index (0 or 1) and the second being the gpio line polarity
+      flag (GPIO_ACTIVE_HIGH or GPIO_ACTIVE_LOW) as defined in
+      <include/dt-bindings/gpio/gpio.h>.
+
+      When the remote cameras power is controlled by one of the MAX9286 gpio
+      lines, this property has to be used to specify which line among the two
+      available ones controls the remote camera power enablement.
+
+      When this property is used it is not possible to register a gpio
+      controller as the gpio lines are controlled directly by the MAX9286 and
+      not available for consumers, nor the 'poc-supply' property should be
+      specified.
+
   ports:
     $ref: /schemas/graph.yaml#/properties/ports
 
@@ -182,7 +204,20 @@ required:
   - reg
   - ports
   - i2c-mux
-  - gpio-controller
+
+# If 'maxim,gpio-poc' is present, then 'poc-supply' and 'gpio-controller'
+# are not allowed.
+if:
+  required:
+    - maxim,gpio-poc
+then:
+  allOf:
+    - not:
+        required:
+          - poc-supply
+    - not:
+        required:
+          - gpio-controller
 
 additionalProperties: false
 
@@ -327,4 +362,38 @@ examples:
                 };
             };
         };
+
+        /*
+        * Example of a deserializer that controls the camera Power over Coax
+        * through one of its gpio lines.
+        */
+        gmsl-deserializer@6c {
+            compatible = "maxim,max9286";
+            reg = <0x6c>;
+            enable-gpios = <&gpio 14 GPIO_ACTIVE_HIGH>;
+
+            /*
+            * The remote camera power is controlled by MAX9286 GPIO line #0.
+            * No 'poc-supply' nor 'gpio-controller' are specified.
+            */
+            maxim,gpio-poc = <0 GPIO_ACTIVE_LOW>;
+
+            /*
+            * Do not describe connections as they're the same as in the previous
+            * example.
+            */
+            ports {
+                #address-cells = <1>;
+                #size-cells = <0>;
+
+                port@4 {
+                    reg = <4>;
+                };
+            };
+
+            i2c-mux {
+                #address-cells = <1>;
+                #size-cells = <0>;
+            };
+        };
     };
-- 
2.31.1

