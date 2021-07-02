Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E90BF3BA1A9
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  2 Jul 2021 15:50:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232839AbhGBNwx (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 2 Jul 2021 09:52:53 -0400
Received: from relmlor1.renesas.com ([210.160.252.171]:22277 "EHLO
        relmlie5.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S232563AbhGBNwx (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 2 Jul 2021 09:52:53 -0400
X-IronPort-AV: E=Sophos;i="5.83,317,1616425200"; 
   d="scan'208";a="86448341"
Received: from unknown (HELO relmlir5.idc.renesas.com) ([10.200.68.151])
  by relmlie5.idc.renesas.com with ESMTP; 02 Jul 2021 22:50:19 +0900
Received: from localhost.localdomain (unknown [10.226.92.6])
        by relmlir5.idc.renesas.com (Postfix) with ESMTP id B989B4006189;
        Fri,  2 Jul 2021 22:50:16 +0900 (JST)
From:   Biju Das <biju.das.jz@bp.renesas.com>
To:     Rob Herring <robh+dt@kernel.org>
Cc:     Biju Das <biju.das.jz@bp.renesas.com>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Mark Brown <broonie@kernel.org>,
        Chris Brandt <chris.brandt@renesas.com>,
        Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
        alsa-devel@alsa-project.org, devicetree@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Biju Das <biju.das@bp.renesas.com>,
        Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        linux-renesas-soc@vger.kernel.org
Subject: [PATCH 1/9] ASoC: dt-bindings: Document RZ/G2L bindings
Date:   Fri,  2 Jul 2021 14:50:02 +0100
Message-Id: <20210702135010.5937-2-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210702135010.5937-1-biju.das.jz@bp.renesas.com>
References: <20210702135010.5937-1-biju.das.jz@bp.renesas.com>
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Document RZ/G2L ASoC serial sound interface bindings.

Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
Reviewed-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
---
Note:-  This patch has dependency on #include <dt-bindings/clock/r9a07g044-cpg.h> file which will be in 
next 5.14-rc1 release
---
 .../bindings/sound/renesas,rz-ssi.yaml        | 85 +++++++++++++++++++
 1 file changed, 85 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/sound/renesas,rz-ssi.yaml

diff --git a/Documentation/devicetree/bindings/sound/renesas,rz-ssi.yaml b/Documentation/devicetree/bindings/sound/renesas,rz-ssi.yaml
new file mode 100644
index 000000000000..891f381ee5b8
--- /dev/null
+++ b/Documentation/devicetree/bindings/sound/renesas,rz-ssi.yaml
@@ -0,0 +1,85 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/sound/renesas,rz-ssi.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Renesas RZ/G2L ASoC Sound Serial Interface (SSIF-2)
+
+maintainers:
+  - Biju Das <biju.das.jz@bp.renesas.com>
+
+properties:
+  compatible:
+    items:
+      - enum:
+          - renesas,r9a07g044-ssi  # RZ/G2{L,LC}
+      - const: renesas,rz-ssi
+
+  reg:
+    maxItems: 1
+
+  interrupts:
+    maxItems: 4
+
+  interrupt-names:
+    items:
+      - const: int_req
+      - const: dma_rx
+      - const: dma_tx
+      - const: dma_rt
+
+  clocks:
+    maxItems: 4
+
+  clock-names:
+    items:
+      - const: ssi
+      - const: ssi_sfr
+      - const: audio_clk1
+      - const: audio_clk2
+
+  power-domains:
+    maxItems: 1
+
+  resets:
+    maxItems: 1
+
+  '#sound-dai-cells':
+    const: 0
+
+required:
+  - compatible
+  - reg
+  - interrupts
+  - interrupt-names
+  - clocks
+  - clock-names
+  - resets
+  - '#sound-dai-cells'
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+    #include <dt-bindings/clock/r9a07g044-cpg.h>
+
+    ssi0: ssi@10049c00 {
+        compatible = "renesas,r9a07g044-ssi",
+                     "renesas,rz-ssi";
+            reg = <0x10049c00 0x400>;
+            interrupts = <GIC_SPI 326 IRQ_TYPE_LEVEL_HIGH>,
+                         <GIC_SPI 327 IRQ_TYPE_EDGE_RISING>,
+                         <GIC_SPI 328 IRQ_TYPE_EDGE_RISING>,
+                         <GIC_SPI 329 IRQ_TYPE_EDGE_RISING>;
+            interrupt-names = "int_req", "dma_rx", "dma_tx", "dma_rt";
+            clocks = <&cpg CPG_MOD R9A07G044_SSI0_PCLK2>,
+                     <&cpg CPG_MOD R9A07G044_SSI0_PCLK_SFR>,
+                     <&audio_clk1>,
+                     <&audio_clk2>;
+            clock-names = "ssi", "ssi_sfr", "audio_clk1", "audio_clk2";
+            power-domains = <&cpg>;
+            resets = <&cpg R9A07G044_SSI0_RST_M2_REG>;
+            #sound-dai-cells = <0>;
+    };
-- 
2.17.1

