Return-Path: <linux-renesas-soc+bounces-21558-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 29F18B48ACF
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  8 Sep 2025 12:59:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D4E953ACB8B
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  8 Sep 2025 10:59:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EBC142F9C39;
	Mon,  8 Sep 2025 10:59:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YEeTNmhR"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD0BC2E2EE4;
	Mon,  8 Sep 2025 10:59:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757329158; cv=none; b=m5WXR3Gh+85eBVKcXAKh+cf2s6cCpP0wMyg2ur5f+OE2YhHRajWHGBSmDsGqEzi/KxyyRkn5P4EcCirUwa6UfCt8vUmvrNFzf0ZBlzcwOGOPOWq4YbNSJ+kC32XqgMIxy31xosTMUxP7GVziYVnWz6DLz1H3g2mtL3qYNPY+V0I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757329158; c=relaxed/simple;
	bh=iapixa64kjytIq8WdaD+DnYpon6Dk8Z39NYSWqnWZlw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=F3bkRN8uh5Wvs3dAp55FjMd1bIkuNXkypxaBIM9IoEeRNJDwIpTG5nLAbh85buhfzsOraI006VDzgOwm6cQJI3zMEnZmN2LgNvlPVQ+w/BgrZDvittIDjeE7teantxJhYrJdqapRuB9XKaY/UKAep9CV1/EQ5zefRfZ8nKyK/xw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YEeTNmhR; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-45ddddbe31fso10674175e9.1;
        Mon, 08 Sep 2025 03:59:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757329153; x=1757933953; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2tT1Xp52aCmTF02+8Ud3J8zJAyZxLoOv8A3lD9qbLto=;
        b=YEeTNmhRt233HxSzYdBGV32DepfOoexetEQU5bdEdjvPndOS5ZRy7t0ygFg19DzxLr
         yvRKabUpf/xs5xONsCSAPv+X+zD9qKDuWPvMCiKLKAhac9aObSllneZLWH8vFRkLToK8
         EA2o5Uv9+pVVoU6LmktywBYYM/BOqEWNVVZJzK/9wRddR4sLctzT+wu9Y4l02w/P9Ye7
         gWFBeWbcYtg4PhMnUNdVgkhxH7YllblFiqAe00+wi9ZL/UkqI2H7gCwA46gRUpprzf2I
         tqL72MKk4g8rEEq1xU3H/oUzYEjXmtBtuBXlirV93epeMZxXhUqfXnhDimUzx/5difiZ
         gNew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757329153; x=1757933953;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2tT1Xp52aCmTF02+8Ud3J8zJAyZxLoOv8A3lD9qbLto=;
        b=NMQygemAwumrEobCoMYiucI4d4+8tfrRGKCp6H/Va1OQHG6p+JB1BaF/beZKWWcRTZ
         ioeMLQyBSptESd4ZDw1r/YQp3n0JpTJbbfGAGtUzc4pUon3TrElUD11KmWnCTUnlWtdf
         Ccsa+kNTbGxjZrhkIUsiRxbo8l8HQYpH5hq0/CcSqmIdNwy5eWumNtm0RCvhfrLrmHba
         /kuyWDuwvWMnmzL27slvTp0CQEzwHv7Tv413X0o8ZVtDDCC+zEDUSXrvxJZGgUxtWjf4
         d99Dp9g0OHvlE2TZ17pdc0FRuwiLzQ8YJxj4KBFafE1dn+l44LatX35dzjfPRj6BLdhl
         X1nA==
X-Forwarded-Encrypted: i=1; AJvYcCV3LOhrsAWSm4v872BKfRFlj2aqvzrWnHOWuDLAu7fi6PN5cI6s1Drh5JZV2gtY6DJNo1WXeo1E2OfkMo0QFknxiFg=@vger.kernel.org, AJvYcCVn1TgoieWGYzwx0Qm3Z4Xo082mS6uVG7b7ONcHRLsLMFhH/f7GFcFOm1XvBiYe2CqyvdU4tvU2yOEW@vger.kernel.org, AJvYcCWpZt6OT8+KPTrXd+9yjiURic5FCoU2Nzq86er69pB730DdcO/6lpxbsjW0B42qkIbrREpFbNSKGUKVZrjX@vger.kernel.org
X-Gm-Message-State: AOJu0YzxbhCUhjtjsAhbgea7EtrMIrxz8Fc/GokC3Yjqkso9JTFl3Kol
	7XmEegV5kb6DL7AOmkBjpsOaMwgYrlwRzQt/JNeIysJr+QPzCt/OjLTi
X-Gm-Gg: ASbGncsRY0ZWn2ffshc22h2x1Gq9HjHJFTT6x2t9OaXx5T2WTcxEeQUnaT3rl//UJDC
	TMsLhB/VtcS58V1pgbtvMt2NAoYUdK6OY1O6GyiSJRTffvq980RmRofEqMpms+NaOSijJbUNgya
	wHH4cXRN9dYsyXs4q7BFjnUxkxJRAuTLPe5YAc8DNOQZS0ln/ULesZ1Ud64MJmI0jSyotGNtqru
	bcJTFV1BXaZztKB2rcMXY8gFEHbNohSIq6xElymk0LIvEkpxkseX+WbvT6qwI+/rpbaZ5mIDpFW
	oqlaG5GXfMBpu0nS2os0ELQJQcJYqO+tFc06nKMtN2ElEAsvR1mz8J9LKJibJRXPhYFciecXnbS
	a5WgtcLeNNmBH14eWY7PmEEYpv+ljGvEPijbZ8R0VibK+1+LsIpUEk1qR5B6RjTpnEEy3
X-Google-Smtp-Source: AGHT+IGEc8edQOs3dhheC9RQKQGoxTtdML+eQP6weXI+CH1pZvzlnV0eMSoMuxHSD+mTWez85Xg/MQ==
X-Received: by 2002:a05:600c:1c0d:b0:45d:d353:a491 with SMTP id 5b1f17b1804b1-45ddde868admr61847095e9.1.1757329152682;
        Mon, 08 Sep 2025 03:59:12 -0700 (PDT)
Received: from iku.Home ([2a06:5906:61b:2d00:393b:4605:1f6c:eea1])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-45ddfe0b654sm91063195e9.3.2025.09.08.03.59.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Sep 2025 03:59:12 -0700 (PDT)
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
	Russell King <linux@armlinux.org.uk>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	Vladimir Oltean <vladimir.oltean@nxp.com>,
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
Subject: [PATCH net-next v3 1/3] dt-bindings: net: renesas,rzv2h-gbeth: Document Renesas RZ/T2H and RZ/N2H SoCs
Date: Mon,  8 Sep 2025 11:58:59 +0100
Message-ID: <20250908105901.3198975-2-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20250908105901.3198975-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20250908105901.3198975-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Add device tree binding support for the Gigabit Ethernet MAC (GMAC) IP
on Renesas RZ/T2H and RZ/N2H SoCs. While these SoCs use the same
Synopsys DesignWare MAC version 5.20 as RZ/V2H, they are synthesized
with different hardware configurations.

Add new compatible strings "renesas,r9a09g077-gbeth" for RZ/T2H and
"renesas,r9a09g087-gbeth" for RZ/N2H, with the latter using RZ/T2H as
fallback since they share identical GMAC IP.

Update the schema to handle hardware differences between SoC variants.
RZ/T2H requires only 3 clocks compared to 7 on RZ/V2H, supports 8 RX/TX
queue pairs instead of 4, and needs 2 reset controls with reset-names
property versus a single unnamed reset. RZ/T2H also has the split header
feature enabled which is disabled on RZ/V2H.

Add support for an optional pcs-handle property to connect the GMAC to
the MIIC PCS converter on RZ/T2H. Use conditional schema validation to
enforce the correct clock, reset, and interrupt configurations per SoC
variant.

Extend the base snps,dwmac.yaml schema to accommodate the increased
interrupt count, supporting up to 19 interrupts and extending the
rx-queue and tx-queue interrupt name patterns to cover queues 0-7.

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
---
v2->v3:
- No changes.

v1->v2:
- Squshed incerasing interrupt count changes to snps,dwmac.yaml into this patch.
- Dropped un-necessary blank lines.
- Switched using "renesas,r9a09g077-gbeth" compatible string for RZ/T2H
  instead of "renesas,rzt2h-gbeth" and used it as a fallback for RZ/N2H.
- Added pcs-handle property required for RZ/T2H.
- Updated description for reset property.
- Updated commit message to reflect changes.
---
 .../bindings/net/renesas,rzv2h-gbeth.yaml     | 178 ++++++++++++++----
 .../devicetree/bindings/net/snps,dwmac.yaml   |   9 +-
 2 files changed, 143 insertions(+), 44 deletions(-)

diff --git a/Documentation/devicetree/bindings/net/renesas,rzv2h-gbeth.yaml b/Documentation/devicetree/bindings/net/renesas,rzv2h-gbeth.yaml
index 23e39bcea96b..bd53ab300f50 100644
--- a/Documentation/devicetree/bindings/net/renesas,rzv2h-gbeth.yaml
+++ b/Documentation/devicetree/bindings/net/renesas,rzv2h-gbeth.yaml
@@ -17,63 +17,111 @@ select:
           - renesas,r9a09g047-gbeth
           - renesas,r9a09g056-gbeth
           - renesas,r9a09g057-gbeth
+          - renesas,r9a09g077-gbeth
+          - renesas,r9a09g087-gbeth
           - renesas,rzv2h-gbeth
   required:
     - compatible
 
 properties:
   compatible:
-    items:
-      - enum:
-          - renesas,r9a09g047-gbeth # RZ/G3E
-          - renesas,r9a09g056-gbeth # RZ/V2N
-          - renesas,r9a09g057-gbeth # RZ/V2H(P)
-      - const: renesas,rzv2h-gbeth
-      - const: snps,dwmac-5.20
+    oneOf:
+      - items:
+          - enum:
+              - renesas,r9a09g047-gbeth # RZ/G3E
+              - renesas,r9a09g056-gbeth # RZ/V2N
+              - renesas,r9a09g057-gbeth # RZ/V2H(P)
+          - const: renesas,rzv2h-gbeth
+          - const: snps,dwmac-5.20
+      - items:
+          - const: renesas,r9a09g077-gbeth # RZ/T2H
+          - const: snps,dwmac-5.20
+      - items:
+          - const: renesas,r9a09g087-gbeth # RZ/N2H
+          - const: renesas,r9a09g077-gbeth
+          - const: snps,dwmac-5.20
 
   reg:
     maxItems: 1
 
   clocks:
-    items:
-      - description: CSR clock
-      - description: AXI system clock
-      - description: PTP clock
-      - description: TX clock
-      - description: RX clock
-      - description: TX clock phase-shifted by 180 degrees
-      - description: RX clock phase-shifted by 180 degrees
+    oneOf:
+      - items:
+          - description: CSR clock
+          - description: AXI system clock
+          - description: PTP clock
+          - description: TX clock
+          - description: RX clock
+          - description: TX clock phase-shifted by 180 degrees
+          - description: RX clock phase-shifted by 180 degrees
+      - items:
+          - description: CSR clock
+          - description: AXI system clock
+          - description: TX clock
 
   clock-names:
-    items:
-      - const: stmmaceth
-      - const: pclk
-      - const: ptp_ref
-      - const: tx
-      - const: rx
-      - const: tx-180
-      - const: rx-180
-
-  interrupts:
-    minItems: 11
+    oneOf:
+      - items:
+          - const: stmmaceth
+          - const: pclk
+          - const: ptp_ref
+          - const: tx
+          - const: rx
+          - const: tx-180
+          - const: rx-180
+      - items:
+          - const: stmmaceth
+          - const: pclk
+          - const: tx
 
   interrupt-names:
-    items:
-      - const: macirq
-      - const: eth_wake_irq
-      - const: eth_lpi
-      - const: rx-queue-0
-      - const: rx-queue-1
-      - const: rx-queue-2
-      - const: rx-queue-3
-      - const: tx-queue-0
-      - const: tx-queue-1
-      - const: tx-queue-2
-      - const: tx-queue-3
+    oneOf:
+      - items:
+          - const: macirq
+          - const: eth_wake_irq
+          - const: eth_lpi
+          - const: rx-queue-0
+          - const: rx-queue-1
+          - const: rx-queue-2
+          - const: rx-queue-3
+          - const: tx-queue-0
+          - const: tx-queue-1
+          - const: tx-queue-2
+          - const: tx-queue-3
+      - items:
+          - const: macirq
+          - const: eth_wake_irq
+          - const: eth_lpi
+          - const: rx-queue-0
+          - const: rx-queue-1
+          - const: rx-queue-2
+          - const: rx-queue-3
+          - const: rx-queue-4
+          - const: rx-queue-5
+          - const: rx-queue-6
+          - const: rx-queue-7
+          - const: tx-queue-0
+          - const: tx-queue-1
+          - const: tx-queue-2
+          - const: tx-queue-3
+          - const: tx-queue-4
+          - const: tx-queue-5
+          - const: tx-queue-6
+          - const: tx-queue-7
 
   resets:
-    items:
-      - description: AXI power-on system reset
+    oneOf:
+      - items:
+          - description: AXI power-on system reset
+      - items:
+          - description: AXI power-on system reset
+          - description: AHB reset
+
+  pcs-handle:
+    description:
+      phandle pointing to a PCS sub-node compatible with
+      Documentation/devicetree/bindings/net/pcs/renesas,rzn1-miic.yaml#
+      (Refer RZ/T2H portion in the DT-binding file)
 
 required:
   - compatible
@@ -87,6 +135,56 @@ required:
 allOf:
   - $ref: snps,dwmac.yaml#
 
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: renesas,r9a09g077-gbeth
+    then:
+      properties:
+        clocks:
+          maxItems: 3
+
+        clock-names:
+          maxItems: 3
+
+        interrupts:
+          minItems: 19
+
+        interrupt-names:
+          minItems: 19
+
+        resets:
+          minItems: 2
+
+        reset-names:
+          minItems: 2
+
+      required:
+        - reset-names
+    else:
+      properties:
+        clocks:
+          minItems: 7
+
+        clock-names:
+          minItems: 7
+
+        interrupts:
+          minItems: 11
+          maxItems: 11
+
+        interrupt-names:
+          minItems: 11
+          maxItems: 11
+
+        resets:
+          maxItems: 1
+
+        pcs-handle: false
+
+        reset-names: false
+
 unevaluatedProperties: false
 
 examples:
diff --git a/Documentation/devicetree/bindings/net/snps,dwmac.yaml b/Documentation/devicetree/bindings/net/snps,dwmac.yaml
index 4e3cbaa06229..658c004e6a5c 100644
--- a/Documentation/devicetree/bindings/net/snps,dwmac.yaml
+++ b/Documentation/devicetree/bindings/net/snps,dwmac.yaml
@@ -75,6 +75,7 @@ properties:
         - qcom,sc8280xp-ethqos
         - qcom,sm8150-ethqos
         - renesas,r9a06g032-gmac
+        - renesas,r9a09g077-gbeth
         - renesas,rzn1-gmac
         - renesas,rzv2h-gbeth
         - rockchip,px30-gmac
@@ -118,11 +119,11 @@ properties:
 
   interrupts:
     minItems: 1
-    maxItems: 11
+    maxItems: 19
 
   interrupt-names:
     minItems: 1
-    maxItems: 11
+    maxItems: 19
     items:
       oneOf:
         - description: Combined signal for various interrupt events
@@ -134,9 +135,9 @@ properties:
         - description: The interrupt that occurs when HW safety error triggered
           const: sfty
         - description: Per channel receive completion interrupt
-          pattern: '^rx-queue-[0-3]$'
+          pattern: '^rx-queue-[0-7]$'
         - description: Per channel transmit completion interrupt
-          pattern: '^tx-queue-[0-3]$'
+          pattern: '^tx-queue-[0-7]$'
 
   clocks:
     minItems: 1
-- 
2.51.0


