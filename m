Return-Path: <linux-renesas-soc+bounces-34813-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id TqY6BcASTWqGugEAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-34813-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 07 Jul 2026 16:52:48 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 7489B71CDBD
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 07 Jul 2026 16:52:47 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=SNGOlhvl;
	dmarc=pass (policy=none) header.from=gmail.com;
	spf=pass (mail.lfdr.de: domain of "linux-renesas-soc+bounces-34813-lists+linux-renesas-soc=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-renesas-soc+bounces-34813-lists+linux-renesas-soc=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 5A4753101174
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  7 Jul 2026 14:37:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AA45B42E8EC;
	Tue,  7 Jul 2026 14:36:54 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ECDE042B33D
	for <linux-renesas-soc@vger.kernel.org>; Tue,  7 Jul 2026 14:36:51 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783435014; cv=none; b=CrUgXvvM1ist/4hwJpHLgM4CEg9RgxvDornIvVuTy2NuUJOiFkVt8YL1F9A9iH10PpVCinl1SzCnR7FRLyZSmWLI3is7G4dnc2U6HErGe0WwG1QyUgFO77VKfB+orKGJ/MtmHCYpx1grvOAGmt5FUUC45raCr7jQOcPPJ2unXr4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783435014; c=relaxed/simple;
	bh=f/qTquKSSQFa0pqnnfjx53CGGTkR7V47887n0TkgzkI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=s2qTvcpDLbGv/y3NDWR4I6ZWoOnJrsK3jp5SEfzBgtAKPCZ03NovnksWVxjl60taGcG34VsNCbjpNOPL7ISzYIM3bBTuIvgWTQmKksVz6WNeoykNsVZDwcD1IkvjE7OXKXdT/75AMPxJUsNbXv9wgqCT2cF2XdEB/SH+BXh2mqI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=SNGOlhvl; arc=none smtp.client-ip=209.85.128.50
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-493c19bad03so40444255e9.2
        for <linux-renesas-soc@vger.kernel.org>; Tue, 07 Jul 2026 07:36:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783435010; x=1784039810; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=A33LPR2qSuWKQrk3c1ruPQev9Ob3rjxQcEtmfQ0dKn8=;
        b=SNGOlhvlwYqOqaiHWwZHqD/rRKvojBxf9B96D+e9TrU0+4Elyxxn93syw6DSV0OeUY
         IHgi6AkfYfM+6pvscT846YmZ6bAdHbdFn85CMbpxCyRgLgDUvWDhMi44SoyzyY5/meTg
         WhO0Y3+n9B7RUHWghlCkWI3gjd9Izp5xu+iQ9LTu5dNSc++v9gbVeJmKLERbdBJXr9bY
         B/5LSfyaEkKFAyGgmsuDu+nVp82tpZ2fyFGkDRqIaBdeca/O2/69UM99gLzkfbwWxWjN
         cQ3hsBrxt42q/j/vH7imBI1VLVhB1ngYpAtxkJe/wkIOlXlOFQz0TGeCVwUD9E06ODOC
         dqTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783435010; x=1784039810;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=A33LPR2qSuWKQrk3c1ruPQev9Ob3rjxQcEtmfQ0dKn8=;
        b=fKq2An3F4rc22X8ga1yB0BRBBcOZgF/dYJYGzVKMAMlz36Cjtp34/1nA19dHHUxW5n
         BphMj+zH7OudDv+Al6JKi8TQzo8oaP62UzTW+z0+L8yseQOef2wuM7ilvhM/YHnuERtd
         YeRrVY9K5oz5r6IJ+BmCV2IcN09Qv7A/92D7Yi9JJh11tiwCReq8TeTYI8rOb+Da7jHt
         zpAKbgqXiYtOTjACoDaEX72I/OhIEt6PTaHgtdVJZwCXT/zHjd7ebRfIpMOmly8/9gL9
         R+EX6xxKlGXtkrsYYdfRzzZfxO4P1dAJ5scK4xSHaxsz9XV1tb48wY6aBbaE2uwaXKwZ
         GL+A==
X-Forwarded-Encrypted: i=1; AHgh+Ro6Us9+vTcmFg4oPxMeELSotmRlIP7x433z4SxbyqfdMpvoTSLG/x3RCpQnWGaASUsUx6Jxd14h+i2h315aw8uugA==@vger.kernel.org
X-Gm-Message-State: AOJu0YxpUuHsk1cfwyNRNRi1l283KoqfVelMqWg0PNqa64GThzpQEjES
	Fze7IKE9owNBv0mJA0ndiPAh1YjElmWFVl4jMOet6o62kSsbk9Pyws5e
X-Gm-Gg: AfdE7cn0CmY032U4V9vsy/BhqZggg6q71Scy9dedzckwX9dE+j5shT+OUbSVtZ7m2gU
	z68MswF81sCXjD9YP7eDLujLVtkObRVnLa9pQo4wTBMco51RcCxiQFW8bHmeDm3NJch1nXFHksj
	IedFipVgY/fPlv/6FGN86vk9e2LMzq2eMiLOiKeS2mSGLWUm27cQKXbBLlYz7HrtflXGlZl+dCi
	plGJ+YHnjnB9dQK+MKBA+m4EdiT3ImM1TvaJsY55zGFTYIw041mNfhGuwSqzFbA7MIeqNmq8viA
	q3Ye4ukHpk+UUbDBA6qL0cpgEBXx2eadCP2WxIcCIAQAevCOg3swGUgHeIRC8qgt9wBC9Qnsx/q
	t5wS6vWjoxP3hiGz/JdrpT/Cop2PeIm8OQienRWHD3NRo6NQfym0uQ8Pju9ouhc+5WZAEAwM5Z/
	TM4Tuq1x8K/FHJFD4oS890nMSaUXBY5Ri461lIJg==
X-Received: by 2002:a05:600c:1f95:b0:493:aaf5:6e04 with SMTP id 5b1f17b1804b1-493df04d42dmr66260825e9.15.1783435010074;
        Tue, 07 Jul 2026 07:36:50 -0700 (PDT)
Received: from localhost.localdomain ([2a00:23c4:a702:d301:a4ac:4e7f:194a:852e])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47aa039ae44sm33228611f8f.23.2026.07.07.07.36.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Jul 2026 07:36:49 -0700 (PDT)
From: Biju <biju.das.au@gmail.com>
X-Google-Original-From: Biju <biju.das.jz@bp.renesas.com>
To: Philipp Zabel <p.zabel@pengutronix.de>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>
Cc: Biju Das <biju.das.jz@bp.renesas.com>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Biju Das <biju.das.au@gmail.com>,
	Conor Dooley <conor.dooley@microchip.com>
Subject: [PATCH v3 1/9] dt-bindings: reset: renesas,rzg2l-usbphy-ctrl: Document RZ/G3L support
Date: Tue,  7 Jul 2026 15:36:33 +0100
Message-ID: <20260707143646.245177-2-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260707143646.245177-1-biju.das.jz@bp.renesas.com>
References: <20260707143646.245177-1-biju.das.jz@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCPT_COUNT_TWELVE(0.00)[13];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-34813-lists,linux-renesas-soc=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:p.zabel@pengutronix.de,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:geert+renesas@glider.be,m:magnus.damm@gmail.com,m:biju.das.jz@bp.renesas.com,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-renesas-soc@vger.kernel.org,m:prabhakar.mahadev-lad.rj@bp.renesas.com,m:biju.das.au@gmail.com,m:conor.dooley@microchip.com,m:krzk@kernel.org,m:conor@kernel.org,m:geert@glider.be,m:magnusdamm@gmail.com,m:bijudasau@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[bijudasau@gmail.com,linux-renesas-soc@vger.kernel.org];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_TO(0.00)[pengutronix.de,kernel.org,glider.be,gmail.com];
	FREEMAIL_CC(0.00)[bp.renesas.com,vger.kernel.org,gmail.com,microchip.com];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[bijudasau@gmail.com,linux-renesas-soc@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	RCVD_COUNT_FIVE(0.00)[5];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	ALIAS_RESOLVED(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-renesas-soc,dt,renesas];
	DBL_BLOCKED_OPENRESOLVER(0.00)[bp.renesas.com:mid,vger.kernel.org:from_smtp,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,microchip.com:email,renesas.com:email]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 7489B71CDBD

From: Biju Das <biju.das.jz@bp.renesas.com>

Document Renesas RZ/G3L (r9a08g046) USB PHY controller bindings.
The RZ/G3L USB PHY block is similar to RZ/G3S but differs in that each
port has its own OTG controller, whereas RZ/G3S only has one on port 1.
To reflect this, RZ/G3L uses a regulators sub-node with per-port vbus0
and vbus1 entries instead of the single regulator-vbus property used
by other compatible SoCs.

Acked-by: Conor Dooley <conor.dooley@microchip.com>
Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
v2->v3:
 * Replaced items->enum
 * Collected tag.
v1->v2:
 * Updated commit description.
 * Added enum instead of const in the compatible section.
 * Dropped regulator1-vbus and added a regulators group node.
 * Updated schema check.
---
 .../reset/renesas,rzg2l-usbphy-ctrl.yaml      | 48 +++++++++++++++++--
 1 file changed, 45 insertions(+), 3 deletions(-)

diff --git a/Documentation/devicetree/bindings/reset/renesas,rzg2l-usbphy-ctrl.yaml b/Documentation/devicetree/bindings/reset/renesas,rzg2l-usbphy-ctrl.yaml
index c83469a1b379..06e003218d2a 100644
--- a/Documentation/devicetree/bindings/reset/renesas,rzg2l-usbphy-ctrl.yaml
+++ b/Documentation/devicetree/bindings/reset/renesas,rzg2l-usbphy-ctrl.yaml
@@ -16,13 +16,16 @@ description:
 properties:
   compatible:
     oneOf:
+      - enum:
+          - renesas,r9a08g045-usbphy-ctrl # RZ/G3S
+          - renesas,r9a08g046-usbphy-ctrl # RZ/G3L
+
       - items:
           - enum:
               - renesas,r9a07g043-usbphy-ctrl # RZ/G2UL and RZ/Five
               - renesas,r9a07g044-usbphy-ctrl # RZ/G2{L,LC}
               - renesas,r9a07g054-usbphy-ctrl # RZ/V2L
           - const: renesas,rzg2l-usbphy-ctrl
-      - const: renesas,r9a08g045-usbphy-ctrl # RZ/G3S
 
   reg:
     maxItems: 1
@@ -50,6 +53,28 @@ properties:
     $ref: /schemas/regulator/regulator.yaml#
     unevaluatedProperties: false
 
+  regulators:
+    type: object
+    description:
+      list of vbus regulators provided by this controller.
+
+    properties:
+      vbus0:
+        type: object
+        description: Port 1 USB VBUS regulator
+        $ref: /schemas/regulator/regulator.yaml#
+        unevaluatedProperties: false
+
+      vbus1:
+        type: object
+        description: Port 2 USB VBUS regulator
+        $ref: /schemas/regulator/regulator.yaml#
+        unevaluatedProperties: false
+
+    required:
+      - vbus0
+      - vbus1
+
   renesas,sysc-pwrrdy:
     description:
       The system controller PWRRDY indicates to the USB PHY if the power supply
@@ -71,14 +96,15 @@ required:
   - resets
   - power-domains
   - '#reset-cells'
-  - regulator-vbus
 
 allOf:
   - if:
       properties:
         compatible:
           contains:
-            const: renesas,r9a08g045-usbphy-ctrl
+            enum:
+              - renesas,r9a08g045-usbphy-ctrl
+              - renesas,r9a08g046-usbphy-ctrl
     then:
       required:
         - renesas,sysc-pwrrdy
@@ -86,6 +112,22 @@ allOf:
       properties:
         renesas,sysc-pwrrdy: false
 
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: renesas,r9a08g046-usbphy-ctrl
+    then:
+      properties:
+        regulator-vbus: false
+      required:
+        - regulators
+    else:
+      properties:
+        regulators: false
+      required:
+        - regulator-vbus
+
 additionalProperties: false
 
 examples:
-- 
2.43.0


