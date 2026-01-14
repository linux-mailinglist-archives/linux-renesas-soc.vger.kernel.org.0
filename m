Return-Path: <linux-renesas-soc+bounces-26773-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 63E15D1FECD
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 14 Jan 2026 16:49:00 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 1C6C730231D3
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 14 Jan 2026 15:45:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 943D33A0EA2;
	Wed, 14 Jan 2026 15:45:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DJRSYN38"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wm1-f66.google.com (mail-wm1-f66.google.com [209.85.128.66])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 741B03A0E8A
	for <linux-renesas-soc@vger.kernel.org>; Wed, 14 Jan 2026 15:45:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.66
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768405535; cv=none; b=eFcPH4Q7CspYgIIdLOhSzGqXnaRu0qYTQ463XcHqHyrCIcA86UQgHGIuJ7madd90ItDl9xnaPbGo2d/nUm9wqBa2z6d6ZWO3eE2s9fJct3hBoRZdKZWMxZf/XHgoqdjikybUMZwLtgsM+N29GdFi+jXHgMc7Et8lEwZeicGaDd8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768405535; c=relaxed/simple;
	bh=NcSIh13nkfl2o/fHyJPuPnsmYgeObjMEWYBabqP7Z/s=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=qmQHuBSEqtxzObsRFtX6++JcMoOdUUuT179rOycoCNJC9vigblcZ2fiWfRAbgWoVlOYohaDFe2nvgaPj/MXzwxmXhQUG/1t8ToYrLlZaBXtBxHAAWym+72rBoOsYfKOG+dwlNmr3rHDo4HX7GdSydRRr00qSp02Mzer99OyDNiM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DJRSYN38; arc=none smtp.client-ip=209.85.128.66
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f66.google.com with SMTP id 5b1f17b1804b1-47d3ffa5f33so40356375e9.2
        for <linux-renesas-soc@vger.kernel.org>; Wed, 14 Jan 2026 07:45:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768405531; x=1769010331; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JGNBX9HKq6etY9Yk1wwPNkxG5bUhI9J7ur5YibrY+sU=;
        b=DJRSYN38Z0H0u0K5L3fUbxwSxOLlJjMFJBcgRsQFOxZf2TLgBWgM4m86vkR+W+Jd9/
         YVgFiwg1VxbUWtSdGEuwktI8CUU+pKwwNGtyeMXvL1jc+ffodlrA4vcHqFKPEkp+xdZ0
         PzW348DAGzLpi8Mrc3nWLQjgtRGHhOAnp3GwgZWljPZYRQjvDEIDA25l3ilwbgJGzh8b
         uqy4Vr7dca0DSKoi77GeODxkSyMBU4yHFZhhdmnmToAp3YjsivuEv4a6uYPajZjGLzE4
         rprKPVE3FCguk9aFNsFU9KLtcrdtls+OhKl8SeDmx6F/eBDxVEroN65V1oUhhFbw5JIS
         zQvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768405531; x=1769010331;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=JGNBX9HKq6etY9Yk1wwPNkxG5bUhI9J7ur5YibrY+sU=;
        b=PHWrxdfnIX684sm1T+pgXR04GJHIUFb1eX1xgh5UQGm/RjpDLpEfFpcAybWbna8fOO
         ZKdnN8iURJ53/COKwBTZIE7Z130EenxOlSmMpIYwDVGNxvGVtKBV+EY5apJGuy6Zaw2J
         b1/WZwWcDh4MJcatMpgeRRKhoW8ubnN297mdFIYInjl7/dj5WAMYIlyIKuMRmvLfPf6a
         B0zDuwQHMc2uT8j/lzX1/pOQCYHMtJMWb2cjFbLh6xREOqW9vzECtagKM2gJxZwgMVNG
         CjipTfEgzYCjt5tY8TYmNGI7s8IUDe/TSXZbrWNsxCLn/XGDlV9EUUuiGj5H5T0QivXp
         634w==
X-Gm-Message-State: AOJu0Yz/nNdTRQyhICjD+JUSX6QH4XV6gFiYb26i710Y1o6IQ7Rj5Qj3
	8UmG0p/pkr46Zz0FkLN6dFoaaWNRI5FWMKU3+eCkYRpcwR3OYwI7CEs4
X-Gm-Gg: AY/fxX76/10ICeMIqZ4NuULx/Uq1ZFzYOInXzzst0KBlDJRfHqRjovu924uunxqfvr3
	QZHleeaqraZ0P1EoaeVwIMFmb/51cgmn3knHiCr3jKv/8R4A4MVhWZc9YJEAChS1iXHUb5+NS+v
	MbSsT8tyG1eLgu3Q2zHhuDPNUr9eH1+rgeNgR30vVOQRYI+BRTQ3GWQh+zDOg6MoJnEFXUet1RH
	66YtyW/czwj6FWYi6Pc1jBag2xYCuC1q+nLDXRDC3DUWXaS4Sac6T80E3s0YbPzhLLjsPY6abF+
	hakjph1zbi3spbmyYjiW/QyqJQjK8f+EgQZekjs/ZKVFk1ojDkVxS0bUXekUSg15btvAdLxWvLQ
	1UemFkSylxBqgD+W9zWVGUBn6OuJSMQybmSlulHbp2ate6DxQT0FY9cTryEECpvy/i5lA5v5gsO
	oju2Q3W6JWCjVlrLuc0cAXdZnteTlaY7o4PXclD0XapsFJ7Si2OlpDZzqix8pYoYurW6rmuBOWx
	3qkvyOStzGGR+8ApqZVhSTI
X-Received: by 2002:a05:600c:5490:b0:479:3876:22a8 with SMTP id 5b1f17b1804b1-47ee3356d5dmr45061685e9.16.1768405531444;
        Wed, 14 Jan 2026 07:45:31 -0800 (PST)
Received: from iku.Home ([2a06:5906:61b:2d00:7f20:df14:ac2b:3d74])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-47ee544387fsm33867105e9.0.2026.01.14.07.45.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Jan 2026 07:45:30 -0800 (PST)
From: Prabhakar <prabhakar.csengg@gmail.com>
X-Google-Original-From: Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To: Marc Kleine-Budde <mkl@pengutronix.de>,
	Vincent Mailhol <mailhol@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	linux-can@vger.kernel.org,
	devicetree@vger.kernel.org
Cc: linux-renesas-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Prabhakar <prabhakar.csengg@gmail.com>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH v4 3/4] dt-bindings: can: renesas,rcar-canfd: Document RZ/T2H and RZ/N2H SoCs
Date: Wed, 14 Jan 2026 15:45:24 +0000
Message-ID: <20260114154525.3169992-4-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260114154525.3169992-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20260114154525.3169992-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Document the CAN-FD controller used on the RZ/T2H and RZ/N2H SoCs. The
CAN-FD IP is largely compatible with the R-Car Gen4 block, but differs
in that AFLPN and CFTML are different, there is no reset line for the IP,
and it only supports two channels.

Sync the resets and reset-names schema handling with other CAN-FD SoCs so
DT validation stays consistent and maintainable.

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
---
v3->v4:
- Dropped Reviewed-by from Geert due to below changes.
- Updated commit message.
- Moved single compatible entries into an enum and to below oneOf.
- Synced the resets/reset-names handling with other similar SoCs.

v2->v3:
- Grouped single compatible entries into an enum.
- Updated commit message about disallowing reset-names property.
- Added Reviewed-by tag.

v1->v2:
- No changes made.
---
 .../bindings/net/can/renesas,rcar-canfd.yaml  | 48 +++++++++++++++++--
 1 file changed, 44 insertions(+), 4 deletions(-)

diff --git a/Documentation/devicetree/bindings/net/can/renesas,rcar-canfd.yaml b/Documentation/devicetree/bindings/net/can/renesas,rcar-canfd.yaml
index fb709cfd26d7..b9d9dd7a7967 100644
--- a/Documentation/devicetree/bindings/net/can/renesas,rcar-canfd.yaml
+++ b/Documentation/devicetree/bindings/net/can/renesas,rcar-canfd.yaml
@@ -12,6 +12,10 @@ maintainers:
 properties:
   compatible:
     oneOf:
+      - enum:
+          - renesas,r9a09g047-canfd        # RZ/G3E
+          - renesas,r9a09g077-canfd        # RZ/T2H
+
       - items:
           - enum:
               - renesas,r8a774a1-canfd     # RZ/G2M
@@ -42,14 +46,16 @@ properties:
               - renesas,r9a07g054-canfd    # RZ/V2L
           - const: renesas,rzg2l-canfd     # RZ/G2L family
 
-      - const: renesas,r9a09g047-canfd     # RZ/G3E
-
       - items:
           - enum:
               - renesas,r9a09g056-canfd     # RZ/V2N
               - renesas,r9a09g057-canfd     # RZ/V2H(P)
           - const: renesas,r9a09g047-canfd
 
+      - items:
+          - const: renesas,r9a09g087-canfd  # RZ/N2H
+          - const: renesas,r9a09g077-canfd
+
   reg:
     maxItems: 1
 
@@ -179,7 +185,6 @@ required:
   - clocks
   - clock-names
   - power-domains
-  - resets
   - assigned-clocks
   - assigned-clock-rates
   - channel0
@@ -243,11 +248,25 @@ allOf:
           minItems: 2
           maxItems: 2
 
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: renesas,r9a09g077-canfd
+    then:
+      properties:
+        interrupts:
+          maxItems: 8
+
+        interrupt-names:
+          maxItems: 8
+
   - if:
       properties:
         compatible:
           contains:
             enum:
+              - renesas,r9a09g077-canfd
               - renesas,rcar-gen3-canfd
               - renesas,rzg2l-canfd
     then:
@@ -296,6 +315,16 @@ allOf:
       properties:
         renesas,no-can-fd: false
 
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: renesas,r9a09g077-canfd
+    then:
+      properties:
+        resets: false
+        reset-names: false
+
   - if:
       properties:
         compatible:
@@ -305,8 +334,19 @@ allOf:
               - renesas,rzg2l-canfd
     then:
       required:
+        - resets
         - reset-names
-    else:
+
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - renesas,rcar-gen3-canfd
+              - renesas,rcar-gen4-canfd
+    then:
+      required:
+        - resets
       properties:
         reset-names: false
 
-- 
2.52.0


