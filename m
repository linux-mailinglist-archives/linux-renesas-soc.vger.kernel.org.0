Return-Path: <linux-renesas-soc+bounces-27984-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id CF/iFW7OhWn0GgQAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-27984-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 06 Feb 2026 12:20:14 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id B17E0FD227
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 06 Feb 2026 12:20:13 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id CEAE1303C295
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  6 Feb 2026 11:17:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DDA8D39E6E8;
	Fri,  6 Feb 2026 11:17:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ROy3lGR7"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wr1-f68.google.com (mail-wr1-f68.google.com [209.85.221.68])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8652739B490
	for <linux-renesas-soc@vger.kernel.org>; Fri,  6 Feb 2026 11:17:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.68
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770376623; cv=none; b=TrczrmdwXhTJ27fBXX/Kc80PkowfOT1ji6KWcHurdZtJokmPHuPrlUOJHS32HmD58fbK5ZnL976QTPG55tTB6BKL/P2dXVlDOfyJDLf477F3SGbg9gMxzmLmBwEkcgXVcM0ldTg2Ay0b65hMX6OXp3zMZR+E7fQRPFyzatcGpb0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770376623; c=relaxed/simple;
	bh=sRZ8NNxWKbYHIVgVsApwxzatEQoFGwYTfEOA+5UQKjs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=FiBrABys6RwJo8ULchvdvISo1idlwS3X3Hji3x+6V3yUVv4Ru6Q84znDGhDI29k4heqKLTvU5wTACwN+BtbqeHyTId+BmiPCcs+TRM6slie7JI0aWkiXVfcInwko4sK6LL1XoRGt1os9B7mFfrrsIc0EwBLGDBAuWst1SkTaKuU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ROy3lGR7; arc=none smtp.client-ip=209.85.221.68
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f68.google.com with SMTP id ffacd0b85a97d-43284ed32a0so1272516f8f.3
        for <linux-renesas-soc@vger.kernel.org>; Fri, 06 Feb 2026 03:17:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770376622; x=1770981422; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=eq8ZhxrGXuOTWmcmPXPAszI3EhqRT9WZnElfRiN+dWk=;
        b=ROy3lGR7T1zT7wHgGk/8q7SEA2fHS07X99AN9Y4fCuEv8P/vbhCWVMDaLGMiWcrp99
         UQXbPPQsa6u43fyFjCQLvtVD2lwYfw7pwoUUMhs0k213cTeY2S5LF+LWpavM2xHA6Cn3
         UIa4/Af0ZC+M18i3a1Pu3HKeHQJtd4kMOSp4HVi92r848vMh4ZIAt3M5JtnwvULsf7Ve
         sX+6cYR7QnU+oJ0TrJwa7Wyy1bpFigIQ8Cr6lLr8u7mmEtjpLKsPyTYnsNYq6luvH7BV
         lT+gKKVND1keMnX0vPdOvxm/+XoZrwDhgH1KpVXXNq+1bWwtVvho10BOn/AV0mFfM5Cn
         YyFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770376622; x=1770981422;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=eq8ZhxrGXuOTWmcmPXPAszI3EhqRT9WZnElfRiN+dWk=;
        b=XyAlw60+y86KREZa9aIt0KnJfBqwMHw6Nzc5NCmxNCZya4Hy6cx9QfnDHHUkLhNnHp
         Doiqx73xqpWT/yU/jKWbiXNcf3V808k2wHr3haqdBEokCG217Ua2liL2Jftp3cyddWga
         6FQYhMWYxwjkZs758SEGT6O5LsPpqxOlSf5CY4IaHBRP2BNmkZUkHSADxr70C9ZN2ErC
         V2JxPp/LqJesYiDn1L/f61tnny58/f4sd6v/qZLgLr2TgFWuYkSeIa8DUB2hqweAjp3B
         1+XU9Yne3bkNKjNw3MzFKsdI5PiTFdHROQIvPVEsiHYF6b25qHHVplPw1icNXbxQRBtc
         GVDw==
X-Forwarded-Encrypted: i=1; AJvYcCXspnqpB/uKOHoO9UZqDYS0oZfqdHRIdkJbQUq+lNORBlfpsD/dLnASXxt24CuD/p1qxDFjZjsVvf/yaaC0SECzTg==@vger.kernel.org
X-Gm-Message-State: AOJu0Ywklf2I3pmMdMLBpCJyfW6eQatvboV1aca8TdIQ+tkxYQ+ydObJ
	do4ZYUYHBr4CgHoP7seVcBh5ZcbpEvhcSV57AJq2rYqriqsThOsPXpJ2
X-Gm-Gg: AZuq6aJKwZibqyC/UFlIrB3JVO2gaSjvNC0/1d2fe061MsWDDsDdiNnDB74OQymq/aU
	RKA3ofe+NwODX9TdCPvtEWz1UddxyU2dU4wRqpVYEEWVAs8vuh1jGRdDHPUcvYU6Yim8yApUYG1
	+UvvB7zrp2NRE4k8Sbs9kF6E2Kn9mJuP/lEG22OQpvF2YAB+sB2MLYuDFQ5FKeQOuSvoflB147r
	f/gVKD3J91v02ocBr7KDAWrVUWL1QaMMMJZbBysojNy3GXaY2g9CRqR4UiuU0JvTAad9sxsr+tL
	EmbziKYmxgFGV1HE0Jl1dHGJYkdKKG/sRi0GHNIa5gigT9Nez1rIM3OdPwy5ieQcLguO/FCBbBl
	bzy5K9SDgSQq3yUmTxOE5BPkmuywXmwSEnjA/LucNpYxF4Py7S8zNxaV/GVXV2jegB2aJb1pMiN
	3Ry0H3HLbUvZUx5GZfOQ==
X-Received: by 2002:a5d:5d87:0:b0:435:9f41:d54 with SMTP id ffacd0b85a97d-436293b29c8mr3344918f8f.60.1770376621784;
        Fri, 06 Feb 2026 03:17:01 -0800 (PST)
Received: from biju.lan ([2a00:23c4:a758:8a01:1e64:f8d5:9d7a:19d4])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4362972fa4csm4746380f8f.26.2026.02.06.03.17.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Feb 2026 03:17:01 -0800 (PST)
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
Subject: [PATCH v3 2/9] dt-bindings: interrupt-controller: renesas,rzg2l-irqc: Document RZ/G3L SoC
Date: Fri,  6 Feb 2026 11:16:45 +0000
Message-ID: <20260206111658.231934-3-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260206111658.231934-1-biju.das.jz@bp.renesas.com>
References: <20260206111658.231934-1-biju.das.jz@bp.renesas.com>
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
	TAGGED_FROM(0.00)[bounces-27984-lists,linux-renesas-soc=lfdr.de];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[renesas.com:email,bp.renesas.com:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: B17E0FD227
X-Rspamd-Action: no action

From: Biju Das <biju.das.jz@bp.renesas.com>

Document RZ/G3L (R9A08G046) IRQC bindings. The IRQC block on RZ/G3L SoC
is almost identical to one found on the RZ/G3S SoC with the difference
like it support more External IRQs, GPT Error Interrupts and also has
additional registers for GPT/MTU IRQ selection, shared IRQ selection
between external IRQ and TINT. Hence new generic compatible string
"renesas,r9a08g046-irqc" is added for RZ/G3L SoC.

Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
v2->v3:
 * Dropped items and instead used enum for single compatible values
 * Add minItems for interrupts and interrupt-names properties of 
   the RZ/{G2L,G2UL,Five,V2L} SoCs
 * Replaced maxItems->minItems for interrupts and interrupt-names
   properties of the RZ/G3L SoC.
v1->v2:
 * Simplified the binding using pattern
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


