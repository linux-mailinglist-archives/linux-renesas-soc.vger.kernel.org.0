Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B5C682B451A
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 16 Nov 2020 14:56:18 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729568AbgKPNxb (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 16 Nov 2020 08:53:31 -0500
Received: from relay2-d.mail.gandi.net ([217.70.183.194]:37101 "EHLO
        relay2-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726286AbgKPNxb (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 16 Nov 2020 08:53:31 -0500
X-Originating-IP: 93.34.118.233
Received: from uno.lan (93-34-118-233.ip49.fastwebnet.it [93.34.118.233])
        (Authenticated sender: jacopo@jmondi.org)
        by relay2-d.mail.gandi.net (Postfix) with ESMTPSA id 5B9514000B;
        Mon, 16 Nov 2020 13:53:26 +0000 (UTC)
From:   Jacopo Mondi <jacopo+renesas@jmondi.org>
To:     kieran.bingham+renesas@ideasonboard.com,
        laurent.pinchart+renesas@ideasonboard.com,
        niklas.soderlund+renesas@ragnatech.se, geert@linux-m68k.org,
        robh@kernel.org, devicetree@vger.kernel.org
Cc:     Jacopo Mondi <jacopo+renesas@jmondi.org>,
        linux-media@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        linux-kernel@vger.kernel.org, Hyun Kwon <hyunk@xilinx.com>,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
        sergei.shtylyov@gmail.com
Subject: [PATCH v5 2/8] dt-bindings: media: max9286: Document 'maxim,initial-reverse-channel-mV'
Date:   Mon, 16 Nov 2020 14:52:59 +0100
Message-Id: <20201116135305.81319-3-jacopo+renesas@jmondi.org>
X-Mailer: git-send-email 2.29.1
In-Reply-To: <20201116135305.81319-1-jacopo+renesas@jmondi.org>
References: <20201116135305.81319-1-jacopo+renesas@jmondi.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Document the 'initial-reverse-channel-mV' vendor property in the
bindings document of the max9286 driver.

The newly introduced property allows to specifying the initial
configuration of the GMSL reverse control channel to accommodate
remote serializers pre-programmed with the high threshold power
supply noise immunity enabled.

Reviewed-by: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
Signed-off-by: Jacopo Mondi <jacopo+renesas@jmondi.org>
---
 .../bindings/media/i2c/maxim,max9286.yaml     | 23 +++++++++++++++++++
 1 file changed, 23 insertions(+)

diff --git a/Documentation/devicetree/bindings/media/i2c/maxim,max9286.yaml b/Documentation/devicetree/bindings/media/i2c/maxim,max9286.yaml
index 9ea827092fdd..f61234d204fa 100644
--- a/Documentation/devicetree/bindings/media/i2c/maxim,max9286.yaml
+++ b/Documentation/devicetree/bindings/media/i2c/maxim,max9286.yaml
@@ -51,6 +51,26 @@ properties:
   '#gpio-cells':
     const: 2

+  maxim,initial-reverse-channel-mV:
+    $ref: '/schemas/types.yaml#/definitions/uint32'
+    minimum: 30
+    maximum: 200
+    default: 170
+    description: |
+      Initial amplitude of the reverse control channel, in millivolts.
+
+      The initial amplitude shall be adjusted to a value compatible with the
+      configuration of the connected remote serializer.
+
+      Some camera modules (for example RDACM20) include an on-board MCU that
+      pre-programs the embedded serializer with power supply noise immunity
+      (high-threshold) enabled. A typical value of the deserializer's reverse
+      channel amplitude to communicate with pre-programmed serializers is 170mV.
+
+      A typical value for the reverse channel amplitude to communicate with
+      a remote serializer whose high-threshold noise immunity is not enabled
+      is 100mV.
+
   ports:
     type: object
     description: |
@@ -221,6 +241,7 @@ required:
   - ports
   - i2c-mux
   - gpio-controller
+  - maxim,initial-reverse-channel-mV

 additionalProperties: false

@@ -243,6 +264,8 @@ examples:
         gpio-controller;
         #gpio-cells = <2>;

+        maxim,initial-reverse-channel-mV = <170>;
+
         ports {
           #address-cells = <1>;
           #size-cells = <0>;
--
2.29.1

