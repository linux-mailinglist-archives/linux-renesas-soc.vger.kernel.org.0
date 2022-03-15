Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2DFA64D9D74
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 15 Mar 2022 15:26:57 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1349055AbiCOO2H (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 15 Mar 2022 10:28:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59280 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1349050AbiCOO2F (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 15 Mar 2022 10:28:05 -0400
Received: from relmlie5.idc.renesas.com (relmlor1.renesas.com [210.160.252.171])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 50FA154BF0;
        Tue, 15 Mar 2022 07:26:53 -0700 (PDT)
X-IronPort-AV: E=Sophos;i="5.90,183,1643641200"; 
   d="scan'208";a="113582328"
Received: from unknown (HELO relmlir6.idc.renesas.com) ([10.200.68.152])
  by relmlie5.idc.renesas.com with ESMTP; 15 Mar 2022 23:26:52 +0900
Received: from localhost.localdomain (unknown [10.226.92.209])
        by relmlir6.idc.renesas.com (Postfix) with ESMTP id 8348E439248A;
        Tue, 15 Mar 2022 23:26:50 +0900 (JST)
From:   Biju Das <biju.das.jz@bp.renesas.com>
To:     Rob Herring <robh+dt@kernel.org>
Cc:     Biju Das <biju.das.jz@bp.renesas.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        devicetree@vger.kernel.org,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Biju Das <biju.das@bp.renesas.com>,
        linux-renesas-soc@vger.kernel.org
Subject: [PATCH v3 1/7] dt-bindings: power: renesas,rzg2l-sysc: Document RZ/G2UL SoC
Date:   Tue, 15 Mar 2022 14:26:38 +0000
Message-Id: <20220315142644.17660-2-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20220315142644.17660-1-biju.das.jz@bp.renesas.com>
References: <20220315142644.17660-1-biju.das.jz@bp.renesas.com>
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,SPF_HELO_NONE,
        SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Add DT binding documentation for SYSC controller found on RZ/G2UL SoC's.
SYSC controller found on the RZ/G2UL SoC is almost identical to one found
on the RZ/G2L SoC's only difference being that the RZ/G2UL has only CA55
core0 reset vector address configuration register.

Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
Reviewed-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Reviewed-by: Rob Herring <robh@kernel.org>
---
v2->v3:
 * Changed the compatible from r9a07g043u-sysc->r9a07g043-sysc
 * Retained Rb tag from Rob as it is trivial change.
V1->V2:
 * No change
---
 .../devicetree/bindings/power/renesas,rzg2l-sysc.yaml    | 9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)

diff --git a/Documentation/devicetree/bindings/power/renesas,rzg2l-sysc.yaml b/Documentation/devicetree/bindings/power/renesas,rzg2l-sysc.yaml
index bb433e75a0ee..9ccc23ae7054 100644
--- a/Documentation/devicetree/bindings/power/renesas,rzg2l-sysc.yaml
+++ b/Documentation/devicetree/bindings/power/renesas,rzg2l-sysc.yaml
@@ -10,8 +10,8 @@ maintainers:
   - Geert Uytterhoeven <geert+renesas@glider.be>
 
 description:
-  The RZ/{G2L,V2L} System Controller (SYSC) performs system control of the LSI
-  and supports following functions,
+  The RZ/{G2L,V2L}-alike System Controller (SYSC) performs system control of
+  the LSI and supports following functions,
   - External terminal state capture function
   - 34-bit address space access function
   - Low power consumption control
@@ -20,8 +20,9 @@ description:
 properties:
   compatible:
     enum:
-      - renesas,r9a07g044-sysc # RZ/G2{L,LC}
-      - renesas,r9a07g054-sysc # RZ/V2L
+      - renesas,r9a07g043-sysc  # RZ/G2UL
+      - renesas,r9a07g044-sysc  # RZ/G2{L,LC}
+      - renesas,r9a07g054-sysc  # RZ/V2L
 
   reg:
     maxItems: 1
-- 
2.17.1

