Return-Path: <linux-renesas-soc+bounces-30275-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 4N3vOKU2xGnkxQQAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-30275-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 25 Mar 2026 20:25:25 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 788DC32B2F0
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 25 Mar 2026 20:25:25 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id DD6B0306A02F
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 25 Mar 2026 19:25:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 01EF33612E8;
	Wed, 25 Mar 2026 19:25:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="f7YkUyqf"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E5AE3537EB
	for <linux-renesas-soc@vger.kernel.org>; Wed, 25 Mar 2026 19:24:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774466699; cv=none; b=cMFP4TBA8XzNdw7fPYMTuZg/LRyGiZX2V5cy0rKEVysJgGb9yzC6uNelnI3T1QtT2N/8fgDxOlaULl6NQN9896m5/M52PAW4Xwcz23nk/KufWa4rSqDt+Oyaf+yixoGnlO9IgoXTwrmYVW5bMmu3EwoOYB1wWqvQrJnsPU3rkbg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774466699; c=relaxed/simple;
	bh=VLqRs4Z+TlZFkqPL9lA/KP2hABPrJ6FXrZ5BEUxerfU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=F7WgBebKAeS/jPtNLuRr2Z7WOUUdyjI1yq7Wt2DzFQXYLTDRHU6Uk3/SpLodYMbpi/tw7oK/1HDb9xLl589Wi+tO+J5yod4xkmMFypMFFWIe0qQqVIBqfINTs/yOBdSc1xCMihYzMtVsNgOR0S/sXC68XYKGKJPyYPwy7VosKrw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=f7YkUyqf; arc=none smtp.client-ip=209.85.221.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-439b94a19fdso152704f8f.0
        for <linux-renesas-soc@vger.kernel.org>; Wed, 25 Mar 2026 12:24:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774466696; x=1775071496; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mFx6UUPP8hEeX+S9NN+ZbAQ52l6KXscUunPIZqDqnbg=;
        b=f7YkUyqfxwgeTdF0HkWPV/I8WvbL/eJVIKReWPo03Ynp6t/RvJCtji6UQUKe3n6G4w
         mrkrXOdL5hb2sBleXd5evtKHkyEA7KLMRNhYeBtlYtmhJ5v+jfhDAFa+/WQzh9nWpbS5
         8fuC2BoDYzGL48ml1BBuzXmzzN/mTqMPLSO7rw5Av8c+C07ARGmezEzE5Fgzhxb3Ajhl
         7gfFvgKJJri+s2SXpqNOoOcKbt/SlRy0dxeRs6TQY/yZyrdxHO0PkjLOPagSwhYDlCfa
         avMyLX3HoSHra0M4GoPKbOoopVZoV+2eIJoYm0TwQk+LK9Q9+Sn9xsStJ3KusuKe8C5m
         ODgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774466696; x=1775071496;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=mFx6UUPP8hEeX+S9NN+ZbAQ52l6KXscUunPIZqDqnbg=;
        b=qfCLcMNBYTm7W3762Kwn3MhBk0jzY+IAUP9A1HGo4SzHbln9ERg+/SqeUoc0iuRuef
         mH1sqwFAhCriUks1mLUoqihLXi7iRwteFzN9iL4g1ahWe+EH3iCZq/DMNBwBFac7ccId
         MbAN3YbX3Y6HLUFGXbjHMeKtRYjInwvBfTyNj6J6NvH5T6WRFttJAFhUNxr6mqyLSO1i
         HIt11SpuVhnXfEK1aweGFkDQ98PBsZTX7FqN8RMqTgNTQCEUtoACFqgXOqunVYAmxhE3
         opYD+L+22SBrxDJRRVdsD3QJlgFalBqttT0gWbfGR6nLZBtohkNvmmr5s8c7ao0ucx9t
         pBcQ==
X-Forwarded-Encrypted: i=1; AJvYcCXfVlG9GI50MbKlIzKowzZEelxZUelDjQvS1FAJlZEG571Q9WNlwIhYhWXXBLjmU2g4yOGyYNrqqddE4NZq2eK3KA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yx7frYg08nVI9O7lhyMGpROU7PCaEhnOZ6br5mNoHwkJ+e/0KDs
	bFtVrlD5juVqJGVvwscpMboSfs/PfEbnf5UYDx7z1VY3YPdy0K9TSuht
X-Gm-Gg: ATEYQzxWYECck2VyT+vmp59tG42wrg2CzPcaVBPQbwt4gHJFLwibMwrTaKVyptlGEKg
	bsiZuERoiuTGKv93ip1xj9rkicv+oJrBX1MLqIFPM16fE7iRD/L/IYS6esp2lwzWiS0kxiIO1c3
	o0c2aZ+uDJ4b8Cebp4Nv28usTEcEbaMmMsRbD4L0+jYfY9+3a2oQyE+TUk/hMM3EGujQa9qPcNT
	VoQJJbjIKtCO6vV1GzIJzhYjuEml+DVTpvc+5KgcEPTApSOyUslbdz5A4J4XfeqAetsd5hrI/9s
	wZ0C5dM29B8k4jlyW9BgI84MxiF+9arwrsyge56WSCHWBceJLRbWcH/dySurLUJaRbJaruMYmyL
	JBJV8z8OI7tsmG/hJPg0cK/lWRYKt1UXfdfwB2NwKKXQVQD9D64cG7LtoKezbxYIJuz+XfJ14/U
	Ip8NitUiK/tFoyaIuOB+ThNaZu6QbW5nBdBzQCtUv97ULsrsNwSMJOXmXRTQ8=
X-Received: by 2002:adf:e6cd:0:b0:43b:4989:869d with SMTP id ffacd0b85a97d-43b88a055f2mr5072167f8f.33.1774466695675;
        Wed, 25 Mar 2026 12:24:55 -0700 (PDT)
Received: from localhost.localdomain ([2a00:23c4:a758:8a01:8138:17e4:88b1:468c])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43b9192e533sm2464485f8f.2.2026.03.25.12.24.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Mar 2026 12:24:55 -0700 (PDT)
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
Subject: [PATCH v7 02/16] dt-bindings: interrupt-controller: renesas,rzg2l-irqc: Document RZ/G3L SoC
Date: Wed, 25 Mar 2026 19:24:17 +0000
Message-ID: <20260325192451.172562-3-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260325192451.172562-1-biju.das.jz@bp.renesas.com>
References: <20260325192451.172562-1-biju.das.jz@bp.renesas.com>
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
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-30275-lists,linux-renesas-soc=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_TO(0.00)[kernel.org,glider.be,gmail.com];
	RCPT_COUNT_TWELVE(0.00)[12];
	FREEMAIL_CC(0.00)[bp.renesas.com,vger.kernel.org,gmail.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[bijudasau@gmail.com,linux-renesas-soc@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-renesas-soc,dt,renesas];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	FROM_HAS_DN(0.00)[]
X-Rspamd-Queue-Id: 788DC32B2F0
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

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
v6->v7:
 * No change.
v5->v6:
 * Collected tag.
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


