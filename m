Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9D3047F1828
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 20 Nov 2023 17:08:32 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229738AbjKTQId (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 20 Nov 2023 11:08:33 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49504 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229696AbjKTQId (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 20 Nov 2023 11:08:33 -0500
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com [IPv6:2a00:1450:4864:20::335])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D42CDF4
        for <linux-renesas-soc@vger.kernel.org>; Mon, 20 Nov 2023 08:08:28 -0800 (PST)
Received: by mail-wm1-x335.google.com with SMTP id 5b1f17b1804b1-40b23aeb9d9so7604025e9.3
        for <linux-renesas-soc@vger.kernel.org>; Mon, 20 Nov 2023 08:08:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ragnatech-se.20230601.gappssmtp.com; s=20230601; t=1700496507; x=1701101307; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=rN7cv6tR5ORx4EtDkeIVWzgXGY477LbEUt3Uc2LZoqI=;
        b=jDZ9tXbJ+blLD3uy9FaW4n9A2RxOlzXPh0ilRIJ7J5zmCzR4eKX/v14VnQ+1cGwi2r
         HNdVFwloltkLs+CPqmvOcxoDa+K+FrllbQAnK4A+I57kH5avTyimcnlj9IOhmzHKsFUQ
         Caq0SgiCgOZGK2focPpYeVmIEvLxIURyIFve3IzcfC7GhzeSpj+JJXGolGo3Phr9iT1S
         IAGsrW7XwSERT+Igr8wsuqaG4oxGcbkxnvaaN7+5jMczhW1MTlcalC9QksaM/ku1djtW
         ELK9k4x45SEBItrcgkAc1iMQZQZUiqTvop48lsBmWpNh62iUj370/EsxtVRWGdz8JvtA
         Z3Cw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700496507; x=1701101307;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=rN7cv6tR5ORx4EtDkeIVWzgXGY477LbEUt3Uc2LZoqI=;
        b=glLxJtX5DyJzJ5WYlsatFOiivtx/hDRzTwuCIyFuD4Ge7Y5i3uoRBm+Q8OHuqpTunI
         6fuYOK8QiziL8JcYP0dr5ZVEMi0ftenuqYbqYjI6n/pAqU/cAnyC9SnMGI9QUkXr1as8
         FlBMk4n28pzC9uUvcRhOXtzFFZfHmpWCh6+eFkclH9WSoo9PsVAe3zA/cqQAgeuczNa9
         e70j1qG1yk4xkSqVP40G6pI4sY6xC6zcDacUYHLMKmLzLtMSUuMgBq5VykkZQdXRV+1I
         AoYBFBOK+v6kLj1H+N+FNJDfigHHV682DEgjCQHaZEj1MlFUbG0WqPXbAHhWiHmyWs4a
         zdOw==
X-Gm-Message-State: AOJu0Yw3qq1oQTDe5WSfIDYYIyM7+4VmVdSYg0m71JP2Ct4BZOMvoGBa
        PuQu5owkaO/AKL3MEhTUZ9x88MMBj8ooDWJWVgL0NA==
X-Google-Smtp-Source: AGHT+IE8rKJqTzJ2hEHRnM3XtzK/67dl+S7PmkbbX/LiIG1cZhbXQYpaU+QDcg9tYkevvwNDu4EEmA==
X-Received: by 2002:a05:600c:350f:b0:402:ee71:29 with SMTP id h15-20020a05600c350f00b00402ee710029mr7985778wmq.10.1700496507310;
        Mon, 20 Nov 2023 08:08:27 -0800 (PST)
Received: from sleipner.berto.se (p4fcc8a96.dip0.t-ipconnect.de. [79.204.138.150])
        by smtp.googlemail.com with ESMTPSA id x18-20020a05600c421200b00406443c8b4fsm17827301wmh.19.2023.11.20.08.08.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Nov 2023 08:08:26 -0800 (PST)
From:   =?UTF-8?q?Niklas=20S=C3=B6derlund?= 
        <niklas.soderlund+renesas@ragnatech.se>
To:     Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        devicetree@vger.kernel.org
Cc:     netdev@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        =?UTF-8?q?Niklas=20S=C3=B6derlund?= 
        <niklas.soderlund+renesas@ragnatech.se>
Subject: [PATCH] dt-bindings: net: renesas,ethertsn: Add bindings for Ethernet TSN
Date:   Mon, 20 Nov 2023 17:07:40 +0100
Message-ID: <20231120160740.3532848-1-niklas.soderlund+renesas@ragnatech.se>
X-Mailer: git-send-email 2.42.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Add bindings for Renesas R-Car Ethernet TSN End-station IP. The RTSN
device provides Ethernet network.

Signed-off-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
---
 .../bindings/net/renesas,ethertsn.yaml        | 133 ++++++++++++++++++
 1 file changed, 133 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/net/renesas,ethertsn.yaml

diff --git a/Documentation/devicetree/bindings/net/renesas,ethertsn.yaml b/Documentation/devicetree/bindings/net/renesas,ethertsn.yaml
new file mode 100644
index 000000000000..255c8f3a5a3b
--- /dev/null
+++ b/Documentation/devicetree/bindings/net/renesas,ethertsn.yaml
@@ -0,0 +1,133 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/net/renesas,ethertsn.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Renesas Ethernet TSN End-station
+
+maintainers:
+  - Niklas Söderlund <niklas.soderlund@ragnatech.se>
+
+description:
+  The RTSN device provides Ethernet network using a 10 Mbps, 100 Mbps, or 1
+  Gbps full-duplex link via MII/GMII/RMII/RGMII. Depending on the connected PHY.
+
+properties:
+  compatible:
+    oneOf:
+      - items:
+          - enum:
+              - renesas,ethertsn-r8a779g0      # R-Car V4H
+
+  reg:
+    items:
+      - description: TSN End Station target
+      - description: generalized Precision Time Protocol target
+
+  reg-names:
+    items:
+      - const: tsnes
+      - const: gptp
+
+  interrupts:
+    items:
+      - description: TX data interrupt
+      - description: RX data interrupt
+
+  interrupt-names:
+    items:
+      - const: tx_data
+      - const: rx_data
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
+  phy-mode:
+    contains:
+      enum:
+        - mii
+        - rgmii
+
+  phy-handle:
+    $ref: /schemas/types.yaml#/definitions/phandle
+    description:
+      Specifies a reference to a node representing a PHY device.
+
+  renesas,rx-internal-delay:
+    type: boolean
+    description:
+      Enable internal Rx clock delay, typically 1.8ns.
+
+  renesas,tx-internal-delay:
+    type: boolean
+    description:
+      Enable internal Tx clock delay, typically 2.0ns.
+
+  '#address-cells':
+    const: 1
+
+  '#size-cells':
+    const: 0
+
+patternProperties:
+  "^ethernet-phy@[0-9a-f]$":
+    type: object
+    $ref: ethernet-phy.yaml#
+
+required:
+  - compatible
+  - reg
+  - reg-names
+  - interrupts
+  - interrupt-names
+  - clocks
+  - power-domains
+  - resets
+  - phy-mode
+  - phy-handle
+  - '#address-cells'
+  - '#size-cells'
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/clock/r8a779g0-cpg-mssr.h>
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+    #include <dt-bindings/power/r8a779g0-sysc.h>
+    #include <dt-bindings/gpio/gpio.h>
+
+    tsn0: ethernet@e6460000 {
+        compatible = "renesas,ethertsn-r8a779g0";
+        reg = <0xe6460000 0x7000>,
+              <0xe6449000 0x500>;
+        reg-names = "tsnes", "gptp";
+        interrupts = <GIC_SPI 429 IRQ_TYPE_LEVEL_HIGH>,
+                     <GIC_SPI 430 IRQ_TYPE_LEVEL_HIGH>;
+        interrupt-names = "tx_data", "rx_data";
+        clocks = <&cpg CPG_MOD 2723>;
+        power-domains = <&sysc R8A779G0_PD_ALWAYS_ON>;
+        resets = <&cpg 2723>;
+
+        phy-mode = "rgmii";
+        renesas,tx-internal-delay;
+        phy-handle = <&phy3>;
+
+        #address-cells = <1>;
+        #size-cells = <0>;
+
+        phy3: ethernet-phy@3 {
+            compatible = "ethernet-phy-ieee802.3-c45";
+            reg = <0>;
+            interrupt-parent = <&gpio4>;
+            interrupts = <3 IRQ_TYPE_LEVEL_LOW>;
+            reset-gpios = <&gpio1 23 GPIO_ACTIVE_LOW>;
+        };
+    };
-- 
2.42.1

