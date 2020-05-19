Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 202FB1D9188
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 19 May 2020 10:00:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728403AbgESH7E (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 19 May 2020 03:59:04 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52202 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728357AbgESH7E (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 19 May 2020 03:59:04 -0400
Received: from baptiste.telenet-ops.be (baptiste.telenet-ops.be [IPv6:2a02:1800:120:4::f00:13])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 99217C05BD09
        for <linux-renesas-soc@vger.kernel.org>; Tue, 19 May 2020 00:59:03 -0700 (PDT)
Received: from ramsan ([IPv6:2a02:1810:ac12:ed60:918e:b928:22c1:d715])
        by baptiste.telenet-ops.be with bizsmtp
        id gXyz2200Q4CPMDc01XyzuV; Tue, 19 May 2020 09:59:01 +0200
Received: from rox.of.borg ([192.168.97.57])
        by ramsan with esmtp (Exim 4.90_1)
        (envelope-from <geert@linux-m68k.org>)
        id 1jax9P-0000ML-Fx; Tue, 19 May 2020 09:58:59 +0200
Received: from geert by rox.of.borg with local (Exim 4.90_1)
        (envelope-from <geert@linux-m68k.org>)
        id 1jax9P-0007GE-EB; Tue, 19 May 2020 09:58:59 +0200
From:   Geert Uytterhoeven <geert+renesas@glider.be>
To:     Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Mark Brown <broonie@kernel.org>,
        Rob Herring <robh+dt@kernel.org>
Cc:     alsa-devel@alsa-project.org, devicetree@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH] ASoC: fsi: Add missing properties to DT bindings
Date:   Tue, 19 May 2020 09:58:58 +0200
Message-Id: <20200519075858.27869-1-geert+renesas@glider.be>
X-Mailer: git-send-email 2.17.1
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

make dtbs_check:

    arch/arm/boot/dts/r8a7740-armadillo800eva.dt.yaml: sound@fe1f0000: '#sound-dai-cells', 'clocks', 'power-domains' do not match any of the regexes: 'pinctrl-[0-9]+'

Fix this by documenting the missing properties.
Update the example to match reality.
While at it, improve the document title, and comment the various
compatible values with the corresponding SoC names.

Fixes: 7f464532b05dadc8 ("dt-bindings: Add missing 'additionalProperties: false'")
Fixes: 2f52475bac7e1572 ("ASoC: fsi: switch to yaml base Documentation")
Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
For a clean "make dtbs_check", this depends on "ARM: dts: sh73a0: Add
missing clocks to sound node"
(http://lore.kernel.org/r/20200519075525.24742-1-geert+renesas@glider.be).
---
 .../bindings/sound/renesas,fsi.yaml           | 29 +++++++++++++++----
 1 file changed, 23 insertions(+), 6 deletions(-)

diff --git a/Documentation/devicetree/bindings/sound/renesas,fsi.yaml b/Documentation/devicetree/bindings/sound/renesas,fsi.yaml
index 91cf4176abd5f78f..8a4406be387a6b61 100644
--- a/Documentation/devicetree/bindings/sound/renesas,fsi.yaml
+++ b/Documentation/devicetree/bindings/sound/renesas,fsi.yaml
@@ -4,7 +4,7 @@
 $id: http://devicetree.org/schemas/sound/renesas,fsi.yaml#
 $schema: http://devicetree.org/meta-schemas/core.yaml#
 
-title: Renesas FSI Sound Driver Device Tree Bindings
+title: Renesas FIFO-buffered Serial Interface (FSI)
 
 maintainers:
   - Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
@@ -18,8 +18,8 @@ properties:
       # for FSI2 SoC
       - items:
           - enum:
-              - renesas,fsi2-sh73a0
-              - renesas,fsi2-r8a7740
+              - renesas,fsi2-sh73a0  # SH-Mobile AG5
+              - renesas,fsi2-r8a7740 # R-Mobile A1
           - enum:
               - renesas,sh_fsi2
       # for Generic
@@ -34,6 +34,15 @@ properties:
   interrupts:
     maxItems: 1
 
+  clocks:
+    maxItems: 1
+
+  power-domains:
+    maxItems: 1
+
+  '#sound-dai-cells':
+    const: 1
+
   fsia,spdif-connection:
     $ref: /schemas/types.yaml#/definitions/flag
     description: FSI is connected by S/PDIF
@@ -62,16 +71,24 @@ required:
   - compatible
   - reg
   - interrupts
+  - clocks
+  - power-domains
+  - '#sound-dai-cells'
 
 additionalProperties: false
 
 examples:
   - |
-    sh_fsi2: sound@ec230000 {
+    #include <dt-bindings/clock/r8a7740-clock.h>
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+    sh_fsi2: sound@fe1f0000 {
             compatible = "renesas,fsi2-r8a7740", "renesas,sh_fsi2";
-            reg = <0xec230000 0x400>;
-            interrupts = <0 146 0x4>;
+            reg = <0xfe1f0000 0x400>;
+            interrupts = <GIC_SPI 9 0x4>;
+            clocks = <&mstp3_clks R8A7740_CLK_FSI>;
+            power-domains = <&pd_a4mp>;
 
+            #sound-dai-cells = <1>;
             fsia,spdif-connection;
             fsia,stream-mode-support;
             fsia,use-internal-clock;
-- 
2.17.1

