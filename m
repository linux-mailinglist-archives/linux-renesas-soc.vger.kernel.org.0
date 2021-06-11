Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D4F6C3A41E2
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 11 Jun 2021 14:20:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231509AbhFKMWW (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 11 Jun 2021 08:22:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54076 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231193AbhFKMWV (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 11 Jun 2021 08:22:21 -0400
Received: from michel.telenet-ops.be (michel.telenet-ops.be [IPv6:2a02:1800:110:4::f00:18])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CFE73C0617AF
        for <linux-renesas-soc@vger.kernel.org>; Fri, 11 Jun 2021 05:20:23 -0700 (PDT)
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed20:2411:a261:8fe2:b47f])
        by michel.telenet-ops.be with bizsmtp
        id FoLL2500425eH3q06oLLgv; Fri, 11 Jun 2021 14:20:21 +0200
Received: from rox.of.borg ([192.168.97.57])
        by ramsan.of.borg with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
        (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1lrg95-00FfOh-Lm; Fri, 11 Jun 2021 14:20:19 +0200
Received: from geert by rox.of.borg with local (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1lrg94-00Cgtb-Tc; Fri, 11 Jun 2021 14:20:18 +0200
From:   Geert Uytterhoeven <geert+renesas@glider.be>
To:     Herbert Xu <herbert@gondor.apana.org.au>,
        "David S . Miller" <davem@davemloft.net>,
        Rob Herring <robh+dt@kernel.org>,
        Gilad Ben-Yossef <gilad@benyossef.com>
Cc:     linux-crypto@vger.kernel.org, devicetree@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH] dt-bindings: crypto: ccree: Convert to json-schema
Date:   Fri, 11 Jun 2021 14:20:17 +0200
Message-Id: <ab361a862755e281f5fef67b3f678d66ae201781.1623413974.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Convert the Arm TrustZone CryptoCell cryptographic engine Device Tree
binding documentation to json-schema.

Document missing properties.
Update the example to match reality.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
 .../bindings/crypto/arm,cryptocell.yaml       | 53 +++++++++++++++++++
 .../bindings/crypto/arm-cryptocell.txt        | 25 ---------
 2 files changed, 53 insertions(+), 25 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/crypto/arm,cryptocell.yaml
 delete mode 100644 Documentation/devicetree/bindings/crypto/arm-cryptocell.txt

diff --git a/Documentation/devicetree/bindings/crypto/arm,cryptocell.yaml b/Documentation/devicetree/bindings/crypto/arm,cryptocell.yaml
new file mode 100644
index 0000000000000000..9c97874a6dbd1db9
--- /dev/null
+++ b/Documentation/devicetree/bindings/crypto/arm,cryptocell.yaml
@@ -0,0 +1,53 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/crypto/arm,cryptocell.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Arm TrustZone CryptoCell cryptographic engine
+
+maintainers:
+  - Gilad Ben-Yossef <gilad@benyossef.com>
+
+properties:
+  compatible:
+    enum:
+      - arm,cryptocell-713-ree
+      - arm,cryptocell-703-ree
+      - arm,cryptocell-712-ree
+      - arm,cryptocell-710-ree
+      - arm,cryptocell-630p-ree
+
+  reg:
+    maxItems: 1
+
+  interrupts:
+    maxItems: 1
+
+  clocks:
+    maxItems: 1
+
+  power-domains:
+    maxItems: 1
+
+  resets:
+    maxItems: 1
+
+  dma-coherent: true
+
+required:
+  - compatible
+  - reg
+  - interrupts
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+
+    arm_cc712: crypto@80000000 {
+            compatible = "arm,cryptocell-712-ree";
+            reg = <0x80000000 0x10000>;
+            interrupts = <GIC_SPI 30 IRQ_TYPE_LEVEL_HIGH>;
+    };
diff --git a/Documentation/devicetree/bindings/crypto/arm-cryptocell.txt b/Documentation/devicetree/bindings/crypto/arm-cryptocell.txt
deleted file mode 100644
index 6130e6eb4af89135..0000000000000000
--- a/Documentation/devicetree/bindings/crypto/arm-cryptocell.txt
+++ /dev/null
@@ -1,25 +0,0 @@
-Arm TrustZone CryptoCell cryptographic engine
-
-Required properties:
-- compatible: Should be one of -
-   "arm,cryptocell-713-ree"
-   "arm,cryptocell-703-ree"
-   "arm,cryptocell-712-ree"
-   "arm,cryptocell-710-ree"
-   "arm,cryptocell-630p-ree"
-- reg: Base physical address of the engine and length of memory mapped region.
-- interrupts: Interrupt number for the device.
-
-Optional properties:
-- clocks: Reference to the crypto engine clock.
-- dma-coherent: Present if dma operations are coherent.
-
-Examples:
-
-       arm_cc712: crypto@80000000 {
-               compatible = "arm,cryptocell-712-ree";
-               interrupt-parent = <&intc>;
-               interrupts = < 0 30 4 >;
-               reg = < 0x80000000 0x10000 >;
-
-       };
-- 
2.25.1

