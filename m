Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 182B4786D15
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 24 Aug 2023 12:49:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232228AbjHXKs1 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 24 Aug 2023 06:48:27 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41106 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238116AbjHXKsZ (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 24 Aug 2023 06:48:25 -0400
Received: from relmlie5.idc.renesas.com (relmlor1.renesas.com [210.160.252.171])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id D78C010DA;
        Thu, 24 Aug 2023 03:48:22 -0700 (PDT)
X-IronPort-AV: E=Sophos;i="6.01,195,1684767600"; 
   d="scan'208";a="173833534"
Received: from unknown (HELO relmlir5.idc.renesas.com) ([10.200.68.151])
  by relmlie5.idc.renesas.com with ESMTP; 24 Aug 2023 19:48:22 +0900
Received: from localhost.localdomain (unknown [10.226.93.115])
        by relmlir5.idc.renesas.com (Postfix) with ESMTP id 6A0A2400721C;
        Thu, 24 Aug 2023 19:48:18 +0900 (JST)
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
        Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        Conor Dooley <conor.dooley@microchip.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH v5 1/4] dt-bindings: clock: versaclock3: Add description for #clock-cells property
Date:   Thu, 24 Aug 2023 11:48:09 +0100
Message-Id: <20230824104812.147775-2-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230824104812.147775-1-biju.das.jz@bp.renesas.com>
References: <20230824104812.147775-1-biju.das.jz@bp.renesas.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,SPF_HELO_NONE,
        SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Add description for "#clock-cells" property to map indexes to the clock
output in the Table 3. ("Output Source") in the 5P35023 datasheet
(ie: {REF,SE1,SE2,SE3,DIFF1,DIFF2}. Also update the "assigned-clock-rates"
in the example.

While at it, replace clocks phandle in the example from x1_x2->x1 as
X2 is a different 32768 kHz crystal.

Suggested-by: Geert Uytterhoeven <geert+renesas@glider.be>
Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
Acked-by: Conor Dooley <conor.dooley@microchip.com>
Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
v4->v5:
 * Added description for "#clock-cells" property to map indexes to the
   clock output.
 * Updated commit header and description to reflect this change.
 * Dropped fixes tag.
 * Retained Ack tag from Conor and Krzysztof as it is trivial change.
v3->v4:
 * Dropped clock-output-names as there is no validation for it and people
   can get it wrong.
 * Updated commit header, description and example to reflect this change
 * Retained Ack tag from Conor and Krzysztof as it is trivial change.
v2->v3:
 * No change.
v1->v2:
 * Updated commit description to make it clear it fixes
   "assigned-clock-rates" in the example based on 5P35023 datasheet.
---
 .../devicetree/bindings/clock/renesas,5p35023.yaml    | 11 +++++++----
 1 file changed, 7 insertions(+), 4 deletions(-)

diff --git a/Documentation/devicetree/bindings/clock/renesas,5p35023.yaml b/Documentation/devicetree/bindings/clock/renesas,5p35023.yaml
index 839648e753d4..42b6f80613f3 100644
--- a/Documentation/devicetree/bindings/clock/renesas,5p35023.yaml
+++ b/Documentation/devicetree/bindings/clock/renesas,5p35023.yaml
@@ -37,6 +37,9 @@ properties:
     maxItems: 1
 
   '#clock-cells':
+    description:
+      The index in the assigned-clocks is mapped to the output clock as below
+      0 - REF, 1 - SE1, 2 - SE2, 3 - SE3, 4 - DIFF1, 5 - DIFF2.
     const: 1
 
   clocks:
@@ -68,7 +71,7 @@ examples:
             reg = <0x68>;
             #clock-cells = <1>;
 
-            clocks = <&x1_x2>;
+            clocks = <&x1>;
 
             renesas,settings = [
                 80 00 11 19 4c 02 23 7f 83 19 08 a9 5f 25 24 bf
@@ -79,8 +82,8 @@ examples:
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

