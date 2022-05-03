Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 21EFE5183BC
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  3 May 2022 14:01:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235002AbiECMEy (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 3 May 2022 08:04:54 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51358 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231795AbiECMEw (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 3 May 2022 08:04:52 -0400
Received: from relmlie5.idc.renesas.com (relmlor1.renesas.com [210.160.252.171])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id DD55E31233;
        Tue,  3 May 2022 05:01:19 -0700 (PDT)
X-IronPort-AV: E=Sophos;i="5.91,195,1647270000"; 
   d="scan'208";a="118643131"
Received: from unknown (HELO relmlir6.idc.renesas.com) ([10.200.68.152])
  by relmlie5.idc.renesas.com with ESMTP; 03 May 2022 21:01:19 +0900
Received: from localhost.localdomain (unknown [10.226.92.6])
        by relmlir6.idc.renesas.com (Postfix) with ESMTP id 3BA904226915;
        Tue,  3 May 2022 21:01:15 +0900 (JST)
From:   Phil Edworthy <phil.edworthy@renesas.com>
To:     Geert Uytterhoeven <geert+renesas@glider.be>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc:     Phil Edworthy <phil.edworthy@renesas.com>,
        linux-renesas-soc@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, Biju Das <biju.das.jz@bp.renesas.com>,
        Krzysztof Kozlowski <krzk@kernel.org>
Subject: [PATCH v3 03/12] dt-bindings: clock: renesas,rzg2l: Document RZ/V2M SoC
Date:   Tue,  3 May 2022 12:55:48 +0100
Message-Id: <20220503115557.53370-4-phil.edworthy@renesas.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20220503115557.53370-1-phil.edworthy@renesas.com>
References: <20220503115557.53370-1-phil.edworthy@renesas.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,SPF_HELO_NONE,
        SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Document the device tree binding for the Renesas RZ/V2M (r9a09g011) SoC.

Signed-off-by: Phil Edworthy <phil.edworthy@renesas.com>
Reviewed-by: Biju Das <biju.das.jz@bp.renesas.com>
Reviewed-by: Krzysztof Kozlowski <krzk@kernel.org>
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
v3:
 - Simplify reference to header files.
---
 .../bindings/clock/renesas,rzg2l-cpg.yaml           | 13 ++++++++-----
 1 file changed, 8 insertions(+), 5 deletions(-)

diff --git a/Documentation/devicetree/bindings/clock/renesas,rzg2l-cpg.yaml b/Documentation/devicetree/bindings/clock/renesas,rzg2l-cpg.yaml
index 311a93590597..8880b834f264 100644
--- a/Documentation/devicetree/bindings/clock/renesas,rzg2l-cpg.yaml
+++ b/Documentation/devicetree/bindings/clock/renesas,rzg2l-cpg.yaml
@@ -4,14 +4,15 @@
 $id: "http://devicetree.org/schemas/clock/renesas,rzg2l-cpg.yaml#"
 $schema: "http://devicetree.org/meta-schemas/core.yaml#"
 
-title: Renesas RZ/{G2L,V2L} Clock Pulse Generator / Module Standby Mode
+title: Renesas RZ/{G2L,V2L,V2M} Clock Pulse Generator / Module Standby Mode
 
 maintainers:
   - Geert Uytterhoeven <geert+renesas@glider.be>
 
 description: |
   On Renesas RZ/{G2L,V2L}-alike SoC's, the CPG (Clock Pulse Generator) and Module
-  Standby Mode share the same register block.
+  Standby Mode share the same register block. On RZ/V2M, the functionality is
+  similar, but does not have Clock Monitor Registers.
 
   They provide the following functionalities:
     - The CPG block generates various core clocks,
@@ -26,6 +27,7 @@ properties:
       - renesas,r9a07g043-cpg # RZ/G2UL{Type-1,Type-2}
       - renesas,r9a07g044-cpg # RZ/G2{L,LC}
       - renesas,r9a07g054-cpg # RZ/V2L
+      - renesas,r9a09g011-cpg # RZ/V2M
 
   reg:
     maxItems: 1
@@ -43,9 +45,10 @@ properties:
     description: |
       - For CPG core clocks, the two clock specifier cells must be "CPG_CORE"
         and a core clock reference, as defined in
-        <dt-bindings/clock/r9a07g*-cpg.h>
+        <dt-bindings/clock/r9a0*-cpg.h>
       - For module clocks, the two clock specifier cells must be "CPG_MOD" and
-        a module number, as defined in the <dt-bindings/clock/r9a07g0*-cpg.h>.
+        a module number, as defined in the <dt-bindings/clock/r9a07g0*-cpg.h> or
+        <dt-bindings/clock/r9a09g011-cpg.h>.
     const: 2
 
   '#power-domain-cells':
@@ -59,7 +62,7 @@ properties:
   '#reset-cells':
     description:
       The single reset specifier cell must be the module number, as defined in
-      the <dt-bindings/clock/r9a07g0*-cpg.h>.
+      the <dt-bindings/clock/r9a07g0*-cpg.h> or <dt-bindings/clock/r9a09g011-cpg.h>.
     const: 1
 
 required:
-- 
2.32.0

