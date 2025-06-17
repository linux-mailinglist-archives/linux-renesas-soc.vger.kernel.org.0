Return-Path: <linux-renesas-soc+bounces-18471-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 45F98ADD9A5
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 17 Jun 2025 19:08:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 4A7684A3A37
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 17 Jun 2025 16:50:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6BF00285056;
	Tue, 17 Jun 2025 16:49:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HlqgBPyZ"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 78E17237162;
	Tue, 17 Jun 2025 16:49:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750178962; cv=none; b=FAqWXvDOZAtYLajICJPQ4ivmUD+Ene+FtEnDbBa1lA2/hJdPB9DapB1OLQgxteaShhlJIzdr7yMEaHycSCGcCeioSGNi2mqLJhI+Joeg8ef7JjpIkBhFE0LZ3T6XFM8icxzEe3WSml9jPBryzzjLLHEvgFKaBD7JOicokO6P8xk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750178962; c=relaxed/simple;
	bh=KRh/3IWUi8wJK9HBTanwpW1Ne/zckpysbpzJqR2v3lY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=ZXZtDDLJD7ZQjcnsOlbh1qUXrNCbwNbuL/9z9nTnRYN+3UijDQNsxbjwUlmfwUm1AAX5kuB9zmQyFUDDae4dLFok47DOACt4X9Eh99BhGiCAbuPMt2DyWWLHsV3xs9QZXkOuOCDNwQH5N3WLTTFXYlD/C0V/CrVPhJoNoEdSnEc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HlqgBPyZ; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-453398e90e9so33077395e9.1;
        Tue, 17 Jun 2025 09:49:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750178959; x=1750783759; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=5XIMm+//qp4wqccCF+D0DH+tZhbKp+Az+d9fFWrYfco=;
        b=HlqgBPyZSVPAhUuyfQuGYlSovg7s5bUsvHkbUsSAwyyg0ugt49eaAuJI18u4Vl2yCE
         2+MBAjSirqpf97fvt+kVFlOf3xbcvJKkZPC/ItuAot3/NukvBokNAWH39k+QXbfT2182
         RGfGFcoLcAc94vqbKW9oSHleXvsqXJZ9EEP4wjeYQpRN6MdSWc7nuButQxjKVHT21owO
         ijX6tR2hxfuEUaZ/aHd5XuawcXeC+/S/qb4QperMqneeodV3ka2zYK74mVLmuHnRGCQS
         SeFG2KhUh9bFk4l4RlTIFmcdykU+1JGlOUjW4fODFtFsKAH53jpzHIka6o/+JZW3k7QO
         1thw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750178959; x=1750783759;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=5XIMm+//qp4wqccCF+D0DH+tZhbKp+Az+d9fFWrYfco=;
        b=k/1TmAZkiOiiSqPfKEYAbzkvBfg72LwB+TW+8Qgzkskg8zhQTsQon04v5CC958N1Do
         K753iU2SqL6XQX8LnBQwQwHK1Eb627sytIzl/g40f6U8jyEDdthMLsCtX9zniStzb9mp
         BKQHNCYeedXa7NlsoTR+fDk3gquqNgfVY1rikopuC31C2nncRWk9sCVOpwNTzlX/jrM7
         4f5NcNv2zlYTVYxdgh4AT+PZsO34fXnw14n9uDxCCAFsBSfd/xiXImlGLFXX9xEHmRDv
         Yr1HhS2R0l5fQiNVZJuXdGM7qjAxXMl8RwUK2YfJ6uiPY0s/90Iuk+zyxyWmdu49BGgB
         fu4w==
X-Forwarded-Encrypted: i=1; AJvYcCU2aG5rMles9viZao//HwSqU0aP7dH/qzgcFw9KEIC/hoe5ncTF/Z33OSKiUTRCBKgZfmoZSopnonaE/bur@vger.kernel.org, AJvYcCU8aY3g/960ZZYRZtvnKHOdFOzjfioHJcFiuHhjGPuYv3noSH773D3w9mpcuRHqS48sRe1zputodm/ZnzY4k0vW7L8=@vger.kernel.org, AJvYcCWCSVX3dFb4V9sq+SsqljobnulYLVIN9Dl1569ctKO5Z0OY4r6x0mT83rwZ6tDZNF73K4EAS6uB9NUp@vger.kernel.org
X-Gm-Message-State: AOJu0YyxSvGRZ8x5aIwYHAdwfRL69z/q5BQ+nCGg5BVRi3mOLFL64BpQ
	1IRLBbnB9HjyO8VIGh7L2PG2TQOiahYq5dyQbQ++HFdOsPEUZXLNXtsp
X-Gm-Gg: ASbGncsCAuBaue4sSyv7hhzpyC6unrmsrJojqyL1NOaHlUPVKs7BpHfL6XvlxdQf2uJ
	jqadNyKkKnazMX1qM1xhi2H6nH6j7jl3Xz/GQrykt5JUkE11dH9tVmx+35JKP4Ff+ats6zMMtGe
	EhC3sIuRksAd3fdW68dHTa3mqEFXztMbgQgwjB1uUxJG38Afs8O6ZdQBPE8WF8vO7FCxsQaKS4N
	+3HEJY/Jw+XmPzvFXRiTMUVMkK586DFTaw9EsAnBJipXbKdgdxRwrNZ7+Uag1IT/scx4f/S0bFl
	lmLAUa6up7o548UQdegvgIn40byjLhhjcdSyolu5iCV5HkfqdSBVTVPhsvjkEHzoBLLsXaI49hQ
	lEMQBePQIICQ=
X-Google-Smtp-Source: AGHT+IHqPQo3No+AxPf3KB6UZMn8Svd+qINdy29DPZOX/zUQw5gwrIihVc5xl0ma5/mBOSDc0/zJTg==
X-Received: by 2002:a05:6000:65b:b0:3a5:88cf:479c with SMTP id ffacd0b85a97d-3a588cf4cadmr2820887f8f.30.1750178958740;
        Tue, 17 Jun 2025 09:49:18 -0700 (PDT)
Received: from iku.Home ([2a06:5906:61b:2d00:a081:30f1:e1c7:6f28])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a568b18f96sm14597105f8f.66.2025.06.17.09.49.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Jun 2025 09:49:18 -0700 (PDT)
From: Prabhakar <prabhakar.csengg@gmail.com>
X-Google-Original-From: Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>,
	Ulf Hansson <ulf.hansson@linaro.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Magnus Damm <magnus.damm@gmail.com>,
	Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: linux-mmc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	Prabhakar <prabhakar.csengg@gmail.com>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH v2] dt-bindings: mmc: renesas,sdhi: Document RZ/T2H and RZ/N2H support
Date: Tue, 17 Jun 2025 17:49:14 +0100
Message-ID: <20250617164914.158091-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.49.0
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Add SDHI bindings for the Renesas RZ/T2H (a.k.a R9A09G077) and RZ/N2H
(a.k.a R9A09G087) SoCs. Use `renesas,sdhi-r9a09g057` as a fallback since
the SD/MMC block on these SoCs is identical to the one on RZ/V2H(P),
allowing reuse of the existing driver without modifications.

Update the binding schema to reflect differences: unlike RZ/V2H(P),
RZ/T2H and RZ/N2H do not require the `resets` property and use only a
two clocks instead of four.

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
---
v1->v2:
- Added the high speed clock to the clocks list.
---
 .../devicetree/bindings/mmc/renesas,sdhi.yaml | 85 ++++++++++++-------
 1 file changed, 53 insertions(+), 32 deletions(-)

diff --git a/Documentation/devicetree/bindings/mmc/renesas,sdhi.yaml b/Documentation/devicetree/bindings/mmc/renesas,sdhi.yaml
index 7563623876fc..ba15ccbda61a 100644
--- a/Documentation/devicetree/bindings/mmc/renesas,sdhi.yaml
+++ b/Documentation/devicetree/bindings/mmc/renesas,sdhi.yaml
@@ -72,6 +72,8 @@ properties:
           - enum:
               - renesas,sdhi-r9a09g047 # RZ/G3E
               - renesas,sdhi-r9a09g056 # RZ/V2N
+              - renesas,sdhi-r9a09g077 # RZ/T2H
+              - renesas,sdhi-r9a09g087 # RZ/N2H
           - const: renesas,sdhi-r9a09g057 # RZ/V2H(P)
 
   reg:
@@ -129,59 +131,78 @@ allOf:
         compatible:
           contains:
             enum:
-              - renesas,sdhi-r9a09g057
-              - renesas,rzg2l-sdhi
+              - renesas,sdhi-r9a09g077
+              - renesas,sdhi-r9a09g087
     then:
       properties:
+        resets: false
         clocks:
           items:
-            - description: IMCLK, SDHI channel main clock1.
-            - description: CLK_HS, SDHI channel High speed clock which operates
-                           4 times that of SDHI channel main clock1.
-            - description: IMCLK2, SDHI channel main clock2. When this clock is
-                           turned off, external SD card detection cannot be
-                           detected.
-            - description: ACLK, SDHI channel bus clock.
+            - description: ACLK, IMCLK, SDHI channel bus and main clocks.
+            - description: CLK_HS, SDHI channel High speed clock.
         clock-names:
           items:
-            - const: core
-            - const: clkh
-            - const: cd
             - const: aclk
-      required:
-        - clock-names
-        - resets
+            - const: clkh
     else:
       if:
         properties:
           compatible:
             contains:
               enum:
-                - renesas,rcar-gen2-sdhi
-                - renesas,rcar-gen3-sdhi
-                - renesas,rcar-gen4-sdhi
+                - renesas,sdhi-r9a09g057
+                - renesas,rzg2l-sdhi
       then:
         properties:
           clocks:
-            minItems: 1
-            maxItems: 3
-          clock-names:
-            minItems: 1
-            uniqueItems: true
             items:
-              - const: core
-              - enum: [ clkh, cd ]
-              - const: cd
-      else:
-        properties:
-          clocks:
-            minItems: 1
-            maxItems: 2
+              - description: IMCLK, SDHI channel main clock1.
+              - description: CLK_HS, SDHI channel High speed clock which operates
+                             4 times that of SDHI channel main clock1.
+              - description: IMCLK2, SDHI channel main clock2. When this clock is
+                             turned off, external SD card detection cannot be
+                             detected.
+              - description: ACLK, SDHI channel bus clock.
           clock-names:
-            minItems: 1
             items:
               - const: core
+              - const: clkh
               - const: cd
+              - const: aclk
+        required:
+          - clock-names
+          - resets
+      else:
+        if:
+          properties:
+            compatible:
+              contains:
+                enum:
+                  - renesas,rcar-gen2-sdhi
+                  - renesas,rcar-gen3-sdhi
+                  - renesas,rcar-gen4-sdhi
+        then:
+          properties:
+            clocks:
+              minItems: 1
+              maxItems: 3
+            clock-names:
+              minItems: 1
+              uniqueItems: true
+              items:
+                - const: core
+                - enum: [ clkh, cd ]
+                - const: cd
+        else:
+          properties:
+            clocks:
+              minItems: 1
+              maxItems: 2
+            clock-names:
+              minItems: 1
+              items:
+                - const: core
+                - const: cd
 
   - if:
       properties:
-- 
2.49.0


