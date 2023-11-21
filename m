Return-Path: <linux-renesas-soc+bounces-47-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id E49B07F3630
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 21 Nov 2023 19:38:40 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 8F9251F22F24
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 21 Nov 2023 18:38:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 36F9022097;
	Tue, 21 Nov 2023 18:38:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ragnatech-se.20230601.gappssmtp.com header.i=@ragnatech-se.20230601.gappssmtp.com header.b="0xKbHxgN"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-lf1-x12d.google.com (mail-lf1-x12d.google.com [IPv6:2a00:1450:4864:20::12d])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3BD4719A5
	for <linux-renesas-soc@vger.kernel.org>; Tue, 21 Nov 2023 10:38:11 -0800 (PST)
Received: by mail-lf1-x12d.google.com with SMTP id 2adb3069b0e04-507e85ebf50so7741872e87.1
        for <linux-renesas-soc@vger.kernel.org>; Tue, 21 Nov 2023 10:38:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ragnatech-se.20230601.gappssmtp.com; s=20230601; t=1700591889; x=1701196689; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=tLsY9mj+sE/CjJljiS1JURplG6R4NjGEPqmgDMelvLw=;
        b=0xKbHxgNGaNZ6aOik6iC9nVw+iE6p8cv3FXfYEt3fZ9PsUltBqIK+/9yT6nG0MGZ8G
         mDK/kthg1VvqGH9O7an14Va8lwsjPsVolwLapwbxBh5Hh7HPRg2v6goUpt1b0kDpL0Ux
         ND96TIxI11hawqj3uY+TvnJEY8+4eWp0MhJReSAF5vOfdgMcRSLhW3SIYCi/srsegtEa
         ME20FDA695M/Lh/6G8pPmFC+t+xXwZJlyTjGstDqi56YCx/maS3RA/k8dT+tGV6+nYtc
         TBkS8/sWBlUN0LbK+7RiHHhf3JJGyvwwvmIFHvUhEYDF0z0SDMvlzv4Bxv8+2c0LUKQB
         FZBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700591889; x=1701196689;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=tLsY9mj+sE/CjJljiS1JURplG6R4NjGEPqmgDMelvLw=;
        b=dt/Ln6AKTwvecjmiFBarkJQWvsxvHCc9bQ9SvL6yOGpLq3Wer8b01Evf45vXHKGzgR
         xYxHzBixNnTWj5ZIGtHq/7XX8CSjdqcW43cJnXurFSZKJbUJGfdxSN9Z36ceflljT09g
         NRmLyhtk1oQrATJElAcOD1ylesfzsvh4kpP3U6o5APOCb9MpKFXMh5GzVGeDpzOP+Tzz
         Ov1puLENb+L6D+RT9+xUMpn2z1aaa//JzSEMeWPntSNrYdefPxZDsh2abW3e449CyhCL
         YX1HI7mPwBdGqNRf/lqbbTOwy7x/iPJAdJCKPhRg71X85ALnv6k50YC1cYRqvhtgfDjo
         iJ+A==
X-Gm-Message-State: AOJu0YzN+zVTpIOMNvb4Oj0K8DHd8WHDlWTqaRSWgvSuGBOH/an8nz//
	kcOGZqgAX/98WAUFTeyQCnaaEtAz1N4M++vZ93M9Aw==
X-Google-Smtp-Source: AGHT+IGudSeAb2Up8kQJkm74QW+5gSTsgKefFOY/tgEli51wxWBqZnhsP9o4z9zr0lmbLGrGNw1INg==
X-Received: by 2002:ac2:44b3:0:b0:507:984b:f174 with SMTP id c19-20020ac244b3000000b00507984bf174mr54973lfm.48.1700591889172;
        Tue, 21 Nov 2023 10:38:09 -0800 (PST)
Received: from sleipner.berto.se (p4fcc8a96.dip0.t-ipconnect.de. [79.204.138.150])
        by smtp.googlemail.com with ESMTPSA id u10-20020aa7d88a000000b00548ac1f7c5esm2921361edq.64.2023.11.21.10.38.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Nov 2023 10:38:08 -0800 (PST)
From: =?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>
To: Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Geert Uytterhoeven <geert@linux-m68k.org>,
	devicetree@vger.kernel.org
Cc: "David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	netdev@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	=?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>
Subject: [PATCH v2] dt-bindings: net: renesas,ethertsn: Add Ethernet TSN
Date: Tue, 21 Nov 2023 19:37:38 +0100
Message-ID: <20231121183738.656192-1-niklas.soderlund+renesas@ragnatech.se>
X-Mailer: git-send-email 2.42.1
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Add bindings for Renesas R-Car Ethernet TSN End-station IP. The RTSN
device provides Ethernet network.

Signed-off-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
---
* Changes since v1
- Update patch subject, was "dt-bindings: net: renesas,ethertsn: Add
  bindings for Ethernet TSN".
- Add top-level $ref to ethernet-controller.yaml.
- Rework compatible node to have a fallback, renesas,rcar-gen4-ethertsn.
- Change compatible value to match renesas style, was
  renesas,ethertsn-r8a779g0.
- Change interrupt names from "tx_data", "rx_data" to "tx", "rx".
- Add missing unevaluatedProperties.
- Use the generic properties for internal delay tx-internal-delay-ps and
  rx-internal-delay-ps instead of vendor specific ones.
---
 .../bindings/net/renesas,ethertsn.yaml        | 133 ++++++++++++++++++
 1 file changed, 133 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/net/renesas,ethertsn.yaml

diff --git a/Documentation/devicetree/bindings/net/renesas,ethertsn.yaml b/Documentation/devicetree/bindings/net/renesas,ethertsn.yaml
new file mode 100644
index 000000000000..475aff7714d6
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
+allOf:
+  - $ref: ethernet-controller.yaml#
+
+properties:
+  compatible:
+    items:
+      - enum:
+          - renesas,r8a779g0-ethertsn       # R-Car V4H
+      - const: renesas,rcar-gen4-ethertsn
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
+      - const: tx
+      - const: rx
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
+  rx-internal-delay-ps:
+    enum: [0, 1800]
+
+  tx-internal-delay-ps:
+    enum: [0, 2000]
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
+    unevaluatedProperties: false
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
+        compatible = "renesas,r8a779g0-ethertsn", "renesas,rcar-gen4-ethertsn";
+        reg = <0xe6460000 0x7000>,
+              <0xe6449000 0x500>;
+        reg-names = "tsnes", "gptp";
+        interrupts = <GIC_SPI 429 IRQ_TYPE_LEVEL_HIGH>,
+                     <GIC_SPI 430 IRQ_TYPE_LEVEL_HIGH>;
+        interrupt-names = "tx", "rx";
+        clocks = <&cpg CPG_MOD 2723>;
+        power-domains = <&sysc R8A779G0_PD_ALWAYS_ON>;
+        resets = <&cpg 2723>;
+
+        phy-mode = "rgmii";
+        tx-internal-delay-ps = <2000>;
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


