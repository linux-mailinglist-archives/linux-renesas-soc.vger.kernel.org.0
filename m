Return-Path: <linux-renesas-soc+bounces-25372-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [IPv6:2a01:60a::1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 98875C94384
	for <lists+linux-renesas-soc@lfdr.de>; Sat, 29 Nov 2025 17:43:40 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 66573343BE4
	for <lists+linux-renesas-soc@lfdr.de>; Sat, 29 Nov 2025 16:43:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5D0ED30F930;
	Sat, 29 Nov 2025 16:43:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JBQYs7wx"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 654CE30E843
	for <linux-renesas-soc@vger.kernel.org>; Sat, 29 Nov 2025 16:43:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764434613; cv=none; b=tDEssHZMEdxBFUO+HIsWEFFtteEJ9TfCP9IDxouREiofWe2ktrKIN3W35ul4FMjqXkfir6Q2tYZUlqwUcVsFBH3vVN0rwlZqCGx7InEL+BcrSvYYHIk/JJik/zzHiu1OVtqY+ns0a4DDMch0uYEn6Da3A0ZGoYKmeQDi0COaklw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764434613; c=relaxed/simple;
	bh=uZXDBvor7KJbjJB3HqPkR1cyp5kCgXnT/h7VJJSW3WQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=UjXZi+F9oKk9BI8hhAChWFjw9t3NhoDRuNZhekqX0LIYRU1EN/Pfm/nqGBoKaOPhl5++Q1mEigD8i+r3oqIF/4ngiQ29Gw2SuTfKaRLzGlTdymS0Qi32oarEnZw/6WyhslR0yUT91TnQhqNDtj1UEqu5nhIsnfyGYPppRUo8iVo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JBQYs7wx; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-47118259fd8so24575295e9.3
        for <linux-renesas-soc@vger.kernel.org>; Sat, 29 Nov 2025 08:43:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1764434610; x=1765039410; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=I3z8nMxAsgoZutlTwNmY4UEjKK/Ut41tih0onvR3o+8=;
        b=JBQYs7wxcgZdnlSBY/JbwnkfHy+XiSEA61egyJEW6DS2X5cpYnDNYBSLxh+nRwvV6R
         gfMdo5ucC+WBK0abKZpfCYTq3DJzdMHfVIQbhcdshsIEi5Bh5XnHGOnFtJnu4Rab5gkV
         qDFG7BQ6WAIoGlQzdI1TnHe9pj/Eu8zx0MkIQdEW+oB7dq86detBU7DwOXkBohRw0lZS
         izt/bslTZHAL1I246DTvScBm7e5bysG0kIYml0tuvGfpCKZFYWHc3LUInqAG6F+lJFJd
         pPU1ciAVHdZ+2ik4tXWPC+fbvx0dl7TCK+CJt5l7AxVtJGDV1Gpubni0gW/l8FU0+h67
         j1uA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764434610; x=1765039410;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=I3z8nMxAsgoZutlTwNmY4UEjKK/Ut41tih0onvR3o+8=;
        b=gt4BNAqXb1vgTE3goQQrXpmz83BLvjkGZwnHnuDrfFioyPIpdpnDTNSgcU9powkA8x
         twHGvok/AYOhj/8XAy17XUeEZ9Avl98uowneml87/fmcv08dp5ium5sWI4d38Z5FhPcM
         Wstgd4GJUCc9MiwOCDnCDimn1ZMkTJ3gX5gKd0IRlWSvep+7j+5/BmOCOr0fw+wa60/Z
         QrfjUwM3IhRIpsTieynRjAdnRTlkBmiaisEtxAtcWRS0GcYm30zPGnt+idSnjrLShM5Q
         58uIPR2aQeZbNj3EOb+RqScFWQn3wtOgSig6/hcgqlX0sPspWZdLHzX3CjupnDZDZ6ae
         Jigw==
X-Forwarded-Encrypted: i=1; AJvYcCVk5t/8rndlQ+TbWZEc36qfFOt+kDsst/PUoSd3Epe8q+yahhkLWwl6yD7IygOXsLNqTG/zCa1gN+F3Hi1K+SVluQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YxIxFKahRZhngZI2hm0tB0uZpNH8wiiZvSXdiRr1I71Mhl10yTB
	PUO5lEqebCmi81ri9VxD/hQ8i1grQWNrQ5bzw4qaLFV3WjIdACtIGuEm
X-Gm-Gg: ASbGncswT7qe50aPT9IyC/uTmGEftukVgqI0byhTNe4ISi9bI0LsQ0qXEJAOrIBXeLX
	BH6dK7YcgEVkNvOhWWYd/5of8CK9yQRw7kR02+AJAZkVXbAgrA9MrDa677xEDJYMj7vZErgEm7b
	7AXL6w1OCpQLIytgg1kwnJkg7hI6f5JVSAlDYd5D5Dnx2o1sMVHnQ5FDC6smCl7Sv90Tv2v8S6f
	eAYpSyIMFYmCiVDmhUxZs7AP1KW9uPIptipfElJP2a4f5qqzrkj4Bck06f4iSgIUoXTTZnGHLGx
	1t6UfmKh89/mew4Au+n0zlrMuuOtyvK5ZKOVWyn6Iu6P98jK4tmjSmUuP2SERTHcc3lNDjR2xoY
	L/USn9iKBEI0p5EDrbDfk/XanD9RcK9AuuwzRNAtjmfGxPFR3IQPR8b3HfItvczSEn8IyKucj/a
	3jsdkRGFHod3REfzxndClaNyRoUarC//dNEEq827TU9J24lz0Uc5ilpHiLKKhpn5HB+wSsfXklt
	AxahY9w9HA0fH+Npm6HHSYePlo=
X-Google-Smtp-Source: AGHT+IF1mYzBqICj6377qH8sbdY4XYTz9m3Paly6b9HFbclMkCmkWW7IznHUPIWSZOcxI+lLBdh5vA==
X-Received: by 2002:a05:6000:1841:b0:42b:3ab7:b8a4 with SMTP id ffacd0b85a97d-42e0f3446d7mr20648308f8f.33.1764434609396;
        Sat, 29 Nov 2025 08:43:29 -0800 (PST)
Received: from localhost.localdomain (host86-162-200-138.range86-162.btcentralplus.com. [86.162.200.138])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-42e1ca4078csm15970060f8f.29.2025.11.29.08.43.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 29 Nov 2025 08:43:29 -0800 (PST)
From: Biju <biju.das.au@gmail.com>
X-Google-Original-From: Biju <biju.das.jz@bp.renesas.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Jiri Slaby <jirislaby@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>
Cc: Biju Das <biju.das.jz@bp.renesas.com>,
	Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	linux-kernel@vger.kernel.org,
	linux-serial@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	Biju Das <biju.das.au@gmail.com>
Subject: [PATCH v5 01/17] dt-bindings: serial: renesas,rsci: Document RZ/G3E support
Date: Sat, 29 Nov 2025 16:42:57 +0000
Message-ID: <20251129164325.209213-2-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251129164325.209213-1-biju.das.jz@bp.renesas.com>
References: <20251129164325.209213-1-biju.das.jz@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Biju Das <biju.das.jz@bp.renesas.com>

Add documentation for the serial communication interface (RSCI) found on
the Renesas RZ/G3E (R9A09G047) SoC. The RSCI IP on this SoC is identical
to that on the RZ/T2H (R9A09G077) SoC, but it has a 32-stage FIFO compared
to 16 on RZ/T2H. It supports both FIFO and non-FIFO mode operation. RZ/G3E
has 6 clocks(5 module clocks + 1 external clock) compared to 3 clocks
(2 module clocks + 1 external clock) on RZ/T2H, and it has multiple resets.
It has 6 interrupts compared to 4 on RZ/T2H.

Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
v4->v5:
 * Updated commit description related to IRQ difference
 * Added aed and bfd irqs for RZ/G3E.
 * Moved reset: false to RZ/T2H SoC and dropped the else part for RZ/G3E.
 * Updated conditional schema with interrupts and interrupts-names.
 * Dropped the tag as there are new changes.
v3->v4:
 * Dropped separate compatible for non-FIFO mode and instead using single
   compatible "renesas,r9a09g047-rsci" as non-FIFO mode can be achieved
   by software configuration.
 * Renamed clock-names bus->pclk
 * Rearranged clock-names tclk{4, 16, 64}
 * Retained the tag as the changes are trivial.
v2->v3:
 * Dropped 1st and 3rd items from clk-names and added minItems for the
   range.
 * Added minItems for clk and clk-names for RZ/T2H as the range is 2-3
 * Added maxItems for clk and clk-names for RZ/G3E as the range is 5-6
 * Retained the tag as it is trivial change.
v1->v2:
 * Updated commit message
 * Added resets:false for non RZ/G3E SoCs.
---
 .../bindings/serial/renesas,rsci.yaml         | 99 ++++++++++++++++---
 1 file changed, 88 insertions(+), 11 deletions(-)

diff --git a/Documentation/devicetree/bindings/serial/renesas,rsci.yaml b/Documentation/devicetree/bindings/serial/renesas,rsci.yaml
index 6b1f827a335b..1f8cee8171de 100644
--- a/Documentation/devicetree/bindings/serial/renesas,rsci.yaml
+++ b/Documentation/devicetree/bindings/serial/renesas,rsci.yaml
@@ -10,46 +10,72 @@ maintainers:
   - Geert Uytterhoeven <geert+renesas@glider.be>
   - Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
 
-allOf:
-  - $ref: serial.yaml#
-
 properties:
   compatible:
     oneOf:
-      - items:
-          - const: renesas,r9a09g087-rsci # RZ/N2H
-          - const: renesas,r9a09g077-rsci # RZ/T2H
+      - enum:
+          - renesas,r9a09g047-rsci # RZ/G3E
+          - renesas,r9a09g077-rsci # RZ/T2H
 
       - items:
+          - const: renesas,r9a09g087-rsci # RZ/N2H
           - const: renesas,r9a09g077-rsci # RZ/T2H
 
   reg:
     maxItems: 1
 
   interrupts:
+    minItems: 4
     items:
       - description: Error interrupt
       - description: Receive buffer full interrupt
       - description: Transmit buffer empty interrupt
       - description: Transmit end interrupt
+      - description: Active edge detection interrupt
+      - description: Break field detection interrupt
 
   interrupt-names:
+    minItems: 4
     items:
       - const: eri
       - const: rxi
       - const: txi
       - const: tei
+      - const: aed
+      - const: bfd
 
   clocks:
     minItems: 2
-    maxItems: 3
+    maxItems: 6
 
   clock-names:
-    minItems: 2
+    oneOf:
+      - items:
+          - const: operation
+          - const: bus
+          - const: sck # optional external clock input
+
+        minItems: 2
+
+      - items:
+          - const: pclk
+          - const: tclk
+          - const: tclk_div4
+          - const: tclk_div16
+          - const: tclk_div64
+          - const: sck # optional external clock input
+
+        minItems: 5
+
+  resets:
     items:
-      - const: operation
-      - const: bus
-      - const: sck # optional external clock input
+      - description: Input for resetting the APB clock
+      - description: Input for resetting TCLK
+
+  reset-names:
+    items:
+      - const: presetn
+      - const: tresetn
 
   power-domains:
     maxItems: 1
@@ -62,6 +88,57 @@ required:
   - clock-names
   - power-domains
 
+allOf:
+  - $ref: serial.yaml#
+
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: renesas,r9a09g077-rsci
+    then:
+      properties:
+        interrupts:
+          maxItems: 4
+
+        interrupt-names:
+          maxItems: 4
+
+        clocks:
+          minItems: 2
+          maxItems: 3
+
+        clock-names:
+          minItems: 2
+          maxItems: 3
+
+        resets: false
+
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: renesas,r9a09g047-rsci
+    then:
+      properties:
+        interrupts:
+          minItems: 6
+
+        interrupt-names:
+          minItems: 6
+
+        clocks:
+          minItems: 5
+          maxItems: 6
+
+        clock-names:
+          minItems: 5
+          maxItems: 6
+
+      required:
+        - resets
+        - reset-names
+
 unevaluatedProperties: false
 
 examples:
-- 
2.43.0


