Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1DA7433D574
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 16 Mar 2021 15:06:40 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235395AbhCPOGJ (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 16 Mar 2021 10:06:09 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46230 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235960AbhCPOFn (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 16 Mar 2021 10:05:43 -0400
Received: from laurent.telenet-ops.be (laurent.telenet-ops.be [IPv6:2a02:1800:110:4::f00:19])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D8092C06175F
        for <linux-renesas-soc@vger.kernel.org>; Tue, 16 Mar 2021 07:05:42 -0700 (PDT)
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed20:b1e0:9434:c5b6:aecd])
        by laurent.telenet-ops.be with bizsmtp
        id h25g2400C0UTkXy0125gqR; Tue, 16 Mar 2021 15:05:40 +0100
Received: from rox.of.borg ([192.168.97.57])
        by ramsan.of.borg with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
        (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1lMAKJ-0088j8-L7; Tue, 16 Mar 2021 15:05:39 +0100
Received: from geert by rox.of.borg with local (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1lMAKJ-00A5Oi-72; Tue, 16 Mar 2021 15:05:39 +0100
From:   Geert Uytterhoeven <geert+renesas@glider.be>
To:     Luca Ceresoli <luca@lucaceresoli.net>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Adam Ford <aford173@gmail.com>
Cc:     linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Rob Herring <robh@kernel.org>
Subject: [PATCH v4] dt-bindings: clk: versaclock5: Miscellaneous fixes and improvements:
Date:   Tue, 16 Mar 2021 15:05:38 +0100
Message-Id: <20210316140538.2403985-1-geert+renesas@glider.be>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

  - Remove unneeded reference for "idt,slew-percent", as vendor specific
    properties having a standard unit suffix don't need a type,
  - Add missing "additionalProperties: false" for subnodes, to catch
    typos in properties,
  - Fix property names in example.

Fixes: 45c940184b501fc6 ("dt-bindings: clk: versaclock5: convert to yaml")
Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
Reviewed-by: Luca Ceresoli <luca@lucaceresoli.net>
Reviewed-by: Rob Herring <robh@kernel.org>
Acked-by: Stephen Boyd <sboyd@kernel.org>
---
This depends on "[PATCH dt-schema 0/2] dt-schema: Add percentage", which
is part of dt-schema v2021.2.1.

v4:
  - Add Reviewed-by, Acked-by,

v3:
  - Drop references for "idt,voltage-microvolt" and "idt,slew-percent",

v2:
  - Settle on "idt,voltage-microvolt", cfr. commit 4b003f5fcadfa2d0
    ('clk: vc5: Use "idt,voltage-microvolt" instead of
    "idt,voltage-microvolts"'),
  - Drop reference to clock.yaml, which is already applied
    unconditionally,
  - Drop removal of allOf around if condition, as it is unnecessary
    churn.
---
 .../devicetree/bindings/clock/idt,versaclock5.yaml       | 9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)

diff --git a/Documentation/devicetree/bindings/clock/idt,versaclock5.yaml b/Documentation/devicetree/bindings/clock/idt,versaclock5.yaml
index c268debe5b8d58cd..a7d00c552e3de161 100644
--- a/Documentation/devicetree/bindings/clock/idt,versaclock5.yaml
+++ b/Documentation/devicetree/bindings/clock/idt,versaclock5.yaml
@@ -84,9 +84,10 @@ patternProperties:
         enum: [ 1800000, 2500000, 3300000 ]
       idt,slew-percent:
         description: The Slew rate control for CMOS single-ended.
-        $ref: /schemas/types.yaml#/definitions/uint32
         enum: [ 80, 85, 90, 100 ]
 
+    additionalProperties: false
+
 required:
   - compatible
   - reg
@@ -141,13 +142,13 @@ examples:
             clock-names = "xin";
 
             OUT1 {
-                idt,drive-mode = <VC5_CMOSD>;
-                idt,voltage-microvolts = <1800000>;
+                idt,mode = <VC5_CMOSD>;
+                idt,voltage-microvolt = <1800000>;
                 idt,slew-percent = <80>;
             };
 
             OUT4 {
-                idt,drive-mode = <VC5_LVDS>;
+                idt,mode = <VC5_LVDS>;
             };
         };
     };
-- 
2.25.1

