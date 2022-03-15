Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 692904D9D90
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 15 Mar 2022 15:29:46 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1349214AbiCOOal (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 15 Mar 2022 10:30:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36732 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1349230AbiCOOad (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 15 Mar 2022 10:30:33 -0400
Received: from relmlie6.idc.renesas.com (relmlor2.renesas.com [210.160.252.172])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 1E93455220;
        Tue, 15 Mar 2022 07:29:21 -0700 (PDT)
X-IronPort-AV: E=Sophos;i="5.90,183,1643641200"; 
   d="scan'208";a="114494343"
Received: from unknown (HELO relmlir5.idc.renesas.com) ([10.200.68.151])
  by relmlie6.idc.renesas.com with ESMTP; 15 Mar 2022 23:29:20 +0900
Received: from localhost.localdomain (unknown [10.226.92.209])
        by relmlir5.idc.renesas.com (Postfix) with ESMTP id 336BE40062A0;
        Tue, 15 Mar 2022 23:29:18 +0900 (JST)
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
Subject: [PATCH v3 4/7] dt-bindings: clock: renesas: Document RZ/G2UL SoC
Date:   Tue, 15 Mar 2022 14:29:15 +0000
Message-Id: <20220315142915.17764-1-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.17.1
X-Spam-Status: No, score=1.1 required=5.0 tests=AC_FROM_MANY_DOTS,BAYES_00,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=no
        autolearn_force=no version=3.4.6
X-Spam-Level: *
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
Reviewed-by: Rob Herring <robh@kernel.org>
---
v2->v3:
 * Changed the compatible from r9a07g043u-cpg->r9a07g043-cpg
 * Retained the Rb tag from Rob as it is trivial change.
v1->v2:
 * No change
---
 .../devicetree/bindings/clock/renesas,rzg2l-cpg.yaml       | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/Documentation/devicetree/bindings/clock/renesas,rzg2l-cpg.yaml b/Documentation/devicetree/bindings/clock/renesas,rzg2l-cpg.yaml
index bd3af8fc616b..b728a677222e 100644
--- a/Documentation/devicetree/bindings/clock/renesas,rzg2l-cpg.yaml
+++ b/Documentation/devicetree/bindings/clock/renesas,rzg2l-cpg.yaml
@@ -10,7 +10,7 @@ maintainers:
   - Geert Uytterhoeven <geert+renesas@glider.be>
 
 description: |
-  On Renesas RZ/{G2L,V2L} SoC, the CPG (Clock Pulse Generator) and Module
+  On Renesas RZ/{G2L,V2L}-alike SoC's, the CPG (Clock Pulse Generator) and Module
   Standby Mode share the same register block.
 
   They provide the following functionalities:
@@ -23,8 +23,9 @@ description: |
 properties:
   compatible:
     enum:
-      - renesas,r9a07g044-cpg  # RZ/G2{L,LC}
-      - renesas,r9a07g054-cpg  # RZ/V2L
+      - renesas,r9a07g043-cpg   # RZ/G2UL{Type-1,Type-2}
+      - renesas,r9a07g044-cpg   # RZ/G2{L,LC}
+      - renesas,r9a07g054-cpg   # RZ/V2L
 
   reg:
     maxItems: 1
-- 
2.17.1

