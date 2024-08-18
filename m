Return-Path: <linux-renesas-soc+bounces-7862-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 87A53955E27
	for <lists+linux-renesas-soc@lfdr.de>; Sun, 18 Aug 2024 19:32:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id DF462B213D6
	for <lists+linux-renesas-soc@lfdr.de>; Sun, 18 Aug 2024 17:32:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CC6ED1534EC;
	Sun, 18 Aug 2024 17:30:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="hOUWBZi9"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C4BC14831F
	for <linux-renesas-soc@vger.kernel.org>; Sun, 18 Aug 2024 17:30:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724002210; cv=none; b=nG99tMo53JDNJC97Zzjh1HnnZBO9KUn8yqn958MnH0YKh+Fw9Q3oSvfoRcnV37yPoB4UfG8yHvCieeKKLSkWO9xoyaedGXxm7f+yxcznNeUjRW/rm+h3NOcFdPX1N5Prvj3HgvMnjaw2iHlhZrfWi7cZ0VaAOkxsgCWDMkke1/o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724002210; c=relaxed/simple;
	bh=7X9ZnxXyUxu/1V0lOGPXjFgoRhd+0gWb23mdc3ayJ3g=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=YdVgq5evV08TJONWXxt1BFUS/TmT6qn0uFu+F0NGrf4oVER5r5hdBeU0Tlm+0gbM8DqfJMJ4D3P0P2cakrja2x9ki/0kRjEbmPMWGOv16eY1U2/jX8pk5LgFGbvS0ZeLtA29R7kl6bAaroe3HwmnRUwW0y7fKRBuIqtyuJO2sDM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=hOUWBZi9; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-42803bbf842so38785805e9.1
        for <linux-renesas-soc@vger.kernel.org>; Sun, 18 Aug 2024 10:30:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1724002207; x=1724607007; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=0SCaR0GRkiuZ3/606Q3dnjpJljwAy9G6Uqg06n8FjTI=;
        b=hOUWBZi9UgiGeemnHBM0Ju51jDjX4gtJ1+Bcq8LXM2tMhwIUTqK6CPTu6SCKrwKiMM
         XXRLpp2SyqYYQwdgJ0k0S7Z/LVet6caDUjxs1m1GTz+glkZyzpFJ8cj3oBafXm9XylZh
         esjdOxtxp2mOEF5kMQDxgviqAAkPjbDejHTLigORmCgtAWq5gtOI89KM/gEt+z+OVtKi
         +DJih0XrVx2MjUWK6Emax1R/RQPrLWJcJ+imwLXOmIXoPFAgbl4/85QSZ4BsFSkVeVVs
         hHRE2/vLxCTtjqvsxdY25RT08RdHjll17R61atn4td3Ycqxg0N4fW2EdTt7tNahZcEtu
         aS8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724002207; x=1724607007;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=0SCaR0GRkiuZ3/606Q3dnjpJljwAy9G6Uqg06n8FjTI=;
        b=Syzg0OuPTD8Lcpcv9mPUQ0dRV38JX/aj6ApjN/K76U9LO2ZeFXzloOpm8FK382CXp/
         H3qYKX2+0IcHe0QAD08KZoHbFdUaBG7NeOOaNj40FoSy+mFoAG9OjIZnx1APUCaMp4S8
         9jwqaPxYEN/TGExKoR+hWk5Hyb0pbsLhRENiyLlo83FABUe0ASSZHC0bbrEYed+I5ngt
         HJEs/ttwGDk+ZM6mLORkQExxSXIfPrXS3+7RYlaK93PKzh85B+mOJa84ToMzwsp/5mMG
         ht6JD8uzj8IwdH4U3aWUyRxUXYrl8+aeUz7PGTcTKcxIlcjAVdOBpvrVvwE/MM59KwEj
         A98g==
X-Forwarded-Encrypted: i=1; AJvYcCUwh2u9/lAaF34r4cM5mywgdUIyyi3ZR1sMN57sANdPwCqqeBJpOhBYo1YGbfCLEJ34odxgjLqaGoTUVMn6Y3wCQNZe51BFweETUninw1bvzSY=
X-Gm-Message-State: AOJu0YzT+xEbZ3glVHiEvE14s3psyj9NqQy7qmfwiBQ4gIhXA8KDTfW/
	0szT6EPNs0HKGxAJVS3dox5Mmm+TDtGWAo5sCI+GN3Se3+4W+kAZGkNHX9Y5p+I=
X-Google-Smtp-Source: AGHT+IFWjUiXv+XY641Ss+KqGOnh9S6DjOSW5fs9xPdNg3xhxyfOeVQlO4q1nl00fAyX1GYXCteCkw==
X-Received: by 2002:a05:600c:3b26:b0:426:6f87:65fc with SMTP id 5b1f17b1804b1-429ed7b6a3dmr70242785e9.17.1724002207227;
        Sun, 18 Aug 2024 10:30:07 -0700 (PDT)
Received: from krzk-bin.. ([178.197.215.209])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-429ded19839sm138973805e9.6.2024.08.18.10.30.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 18 Aug 2024 10:30:06 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
	David Airlie <airlied@gmail.com>,
	Daniel Vetter <daniel@ffwll.ch>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	dri-devel@lists.freedesktop.org,
	linux-renesas-soc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH 1/2] dt-bindings: display: renesas,du: narrow interrupts and resets per variants
Date: Sun, 18 Aug 2024 19:30:02 +0200
Message-ID: <20240818173003.122025-1-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Each variable-length property like interrupts or resets must have fixed
constraints on number of items for given variant in binding.  The
clauses in "if:then:" block should define both limits: upper and lower.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 .../bindings/display/renesas,du.yaml          | 22 +++++++++++++++++++
 1 file changed, 22 insertions(+)

diff --git a/Documentation/devicetree/bindings/display/renesas,du.yaml b/Documentation/devicetree/bindings/display/renesas,du.yaml
index c5b9e6812bce..147842b6465a 100644
--- a/Documentation/devicetree/bindings/display/renesas,du.yaml
+++ b/Documentation/devicetree/bindings/display/renesas,du.yaml
@@ -173,6 +173,7 @@ allOf:
             - pattern: '^dclkin\.[01]$'
 
         interrupts:
+          minItems: 2
           maxItems: 2
 
         resets:
@@ -228,6 +229,7 @@ allOf:
             - pattern: '^dclkin\.[01]$'
 
         interrupts:
+          minItems: 2
           maxItems: 2
 
         resets:
@@ -281,6 +283,7 @@ allOf:
             - pattern: '^dclkin\.[01]$'
 
         interrupts:
+          minItems: 2
           maxItems: 2
 
         resets:
@@ -335,6 +338,7 @@ allOf:
             - pattern: '^dclkin\.[01]$'
 
         interrupts:
+          minItems: 2
           maxItems: 2
 
         resets:
@@ -396,6 +400,7 @@ allOf:
             - pattern: '^dclkin\.[012]$'
 
         interrupts:
+          minItems: 3
           maxItems: 3
 
         resets:
@@ -460,9 +465,11 @@ allOf:
             - pattern: '^dclkin\.[0123]$'
 
         interrupts:
+          minItems: 4
           maxItems: 4
 
         resets:
+          minItems: 2
           maxItems: 2
 
         reset-names:
@@ -489,9 +496,11 @@ allOf:
 
         renesas,cmms:
           minItems: 4
+          maxItems: 4
 
         renesas,vsps:
           minItems: 4
+          maxItems: 4
 
       required:
         - clock-names
@@ -531,9 +540,11 @@ allOf:
             - pattern: '^dclkin\.[012]$'
 
         interrupts:
+          minItems: 3
           maxItems: 3
 
         resets:
+          minItems: 2
           maxItems: 2
 
         reset-names:
@@ -558,9 +569,11 @@ allOf:
 
         renesas,cmms:
           minItems: 3
+          maxItems: 3
 
         renesas,vsps:
           minItems: 3
+          maxItems: 3
 
       required:
         - clock-names
@@ -600,9 +613,11 @@ allOf:
             - pattern: '^dclkin\.[013]$'
 
         interrupts:
+          minItems: 3
           maxItems: 3
 
         resets:
+          minItems: 2
           maxItems: 2
 
         reset-names:
@@ -627,9 +642,11 @@ allOf:
 
         renesas,cmms:
           minItems: 3
+          maxItems: 3
 
         renesas,vsps:
           minItems: 3
+          maxItems: 3
 
       required:
         - clock-names
@@ -684,6 +701,7 @@ allOf:
 
         renesas,vsps:
           minItems: 1
+          maxItems: 1
 
       required:
         - clock-names
@@ -719,6 +737,7 @@ allOf:
             - pattern: '^dclkin\.[01]$'
 
         interrupts:
+          minItems: 2
           maxItems: 2
 
         resets:
@@ -746,9 +765,11 @@ allOf:
 
         renesas,cmms:
           minItems: 2
+          maxItems: 2
 
         renesas,vsps:
           minItems: 2
+          maxItems: 2
 
       required:
         - clock-names
@@ -799,6 +820,7 @@ allOf:
 
         renesas,vsps:
           minItems: 2
+          maxItems: 2
 
       required:
         - clock-names
-- 
2.43.0


