Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B8080415F21
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 23 Sep 2021 15:02:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241187AbhIWNDt (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 23 Sep 2021 09:03:49 -0400
Received: from perceval.ideasonboard.com ([213.167.242.64]:33198 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241132AbhIWNDo (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 23 Sep 2021 09:03:44 -0400
Received: from Monstersaurus.local (cpc89244-aztw30-2-0-cust3082.18-1.cable.virginm.net [86.31.172.11])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 2ACDE58B;
        Thu, 23 Sep 2021 15:02:11 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1632402131;
        bh=05rjp5WSR/1Bxv5/2/vCD/16x9TmSWIbQAcYFhs85QA=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=Tjdwski2OSJLN/jQhgWMIgRH5YZB+fUH7DGeS9i2yYEC9zD7gvFPipIIIluhF+t3f
         8jyF25BwbY4U9ca5nFzv7s2FpzNWPqg2YzXbujzY9p4lZgRxTk1f+e2LrxD6v8yKqy
         aVvyu2UNSqG1DJXuJ/chgSgp5htjS9yiJTDlPUgU=
From:   Kieran Bingham <kieran.bingham@ideasonboard.com>
To:     linux-renesas-soc@vger.kernel.org,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Geert Uytterhoeven <geert@glider.be>
Cc:     Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        Rob Herring <robh+dt@kernel.org>,
        dri-devel@lists.freedesktop.org (open list:DRM DRIVERS FOR RENESAS),
        devicetree@vger.kernel.org (open list:OPEN FIRMWARE AND FLATTENED
        DEVICE TREE BINDINGS), linux-kernel@vger.kernel.org (open list)
Subject: [PATCH v3.1] dt-bindings: display: renesas,du: Provide bindings for r8a779a0
Date:   Thu, 23 Sep 2021 14:01:38 +0100
Message-Id: <20210923130138.67552-1-kieran.bingham@ideasonboard.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210922234726.3337265-2-kieran.bingham@ideasonboard.com>
References: <20210922234726.3337265-2-kieran.bingham@ideasonboard.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

From: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>

Extend the Renesas DU display bindings to support the r8a779a0 V3U.

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
Signed-off-by: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>

---
v2:
 - Collected Laurent's tag
 - Remove clock-names requirement
 - Specify only a single clock

v3:
 - Use clocknames: 'du.0' instead of 'du' to remain consistent

v3.1:
 - Require clock-names
 - Collect Geert's tag

 .../bindings/display/renesas,du.yaml          | 51 +++++++++++++++++++
 1 file changed, 51 insertions(+)

diff --git a/Documentation/devicetree/bindings/display/renesas,du.yaml b/Documentation/devicetree/bindings/display/renesas,du.yaml
index e3ca5389c17d..13efea574584 100644
--- a/Documentation/devicetree/bindings/display/renesas,du.yaml
+++ b/Documentation/devicetree/bindings/display/renesas,du.yaml
@@ -39,6 +39,7 @@ properties:
       - renesas,du-r8a77980 # for R-Car V3H compatible DU
       - renesas,du-r8a77990 # for R-Car E3 compatible DU
       - renesas,du-r8a77995 # for R-Car D3 compatible DU
+      - renesas,du-r8a779a0 # for R-Car V3U compatible DU
 
   reg:
     maxItems: 1
@@ -773,6 +774,56 @@ allOf:
         - reset-names
         - renesas,vsps
 
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - renesas,du-r8a779a0
+    then:
+      properties:
+        clocks:
+          items:
+            - description: Functional clock
+
+        clock-names:
+          maxItems: 1
+          items:
+            - const: du.0
+
+        interrupts:
+          maxItems: 2
+
+        resets:
+          maxItems: 1
+
+        reset-names:
+          items:
+            - const: du.0
+
+        ports:
+          properties:
+            port@0:
+              description: DSI 0
+            port@1:
+              description: DSI 1
+            port@2: false
+            port@3: false
+
+          required:
+            - port@0
+            - port@1
+
+        renesas,vsps:
+          minItems: 2
+
+      required:
+        - clock-names
+        - interrupts
+        - resets
+        - reset-names
+        - renesas,vsps
+
 additionalProperties: false
 
 examples:
-- 
2.30.2

