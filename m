Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 669BC4CBD68
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  3 Mar 2022 13:13:56 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233092AbiCCMOk (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 3 Mar 2022 07:14:40 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51618 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233079AbiCCMOk (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 3 Mar 2022 07:14:40 -0500
Received: from relmlie6.idc.renesas.com (relmlor2.renesas.com [210.160.252.172])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 7E40AB0D20;
        Thu,  3 Mar 2022 04:13:54 -0800 (PST)
X-IronPort-AV: E=Sophos;i="5.90,151,1643641200"; 
   d="scan'208";a="113048362"
Received: from unknown (HELO relmlir6.idc.renesas.com) ([10.200.68.152])
  by relmlie6.idc.renesas.com with ESMTP; 03 Mar 2022 21:13:53 +0900
Received: from localhost.localdomain (unknown [10.226.93.138])
        by relmlir6.idc.renesas.com (Postfix) with ESMTP id DFE9542F4DBC;
        Thu,  3 Mar 2022 21:13:51 +0900 (JST)
From:   Biju Das <biju.das.jz@bp.renesas.com>
To:     Rob Herring <robh+dt@kernel.org>
Cc:     Biju Das <biju.das.jz@bp.renesas.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        devicetree@vger.kernel.org,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Biju Das <biju.das@bp.renesas.com>,
        linux-renesas-soc@vger.kernel.org
Subject: [PATCH 1/7] dt-bindings: power: renesas,rzg2l-sysc: Document RZ/G2UL SoC
Date:   Thu,  3 Mar 2022 12:13:40 +0000
Message-Id: <20220303121346.4769-2-biju.das.jz@bp.renesas.com>
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

Add DT binding documentation for SYSC controller found on RZ/G2UL SoC's.
SYSC controller found on the RZ/G2UL SoC is almost identical to one found
on the RZ/G2L SoC's only difference being that the RZ/G2UL has only CA55
core0 reset vector address configuration register.

Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
Reviewed-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
---
 .../devicetree/bindings/power/renesas,rzg2l-sysc.yaml | 11 ++++++-----
 1 file changed, 6 insertions(+), 5 deletions(-)

diff --git a/Documentation/devicetree/bindings/power/renesas,rzg2l-sysc.yaml b/Documentation/devicetree/bindings/power/renesas,rzg2l-sysc.yaml
index bb433e75a0ee..ce372378ff97 100644
--- a/Documentation/devicetree/bindings/power/renesas,rzg2l-sysc.yaml
+++ b/Documentation/devicetree/bindings/power/renesas,rzg2l-sysc.yaml
@@ -4,14 +4,14 @@
 $id: "http://devicetree.org/schemas/power/renesas,rzg2l-sysc.yaml#"
 $schema: "http://devicetree.org/meta-schemas/core.yaml#"
 
-title: Renesas RZ/{G2L,V2L} System Controller (SYSC)
+title: Renesas RZ/{G2L, G2UL, V2L} System Controller (SYSC)
 
 maintainers:
   - Geert Uytterhoeven <geert+renesas@glider.be>
 
 description:
-  The RZ/{G2L,V2L} System Controller (SYSC) performs system control of the LSI
-  and supports following functions,
+  The RZ/{G2L, G2UL, V2L} System Controller (SYSC) performs system control of
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
+      - renesas,r9a07g043u-sysc # RZ/G2UL
+      - renesas,r9a07g044-sysc  # RZ/G2{L,LC}
+      - renesas,r9a07g054-sysc  # RZ/V2L
 
   reg:
     maxItems: 1
-- 
2.17.1

