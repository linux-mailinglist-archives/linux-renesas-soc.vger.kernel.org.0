Return-Path: <linux-renesas-soc+bounces-16105-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E1DFA916B1
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 17 Apr 2025 10:42:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 6ADD57A5E0D
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 17 Apr 2025 08:41:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BF495227599;
	Thu, 17 Apr 2025 08:42:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="g430fkKE"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB335225A29;
	Thu, 17 Apr 2025 08:42:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744879323; cv=none; b=Yq3MOExxMQvQlR2Zd11CX3ODbyttqDkGK9o6BrJ4Y1qUwEG0b7zCm9ndUbcNPZvaWHMt+KQAnwwBR4LgNwxWJdLZioBC1J83fVcCa0pnez/cbjObQBGdqeZmhQ2jnzSekbI592NtJqQ62xOGUk4cewIt7CYrUW1Dd8em0N18JjI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744879323; c=relaxed/simple;
	bh=EG2TJy+xT/mshTRxL7dQ/XlSwh3htdJJdfOtXpZyHJ4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ErnkL6GByMvaa8m/Yl5m3NJ+AgiKPCXXSLy6ex0BjpQ04qOaYceohAH+LrpoqBKjYFaAQEhdNv1Ps1OSeNoy/44Po4wIYC4iDRUhP1XjsO7AjkiScmoNvtgUrTvBY79qOSTTAG41xY4Rvf0SQU3y06A15WA7FYs10RTgbKjXtKo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=g430fkKE; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-43cfa7e7f54so3265435e9.1;
        Thu, 17 Apr 2025 01:42:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744879320; x=1745484120; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PYPY26UCzC6xpsXn5isIxKrrh9DoM4t2YOrxI8T2l/k=;
        b=g430fkKEDeCyAsNXFOW0kjsKJU9Y0H9sdAWkK8PyWJWdF8oRd3Cpik9Xbl2f7bcnBq
         au3kOKTzWIpVXmVMuSlfLknUvNq7gIlTggC0I/KTeulr8NJjPCguEaXu3ujTqR3ewyvh
         ow6FhpgrTHHv1s6nd92jSgix/NEaJ0ihLQWI4JCsJCHwpp8WO5Db7uGTWdKjISKr8Ul8
         6NMhO2wpj9U861GoaaZ1Y6bvsKyRN6BtceLEqkhN3gfcU5eXUq6xD//UDbTqAEh4tq5o
         uwmIuF1H0snMVxbhFDqL+bkGDKzP4MAUsJst9/nUbhKvfkVtRvyR7cMwBBE3XrVny1gb
         fS/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744879320; x=1745484120;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=PYPY26UCzC6xpsXn5isIxKrrh9DoM4t2YOrxI8T2l/k=;
        b=b2hhMpFhgSYJLIy+7AUDpOlhw5CE75psDvK5aHuxZQpSBipVTaY8ilCF/6ZiFKl5nC
         u17Qnv+7z8yLFxNbeoK/V6uwMbyJrdKDjTO/uorAD9TnXb9FqTJEu20GoADqU6OmhIbN
         wPkkfQ1LkDI1POl/Y4NWycFIrOT2V6XoipyctmPFGBOUnOHBqnV5Z+EvAm2+lT4Lil+N
         kx0GZ4JmvuGJpETzJjBaNC0Y78rE9U/L9SFV0H2ekjEsR09/wN/MpCoH6H1puL0SJrH6
         zdL84snShzqw5lqHymWUGamm7DS17+Kbg7FGYoswJINeWEOSqRIU0ZWQDuwjdkhEaB9j
         idjg==
X-Forwarded-Encrypted: i=1; AJvYcCUxvG1fJIqUCcVhMZVfmd3h4gWwvFSPbVoHoc/BcekP6ZfKxaD6Gp2FaZKs4yc9ZKxurUM3cBM0/BtcZecF@vger.kernel.org, AJvYcCV6c/Sty8+PTZX4NB//MuLU4LVKJGbT0wPzX+2siSCofeYcXLV5eYxKDejTPjnLuBPtJeIatNT3hVRC@vger.kernel.org, AJvYcCXVmBiortPD8D+H1krPrQvznW/sW4AnhapH+qBkvg78Z0cktft4sDXMYJO7c9XXO6XHw/6gDgujNZc2wz8rTfMqlFg=@vger.kernel.org
X-Gm-Message-State: AOJu0YxDRWoedxh9+6OOKSj+RQJb7CXJKioeRA33aNvFRZqB8SQkXbIi
	TXMfpuTJe9rVVtqe2hmOyetkrVuJigMK18HnWH0xexbBRJjfInUt
X-Gm-Gg: ASbGncuhv5JQcYMn139wFMVQBn/UJysl9CRK8LujFjAGMmy0zQcDPoT5eep/gzcLyad
	Z39eJ0XY/nxYGTCGNTC25Z/D9H5HwKukHQgeVXNvuX9HBxGmUizjKeogV7DOKF8ohF6q3sr4WzP
	S5JuG8hJ9ft68uILGQP3b/8uVnl+kf8UejdlPOV24M3t0HH2MIaccwyZvOM9ULLOjd6qFqWbqH0
	dt5EbxX7hpDgxPol0TLk83Y0EYkOKjASiMpLU4zLHh8YczU0GQJGV1qmZKtZv6wDmLuxFDHUVem
	AYdwnmbaiIhjb2HUq0kOcMhQxcpf4ojRzDR6v5SuqyYtcuMaX9931tdM5cNH0lT/
X-Google-Smtp-Source: AGHT+IFynTYfa8X2xhRO7qXL/U/Mq8GTLpDvB1j+B2mrksvQzaj9ofIgmgKAy73wvJt2ta8KPY8URg==
X-Received: by 2002:a05:600c:1912:b0:43d:b33:679c with SMTP id 5b1f17b1804b1-440636a4b0fmr12905845e9.14.1744879319941;
        Thu, 17 Apr 2025 01:41:59 -0700 (PDT)
Received: from iku.Home ([2a06:5906:61b:2d00:3f0f:d684:f4a:34e6])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-39eae96cf1asm19657712f8f.39.2025.04.17.01.41.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Apr 2025 01:41:58 -0700 (PDT)
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
Subject: [PATCH net-next v8 2/4] dt-bindings: net: Document support for Renesas RZ/V2H(P) GBETH
Date: Thu, 17 Apr 2025 09:40:13 +0100
Message-ID: <20250417084015.74154-3-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250417084015.74154-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20250417084015.74154-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
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


