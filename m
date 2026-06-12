Return-Path: <linux-renesas-soc+bounces-33927-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id fihJAbwYLGpSLQQAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-33927-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 12 Jun 2026 16:33:32 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id A625867A355
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 12 Jun 2026 16:33:31 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b="OmyT/8fm";
	spf=pass (mail.lfdr.de: domain of "linux-renesas-soc+bounces-33927-lists+linux-renesas-soc=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-renesas-soc+bounces-33927-lists+linux-renesas-soc=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=gmail.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id B084231A507F
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 12 Jun 2026 14:30:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1651738B147;
	Fri, 12 Jun 2026 14:30:56 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B63393845BD
	for <linux-renesas-soc@vger.kernel.org>; Fri, 12 Jun 2026 14:30:54 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781274656; cv=none; b=XU0hAoS66IyKE1qc76F8PYfgY0h5BoVyqweHDhYvYr6gjkgI7xn3kXD1ugOoI2ElkbU/1nd5UnkiD34mpviEADOYp6lXcwoKhRMKYOx3IGsycgndeMy1uutYgeiL993V+4UCidpcprXR7llOuGZ6a0j5qKIEdtGeG0XCJ3UN8QI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781274656; c=relaxed/simple;
	bh=NOpsoE5JXaGFwiQl+1H9TMXhbnwI+rsIKFCdxJm7h40=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ntGfytJ2WIPWp2xuUSv7F8Po9lBGgHao/3yGLG+DwA67EClZ5R4YIvk/U3ftU9Y2YLG9exyo6ppFFKUejc48Oejwdxv/nibdF+XF9Nkna0r1d21R3M593avP9UaXOdzUH13xStzhxCDdWf6WwM1G8h35yDpVk2T+4jV/h76437w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=OmyT/8fm; arc=none smtp.client-ip=209.85.221.50
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-45eedcdaeaaso727292f8f.3
        for <linux-renesas-soc@vger.kernel.org>; Fri, 12 Jun 2026 07:30:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781274653; x=1781879453; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2v5YdPFwcs+c+/mh1IyaaRfJjErFmT8WoMdd9sikM2g=;
        b=OmyT/8fmPWajWU2/q+8w4u8swkgOED/GehNNiT+UuDR1pfRoZfmPzZkZihBe7OUGfY
         CgpNAFx5GBaN5zRDJoKo3sooOW35M7CL6ooD1WIw3GFZf7TUTyYWn9Id13BjyA70zgU9
         aXD5YIOzauxEszxjRYpuzhmh+0X+GDE6yRMP+6qz3mR81H25jxwib+Yfs3FXAq3W/lA+
         M2+s3HGb2ynctkN5Mp2KJWHJwO7tEDdJLudtqg1+PSwVTwOiXG8qC88SYA/gRnHwdD54
         IlOsJNb/PkazXQVvbB8IA+g56RhmPgtkItWJi8VryTktw2U+UduTQDmPtb5PctiwIGzq
         9PQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781274653; x=1781879453;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=2v5YdPFwcs+c+/mh1IyaaRfJjErFmT8WoMdd9sikM2g=;
        b=kyaHC6UlXyRMWAH8rfEMJd8aQt6FoJMCNRgg4se7wuNO0el7LAMO5izoyonvLZnwOW
         089RYWHT1f9FntDqwnelheevzAa49TOwrNFx6BTENuxkSSla6RlGs54WkKfiuMzz1BAV
         rAjTSgnjsdRWciuX65z1/EqKiVppE4Al27UMHBdj5Ov+6higwGm1+YFbTIfxPNg/iKvJ
         fWuO9dz825aB9JkYO73Jm/FCYYncUEH3n7r8kxur/sGNCedcGg0KRGoj9KLEeYZOG2Uv
         nkff+OyDijWh70LqF1e04y+JkR69y7t3VzcNUIk1m0xyjBN8VwIoGxr5S8aHjz0hN0D2
         gnXg==
X-Forwarded-Encrypted: i=1; AFNElJ9GNYI+pansVrfQ8acJYgnoMGVoq4XYt30lf3Crsnzgho0CHMhrHHmB1ujuq9wWzzIrP16SL5S5YhVC7avVF/JrGg==@vger.kernel.org
X-Gm-Message-State: AOJu0Yzj0Uo10V1qqFPEXqQTQSdQ16H2lQHsDahCtgMVgUAKU6vY0FyE
	ctdyVhibnp93CQSCTRLWIg6hiJ3kLIL472dSZ4kWssDEmLHTTPuuSIU8
X-Gm-Gg: Acq92OGvLntXuEitBGpEAxKuwLzgVKvPcMwgPZ5uBEa+WDjg/yMLPAlBT7AeFR4IiY8
	q8y4N9XI9M+OBfx+fpJJViyJaHL66YIcbtoKnqMN22pMBoRWVipXdwJZ2s81x0syfNi0eg7pG+C
	yxngkMTKUH3068izYLuYyb5laCNvCS4wy5dLwjN0AQtzIVd7291qdxJaQ6yyOE/X8AiirnYGFxU
	8eapnIXeflztUGrZPKphIB8VzzBk0bC+zQznGJWDfr7qMypYxwvUUlFP4GEie1fvfyrLUEz6Zn8
	QcJd27dDmjwckhLBBuVhK1OiUDvm/DxVWEo4WnQmMFsr6CpdNminPgjEn1GmzptdG2UHUqpEijo
	2jFxUbKKX2Tj50I7q775EvCnMp8mVi5tnresyUYWw9Aij26B/MVAjAVaZfTPl6XF4MEJbORMLeG
	3tKiOkl0FpdpAl4lF+bdqJCiTgG3DzZOXBqPXxAmo+JjauZZjY
X-Received: by 2002:a05:6000:25f7:b0:43d:7868:21f0 with SMTP id ffacd0b85a97d-4606da57dd1mr4726877f8f.9.1781274652902;
        Fri, 12 Jun 2026 07:30:52 -0700 (PDT)
Received: from localhost.localdomain ([2a00:23c4:a700:7301:c72c:50c4:8b28:9a3a])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4606f2c3782sm5850016f8f.25.2026.06.12.07.30.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 12 Jun 2026 07:30:52 -0700 (PDT)
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
	Biju Das <biju.das.au@gmail.com>
Subject: [PATCH 01/11] dt-bindings: reset: renesas,rzg2l-usbphy-ctrl: Document RZ/G3L support
Date: Fri, 12 Jun 2026 15:30:29 +0100
Message-ID: <20260612143048.317907-2-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260612143048.317907-1-biju.das.jz@bp.renesas.com>
References: <20260612143048.317907-1-biju.das.jz@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-33927-lists,linux-renesas-soc=lfdr.de];
	FREEMAIL_FROM(0.00)[gmail.com];
	FORGED_RECIPIENTS(0.00)[m:p.zabel@pengutronix.de,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:geert+renesas@glider.be,m:magnus.damm@gmail.com,m:biju.das.jz@bp.renesas.com,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-renesas-soc@vger.kernel.org,m:prabhakar.mahadev-lad.rj@bp.renesas.com,m:biju.das.au@gmail.com,m:krzk@kernel.org,m:conor@kernel.org,m:geert@glider.be,m:magnusdamm@gmail.com,m:bijudasau@gmail.com,s:lists@lfdr.de];
	FREEMAIL_TO(0.00)[pengutronix.de,kernel.org,glider.be,gmail.com];
	FREEMAIL_CC(0.00)[bp.renesas.com,vger.kernel.org,gmail.com];
	FORWARDED(0.00)[lists@lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[12];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[bijudasau@gmail.com,linux-renesas-soc@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[bp.renesas.com:mid,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,renesas.com:email,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: A625867A355

From: Biju Das <biju.das.jz@bp.renesas.com>

Add device tree binding support for the RZ/G3L (r9a08g046) USB PHY
controller. The RZ/G3L USB PHY block is similar to RZ/G3S, but each port
has an OTG controller, unlike RZ/G3S, which has an OTG controller only on
port 1.

Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
 .../reset/renesas,rzg2l-usbphy-ctrl.yaml      | 20 ++++++++++++++++++-
 1 file changed, 19 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/reset/renesas,rzg2l-usbphy-ctrl.yaml b/Documentation/devicetree/bindings/reset/renesas,rzg2l-usbphy-ctrl.yaml
index c83469a1b379..788e467b38db 100644
--- a/Documentation/devicetree/bindings/reset/renesas,rzg2l-usbphy-ctrl.yaml
+++ b/Documentation/devicetree/bindings/reset/renesas,rzg2l-usbphy-ctrl.yaml
@@ -23,6 +23,7 @@ properties:
               - renesas,r9a07g054-usbphy-ctrl # RZ/V2L
           - const: renesas,rzg2l-usbphy-ctrl
       - const: renesas,r9a08g045-usbphy-ctrl # RZ/G3S
+      - const: renesas,r9a08g046-usbphy-ctrl # RZ/G3L
 
   reg:
     maxItems: 1
@@ -50,6 +51,12 @@ properties:
     $ref: /schemas/regulator/regulator.yaml#
     unevaluatedProperties: false
 
+  regulator1-vbus:
+    type: object
+    description: Port 2 USB VBUS regulator
+    $ref: /schemas/regulator/regulator.yaml#
+    unevaluatedProperties: false
+
   renesas,sysc-pwrrdy:
     description:
       The system controller PWRRDY indicates to the USB PHY if the power supply
@@ -78,7 +85,9 @@ allOf:
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
@@ -86,6 +95,15 @@ allOf:
       properties:
         renesas,sysc-pwrrdy: false
 
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: renesas,r9a08g046-usbphy-ctrl
+    then:
+      required:
+        - regulator1-vbus
+
 additionalProperties: false
 
 examples:
-- 
2.43.0


