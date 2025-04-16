Return-Path: <linux-renesas-soc+bounces-16057-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id D6724A8B6F6
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 16 Apr 2025 12:41:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 39C531905337
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 16 Apr 2025 10:41:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C6B0C23E226;
	Wed, 16 Apr 2025 10:40:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XDOYblip"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A881A236A99;
	Wed, 16 Apr 2025 10:40:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744800029; cv=none; b=fMYUmlvb5iuRPzP+vA9fvqhzb4xe3mU3HqkjmVQr/Et8hrkr4FP5HVYDKKgmywNp+ClvcQIl1un9PKDSKoyyde/yA6kdqYTPk71eBf7SFbRJ33uDFIBJVvxEKA18vpgI5K4DW2sInas6meeU0FGrDh9FqDNgaKstXCZVHVCTgQ4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744800029; c=relaxed/simple;
	bh=EG2TJy+xT/mshTRxL7dQ/XlSwh3htdJJdfOtXpZyHJ4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=t+AyROtuB4VruZCBsziSFDTE4pY6kgD1gipd4K8TIV74/spVeE0UcEfKdms/tOlTyxcyCYOG2DsyX2MSRzQCb+ne361fz4s5ktGgboJAwkyN7BeopEZJU//bonpv7Pp05dxrtvi/JjQEx7zCfPype1qZOtw/kwU8/pJ5iwDB3bc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XDOYblip; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-43d04ea9d9aso33585245e9.3;
        Wed, 16 Apr 2025 03:40:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744800026; x=1745404826; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PYPY26UCzC6xpsXn5isIxKrrh9DoM4t2YOrxI8T2l/k=;
        b=XDOYblipY2ltsPcweuLxB83fcRes1CZWa9rd+iT5Gh6HbdI/zQkvBymHOUB5FnmBkJ
         nLWnYg2eOiQXjoxSEbK5UiMKTYSurRs48VRADrCOJJpog+p+Dd90rDR0X2m5Z+hCmxHm
         cvJ6CO32ovDFoDOTlqVfG9nsUynsZvN4KzyxWGAazWbQJE4+0glmSq0Qp9zD6YIw+94v
         j7xZW9PwXRj4nswbVKkcGT0z2/pNmsM+fY2OtYW+UoWrhhrV50vUHS5uKYzQkBIz+WSJ
         6OY7en6o6gyQK6fR1pVc0zoYEtU1O3RpCx8JJBFVJdZHsPruHiKnF1dmoUFdJHC7QYo9
         BgMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744800026; x=1745404826;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=PYPY26UCzC6xpsXn5isIxKrrh9DoM4t2YOrxI8T2l/k=;
        b=mv5QVEqBbwL5Ve0ij2jQKak/borIg0V+sEvXu7Cr8DH0QJlSKq0FtTiE4Dy2eHM4bz
         P+msRDMCiYD+E0KUanNwQaDAEgVfyB0PuoABLTgwtiKn7O95Dh++Q5cXKKG1DHzTXRa7
         rJhZPpZi0pYvbk3nU/dIiVJZJRvRYnUh9vdQUKx0e9mzMzvy4wfRXJF+I7XGVYa48/TV
         jDQIBnveJgtSQ2OOpriTZCiiyHJTC+o6gUOQS/8o+Y7l/6KmiAuZIiv/19U4MFuc6J9+
         pywMkRTJ80EW3HYRU+/TOi/wlKJwcz9uFsS+rIC9Y3QrgBNLliJ00Qh7H6QiVyG/Ir6F
         9Sig==
X-Forwarded-Encrypted: i=1; AJvYcCWezf5MdU+EqcTg0gCK5nXNKLKnE2EuWI5ywMuA5A+SZ3i5gCn3JxLn75j3CQQ0LAMa+gJUbgcYS307@vger.kernel.org, AJvYcCXVtTvSh+IJjj8Qtv94MBd+AaSRyu7hFDofzs7S5DxU3ZritihBlWvygq5Rn0gy/mliUfL/5tBPe9CmEa6uvkY/ir8=@vger.kernel.org, AJvYcCXyVyvbsmVI2AgZcFXfe6ZM4khD8HT+WZ3V1qX0bdfTxHlHW5UAHekumycuTmz1mJWDGP7UlQ/9AvcFj2Fi@vger.kernel.org
X-Gm-Message-State: AOJu0YyCsIM3mWCYVz5CDFwxqt6z12OaoamrZAxGU5HA2nseuAV8vh53
	ioPL5471XxfGaDAWAY84OZgclhW7itgUAFe+hMTV7HaycTyJw64O
X-Gm-Gg: ASbGncvFoRp+2u+qEca0QTt3V0BjdYwauV6PB7XHtU/yDeaTNKbYENOr9vnq8cZGVsU
	JpvP0ghw3/7NYwXO+zUY1mOPinAqwSGcmPcyPNXglorJv2lY0buv3wdnUoV+aE9v+QM2d+wi5Dg
	sl5WUyz3O5T6JjsuIUeD0s8efyN2cATGRI+sF/UBw723v0IzphTtxPXNZ00rDP1uvypO22pGQkA
	DxgqJr5mzCEEMgkI4EmGG8YWTIsIEkkuHiSFBtx7LSWtTCLPdiG9qVdwhiAJ4YBHJBwjHkz92kf
	hL9kDHZcOfnAgVuEPYCEgL1UspCnteDOwYshrxJy+8PJ123ZRNDeQ/YyRlKqc9mDOw==
X-Google-Smtp-Source: AGHT+IEhNYkBFxeeFiTzdbNXA7SHBCACPNzovhEn9/y0N7Tlt/GB9Ug0Q45n0cOq5XCYzmndSxKgGA==
X-Received: by 2002:a05:600c:4514:b0:43c:f689:dd with SMTP id 5b1f17b1804b1-4405d637875mr11526845e9.19.1744800025600;
        Wed, 16 Apr 2025 03:40:25 -0700 (PDT)
Received: from iku.Home ([2a06:5906:61b:2d00:b4a2:e121:10d6:ac54])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-39eae964089sm16824975f8f.15.2025.04.16.03.40.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Apr 2025 03:40:24 -0700 (PDT)
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
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Richard Cochran <richardcochran@gmail.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	"Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>,
	Giuseppe Cavallaro <peppe.cavallaro@st.com>,
	Jose Abreu <joabreu@synopsys.com>
Cc: netdev@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org,
	Prabhakar <prabhakar.csengg@gmail.com>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH net-next v7 2/4] dt-bindings: net: Document support for Renesas RZ/V2H(P) GBETH
Date: Wed, 16 Apr 2025 11:40:13 +0100
Message-ID: <20250416104015.47788-3-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250416104015.47788-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20250416104015.47788-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
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
index 4d4fcaeca8a8..b525eca53850 100644
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
2.49.0


