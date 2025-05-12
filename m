Return-Path: <linux-renesas-soc+bounces-16991-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4145EAB4347
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 12 May 2025 20:32:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 48A25167D97
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 12 May 2025 18:31:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2523C297B79;
	Mon, 12 May 2025 18:23:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="URSqMWOg"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4EA842550D5;
	Mon, 12 May 2025 18:23:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747074231; cv=none; b=XJrX1AbJyril4MW5HsDH6hRoAgBIihl/ciQGFmZwdpvJFARcKM0kDsqao6qVuZjwDiwhDxtF2YNk20CaTu+hyIB6zHuzhk4GQ0rld4u6sjyQ2O67Wy7tWURehboYMEpTYZIKNPOlJ0lJKN41n8rikHcn1q7l+xKehI6WX09d4aI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747074231; c=relaxed/simple;
	bh=KgCsUoVDbGSnfnNBKogMKoxaMaz4rgQIvYMtHiTXkSo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=SGHwHZv17o9xcxZBR9sFYAs6VvtiEGnRCqBz7aTCM2GWX0zAFZig12HqRB+5kEFE4DqLatXiRYxvVSjnQxpUSAiHqrSDh0oXdUJI3c/9Sz2hB4/t/8CTSSlbjGj76froDJk6P/3iS1MWASfzhjsflQVh/ZcNSlEK+Q+r7W7YNjc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=URSqMWOg; arc=none smtp.client-ip=209.85.221.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-3a0bd7f4cd5so4096005f8f.0;
        Mon, 12 May 2025 11:23:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747074227; x=1747679027; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=57DFAN0/ZRwoK0xUxYv+cuKjAK5uS9oM6kLns/redbs=;
        b=URSqMWOgelXldlblPT4WoRPSnIddINWEEAQfydwdQS0nAvMGxkc3cJIbrHphGb5iRR
         BpVzXtS6VPI0SXLOOJX3KRDuM5y0oCzL66Kv9DlACfgew2SMgu0pEQJTtwmDKNG3GcJQ
         qsZgKgqHxIDCXaokzyIMiJ14Df1LUyUYxh1ITxMyvS2wi6JohdQTEBu6lWcUxBiznRiT
         CNXeECZWr31jybT1kXH+GLfNwHIX3yL1lpQA+ETh6Lf8xImtajsDzMohpIIPMU2jS0uK
         3izQJRzEsB86c3TxD6qGZM0pkH9+rNQq3uJq2TNyplZutRuRbfk6dE5Kx4Rsudm8bimF
         5M+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747074227; x=1747679027;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=57DFAN0/ZRwoK0xUxYv+cuKjAK5uS9oM6kLns/redbs=;
        b=Tgf0wDW1kcL1ZsZmNtQea8HT89BU/j1WnoD5AO0nN/+shfHkKDPUGx+BDYPhO9YW+4
         5S6KahZ1683FCjlyfSIpLusf6fksLiMJFltCn7SqcW4/v2ZToCeLviKSOAiOngbxZILx
         KfVrGpUEClXq4ZafYng2bvUqcv95NV5+ptpytLvIMbea2AaEbtPACp2qTulvSuegoE+0
         r9cxMXDjhuI+UKOyPymc7/TkyfhCWRgeTw+wB+dnm/SpMFv3d+urK/DMKEbBmJK3bb4z
         SocUjedO6b74weegCSrSYnhm5qN3jdqjJLubbIHBsZTDfRWe256gXZP70J39NDJ6jXf2
         qFog==
X-Forwarded-Encrypted: i=1; AJvYcCUO9datrmPkUZ+viwtxohZ8GT8rTpY+cOgKheyMYtxcyXevIQfcimPNyahAoflQIV3KJulipKaMRzvN@vger.kernel.org, AJvYcCWFyXUHu7BEHf8kS+YpQ95LTjCfPjOJ0/0HFtmjE3LzDGVg+A57LKxnmdvVcgyi1EhniDwmGkMeJgQFA8/Q@vger.kernel.org
X-Gm-Message-State: AOJu0YyGe/W8VJuJVEr87trUOLl6HhjY9k+j1Q032GB/esGhtwViXUeK
	hnF8MFJn4/UYYokDOK6CFn4AY78voqLhwVEFGVYNnzthnZTG5jiL
X-Gm-Gg: ASbGncuBvKhKDHxIknFz9qS37i8lcY1XCmg0SixuYGbM005KK1Tv3KzIbG70spzJAQO
	EfeL0rr0SrqP0Q2sF1dP6tQ/D3pjxDZu8Y0KMSguJqkJz/BEpZhzLVfj8Pe/WwRz4J14wKSWNEa
	iPq7eolRU7+PRAWsqsR2SesJ8YXC9QBQ7wcoyab0EuI8rUHRz2cNBsSPf+KjtBAjB8tbwB5CDax
	slAfb2icsv4otwE6D1gXf6xM/FffWS5f+eP3dncAnit7lBRPyjpWxanxeMsAQMxMW+EAmgrKqf5
	zRx6c7xyEF/XNyKx1cD7Ug8LREIpggOz/JMKXQ+/CSMCcwQlDXeyC4Vjsr71AG7HDtYpUFUJt9z
	4
X-Google-Smtp-Source: AGHT+IG5V6qZw0WkMmFNDpW44kpQxtFWHfAJXl+GUo/2Pm1y6e3rk0hroLNfDvmtitv7uSFMo7W5hw==
X-Received: by 2002:a05:6000:2ae:b0:3a0:82d1:f3c2 with SMTP id ffacd0b85a97d-3a1f643a5bfmr10605831f8f.10.1747074227529;
        Mon, 12 May 2025 11:23:47 -0700 (PDT)
Received: from iku.Home ([2a06:5906:61b:2d00:581b:951a:bc46:a124])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a1f5a4c5f6sm13175497f8f.86.2025.05.12.11.23.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 May 2025 11:23:46 -0700 (PDT)
From: Prabhakar <prabhakar.csengg@gmail.com>
X-Google-Original-From: Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To: Biju Das <biju.das.jz@bp.renesas.com>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
	dri-devel@lists.freedesktop.org
Cc: linux-renesas-soc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Prabhakar <prabhakar.csengg@gmail.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH v5 01/12] dt-bindings: display: renesas,rzg2l-du: Add support for RZ/V2H(P) SoC
Date: Mon, 12 May 2025 19:23:19 +0100
Message-ID: <20250512182330.238259-2-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250512182330.238259-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20250512182330.238259-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

The DU block on the RZ/V2H(P) SoC is identical to the one found on the
RZ/G2L SoC. However, it only supports the DSI interface, whereas the
RZ/G2L supports both DSI and DPI interfaces.

Due to this difference, a SoC-specific compatible string
'renesas,r9a09g057-du' is added for the RZ/V2H(P) SoC.

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Reviewed-by: Biju Das <biju.das.jz@bp.renesas.com>
---
v4->v5:
- Added reviewed tag from Biju

v3->v4:
- No changes

v2->v3:
- Collected reviewed tag from Krzysztof

v1->v2:
- Kept the sort order for schema validation
- Added  `port@1: false` for RZ/V2H(P) SoC
---
 .../bindings/display/renesas,rzg2l-du.yaml    | 23 ++++++++++++++++++-
 1 file changed, 22 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/display/renesas,rzg2l-du.yaml b/Documentation/devicetree/bindings/display/renesas,rzg2l-du.yaml
index 95e3d5e74b87..1e32d14b6edb 100644
--- a/Documentation/devicetree/bindings/display/renesas,rzg2l-du.yaml
+++ b/Documentation/devicetree/bindings/display/renesas,rzg2l-du.yaml
@@ -20,6 +20,7 @@ properties:
       - enum:
           - renesas,r9a07g043u-du # RZ/G2UL
           - renesas,r9a07g044-du # RZ/G2{L,LC}
+          - renesas,r9a09g057-du # RZ/V2H(P)
       - items:
           - enum:
               - renesas,r9a07g054-du    # RZ/V2L
@@ -101,7 +102,12 @@ allOf:
 
           required:
             - port@0
-    else:
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: renesas,r9a07g044-du
+    then:
       properties:
         ports:
           properties:
@@ -113,6 +119,21 @@ allOf:
           required:
             - port@0
             - port@1
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: renesas,r9a09g057-du
+    then:
+      properties:
+        ports:
+          properties:
+            port@0:
+              description: DSI
+            port@1: false
+
+          required:
+            - port@0
 
 examples:
   # RZ/G2L DU
-- 
2.49.0


