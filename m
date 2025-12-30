Return-Path: <linux-renesas-soc+bounces-26189-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E7B2CE997F
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 30 Dec 2025 12:58:41 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 1939D301935C
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 30 Dec 2025 11:58:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D04AB2EB847;
	Tue, 30 Dec 2025 11:58:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HNvzadZI"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CAB102E9EDA
	for <linux-renesas-soc@vger.kernel.org>; Tue, 30 Dec 2025 11:58:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767095901; cv=none; b=ADcX3p5TM2iyXgJwyLHevmNMLh96bD0jew5e9ykPnCg6RNkrzXRX4MGLNeCbspedaWh/tJ7jAHMg66wrNrZHlCfzbxa369hKvUELrX70mcEYLyvkj8vpsRobe/uRPYu6vOOjDxClROG+1Eg8h3FLZ1cnzEzeMJ73YGes7Ye22J0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767095901; c=relaxed/simple;
	bh=OUvQ7oMO2uFr9fGsfbR1wf4//xDMs1kHRoIFW2NBxuM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=gilRNFAQ7kolezkf4SRBKxS9P1NNorE3gM4nPbe7UIbGJlSGgo+nMmH2lymC4N5L1tiG9c33SmfVr7TgBDGmFKjVY8X9CB/p9AwADdoRgCmJoZVMZxKBsCfGURBd6BYnUsbbjDIzDo9mf7ZQmIpBK4zHOdKz0pc2HGv4GkgRv3Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HNvzadZI; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-47795f6f5c0so53131535e9.1
        for <linux-renesas-soc@vger.kernel.org>; Tue, 30 Dec 2025 03:58:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1767095898; x=1767700698; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Ih4AMzp1qzpw/x5kP2zA7D0V9ItD81etj5nbb7Pbm9o=;
        b=HNvzadZIkB50KhwdjK/B103VhqkJcJjsyoW8v1xwE3ggPCyi70hVtcCv4gOeINNDsS
         2QiyoZ3WFl5VINcpHA3m8Tmz8QVGyCEZTLB4G23X3EdAdmRh5o5ReoGlge2BVik0cWle
         RR5kDjdd5IvVgsYBVo3UhOIMdvMZIUQPFNQTFni6I8zK+g1QEUaPNPBV+TkrUAozOeAD
         Og6K/TkplnFxRONhVBoTphBpinoJf8AN+hsoYHE7hBJeFbtWIfg1w793wo5H28xZDEUL
         hqWAwtftVJ8tvLj05+UsqH/xfxEHMJHrQ38bIIbxoI3a1wNDmTo/pE8UfQIubG6hKYLa
         t91A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767095898; x=1767700698;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Ih4AMzp1qzpw/x5kP2zA7D0V9ItD81etj5nbb7Pbm9o=;
        b=lAqGtyrU38ByKMAdZqb57UZAsdVGoEzbHScqvlXZO+a3Ku6DFeRiQZ3uvpL4uGY9QX
         iOsJ0P35u7S7q5dOBH0bR/waaI1xRaDlYmNMF3ihcDInQNGfvhN4KQlpXICq0Py0hFLK
         u1YTE1k4wSXroaocAbPyGH6bRxMr/Ynx+A06YFls5NRrhE6dmB6GcHpbqGdx2nK8c5k8
         VCWoyO8bLbVoZDq+bDop8k8p26oWqDRY+LgGbZ0uIww8Bdd8DK9eN+Qg+HNOXSRcmvb9
         auoQnqdMyTWXDsEeUFwi81UJo0A6emK4r2tYcEPLp+7AXLJ2bG6Gd/c6mKe2Gc92Kqzb
         0C5A==
X-Forwarded-Encrypted: i=1; AJvYcCXv8RvXG9sNw7jd/dJikwJw1hoHLRsAtS2g33u0m6G/7mv1Tnny8DYJ4bGSh0o2HdN12BTbePCYHNdwE7fw+sJyHA==@vger.kernel.org
X-Gm-Message-State: AOJu0YyKn8Q6eCEgPaRuQZmwmyO8Q5OKFCu0KYG0rjkBogvEDBEXjhFU
	JOnlCW+gwncYMijoIazWbIazGvusNXD9iE0sUE8guET7sNkfgqTF51e8
X-Gm-Gg: AY/fxX67shhhXaMmVnmzuxlPCYgwgn1q1pDySQ6AuJUx8sjpk5RA8Wv0JTUeNJXUD6T
	P242T3r1yFnu6dPomTqtiIOwxGCXbaOMEsEqBk/Gae8Mi6GIPMXDItZp3Mu/QKc7GKu53b9bgE3
	mXec44G9dAYnlH0IWPcR5sgqijcArNCQ8NyZPGBLgnVWdiwfidlzFIq8qHtEjGbk1g+wxNiywp7
	oxVKv/ftO8bJeMgoKi+UiIqMpNzpaX6oNIf/A8xRNgWpEAGnbR/tAdkydRuJba1VXk1A/qv7/2h
	zQA7uUxMhAOn7yIRopEfxwyaNo/gMYoAIKi3GYe7deMhYqKn3eHFic0BgQhJ2JSU/oMfYpx8bad
	tGjx6cPiBYAZFDCIPqfI5sL+Qbq75XtyOhenNLHTvGGs8OqGNWpyKw5XAiXsqROtppzVZKmqHXq
	Gy8hzuV66paVEdepP/tMhCPfSaSpNC/Xk6W933jIoT7jkBzVpT0BVMO2x986jZ+yB3UeKycxplz
	WBwSotZY+2CZCiNlyfoX8eY
X-Google-Smtp-Source: AGHT+IHdDVC7lomz8TAuNBzU35/RQ1JXAvvT8J2ZMG5rpljK2zLHi7f6CAAFZSJR3isDZm6g7zv47A==
X-Received: by 2002:a05:600c:1c13:b0:477:63dc:be00 with SMTP id 5b1f17b1804b1-47d195893d6mr381036625e9.25.1767095897558;
        Tue, 30 Dec 2025 03:58:17 -0800 (PST)
Received: from iku.Home ([2a06:5906:61b:2d00:efaa:981e:926e:8957])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4324eaa64cesm68337227f8f.35.2025.12.30.03.58.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Dec 2025 03:58:16 -0800 (PST)
From: Prabhakar <prabhakar.csengg@gmail.com>
X-Google-Original-From: Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To: Marc Kleine-Budde <mkl@pengutronix.de>,
	Vincent Mailhol <mailhol@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	Biju Das <biju.das.jz@bp.renesas.com>
Cc: linux-can@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Prabhakar <prabhakar.csengg@gmail.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH v2 1/4] dt-bindings: can: renesas,rcar-canfd: Specify reset-names
Date: Tue, 30 Dec 2025 11:58:11 +0000
Message-ID: <20251230115814.53536-2-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20251230115814.53536-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20251230115814.53536-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Specify the expected reset-names for the Renesas CAN-FD controller on
RZ/G2L and RZ/G3E SoCs.

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
---
v1->v2:
- Moved reset-names to top-level properties.
---
 .../bindings/net/can/renesas,rcar-canfd.yaml  | 33 +++++++++++--------
 1 file changed, 19 insertions(+), 14 deletions(-)

diff --git a/Documentation/devicetree/bindings/net/can/renesas,rcar-canfd.yaml b/Documentation/devicetree/bindings/net/can/renesas,rcar-canfd.yaml
index e129bdceef84..9bfd4f44e4d4 100644
--- a/Documentation/devicetree/bindings/net/can/renesas,rcar-canfd.yaml
+++ b/Documentation/devicetree/bindings/net/can/renesas,rcar-canfd.yaml
@@ -122,6 +122,11 @@ properties:
 
   resets: true
 
+  reset-names:
+    items:
+      - const: rstp_n
+      - const: rstc_n
+
   renesas,no-can-fd:
     $ref: /schemas/types.yaml#/definitions/flag
     description:
@@ -195,13 +200,6 @@ allOf:
           minItems: 2
           maxItems: 2
 
-        reset-names:
-          minItems: 2
-          maxItems: 2
-
-      required:
-        - reset-names
-
   - if:
       properties:
         compatible:
@@ -239,13 +237,6 @@ allOf:
           minItems: 2
           maxItems: 2
 
-        reset-names:
-          minItems: 2
-          maxItems: 2
-
-      required:
-        - reset-names
-
   - if:
       properties:
         compatible:
@@ -299,6 +290,20 @@ allOf:
       properties:
         renesas,no-can-fd: false
 
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - renesas,r9a09g047-canfd
+              - renesas,rzg2l-canfd
+    then:
+      required:
+        - reset-names
+    else:
+      properties:
+        reset-names: false
+
 unevaluatedProperties: false
 
 examples:
-- 
2.52.0


