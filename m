Return-Path: <linux-renesas-soc+bounces-19235-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id D38A1AF97BF
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  4 Jul 2025 18:15:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id ACE231CA63B3
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  4 Jul 2025 16:16:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1A567327FFE;
	Fri,  4 Jul 2025 16:14:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="CrrgPdyW"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com [209.85.218.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B02A327A30
	for <linux-renesas-soc@vger.kernel.org>; Fri,  4 Jul 2025 16:14:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751645687; cv=none; b=TUG8U9sjJx1sTAzZe5Inydhdlm1b/+yn2HgSsUeoJCld7OHLe1XH4iG66gFKQYMy5vWZWEbGRRGHJLlOSxYvkfZ7JSEpk3Jn4umGmcQQZZcczvMjae7187EgmBKA8j7MlwXJwF6DD9AXXJNjOuWHPAWYttkG3wTLN+K8gMD6N9s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751645687; c=relaxed/simple;
	bh=ubkY+ASsC77/NLfS+/kNeOhi3pom6Deb7Y0KTpv9Ly0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=NZAEfONBOeoL7orANc8OrdHvQZYMRp+yFKvE/YkWHnko65XVIFFBqMUOK2eLijZsaRGM4xYQLhIHoErn8dvXVwobjumUHMeSFRA/VL/VzfNg408IK25La0fnEBsCmMzGAkoOQDBxDF2TqhyrkLjww6cCPBmKjFVBd50Eq9LqcIY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=CrrgPdyW; arc=none smtp.client-ip=209.85.218.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Received: by mail-ej1-f54.google.com with SMTP id a640c23a62f3a-ae0de1c378fso162908166b.3
        for <linux-renesas-soc@vger.kernel.org>; Fri, 04 Jul 2025 09:14:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1751645683; x=1752250483; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KkOwcwg0QMfkyPLB7333OfTZ1BiRXOsUSblm0YS+eKE=;
        b=CrrgPdyWd6EukVqlfzR6jrzky2cC1Np6Fksx5m7mOJjTjlx/djPhSYu/asFFMBPDv4
         9DDlvraZuLio8cS3LsGXvvTYn4ndqwPdVoK3ANwVt5o28jCvI+PJolLEdwJWoRsZGdWP
         YgFv1pVmFaJIcB1v2HrZuF3+8xvrixJuYDsrnyflsktZv9Xg+vOD4mE0yecRtr3Ddb4s
         zJlzAJVnZBN1/d2NNxrtbhfL8rsrxOiOLxu1fdPS677104lakckkHkzcHCURDqQZCTnF
         x/jmjpQFWKYF6IG5K4hZNWJGk20NLfXvIEwhIDvQuCiClxFDD6KvaTJGzsKjXtNojJfv
         inNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751645683; x=1752250483;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=KkOwcwg0QMfkyPLB7333OfTZ1BiRXOsUSblm0YS+eKE=;
        b=A9QZayT/8GV2qtJukQ6TB63pxYNy6jVhMdLnwHGJo9+Mhe4T00+DjNHVGb/XTcxrkH
         AXrzKVAqXquEkxNfwc4ZwiiXgss54TVyB/krUKVe3t+H/WGeJTk7sjPIhFpx8h7/j5DZ
         bxE5akijQG+pLlZJyLKN8D5fgKhFwLmAohwTJIippLzKDD1h9hpgIZky7wSe7cH5lmaw
         1TGtC9Ewe7GBUksGkfAiCpbw96JR3EA6CcgjdT2Hb/VfICBL3XS1P/u9WCWm//ngjm9Z
         harch4kRp/ubmiSTWA/zqQv12c1cEU5bIbHZVQVu56/rpe3Jg8HCS3t8P+eBJtYTaKW1
         gMFA==
X-Forwarded-Encrypted: i=1; AJvYcCUcZ74a3BT7IXqthL/wv8howw+c0/+qu1peLdNDNhmovX/5suELxAqpIG5cm5tzgvSC8TIdALlVmfK8q5/J52iumQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Ywc/+Nr3Ncu8sM1YXJu91jko1+Ld7B87VCNSdBYI+3WFUr7i+7v
	gyFI6r7hsuzhD35tJouoT3kBcA5kMyUbsKqjw2wFAJx/1CLF0l9QVLo/Ewb4Kd4m82A=
X-Gm-Gg: ASbGncuiL/Ix+e7NL7N/66UHdXnux3NJzBaDPv4/Q2WSvsehOFor86zAvBifqT+Kv0d
	+95F7+2PZ/SSdWjS4J4sa9J3vzf5nhOMMDWYbSaafaU4JJGo32kX8oTkAu20nq/uvCJwCVAVx9Z
	85wrt4+Z3+qL1vbqN1TobK2JwcRywJaYyGe6q+RpQOpcsWGVqyOtIqBIbp1Who6iXWZswwg2UIK
	zPgYMX+b5IcPj0VH+FW8gHTPT0ZgUNpPzZ/H2cE6vlIaEOXB7lTIzXG7QXvRi3j2QBhjqUSkTmT
	S8hkeEYTlOVFs5OwGkXfCTrwQpqNhZpLUyAKPMyUskrHWpR7age/9VoKXH7rMzb6DRDniX3o/kX
	b/wibCGOzKs4nnZM=
X-Google-Smtp-Source: AGHT+IGZ4JE/8eQjPvugbMtudMafjOOm0CxMF4rvO8QtgqMHcfbetqVSRRSNB4T9WuYI97B08ZtIRg==
X-Received: by 2002:a17:906:d7c5:b0:ae3:dad1:70c8 with SMTP id a640c23a62f3a-ae3fbd50a6fmr314770766b.42.1751645682493;
        Fri, 04 Jul 2025 09:14:42 -0700 (PDT)
Received: from claudiu-X670E-Pro-RS.. ([82.78.167.83])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ae3f66d9215sm194703766b.2.2025.07.04.09.14.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Jul 2025 09:14:42 -0700 (PDT)
From: Claudiu <claudiu.beznea@tuxon.dev>
X-Google-Original-From: Claudiu <claudiu.beznea.uj@bp.renesas.com>
To: bhelgaas@google.com,
	lpieralisi@kernel.org,
	kwilczynski@kernel.org,
	mani@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	geert+renesas@glider.be,
	magnus.damm@gmail.com,
	catalin.marinas@arm.com,
	will@kernel.org,
	mturquette@baylibre.com,
	sboyd@kernel.org,
	p.zabel@pengutronix.de,
	lizhi.hou@amd.com
Cc: claudiu.beznea@tuxon.dev,
	linux-pci@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-clk@vger.kernel.org,
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>,
	Wolfram Sang <wsa+renesas@sang-engineering.com>
Subject: [PATCH v3 4/9] dt-bindings: PCI: renesas,r9a08g045s33-pcie: Add documentation for the PCIe IP on Renesas RZ/G3S
Date: Fri,  4 Jul 2025 19:14:04 +0300
Message-ID: <20250704161410.3931884-5-claudiu.beznea.uj@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250704161410.3931884-1-claudiu.beznea.uj@bp.renesas.com>
References: <20250704161410.3931884-1-claudiu.beznea.uj@bp.renesas.com>
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

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
Tested-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
---

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

 .../pci/renesas,r9a08g045s33-pcie.yaml        | 202 ++++++++++++++++++
 1 file changed, 202 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/pci/renesas,r9a08g045s33-pcie.yaml

diff --git a/Documentation/devicetree/bindings/pci/renesas,r9a08g045s33-pcie.yaml b/Documentation/devicetree/bindings/pci/renesas,r9a08g045s33-pcie.yaml
new file mode 100644
index 000000000000..42a9494c96c0
--- /dev/null
+++ b/Documentation/devicetree/bindings/pci/renesas,r9a08g045s33-pcie.yaml
@@ -0,0 +1,202 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/pci/renesas,r9a08g045s33-pcie.yaml#
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
+    const: renesas,r9a08g045s33-pcie # RZ/G3S
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
+    description: System controller phandle
+    $ref: /schemas/types.yaml#/definitions/phandle
+
+  vendor-id:
+    const: 0x1912
+
+  device-id:
+    const: 0x0033
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
+  - vendor-id
+  - device-id
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
+            compatible = "renesas,r9a08g045s33-pcie";
+            reg = <0 0x11e40000 0 0x10000>;
+            ranges = <0x02000000 0 0x30000000 0 0x30000000 0 0x8000000>;
+            dma-ranges = <0x42000000 0 0x48000000 0 0x48000000 0 0x38000000>;
+            bus-range = <0x0 0xff>;
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
+            interrupt-map = <0 0 0 1 &pcie 0 0 0 0>, /* INT A */
+                            <0 0 0 2 &pcie 0 0 0 1>, /* INT B */
+                            <0 0 0 3 &pcie 0 0 0 2>, /* INT C */
+                            <0 0 0 4 &pcie 0 0 0 3>; /* INT D */
+            device_type = "pci";
+            num-lanes = <1>;
+            #address-cells = <3>;
+            #size-cells = <2>;
+            power-domains = <&cpg>;
+            vendor-id = <0x1912>;
+            device-id = <0x0033>;
+            renesas,sysc = <&sysc>;
+        };
+    };
+
+...
-- 
2.43.0


