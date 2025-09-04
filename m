Return-Path: <linux-renesas-soc+bounces-21393-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id AC0C0B44785
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  4 Sep 2025 22:40:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 727C13AE1F4
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  4 Sep 2025 20:40:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CD583284B36;
	Thu,  4 Sep 2025 20:39:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="OQDPLxsz"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C2A18280312;
	Thu,  4 Sep 2025 20:39:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757018398; cv=none; b=XepLoWFcrxJYBlMHpFxE3QZqR/xDWCPgkogtyLvaJ1FmYZiUDN9bGHmXkQvaRXGMVEjjxU3oe2E2FIwofsHZmzPKaDMAdhecOHTv53Y6/Ow/PKaWpThrDV2iB69mOedXKET/Oo0qyBsyFYkdniwK5bwjzKLtrrqQMkmFqND2gJc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757018398; c=relaxed/simple;
	bh=Uzh/7AbIGXEzufg8t9H9NLgIIwPD1Tkw2KWwSSBivZs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=trQ8Aa2s1gpNuafat5OaZzEZfL/yMrrB0ZElyaBF++PUtmzbnLvcqjBMBM6a/+Ao0ldzG/pv93k2HlQT1mOWg9RiZSzlge8TYKEinBHFL5tQ3YoyZlhfmp2m3zXPPO4bSv4OMsAr8Bs75a9pEVlz6ljcz437yRgUlmQNksYBPwY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=OQDPLxsz; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-45b8b1a104cso14195555e9.2;
        Thu, 04 Sep 2025 13:39:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757018395; x=1757623195; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fizy83t1JAhLvYW6Ng4v/axqSLgHAjf0OCGjjfhXeLQ=;
        b=OQDPLxszaSWFjeCGboWaWH1946tESo0346XhSIvUrWF3HovP2Iv3ccVrdc4mTQraCW
         U54wn+JqyTZxPhB8hdjdgPDl8ecEYuiDAYRUc2oE6suwtnTF15SfqhNUCD0lXKfHjvj3
         YWWnGu2YJWdLj1zRnF57I67SBtBnRdw8ObyWsx6aaruJhKLwBs6136lE7px6kj9OHM5Z
         ojgqFUh72rJIfrgMuN52gQdXDyxAmyPkqUny+oRsTZUtyZc6qFSAkZfhcIFAZ4N9800h
         fhOcEhF47QfvC8EX3ZQ6MCf8FQ3AGP0teErHga+SifQQ8dw43FQwony4nNcH6M58Yjnv
         27WA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757018395; x=1757623195;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fizy83t1JAhLvYW6Ng4v/axqSLgHAjf0OCGjjfhXeLQ=;
        b=xLAonMv/0WdnTc9sjpHv7s8CC95Ab485xMlog+zvpIwBUFzLZmy3QZLoL0OR/ktwjD
         KPLoZXokSMvFFUY0LtwCS30ZLt8ZJAdp3FfnGCAUosGo8XOt6CoaISCwuiZDCiObf1vL
         nxjPRbHTIyC4+W99SCh6CQst+UlRegmo9m5YVqAjXf1W6j7KQHhHQxQjk/KGwvOsRKRY
         mjfGtfOWQ8FuYVO8tiQRHEyXCp/YkGI3Qc1Zw0BjAzVbv+9VLTV2M8DW6+Wvt6X7zfTK
         vVdepMC9M9Yn7p0nfBpCoQ5zfO3/sas4qcYyNPdpnPEa3SB0yS6tUQjRHCZPt6y7WyMl
         uZPg==
X-Forwarded-Encrypted: i=1; AJvYcCV4JD3actRF/tPEaW89KFUSi+/ah7rkeGwT92Rzdvz0S025NpM4YBz3U+W5Hu69b5k/61+/rpH0YVu84Iks@vger.kernel.org, AJvYcCWQb0R80gM0z8z+NhpbziWzbadjTOJbhVrJr40shVGNk8OmLIseu1du5koPEQATieuav1qO0uzCPIxg@vger.kernel.org, AJvYcCXkcUgq/4JptQhttD3kVYR5llOIpSWr3CbxpfmUWHMmdK5SQ+fx/2jhOj9p701zu3OOkiCn/+pRIkrqM1zxNaHMRK0=@vger.kernel.org
X-Gm-Message-State: AOJu0YwXfaK22lNZdxsZ9XTGyQBk6Avg/BwuuM4OsInrnGWYtLP6CdU6
	3MjMM8BetacLE4JG6HnfH7gPv9Gb2Sj0+6EbtJMNL40QZHsuFFp+SKwASjHqL/m4
X-Gm-Gg: ASbGnctuDmVe0qIVUYbLoHEoC8whhzzI3FJGcrhet2zJqh682f5op4wbFQnBKe4xyU6
	vHAs5+ojIRfGSjNVe4IZ81ouEfvFoiTD7C4z1fjCMm8HKQ/NLCNlqNijk7SsawpKhk5B3y/odkh
	J9fWCpjLzlBQd31H6o/G3mNQ7SaRGJTF7/0PGkNtDKCVt/o717oJRxZTwRijKpyrm86f+xFCGiQ
	OhRpF2FRdwgu41kftoECnrBAI5y/+rJjrIKH9U40sRPh67yoMJL7840gRzr3bYN2SnEdIjmNh/M
	wA7CVPicDzJSVXgqrwn4VmzIeb4RqBNtcGzaBxGHiV6PNvxfLXeANH4QjAKjT/YMqis0/WEkPtf
	6tNNdEiKA8hNHhTeoU+RTIAGF7xSKwZFFug4Qh6fSW4ODiTU=
X-Google-Smtp-Source: AGHT+IENq8QST6cBLls+zIuIq3hvfJjjYPXgjXYTa9U5XxkuNBCv6PPwCKKnufsIwdZ9KJddA59LCw==
X-Received: by 2002:a05:600c:458b:b0:45d:d5e2:f65d with SMTP id 5b1f17b1804b1-45dd5e2f7f4mr6413535e9.4.1757018394763;
        Thu, 04 Sep 2025 13:39:54 -0700 (PDT)
Received: from iku.Home ([2a06:5906:61b:2d00:904e:70c8:edf3:59a4])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-45b6f306c93sm385528165e9.14.2025.09.04.13.39.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 Sep 2025 13:39:54 -0700 (PDT)
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
Subject: [PATCH net-next v2 1/3] dt-bindings: net: renesas,rzv2h-gbeth: Document Renesas RZ/T2H and RZ/N2H SoCs
Date: Thu,  4 Sep 2025 21:39:47 +0100
Message-ID: <20250904203949.292066-2-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20250904203949.292066-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20250904203949.292066-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
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


