Return-Path: <linux-renesas-soc+bounces-23844-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 71287C1B00A
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 29 Oct 2025 14:56:29 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 90F7F1A26A19
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 29 Oct 2025 13:46:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 62E5E33F398;
	Wed, 29 Oct 2025 13:37:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="LwkJkSES"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C42B33F387
	for <linux-renesas-soc@vger.kernel.org>; Wed, 29 Oct 2025 13:37:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761745041; cv=none; b=avI13FfOtpshmZotlOynykB1+cIfZHJ2SHtn5PwP+aOyTo9TvdOw5d3Vm2l26MH0ArEvVQTLQLQ3bPKhjDM80PurDvjyY/O2CF0yDtUN0pHSib0Tmp0P2RMmS4onZPS+f1C1Zajm51l5DQbVTJowsg1mPB6IxT0Da90fj0suBIM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761745041; c=relaxed/simple;
	bh=jlYTpznkpw3t99tPLgYldrq4ef/KHX5tAA1xnNXrqPA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=b6nE8lOgrd+95rvHlhmDG0OB6IxRYhUoHC3YqxWcco9/3C+6ZVahVpbKK94PpXjkf11LX0fQqElwoY2Yuha0oNK8zsqMoLQb7tlRDAF+L1wZn3dKnxs62YNZEGQxQr/xlYfVMufwHuf5nPSlGuVO8QWdAHuunA8AYBpyTUjbP7k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=LwkJkSES; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-47721743fd0so4006605e9.2
        for <linux-renesas-soc@vger.kernel.org>; Wed, 29 Oct 2025 06:37:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1761745037; x=1762349837; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=09j0aMXtdkHUVjdaeP6fCOOTAlbXOhXvrDrARoqs4lM=;
        b=LwkJkSESzOa+6ckpaa18sWgg8XrwuGA6vyTRoxosWIejkQceDISGwAP3gemk8XFiAV
         wL28tNIG9cJnQNUg64/F8W7qT80E/L0mpw5OtiorjKGaYHa52IRIxQNenOjWwAbQCA8w
         4lIENmFPPdjKboKqReNP2cCMLVNHGZKMrPgPLS8kBmq5oJei+ssNgCTCEInrdP2AImrf
         ooagvYjQOkhlKon8HzaUAHvHMy4u2knLpAQBaU9N1z8IC4oSR6dKqQZLRI0qZzc5JBOT
         fOmq6lRLIUy238q0HAOJe/nxWSVA8sonqgj1d3vALk+oBq6t3EonZQxgV3GP9KuqsuY7
         m/0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761745037; x=1762349837;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=09j0aMXtdkHUVjdaeP6fCOOTAlbXOhXvrDrARoqs4lM=;
        b=VPYc2n2tbbCeE5kPEbnPQaluiswVxESWPlFqcDpRna5M2kzxIAKZffZgAEGdC2d2Ji
         /0wwDMX0U0XL4snCHHCPo6Mu1jwHVpTdyPnXD4+ZMBd9gPA16lb6UgBSoqJeP3kkvEmC
         ZAvjN2juA1VYCEF8dqnCudZsuz1S9B2Yln4/8HjLnDhw3i5dPRpVWc94xjQrogV5t6Wu
         kwEFJ7Q9kfPZvC6TZYja1DexPy2P+1Hx8L7XM0eJIudBYrbcrpxY7CxmrDEhmhxJB1Ws
         b2fxbjcOAlMusq5kTMiUUiYhq4ty43OeZwlonXo6XTBWy2K6SP8hPwaDjV9Mk9nz9xOb
         Jkeg==
X-Forwarded-Encrypted: i=1; AJvYcCUa5xzfBD0Jm1Fb5ZWZ33OduWeYn5invgBh61PJWVnjuN2LLCfCgsiDUDLPpRIZ/LzUUAU6Y5ISniAt4LVpNbjxLQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YyhBnK4/W9O0/T6p9VAbxD3gMDmvK6sD451p0v25WpZjTMPWLSx
	I46JKW8k3jH3ZYe5Cs02PLcSmwd1hiMUbKfQ/wPBAyouLNgnF5tyl+ooKDRbNTs7iV8=
X-Gm-Gg: ASbGnctcA8fiop1Ixoh2aodzl01E7dtMkQR/D6ZXXugZNwcqRNxdpht66nPhjqOa8Af
	nZlEk5dEh+VzrL4Y1m2VeRTZu/NRmHTw+wpHZCl1bufDVYxW82RSrNlbto2WC/sKy8m7E1V8xGG
	3J5HMyQriUnxCIJxJx/h8IA9rIP2V85SohV76IjV/0eU1k3pnWbuiIr6fs4hRPBKrUg+DIuhCmv
	ww8aMvP76FJ36AGnMN+gsO4s5GtUsWvhdO4Wo7nRiiC72dtU/MHvDW3nTsEji7A49rRZUTV3Y3d
	ylnAYGj7MqoBudhi2igvcxqP3HQPxzYQnaRofgOOH3B8OB/f/f3SrMHs8uLcOEprroOK/wgS0X5
	oYcKgPMHADylFw0nT5ggLXQNqmRSLMZlhrUEyS/ZeKHLICnAUFe7ipdSYtZPgPGvVporVYavqlg
	pQVfSgMIvgUQxvMrXFkz98k9z+rFqNopXjnHhWmyebYtcmXoouOe4TrliagnUi
X-Google-Smtp-Source: AGHT+IGJ3AE+vyuW70tOg6LygKMFQqtjwIY5dXfld6spAS47+bv6XCAjVr54PbOjL09BTrGD+nbGtg==
X-Received: by 2002:a05:600c:4e15:b0:477:942:7521 with SMTP id 5b1f17b1804b1-4771e1ad3c9mr30682075e9.14.1761745037344;
        Wed, 29 Oct 2025 06:37:17 -0700 (PDT)
Received: from claudiu-TUXEDO-InfinityBook-Pro-AMD-Gen9.. ([2a02:2f04:6302:7900:aafe:5712:6974:4a42])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4771e22280fsm49774795e9.14.2025.10.29.06.37.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Oct 2025 06:37:16 -0700 (PDT)
From: Claudiu <claudiu.beznea@tuxon.dev>
X-Google-Original-From: Claudiu <claudiu.beznea.uj@bp.renesas.com>
To: lpieralisi@kernel.org,
	kwilczynski@kernel.org,
	mani@kernel.org,
	robh@kernel.org,
	bhelgaas@google.com,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	geert+renesas@glider.be,
	magnus.damm@gmail.com,
	p.zabel@pengutronix.de
Cc: claudiu.beznea@tuxon.dev,
	linux-pci@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
Subject: [PATCH v6 1/6] dt-bindings: PCI: renesas,r9a08g045s33-pcie: Add Renesas RZ/G3S
Date: Wed, 29 Oct 2025 15:36:48 +0200
Message-ID: <20251029133653.2437024-2-claudiu.beznea.uj@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251029133653.2437024-1-claudiu.beznea.uj@bp.renesas.com>
References: <20251029133653.2437024-1-claudiu.beznea.uj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>

The PCIe IP available on the Renesas RZ/G3S complies with the PCI Express
Base Specification 4.0. It is designed for root complex applications and
features a single-lane (x1) implementation. Add documentation for it.

Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
---

Changes in v6:
- updated the patch title
- described the functionalites that system controller has for PCIe 
- dropped /schemas/pci/pci-device.yaml# from allOf section
- dropped max-link-speed from example
- dropped pcie_port0 label from example

Changes in v5:
- dropped Tb tag
- style updates to the dma-ranges and ranges properties from
  examples section
- re-enabled the node from examples section

Changes in v4:
- dropped "s33" string from compatible name
- added port node documentation; due to this dropped Rob's Rb tag
- reorderded properties
- dropped spaces b/w "INT" and "A", "B", "C", "D" in comments

Changes in v3:
- collected tags
- updated the flags of ranges property from example

Changes in v2:
- update the interrupt names by dropping "int" and "rc" string; due
  to this the patch description was adjusted
- added "interrupt-controller" and made it mandatory
- s/clkl1pm/pm/g
- dropped the legacy-interrupt-controller node; with this the gic
  interrupt controller node was dropped as well as it is not needed
  anymore
- updated interrupt-map in example and added interrupt-controller
- added clock-names as required property as the pm clock is not
  handled though PM domains; this will allow the driver to have
  the option to request the pm clock by its name when implementation
  will be adjusted to used the pm clock
- adjusted the size of dma-ranges to reflect the usage on
  SMARC module board
- moved "renesas,sysc" at the end of the node in example to align
  with dts coding style

 .../bindings/pci/renesas,r9a08g045-pcie.yaml  | 249 ++++++++++++++++++
 1 file changed, 249 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/pci/renesas,r9a08g045-pcie.yaml

diff --git a/Documentation/devicetree/bindings/pci/renesas,r9a08g045-pcie.yaml b/Documentation/devicetree/bindings/pci/renesas,r9a08g045-pcie.yaml
new file mode 100644
index 000000000000..d668782546a2
--- /dev/null
+++ b/Documentation/devicetree/bindings/pci/renesas,r9a08g045-pcie.yaml
@@ -0,0 +1,249 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/pci/renesas,r9a08g045-pcie.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Renesas RZ/G3S PCIe host controller
+
+maintainers:
+  - Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
+
+description:
+  Renesas RZ/G3S PCIe host controller complies with PCIe Base Specification
+  4.0 and supports up to 5 GT/s (Gen2).
+
+properties:
+  compatible:
+    const: renesas,r9a08g045-pcie # RZ/G3S
+
+  reg:
+    maxItems: 1
+
+  interrupts:
+    items:
+      - description: System error interrupt
+      - description: System error on correctable error interrupt
+      - description: System error on non-fatal error interrupt
+      - description: System error on fatal error interrupt
+      - description: AXI error interrupt
+      - description: INTA interrupt
+      - description: INTB interrupt
+      - description: INTC interrupt
+      - description: INTD interrupt
+      - description: MSI interrupt
+      - description: Link bandwidth interrupt
+      - description: PME interrupt
+      - description: DMA interrupt
+      - description: PCIe event interrupt
+      - description: Message interrupt
+      - description: All interrupts
+
+  interrupt-names:
+    items:
+      - description: serr
+      - description: ser_cor
+      - description: serr_nonfatal
+      - description: serr_fatal
+      - description: axi_err
+      - description: inta
+      - description: intb
+      - description: intc
+      - description: intd
+      - description: msi
+      - description: link_bandwidth
+      - description: pm_pme
+      - description: dma
+      - description: pcie_evt
+      - description: msg
+      - description: all
+
+  interrupt-controller: true
+
+  clocks:
+    items:
+      - description: System clock
+      - description: PM control clock
+
+  clock-names:
+    items:
+      - description: aclk
+      - description: pm
+
+  resets:
+    items:
+      - description: AXI2PCIe Bridge reset
+      - description: Data link layer/transaction layer reset
+      - description: Transaction layer (ACLK domain) reset
+      - description: Transaction layer (PCLK domain) reset
+      - description: Physical layer reset
+      - description: Configuration register reset
+      - description: Configuration register reset
+
+  reset-names:
+    items:
+      - description: aresetn
+      - description: rst_b
+      - description: rst_gp_b
+      - description: rst_ps_b
+      - description: rst_rsm_b
+      - description: rst_cfg_b
+      - description: rst_load_b
+
+  power-domains:
+    maxItems: 1
+
+  dma-ranges:
+    description:
+      A single range for the inbound memory region.
+    maxItems: 1
+
+  renesas,sysc:
+    description: |
+      System controller registers control and monitor various PCIe
+      functionalities.
+
+      Control:
+      - transition to L1 state
+      - receiver termination settings
+      - RST_RSM_B signal
+
+      Monitor:
+      - clkl1pm clock request state
+      - power off information in L2 state
+      - errors (fatal, non-fatal, correctable)
+    $ref: /schemas/types.yaml#/definitions/phandle
+
+patternProperties:
+  "^pcie@0,[0-0]$":
+    type: object
+    allOf:
+      - $ref: /schemas/pci/pci-pci-bridge.yaml#
+
+    properties:
+      reg:
+        maxItems: 1
+
+      vendor-id:
+        const: 0x1912
+
+      device-id:
+        const: 0x0033
+
+      clocks:
+        items:
+          - description: Reference clock
+
+      clock-names:
+        items:
+          - const: ref
+
+    required:
+      - device_type
+      - vendor-id
+      - device-id
+      - clocks
+      - clock-names
+
+    unevaluatedProperties: false
+
+required:
+  - compatible
+  - reg
+  - clocks
+  - clock-names
+  - resets
+  - reset-names
+  - interrupts
+  - interrupt-names
+  - interrupt-map
+  - interrupt-map-mask
+  - interrupt-controller
+  - power-domains
+  - "#address-cells"
+  - "#size-cells"
+  - "#interrupt-cells"
+  - renesas,sysc
+
+allOf:
+  - $ref: /schemas/pci/pci-host-bridge.yaml#
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/clock/r9a08g045-cpg.h>
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+
+    bus {
+        #address-cells = <2>;
+        #size-cells = <2>;
+
+        pcie@11e40000 {
+            compatible = "renesas,r9a08g045-pcie";
+            reg = <0 0x11e40000 0 0x10000>;
+            ranges = <0x02000000 0 0x30000000 0 0x30000000 0 0x08000000>;
+            /* Map all possible DRAM ranges (4 GB). */
+            dma-ranges = <0x42000000 0 0x40000000 0 0x40000000 1 0x00000000>;
+            bus-range = <0x0 0xff>;
+            interrupts = <GIC_SPI 395 IRQ_TYPE_LEVEL_HIGH>,
+                         <GIC_SPI 396 IRQ_TYPE_LEVEL_HIGH>,
+                         <GIC_SPI 397 IRQ_TYPE_LEVEL_HIGH>,
+                         <GIC_SPI 398 IRQ_TYPE_LEVEL_HIGH>,
+                         <GIC_SPI 399 IRQ_TYPE_LEVEL_HIGH>,
+                         <GIC_SPI 400 IRQ_TYPE_LEVEL_HIGH>,
+                         <GIC_SPI 401 IRQ_TYPE_LEVEL_HIGH>,
+                         <GIC_SPI 402 IRQ_TYPE_LEVEL_HIGH>,
+                         <GIC_SPI 403 IRQ_TYPE_LEVEL_HIGH>,
+                         <GIC_SPI 404 IRQ_TYPE_LEVEL_HIGH>,
+                         <GIC_SPI 405 IRQ_TYPE_LEVEL_HIGH>,
+                         <GIC_SPI 406 IRQ_TYPE_LEVEL_HIGH>,
+                         <GIC_SPI 407 IRQ_TYPE_LEVEL_HIGH>,
+                         <GIC_SPI 408 IRQ_TYPE_LEVEL_HIGH>,
+                         <GIC_SPI 409 IRQ_TYPE_LEVEL_HIGH>,
+                         <GIC_SPI 410 IRQ_TYPE_LEVEL_HIGH>;
+            interrupt-names = "serr", "serr_cor", "serr_nonfatal",
+                              "serr_fatal", "axi_err", "inta",
+                              "intb", "intc", "intd", "msi",
+                              "link_bandwidth", "pm_pme", "dma",
+                              "pcie_evt", "msg", "all";
+            #interrupt-cells = <1>;
+            interrupt-controller;
+            interrupt-map-mask = <0 0 0 7>;
+            interrupt-map = <0 0 0 1 &pcie 0 0 0 0>, /* INTA */
+                            <0 0 0 2 &pcie 0 0 0 1>, /* INTB */
+                            <0 0 0 3 &pcie 0 0 0 2>, /* INTC */
+                            <0 0 0 4 &pcie 0 0 0 3>; /* INTD */
+            clocks = <&cpg CPG_MOD R9A08G045_PCI_ACLK>,
+                     <&cpg CPG_MOD R9A08G045_PCI_CLKL1PM>;
+            clock-names = "aclk", "pm";
+            resets = <&cpg R9A08G045_PCI_ARESETN>,
+                     <&cpg R9A08G045_PCI_RST_B>,
+                     <&cpg R9A08G045_PCI_RST_GP_B>,
+                     <&cpg R9A08G045_PCI_RST_PS_B>,
+                     <&cpg R9A08G045_PCI_RST_RSM_B>,
+                     <&cpg R9A08G045_PCI_RST_CFG_B>,
+                     <&cpg R9A08G045_PCI_RST_LOAD_B>;
+            reset-names = "aresetn", "rst_b", "rst_gp_b", "rst_ps_b",
+                          "rst_rsm_b", "rst_cfg_b", "rst_load_b";
+            power-domains = <&cpg>;
+            device_type = "pci";
+            #address-cells = <3>;
+            #size-cells = <2>;
+            renesas,sysc = <&sysc>;
+
+            pcie@0,0 {
+                reg = <0x0 0x0 0x0 0x0 0x0>;
+                ranges;
+                clocks = <&versa3 5>;
+                clock-names = "ref";
+                device_type = "pci";
+                vendor-id = <0x1912>;
+                device-id = <0x0033>;
+                #address-cells = <3>;
+                #size-cells = <2>;
+            };
+        };
+    };
+
+...
-- 
2.43.0


