Return-Path: <linux-renesas-soc+bounces-14300-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E16AA5D274
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 11 Mar 2025 23:18:22 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 38CD8172A75
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 11 Mar 2025 22:18:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 66743265CB5;
	Tue, 11 Mar 2025 22:17:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Mmn7nKV6"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6BF3F26560E;
	Tue, 11 Mar 2025 22:17:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741731473; cv=none; b=sVuq/WkAtMCaiO3/BepPVb4XQkkjgSX20Ccf5AKnthzxFkBHEnW3OWj06YzZU5S9o131pWJy7LgqbzeRJKHwEKFWtOG7KRXlNAO4VIvtC1qmf7cnArRS/d56tv41gjZ7/V+njVMcxjPckHhfC6xfOEn1xjQ9Ci2EOapPDBHHhC0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741731473; c=relaxed/simple;
	bh=GnZgt0p1cHJgqloT+dxm3S5B2DSnJC9ppO0ZwXUNn+0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=tQL3n6g8gjV5aXcm4ZS7jYEa00CJetEnQSwWIt5EAkyAJmMo9YAsjNyD9EIlxbytGgzhCTGST06sBYOqlQA9Nz5aUAt+JI6jx5ll0HJUvqwdD27gPKrieSoBx7mVtaznV67Hznk5WwdgFJhYO9cKnJLbRaSqZsta3EPvb8cxS5o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Mmn7nKV6; arc=none smtp.client-ip=209.85.221.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-38f403edb4eso3302532f8f.3;
        Tue, 11 Mar 2025 15:17:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1741731470; x=1742336270; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Nm3VdqzmqAL0VKPU7YY3DLylGS7ZG3r2NtmscuVXaG0=;
        b=Mmn7nKV60QvGsadEulfwpTaAGhX+mqpMh4J2bt3ca6jPqnercuONaWukvKXuN5S6bR
         BpJ7WpdSd69KV2DMt5MNqzfSV1qRRjkx312APUUZSi/rxUrS4EbMhIjZiqJMNMYcTImP
         HkL53G6NAdjh4/13a3jhjYCKAx536dp1DLC1vSgh8v7oOoCEjS9LGP0L+fRWHh0FDYsA
         IBhadCgU0HypuU0IRT3+i/m51vDOQqkQ/z5y2PPBNZhQSp4ZD/vURB9LH3qNtnPLGtiH
         1+aU38BT9mCp9A3TGw+th2MR/E6Q+sfiohiyFUVJX80TG5VauedLq3AyajapvaTWuSUe
         1Pdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741731470; x=1742336270;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Nm3VdqzmqAL0VKPU7YY3DLylGS7ZG3r2NtmscuVXaG0=;
        b=TVxKl8qSE6u+VzRfdwiqj/t5FHorhKOn1dq+ERi0KtNyGjGSUpc8ONZ0eNIaSwWfoJ
         w+WrJ355+tcKxgkZjADVY7wRGA/7kkKgG4zsbQ9O8L2ElMUhOZdFCQKL23AFYlGdXDEw
         OMyfTgGX/DwcMWmYf6H22ZZjNx7BmcKsAbXqHT955qZKVD1y3PxQ4OU1n3o5cmrJVIhz
         uXYb5TTharAmUcZH9fOskNKTtC03FMsS5/uc6cb2z1Xr5ZuwzU6SliaZQIIW7IGu6aHK
         bAMQX63orPY58WIlJdSTXX6Y+giOLhTc9IwSBvUlCNRshVCZiOvzcVfdqkw6CQbmIcMu
         TGdQ==
X-Forwarded-Encrypted: i=1; AJvYcCU13lsaUnlxtXFska+3w0EHB+GSULoQeRH/YdKj/SLBU30Fox9nVCPNqhpGmnpXAHrIFdER4TZXlCMiYiwxoFF7qV4=@vger.kernel.org, AJvYcCUmKihAcwE8Rg2O/nnhhXBbQXaBO1m0UY1nOrVUrjW14FeqBguBmCfbsIqdzeo8SVFtLf4NWHWsevCt@vger.kernel.org, AJvYcCWhqoOEPvPhVkT2gjA/eu0s0aZKjNx8q5vSVXYUjVHfBbB6aAgrPc81Qie5ooV08zfJRO9+/WzJj0AMX2eE@vger.kernel.org
X-Gm-Message-State: AOJu0YzhSGW3w1gf3IE2H+NTySo+y0/YTZSXXEpvtvAM0xzSdk20hCwX
	u82jLRaaf8oTeFQSdP/25tYQvc2p2+Zr+gWYsP+AD7qQm9LLwX4P
X-Gm-Gg: ASbGncu7sBt8ALoFZEmCdpcTj2VoiGdNKklwZBD8/egCowmXaSxkS5fQCid9cYuIeve
	60aVEtb4RxdeYW12J3k63BKYwf9SH+qAGEEgfCD+s2u6F5ydU2N6kcmEQGkiowEqzaj0zBAloR2
	svob3QZtfRRJhEtHgwwG2tu6F0oiCpQH665MKALhs8xdPdg12g6rLa9zCLk4XDUWNDtHlv/P9+G
	QQbJkAjcFbC9wF7Bi6j9ywEJVshhD0aNxlpLEFV0ySY4DMYO1G5AZ+qtcr1LAOn2ZduNMr/VNKQ
	cAUes2ESQ06COxmpXQZs/t8iO0OzjLrzK/QfTmb90scEtSbFTZCvmuIbrOUB+lcgi9Niv75j
X-Google-Smtp-Source: AGHT+IEpd0kZpyxOklIuriCDQQiY2MNUBU5ySqCrJwuHHmUb8LyHOCyqQ8KwNLgAqybeCQQCGa0xzA==
X-Received: by 2002:a05:6000:2c5:b0:391:10c5:d1a9 with SMTP id ffacd0b85a97d-39132d82751mr14250196f8f.31.1741731469647;
        Tue, 11 Mar 2025 15:17:49 -0700 (PDT)
Received: from prasmi.Home ([2a06:5906:61b:2d00:a6ad:9216:2ab5:120])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3912bfdfcfbsm18782252f8f.28.2025.03.11.15.17.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Mar 2025 15:17:49 -0700 (PDT)
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
Subject: [PATCH net-next v3 2/3] dt-bindings: net: Document support for Renesas RZ/V2H(P) GBETH
Date: Tue, 11 Mar 2025 22:17:29 +0000
Message-ID: <20250311221730.40720-3-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250311221730.40720-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20250311221730.40720-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
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
Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
---
Hi Rob,
Ive restored your Ack with below changes, please let me know
if you are not OK.

v2->v3
- Dropped interrupts description from interrupts property as
  snps,dwmac.yaml already describes it.
- Dropped snps,en-tx-lpi-clockgating as this is being marked
  as deprecated.
- Updated Rx/Tx interrupt names to match the regex from patch 1/3
- Listed Rx interrupts before Tx interrupts in example node for
  consistency.

v1->v2
- Updated commit description
- Updated interrupts description for clarity
- Updated interrupt-names for clarity
- Updated example node
---
 .../bindings/net/renesas,r9a09g057-gbeth.yaml | 201 ++++++++++++++++++
 .../devicetree/bindings/net/snps,dwmac.yaml   |   1 +
 2 files changed, 202 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/net/renesas,r9a09g057-gbeth.yaml

diff --git a/Documentation/devicetree/bindings/net/renesas,r9a09g057-gbeth.yaml b/Documentation/devicetree/bindings/net/renesas,r9a09g057-gbeth.yaml
new file mode 100644
index 000000000000..02a6793c26f5
--- /dev/null
+++ b/Documentation/devicetree/bindings/net/renesas,r9a09g057-gbeth.yaml
@@ -0,0 +1,201 @@
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
+    minItems: 11
+
+  interrupt-names:
+    items:
+      - const: macirq
+      - const: eth_wake_irq
+      - const: eth_lpi
+      - const: rx-queue-0
+      - const: rx-queue-1
+      - const: rx-queue-2
+      - const: rx-queue-3
+      - const: tx-queue-0
+      - const: tx-queue-1
+      - const: tx-queue-2
+      - const: tx-queue-3
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
+                     <GIC_SPI 772 IRQ_TYPE_LEVEL_HIGH>,
+                     <GIC_SPI 773 IRQ_TYPE_LEVEL_HIGH>,
+                     <GIC_SPI 774 IRQ_TYPE_LEVEL_HIGH>,
+                     <GIC_SPI 745 IRQ_TYPE_LEVEL_HIGH>,
+                     <GIC_SPI 768 IRQ_TYPE_LEVEL_HIGH>,
+                     <GIC_SPI 769 IRQ_TYPE_LEVEL_HIGH>,
+                     <GIC_SPI 770 IRQ_TYPE_LEVEL_HIGH>,
+                     <GIC_SPI 771 IRQ_TYPE_LEVEL_HIGH>;
+        interrupt-names = "macirq", "eth_wake_irq", "eth_lpi",
+                          "rx-queue-0", "rx-queue-1", "rx-queue-2",
+                          "rx-queue-3", "tx-queue-0", "tx-queue-1",
+                          "tx-queue-2", "tx-queue-3";
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
index bacec6e6514b..7280886d03a7 100644
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


