Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C98943A285E
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 10 Jun 2021 11:37:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230196AbhFJJji (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 10 Jun 2021 05:39:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37404 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229961AbhFJJjh (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 10 Jun 2021 05:39:37 -0400
Received: from albert.telenet-ops.be (albert.telenet-ops.be [IPv6:2a02:1800:110:4::f00:1a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BC6F8C061760
        for <linux-renesas-soc@vger.kernel.org>; Thu, 10 Jun 2021 02:37:40 -0700 (PDT)
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed20:a946:bccb:b1a1:3055])
        by albert.telenet-ops.be with bizsmtp
        id FMde2500M0wnyou06MdeEb; Thu, 10 Jun 2021 11:37:39 +0200
Received: from rox.of.borg ([192.168.97.57])
        by ramsan.of.borg with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
        (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1lrH86-00FDX0-8c; Thu, 10 Jun 2021 11:37:38 +0200
Received: from geert by rox.of.borg with local (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1lrH85-00BTlL-Mz; Thu, 10 Jun 2021 11:37:37 +0200
From:   Geert Uytterhoeven <geert+renesas@glider.be>
To:     Magnus Damm <magnus.damm@gmail.com>,
        Rob Herring <robh+dt@kernel.org>
Cc:     linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH 01/14] dt-bindings: arm: renesas: Document R-Car H3e-2G and M3e-2G SoCs and boards
Date:   Thu, 10 Jun 2021 11:37:14 +0200
Message-Id: <f79841c1881f8b9a2c10fadb3d3ad6cb5fccc6a5.1623315732.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1623315732.git.geert+renesas@glider.be>
References: <cover.1623315732.git.geert+renesas@glider.be>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Document the compatible values for the R-Car H3e-2G (R8A779M1) and
M3e-2G (R8A779M3) SoCs.  These are different gradings of the R-Car H3
ES3.0 (R8A77951) and M3-W+ (R8A77961) SoCs.

All R-Car Gen3e on-SoC devices are identical to the devices on the
corresponding R-Car Gen3 SoCs, and thus just use the compatible values
for the latter.  The root compatible properties do gain an additional
value, to sort out integration issues if they ever arise.

Document the use of these SoCs on the Salvator-XS and ULCB (with and
without Kingfisher) development boards.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
 .../devicetree/bindings/arm/renesas.yaml      | 50 +++++++++++++++----
 1 file changed, 39 insertions(+), 11 deletions(-)

diff --git a/Documentation/devicetree/bindings/arm/renesas.yaml b/Documentation/devicetree/bindings/arm/renesas.yaml
index 5fd0696a9f91f383..a01dd064bf16632a 100644
--- a/Documentation/devicetree/bindings/arm/renesas.yaml
+++ b/Documentation/devicetree/bindings/arm/renesas.yaml
@@ -238,17 +238,29 @@ properties:
           - const: renesas,r8a77961
 
       - description: Kingfisher (SBEV-RCAR-KF-M03)
-        items:
-          - const: shimafuji,kingfisher
-          - enum:
-              - renesas,h3ulcb
-              - renesas,m3ulcb
-              - renesas,m3nulcb
-          - enum:
-              - renesas,r8a7795
-              - renesas,r8a7796
-              - renesas,r8a77961
-              - renesas,r8a77965
+        oneOf:
+          - items:
+              - const: shimafuji,kingfisher
+              - enum:
+                  - renesas,h3ulcb
+                  - renesas,m3ulcb
+                  - renesas,m3nulcb
+              - enum:
+                  - renesas,r8a7795
+                  - renesas,r8a7796
+                  - renesas,r8a77961
+                  - renesas,r8a77965
+          - items:
+              - const: shimafuji,kingfisher
+              - enum:
+                  - renesas,h3ulcb
+                  - renesas,m3ulcb
+              - enum:
+                  - renesas,r8a779m1
+                  - renesas,r8a779m3
+              - enum:
+                  - renesas,r8a7795
+                  - renesas,r8a77961
 
       - description: R-Car M3-N (R8A77965)
         items:
@@ -296,6 +308,22 @@ properties:
           - const: renesas,falcon-cpu
           - const: renesas,r8a779a0
 
+      - description: R-Car H3e-2G (R8A779M1)
+        items:
+          - enum:
+              - renesas,h3ulcb      # H3ULCB (R-Car Starter Kit Premier)
+              - renesas,salvator-xs # Salvator-XS (Salvator-X 2nd version)
+          - const: renesas,r8a779m1
+          - const: renesas,r8a7795
+
+      - description: R-Car M3e-2G (R8A779M3)
+        items:
+          - enum:
+              - renesas,m3ulcb      # M3ULCB (R-Car Starter Kit Pro)
+              - renesas,salvator-xs # Salvator-XS (Salvator-X 2nd version)
+          - const: renesas,r8a779m3
+          - const: renesas,r8a77961
+
       - description: RZ/N1D (R9A06G032)
         items:
           - enum:
-- 
2.25.1

