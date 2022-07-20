Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 10B6A57B251
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 20 Jul 2022 10:08:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237819AbiGTIIR (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 20 Jul 2022 04:08:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48336 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237691AbiGTIIO (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 20 Jul 2022 04:08:14 -0400
Received: from laurent.telenet-ops.be (laurent.telenet-ops.be [IPv6:2a02:1800:110:4::f00:19])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E40CA41D2A
        for <linux-renesas-soc@vger.kernel.org>; Wed, 20 Jul 2022 01:08:11 -0700 (PDT)
Received: from ramsan.of.borg ([84.195.186.194])
        by laurent.telenet-ops.be with bizsmtp
        id xL89270064C55Sk01L893o; Wed, 20 Jul 2022 10:08:09 +0200
Received: from rox.of.borg ([192.168.97.57])
        by ramsan.of.borg with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
        (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1oE4ka-004Ra0-MD; Wed, 20 Jul 2022 10:08:08 +0200
Received: from geert by rox.of.borg with local (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1oE4ka-00EsMf-3n; Wed, 20 Jul 2022 10:08:08 +0200
From:   Geert Uytterhoeven <geert+renesas@glider.be>
To:     Magnus Damm <magnus.damm@gmail.com>
Cc:     Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH 1/6] dt-bindings: arm: renesas: Document R-Car H3Ne-1.7G SoC and boards
Date:   Wed, 20 Jul 2022 10:08:02 +0200
Message-Id: <f816f58d1c3fbd0605589e7648a43d78a4e1e694.1656072871.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1656072871.git.geert+renesas@glider.be>
References: <cover.1656072871.git.geert+renesas@glider.be>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.3 required=5.0 tests=BAYES_00,
        HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_LOW,SPF_HELO_NONE,SPF_NONE
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Document the compatible values for the R-Car H3Ne-1.7G (R8A779MB)
SoC.  This is a different grading of the R-Car H3-N (R8A77951) SoC.

All R-Car H3Ne-1.7G on-SoC devices are identical to the corresponding
devices on the R-Car H3-N SoC, and thus just use the compatible values
for the latter.  The root compatible property does gain an additional
value, to sort out integration issues if they ever arise.

Document the use of this SoC on the Salvator-XS and ULCB (with and
without Kingfisher) development boards.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
 Documentation/devicetree/bindings/arm/renesas.yaml | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/renesas.yaml b/Documentation/devicetree/bindings/arm/renesas.yaml
index ff80152f092fc10e..f0960c04dad9b5af 100644
--- a/Documentation/devicetree/bindings/arm/renesas.yaml
+++ b/Documentation/devicetree/bindings/arm/renesas.yaml
@@ -264,6 +264,7 @@ properties:
                   - renesas,r8a779m4
                   - renesas,r8a779m5
                   - renesas,r8a779m8
+                  - renesas,r8a779mb
               - enum:
                   - renesas,r8a7795
                   - renesas,r8a77961
@@ -409,6 +410,14 @@ properties:
           - const: renesas,r8a779m8
           - const: renesas,r8a7795
 
+      - description: R-Car H3Ne-1.7G (R8A779MB)
+        items:
+          - enum:
+              - renesas,h3ulcb      # H3ULCB (R-Car Starter Kit Premier)
+              - renesas,salvator-xs # Salvator-XS (Salvator-X 2nd version)
+          - const: renesas,r8a779mb
+          - const: renesas,r8a7795
+
       - description: RZ/N1D (R9A06G032)
         items:
           - enum:
-- 
2.25.1

