Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id CAA0453773F
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 30 May 2022 10:51:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234382AbiE3IvO (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 30 May 2022 04:51:14 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37688 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234308AbiE3Iu5 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 30 May 2022 04:50:57 -0400
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net [217.70.183.195])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8B74D77F2C;
        Mon, 30 May 2022 01:50:47 -0700 (PDT)
Received: (Authenticated sender: clement.leger@bootlin.com)
        by mail.gandi.net (Postfix) with ESMTPSA id 82E7A60011;
        Mon, 30 May 2022 08:50:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
        t=1653900645;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=2SF3pUgAD6q5WeEoPLQiLM6/eJ4vsi9bKtGQ7nKVB1o=;
        b=Ic2vi8qe5pYp/N477hUUYd7v9LAqzLzt9ikvF+GhFGoIVU9B+goOkF6WyhMwugawlN4aTq
        boAcn50wBeqKJ18UojNuIC3uLPQtFCx55Um7Q2il/WEmtSVtxBhaxTvQI3cqHMAhAKZSAs
        nJINXWA6tjmaFZzkHm2I072LUhb5bHNZeCc+StH/wxjz3QPw2o2WW4GDK2XJszveAfOE7a
        X9HhOs9/HFvmo3YpimQggvexf5fhQ8F3ZgLeK9kFuq/VyD7RDmeQYqsyykUy+YseBJTAMN
        EUgJxMaAuM9YWrVaua+qHkjpdmOdGOvYVvZ2mFBcPMRfcaFBW7gxeeOplEDX8Q==
From:   =?UTF-8?q?Cl=C3=A9ment=20L=C3=A9ger?= <clement.leger@bootlin.com>
To:     Andrew Lunn <andrew@lunn.ch>,
        Vivien Didelot <vivien.didelot@gmail.com>,
        Florian Fainelli <f.fainelli@gmail.com>,
        Vladimir Oltean <olteanv@gmail.com>,
        "David S . Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>,
        Jakub Kicinski <kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Magnus Damm <magnus.damm@gmail.com>,
        Heiner Kallweit <hkallweit1@gmail.com>,
        Russell King <linux@armlinux.org.uk>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        Giuseppe Cavallaro <peppe.cavallaro@st.com>,
        Jose Abreu <joabreu@synopsys.com>
Cc:     =?UTF-8?q?Cl=C3=A9ment=20L=C3=A9ger?= <clement.leger@bootlin.com>,
        Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
        Herve Codina <herve.codina@bootlin.com>,
        =?UTF-8?q?Miqu=C3=A8l=20Raynal?= <miquel.raynal@bootlin.com>,
        Milan Stevanovic <milan.stevanovic@se.com>,
        Jimmy Lalande <jimmy.lalande@se.com>,
        Pascal Eberhard <pascal.eberhard@se.com>,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org, netdev@vger.kernel.org,
        Rob Herring <robh@kernel.org>
Subject: [PATCH net-next v6 06/16] dt-bindings: net: dsa: add bindings for Renesas RZ/N1 Advanced 5 port switch
Date:   Mon, 30 May 2022 10:49:07 +0200
Message-Id: <20220530084917.91130-7-clement.leger@bootlin.com>
X-Mailer: git-send-email 2.36.0
In-Reply-To: <20220530084917.91130-1-clement.leger@bootlin.com>
References: <20220530084917.91130-1-clement.leger@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,
        RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Add bindings for Renesas RZ/N1 Advanced 5 port switch. This switch is
present on Renesas RZ/N1 SoC and was probably provided by MoreThanIP.
This company does not exists anymore and has been bought by Synopsys.
Since this IP can't be find anymore in the Synospsy portfolio, lets use
Renesas as the vendor compatible for this IP.

Reviewed-by: Rob Herring <robh@kernel.org>
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
Signed-off-by: Clément Léger <clement.leger@bootlin.com>
---
 .../bindings/net/dsa/renesas,rzn1-a5psw.yaml  | 134 ++++++++++++++++++
 1 file changed, 134 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/net/dsa/renesas,rzn1-a5psw.yaml

diff --git a/Documentation/devicetree/bindings/net/dsa/renesas,rzn1-a5psw.yaml b/Documentation/devicetree/bindings/net/dsa/renesas,rzn1-a5psw.yaml
new file mode 100644
index 000000000000..103b1ef5af1b
--- /dev/null
+++ b/Documentation/devicetree/bindings/net/dsa/renesas,rzn1-a5psw.yaml
@@ -0,0 +1,134 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/net/dsa/renesas,rzn1-a5psw.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Renesas RZ/N1 Advanced 5 ports ethernet switch
+
+maintainers:
+  - Clément Léger <clement.leger@bootlin.com>
+
+description: |
+  The advanced 5 ports switch is present on the Renesas RZ/N1 SoC family and
+  handles 4 ports + 1 CPU management port.
+
+allOf:
+  - $ref: dsa.yaml#
+
+properties:
+  compatible:
+    items:
+      - enum:
+          - renesas,r9a06g032-a5psw
+      - const: renesas,rzn1-a5psw
+
+  reg:
+    maxItems: 1
+
+  power-domains:
+    maxItems: 1
+
+  mdio:
+    $ref: /schemas/net/mdio.yaml#
+    unevaluatedProperties: false
+
+  clocks:
+    items:
+      - description: AHB clock used for the switch register interface
+      - description: Switch system clock
+
+  clock-names:
+    items:
+      - const: hclk
+      - const: clk
+
+  ethernet-ports:
+    type: object
+    properties:
+      '#address-cells':
+        const: 1
+      '#size-cells':
+        const: 0
+
+    patternProperties:
+      "^(ethernet-)?port@[0-4]$":
+        type: object
+        description: Ethernet switch ports
+
+        properties:
+          pcs-handle:
+            description:
+              phandle pointing to a PCS sub-node compatible with
+              renesas,rzn1-miic.yaml#
+            $ref: /schemas/types.yaml#/definitions/phandle
+
+unevaluatedProperties: false
+
+required:
+  - compatible
+  - reg
+  - clocks
+  - clock-names
+  - power-domains
+
+examples:
+  - |
+    #include <dt-bindings/gpio/gpio.h>
+    #include <dt-bindings/clock/r9a06g032-sysctrl.h>
+
+    switch@44050000 {
+        compatible = "renesas,r9a06g032-a5psw", "renesas,rzn1-a5psw";
+        reg = <0x44050000 0x10000>;
+        clocks = <&sysctrl R9A06G032_HCLK_SWITCH>, <&sysctrl R9A06G032_CLK_SWITCH>;
+        clock-names = "hclk", "clk";
+        power-domains = <&sysctrl>;
+
+        dsa,member = <0 0>;
+
+        ethernet-ports {
+            #address-cells = <1>;
+            #size-cells = <0>;
+
+            port@0 {
+                reg = <0>;
+                label = "lan0";
+                phy-handle = <&switch0phy3>;
+                pcs-handle = <&mii_conv4>;
+            };
+
+            port@1 {
+                reg = <1>;
+                label = "lan1";
+                phy-handle = <&switch0phy1>;
+                pcs-handle = <&mii_conv3>;
+            };
+
+            port@4 {
+                reg = <4>;
+                ethernet = <&gmac2>;
+                label = "cpu";
+                fixed-link {
+                  speed = <1000>;
+                  full-duplex;
+                };
+            };
+        };
+
+        mdio {
+            #address-cells = <1>;
+            #size-cells = <0>;
+
+            reset-gpios = <&gpio0a 2 GPIO_ACTIVE_HIGH>;
+            reset-delay-us = <15>;
+            clock-frequency = <2500000>;
+
+            switch0phy1: ethernet-phy@1{
+                reg = <1>;
+            };
+
+            switch0phy3: ethernet-phy@3{
+                reg = <3>;
+            };
+        };
+    };
-- 
2.36.0

