Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CEE641F551D
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 10 Jun 2020 14:46:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728540AbgFJMqk (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 10 Jun 2020 08:46:40 -0400
Received: from perceval.ideasonboard.com ([213.167.242.64]:50566 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728991AbgFJMqk (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 10 Jun 2020 08:46:40 -0400
Received: from Q.local (cpc89242-aztw30-2-0-cust488.18-1.cable.virginm.net [86.31.129.233])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id DAAC411FC;
        Wed, 10 Jun 2020 14:46:30 +0200 (CEST)
From:   Kieran Bingham <kieran@ksquared.org.uk>
To:     Jacopo Mondi <jacopo@jmondi.org>, linux-renesas-soc@vger.kernel.org
Cc:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        =?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>,
        Jacopo Mondi <jacopo+renesas@jmondi.org>
Subject: [PATCH v9.2 7/9] fixes! [max9286-dt]: Fix dt-validation
Date:   Wed, 10 Jun 2020 13:46:21 +0100
Message-Id: <20200610124623.51085-8-kieran@bingham.xyz>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200610124623.51085-1-kieran@bingham.xyz>
References: <20200610124623.51085-1-kieran@bingham.xyz>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

From: Jacopo Mondi <jacopo+renesas@jmondi.org>

Temporary fixup to ease review. To be squashed into v10 if accepted.

Signed-off-by: Jacopo Mondi <jacopo+renesas@jmondi.org>
---
 .../bindings/media/i2c/maxim,max9286.yaml     | 86 +++++++++++++++++--
 1 file changed, 77 insertions(+), 9 deletions(-)

diff --git a/Documentation/devicetree/bindings/media/i2c/maxim,max9286.yaml b/Documentation/devicetree/bindings/media/i2c/maxim,max9286.yaml
index 7d75c3b63c0b..4202c1ccc684 100644
--- a/Documentation/devicetree/bindings/media/i2c/maxim,max9286.yaml
+++ b/Documentation/devicetree/bindings/media/i2c/maxim,max9286.yaml
@@ -135,9 +135,7 @@ properties:
     description: |
       Each GMSL link is modelled as a child bus of an i2c bus
       multiplexer/switch, in accordance with bindings described in
-      Documentation/devicetree/bindings/i2c/i2c-mux.txt. The serializer
-      device on the remote end of the GMSL link shall be modelled as a child
-      node of the corresponding I2C bus.
+      Documentation/devicetree/bindings/i2c/i2c-mux.txt.
 
     properties:
       '#address-cells':
@@ -146,7 +144,74 @@ properties:
       '#size-cells':
         const: 0
 
-  additionalProperties: false
+    patternProperties:
+      "^i2c@[0-3]$":
+        type: object
+        description: |
+          Child node of the i2c bus multiplexer which represents a GMSL link.
+          Each serializer device on the GMSL link remote end is represented with
+          an i2c-mux child node. The MAX9286 chip supports up to 4 GMSL
+          channels.
+
+        properties:
+          '#address-cells':
+            const: 1
+
+          '#size-cells':
+            const: 0
+
+          reg:
+            description: The index of the GMSL channel.
+            maxItems: 1
+
+        patternProperties:
+          "^camera@[0-9]+":
+            type: object
+            description: |
+              The remote camera device, composed by a GMSL serializer and a
+              connected video source.
+
+            properties:
+              compatible:
+                description: The remote device compatible string.
+
+              reg:
+                description: |
+                  The I2C addresses to be assigned to the remote devices through
+                  address reprogramming. The number of entries depends on the
+                  requirements of the currently connected remote device.
+
+              port:
+                type: object
+
+                properties:
+                  endpoint:
+                    type: object
+
+                    properties:
+                      remote-endpoint:
+                        description: phandle to the MAX9286 sink endpoint.
+
+                    required:
+                      - remote-endpoint
+
+                    additionalProperties: false
+
+                required:
+                  - endpoint
+
+                additionalProperties: false
+
+            required:
+              - compatible
+              - reg
+              - port
+
+            additionalProperties: false
+
+        additionalProperties: false
+
+    additionalProperties: false
 
 required:
   - compatible
@@ -225,11 +290,11 @@ examples:
           i2c@0 {
             #address-cells = <1>;
             #size-cells = <0>;
-
             reg = <0>;
 
             camera@51 {
-              reg = <0x51>;
+              compatible = "imi,rdacm20";
+              reg = <0x51 0x61>;
 
               port {
                 rdacm20_out0: endpoint {
@@ -246,7 +311,8 @@ examples:
             reg = <1>;
 
             camera@52 {
-              reg = <0x52>;
+              compatible = "imi,rdacm20";
+              reg = <0x52 0x62>;
 
               port {
                 rdacm20_out1: endpoint {
@@ -262,7 +328,8 @@ examples:
             reg = <2>;
 
             camera@53 {
-              reg = <0x53>;
+              compatible = "imi,rdacm20";
+              reg = <0x53 0x63>;
 
               port {
                 rdacm20_out2: endpoint {
@@ -278,7 +345,8 @@ examples:
             reg = <3>;
 
             camera@54 {
-              reg = <0x54>;
+              compatible = "imi,rdacm20";
+              reg = <0x54 0x64>;
 
               port {
                 rdacm20_out3: endpoint {
-- 
2.25.1

