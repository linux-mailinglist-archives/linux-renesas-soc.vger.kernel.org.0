Return-Path: <linux-renesas-soc+bounces-27983-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id AOpPFlvOhWn0GgQAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-27983-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 06 Feb 2026 12:19:55 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 05918FD21E
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 06 Feb 2026 12:19:54 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id DAE1F302D944
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  6 Feb 2026 11:17:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4CFF7399032;
	Fri,  6 Feb 2026 11:17:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MPaoxtGq"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E36D5395D85
	for <linux-renesas-soc@vger.kernel.org>; Fri,  6 Feb 2026 11:17:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770376623; cv=none; b=jHIND+ovuuFzkgYsuqwf5kNYHU9iETEXrn2nqA4p12j+4+IQzFLOaLN72MhxBhAORrpqWmlGmSb1bKc9l4s+9vzje/0NzIDc9KIs+L12ApNKC7pqrofv7sRXpehy0J1v1amlRc2JWkVOKQstqmQL5sksJu7GIZQIDKMIP/YaGQ0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770376623; c=relaxed/simple;
	bh=Izq0cUu5w2nF36O0r35AWK5tHeyy5cnVSuhACXKr6Ew=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Mu3Af93glmUcfEOOql1hsq4rQq7IJf2RFOtNw/bodk5n3SR4qbcrpwV1iV69ow11/x5ZGPBtI/VczkUKK3uzlenC3OlZvTDIjmDWvIRHeNEqQWfQsx2P90on816s8/hzcei/TLCq6IvpExdJ1ikCqbF/cE2rUg9QZGEIgrkHg60=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=MPaoxtGq; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-4801c2fae63so15618135e9.2
        for <linux-renesas-soc@vger.kernel.org>; Fri, 06 Feb 2026 03:17:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770376621; x=1770981421; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=js7qKdAU/TJ7iQQDl75PpIldtNM8YY+mFLcGjFDXtNk=;
        b=MPaoxtGqob0dY8iP+Te79yVJipmnerX7pG273vItwAZIA6h++l95pz4rsUdV9+BwiT
         43orNWsZYRkl9b04UGLVn8yvNylWebTi18Qi2eraDssPViRUK19KhRrk4f/vCQZW2tCd
         C/O75ngvAxjnFsSNt0UfpI+Bo8ezesF2H/DseKDq7k3wKKSaCtHS6U1jyRb+Wg+OdR2/
         Gvr1Y4EmSQoRVO1sAH8T9Oafa15kYR/BKymTgGJux26Mx4b3PAUSRYzvCzf+Zv1Tx4aw
         /yTnxgocTfpfXFgIysIJO+m/eESKax40lS1LnLPYYXZSAxi8hpSsNBxWBUfP/h4vXyxD
         UG1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770376621; x=1770981421;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=js7qKdAU/TJ7iQQDl75PpIldtNM8YY+mFLcGjFDXtNk=;
        b=WAace03zfWN/s9Xo8MFaSYxCNWHRfb9MWi9649Bs6vQBFrSesQOGNpYO0IvQ/SvSeX
         4evyMhk1RfTmGHMedripVU3i6Dxsk6naq8iWfJRLwc2/16/f/CHP0RI3hOg/aXcoka0+
         XCPx0qL26SecudZDiS8JIEu6fWJeIuBgVy1MJORkrl8fpsELgooVEQEOZ3mmZLAFjyWO
         XcPl4byfuhEtShFIeLMgcg4BcBF0DC99ZuYEE76WHX2AQQCl2zM/0DmzbGCHsPQZdIqJ
         zwboaBWPM4z/iDJtqFb17wWGkFUDxE/Z3Be6GiOmqPMZD8XmvUms/RDEwB8o0EWXUeSs
         dgtA==
X-Forwarded-Encrypted: i=1; AJvYcCX3s4U/aoVUPdUQGoibFMatuvE50464tXufW7It97KK1FA7BIhvCYXVTHJBQEY/+ym6jUha+EEJcig6tmZeoasGvA==@vger.kernel.org
X-Gm-Message-State: AOJu0YzAO2s/gcl2bUTkMzLEtl2o8G8BOzZQ8AGAwDXUEJMosXZ++onJ
	fsMCoFmP7/x7w/4JXx2MV2GR7m/Rl9JXkAw2DqhNquYUc3cpn8rrmzi40QZ9YeOh
X-Gm-Gg: AZuq6aKHPFPxmeRiEyb/4B5hgnYIKTS+kMI3OfEeGSY8b1/kjWw4oCGupsTetTDrkIP
	WQfuTqhJLsJrhfqKdrpAbmTEwujC87d+COz25K7yOUDAiBekrpaLw7PAnsse6IXmBhICcEoHFAg
	lt7u5xGerrXzX0grv2WSdrsORyr9vKsb+FMSgDfYc4yIO+qTYBQvtcYXwwSDgytxjALNsGTwR7E
	b87qat9i9uSney1yfWnGnMsBvLbGHfK3mGxAcQjAzuc1Zh8fDKgvAfZEVxqH+stykJvaH3RpjPQ
	1htll9Qm6usGikHYXtxc0TtRwcli45UsXUSbMA3gr7oI5Q6fmQY2WH2PCxUJhpf5CDG+VnXHTr3
	6AOwN9lR5I+oWBQ+hk3SC9h8aTn/pCSZSluaJHkme5bTnncy6HGpyqO9Hk9nN1tyETpIzc2lYA+
	icw2LttweDacqtRX95bA==
X-Received: by 2002:a05:6000:40ca:b0:436:192d:76f8 with SMTP id ffacd0b85a97d-4362933c7f4mr3097029f8f.2.1770376621146;
        Fri, 06 Feb 2026 03:17:01 -0800 (PST)
Received: from biju.lan ([2a00:23c4:a758:8a01:1e64:f8d5:9d7a:19d4])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4362972fa4csm4746380f8f.26.2026.02.06.03.17.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Feb 2026 03:17:00 -0800 (PST)
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
Subject: [PATCH v3 1/9] dt-bindings: interrupt-controller: renesas,rzg2l-irqc: Use pattern for interrupt-names
Date: Fri,  6 Feb 2026 11:16:44 +0000
Message-ID: <20260206111658.231934-2-biju.das.jz@bp.renesas.com>
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
	TAGGED_FROM(0.00)[bounces-27983-lists,linux-renesas-soc=lfdr.de];
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
X-Rspamd-Queue-Id: 05918FD21E
X-Rspamd-Action: no action

From: Biju Das <biju.das.jz@bp.renesas.com>

Simplify the bindings by using pattern property for interrupt-names.

Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
v2->v3:
 * No change
v1->v2:
 * New patch.
---
 .../renesas,rzg2l-irqc.yaml                   | 120 ++++--------------
 1 file changed, 23 insertions(+), 97 deletions(-)

diff --git a/Documentation/devicetree/bindings/interrupt-controller/renesas,rzg2l-irqc.yaml b/Documentation/devicetree/bindings/interrupt-controller/renesas,rzg2l-irqc.yaml
index 44b6ae5fc802..a0b57d808639 100644
--- a/Documentation/devicetree/bindings/interrupt-controller/renesas,rzg2l-irqc.yaml
+++ b/Documentation/devicetree/bindings/interrupt-controller/renesas,rzg2l-irqc.yaml
@@ -48,107 +48,33 @@ properties:
 
   interrupts:
     minItems: 45
-    items:
-      - description: NMI interrupt
-      - description: IRQ0 interrupt
-      - description: IRQ1 interrupt
-      - description: IRQ2 interrupt
-      - description: IRQ3 interrupt
-      - description: IRQ4 interrupt
-      - description: IRQ5 interrupt
-      - description: IRQ6 interrupt
-      - description: IRQ7 interrupt
-      - description: GPIO interrupt, TINT0
-      - description: GPIO interrupt, TINT1
-      - description: GPIO interrupt, TINT2
-      - description: GPIO interrupt, TINT3
-      - description: GPIO interrupt, TINT4
-      - description: GPIO interrupt, TINT5
-      - description: GPIO interrupt, TINT6
-      - description: GPIO interrupt, TINT7
-      - description: GPIO interrupt, TINT8
-      - description: GPIO interrupt, TINT9
-      - description: GPIO interrupt, TINT10
-      - description: GPIO interrupt, TINT11
-      - description: GPIO interrupt, TINT12
-      - description: GPIO interrupt, TINT13
-      - description: GPIO interrupt, TINT14
-      - description: GPIO interrupt, TINT15
-      - description: GPIO interrupt, TINT16
-      - description: GPIO interrupt, TINT17
-      - description: GPIO interrupt, TINT18
-      - description: GPIO interrupt, TINT19
-      - description: GPIO interrupt, TINT20
-      - description: GPIO interrupt, TINT21
-      - description: GPIO interrupt, TINT22
-      - description: GPIO interrupt, TINT23
-      - description: GPIO interrupt, TINT24
-      - description: GPIO interrupt, TINT25
-      - description: GPIO interrupt, TINT26
-      - description: GPIO interrupt, TINT27
-      - description: GPIO interrupt, TINT28
-      - description: GPIO interrupt, TINT29
-      - description: GPIO interrupt, TINT30
-      - description: GPIO interrupt, TINT31
-      - description: Bus error interrupt
-      - description: ECCRAM0 or combined ECCRAM0/1 1bit error interrupt
-      - description: ECCRAM0 or combined ECCRAM0/1 2bit error interrupt
-      - description: ECCRAM0 or combined ECCRAM0/1 error overflow interrupt
-      - description: ECCRAM1 1bit error interrupt
-      - description: ECCRAM1 2bit error interrupt
-      - description: ECCRAM1 error overflow interrupt
+    maxItems: 48
 
   interrupt-names:
     minItems: 45
+    maxItems: 48
     items:
-      - const: nmi
-      - const: irq0
-      - const: irq1
-      - const: irq2
-      - const: irq3
-      - const: irq4
-      - const: irq5
-      - const: irq6
-      - const: irq7
-      - const: tint0
-      - const: tint1
-      - const: tint2
-      - const: tint3
-      - const: tint4
-      - const: tint5
-      - const: tint6
-      - const: tint7
-      - const: tint8
-      - const: tint9
-      - const: tint10
-      - const: tint11
-      - const: tint12
-      - const: tint13
-      - const: tint14
-      - const: tint15
-      - const: tint16
-      - const: tint17
-      - const: tint18
-      - const: tint19
-      - const: tint20
-      - const: tint21
-      - const: tint22
-      - const: tint23
-      - const: tint24
-      - const: tint25
-      - const: tint26
-      - const: tint27
-      - const: tint28
-      - const: tint29
-      - const: tint30
-      - const: tint31
-      - const: bus-err
-      - const: ec7tie1-0
-      - const: ec7tie2-0
-      - const: ec7tiovf-0
-      - const: ec7tie1-1
-      - const: ec7tie2-1
-      - const: ec7tiovf-1
+      oneOf:
+        - description: NMI interrupt
+          const: nmi
+        - description: External IRQ interrupt
+          pattern: '^irq([0-7])$'
+        - description: GPIO interrupt
+          pattern: '^tint([0-9]|1[0-9]|2[0-9]|3[0-1])$'
+        - description: Bus error interrupt
+          const: bus-err
+        - description: ECCRAM0 or combined ECCRAM0/1 1bit error interrupt
+          const: ec7tie1-0
+        - description: ECCRAM0 or combined ECCRAM0/1 2bit error interrupt
+          const: ec7tie2-0
+        - description: ECCRAM0 or combined ECCRAM0/1 error overflow interrupt
+          const: ec7tiovf-0
+        - description: ECCRAM1 1bit error interrupt
+          const: ec7tie1-1
+        - description: ECCRAM1 2bit error interrupt
+          const: ec7tie2-1
+        - description: ECCRAM1 error overflow interrupt
+          const: ec7tiovf-1
 
   clocks:
     maxItems: 2
-- 
2.43.0


