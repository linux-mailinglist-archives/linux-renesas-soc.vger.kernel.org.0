Return-Path: <linux-renesas-soc+bounces-27749-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id SESpLh0qfmkJWQIAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-27749-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Sat, 31 Jan 2026 17:13:17 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 12A9BC2EBE
	for <lists+linux-renesas-soc@lfdr.de>; Sat, 31 Jan 2026 17:13:17 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id B48163041BDD
	for <lists+linux-renesas-soc@lfdr.de>; Sat, 31 Jan 2026 16:12:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C92A733C180;
	Sat, 31 Jan 2026 16:12:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="InMKtvxB"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-ed1-f67.google.com (mail-ed1-f67.google.com [209.85.208.67])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 143F63358AF
	for <linux-renesas-soc@vger.kernel.org>; Sat, 31 Jan 2026 16:12:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.67
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769875977; cv=none; b=ZlRWmKkVRztguKIDayiOvNVo3R1Vcynp9X6D+/65auz3+P8NCA3qrLcNOrymfjjMdwD4lwxM9JOseqVZP0EjUKMYCSvDL8g+UeNXr5bPV7pHl5RolS4QV9SApcsL72Yr5p70ERW1X/X1XF/RTuz4zr9dX6vFW1i68lFOTocBq6I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769875977; c=relaxed/simple;
	bh=sQScBiEgeO0wGbgeHfQgG+cDDApKVGzbwk0hFHjqGeo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=S80dm5piuzc9nS0n05wAXEkL1PMvDtz8QMYYYRB5+4tI0lucVaqw31eejJoZIdM6dujiNt5/7i/cOxTML3GIc7wEnnC5798BWE2iL/VMZdymheFGER0jxHYXZpq3U6Rn54oKGHkgqPL5eHCYukBndQo6T/9O0aT/PT2CUz+bLjc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=InMKtvxB; arc=none smtp.client-ip=209.85.208.67
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f67.google.com with SMTP id 4fb4d7f45d1cf-658d54197d3so4715966a12.0
        for <linux-renesas-soc@vger.kernel.org>; Sat, 31 Jan 2026 08:12:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769875974; x=1770480774; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QWAoU7oEt3xC1fxIE+2lnHAybgV6QoQOF+ETbUXX1fA=;
        b=InMKtvxBjFcSSaCXvYjHvnmUKu1DGhAkgfSWXa1DS2GbPe+3IcNZ7VEL4RZqlBinte
         Srg8TH6YHCOcEyReDmEgzD3hkFUc6yw2Q2pcfF8NJMNU8Y1sknnTXUwUMD1WU3+32Ru1
         3mq5KoKAp7FMGdNqHdZaWCgt/BBDj1qK3pbiswaXt4Nwur1juaj2wZW+7imicudhTS+2
         PUJSwOYBh3MkOUxDJXUFO/thCoooDZZcm6bia5+197XeugE1atW3K0yLdtuNTVBSbbSy
         ukl21LzXgfD9QBfg9iTVbIyGmwd/12KQcrC0nB3n21IsTUeA1o0iOm0nbHb5NC9DZJBT
         79sQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769875974; x=1770480774;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=QWAoU7oEt3xC1fxIE+2lnHAybgV6QoQOF+ETbUXX1fA=;
        b=CQKMWMvHJZp5Uhtl/mCiaVt6u9B+QwozERwpE3C5fDhvuFCJa6zZP+x+3QsCP7aouF
         2rTYqKM6LhWRPqdGFuSJiVP32NN5/AYe/Kmh7rdt7swPo2mxkL2wsLKivI7VmGlrAlEb
         v+CUU1DKHi1ePmz9X/jtlLg8CPbJV5ItAhSt00pfdtiHZh9ans9kl29b8MhL0JNcn3/X
         UR1qu+G4rnH4CsjMjUqaXfuVFG8JY37Rzccys761hQkpIGRHzSTAPyH3BVPAVz5B3oSe
         tGn4ZbU7pVa4OegY7kVlpqRj4+FcwzO20vq3y8GdJDNOKKLuhARZmdsVuzIrQ/f9IRFc
         DYqQ==
X-Forwarded-Encrypted: i=1; AJvYcCXAc4/6IBW4Q74dmdhzwyFe0QCG4NF4j5YgD0Q3msxfYbefOmk//oa3iKQtHZuAsjmOkXHm7zLn8yHRYDVcW14ngw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yw05ZrhMPHQJ/iao9Z7rSE/P+VvaZcWPPXNgVvnw1/ESKyL453G
	aTPZpx4gWE5kKvQIsq+rHCjyud8EjxPBoYpQkmyzRucEvaWX1buSB99K
X-Gm-Gg: AZuq6aK4jlxdGJ+uedsLAPbO+9G4BjfJCNfGPt+szF9ETeSm98JvsrhxD6CirvN/+rm
	dK/E5iTjSDMvevsQ2su/B7CDonpxDEjl4Jsqtk4TL/Burj6TgiC290OfVIGN3b3/UIQH0FbBbBO
	n4AUJorjHGIVad02dtOOHaxRDvQBAz7zm+QU0LnYtgVT83JufBnlpvSMc1kYf/HTeJcbbfmcCyy
	oO4c7Luf1ADdeiiM621/DiiNIDt8V5ETz9jx88ullIvoLPxbwHbh3yzrmTN4Ec2tnrjehrZgP46
	reLV+81iM5XojGWwAj4GdLTEwFf976k1hGd13ZBtYARgpHQ7beZ/Oq2B3xMqndYJeXy0kUzrQKY
	Y1Anfj6JgBhARz4jQjnOeQJt0aTSHOmB+z9r7BHTfScmgmJIUbJYkZxvs6cRWCKhRr15AkKOf7I
	aWJJezz+IFB9GNfQLzKtvjQ7pPeac1JAj1HDI=
X-Received: by 2002:a05:6402:350b:b0:658:bd67:bc16 with SMTP id 4fb4d7f45d1cf-658de589e89mr3855793a12.20.1769875974263;
        Sat, 31 Jan 2026 08:12:54 -0800 (PST)
Received: from localhost.localdomain ([2a00:23c4:a758:8a01:46ad:7674:ff90:13f3])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-658b46ac0e8sm5433232a12.34.2026.01.31.08.12.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 31 Jan 2026 08:12:53 -0800 (PST)
From: Biju <biju.das.au@gmail.com>
X-Google-Original-From: Biju <biju.das.jz@bp.renesas.com>
To: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Richard Cochran <richardcochran@gmail.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>
Cc: Biju Das <biju.das.jz@bp.renesas.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Giuseppe Cavallaro <peppe.cavallaro@st.com>,
	Jose Abreu <joabreu@synopsys.com>,
	netdev@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Biju Das <biju.das.au@gmail.com>,
	Conor Dooley <conor.dooley@microchip.com>
Subject: [PATCH net-next v3 1/2] dt-bindings: net: renesas,rzv2h-gbeth: Document Renesas RZ/G3L SoC
Date: Sat, 31 Jan 2026 16:12:42 +0000
Message-ID: <20260131161250.5047-2-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260131161250.5047-1-biju.das.jz@bp.renesas.com>
References: <20260131161250.5047-1-biju.das.jz@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_RHS_MATCH_TO(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-27749-lists,linux-renesas-soc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[bp.renesas.com,lunn.ch,davemloft.net,google.com,kernel.org,redhat.com,gmail.com,glider.be];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCPT_COUNT_TWELVE(0.00)[22];
	FREEMAIL_CC(0.00)[bp.renesas.com,foss.st.com,st.com,synopsys.com,vger.kernel.org,gmail.com,microchip.com];
	FROM_NEQ_ENVFROM(0.00)[bijudasau@gmail.com,linux-renesas-soc@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-renesas-soc,netdev,dt,renesas];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	TO_DN_SOME(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[renesas.com:email,bp.renesas.com:mid,microchip.com:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 12A9BC2EBE
X-Rspamd-Action: no action

From: Biju Das <biju.das.jz@bp.renesas.com>

Add device tree binding support for the Gigabit Ethernet (GBETH) IP on
Renesas RZ/G3L SoC. This SoC uses different Synopsys DesignWare MAC
version 5.30 compared to RZ/G3E.

RZ/G3L requires an extra clock compared to RZ/G3E and has pps interrupts.

Add a new compatible string "renesas,r9a08g046-gbeth" for RZ/G3L SoC and
update the schema to handle hardware differences between SoC variants.

Extend the base snps,dwmac.yaml schema to accommodate the PPS interrupts.

Acked-by: Conor Dooley <conor.dooley@microchip.com>
Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
v2->v3:
 * Fixed the typo ppt->ptp as pointed by netdev-ai[1].
 * Keep the tag as the change is trivial
[1]https://netdev-ai.bots.linux.dev/ai-review.html?id=495cbea4-c154-4027-9ecf-0167906492fe
v1->v2:
 * Collected tag
---
 .../bindings/net/renesas,rzv2h-gbeth.yaml     | 77 ++++++++++++++++---
 .../devicetree/bindings/net/snps,dwmac.yaml   |  3 +
 2 files changed, 69 insertions(+), 11 deletions(-)

diff --git a/Documentation/devicetree/bindings/net/renesas,rzv2h-gbeth.yaml b/Documentation/devicetree/bindings/net/renesas,rzv2h-gbeth.yaml
index bd53ab300f50..fb60f745a1ff 100644
--- a/Documentation/devicetree/bindings/net/renesas,rzv2h-gbeth.yaml
+++ b/Documentation/devicetree/bindings/net/renesas,rzv2h-gbeth.yaml
@@ -26,6 +26,9 @@ select:
 properties:
   compatible:
     oneOf:
+      - items:
+          - const: renesas,r9a08g046-gbeth # RZ/G3L
+          - const: snps,dwmac-5.30a
       - items:
           - enum:
               - renesas,r9a09g047-gbeth # RZ/G3E
@@ -47,13 +50,17 @@ properties:
   clocks:
     oneOf:
       - items:
-          - description: CSR clock
-          - description: AXI system clock
+          - description: CSR/Register access clock
+          - description: AXI system/Main clock
           - description: PTP clock
           - description: TX clock
           - description: RX clock
           - description: TX clock phase-shifted by 180 degrees
           - description: RX clock phase-shifted by 180 degrees
+          - description: RMII clock
+
+        minItems: 7
+
       - items:
           - description: CSR clock
           - description: AXI system clock
@@ -69,6 +76,10 @@ properties:
           - const: rx
           - const: tx-180
           - const: rx-180
+          - const: rmii
+
+        minItems: 7
+
       - items:
           - const: stmmaceth
           - const: pclk
@@ -88,6 +99,22 @@ properties:
           - const: tx-queue-1
           - const: tx-queue-2
           - const: tx-queue-3
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
+          - const: ptp-pps-0
+          - const: ptp-pps-1
+          - const: ptp-pps-2
+          - const: ptp-pps-3
       - items:
           - const: macirq
           - const: eth_wake_irq
@@ -135,6 +162,27 @@ required:
 allOf:
   - $ref: snps,dwmac.yaml#
 
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: renesas,r9a08g046-gbeth
+    then:
+      properties:
+        clocks:
+          minItems: 8
+
+        clock-names:
+          minItems: 8
+
+        interrupts:
+          minItems: 15
+          maxItems: 15
+
+        interrupt-names:
+          minItems: 15
+          maxItems: 15
+
   - if:
       properties:
         compatible:
@@ -163,12 +211,26 @@ allOf:
       required:
         - reset-names
     else:
+      properties:
+        resets:
+          maxItems: 1
+
+        pcs-handle: false
+
+        reset-names: false
+
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: renesas,rzv2h-gbeth
+    then:
       properties:
         clocks:
-          minItems: 7
+          maxItems: 7
 
         clock-names:
-          minItems: 7
+          maxItems: 7
 
         interrupts:
           minItems: 11
@@ -178,13 +240,6 @@ allOf:
           minItems: 11
           maxItems: 11
 
-        resets:
-          maxItems: 1
-
-        pcs-handle: false
-
-        reset-names: false
-
 unevaluatedProperties: false
 
 examples:
diff --git a/Documentation/devicetree/bindings/net/snps,dwmac.yaml b/Documentation/devicetree/bindings/net/snps,dwmac.yaml
index dd3c72e8363e..38bc34dc4f09 100644
--- a/Documentation/devicetree/bindings/net/snps,dwmac.yaml
+++ b/Documentation/devicetree/bindings/net/snps,dwmac.yaml
@@ -75,6 +75,7 @@ properties:
         - qcom,sc8280xp-ethqos
         - qcom,sm8150-ethqos
         - renesas,r9a06g032-gmac
+        - renesas,r9a08g046-gbeth
         - renesas,r9a09g077-gbeth
         - renesas,rzn1-gmac
         - renesas,rzv2h-gbeth
@@ -142,6 +143,8 @@ properties:
           pattern: '^rx-queue-[0-7]$'
         - description: Per channel transmit completion interrupt
           pattern: '^tx-queue-[0-7]$'
+        - description: PPS interrupt
+          pattern: '^ptp-pps-[0-3]$'
 
   clocks:
     minItems: 1
-- 
2.43.0


