Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 52D0519EE81
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  6 Apr 2020 01:23:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727817AbgDEXXf (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Sun, 5 Apr 2020 19:23:35 -0400
Received: from perceval.ideasonboard.com ([213.167.242.64]:34592 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727612AbgDEXXf (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Sun, 5 Apr 2020 19:23:35 -0400
Received: from pendragon.bb.dnainternet.fi (81-175-216-236.bb.dnainternet.fi [81.175.216.236])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 9DE3455B;
        Mon,  6 Apr 2020 01:23:32 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1586129014;
        bh=+/XaYCs9W6yUiUL7Vpo5+kMlD9YLeRrKjQGhH8YMopY=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=DinIXq9fjU/1yBUKwPZxzWNl7Q3uDXS+nkKbVuV0L77+cWZidtUOzvNPtbkFtfYLv
         h8qJlQB6Rwoe+Z1zPWCVc+Qsta+ShxLTyFLBkiz35cQFSNOmtxVYehHEme8L0CpLJQ
         sTfgNBVHnJAOdH+bjMaoyKjwtD58VO6S8b82FP/Q=
From:   Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
To:     devicetree@vger.kernel.org
Cc:     dri-devel@lists.freedesktop.org, linux-renesas-soc@vger.kernel.org,
        Jacopo Mondi <jacopo+renesas@jmondi.org>,
        Maxime Ripard <maxime@cerno.tech>,
        Rob Herring <robh+dt@kernel.org>
Subject: [PATCH 1/4] dt-bindings: display: bridge: Reject additional properties in ports node
Date:   Mon,  6 Apr 2020 02:23:15 +0300
Message-Id: <20200405232318.26833-2-laurent.pinchart+renesas@ideasonboard.com>
X-Mailer: git-send-email 2.24.1
In-Reply-To: <20200405232318.26833-1-laurent.pinchart+renesas@ideasonboard.com>
References: <20200405232318.26833-1-laurent.pinchart+renesas@ideasonboard.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Document the #address-cells and #size-cells properties of the ports node
in the schemas of the bridge DT bindings, and set additionalProperties
to false to reject additional properties.

Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
---
 .../devicetree/bindings/display/bridge/anx6345.yaml       | 8 ++++++++
 .../devicetree/bindings/display/bridge/lvds-codec.yaml    | 8 ++++++++
 .../devicetree/bindings/display/bridge/ps8640.yaml        | 8 ++++++++
 3 files changed, 24 insertions(+)

diff --git a/Documentation/devicetree/bindings/display/bridge/anx6345.yaml b/Documentation/devicetree/bindings/display/bridge/anx6345.yaml
index c21103869923..8c0e4f285fbc 100644
--- a/Documentation/devicetree/bindings/display/bridge/anx6345.yaml
+++ b/Documentation/devicetree/bindings/display/bridge/anx6345.yaml
@@ -37,6 +37,12 @@ properties:
     type: object
 
     properties:
+      '#address-cells':
+        const: 1
+
+      '#size-cells':
+        const: 0
+
       port@0:
         type: object
         description: |
@@ -51,6 +57,8 @@ properties:
     required:
       - port@0
 
+    additionalProperties: false
+
 required:
   - compatible
   - reg
diff --git a/Documentation/devicetree/bindings/display/bridge/lvds-codec.yaml b/Documentation/devicetree/bindings/display/bridge/lvds-codec.yaml
index 8f373029f5d2..800c63764e71 100644
--- a/Documentation/devicetree/bindings/display/bridge/lvds-codec.yaml
+++ b/Documentation/devicetree/bindings/display/bridge/lvds-codec.yaml
@@ -50,6 +50,12 @@ properties:
       This device has two video ports. Their connections are modeled using the
       OF graph bindings specified in Documentation/devicetree/bindings/graph.txt
     properties:
+      '#address-cells':
+        const: 1
+
+      '#size-cells':
+        const: 0
+
       port@0:
         type: object
         description: |
@@ -66,6 +72,8 @@ properties:
       - port@0
       - port@1
 
+    additionalProperties: false
+
   powerdown-gpios:
     description:
       The GPIO used to control the power down line of this device.
diff --git a/Documentation/devicetree/bindings/display/bridge/ps8640.yaml b/Documentation/devicetree/bindings/display/bridge/ps8640.yaml
index 5dff93641bea..7e27cfcf770d 100644
--- a/Documentation/devicetree/bindings/display/bridge/ps8640.yaml
+++ b/Documentation/devicetree/bindings/display/bridge/ps8640.yaml
@@ -50,6 +50,12 @@ properties:
       Documentation/devicetree/bindings/media/video-interfaces.txt
       Documentation/devicetree/bindings/graph.txt
     properties:
+      '#address-cells':
+        const: 1
+
+      '#size-cells':
+        const: 0
+
       port@0:
         type: object
         description: |
@@ -63,6 +69,8 @@ properties:
     required:
       - port@0
 
+    additionalProperties: false
+
 required:
   - compatible
   - reg
-- 
Regards,

Laurent Pinchart

