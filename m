Return-Path: <linux-renesas-soc+bounces-21150-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 809D2B3F184
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  2 Sep 2025 02:13:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B97733BE964
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  2 Sep 2025 00:13:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 856B82C0303;
	Tue,  2 Sep 2025 00:13:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gVdd+89u"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 809D92BFC60;
	Tue,  2 Sep 2025 00:13:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756771991; cv=none; b=mNkgGQc47NiEutBHnsNGI6u86uiTPY1PvN2f9Pdw8lPED7pJCCc1ceyaT+1wT5FBh0ctIJQTAzcmoGkWYS83Vj8worPShM5EvhGouK0EIHRoKnlyKHMmtKTSXKeD939ZxGthsnkhjzXeSXUeyQi/iWaMr4PO3NHKABmzutTQkAk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756771991; c=relaxed/simple;
	bh=vwhuenc9EiopLE5Ii4+in9Gz3iF2aIzNlwPMDDwwVbY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=s6XwTZkktc0q95Ssddye/pWqvz2fHsagoXH76v1sYsRUD8ntQxWhsqlvOwdkvYkFCBxzj467nobXcxzzPRp8cFq1lrrWqj9Y/wHGGP3R8xFI3fbAe+ZuwWZ6zdXf2hA6d8RvnGDHEhQEclIuuDdqqv9kX70mHoSH0mJt5S/ukJg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gVdd+89u; arc=none smtp.client-ip=209.85.221.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-3d1bf79d758so2120173f8f.1;
        Mon, 01 Sep 2025 17:13:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1756771988; x=1757376788; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=etFKt7+tWRxLPhUeF783JanGoHY0JOZ/EUy1MnL+9k4=;
        b=gVdd+89upfwDQXOsWJkN1iIUceqVNTDyavrt6ELzrHTNB0tZOb1rHB21GzHKNSD3Ej
         4dxmWCfeHbWK86ErIJ6UAfA8SuEJNhTe/qRe1ZeyGtwoTZSk7OSDfEr0V8I3bhNhOAgs
         bzgbZ1g0KOomNMxNfub0BZnpDF/qguM2EIefJN33o02Qf6OtsguIj6vLvja9/4yIlUoI
         oGz759hndIvUbBI2OS892WVuT1fLbuagzJizYyP5uVyCEwY+yBVxirGRGD9zDMgPlOBG
         6OyuPpuGMG+L4Lmaz0eLDag3pcuX6ScO9volbB1Luzf3vkKprA6v+BMTicxBfzyHyhzx
         RdkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756771988; x=1757376788;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=etFKt7+tWRxLPhUeF783JanGoHY0JOZ/EUy1MnL+9k4=;
        b=qrO9CDdTcQj85NJgVbiyQjttxXiMEGI1SOpo9+0qOGqTd7qHtNro3Xk/+1+4phV9j9
         LjfX4YieUbzao0RCfZGiubUgxLQr+vnHesOT0FAE3yWBJl+DxlwIZsj14Vg81OYEr2DB
         7ROP7Z6205WHNtvD74KcwWxtG2j4WQEgZulL6ZGtPXEraz5rR8A+MaiJ763wcqqmcRH+
         5YVU8qaJVaYQIqlxvWNmKxm9Fu4RDwr5Kyt6eOawNBOl+TqtzKJOn0KjEyLkJ0PhqGO8
         wSJt86yhGfCrWg92ZkMeugOZD8znStSNLhXm95V8kw9EwVWgCZVdJVebK6AAnQeCh7R5
         Nshg==
X-Forwarded-Encrypted: i=1; AJvYcCUOEYU12rBa9nFj+p4hKWhaAclc3K2sWDt7nPwNW1UqfeRop1ptyKEtVWHOIaZUTZ1EolE4Fk1jFkE/i4Uh@vger.kernel.org, AJvYcCVJVanbsb/bCMBRQ94rAHpcdJj5SvZBOYHkaeN1ue9zmLYFf1IhcZx2CcYODlDzQIkbCFcFoNATWOrD@vger.kernel.org, AJvYcCWIKli/zIIdQVLvBGAdKYPDO5n0FQNA2UNn7r9Xh34Ii2JgSvNISxQ74fGzFyjdtjUzLEOQNLx1@vger.kernel.org
X-Gm-Message-State: AOJu0YyfkGeE5EcO14M9o4J/KEo5jjpsVtHKwroU8mEsj9+j6rD2Rz/e
	SvyUyq3Lnt4i2SPztekP3fBqdjJ/uVA5hHysjdBTuJ/jLUM37r0qVmY7
X-Gm-Gg: ASbGncs+RP4sTQNXnZG504tk79xqI8vCmk97+aH8oUoPTE7cYq69CaV9d0fYViAwGwO
	elxUsNfSNdmVhqS3gE/ippi1gEdKKkxutE7zyOLFart8ajdFSTT4viCxm4ZMIDqexiA9wzNNRNp
	Hf5JxSlFRP9i38AGRR9gKmGM6IOBP4inqwNPF8OKfwizaLM+6Xub6ws9X48UaWFqoz5qTt8ZgHl
	+9bENelumlv1ybSp7oUsy3M708b159LJASTuirwYYuCnIGNbF19z+A5Q8WwkPU3RJfCdZlbxjij
	uR80FJIQSRybSPKg0fjcxjiTER86FHWCGPlmYRPeSjd1TV4BF6nkjfrEHe+SB1Ofiq8695TbghD
	+m+Aq3HA6+B5BP4Rn0HCMIH0r7ym0GwSTw4oXLuSFLBedWHBIm4THUAUI
X-Google-Smtp-Source: AGHT+IFPGTlk+evyu+xtq0waHE/04booU4YiDIt+L0pMGxGvKONa+Sj6VFPE3ubiKF0MVGHEbhBjNA==
X-Received: by 2002:a05:6000:2387:b0:3cd:cf31:d77b with SMTP id ffacd0b85a97d-3d1dfcfb96fmr6542569f8f.37.1756771987739;
        Mon, 01 Sep 2025 17:13:07 -0700 (PDT)
Received: from iku.Home ([2a06:5906:61b:2d00:ca6c:86b2:c8f:84d6])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3d92d51982bsm2138153f8f.21.2025.09.01.17.13.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 Sep 2025 17:13:07 -0700 (PDT)
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
	Russell King <linux@armlinux.org.uk>,
	Giuseppe Cavallaro <peppe.cavallaro@st.com>,
	Jose Abreu <joabreu@synopsys.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>
Cc: linux-renesas-soc@vger.kernel.org,
	netdev@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org,
	Prabhakar <prabhakar.csengg@gmail.com>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH net-next 2/4] dt-bindings: net: renesas,rzv2h-gbeth: Document Renesas RZ/T2H and RZ/N2H SoCs
Date: Tue,  2 Sep 2025 01:13:00 +0100
Message-ID: <20250902001302.3823418-3-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20250902001302.3823418-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20250902001302.3823418-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Document the Ethernet MAC (GMAC) IP present on the Renesas RZ/T2H
(R9A09G077) and RZ/N2H (R9A09G087) SoCs. The GMAC IP on RZ/N2H is
identical to that found on the RZ/T2H SoC.

While the RZ/V2H(P), RZ/T2H, and RZ/N2H SoCs all integrate the Synopsys
DesignWare MAC (version 5.20), the hardware is synthesized with different
options compared to the RZ/V2H(P):
  - RZ/T2H requires only 3 clocks instead of 7
  - RZ/T2H supports 8 RX/TX queue pairs instead of 4
  - RZ/T2H needs 2 reset controls with reset-names property, vs. a single
    unnamed reset
  - RZ/T2H has the split header feature enabled, while it is disabled on
    RZ/V2H(P)

To accommodate these differences, introduce a new generic compatible
string `renesas,rzt2h-gbeth`, used as a fallback for both RZ/T2H and
RZ/N2H SoCs.

The DT schema is updated to validate the clocks, resets, reset-names,
interrupts, and interrupt-names properties accordingly. Also extend
`snps,dwmac.yaml` with the new `renesas,rzt2h-gbeth` compatible.

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
---
 .../bindings/net/renesas,rzv2h-gbeth.yaml     | 177 ++++++++++++++----
 .../devicetree/bindings/net/snps,dwmac.yaml   |   1 +
 2 files changed, 138 insertions(+), 40 deletions(-)

diff --git a/Documentation/devicetree/bindings/net/renesas,rzv2h-gbeth.yaml b/Documentation/devicetree/bindings/net/renesas,rzv2h-gbeth.yaml
index 23e39bcea96b..e01763389164 100644
--- a/Documentation/devicetree/bindings/net/renesas,rzv2h-gbeth.yaml
+++ b/Documentation/devicetree/bindings/net/renesas,rzv2h-gbeth.yaml
@@ -17,63 +17,112 @@ select:
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
+
+      - items:
+          - enum:
+              - renesas,r9a09g077-gbeth # RZ/T2H
+              - renesas,r9a09g087-gbeth # RZ/N2H
+          - const: renesas,rzt2h-gbeth
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
+
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
+
+      - items:
+          - const: stmmaceth
+          - const: pclk
+          - const: tx
+
 
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
+
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
+
+      - items:
+          - description: GMAC stmmaceth reset
+          - description: AHB reset
+
+  reset-names: true
 
 required:
   - compatible
@@ -87,6 +136,54 @@ required:
 allOf:
   - $ref: snps,dwmac.yaml#
 
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: renesas,rzt2h-gbeth
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
+        reset-names: false
+
 unevaluatedProperties: false
 
 examples:
diff --git a/Documentation/devicetree/bindings/net/snps,dwmac.yaml b/Documentation/devicetree/bindings/net/snps,dwmac.yaml
index 578553840c9e..14be80fe9c82 100644
--- a/Documentation/devicetree/bindings/net/snps,dwmac.yaml
+++ b/Documentation/devicetree/bindings/net/snps,dwmac.yaml
@@ -77,6 +77,7 @@ properties:
         - renesas,r9a06g032-gmac
         - renesas,rzn1-gmac
         - renesas,rzv2h-gbeth
+        - renesas,rzt2h-gbeth
         - rockchip,px30-gmac
         - rockchip,rk3128-gmac
         - rockchip,rk3228-gmac
-- 
2.51.0


