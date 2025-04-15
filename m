Return-Path: <linux-renesas-soc+bounces-16003-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D50CBA89EBF
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 15 Apr 2025 14:57:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B3E5E3A90FC
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 15 Apr 2025 12:57:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9B5932980AE;
	Tue, 15 Apr 2025 12:56:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cb/Db7l1"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 956EE297A47;
	Tue, 15 Apr 2025 12:56:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744721815; cv=none; b=VQUANU6cqodnZYyVcIVZBSM5YpQNf8LXPHZT9yQyuxap3DivyFnz6lnrW1zq1yuC/SjOe675Wu01oOyDznIOS7cGluP+avM7iNfR2F/dS5n1HXsfDrazgY2cF/CExI1nWNuk9TcbRctB6uY3wHo1fe/Cg9xmkrwZgLUwQ/OAIg4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744721815; c=relaxed/simple;
	bh=EG2TJy+xT/mshTRxL7dQ/XlSwh3htdJJdfOtXpZyHJ4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=hgL7cobz2vCuQqnmL4ugg0BfSo3XrP2a1HZJAIXaA1qapr6fSsYzuNOzOhLd4f3aI7MpFYsXj57DsbeIhHG1S7a9/IzaQdnmVlXf0p1Xe7TDp7GQUwX3F2xfPDGOIyedgUCVibbg5OJp0JM/5HByLeOaQruaw3+ImZt0/VVtoBs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cb/Db7l1; arc=none smtp.client-ip=209.85.221.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-39bf44be22fso3511612f8f.0;
        Tue, 15 Apr 2025 05:56:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744721811; x=1745326611; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PYPY26UCzC6xpsXn5isIxKrrh9DoM4t2YOrxI8T2l/k=;
        b=cb/Db7l1ALv+pTKmNeuh0k6SmxaSBK2pT/G6fsYaw/YWNsgGLQ4RrHCm387KxngYII
         QYurdjqX3fGhK2V/ns7vpRLdxnRESjHyAdlwjQeSYUJBF2poy7U4B/dKfiS4bfk0ycnv
         xHh6Qn7DxLOggzZs+dub30WNUJQdULruxkTq2lySOLZSYWg2ah0YpM23taZYspPEV/Dp
         xvryt8XMigOeE0HUCxRAVs0E8q14b1UFtivmn626JCXTdGKmNGlloV1LpigXTe796yug
         xp38hQHPBXKXphuMNU+nvGXujgZ2eXvbjOqXmA9icF+XSUQK0v4JKNzcgTvEchzXgNpf
         F+5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744721811; x=1745326611;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=PYPY26UCzC6xpsXn5isIxKrrh9DoM4t2YOrxI8T2l/k=;
        b=kIRUbYkx+ztnI3AvD4ujM3LlDMCE0M/PttOABblVLj9oBsmyPDovsGLAhzsSCkO9f2
         oQ7Pra7/v8aQlfYKivLkHMyR+9KjMl1Qra/ZS0CyViLhTHaxIyU1nRp2p0CkcUWPnNJ0
         4rP4QN1lKNawmQRb0n4Sghmucn21A6r+izIp0NacCNsNpRFSYTd3czoV3Aaz8XY+jRJX
         qsgduB/L1O24RyhNBJIng2BqmcCvHn3zpUARzK+wVOvkcKN2Y5lPSf5yVD0T3ou4X2lj
         AvO6HCHeqPa1DOtMA2jxaKwJfb9RrR280aRJMbnHgOUrKLKaIv3l8yNbY9cLRWYDrlyb
         b5ng==
X-Forwarded-Encrypted: i=1; AJvYcCUaMrYSbfO4mlhEa35P3+G/vgIEXW28PQx+FPCZgDdoBnZD3V9WpGrH1VBGKINcenAAjhWvbO6Wb1sVnwkLneVVzGI=@vger.kernel.org, AJvYcCW0ZGrr1ByWY0aPNV+CPSbHiUF8sH96xIK83tv39r15oclZDShIw9BpWeEEezjpX6pst6GhdsiBPa+QBwft@vger.kernel.org, AJvYcCXHP65oVci8U5mHoDgdIAIzLeLaPWMKGKjU/BGEP/a6Y6it2rDYD0bYa/KqKRPog/oNF/3qI6T9suOq@vger.kernel.org
X-Gm-Message-State: AOJu0Yy9ozsJYR9eIPQ8q5idSS4UcbJUIQ7QjnWetFbYc1zDE2lun7CS
	nLb8jtquMXLIw/3vV62flxQWXGk8IC1xqIz9DGYrNu9MM4d+87Ne
X-Gm-Gg: ASbGncsWg9uymDu8/3BsyzFDkTJqMtPb776y8wvCDzTjff6hyzcDJV3h/nMNXEA1ZqZ
	Z/k8u88G1n+nvXUGo8ys+YRFpBAPutq9piBDSMpjDVJJ2x57zWDmKpfKiz0hTZY4PyrlT8jbH4r
	DAK/w57+O6FUj7lAK4hJxIGJdQuM/QnyxIrfdU2j7PMUMEJdJDy92nYYM9CmvMbo2ilNuiNjyGV
	loccB4+S8AIY7R5FlRsSE9s6G7CsmvRLDmOmtXZr21QNPZYEIBD/aLuIn/e6P+6UjmUcZV6Y3rO
	C/zzV3T++/nBrzfAlL1LHqDITO3ZdDTx18yOK2fHtPQptzBqcsQqY6nOfW6nqAOX
X-Google-Smtp-Source: AGHT+IEj+WAN3UKiiamPKlLPy4YiJqmW4BceTVoWlm9S3vfGQsWZa6raYZh9S7F6MJZZAES9UXO2CQ==
X-Received: by 2002:a5d:64a9:0:b0:39c:1efb:ec8e with SMTP id ffacd0b85a97d-39ea51d3205mr12237792f8f.6.1744721810508;
        Tue, 15 Apr 2025 05:56:50 -0700 (PDT)
Received: from iku.Home ([2a06:5906:61b:2d00:1883:aa4:a265:bc12])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-39eae96bf97sm13922334f8f.25.2025.04.15.05.56.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Apr 2025 05:56:49 -0700 (PDT)
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
Subject: [PATCH net-next v6 2/4] dt-bindings: net: Document support for Renesas RZ/V2H(P) GBETH
Date: Tue, 15 Apr 2025 13:56:40 +0100
Message-ID: <20250415125642.241427-3-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250415125642.241427-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20250415125642.241427-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
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


