Return-Path: <linux-renesas-soc+bounces-28531-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 0BqyCAinoWmivQQAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-28531-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 27 Feb 2026 15:15:36 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id B53051B896E
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 27 Feb 2026 15:15:35 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id D558932493D9
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 27 Feb 2026 14:09:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 282C4436363;
	Fri, 27 Feb 2026 14:03:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WZacD31R"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4AEE342EEDF
	for <linux-renesas-soc@vger.kernel.org>; Fri, 27 Feb 2026 14:03:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772201005; cv=none; b=Nbb/61OrYyiUY3xYjvgKipdZqydr6JEnznyCxcQ+xqoKq0qK1qebRvLOOWeSvBvkPv9o0qNWiWWcJvVyPxoUPldvtDaiJbLLcO36SxDiKKqJdeG5XL/+i9j38DUMJl70CK6rIKzqPBVTw69eMyD+iktFGcCP4dB8k3PT7AwcNxo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772201005; c=relaxed/simple;
	bh=QUqm//47sqzlR1bPqkDSPBBuMfJfXmjgP9rB2/PFcpo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=eyzOkK6xizpdt5SjkLPOiACKwlMAs6r9YOnROkDpbgfh+5Mx3hNtsO4IqNRA4CoNYh+JXRS5GsjePQb+ZbSBQGhqQWToqxWH3g513IZEPtM28pLUBxYam2Bc+SBgl7tcqDAyBoKanBol3IE109POMg0PZHP+xCzqkFUf6eh6mr0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=WZacD31R; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-4836d4c26d3so13863665e9.2
        for <linux-renesas-soc@vger.kernel.org>; Fri, 27 Feb 2026 06:03:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772201001; x=1772805801; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Wna275egvqFrPSBNsVOGqQcVdyKY1fzBc45RIdU46c8=;
        b=WZacD31RtvoAB7QRWqXLi/nKfsIRAuNx8UGtksksve+IdfWK9rFUkOtyx+5NRARZJ1
         NM2AfF2PF7ujpOYj3ygIYcZO7cUvJBue2O5XK1xo//XGENTZErmrcBNJL6UNs82WX4pO
         cf5UPGQXy+7qHDysqmdeCX5wmZwtUUNZ9anQ//Xd7S07/MNa+7+kTsdnI4VczE7mAeTi
         c5oYwLhw+iUwZGJ8TgC4WUzFLIIjSjKkD49OhxdKA/ksNC2cjUHb4tue/+xF3dlWcV0t
         6/Kaw/f2c493eBYRVyqR2p2DSUcvmyRVW5FhcCrn7ksIopM11tvFkCmXACePhUntxaeP
         IcYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772201001; x=1772805801;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Wna275egvqFrPSBNsVOGqQcVdyKY1fzBc45RIdU46c8=;
        b=tqwpbFZSQjmvDjcaQrXWjwtNJvPH7UrcF1LFoMUd0shUPaZARPulh4lUFXU57GGqm/
         jQhHI8V1nTo1v19QwXEPZNplPOb5c2vGYEo+KNOL3+h/XEb3QXXHdfTIaFfWBdJ/sc+t
         quyR5aA/TTOqbSKxGUvS7BDkww4iKyaYJZKJCsVZBBuU6CI0cwbRxPpRf2mDjhnkpAiT
         Bg34LitckJCLhmb25o/eewI5tqOYPW59GLiUqQgFCWGl9OENsFoxFJDPnTZclXm+Aet8
         swZdg9A92sDfkBNgMVAAs8sMaHYK2xEiUfcN3GjPoSL2iMu8T+HCh+oIplUHrOTiCeT6
         ONsw==
X-Forwarded-Encrypted: i=1; AJvYcCW7uNKfS+XdYHYcMF1AilU755CafP4vG2isORg5RAojkcheqcvmRm7AEshQhGRTMI8SN/lv9Ej5duBLATzJPTFNTg==@vger.kernel.org
X-Gm-Message-State: AOJu0Yx2OMNzjCyOdHgrrNXy4SR/AUL6fFC3HgS6kHGXGLFkq9zNKvvw
	Aawxo0FJt6jbM3a9SCYuLc7gJdD+qBv8Mq98dH2EPXMqnpe8PP3mr4N2
X-Gm-Gg: ATEYQzwR0iWQu0e2N7FEkO3oAdueRWUd8uAl5VI50u6y3Aiuv8OVtdhGfR/9UZheozN
	j/xgBSK03ZbnPPeg2mOKs77Qll2x8vUxsxqj1NZtFcZt/JF331xP+RgkuUU8gyx9i9EQT2lNdvF
	rfts6Ylqpa/UBsvpxy4ZYDa29/tHFNshhMQrWYHOOH6zic6TyFZtPzh77iOZPeQNVGzQHjAUqv0
	M6qTOexm7YLKOgcIdbW9D2MjSoNgpojBYpaLDH7Q0FFpjwSN3Wuo8B6yuUEsT4S83gsAJOpWyNg
	V59nxEFLHUlGKRpL/dRTQ/NbLJJw6YRP3sFmAVrwc5aQXNI7L6Veirl8dlZptkWAnbTneDLS9OC
	lZRMDHfOnWS28uST/WllshujUWNb1mDZYt+bqxq1MKT9knFkWIbzuomhB3iZBeS/qFT1pzPFO7F
	DCibXXP9+w3Cd2nN3myt/aflRiIZD78/0=
X-Received: by 2002:a05:600c:3b02:b0:483:6fe1:c057 with SMTP id 5b1f17b1804b1-483c9c02efcmr43428985e9.21.1772201001265;
        Fri, 27 Feb 2026 06:03:21 -0800 (PST)
Received: from biju.lan ([2a00:23c4:a758:8a01:4d8b:fefb:26cf:1906])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4399c60feeesm7658811f8f.1.2026.02.27.06.03.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Feb 2026 06:03:20 -0800 (PST)
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
Subject: [PATCH v4 2/9] dt-bindings: interrupt-controller: renesas,rzg2l-irqc: Document RZ/G3L SoC
Date: Fri, 27 Feb 2026 14:03:02 +0000
Message-ID: <20260227140316.308106-3-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260227140316.308106-1-biju.das.jz@bp.renesas.com>
References: <20260227140316.308106-1-biju.das.jz@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-28531-lists,linux-renesas-soc=lfdr.de];
	FREEMAIL_FROM(0.00)[gmail.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_TO(0.00)[kernel.org,glider.be,gmail.com];
	RCPT_COUNT_TWELVE(0.00)[12];
	FREEMAIL_CC(0.00)[bp.renesas.com,vger.kernel.org,gmail.com];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[bp.renesas.com:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,renesas.com:email]
X-Rspamd-Queue-Id: B53051B896E
X-Rspamd-Action: no action

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
v3->v4:
 * Updated commit description.
v2->v3: [3]
 * Dropped items and instead used enum for single compatible values
 * Add minItems for interrupts and interrupt-names properties of 
   the RZ/{G2L,G2UL,Five,V2L} SoCs
 * Replaced maxItems->minItems for interrupts and interrupt-names
   properties of the RZ/G3L SoC.
v1->v2: [2]
 * Simplified the binding using pattern

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


