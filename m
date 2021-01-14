Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 224002F66B6
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 14 Jan 2021 18:08:03 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726735AbhANRFQ (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 14 Jan 2021 12:05:16 -0500
Received: from relay2-d.mail.gandi.net ([217.70.183.194]:59523 "EHLO
        relay2-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725854AbhANRFP (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 14 Jan 2021 12:05:15 -0500
X-Originating-IP: 93.34.118.233
Received: from uno.lan (93-34-118-233.ip49.fastwebnet.it [93.34.118.233])
        (Authenticated sender: jacopo@jmondi.org)
        by relay2-d.mail.gandi.net (Postfix) with ESMTPSA id 19FCC40007;
        Thu, 14 Jan 2021 17:04:30 +0000 (UTC)
From:   Jacopo Mondi <jacopo+renesas@jmondi.org>
To:     kieran.bingham+renesas@ideasonboard.com,
        laurent.pinchart+renesas@ideasonboard.com,
        niklas.soderlund+renesas@ragnatech.se, geert@linux-m68k.org
Cc:     Jacopo Mondi <jacopo+renesas@jmondi.org>,
        linux-media@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        linux-kernel@vger.kernel.org, Hyun Kwon <hyunk@xilinx.com>,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
        sergei.shtylyov@gmail.com, Rob Herring <robh@kernel.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Subject: [PATCH v8 2/5] dt-bindings: media: max9286: Document 'maxim,reverse-channel-microvolt'
Date:   Thu, 14 Jan 2021 18:04:26 +0100
Message-Id: <20210114170429.139762-3-jacopo+renesas@jmondi.org>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210114170429.139762-1-jacopo+renesas@jmondi.org>
References: <20210114170429.139762-1-jacopo+renesas@jmondi.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Document the 'maxim,reverse-channel-microvolt' vendor property in the
bindings document of the max9286 driver.

The newly introduced property allows to specify the initial
configuration of the GMSL reverse control channel to accommodate
remote serializers pre-programmed with the high threshold power
supply noise immunity enabled.

Reviewed-by: Rob Herring <robh@kernel.org>
Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Reviewed-by: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
Signed-off-by: Jacopo Mondi <jacopo+renesas@jmondi.org>
---
 .../bindings/media/i2c/maxim,max9286.yaml     | 22 +++++++++++++++++++
 1 file changed, 22 insertions(+)

diff --git a/Documentation/devicetree/bindings/media/i2c/maxim,max9286.yaml b/Documentation/devicetree/bindings/media/i2c/maxim,max9286.yaml
index 68ee8c7d9e79..1406236e37ef 100644
--- a/Documentation/devicetree/bindings/media/i2c/maxim,max9286.yaml
+++ b/Documentation/devicetree/bindings/media/i2c/maxim,max9286.yaml
@@ -50,6 +50,26 @@ properties:
   '#gpio-cells':
     const: 2
 
+  maxim,reverse-channel-microvolt:
+    minimum: 30000
+    maximum: 200000
+    default: 170000
+    description: |
+      Initial amplitude of the reverse control channel, in micro volts.
+
+      The initial amplitude shall be adjusted to a value compatible with the
+      configuration of the connected remote serializer.
+
+      Some camera modules (for example RDACM20) include an on-board MCU that
+      pre-programs the embedded serializer with power supply noise immunity
+      (high-threshold) enabled. A typical value of the deserializer's reverse
+      channel amplitude to communicate with pre-programmed serializers is
+      170000 micro volts.
+
+      A typical value for the reverse channel amplitude to communicate with
+      a remote serializer whose high-threshold noise immunity is not enabled
+      is 100000 micro volts
+
   ports:
     type: object
     description: |
@@ -242,6 +262,8 @@ examples:
         gpio-controller;
         #gpio-cells = <2>;
 
+        maxim,reverse-channel-microvolt = <170000>;
+
         ports {
           #address-cells = <1>;
           #size-cells = <0>;
-- 
2.29.2

