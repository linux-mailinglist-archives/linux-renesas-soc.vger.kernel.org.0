Return-Path: <linux-renesas-soc+bounces-13864-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A9EE5A4B3FB
	for <lists+linux-renesas-soc@lfdr.de>; Sun,  2 Mar 2025 19:19:05 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 5340116B1E6
	for <lists+linux-renesas-soc@lfdr.de>; Sun,  2 Mar 2025 18:19:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1DD871EDA1C;
	Sun,  2 Mar 2025 18:18:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="C7slgQuG"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 219301E98FB;
	Sun,  2 Mar 2025 18:18:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740939516; cv=none; b=MkGQvS9UU2Pbq+0jyJY8j3DZDgXJ0yfjib2JtucOYB9VsayXWq2Xvb1kJ/kgcpPKWzVEyECzRQVIt6MCMgldyxVQJP20HxMJj9Cm1NfSAOpXze7NIb6nYuhnmZtY63pccduW0FtydQU8yViLx7Bh47PWGq5CbqOTx3HnSm8QdQI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740939516; c=relaxed/simple;
	bh=7nPlyLTN9l+5bXhOTeLRfAOR5S1tEuOZpipaERFySds=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=saGUwN3r95sqe7UpDHpODE3rIHZ5IvnaF/8eTXLv51b+h5WSkaB/uKLNzrh6z/9i/3Yen2Ldfe9ttzjnmZADSsEAKj9I4fZ7QuKx7xh7fVLsvhabwIm5XiqohJwy0Fwt8UoGUGpfwtb96beymmAymlFtg44Wzx7hzqjpDZlfMJU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=C7slgQuG; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-43994ef3872so23556255e9.2;
        Sun, 02 Mar 2025 10:18:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1740939512; x=1741544312; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NDBW2q3M0deONDZeokOX4uP5Rzzuq20Nsrag9Ww2BHc=;
        b=C7slgQuGZm0gu2frO9MKKOCeDnM21M3YsV6qlfAHHQS8/ySsXWJW9NdOZKvwXNtYEM
         ZSSh07BinPyG+LeUWviEOQm1A1jcK6ROUceEv0/ZIQxBrOoCl4XSDz0lW1C+wb+seRid
         EdLsy2zkcQLmVTEr+FvszcduQlDaNQJgCFOM+3vw2TjccGpYUJQ3Mhgg1aTKvYXcGnfk
         yVvM8szAQ1YIKuVCK/dVfqNHxlw9Vv8XXnJ/6tH4K0lH7X2Ba1TRpJHfpF1hpWHD1Al0
         G7HJXmwQyPZnsXGFe2KN+5fJs4rDhH0+K8+w+SKBrRVXo1J4IpTnLZj33R1UMMRijWeJ
         oRMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740939512; x=1741544312;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=NDBW2q3M0deONDZeokOX4uP5Rzzuq20Nsrag9Ww2BHc=;
        b=q7KuYvy4lSAM1CSgHkNvnvhvqZuc1a0aN1/mlYBm3zP64ECR0GyLFjBkWYdgL+gKBP
         ulKsYND68aKgeVCcqjnoAuL+632MYxVLBXcCit1NHzpWlTziNuFlLdN8zYpZRpjdwaL3
         cPTkbmcxHQDtqki7TuzovKoRStfgLGDATmCFTEslGL3kEJSYDgZcjvlLnsExF/CoEaDv
         Yvm/DCxzfphVws8612Ei40QWw8ejf1Rx6bbMkj42qa+IVgwGlcVmSuLrbmbZWbchqURF
         yZRKaAL30WLTU7aMyAMhcxlHi89bo7ohGPFqDq1xmVEU5GQ6JroTfv9E1AalIUZOXtY/
         xDUw==
X-Forwarded-Encrypted: i=1; AJvYcCW9uc/JaHI6MV7oSkGIB4WDukFxwIeUxwrU5nokHdVtkmKbWUtDmAUwIaI0BV5z281iFT6i9OCewQq9m6fWCcfYkhI=@vger.kernel.org, AJvYcCWsL0oC21u5rwp3GVQF4Z6n7kPf20jB4xKGrwyGsEmE+Fmjtr8VBgFiEzRD538dxBsK4ZAdjC4kjHkkGDo0@vger.kernel.org, AJvYcCXtAt68YSDZtjMxMgbBJcQ3s1UKSNsxj4LB77TGvbdWB/8mcddKs32HGCGcyxWNw26KRrITOU1bgE10@vger.kernel.org
X-Gm-Message-State: AOJu0YxKtRNdJNjrewuc83utDHOpAZ9CArjOk38OOr7auGl3JjfbOrIB
	2MU2qEx12SD4hDIX4NB5N85+KRkSPlGHF0TfQRAlTdtFMY2RHk1I
X-Gm-Gg: ASbGnct8KIMRr0SAjJYzlSPHN4zGiEkDb8c2Y4iNX8X7Lgzdg7/si3WLA8r+h2NrypV
	V7JYMNeHQWEruYXC3Mt3NZ9ATsBXc1TJt5Cb/7kifLBIqGocscEQQz83WRatea0bPqYfgO3+l3i
	IMnGMSas8WTxziNckcJ0iJfUDL9X/pKzoG8IeBovjUYD5R+6ysl6F+/N540/frgmrSoC2pxeMB4
	0HVJQuXgo5lLhd/R4dIIqf0c1Zse5SaB07mKLMz79shGULCNNQAgSlnx8BOcLtSdNYqbY7wSRzR
	Vp8DKDDycCW172AIFjL4/lJJgUT/rr+G9H1bxX4aBWJNJSeNHXVUdPvXVAyBEUmNW87RzvLEtw=
	=
X-Google-Smtp-Source: AGHT+IHxZGV7y1MAUNF1zNpXDDKHtXPRLCh/xQ4B9uK51zlu+YCi7NcHGXVIabk7vmAWpgz91Od8BQ==
X-Received: by 2002:a05:600c:46c6:b0:439:942c:c1cd with SMTP id 5b1f17b1804b1-43ba6704504mr98147285e9.15.1740939512018;
        Sun, 02 Mar 2025 10:18:32 -0800 (PST)
Received: from prasmi.Home ([2a06:5906:61b:2d00:989f:3a70:8430:2268])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43bc1b5db02sm9552655e9.19.2025.03.02.10.18.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 02 Mar 2025 10:18:31 -0800 (PST)
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
Subject: [PATCH 2/3] dt-bindings: net: Document GBETH bindings for Renesas RZ/V2H(P) SoC
Date: Sun,  2 Mar 2025 18:18:07 +0000
Message-ID: <20250302181808.728734-3-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250302181808.728734-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20250302181808.728734-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Document the device tree bindings for the GBETH glue layer for the Renesas
RZ/V2H(P) SoC, which integrates the `snps,dwmac-5.20` IP.

The generic compatible string 'renesas,rzv2h-gbeth' is added, as this
module is identical on both the RZ/V2H(P) and RZ/G3E SoCs.

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
---
 .../bindings/net/renesas,r9a09g057-gbeth.yaml | 212 ++++++++++++++++++
 .../devicetree/bindings/net/snps,dwmac.yaml   |   1 +
 2 files changed, 213 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/net/renesas,r9a09g057-gbeth.yaml

diff --git a/Documentation/devicetree/bindings/net/renesas,r9a09g057-gbeth.yaml b/Documentation/devicetree/bindings/net/renesas,r9a09g057-gbeth.yaml
new file mode 100644
index 000000000000..dc23e7f401cc
--- /dev/null
+++ b/Documentation/devicetree/bindings/net/renesas,r9a09g057-gbeth.yaml
@@ -0,0 +1,212 @@
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
+      - description: Per-channel transmission-0 completion interrupt
+      - description: Per-channel transmission-1 completion interrupt
+      - description: Per-channel transmission-2 completion interrupt
+      - description: Per-channel transmission-3 completion interrupt
+      - description: Per-channel receive-0 completion interrupt
+      - description: Per-channel receive-1 completion interrupt
+      - description: Per-channel receive-2 completion interrupt
+      - description: Per-channel receive-3 completion interrupt
+
+  interrupt-names:
+    items:
+      - const: macirq
+      - const: eth_wake_irq
+      - const: eth_lpi
+      - const: tx0
+      - const: tx1
+      - const: tx2
+      - const: tx3
+      - const: rx0
+      - const: rx1
+      - const: rx2
+      - const: rx3
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
+                          "tx0", "tx1", "tx2", "tx3",
+                          "rx0", "rx1", "rx2", "rx3";
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
index 85d499bd49b5..b5ae3da327bd 100644
--- a/Documentation/devicetree/bindings/net/snps,dwmac.yaml
+++ b/Documentation/devicetree/bindings/net/snps,dwmac.yaml
@@ -74,6 +74,7 @@ properties:
         - qcom,sm8150-ethqos
         - renesas,r9a06g032-gmac
         - renesas,rzn1-gmac
+        - renesas,rzv2h-gbeth
         - rockchip,px30-gmac
         - rockchip,rk3128-gmac
         - rockchip,rk3228-gmac
-- 
2.43.0


