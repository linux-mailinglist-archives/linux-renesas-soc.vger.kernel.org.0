Return-Path: <linux-renesas-soc+bounces-30061-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id IP7EEoPfv2ml9wMAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-30061-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Sun, 22 Mar 2026 13:24:35 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 34BA52E926F
	for <lists+linux-renesas-soc@lfdr.de>; Sun, 22 Mar 2026 13:24:35 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 9AF6D300612D
	for <lists+linux-renesas-soc@lfdr.de>; Sun, 22 Mar 2026 12:24:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 886883806D8;
	Sun, 22 Mar 2026 12:24:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="h4ERTGXE"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 39A3B36EA8E
	for <linux-renesas-soc@vger.kernel.org>; Sun, 22 Mar 2026 12:24:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774182270; cv=none; b=WVTbh8/Pw+xWE418q3Fvp0z7GybJXDX+g/D2pr7U2b4XZCYXdizFLI9knpmoGzgbikhPl6LqvbIf/WY5KBNByvPW79hg5Aj090mCDYU/+JIx2jjXNkL522SqDIPkP4cpdpeXiCwl37J86MJBGBIimhLhAnuUp4bu+Gwog3Z7zlE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774182270; c=relaxed/simple;
	bh=NqL++QS6pCKA8dKHUyiOCiT56oWQTwHXVPj7oO5XapU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=sg8q5grj/bnaYtZSMBc5nDIEKraddyJQFoWHIX0J1lSvanROmBsDO+QFn4NE2OZzY08AS2dL69rmcMkJ89V9aIyWLiyyuTQxHAcbSYO8D/ml0dZQXnpub6alrDZG2OnsUzomTNp6+e4buv7SI+i1KXvXlKMpyHfFPN2q3wRLiPA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=h4ERTGXE; arc=none smtp.client-ip=209.85.221.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-439d8dc4ae4so2892347f8f.2
        for <linux-renesas-soc@vger.kernel.org>; Sun, 22 Mar 2026 05:24:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1774182266; x=1774787066; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gap/Q33IiQRtCOD/Ll2fknn9+W00XJGVBJHUg+QgTgw=;
        b=h4ERTGXEIZPYXgyqjMFNER4XF8Keqj/N/KzJDNLUta5zQK0Q4qWTXLyd24hbeILYLJ
         4MTQp1YLkMtPp+hua0Uh5LiCroI5ghfCGoxVUUMhBJFJWVOLehsYHy9a5316qL2S6F5Z
         JnwwffMfSDMUHhfwdlupCXZM+VJ/xdIV28ha479sSwVUqerC2y3axiIMHtbiIKUm99ol
         wq+6LK6ctPQh2cE0HZzPC17wc5nZ4547ppAeANL0p9reqMbgyWUjwPKQjVQg+5Njy7oY
         Q04XO2aJdDJ3OUls25iltby6Oumi1GFUC5kL8Qj/dgQCTLOLvWI4n2Z69iWxPD4/bGl6
         qxww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774182266; x=1774787066;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=gap/Q33IiQRtCOD/Ll2fknn9+W00XJGVBJHUg+QgTgw=;
        b=LfxXI03ua22G9VKmOJTZKzlwEXMKaW0Rxc/O9WkbXNc3XS7wrE/D6GNFp+KhHXiwMc
         nXEHzo5KJkcB0Yieslknxpvppkuh1Jz3l2Mbf2V/JVvVsMgj45VrmiEhMTs7a+ShBCcv
         naufI4B3U3XqAW9Eq2zP5/4ZHO4V+9e8rcJrLWvAZLdQuUGfBsh29WKB/u8F5sQqw1sG
         0jNbubtOKYjCXI+yhytxlPVMBthyjwXroYZQ5ghRJSe9wdoQ0oVOj1T6I9y1UMXf9KBI
         RCkijXlWZmkQL/fwgiRN5RuhmxQeWlsdfSOVP9dRXXA0wd0SSl8mDjC1PxIdcvN2U0bT
         WBxg==
X-Forwarded-Encrypted: i=1; AJvYcCVviENCn2FyMXHk8tai2N1gFBnpNsDTnjyE8+4WCNu+hRUAzl9rEG+ADSyCNHmlNQ9aXSkce8MIhoXj0MsW3u2Gkg==@vger.kernel.org
X-Gm-Message-State: AOJu0YyFSHD0Zut9MIXLzTLI+BChTe2yE3F4PBpdC+nmrjl+CskfZ5f0
	3ruRCBLeiC2U4qPEmxXOtsIQu0RYJzgCJ2hD0qvTw14ofZlrldqfvpqT
X-Gm-Gg: ATEYQzxze5xJpiDcZF8Xk96kFN71PRMeZ822vLBPnPAmqLTs3jBOwTvHU/dK0bf/gge
	/ZCnT6CMHS4QtYP7rDeEwzA4G3UXwwLQkDqlGNH/BtXYXEOSKBjuJokjJdJPPgFcjxBYNazhQOs
	PDBx/CY7w6krL2hIfxx1khavgcAFAcq3hF1tnooh2+dU6xnHOXyrMk65+0ax1Abz7/htBo+2YBu
	jJXrHQsB3CI9fQISKrLIZGCSo2NOImuF0uP60TMLZ/ZWAwOxKXgNBJItmUxoefEqVYXNWeWFxiG
	SIr9gWmUkLwnX5HoFUrmNXuL5u46tSL0KHyqrkc87s1n7vrKdpYHBoFSRrznn51UMjifXB7YSK4
	Tq4aiQ4IOTy1vk5RcB68C/8VBeL8dMlmIZhS+8O+r6jg8nZM8Hh5BW4X7yB13EjDqYUTgeHRdCW
	RNIpTw9wbdF7TMe2mqSJyxWvyelDDzoS/x4kYwj1MrNMeBe6Ro
X-Received: by 2002:a05:6000:24ca:b0:43b:45da:f296 with SMTP id ffacd0b85a97d-43b6423286fmr13975167f8f.11.1774182266443;
        Sun, 22 Mar 2026 05:24:26 -0700 (PDT)
Received: from localhost.localdomain ([2a00:23c4:a758:8a01:1bdc:7f84:18bc:1e56])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43b64703343sm21072695f8f.19.2026.03.22.05.24.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Mar 2026 05:24:25 -0700 (PDT)
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
Subject: [PATCH v6 02/15] dt-bindings: interrupt-controller: renesas,rzg2l-irqc: Document RZ/G3L SoC
Date: Sun, 22 Mar 2026 12:23:45 +0000
Message-ID: <20260322122421.132474-3-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260322122421.132474-1-biju.das.jz@bp.renesas.com>
References: <20260322122421.132474-1-biju.das.jz@bp.renesas.com>
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
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-30061-lists,linux-renesas-soc=lfdr.de];
	FREEMAIL_FROM(0.00)[gmail.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_TO(0.00)[kernel.org,glider.be,gmail.com];
	RCPT_COUNT_TWELVE(0.00)[12];
	FREEMAIL_CC(0.00)[bp.renesas.com,vger.kernel.org,gmail.com];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 34BA52E926F
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


