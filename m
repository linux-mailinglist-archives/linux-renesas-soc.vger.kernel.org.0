Return-Path: <linux-renesas-soc+bounces-18009-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 89571AD2A6E
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 10 Jun 2025 01:23:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id B7FB97A130C
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  9 Jun 2025 23:21:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2FA8722A7E1;
	Mon,  9 Jun 2025 23:23:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bx/VALp3"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5EB0B207DF7;
	Mon,  9 Jun 2025 23:23:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749511383; cv=none; b=lheKGYfCkdlCJjPwVphLpK3zdvynhhIfDb3zgTkPmozlZ8Z78tpQVhqQxBx0E5GAwwpjaQqSmaJHssmQAL+rqQakPZdKXulySAGCoqTAir7k0tyV0S1oJ0vsTOw4ck21e8H9uqrYz2k0bHtm4okf7fjrYVWu1RK68gI+Vp6I0Bo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749511383; c=relaxed/simple;
	bh=GdmsI7pMe6v/Vb2RwbymOBoTQNKut9pfHgdX/4pQmfg=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Ox304dGLg/l9tckMCAJh/MSXUXS90IXcOT1N7wpOHovF6iJca8F3u7JljfUHmDp53UGwsv/hvqoq8XvtVpFz0svG+N9XN0bDUd5bPZtEKqdlsj0clZgyrPKleRBUDZ6I9h7tdwVDnfHC+0GkjiUMBsnEZbs7XB2dRnB02TBuzIU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bx/VALp3; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-43ea40a6e98so61122385e9.1;
        Mon, 09 Jun 2025 16:23:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749511380; x=1750116180; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ELsjYCnl30x0OWnQc2oxYh9eQERmhciiDwYyV/AXmGs=;
        b=bx/VALp3xvedkaPNE2q0wjpRnjFZ0HaJe7v2GPzvp4h5qfiAFpnyD9TxT/pK8BElHv
         PMVnW4VxTEB0DwhsPFm+ipDPccLiR2KPrNUkdjqP63uEgcD/6ONNnN/fIh8Qqid5RTmk
         5QWkwU3t7+egTCg67nfpMvmqPuflCt8wExA1s390YGzN1FnrAp6fHSNII+MK0hhjMv/0
         WVfV2UbeYIKuDTdwSDk8UKk43KLlKCRsq/ukI8B3uDdhvAeUVti3kkQ75NfZV+d/EQ3i
         t0enbEHchFq/Z3dB/mn7fbabSH3a3qUpnDeqjU8Hu5iB7xe7e81IaK4BlUeF/rTlgIPP
         7ouA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749511380; x=1750116180;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ELsjYCnl30x0OWnQc2oxYh9eQERmhciiDwYyV/AXmGs=;
        b=rGPvm4uYcTtvOEp1FuudOdHNtc2SHqTRInM79GOQJ2C20PIV/OQYg4me6DOzqKHfxP
         3u0dIjDwvj1cdVsibcRf++C5X9mi+No7PFQ6/FtSNlWSiVE6flA0HxSf5ommogvbAWMF
         foAIIKNymeFCF0fsAY3KPL5qUOIQJHcccbvpXGzeoThj9LH9bglxyyJeRwZTAeqABo3X
         sm2yVCx4J31CXCVkbPhda9xIO9Hdh3bkWVP+nDD9GXFWjgeZ6dmufhuaOlHY0qSc/6JL
         0/+7yHakXblq3S2He35TYwPY3++Eq0QWiqf9USFTEhJKD8WGhtKzPym2g6J7IN8ujuKP
         HXjQ==
X-Forwarded-Encrypted: i=1; AJvYcCUlxnn+XpoKOKpr+rwNiuVUgIYVikTSy0bVdX/WUomoPDHPuLEcsahYzYPexyAqtL/LcEfjFfguL+99o/DNhDx8m+A=@vger.kernel.org, AJvYcCVPYaryMiOYmwjnWMDnUTg+GaHi7C8sRp1ucxtBSigTUejpxFEKfVpySvCAP+u0s8Vzh3Vw9CcE8Ygi@vger.kernel.org, AJvYcCXsr1oSNo1WIumrsZC6a6giXa2vOgUD0sYtF6dQrIPuLl9T0MRPC1vegkzDGIaZowJGmZ0Ww0tt5fkdBpSH@vger.kernel.org
X-Gm-Message-State: AOJu0Yx+56UZEu4xFB6Ev06v7wv4m+jEtpUXWNRQzJxPLBEkmcaAOiod
	e0UJsnaI5Mbo4xPxH8Wce21WYucRfVyZagFPSxqq3p3Pz7j/JNH5qtxn
X-Gm-Gg: ASbGncuHyRuBlZ4/NVftf1IiZoW8zOpJehW5RxqCKc+TFu7narBOOmVRNkBknlIQSzr
	hGKU8P3FSt0JVaBv79sCrwfoQbMQFvYZ55ZJ8ferMnzds+b5G9JUMPLTI+7m4ABCoQ/AjJqo1HB
	6ABM8tDglFSXIMZ7PZIE+rzHPtQp9UVv2e0U+cx3BhW2Xe+KsGZQHHmtTjUD8ccy3xE6B5qYTRF
	av3pAbiDXbatT5JdNLFdB6ZNN8H6FZeG2c/1+N3BqEFeIOXP/GcpAW0FtjCkeQ1EoiJ+sdYm8X8
	nbmBY4EQHT6SsI20IdQeoZ1ZfJrP6WBxDwnBWUfpqYBD0apgoV0oV4c8NDcdGm4MszT9e7v7bsK
	wp39xt6hiDQ==
X-Google-Smtp-Source: AGHT+IF6nRboebQvBMDZ9PylTL/iJQYYbClRKdB2q0jcR/5cIyx48mQMOjg4Jo64SXDvFWnpnztQuA==
X-Received: by 2002:a05:600c:c8a:b0:43c:efed:733e with SMTP id 5b1f17b1804b1-4531de198ccmr4089515e9.14.1749511379666;
        Mon, 09 Jun 2025 16:22:59 -0700 (PDT)
Received: from iku.Home ([2a06:5906:61b:2d00:3c26:913e:81d:9d46])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-45307678020sm74573255e9.15.2025.06.09.16.22.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Jun 2025 16:22:59 -0700 (PDT)
From: Prabhakar <prabhakar.csengg@gmail.com>
X-Google-Original-From: Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To: Ulf Hansson <ulf.hansson@linaro.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
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
Subject: [PATCH] dt-bindings: mmc: renesas,sdhi: Document RZ/T2H and RZ/N2H support
Date: Tue, 10 Jun 2025 00:22:53 +0100
Message-ID: <20250609232253.514220-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
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
single clock instead of four.

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
---
 .../devicetree/bindings/mmc/renesas,sdhi.yaml | 88 +++++++++++--------
 1 file changed, 53 insertions(+), 35 deletions(-)

diff --git a/Documentation/devicetree/bindings/mmc/renesas,sdhi.yaml b/Documentation/devicetree/bindings/mmc/renesas,sdhi.yaml
index 7563623876fc..7d524646da8d 100644
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
@@ -129,59 +131,75 @@ allOf:
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
-          items:
-            - description: IMCLK, SDHI channel main clock1.
-            - description: CLK_HS, SDHI channel High speed clock which operates
-                           4 times that of SDHI channel main clock1.
-            - description: IMCLK2, SDHI channel main clock2. When this clock is
-                           turned off, external SD card detection cannot be
-                           detected.
-            - description: ACLK, SDHI channel bus clock.
+          description: ACLK, SDHI channel bus clock.
+          maxItems: 1
         clock-names:
-          items:
-            - const: core
-            - const: clkh
-            - const: cd
-            - const: aclk
-      required:
-        - clock-names
-        - resets
+          const: aclk
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


