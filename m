Return-Path: <linux-renesas-soc+bounces-29244-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id QL2RG5nBsWkwFAAAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-29244-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 11 Mar 2026 20:25:13 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E47D269439
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 11 Mar 2026 20:25:13 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 14D6F3027D82
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 11 Mar 2026 19:25:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 48154344DB5;
	Wed, 11 Mar 2026 19:25:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZjMeQ8DP"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A40A32E6BB
	for <linux-renesas-soc@vger.kernel.org>; Wed, 11 Mar 2026 19:25:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773257107; cv=none; b=Wl4p9zaxncvz9NgvjurE9NL5y7lWyZ1V5a2YbX5m+AZPJGHtOSTzt1j8wa6o5qLzC6FUGCT/xDCycFEoak8m3aEbv/A4a4a+1nDVrnbF/3Ah1qIlTMLMajppIq6IGkWFJWFOecXV8K9zZ/jVDkxEVkgrEyU8Gnr7eSWzPYHXSqI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773257107; c=relaxed/simple;
	bh=VpbzE535uXG6AgP5tyiFll4LfhI52aEagCP+X3CBZMQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=IjXz63VbM2h5IoYwMry/OzIhNmx8R6xKdIx/+7XBRdpZHOqtRYwns2ggae2ry4FfATTYRm+eJn9A3GEQYruIgqZ1VToekGNVh0bXDxidkO52QLJWHWQEYNR/i04gOrVIOncyK4qKykrzA5554cJTBXiXT49AzNnFwRSshXAWSsE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZjMeQ8DP; arc=none smtp.client-ip=209.85.221.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-439b9b190easo174603f8f.2
        for <linux-renesas-soc@vger.kernel.org>; Wed, 11 Mar 2026 12:25:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773257104; x=1773861904; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ibLQ5wY2D6UHG6MJbChHCM8vDme8uvD6Axpd7zdJp8I=;
        b=ZjMeQ8DPQg8jnM3dYPPu/OxPVKdCt7mIOsWjgjSjjQbZ5A5Q6lAsBmNYAeXI4gnxp5
         1M4Zqvp0M9IArBP8s3nXko7d88TamMMZ9C6BXQcfw0xUnFIFnxe2OZAoJ6SdZHvmmBQ1
         X81ZqKFptvBVqtpkLPzxGyjiLqRVyolDkZyHujjJyXHq0SDE/ixf7q8dBk9lkQL8JSF8
         hwnmoLjfJLsspHScFO+cnXxkKZXKiXJzMZK/fu3ixSJl0TSswBvq6ErIWagoaLht/dWv
         1BC9N8fMO9POkMYTFXB38t6fo/NzlnnCIF1GFZTPP09Yxw5RzBi7oWyLIeIUwl2k4iGv
         0WYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773257104; x=1773861904;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=ibLQ5wY2D6UHG6MJbChHCM8vDme8uvD6Axpd7zdJp8I=;
        b=ai99srSajnaPK/gTRpc17e2IE96QhsLQPv6o3+pGFBQose5vV5DVHuNQTPDsb6smTZ
         0JMUaXfkDxBMS/6I7ARAelUHYMSTNaGfVCwUnpBfL3Y9YkXRih+oVMtwSYMvgZ4eiNwM
         Rr27cNPeLXePx1jKMy3ySsn8lOThy/HNQaSAJNn5giveFyVATTF25yVvK3BCy6dCT+yU
         STB+TjDsh1/8tBtRDdfJz3OFGGq588IntsZm06Auh0YSVY00raene7xTXBIgQJT5gS4U
         PDaBnqddb/TnhfWB2xUxR+kMjUeIp6An/wvzZfWUjv6PE9qGNw+Sm0EaTRddPfFsYTC4
         pXPg==
X-Forwarded-Encrypted: i=1; AJvYcCWXiy5YpY5RTZ48LBPcnrSbdig2OdzPsRSuV9Cw8W0O1vlk9wPMssiHBZVnKpo18/pHBfl9iALBHQ0bkjzWkJJAhw==@vger.kernel.org
X-Gm-Message-State: AOJu0YzkLwBl32sD122ysfVRRA8gd3NcoLoCQjAt7sS6/+K3/d8WU34I
	EGdHfhsVGCIFYRuKD+0Sp7AwYX8X2BygHJGigUHQWRty6uOEe0XXsVUD
X-Gm-Gg: ATEYQzxXuSvLuPAXYa/dDBnylBjNFlMZ1FoyXhtdG7H7AUWxSTdoyihHyJCpeLfp/06
	6etekrvJqXDLimM5Og1EAYhNHqGgXjhUDOZ6oF1JEDGvTV4wEnUSnCnTJ7EeZqy5kdfoxv/uhtU
	BwQmYO3BiQK/a4nj7HCZIUcmwPYXbXV7I688T3ZWMg/95GKFUuNLK960TMzA7QKe0WfDMEWkEBU
	tsGUcMqLeQOysYedbWekcw/TbrQRJYM6iG+se40/EpmVunoQit+1l0lh8PfcWOLl909NXQeS1gu
	ib3lJAFKV5ytsrC+HTiydoXKvocrOAavJd6wKHx4Lsz379FSdqdBPeyfK2x3Am01IZUJjg4on8A
	LSkIYHWzMtu7G2nhEc4nYZSuQuRtWzrZXxwstvA/L9m6A2sf1uLLf4AaPT1yYtoHzpdNbqJ8hEA
	B0tjixofQsJDEyagibfOtlyWZHDrE3ghxbcG6JK09fVU34CZ22
X-Received: by 2002:a05:6000:2886:b0:439:c202:99a2 with SMTP id ffacd0b85a97d-439f843c98amr7586895f8f.52.1773257103630;
        Wed, 11 Mar 2026 12:25:03 -0700 (PDT)
Received: from localhost.localdomain ([2a00:23c4:a758:8a01:38b7:8ca3:cb55:d344])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-439fe20bd9csm1323210f8f.21.2026.03.11.12.25.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Mar 2026 12:25:03 -0700 (PDT)
From: Biju <biju.das.au@gmail.com>
X-Google-Original-From: Biju <biju.das.jz@bp.renesas.com>
To: Thomas Gleixner <tglx@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>
Cc: Biju Das <biju.das.jz@bp.renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	Biju Das <biju.das.au@gmail.com>
Subject: [PATCH v5 02/15] dt-bindings: interrupt-controller: renesas,rzg2l-irqc: Document RZ/G3L SoC
Date: Wed, 11 Mar 2026 19:24:33 +0000
Message-ID: <20260311192459.609064-3-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260311192459.609064-1-biju.das.jz@bp.renesas.com>
References: <20260311192459.609064-1-biju.das.jz@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-29244-lists,linux-renesas-soc=lfdr.de];
	FREEMAIL_FROM(0.00)[gmail.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_TO(0.00)[kernel.org,glider.be,gmail.com];
	RCPT_COUNT_TWELVE(0.00)[12];
	FREEMAIL_CC(0.00)[bp.renesas.com,vger.kernel.org,gmail.com];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[bijudasau@gmail.com,linux-renesas-soc@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-renesas-soc,dt,renesas];
	NEURAL_HAM(-0.00)[-1.000];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[renesas.com:email,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,bp.renesas.com:mid]
X-Rspamd-Queue-Id: 1E47D269439
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

From: Biju Das <biju.das.jz@bp.renesas.com>

Document RZ/G3L (R9A08G046) IRQC. The IRQC block on the RZ/G3L SoC is
nearly identical to that found on the RZ/G3S SoC, with the following
differences: it supports more external interrupts and GPT error
interrupts, and adds registers for GPT/MTU interrupt selection and shared
interrupt selection between external interrupt and TINT. A new compatible
string "renesas,r9a08g046-irqc" is therefore introduced for the RZ/G3L
SoC.

Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
v4->v5:
 * No change.
v3->v4: [4]
 * Updated commit description.
v2->v3: [3]
 * Dropped items and instead used enum for single compatible values
 * Add minItems for interrupts and interrupt-names properties of 
   the RZ/{G2L,G2UL,Five,V2L} SoCs
 * Replaced maxItems->minItems for interrupts and interrupt-names
   properties of the RZ/G3L SoC.
v1->v2: [2]
 * Simplified the binding using pattern

[4] https://lore.kernel.org/all/20260227140316.308106-3-biju.das.jz@bp.renesas.com/
[3] https://lore.kernel.org/all/20260204180632.249139-3-biju.das.jz@bp.renesas.com/
[2] https://lore.kernel.org/all/20260206111658.231934-3-biju.das.jz@bp.renesas.com/
[1]https://lore.kernel.org/all/20260204142320.103184-2-biju.das.jz@bp.renesas.com/
---
 .../renesas,rzg2l-irqc.yaml                   | 43 ++++++++++++++++---
 1 file changed, 36 insertions(+), 7 deletions(-)

diff --git a/Documentation/devicetree/bindings/interrupt-controller/renesas,rzg2l-irqc.yaml b/Documentation/devicetree/bindings/interrupt-controller/renesas,rzg2l-irqc.yaml
index a0b57d808639..3a221e1800a0 100644
--- a/Documentation/devicetree/bindings/interrupt-controller/renesas,rzg2l-irqc.yaml
+++ b/Documentation/devicetree/bindings/interrupt-controller/renesas,rzg2l-irqc.yaml
@@ -30,7 +30,9 @@ properties:
               - renesas,r9a08g045-irqc     # RZ/G3S
           - const: renesas,rzg2l-irqc
 
-      - const: renesas,r9a07g043f-irqc     # RZ/Five
+      - enum:
+          - renesas,r9a07g043f-irqc    # RZ/Five
+          - renesas,r9a08g046-irqc     # RZ/G3L
 
   '#interrupt-cells':
     description: The first cell should contain a macro RZG2L_{NMI,IRQX} included in the
@@ -48,17 +50,17 @@ properties:
 
   interrupts:
     minItems: 45
-    maxItems: 48
+    maxItems: 61
 
   interrupt-names:
     minItems: 45
-    maxItems: 48
+    maxItems: 61
     items:
       oneOf:
         - description: NMI interrupt
           const: nmi
         - description: External IRQ interrupt
-          pattern: '^irq([0-7])$'
+          pattern: '^irq([0-9]|1[0-5])$'
         - description: GPIO interrupt
           pattern: '^tint([0-9]|1[0-9]|2[0-9]|3[0-1])$'
         - description: Bus error interrupt
@@ -75,6 +77,8 @@ properties:
           const: ec7tie2-1
         - description: ECCRAM1 error overflow interrupt
           const: ec7tiovf-1
+        - description: Integrated GPT Error interrupt
+          pattern: '^ovfunf([0-7])$'
 
   clocks:
     maxItems: 2
@@ -106,6 +110,24 @@ required:
 allOf:
   - $ref: /schemas/interrupt-controller.yaml#
 
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - renesas,r9a07g043f-irqc
+              - renesas,r9a07g043u-irqc
+              - renesas,r9a07g044-irqc
+              - renesas,r9a07g054-irqc
+    then:
+      properties:
+        interrupts:
+          minItems: 48
+          maxItems: 48
+        interrupt-names:
+          minItems: 48
+          maxItems: 48
+
   - if:
       properties:
         compatible:
@@ -118,12 +140,19 @@ allOf:
           maxItems: 45
         interrupt-names:
           maxItems: 45
-    else:
+
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - renesas,r9a08g046-irqc
+    then:
       properties:
         interrupts:
-          minItems: 48
+          minItems: 61
         interrupt-names:
-          minItems: 48
+          minItems: 61
 
 unevaluatedProperties: false
 
-- 
2.43.0


