Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A3B0D5EA929
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 26 Sep 2022 16:54:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235396AbiIZOyv (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 26 Sep 2022 10:54:51 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44130 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235211AbiIZOyb (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 26 Sep 2022 10:54:31 -0400
Received: from relmlie6.idc.renesas.com (relmlor2.renesas.com [210.160.252.172])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id BCACA93790;
        Mon, 26 Sep 2022 06:21:36 -0700 (PDT)
X-IronPort-AV: E=Sophos;i="5.93,346,1654527600"; 
   d="scan'208";a="136203501"
Received: from unknown (HELO relmlir5.idc.renesas.com) ([10.200.68.151])
  by relmlie6.idc.renesas.com with ESMTP; 26 Sep 2022 22:21:35 +0900
Received: from localhost.localdomain (unknown [10.226.92.133])
        by relmlir5.idc.renesas.com (Postfix) with ESMTP id C0A514005B43;
        Mon, 26 Sep 2022 22:21:32 +0900 (JST)
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
Subject: [PATCH RFC 4/8] dt-bindings: mfd: rzg2l-mtu3: Document RZ/G2UL MTU3 counter
Date:   Mon, 26 Sep 2022 14:21:10 +0100
Message-Id: <20220926132114.60396-5-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220926132114.60396-1-biju.das.jz@bp.renesas.com>
References: <20220926132114.60396-1-biju.das.jz@bp.renesas.com>
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

