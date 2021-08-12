Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2591D3EA37B
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 12 Aug 2021 13:24:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236902AbhHLLY5 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 12 Aug 2021 07:24:57 -0400
Received: from leibniz.telenet-ops.be ([195.130.137.77]:53658 "EHLO
        leibniz.telenet-ops.be" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236827AbhHLLYx (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 12 Aug 2021 07:24:53 -0400
Received: from baptiste.telenet-ops.be (baptiste.telenet-ops.be [IPv6:2a02:1800:120:4::f00:13])
        by leibniz.telenet-ops.be (Postfix) with ESMTPS id 4GlkqG1m6NzMrF7B
        for <linux-renesas-soc@vger.kernel.org>; Thu, 12 Aug 2021 13:24:26 +0200 (CEST)
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed20:438:1ff1:1071:f524])
        by baptiste.telenet-ops.be with bizsmtp
        id gbQQ2500D1gJxCh01bQQ4b; Thu, 12 Aug 2021 13:24:26 +0200
Received: from rox.of.borg ([192.168.97.57])
        by ramsan.of.borg with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
        (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1mE8oy-002Fil-4O; Thu, 12 Aug 2021 13:24:24 +0200
Received: from geert by rox.of.borg with local (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1mE8ox-00742n-GG; Thu, 12 Aug 2021 13:24:23 +0200
From:   Geert Uytterhoeven <geert+renesas@glider.be>
To:     Magnus Damm <magnus.damm@gmail.com>,
        Rob Herring <robh+dt@kernel.org>
Cc:     linux-renesas-soc@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Subject: [PATCH v2 01/29] dt-bindings: arm: renesas: Document more R-Car Gen3e Socs and boards
Date:   Thu, 12 Aug 2021 13:23:51 +0200
Message-Id: <55271d405112f327753945072cde5d158ab815b1.1628766192.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1628766192.git.geert+renesas@glider.be>
References: <cover.1628766192.git.geert+renesas@glider.be>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Document the compatible values for the remaining R-Car Gen3e SoCs: R-Car
H3e (R8A779M0), M3e (R8A779M2), M3Ne (R8A779M4), M3Ne-2G (R8A779M5), E3e
(R8A779M6), D3e (R8A779M7), and H3Ne (R8A779M8).  These are different
gradings of R-Car Gen3 SoCs.

All R-Car Gen3e on-SoC devices are identical to the devices on the
corresponding R-Car Gen3 SoCs, and thus just use the compatible values
for the latter.  The root compatible properties do gain an additional
value, to sort out integration issues if they ever arise.

Document the use of these SoCs on the Salvator-XS, ULCB (with and
without Kingfisher extension), Ebisu, and Draak development boards.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
---
v2:
  - Typo s/R8A779M/R8A779M0/,
  - Add Reviewed-by.
---
 .../devicetree/bindings/arm/renesas.yaml      | 61 +++++++++++++++++++
 1 file changed, 61 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/renesas.yaml b/Documentation/devicetree/bindings/arm/renesas.yaml
index 8a11918866b86482..5172065078014f39 100644
--- a/Documentation/devicetree/bindings/arm/renesas.yaml
+++ b/Documentation/devicetree/bindings/arm/renesas.yaml
@@ -255,12 +255,19 @@ properties:
               - enum:
                   - renesas,h3ulcb
                   - renesas,m3ulcb
+                  - renesas,m3nulcb
               - enum:
+                  - renesas,r8a779m0
                   - renesas,r8a779m1
+                  - renesas,r8a779m2
                   - renesas,r8a779m3
+                  - renesas,r8a779m4
+                  - renesas,r8a779m5
+                  - renesas,r8a779m8
               - enum:
                   - renesas,r8a7795
                   - renesas,r8a77961
+                  - renesas,r8a77965
 
       - description: R-Car M3-N (R8A77965)
         items:
@@ -308,6 +315,14 @@ properties:
           - const: renesas,falcon-cpu
           - const: renesas,r8a779a0
 
+      - description: R-Car H3e (R8A779M0)
+        items:
+          - enum:
+              - renesas,h3ulcb      # H3ULCB (R-Car Starter Kit Premier)
+              - renesas,salvator-xs # Salvator-XS (Salvator-X 2nd version)
+          - const: renesas,r8a779m0
+          - const: renesas,r8a7795
+
       - description: R-Car H3e-2G (R8A779M1)
         items:
           - enum:
@@ -316,6 +331,14 @@ properties:
           - const: renesas,r8a779m1
           - const: renesas,r8a7795
 
+      - description: R-Car M3e (R8A779M2)
+        items:
+          - enum:
+              - renesas,m3ulcb      # M3ULCB (R-Car Starter Kit Pro)
+              - renesas,salvator-xs # Salvator-XS (Salvator-X 2nd version)
+          - const: renesas,r8a779m2
+          - const: renesas,r8a77961
+
       - description: R-Car M3e-2G (R8A779M3)
         items:
           - enum:
@@ -324,6 +347,44 @@ properties:
           - const: renesas,r8a779m3
           - const: renesas,r8a77961
 
+      - description: R-Car M3Ne (R8A779M4)
+        items:
+          - enum:
+              - renesas,m3nulcb     # M3NULCB (R-Car Starter Kit Pro)
+              - renesas,salvator-xs # Salvator-XS (Salvator-X 2nd version)
+          - const: renesas,r8a779m4
+          - const: renesas,r8a77965
+
+      - description: R-Car M3Ne-2G (R8A779M5)
+        items:
+          - enum:
+              - renesas,m3nulcb     # M3NULCB (R-Car Starter Kit Pro)
+              - renesas,salvator-xs # Salvator-XS (Salvator-X 2nd version)
+          - const: renesas,r8a779m5
+          - const: renesas,r8a77965
+
+      - description: R-Car E3e (R8A779M6)
+        items:
+          - enum:
+              - renesas,ebisu       # Ebisu
+          - const: renesas,r8a779m6
+          - const: renesas,r8a77990
+
+      - description: R-Car D3e (R8A779M7)
+        items:
+          - enum:
+              - renesas,draak       # Draak
+          - const: renesas,r8a779m7
+          - const: renesas,r8a77995
+
+      - description: R-Car H3Ne (R8A779M8)
+        items:
+          - enum:
+              - renesas,h3ulcb      # H3ULCB (R-Car Starter Kit Premier)
+              - renesas,salvator-xs # Salvator-XS (Salvator-X 2nd version)
+          - const: renesas,r8a779m8
+          - const: renesas,r8a7795
+
       - description: RZ/N1D (R9A06G032)
         items:
           - enum:
-- 
2.25.1

