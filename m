Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id ACDBC33C1CD
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 15 Mar 2021 17:31:30 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231740AbhCOQa7 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 15 Mar 2021 12:30:59 -0400
Received: from relay1-d.mail.gandi.net ([217.70.183.193]:51503 "EHLO
        relay1-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231391AbhCOQar (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 15 Mar 2021 12:30:47 -0400
X-Originating-IP: 79.22.58.175
Received: from uno.homenet.telecomitalia.it (host-79-22-58-175.retail.telecomitalia.it [79.22.58.175])
        (Authenticated sender: jacopo@jmondi.org)
        by relay1-d.mail.gandi.net (Postfix) with ESMTPSA id C082E240002;
        Mon, 15 Mar 2021 16:30:43 +0000 (UTC)
From:   Jacopo Mondi <jacopo+renesas@jmondi.org>
To:     Geert Uytterhoeven <geert+renesas@glider.be>,
        Magnus Damm <magnus.damm@gmail.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Kieran Bingham <kieran.bingham@ideasonboard.com>,
        Rob Herring <robh+dt@kernel.org>
Cc:     Jacopo Mondi <jacopo+renesas@jmondi.org>,
        linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH v2 1/4] dt-bindings: media: max9286: Describe gpio-hog
Date:   Mon, 15 Mar 2021 17:30:25 +0100
Message-Id: <20210315163028.173148-2-jacopo+renesas@jmondi.org>
X-Mailer: git-send-email 2.30.0
In-Reply-To: <20210315163028.173148-1-jacopo+renesas@jmondi.org>
References: <20210315163028.173148-1-jacopo+renesas@jmondi.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

The MAX9286 GMSL deserializer features gpio controller capabilities,
as it provides 2 GPIO lines.

As establishing a regulator that uses one of the GPIO lines and
enabling/disabling it at run-time in the max9286 won't work due to
a circular dependency on the gpio-controller/regulator creation, allow
the usage of a gpio-hog for that purpose.

The usage of the gpio-hog is required in designs where the MAX9286
GPIO lines control the remote cameras power.

Signed-off-by: Jacopo Mondi <jacopo+renesas@jmondi.org>
---
 .../bindings/media/i2c/maxim,max9286.yaml        | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/Documentation/devicetree/bindings/media/i2c/maxim,max9286.yaml b/Documentation/devicetree/bindings/media/i2c/maxim,max9286.yaml
index ee16102fdfe7..9038300e373c 100644
--- a/Documentation/devicetree/bindings/media/i2c/maxim,max9286.yaml
+++ b/Documentation/devicetree/bindings/media/i2c/maxim,max9286.yaml
@@ -177,6 +177,22 @@ properties:
 
     additionalProperties: false
 
+patternProperties:
+  "^(hog-[0-9]+|.+-hog(-[0-9]+)?)$":
+    type: object
+    properties:
+      gpio-hog: true
+      gpios: true
+      output-low: true
+      line-name: true
+
+    required:
+      - gpio-hog
+      - gpios
+      - output-low
+
+    additionalProperties: false
+
 required:
   - compatible
   - reg
-- 
2.30.0

