Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 435437869F0
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 24 Aug 2023 10:25:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234681AbjHXIZR (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 24 Aug 2023 04:25:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41138 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232616AbjHXIZP (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 24 Aug 2023 04:25:15 -0400
Received: from relmlie5.idc.renesas.com (relmlor1.renesas.com [210.160.252.171])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 1DB431709;
        Thu, 24 Aug 2023 01:25:12 -0700 (PDT)
X-IronPort-AV: E=Sophos;i="6.01,195,1684767600"; 
   d="scan'208";a="173816691"
Received: from unknown (HELO relmlir5.idc.renesas.com) ([10.200.68.151])
  by relmlie5.idc.renesas.com with ESMTP; 24 Aug 2023 17:25:12 +0900
Received: from localhost.localdomain (unknown [10.226.93.115])
        by relmlir5.idc.renesas.com (Postfix) with ESMTP id AE5814010E04;
        Thu, 24 Aug 2023 17:25:08 +0900 (JST)
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
Subject: [PATCH v4 1/4] dt-bindings: clock: versaclock3: Fix the assigned-clock-rates
Date:   Thu, 24 Aug 2023 09:24:58 +0100
Message-Id: <20230824082501.87429-2-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230824082501.87429-1-biju.das.jz@bp.renesas.com>
References: <20230824082501.87429-1-biju.das.jz@bp.renesas.com>
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

Fix the "assigned-clock-rates" for each clock output in the
example based on Table 3. ("Output Source") in the 5P35023
datasheet(ie: {REF,SE1,SE2,SE3,DIFF1,DIFF2}).

While at it, replace clocks phandle in the example from x1_x2->x1 as
X2 is a different 32768 kHz crystal.

Suggested-by: Geert Uytterhoeven <geert+renesas@glider.be>
Fixes: a03d23f860eb ("dt-bindings: clock: Add Renesas versa3 clock generator bindings")
Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
Acked-by: Conor Dooley <conor.dooley@microchip.com>
Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
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
 .../devicetree/bindings/clock/renesas,5p35023.yaml        | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/Documentation/devicetree/bindings/clock/renesas,5p35023.yaml b/Documentation/devicetree/bindings/clock/renesas,5p35023.yaml
index 839648e753d4..8260af2a36db 100644
--- a/Documentation/devicetree/bindings/clock/renesas,5p35023.yaml
+++ b/Documentation/devicetree/bindings/clock/renesas,5p35023.yaml
@@ -68,7 +68,7 @@ examples:
             reg = <0x68>;
             #clock-cells = <1>;
 
-            clocks = <&x1_x2>;
+            clocks = <&x1>;
 
             renesas,settings = [
                 80 00 11 19 4c 02 23 7f 83 19 08 a9 5f 25 24 bf
@@ -79,8 +79,8 @@ examples:
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

