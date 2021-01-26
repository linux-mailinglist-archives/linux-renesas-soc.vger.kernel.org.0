Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4506E30581D
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 27 Jan 2021 11:19:52 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S314218AbhAZXDr (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 26 Jan 2021 18:03:47 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50222 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730292AbhAZRFX (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 26 Jan 2021 12:05:23 -0500
Received: from baptiste.telenet-ops.be (baptiste.telenet-ops.be [IPv6:2a02:1800:120:4::f00:13])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1A779C0613D6
        for <linux-renesas-soc@vger.kernel.org>; Tue, 26 Jan 2021 08:40:01 -0800 (PST)
Received: from ramsan.of.borg ([84.195.186.194])
        by baptiste.telenet-ops.be with bizsmtp
        id MUg02400J4C55Sk01Ug02m; Tue, 26 Jan 2021 17:40:00 +0100
Received: from rox.of.borg ([192.168.97.57])
        by ramsan.of.borg with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
        (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1l4RNm-000wgo-8E; Tue, 26 Jan 2021 17:39:58 +0100
Received: from geert by rox.of.borg with local (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1l4RNl-00876a-NC; Tue, 26 Jan 2021 17:39:57 +0100
From:   Geert Uytterhoeven <geert+renesas@glider.be>
To:     Luca Ceresoli <luca@lucaceresoli.net>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Adam Ford <aford173@gmail.com>
Cc:     linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH v3] dt-bindings: clk: versaclock5: Miscellaneous fixes and improvements:
Date:   Tue, 26 Jan 2021 17:39:55 +0100
Message-Id: <20210126163955.1933893-1-geert+renesas@glider.be>
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
---
This depends on "[PATCH dt-schema 0/2] dt-schema: Add percentage"
https://lore.kernel.org/r/20210126162756.1932692-1-geert+renesas@glider.be

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
index 2ac1131fd9222a86..116ecce758bc22cf 100644
--- a/Documentation/devicetree/bindings/clock/idt,versaclock5.yaml
+++ b/Documentation/devicetree/bindings/clock/idt,versaclock5.yaml
@@ -78,9 +78,10 @@ patternProperties:
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
@@ -135,13 +136,13 @@ examples:
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

