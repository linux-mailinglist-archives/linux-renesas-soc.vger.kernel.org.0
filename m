Return-Path: <linux-renesas-soc+bounces-14171-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id CB740A57DFD
	for <lists+linux-renesas-soc@lfdr.de>; Sat,  8 Mar 2025 21:10:24 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 2DE3E18931BD
	for <lists+linux-renesas-soc@lfdr.de>; Sat,  8 Mar 2025 20:10:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 78DAD212FAF;
	Sat,  8 Mar 2025 20:09:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="IPicfkV1"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com [209.85.218.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 723C220C46C;
	Sat,  8 Mar 2025 20:09:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741464593; cv=none; b=M1M48kjMabFS9/MoZw5FTsguMe3Egm25nLyqX/+fhjzMtOADb9eCvaoLLi5teSlO6ZiPHShyNbs65bx+QMj2DZ1VLg3W4JLqCS1rogxM5DniqUjyuEb/c25jA/QeyUaNkOXqFqdtGnHLX5W9LPeknUzFVNfVJIhET/nE8fyOgII=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741464593; c=relaxed/simple;
	bh=QCmFU6nnA6DR28TD0oOjcFgxLHFdaQmOLXX9MVp4eZk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=X5620VH+fAf94+pKRhHoc8s7WS4pCca8YSbzoFeOvCoaaqXyWJU7z6idOabecCkP/SA2DqqDS2tG6iOxAW1ANpgC3jPKCbg5SdCx1EObO4g+UAd6XotEgTjNh5I7iqrX5ZPEZwoPALxKZE35Ey30PLg6e5CatLjhy3JPTwQ+1fY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=IPicfkV1; arc=none smtp.client-ip=209.85.218.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f47.google.com with SMTP id a640c23a62f3a-ab78e6edb99so453242266b.2;
        Sat, 08 Mar 2025 12:09:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1741464590; x=1742069390; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=O1tmb5JgNcIqAbNOKetNO+lfhuspAfTg8686yWqKvrg=;
        b=IPicfkV1+3E45c8Bft+Lun1G+WbsV/4X0JSRFpEpoZ+5mA7qJWsuebn1n5drPBZD+k
         2yZCAMCbxDEVuD8INcaSv5fla/U1eWwAN3wxQczPg8YsRxxBa11GbplXobzBG11lz1EU
         zJHYeQrojFxFlhUwMq4cE3LjPc5RhNxX8FdFTJJpnOHHIVxme6K3WKi0cS3KHsvI34Zm
         F9raLHIa78VxjFKP0/3QFQ1XskuK7kimX/ONMPRPaX0YRnzQIweWS0DQvJRFKrOJhdNz
         eyoyjKBYOkIqT9LIUYuUdJrG/n5urXGHshi0OImU97Mmqs9+ejChL1OAXT94rW4GqEXz
         2sZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741464590; x=1742069390;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=O1tmb5JgNcIqAbNOKetNO+lfhuspAfTg8686yWqKvrg=;
        b=sdRwxt3Sjluq7h70M9/CWpe1E9q5IjwCorN3xJ92Y8M4NePGfQO9PgjRLeRzdvocco
         wqG3jGJIi1EwDTxEqVamXGXfoZCf9VoeToavGNz1qr+54YuAjxaQvQJsTk1vxrbk4Eu+
         d7q5HRxuLbKVtatSN/dCwknKqZ3kPvHQQYms9P5sLq9Ma+Dpw3Kfgf6/D2sa5pfhRaWA
         6MfjlGr1XValJqR/cp2Sn14Bc/m15Q3+bN0ojR+OVRRhrXARroDToT/4Fs9htlhY5chI
         uFy0Dt7u0tHNymCBM0lbMaRZImXnqlr4LCVaF8ll4CuvkHgXxawI5uSNfxgjWCR+A3st
         CBag==
X-Forwarded-Encrypted: i=1; AJvYcCVYWc2I0hGo6DHWV34yfaQDToK1sK1yo6D4f409g+4L85Gfk4B2BGRi9ZhvHsGAQx05N5x0poN+/07vcidk@vger.kernel.org, AJvYcCWnhcZsPUjykOstFUWaccnunkisT3Ey+hnHysJlt0ENZOgGcORolZZMjFWe4hVU+mt8ikXE6nrG8qxk@vger.kernel.org, AJvYcCXf4wMcYpwbW0Cc0vAk9YWitiB1x9rBCc36FimgL134oMfrCfK4HagiFjbGCTWLUpSS28YgJ5NmVi0XMt3UzE+CXrA=@vger.kernel.org
X-Gm-Message-State: AOJu0YzKp+YWHxMa4zGwE8yvkXwqKiSL4K8y2Rg/vBMebf/8jRddg4TN
	oerds7IARGpCIN80n/+qVv+0/ttJQuc6l4JdKNQ+i3lsRRqHJdqh
X-Gm-Gg: ASbGncv1YVxx7M1Yz4sH/1dVZ5dVNDQ7JvQDnvHvYDpya5k1Lw2fHlVfTNx8IQHeH3L
	H8nBaVqnnL3jvA7xlUiEiV3uUQfSNaqYq0f0aeVz1+QcpzbERgZZvMAIfNbzV2WZ2RwCZ1+ULg8
	vgFaVOCRamK8E2uQw9bXhYxT/9MqgjfxopY4wjwC2XL9XE4w46K/bFMyr6C6xR0grK5/TEry6wQ
	mn0TVp7zWV27AUR0+wTr0wDJjugDDYGuANfp27kRcssbZEsKsBCCk5gCQjdd6lq2zEMPwEajN6h
	dFNddvcfkLxXBh9HoqwNYIp9M1ogz6wb4b3EmKBnxnjYVrI2C0/GDtkEsavEFLbb5pL8sAgMZ7n
	nCOUwp7T0
X-Google-Smtp-Source: AGHT+IFv1cRG3lwy8g/phiTGVotpmzUwl5cEdgtEIzGOlEZGnQcGdOWCEtW1lkMyEthp+w9xUqxG1A==
X-Received: by 2002:a17:907:26c9:b0:ac2:166f:42fc with SMTP id a640c23a62f3a-ac2530200bdmr853256766b.52.1741464589343;
        Sat, 08 Mar 2025 12:09:49 -0800 (PST)
Received: from prasmi.Home ([2a06:5906:61b:2d00:238d:d8a2:7f2b:419e])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ac254346ce8sm340766466b.177.2025.03.08.12.09.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 08 Mar 2025 12:09:48 -0800 (PST)
From: Prabhakar <prabhakar.csengg@gmail.com>
X-Google-Original-From: Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To: Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	"Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>,
	Giuseppe Cavallaro <peppe.cavallaro@st.com>,
	Jose Abreu <joabreu@synopsys.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>
Cc: netdev@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	Prabhakar <prabhakar.csengg@gmail.com>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH net-next v2 2/3] dt-bindings: net: Document support for Renesas RZ/V2H(P) GBETH
Date: Sat,  8 Mar 2025 20:09:20 +0000
Message-ID: <20250308200921.1089980-3-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250308200921.1089980-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20250308200921.1089980-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

GBETH IP on the Renesas RZ/V2H(P) SoC is integrated with Synopsys
DesignWare MAC (version 5.20). Document the device tree bindings for
the GBETH glue layer.

Generic compatible string 'renesas,rzv2h-gbeth' is added since this
module is identical on both the RZ/V2H(P) and RZ/G3E SoCs.

The Rx/Tx clocks supplied for GBETH on the RZ/V2H(P) SoC is depicted
below:

                      Rx / Tx
-------+------------- on / off -------
       |
       |            Rx-180 / Tx-180
       +---- not ---- on / off -------

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
---
v1->v2
- Updated commit description
- Updated interrupts description for clarity
- Updated interrupt-names for clarity
- Updated example node
---
 .../bindings/net/renesas,r9a09g057-gbeth.yaml | 213 ++++++++++++++++++
 .../devicetree/bindings/net/snps,dwmac.yaml   |   1 +
 2 files changed, 214 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/net/renesas,r9a09g057-gbeth.yaml

diff --git a/Documentation/devicetree/bindings/net/renesas,r9a09g057-gbeth.yaml b/Documentation/devicetree/bindings/net/renesas,r9a09g057-gbeth.yaml
new file mode 100644
index 000000000000..b3123e258f66
--- /dev/null
+++ b/Documentation/devicetree/bindings/net/renesas,r9a09g057-gbeth.yaml
@@ -0,0 +1,213 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/net/renesas,r9a09g057-gbeth.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: GBETH glue layer for Renesas RZ/V2H(P) (and similar SoCs)
+
+maintainers:
+  - Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
+
+select:
+  properties:
+    compatible:
+      contains:
+        enum:
+          - renesas,r9a09g057-gbeth
+          - renesas,rzv2h-gbeth
+  required:
+    - compatible
+
+properties:
+  compatible:
+    items:
+      - enum:
+          - renesas,r9a09g057-gbeth # RZ/V2H(P)
+      - const: renesas,rzv2h-gbeth
+      - const: snps,dwmac-5.20
+
+  reg:
+    maxItems: 1
+
+  clocks:
+    items:
+      - description: CSR clock
+      - description: AXI system clock
+      - description: PTP clock
+      - description: TX clock
+      - description: RX clock
+      - description: TX clock phase-shifted by 180 degrees
+      - description: RX clock phase-shifted by 180 degrees
+
+  clock-names:
+    items:
+      - const: stmmaceth
+      - const: pclk
+      - const: ptp_ref
+      - const: tx
+      - const: rx
+      - const: tx-180
+      - const: rx-180
+
+  interrupts:
+    items:
+      - description: Subsystem interrupt
+      - description: The interrupt to manage the remote wake-up packet detection
+      - description: The interrupt that occurs when Tx/Rx enters/exits the LPI state
+      - description: Tx queue0 transmit completion interrupt
+      - description: Tx queue1 transmit completion interrupt
+      - description: Tx queue2 transmit completion interrupt
+      - description: Tx queue3 transmit completion interrupt
+      - description: Rx queue0 receive completion interrupt
+      - description: Rx queue1 receive completion interrupt
+      - description: Rx queue2 receive completion interrupt
+      - description: Rx queue3 receive completion interrupt
+
+  interrupt-names:
+    items:
+      - const: macirq
+      - const: eth_wake_irq
+      - const: eth_lpi
+      - const: tx-queue0
+      - const: tx-queue1
+      - const: tx-queue2
+      - const: tx-queue3
+      - const: rx-queue0
+      - const: rx-queue1
+      - const: rx-queue2
+      - const: rx-queue3
+
+  resets:
+    items:
+      - description: AXI power-on system reset
+
+required:
+  - compatible
+  - reg
+  - clocks
+  - clock-names
+  - interrupts
+  - interrupt-names
+  - resets
+
+allOf:
+  - $ref: snps,dwmac.yaml#
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/clock/renesas-cpg-mssr.h>
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+
+    ethernet@15c30000 {
+        compatible = "renesas,r9a09g057-gbeth", "renesas,rzv2h-gbeth", "snps,dwmac-5.20";
+        reg = <0x15c30000 0x10000>;
+        clocks =  <&cpg CPG_MOD 0xbd>, <&cpg CPG_MOD 0xbc>,
+                  <&ptp_clock>, <&cpg CPG_MOD 0xb8>,
+                  <&cpg CPG_MOD 0xb9>, <&cpg CPG_MOD 0xba>,
+                  <&cpg CPG_MOD 0xbb>;
+        clock-names = "stmmaceth", "pclk", "ptp_ref",
+                      "tx", "rx", "tx-180", "rx-180";
+        resets = <&cpg 0xb0>;
+        interrupts = <GIC_SPI 765 IRQ_TYPE_LEVEL_HIGH>,
+                     <GIC_SPI 767 IRQ_TYPE_LEVEL_HIGH>,
+                     <GIC_SPI 766 IRQ_TYPE_LEVEL_HIGH>,
+                     <GIC_SPI 768 IRQ_TYPE_LEVEL_HIGH>,
+                     <GIC_SPI 769 IRQ_TYPE_LEVEL_HIGH>,
+                     <GIC_SPI 770 IRQ_TYPE_LEVEL_HIGH>,
+                     <GIC_SPI 771 IRQ_TYPE_LEVEL_HIGH>,
+                     <GIC_SPI 772 IRQ_TYPE_LEVEL_HIGH>,
+                     <GIC_SPI 773 IRQ_TYPE_LEVEL_HIGH>,
+                     <GIC_SPI 774 IRQ_TYPE_LEVEL_HIGH>,
+                     <GIC_SPI 745 IRQ_TYPE_LEVEL_HIGH>;
+        interrupt-names = "macirq", "eth_wake_irq", "eth_lpi",
+                          "tx-queue0", "tx-queue1", "tx-queue2",
+                          "tx-queue3", "rx-queue0", "rx-queue1",
+                          "rx-queue2", "rx-queue3";
+        phy-mode = "rgmii-id";
+        snps,multicast-filter-bins = <256>;
+        snps,perfect-filter-entries = <128>;
+        rx-fifo-depth = <8192>;
+        tx-fifo-depth = <8192>;
+        snps,fixed-burst;
+        snps,force_thresh_dma_mode;
+        snps,axi-config = <&stmmac_axi_setup>;
+        snps,mtl-rx-config = <&mtl_rx_setup>;
+        snps,mtl-tx-config = <&mtl_tx_setup>;
+        snps,en-tx-lpi-clockgating;
+        snps,txpbl = <32>;
+        snps,rxpbl = <32>;
+        phy-handle = <&phy0>;
+
+        stmmac_axi_setup: stmmac-axi-config {
+            snps,lpi_en;
+            snps,wr_osr_lmt = <0xf>;
+            snps,rd_osr_lmt = <0xf>;
+            snps,blen = <16 8 4 0 0 0 0>;
+        };
+
+        mtl_rx_setup: rx-queues-config {
+            snps,rx-queues-to-use = <4>;
+            snps,rx-sched-sp;
+
+            queue0 {
+                snps,dcb-algorithm;
+                snps,priority = <0x1>;
+                snps,map-to-dma-channel = <0>;
+            };
+
+            queue1 {
+                snps,dcb-algorithm;
+                snps,priority = <0x2>;
+                snps,map-to-dma-channel = <1>;
+            };
+
+            queue2 {
+                snps,dcb-algorithm;
+                snps,priority = <0x4>;
+                snps,map-to-dma-channel = <2>;
+            };
+
+            queue3 {
+                snps,dcb-algorithm;
+                snps,priority = <0x8>;
+                snps,map-to-dma-channel = <3>;
+            };
+        };
+
+        mtl_tx_setup: tx-queues-config {
+            snps,tx-queues-to-use = <4>;
+
+            queue0 {
+                snps,dcb-algorithm;
+                snps,priority = <0x1>;
+            };
+
+            queue1 {
+                snps,dcb-algorithm;
+                snps,priority = <0x2>;
+            };
+
+            queue2 {
+                snps,dcb-algorithm;
+                snps,priority = <0x4>;
+            };
+
+            queue3 {
+                snps,dcb-algorithm;
+                snps,priority = <0x1>;
+            };
+        };
+
+        mdio {
+            #address-cells = <1>;
+            #size-cells = <0>;
+            compatible = "snps,dwmac-mdio";
+
+            phy0: ethernet-phy@0 {
+                reg = <0>;
+            };
+        };
+    };
diff --git a/Documentation/devicetree/bindings/net/snps,dwmac.yaml b/Documentation/devicetree/bindings/net/snps,dwmac.yaml
index fad0d611a75c..12b59d9a7f9b 100644
--- a/Documentation/devicetree/bindings/net/snps,dwmac.yaml
+++ b/Documentation/devicetree/bindings/net/snps,dwmac.yaml
@@ -75,6 +75,7 @@ properties:
         - qcom,sm8150-ethqos
         - renesas,r9a06g032-gmac
         - renesas,rzn1-gmac
+        - renesas,rzv2h-gbeth
         - rockchip,px30-gmac
         - rockchip,rk3128-gmac
         - rockchip,rk3228-gmac
-- 
2.43.0


