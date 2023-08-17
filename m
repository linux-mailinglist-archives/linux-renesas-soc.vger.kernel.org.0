Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 42D3677F8B5
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 17 Aug 2023 16:23:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1351824AbjHQOWb (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 17 Aug 2023 10:22:31 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58612 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1351837AbjHQOWZ (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 17 Aug 2023 10:22:25 -0400
Received: from relmlie6.idc.renesas.com (relmlor2.renesas.com [210.160.252.172])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 14C3A2D77;
        Thu, 17 Aug 2023 07:22:23 -0700 (PDT)
X-IronPort-AV: E=Sophos;i="6.01,180,1684767600"; 
   d="scan'208";a="176882438"
Received: from unknown (HELO relmlir6.idc.renesas.com) ([10.200.68.152])
  by relmlie6.idc.renesas.com with ESMTP; 17 Aug 2023 23:22:23 +0900
Received: from localhost.localdomain (unknown [10.226.93.71])
        by relmlir6.idc.renesas.com (Postfix) with ESMTP id 7F5AF4270482;
        Thu, 17 Aug 2023 23:22:19 +0900 (JST)
From:   Biju Das <biju.das.jz@bp.renesas.com>
To:     Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc:     Biju Das <biju.das.jz@bp.renesas.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Magnus Damm <magnus.damm@gmail.com>,
        linux-renesas-soc@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org,
        Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH v3 1/4] dt-bindings: clock: versaclock3: Document clock-output-names
Date:   Thu, 17 Aug 2023 15:22:08 +0100
Message-Id: <20230817142211.311366-2-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230817142211.311366-1-biju.das.jz@bp.renesas.com>
References: <20230817142211.311366-1-biju.das.jz@bp.renesas.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Document clock-output-names property and fix the "assigned-clock-rates"
for each clock output in the example based on Table 3. ("Output Source")
in the 5P35023 datasheet(ie: {REF,SE1,SE2,SE3,DIFF1,DIFF2}).

While at it, replace clocks phandle in the example from x1_x2->x1 as
X2 is a different 32768 kHz crystal.

Suggested-by: Geert Uytterhoeven <geert+renesas@glider.be>
Closes: https://lore.kernel.org/all/CAMuHMdUHD+bEco=WYTYWsTAyRt3dTQQt4Xpaejss0Y2ZpLCMNg@mail.gmail.com/
Fixes: a03d23f860eb ("dt-bindings: clock: Add Renesas versa3 clock generator bindings")
Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
v2->v3:
 * No change.
v1->v2:
 * Updated commit description to make it clear it fixes
   "assigned-clock-rates" in the example based on 5P35023 datasheet.
---
 .../devicetree/bindings/clock/renesas,5p35023.yaml | 14 ++++++++++----
 1 file changed, 10 insertions(+), 4 deletions(-)

diff --git a/Documentation/devicetree/bindings/clock/renesas,5p35023.yaml b/Documentation/devicetree/bindings/clock/renesas,5p35023.yaml
index 839648e753d4..db8d01b291dd 100644
--- a/Documentation/devicetree/bindings/clock/renesas,5p35023.yaml
+++ b/Documentation/devicetree/bindings/clock/renesas,5p35023.yaml
@@ -49,6 +49,9 @@ properties:
     $ref: /schemas/types.yaml#/definitions/uint8-array
     maxItems: 37
 
+  clock-output-names:
+    maxItems: 6
+
 required:
   - compatible
   - reg
@@ -68,7 +71,7 @@ examples:
             reg = <0x68>;
             #clock-cells = <1>;
 
-            clocks = <&x1_x2>;
+            clocks = <&x1>;
 
             renesas,settings = [
                 80 00 11 19 4c 02 23 7f 83 19 08 a9 5f 25 24 bf
@@ -76,11 +79,14 @@ examples:
                 80 b0 45 c4 95
             ];
 
+            clock-output-names = "ref", "se1", "se2", "se3",
+                                 "diff1", "diff2";
+
             assigned-clocks = <&versa3 0>, <&versa3 1>,
                               <&versa3 2>, <&versa3 3>,
                               <&versa3 4>, <&versa3 5>;
-            assigned-clock-rates = <12288000>, <25000000>,
-                                   <12000000>, <11289600>,
-                                   <11289600>, <24000000>;
+            assigned-clock-rates = <24000000>, <11289600>,
+                                   <11289600>, <12000000>,
+                                   <25000000>, <12288000>;
         };
     };
-- 
2.25.1

