Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E651611A65F
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 11 Dec 2019 09:58:32 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728383AbfLKI6c (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 11 Dec 2019 03:58:32 -0500
Received: from relay4-d.mail.gandi.net ([217.70.183.196]:59235 "EHLO
        relay4-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725973AbfLKI6c (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 11 Dec 2019 03:58:32 -0500
X-Originating-IP: 93.34.114.233
Received: from uno.lan (93-34-114-233.ip49.fastwebnet.it [93.34.114.233])
        (Authenticated sender: jacopo@jmondi.org)
        by relay4-d.mail.gandi.net (Postfix) with ESMTPSA id 0E3A3E0004;
        Wed, 11 Dec 2019 08:58:28 +0000 (UTC)
From:   Jacopo Mondi <jacopo+renesas@jmondi.org>
To:     =?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>,
        Jacopo Mondi <jacopo@jmondi.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
Cc:     Jacopo Mondi <jacopo+renesas@jmondi.org>,
        linux-renesas-soc@vger.kernel.org
Subject: [PATCH] dt-bindings: media: i2c: max9286: Specify 'type'
Date:   Wed, 11 Dec 2019 10:00:38 +0100
Message-Id: <20191211090038.5971-1-jacopo+renesas@jmondi.org>
X-Mailer: git-send-email 2.24.0
In-Reply-To: <20191116165034.39001-1-jacopo+renesas@jmondi.org>
References: <20191116165034.39001-1-jacopo+renesas@jmondi.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Add the 'type' tag to a few entries to fix the warning reported by the
most recent dtschema validator

Documentation/devicetree/bindings/media/i2c/maxim,max9286.yaml:
properties:i2c-mux: 'type' is a dependency of 'properties'

Signed-off-by: Jacopo Mondi <jacopo+renesas@jmondi.org>
---
Hi Kieran,
   I know you're collecting patches to re-submit max9286 support.

Please squash this on top of the dt bindings documentation patch to fix
an issue reported by recent version of the dtschema validator.

Thanks
  j

---
 Documentation/devicetree/bindings/media/i2c/maxim,max9286.yaml | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/Documentation/devicetree/bindings/media/i2c/maxim,max9286.yaml b/Documentation/devicetree/bindings/media/i2c/maxim,max9286.yaml
index 731e317ef4ce..d37ea2c432f6 100644
--- a/Documentation/devicetree/bindings/media/i2c/maxim,max9286.yaml
+++ b/Documentation/devicetree/bindings/media/i2c/maxim,max9286.yaml
@@ -73,6 +73,7 @@ properties:
         const: 0

       port@[0-3]:
+        type: object
         properties:
           reg:
             enum: [ 0, 1, 2, 3 ]
@@ -97,6 +98,7 @@ properties:
         additionalProperties: false

       port@4:
+        type: object
         properties:
           reg:
             const: 4
@@ -126,6 +128,7 @@ properties:
       - port@4

   i2c-mux:
+    type: object
     description: -|
       Each GMSL link is modelled as a child bus of an i2c bus
       multiplexer/switch, in accordance with bindings described in
--
2.24.0

