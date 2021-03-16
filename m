Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B647633D962
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 16 Mar 2021 17:27:59 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235308AbhCPQ12 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 16 Mar 2021 12:27:28 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49044 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236672AbhCPQ0u (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 16 Mar 2021 12:26:50 -0400
Received: from laurent.telenet-ops.be (laurent.telenet-ops.be [IPv6:2a02:1800:110:4::f00:19])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8B025C06174A
        for <linux-renesas-soc@vger.kernel.org>; Tue, 16 Mar 2021 09:26:49 -0700 (PDT)
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed20:b1e0:9434:c5b6:aecd])
        by laurent.telenet-ops.be with bizsmtp
        id h4So240010UTkXy014SohF; Tue, 16 Mar 2021 17:26:48 +0100
Received: from rox.of.borg ([192.168.97.57])
        by ramsan.of.borg with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
        (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1lMCWt-008ASu-Gk; Tue, 16 Mar 2021 17:26:47 +0100
Received: from geert by rox.of.borg with local (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1lMCWs-00AFW8-Kw; Tue, 16 Mar 2021 17:26:46 +0100
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
Subject: [PATCH v5] dt-bindings: clk: versaclock5: Miscellaneous fixes and improvements:
Date:   Tue, 16 Mar 2021 17:26:43 +0100
Message-Id: <20210316162643.2442885-1-geert+renesas@glider.be>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

  - Remove unneeded references for "idt,xtal-load-femtofarads" and
    "idt,slew-percent", as vendor specific properties having a standard
    unit suffix don't need a type,
  - Add missing "additionalProperties: false" for subnodes, to catch
    typos in properties,
  - Fix property names in example.

Fixes: 45c940184b501fc6 ("dt-bindings: clk: versaclock5: convert to yaml")
Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
Reviewed-by: Luca Ceresoli <luca@lucaceresoli.net>
Reviewed-by: Rob Herring <robh@kernel.org>
Acked-by: Stephen Boyd <sboyd@kernel.org>
---
This depends on dt-schema v2021.2.1.

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

squash! dt-bindings: clk: versaclock5: Miscellaneous fixes and improvements:

v5:
  - Drop reference for "idt,xtal-load-femtofarads",
---
 .../devicetree/bindings/clock/idt,versaclock5.yaml     | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/Documentation/devicetree/bindings/clock/idt,versaclock5.yaml b/Documentation/devicetree/bindings/clock/idt,versaclock5.yaml
index c268debe5b8d58cd..434212320c9aa7ab 100644
--- a/Documentation/devicetree/bindings/clock/idt,versaclock5.yaml
+++ b/Documentation/devicetree/bindings/clock/idt,versaclock5.yaml
@@ -60,7 +60,6 @@ properties:
     maxItems: 2
 
   idt,xtal-load-femtofarads:
-    $ref: /schemas/types.yaml#/definitions/uint32
     minimum: 9000
     maximum: 22760
     description: Optional load capacitor for XTAL1 and XTAL2
@@ -84,9 +83,10 @@ patternProperties:
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
@@ -141,13 +141,13 @@ examples:
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

