Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6327F514766
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 29 Apr 2022 12:50:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1358050AbiD2Kwa (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 29 Apr 2022 06:52:30 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47580 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1358073AbiD2KvL (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 29 Apr 2022 06:51:11 -0400
Received: from relay11.mail.gandi.net (relay11.mail.gandi.net [217.70.178.231])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E0A6DC8BEB;
        Fri, 29 Apr 2022 03:46:09 -0700 (PDT)
Received: (Authenticated sender: miquel.raynal@bootlin.com)
        by mail.gandi.net (Postfix) with ESMTPSA id 42C6B10000F;
        Fri, 29 Apr 2022 10:46:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
        t=1651229168;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=8ahdxlylHUe3mADgzeD98ByHKZe3nsmtka5ti0feGmk=;
        b=A8ymcAf4cZE365VPUPzKtLgpGVYVP2s1wHBf1xHUQYmdXcBnGREKeNdd5/ynePp2rUJc8b
        kkIDxUDSBdcR6cGuQEZ89CakNYkJkMG4CPVP0k2Jw/LtwHiBTsJixpb3n6qOpgJOfcWod7
        ejs5tqS1hiN7s+WyNDTOdYV8BIzWm3vw48iNeBc/5x9Kmuof+TnO9OE3N2d3HRLqQ//w84
        GWbIJKvpzFsSTmnmVlmTOyjgkbu2oUpw4hGj4JY/x6NxEk3OUNFvW0hRnsrwRI4hyYah3f
        INzueq2Wly314RRFgzZ0IzvNtZSF0JCSyh04MaBW7mYhmkYBMXwt6W/z1w1aHA==
From:   Miquel Raynal <miquel.raynal@bootlin.com>
To:     Alessandro Zummo <a.zummo@towertech.it>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Magnus Damm <magnus.damm@gmail.com>
Cc:     Miquel Raynal <miquel.raynal@bootlin.com>,
        linux-rtc@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        devicetree@vger.kernel.org,
        Gareth Williams <gareth.williams.jx@renesas.com>,
        Milan Stevanovic <milan.stevanovic@se.com>,
        Jimmy Lalande <jimmy.lalande@se.com>,
        Pascal Eberhard <pascal.eberhard@se.com>,
        Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
        Herve Codina <herve.codina@bootlin.com>,
        Clement Leger <clement.leger@bootlin.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH v3 1/6] dt-bindings: rtc: rzn1: Describe the RZN1 RTC
Date:   Fri, 29 Apr 2022 12:45:57 +0200
Message-Id: <20220429104602.368055-2-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20220429104602.368055-1-miquel.raynal@bootlin.com>
References: <20220429104602.368055-1-miquel.raynal@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,SPF_HELO_NONE,
        SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Add new binding file for this RTC.

Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
 .../bindings/rtc/renesas,rzn1-rtc.yaml        | 70 +++++++++++++++++++
 1 file changed, 70 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/rtc/renesas,rzn1-rtc.yaml

diff --git a/Documentation/devicetree/bindings/rtc/renesas,rzn1-rtc.yaml b/Documentation/devicetree/bindings/rtc/renesas,rzn1-rtc.yaml
new file mode 100644
index 000000000000..2d4741f51663
--- /dev/null
+++ b/Documentation/devicetree/bindings/rtc/renesas,rzn1-rtc.yaml
@@ -0,0 +1,70 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/rtc/renesas,rzn1-rtc.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Renesas RZ/N1 SoCs Real-Time Clock DT bindings
+
+maintainers:
+  - Miquel Raynal <miquel.raynal@bootlin.com>
+
+allOf:
+  - $ref: rtc.yaml#
+
+properties:
+  compatible:
+    items:
+      - enum:
+          - renesas,r9a06g032-rtc
+      - const: renesas,rzn1-rtc
+
+  reg:
+    maxItems: 1
+
+  interrupts:
+    minItems: 3
+    maxItems: 3
+
+  interrupt-names:
+    items:
+      - const: alarm
+      - const: timer
+      - const: pps
+
+  clocks:
+    maxItems: 1
+
+  clock-names:
+    const: hclk
+
+  power-domains:
+    maxItems: 1
+
+required:
+  - compatible
+  - reg
+  - interrupts
+  - interrupt-names
+  - clocks
+  - clock-names
+  - power-domains
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+    #include <dt-bindings/clock/r9a06g032-sysctrl.h>
+    rtc@40006000 {
+       compatible = "renesas,r9a06g032-rtc", "renesas,rzn1-rtc";
+       reg = <0x40006000 0x1000>;
+       interrupts = <GIC_SPI 66 IRQ_TYPE_EDGE_RISING>,
+                    <GIC_SPI 67 IRQ_TYPE_EDGE_RISING>,
+                    <GIC_SPI 68 IRQ_TYPE_EDGE_RISING>;
+       interrupt-names = "alarm", "timer", "pps";
+       clocks = <&sysctrl R9A06G032_HCLK_RTC>;
+       clock-names = "hclk";
+       power-domains = <&sysctrl>;
+       start-year = <2000>;
+     };
-- 
2.27.0

