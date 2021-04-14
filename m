Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 737B135F591
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 14 Apr 2021 16:04:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1351666AbhDNNv2 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 14 Apr 2021 09:51:28 -0400
Received: from relay3-d.mail.gandi.net ([217.70.183.195]:35867 "EHLO
        relay3-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1349137AbhDNNvX (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 14 Apr 2021 09:51:23 -0400
X-Originating-IP: 93.61.96.190
Received: from uno.LocalDomain (93-61-96-190.ip145.fastwebnet.it [93.61.96.190])
        (Authenticated sender: jacopo@jmondi.org)
        by relay3-d.mail.gandi.net (Postfix) with ESMTPSA id 0281B6000C;
        Wed, 14 Apr 2021 13:50:58 +0000 (UTC)
From:   Jacopo Mondi <jacopo+renesas@jmondi.org>
To:     Geert Uytterhoeven <geert+renesas@glider.be>,
        Magnus Damm <magnus.damm@gmail.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Kieran Bingham <kieran.bingham@ideasonboard.com>,
        Rob Herring <robh+dt@kernel.org>
Cc:     Jacopo Mondi <jacopo+renesas@jmondi.org>,
        linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH v3 1/5] dt-bindings: media: max9286: Define 'maxim,gpio-poc'
Date:   Wed, 14 Apr 2021 15:51:24 +0200
Message-Id: <20210414135128.180980-2-jacopo+renesas@jmondi.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210414135128.180980-1-jacopo+renesas@jmondi.org>
References: <20210414135128.180980-1-jacopo+renesas@jmondi.org>
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

Signed-off-by: Jacopo Mondi <jacopo+renesas@jmondi.org>
---
 .../bindings/media/i2c/maxim,max9286.yaml     | 53 ++++++++++++++++++-
 1 file changed, 52 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/media/i2c/maxim,max9286.yaml b/Documentation/devicetree/bindings/media/i2c/maxim,max9286.yaml
index ee16102fdfe7..480a491f3744 100644
--- a/Documentation/devicetree/bindings/media/i2c/maxim,max9286.yaml
+++ b/Documentation/devicetree/bindings/media/i2c/maxim,max9286.yaml
@@ -70,6 +70,24 @@ properties:
       a remote serializer whose high-threshold noise immunity is not enabled
       is 100000 micro volts
 
+  maxim,gpio-poc:
+    $ref: '/schemas/types.yaml#/definitions/uint32-array'
+    minItems: 2
+    maxItems: 2
+    description: |
+      Identifier of gpio line that controls Power over Coax to the cameras and
+      the associated polarity flag (GPIO_ACTIVE_HIGH and GPIO_ACTIVE_LOW)
+      as defined in <include/dt-bindings/gpio/gpio.h>.
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
 
@@ -182,7 +200,6 @@ required:
   - reg
   - ports
   - i2c-mux
-  - gpio-controller
 
 additionalProperties: false
 
@@ -327,4 +344,38 @@ examples:
           };
         };
       };
+
+      /*
+       * Example of a deserializer that controls the camera Power over Coax
+       * through one of its gpio lines.
+       */
+      gmsl-deserializer@6c {
+        compatible = "maxim,max9286";
+        reg = <0x6c>;
+        enable-gpios = <&gpio 14 GPIO_ACTIVE_HIGH>;
+
+        /*
+         * The remote camera power is controlled by MAX9286 GPIO line #0.
+         * No 'poc-supply' nor 'gpio-controller' are specified.
+         */
+        maxim,gpio-poc = <0 GPIO_ACTIVE_LOW>;
+
+        /*
+         * Do not describe connections as they're the same as in the previous
+         * example.
+         */
+        ports {
+          #address-cells = <1>;
+          #size-cells = <0>;
+
+          port@4 {
+            reg = <4>;
+          };
+        };
+
+        i2c-mux {
+          #address-cells = <1>;
+          #size-cells = <0>;
+        };
+      };
     };
-- 
2.31.1

