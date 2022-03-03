Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B489D4CBD6F
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  3 Mar 2022 13:14:03 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233098AbiCCMOq (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 3 Mar 2022 07:14:46 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52182 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231876AbiCCMOq (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 3 Mar 2022 07:14:46 -0500
Received: from relmlie5.idc.renesas.com (relmlor1.renesas.com [210.160.252.171])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 01E43157216;
        Thu,  3 Mar 2022 04:14:00 -0800 (PST)
X-IronPort-AV: E=Sophos;i="5.90,151,1643641200"; 
   d="scan'208";a="112218619"
Received: from unknown (HELO relmlir6.idc.renesas.com) ([10.200.68.152])
  by relmlie5.idc.renesas.com with ESMTP; 03 Mar 2022 21:14:00 +0900
Received: from localhost.localdomain (unknown [10.226.93.138])
        by relmlir6.idc.renesas.com (Postfix) with ESMTP id 6C8FC42F4DB2;
        Thu,  3 Mar 2022 21:13:58 +0900 (JST)
From:   Biju Das <biju.das.jz@bp.renesas.com>
To:     Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Rob Herring <robh+dt@kernel.org>
Cc:     Biju Das <biju.das.jz@bp.renesas.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        linux-renesas-soc@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Biju Das <biju.das@bp.renesas.com>,
        Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH 4/7] dt-bindings: clock: renesas: Document RZ/G2UL SoC
Date:   Thu,  3 Mar 2022 12:13:43 +0000
Message-Id: <20220303121346.4769-5-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20220303121346.4769-1-biju.das.jz@bp.renesas.com>
References: <20220303121346.4769-1-biju.das.jz@bp.renesas.com>
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,SPF_HELO_NONE,
        SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Document the device tree binding for the Renesas RZ/G2UL Type-1
and Type-2 SoC. RZ/G2UL Type-2 has fewer clocks than RZ/G2UL Type-1
SoC.

Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
Reviewed-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
---
 .../devicetree/bindings/clock/renesas,rzg2l-cpg.yaml     | 9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)

diff --git a/Documentation/devicetree/bindings/clock/renesas,rzg2l-cpg.yaml b/Documentation/devicetree/bindings/clock/renesas,rzg2l-cpg.yaml
index bd3af8fc616b..256258025c26 100644
--- a/Documentation/devicetree/bindings/clock/renesas,rzg2l-cpg.yaml
+++ b/Documentation/devicetree/bindings/clock/renesas,rzg2l-cpg.yaml
@@ -4,13 +4,13 @@
 $id: "http://devicetree.org/schemas/clock/renesas,rzg2l-cpg.yaml#"
 $schema: "http://devicetree.org/meta-schemas/core.yaml#"
 
-title: Renesas RZ/{G2L,V2L} Clock Pulse Generator / Module Standby Mode
+title: Renesas RZ/{G2L,G2UL,V2L} Clock Pulse Generator / Module Standby Mode
 
 maintainers:
   - Geert Uytterhoeven <geert+renesas@glider.be>
 
 description: |
-  On Renesas RZ/{G2L,V2L} SoC, the CPG (Clock Pulse Generator) and Module
+  On Renesas RZ/{G2L,G2UL,V2L} SoC, the CPG (Clock Pulse Generator) and Module
   Standby Mode share the same register block.
 
   They provide the following functionalities:
@@ -23,8 +23,9 @@ description: |
 properties:
   compatible:
     enum:
-      - renesas,r9a07g044-cpg  # RZ/G2{L,LC}
-      - renesas,r9a07g054-cpg  # RZ/V2L
+      - renesas,r9a07g043u-cpg  # RZ/G2UL{Type-1,Type-2}
+      - renesas,r9a07g044-cpg   # RZ/G2{L,LC}
+      - renesas,r9a07g054-cpg   # RZ/V2L
 
   reg:
     maxItems: 1
-- 
2.17.1

