Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 739706B90B0
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 14 Mar 2023 11:54:06 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229755AbjCNKyD (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 14 Mar 2023 06:54:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36252 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229475AbjCNKx4 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 14 Mar 2023 06:53:56 -0400
Received: from laurent.telenet-ops.be (laurent.telenet-ops.be [IPv6:2a02:1800:110:4::f00:19])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 35C67584BC
        for <linux-renesas-soc@vger.kernel.org>; Tue, 14 Mar 2023 03:53:25 -0700 (PDT)
Received: from ramsan.of.borg ([84.195.187.55])
        by laurent.telenet-ops.be with bizsmtp
        id YAtN2900G1C8whw01AtNQ8; Tue, 14 Mar 2023 11:53:23 +0100
Received: from rox.of.borg ([192.168.97.57])
        by ramsan.of.borg with esmtp (Exim 4.95)
        (envelope-from <geert@linux-m68k.org>)
        id 1pc2Cd-00C9kO-OS;
        Tue, 14 Mar 2023 11:49:01 +0100
Received: from geert by rox.of.borg with local (Exim 4.95)
        (envelope-from <geert@linux-m68k.org>)
        id 1pc2DF-00AoST-4O;
        Tue, 14 Mar 2023 11:49:01 +0100
From:   Geert Uytterhoeven <geert+renesas@glider.be>
To:     Liam Girdwood <lgirdwood@gmail.com>,
        Mark Brown <broonie@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc:     alsa-devel@alsa-project.org, devicetree@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH] ASoC: dt-bindings: renesas: rsnd: Update example
Date:   Tue, 14 Mar 2023 11:48:59 +0100
Message-Id: <ba4ec999dc152ea1f113253e497c093b8789d414.1678790879.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.3 required=5.0 tests=BAYES_00,
        HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_LOW,SPF_HELO_NONE,SPF_NONE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Miscellaneous updates to make the example match reality:
  - Correct SSI resource region size,
  - Complete half-conversion to new-style CPG/MSSR bindings,
  - Add missing power-domains, resets, and reset-names properties,
  - Use interrupt binding definitions instead of hardcoded numbers,
  - Correct interrupt flags,
  - Drop double blank line.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
 .../bindings/sound/renesas,rsnd.yaml          | 51 ++++++++++++-------
 1 file changed, 32 insertions(+), 19 deletions(-)

diff --git a/Documentation/devicetree/bindings/sound/renesas,rsnd.yaml b/Documentation/devicetree/bindings/sound/renesas,rsnd.yaml
index 55e5213b90a17d1d..676dfe7a7f1766cd 100644
--- a/Documentation/devicetree/bindings/sound/renesas,rsnd.yaml
+++ b/Documentation/devicetree/bindings/sound/renesas,rsnd.yaml
@@ -372,30 +372,33 @@ unevaluatedProperties: false
 
 examples:
   - |
+    #include <dt-bindings/clock/r8a7790-cpg-mssr.h>
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+    #include <dt-bindings/power/r8a7790-sysc.h>
     rcar_sound: sound@ec500000 {
         #sound-dai-cells = <1>;
         compatible = "renesas,rcar_sound-r8a7790", "renesas,rcar_sound-gen2";
         reg = <0xec500000 0x1000>, /* SCU  */
               <0xec5a0000 0x100>,  /* ADG  */
               <0xec540000 0x1000>, /* SSIU */
-              <0xec541000 0x1280>, /* SSI  */
+              <0xec541000 0x280>,  /* SSI  */
               <0xec740000 0x200>;  /* Audio DMAC peri peri*/
         reg-names = "scu", "adg", "ssiu", "ssi", "audmapp";
 
-        clocks = <&mstp10_clks 1005>,                      /* SSI-ALL    */
-                 <&mstp10_clks 1006>, <&mstp10_clks 1007>, /* SSI9, SSI8 */
-                 <&mstp10_clks 1008>, <&mstp10_clks 1009>, /* SSI7, SSI6 */
-                 <&mstp10_clks 1010>, <&mstp10_clks 1011>, /* SSI5, SSI4 */
-                 <&mstp10_clks 1012>, <&mstp10_clks 1013>, /* SSI3, SSI2 */
-                 <&mstp10_clks 1014>, <&mstp10_clks 1015>, /* SSI1, SSI0 */
-                 <&mstp10_clks 1022>, <&mstp10_clks 1023>, /* SRC9, SRC8 */
-                 <&mstp10_clks 1024>, <&mstp10_clks 1025>, /* SRC7, SRC6 */
-                 <&mstp10_clks 1026>, <&mstp10_clks 1027>, /* SRC5, SRC4 */
-                 <&mstp10_clks 1028>, <&mstp10_clks 1029>, /* SRC3, SRC2 */
-                 <&mstp10_clks 1030>, <&mstp10_clks 1031>, /* SRC1, SRC0 */
-                 <&mstp10_clks 1020>, <&mstp10_clks 1021>, /* MIX1, MIX0 */
-                 <&mstp10_clks 1020>, <&mstp10_clks 1021>, /* CTU1, CTU0 */
-                 <&mstp10_clks 1019>, <&mstp10_clks 1018>, /* DVC0, DVC1 */
+        clocks = <&cpg CPG_MOD 1005>,                      /* SSI-ALL    */
+                 <&cpg CPG_MOD 1006>, <&cpg CPG_MOD 1007>, /* SSI9, SSI8 */
+                 <&cpg CPG_MOD 1008>, <&cpg CPG_MOD 1009>, /* SSI7, SSI6 */
+                 <&cpg CPG_MOD 1010>, <&cpg CPG_MOD 1011>, /* SSI5, SSI4 */
+                 <&cpg CPG_MOD 1012>, <&cpg CPG_MOD 1013>, /* SSI3, SSI2 */
+                 <&cpg CPG_MOD 1014>, <&cpg CPG_MOD 1015>, /* SSI1, SSI0 */
+                 <&cpg CPG_MOD 1022>, <&cpg CPG_MOD 1023>, /* SRC9, SRC8 */
+                 <&cpg CPG_MOD 1024>, <&cpg CPG_MOD 1025>, /* SRC7, SRC6 */
+                 <&cpg CPG_MOD 1026>, <&cpg CPG_MOD 1027>, /* SRC5, SRC4 */
+                 <&cpg CPG_MOD 1028>, <&cpg CPG_MOD 1029>, /* SRC3, SRC2 */
+                 <&cpg CPG_MOD 1030>, <&cpg CPG_MOD 1031>, /* SRC1, SRC0 */
+                 <&cpg CPG_MOD 1020>, <&cpg CPG_MOD 1021>, /* MIX1, MIX0 */
+                 <&cpg CPG_MOD 1020>, <&cpg CPG_MOD 1021>, /* CTU1, CTU0 */
+                 <&cpg CPG_MOD 1019>, <&cpg CPG_MOD 1018>, /* DVC0, DVC1 */
                  <&audio_clk_a>, <&audio_clk_b>,           /* CLKA, CLKB */
                  <&audio_clk_c>, <&audio_clk_i>;           /* CLKC, CLKI */
 
@@ -416,6 +419,17 @@ examples:
                       "clk_a", "clk_b",
                       "clk_c", "clk_i";
 
+        power-domains = <&sysc R8A7790_PD_ALWAYS_ON>;
+
+        resets = <&cpg 1005>,
+                 <&cpg 1006>, <&cpg 1007>, <&cpg 1008>, <&cpg 1009>,
+                 <&cpg 1010>, <&cpg 1011>, <&cpg 1012>, <&cpg 1013>,
+                 <&cpg 1014>, <&cpg 1015>;
+        reset-names = "ssi-all",
+                      "ssi.9", "ssi.8", "ssi.7", "ssi.6",
+                      "ssi.5", "ssi.4", "ssi.3", "ssi.2",
+                      "ssi.1", "ssi.0";
+
         rcar_sound,dvc {
                dvc0: dvc-0 {
                     dmas = <&audma0 0xbc>;
@@ -448,7 +462,7 @@ examples:
                 status = "disabled";
             };
             src1: src-1 {
-                interrupts = <0 353 0>;
+                interrupts = <GIC_SPI 353 IRQ_TYPE_LEVEL_HIGH>;
                 dmas = <&audma0 0x87>, <&audma1 0x9c>;
                 dma-names = "rx", "tx";
             };
@@ -469,12 +483,12 @@ examples:
 
         rcar_sound,ssi {
             ssi0: ssi-0 {
-                interrupts = <0 370 1>;
+                interrupts = <GIC_SPI 370 IRQ_TYPE_LEVEL_HIGH>;
                 dmas = <&audma0 0x01>, <&audma1 0x02>;
                 dma-names = "rx", "tx";
             };
             ssi1: ssi-1 {
-                interrupts = <0 371 1>;
+                interrupts = <GIC_SPI 371 IRQ_TYPE_LEVEL_HIGH>;
                 dmas = <&audma0 0x03>, <&audma1 0x04>;
                 dma-names = "rx", "tx";
             };
@@ -516,7 +530,6 @@ examples:
         };
     };
 
-
     /* assume audio-graph */
     codec {
         port {
-- 
2.34.1

