Return-Path: <linux-renesas-soc+bounces-14608-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id AB3C4A67E63
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 18 Mar 2025 21:58:47 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 480343B4244
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 18 Mar 2025 20:58:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B3BC4214223;
	Tue, 18 Mar 2025 20:57:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="m+5OoxQ6"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B36612135BC;
	Tue, 18 Mar 2025 20:57:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742331476; cv=none; b=gFfu5oKX9n87Ib80t9+e82Gv9WuCOI0ZTVITG9Km8XlNa2LoKza/RKlhRUGu3bjWRDL+RYFcymbzUq+VUTFDsJOHtmB8LxzqMpS9yNaG2CcejfOW2TfAfIyfVrzrsvQBtMTqOjwB3/6vigeNFIszXYI62Foq6qHYYH7Z0OTfDc8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742331476; c=relaxed/simple;
	bh=iSX683jIYJ5Nbv8GosXqC/1aA+Rmp/P6MFB3vJYXDXI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=XduZrlBLTT/TOA47VWje0M/6x0mJFQGB0iqvCsIeKY36FcIEK+vVaAw+ytpelhJ4CL7BSlPMSYfa5h94jTdxZEnJ96ufg+b2L0PuXz77soZgQ7ymUxTgmUOytR0l7KaGz6YPkwhfZ3dc5itW66buRydBnVqk1VASZfjCzhWTACw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=m+5OoxQ6; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-43cfe63c592so42040085e9.2;
        Tue, 18 Mar 2025 13:57:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1742331473; x=1742936273; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Xs7vUt1wverkf1Iu/m6fNn9VLl/O1RwCIir4usjCQLk=;
        b=m+5OoxQ6PlL6hAXkSv4JtEonFwC+v329SyhueC8p/LQD94gD0raUUzr9WpSbTKiNcZ
         vGTXvVbhGu1pKbHhUSqD3FkKr8gMwrWcHNWqE5zuEu9qRI0IpwEOU8wYxGJQpPbsiHdE
         BsZbPCV3wDqAT4nuIaaII30jxHccq84l5yXTTIBD7WBjPpoYoWq4a5XgbkH5xWUcVUut
         sYsZIpxn1EFYpdQbT9PTleTjh75ETKTdwE0Qxx896yPBy/kQJQT5jzGhWiiz9fO3Kg2c
         So5fAvWU7oQNzAz9ZjA+pkmdNbayiOYGDOtJ8TkXN2inQUyO+TJIlif0C0XmONFDWgfx
         QWAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742331473; x=1742936273;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Xs7vUt1wverkf1Iu/m6fNn9VLl/O1RwCIir4usjCQLk=;
        b=uKK0EjLhH0bVE9CnLyW0h8OxjePsSCQ4L8/s+mTVQpvU+w0qH/TsdNH0O611qSH1gE
         3yJTss9Acv7fKFmy4v4RaYwnJQATYdnluWAGh/fnP4O+NTKt8+qptkwfO9+jKmXAl9FE
         qh9u6jKlbS2zUpY4Ght+9wku1m1HKT0T5ReQTTK5NcrocB0gLFItzIWVAG/BKax0TuBC
         ubLdISAKfwjf5aqy4oYF25uBPJ3wtbocwJopvXHy2U3LhpxSElBp2RjaGIS8icUSOlq9
         KyJQcNJWxQSkBC18hJDuVzQJ4NKvnRdEPAJiRXwFJPnqzcTE0ZEDGycfXP2kpcI3jGXL
         9wfw==
X-Forwarded-Encrypted: i=1; AJvYcCVAtxSjsanKNVYT2MR/AlhAbMjtei81CRbU2gj9pZ90QbEx1qADkzPrpnwPb8AxA+vr/nlgyqMi/dSijYssI409w4k=@vger.kernel.org, AJvYcCXR+9d5KsAVDWUu+yNuluEqemJQMYQiDRnpwDXQ+KQ8ytlvWZVlQm77Xh27WjW9IoVf+/3b7ID+@vger.kernel.org, AJvYcCXoWRiVasF1aj5rNHUAnKdrDRm9kyjt0Cy6W7h2ENxaGZvjInj8wYWFyMOB9YuX55JYZopl6oLQyh9uuEo=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx2egeCHClSgl7lM3ZCzK52kgl+eMb7kRkI4lAsuVGem7Il3/1Q
	2bK0BZhOX+BgqGatOpEkZqZwmy8wBpG6JIfi2lHEgZCpj1lPZoPP
X-Gm-Gg: ASbGncvClyX60pKUfRwl3iVtRbKmeT76KJ/2BIo869ZZuU5SIZKj5TwhyBvGk1NqKll
	HOtR93um/cGoe8esbNa1ShzOyMtC0PonNsJ8t2YJndFLUkaE/Bs/FaIT5dNVynFryH8LrWTvpsA
	zRg2fmLEJ6XP7qM8rHvKL/m1ZKIon+bF3XZOmGD5RR23n5r+Bzh1RbD5BaWJnsNKz3D0XA459w3
	/nRQhmDPgzLWGb9xUC7at55mImMKtT/CKfzuoWBhq4HtMybfCGkp06y4T138n3aqjjIIGJQoGKp
	bE76IM4PmtWZJ7WR9aTFbkIDZb5SAVqZmU91QsA69NSvBGQTicyEPvQeK0+ZJ/iYxz274w==
X-Google-Smtp-Source: AGHT+IH9BhQMKh8BMydKoTUyoWRGW65UGlZYRSRUKhZ3QhlmVeX23Bpkmn2is3XEJmZ8mKDebYhAJw==
X-Received: by 2002:a05:6000:21c7:b0:399:728f:4673 with SMTP id ffacd0b85a97d-399739cbd2amr171087f8f.33.1742331472830;
        Tue, 18 Mar 2025 13:57:52 -0700 (PDT)
Received: from iku.Home ([2a06:5906:61b:2d00:9ebf:9797:69d8:2d33])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-395c7df3537sm19212864f8f.8.2025.03.18.13.57.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 Mar 2025 13:57:52 -0700 (PDT)
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
	Magnus Damm <magnus.damm@gmail.com>,
	"Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>,
	Giuseppe Cavallaro <peppe.cavallaro@st.com>,
	Jose Abreu <joabreu@synopsys.com>,
	netdev@vger.kernel.org
Cc: devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	Prabhakar <prabhakar.csengg@gmail.com>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH net-next v4 2/3] dt-bindings: net: Document support for Renesas RZ/V2H(P) GBETH
Date: Tue, 18 Mar 2025 20:57:33 +0000
Message-ID: <20250318205735.122590-3-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250318205735.122590-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20250318205735.122590-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
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
v3->v4
- No change

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
2.43.0


