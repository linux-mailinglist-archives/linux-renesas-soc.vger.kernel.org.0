Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B38F55EF37B
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 29 Sep 2022 12:31:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235442AbiI2KbB (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 29 Sep 2022 06:31:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53966 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234950AbiI2KbA (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 29 Sep 2022 06:31:00 -0400
Received: from relmlie5.idc.renesas.com (relmlor1.renesas.com [210.160.252.171])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 51317124C3D;
        Thu, 29 Sep 2022 03:30:58 -0700 (PDT)
X-IronPort-AV: E=Sophos;i="5.93,354,1654527600"; 
   d="scan'208";a="134378870"
Received: from unknown (HELO relmlir5.idc.renesas.com) ([10.200.68.151])
  by relmlie5.idc.renesas.com with ESMTP; 29 Sep 2022 19:30:57 +0900
Received: from localhost.localdomain (unknown [10.226.92.32])
        by relmlir5.idc.renesas.com (Postfix) with ESMTP id AB12D400F7A2;
        Thu, 29 Sep 2022 19:30:54 +0900 (JST)
From:   Biju Das <biju.das.jz@bp.renesas.com>
To:     Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc:     Biju Das <biju.das.jz@bp.renesas.com>, Lee Jones <lee@kernel.org>,
        devicetree@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Biju Das <biju.das@bp.renesas.com>,
        Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        linux-renesas-soc@vger.kernel.org
Subject: [PATCH RFC 2/7] dt-bindings: mfd: rzg2l-mtu3: Document RZ/G2L MTU3 counter
Date:   Thu, 29 Sep 2022 11:30:38 +0100
Message-Id: <20220929103043.1228235-3-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220929103043.1228235-1-biju.das.jz@bp.renesas.com>
References: <20220929103043.1228235-1-biju.das.jz@bp.renesas.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,SPF_HELO_NONE,
        SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Document 16-bit and 32-bit phase counting mode support on
RZ/G2L MTU3 IP.

Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
 * Updated commit header.
---
 .../bindings/mfd/renesas,rzg2l-mtu3.yaml      | 35 +++++++++++++++++++
 1 file changed, 35 insertions(+)

diff --git a/Documentation/devicetree/bindings/mfd/renesas,rzg2l-mtu3.yaml b/Documentation/devicetree/bindings/mfd/renesas,rzg2l-mtu3.yaml
index c1fae8e8d9f9..c4bcf28623d6 100644
--- a/Documentation/devicetree/bindings/mfd/renesas,rzg2l-mtu3.yaml
+++ b/Documentation/devicetree/bindings/mfd/renesas,rzg2l-mtu3.yaml
@@ -192,6 +192,37 @@ properties:
   "#size-cells":
     const: 0
 
+patternProperties:
+  "^counter@[1-2]+$":
+    type: object
+
+    properties:
+      compatible:
+        const: renesas,rzg2l-mtu3-counter
+
+      reg:
+        description: Identify counter channels.
+        items:
+          enum: [ 1, 2 ]
+
+      renesas,32bit-phase-counting:
+        type: boolean
+        description: Enable 32-bit phase counting mode.
+
+      renesas,ext-input-phase-clock-select:
+        $ref: /schemas/types.yaml#/definitions/uint32
+        enum: [ 0, 1 ]
+        default: 1
+        description: |
+          Selects the external clock pin for phase counting mode.
+            <0> : MTCLKA and MTCLKB are selected for the external phase clock.
+            <1> : MTCLKC and MTCLKD are selected for the external phase clock
+                  (default)
+
+    required:
+      - compatible
+      - reg
+
 required:
   - compatible
   - reg
@@ -270,6 +301,10 @@ examples:
       clocks = <&cpg CPG_MOD R9A07G044_MTU_X_MCK_MTU3>;
       power-domains = <&cpg>;
       resets = <&cpg R9A07G044_MTU_X_PRESET_MTU3>;
+      counter@1 {
+        compatible = "renesas,rzg2l-mtu3-counter";
+        reg = <1>;
+      };
     };
 
 ...
-- 
2.25.1

