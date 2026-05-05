Return-Path: <linux-renesas-soc+bounces-32065-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id GAPYAm/T+WlHEQMAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-32065-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 05 May 2026 13:24:31 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id BC0A64CC8BF
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 05 May 2026 13:24:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id DB28B3016D2A
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  5 May 2026 11:24:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6AE9138F626;
	Tue,  5 May 2026 11:24:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Up3wRqGz"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 76C88386C25
	for <linux-renesas-soc@vger.kernel.org>; Tue,  5 May 2026 11:24:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777980255; cv=none; b=AG/m8JkXnrFgZ8+c/hE3msSvRJXnJ0UKNJ17yPYXDPeZQ+X50F2xac0D+CjnTDknW4jccNFAAQlAikMrGP0vo2WgGgOXZR1HEkTBD1VSCr0xSXJ0plFv8BsCNLUv++VmUZcKKrz+wZ5yyiVhCIWYcObbnXB3HYN0NHZjuO/LuqI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777980255; c=relaxed/simple;
	bh=FVEHtU5Z6195zJJAYmRnFoFpIiG39ejppD1izDSTya4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Sx9lqEK6V/d2quBpy/Wx4rYl88EW4r8vQ4CKWbBSEkMltAQ4IJftsScLirxn8h9qLDGgzs+RXveoSiVM5Zl6Yzj3TntCF4N89AvDFfGgphaQdLciTDoMwjHKElB2pzTtmjNp9OQ6TFQjk+z31YCHQ2EhzMlFq1F1zGw1QhPukuY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Up3wRqGz; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-48d102471a4so18108865e9.2
        for <linux-renesas-soc@vger.kernel.org>; Tue, 05 May 2026 04:24:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777980252; x=1778585052; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5RhR/bcs6oyD8dx69WfVrYrpk9XZKcpx9bamSBwmfAs=;
        b=Up3wRqGzVE9uFDtayO6H8Mkqc1//ATyVa2XhKQ6df/8BkWVCp+/CQ0LhosFAKjwZQg
         VPTvgVndukOLxMwCwr5a+e4i8aROcclvKi/vj/hKIt37fUN5ghBhpWzOT2zXalix8xL1
         WKM9gvryzci1nprLzgdqDS+I63xjxuwlOhwFuxh4G/nCYAD+bgqoQnWO+sqEAHnaWsna
         J1TKt9MNRS7RPermt5Jrt5Q6C4suVN5G9Z51fqqOE31EJG9G4/T6BR/213DFKJZ3xvnm
         Tl6lKEw5SmvssoqXpQgdj09wYPVpTouwF9zM9lApsB/9WMJcnspmFlbB54hgtlwpAPJY
         va6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777980252; x=1778585052;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=5RhR/bcs6oyD8dx69WfVrYrpk9XZKcpx9bamSBwmfAs=;
        b=gWneM7HO0rthUWfFpYy8skfZmeCeRAiXYhiRAeO9CA7dywwlKrnDIIyjb/S8OlBWzj
         bXkrt3A0O/H0dJRWQ2j4XE+Wj3mONO8lp+PkJBWpvHYxV/7TWM4w0a70IVHsrFOEfVgP
         AnRGOuR29poismTN0v47wgRri0hf2KGW5DcTUnocShYiy7YOUkfrp5wYcmwibgESsXII
         ytiAHLQybqRQtzCbXvhXn5FI3ijEUi85leXvclry8ZE1BHmrADEaH9OxNcRyK9HIwT7t
         DcJtyDdK+8zIuRwfaWc/Fm7lEsMqECfE69sBJzxOPR+Gnom2y7CB1N1Wj/4wTTBwgi5P
         wzxg==
X-Forwarded-Encrypted: i=1; AFNElJ/mslls1Vs+MRa6Q/XZ7/tw8Y62kcpZz0UPg48euwHu4dwDP2OF24gNWPGl6LcqoDXZEW4PnUdExiF059/4Hi4dRg==@vger.kernel.org
X-Gm-Message-State: AOJu0YwC4ugdjYH5m8zn2wm5CExUTtyPvtTVDF7XFHw2JI4qo11hbWK5
	BX9LjZqdfe2DpkxOfcaXraRZH9v6GZE1HeK2ssMni2MeNQ6wugn3/ooy
X-Gm-Gg: AeBDieshgGmpkGQl1my1G2Uz3RMRHZpaSLNizSnBckhukfcoo1HPxPBzlPpkOEPtGuK
	zET7vha8tPVP9hLc1j7OlQBYtpDjIO/TbtLyCJ+aZHaddTyR4821BUDhFD5MGMzuSK9XC7gbJ1L
	YvdIq0+TDf7bGZULHwurtja8L63Hr7A4jKOh908fA4XG9CxvbfklGEPhYjnSausRaincFHqPKV4
	zHdF3JVY0UFc5E2nymFIxp785QE5/9/3bT8Xhk6QPfN7UYh4YDAh9cA71iM4LkvkScaauDtuzYt
	pVRWPE0p11MZVOY62LkS90A79CJD3paCfzuesFSoeME0SLuo8hwmWxi8WDJAUQQqwCVPjrW2Xj8
	qYjFmu4kzBqVKeLJmOiORNB0trPRviDckhHrGr5wfK4W8mxhahioQmTDPRhYvARcDAwcQ42msvs
	XvV4m4tWE0DeFBhsurUmQJ/GbGa5IG/VvnTfjX6rNJ/qDnxa/zQ8EstVgeT2Kdix4j61/iYXXEj
	gomb6S2LWDR4NQAXQphe270FIWJfDjHjSOCRSpD8tMqwh8VDsKe4q/X9g==
X-Received: by 2002:a05:600c:3487:b0:486:fb0b:ad79 with SMTP id 5b1f17b1804b1-48a988a6ec9mr238315625e9.20.1777980251748;
        Tue, 05 May 2026 04:24:11 -0700 (PDT)
Received: from iku.example.org ([2a06:5906:61b:2d00:7d2a:9b5b:a191:3b81])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48a8eba8487sm339946455e9.11.2026.05.05.04.24.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 May 2026 04:24:11 -0700 (PDT)
From: Prabhakar <prabhakar.csengg@gmail.com>
X-Google-Original-From: Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To: Krzysztof Kozlowski <krzk@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Biju Das <biju.das.jz@bp.renesas.com>
Cc: linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	Prabhakar <prabhakar.csengg@gmail.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH v3 1/2] dt-bindings: memory: renesas,rzg3e-xspi: Add RZ/T2H and RZ/N2H support
Date: Tue,  5 May 2026 12:24:04 +0100
Message-ID: <20260505112405.667796-2-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260505112405.667796-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20260505112405.667796-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: BC0A64CC8BF
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-32065-lists,linux-renesas-soc=lfdr.de];
	FREEMAIL_FROM(0.00)[gmail.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_TO(0.00)[kernel.org,glider.be,gmail.com,sang-engineering.com,bp.renesas.com];
	RCPT_COUNT_TWELVE(0.00)[13];
	FREEMAIL_CC(0.00)[vger.kernel.org,gmail.com,renesas.com,bp.renesas.com];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[prabhakarcsengg@gmail.com,linux-renesas-soc@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-renesas-soc,dt,renesas];
	NEURAL_HAM(-0.00)[-0.998];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,bp.renesas.com:mid]

From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Document xSPI controller found on the Renesas RZ/T2H and RZ/N2H SoCs.
The xSPI IP on these SoCs is identical to that found on the RZ/G3E SoC.

The RZ/G3E HW manual (Rev.1.15) references bridge channel 1 and its
bits, however the hardware actually supports only a single bridge
channel (channel 0), matching the RZ/T2H design. The references to
channel 1 and its configuration bits will be corrected in a future
revision of the HW manual.

Update clock/reset constraints to handle the SoC differences.

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
---
v2->v3:
- Used RZ/G3E comptiable as a fallback compatible for
  RZ/T2H and RZ/N2H SoCs since the xSPI IP is identical.
- Updated commit message to reflect that the xSPI IP is
 identical between RZ/G3E, RZ/T2H, and RZ/N2H SoCs.
- Dropped RB tag from Rob due to above changes.

v1->v2:
- Add RB tag from Rob for the dt-bindings patch.
---
 .../renesas,rzg3e-xspi.yaml                   | 56 +++++++++++++++----
 1 file changed, 46 insertions(+), 10 deletions(-)

diff --git a/Documentation/devicetree/bindings/memory-controllers/renesas,rzg3e-xspi.yaml b/Documentation/devicetree/bindings/memory-controllers/renesas,rzg3e-xspi.yaml
index 7a84f5bb7284..e2633476bd54 100644
--- a/Documentation/devicetree/bindings/memory-controllers/renesas,rzg3e-xspi.yaml
+++ b/Documentation/devicetree/bindings/memory-controllers/renesas,rzg3e-xspi.yaml
@@ -30,6 +30,8 @@ properties:
           - enum:
               - renesas,r9a09g056-xspi  # RZ/V2N
               - renesas,r9a09g057-xspi  # RZ/V2H(P)
+              - renesas,r9a09g077-xspi  # RZ/T2H
+              - renesas,r9a09g087-xspi  # RZ/N2H
           - const: renesas,r9a09g047-xspi
 
   reg:
@@ -53,28 +55,38 @@ properties:
       - const: err_pulse
 
   clocks:
-    items:
-      - description: AHB clock
-      - description: AXI clock
-      - description: SPI clock
-      - description: Double speed SPI clock
+    oneOf:
+      - items:
+          - description: AHB clock
+          - description: AXI clock
+          - description: SPI clock
+          - description: Double speed SPI clock
+      - items:
+          - description: AHB clock
+          - description: SPI clock
 
   clock-names:
-    items:
-      - const: ahb
-      - const: axi
-      - const: spi
-      - const: spix2
+    oneOf:
+      - items:
+          - const: ahb
+          - const: axi
+          - const: spi
+          - const: spix2
+      - items:
+          - const: ahb
+          - const: spi
 
   power-domains:
     maxItems: 1
 
   resets:
+    minItems: 1
     items:
       - description: Hardware reset
       - description: AXI reset
 
   reset-names:
+    minItems: 1
     items:
       - const: hresetn
       - const: aresetn
@@ -109,6 +121,30 @@ required:
   - '#address-cells'
   - '#size-cells'
 
+if:
+  properties:
+    compatible:
+      contains:
+        enum:
+          - renesas,r9a09g077-xspi
+          - renesas,r9a09g087-xspi
+then:
+  properties:
+    clocks:
+      maxItems: 2
+    clock-names:
+      maxItems: 2
+else:
+  properties:
+    clocks:
+      minItems: 4
+    clock-names:
+      minItems: 4
+    resets:
+      minItems: 2
+    reset-names:
+      minItems: 2
+
 unevaluatedProperties: false
 
 examples:
-- 
2.54.0


