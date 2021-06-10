Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1A6F63A250C
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 10 Jun 2021 09:09:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230001AbhFJHLp (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 10 Jun 2021 03:11:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60792 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229788AbhFJHLp (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 10 Jun 2021 03:11:45 -0400
Received: from albert.telenet-ops.be (albert.telenet-ops.be [IPv6:2a02:1800:110:4::f00:1a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 230B8C061574
        for <linux-renesas-soc@vger.kernel.org>; Thu, 10 Jun 2021 00:09:48 -0700 (PDT)
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed20:a946:bccb:b1a1:3055])
        by albert.telenet-ops.be with bizsmtp
        id FK9j250030wnyou06K9jcq; Thu, 10 Jun 2021 09:09:44 +0200
Received: from rox.of.borg ([192.168.97.57])
        by ramsan.of.borg with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
        (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1lrEow-00FAQa-Le; Thu, 10 Jun 2021 09:09:42 +0200
Received: from geert by rox.of.borg with local (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1lrEow-00B8dc-5T; Thu, 10 Jun 2021 09:09:42 +0200
From:   Geert Uytterhoeven <geert+renesas@glider.be>
To:     Luca Ceresoli <luca@lucaceresoli.net>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Rob Herring <robh+dt@kernel.org>
Cc:     Adam Ford <aford173@gmail.com>, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Rob Herring <robh@kernel.org>
Subject: [PATCH v6] dt-bindings: clk: versaclock5: Miscellaneous fixes and improvements:
Date:   Thu, 10 Jun 2021 09:09:40 +0200
Message-Id: <46310530171886c6ccf4046518e07510274a506c.1623308843.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

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

v6:
  - Rebase on top of commit c17611592d9635c4 ("dt-bindings: More
    removals of type references on common properties"), which already
    removed unneeded references for "idt,xtal-load-femtofarads" and
    "idt,slew-percent",

v5:
  - Drop reference for "idt,xtal-load-femtofarads",

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
 .../devicetree/bindings/clock/idt,versaclock5.yaml        | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/Documentation/devicetree/bindings/clock/idt,versaclock5.yaml b/Documentation/devicetree/bindings/clock/idt,versaclock5.yaml
index 28675b0b80f1ba53..434212320c9aa7ab 100644
--- a/Documentation/devicetree/bindings/clock/idt,versaclock5.yaml
+++ b/Documentation/devicetree/bindings/clock/idt,versaclock5.yaml
@@ -85,6 +85,8 @@ patternProperties:
         description: The Slew rate control for CMOS single-ended.
         enum: [ 80, 85, 90, 100 ]
 
+    additionalProperties: false
+
 required:
   - compatible
   - reg
@@ -139,13 +141,13 @@ examples:
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

