Return-Path: <linux-renesas-soc+bounces-17718-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B7406AC9417
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 30 May 2025 18:59:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 0D7EF3A7D37
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 30 May 2025 16:59:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3AF382356C3;
	Fri, 30 May 2025 16:59:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Rf1kf18q"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5AF861A2C11;
	Fri, 30 May 2025 16:59:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748624356; cv=none; b=pWZqv69t+Kx6LPDVo40EENC0Wjrp9YZZzlQr1u2vh9pK5OyjJ3Avb+cUBv4iGcuAsHVQM6GzyJfJx5omfAKei9qc0Iz3aK8zh7P9DGqFY+wlEeL5+VtluBgWSV1bQ2A67+YSI2TCWbi0Z2nlt6Z7o65cupyPK8QJvEJ+6oNpVYg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748624356; c=relaxed/simple;
	bh=CnpRuwwswLW4EAcPehBSKv14ET+100EHS4+yiJYXWgw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=lM6zvasxLHZAo8VqhQ9OA/eCXMTW/ZqY4b6cG4wqVc6mYaPrypBTRuiSc5IpJlo6IqfFMPxlIdcSUM6tEgjFbg4H6KBNZl5FP68FiGMWtFs8YZYARuRkQTpLsdPys9MmnceseuDvcrvUnWITnDGT7suSvEp2EQbM9N1t3JQgRys=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Rf1kf18q; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-450cfb6a794so12948725e9.1;
        Fri, 30 May 2025 09:59:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1748624352; x=1749229152; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=J29EcBVuIttsOHLv7IujYOeDwvkRN/jk5j1fyQfRryc=;
        b=Rf1kf18qvkS1Fl9LuUKVe4kOd7yybKiqkGUXJf0whQnybfvoxXFeE6F7tGHSnpwO4O
         1QeuUyqNpq26KbeyZ9pS/Ix6KzRdId0a7AlOCYwZYn5RLIyARmvjfWZjp699+8I8WCnp
         QFBg4/3iAq52Pwuqn8FdGPi9PC0NbGsrSbWAlxKAsvsINSZc9ARAPMXDn1Xy29xt1/Y5
         1grgBAtEtdKb3heWGPecVCsSZ93jqD3fsbgaWByKI547DSVaZBeYEiPzz+gnQvNO6jN2
         FxUx0iK+uD3EDzJqZ6S7RROam4ygQucbAHNfN2fwoJ3AjaLOsd8JT00FgYWrCN8bM/sS
         c8og==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748624352; x=1749229152;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=J29EcBVuIttsOHLv7IujYOeDwvkRN/jk5j1fyQfRryc=;
        b=tyZhfHOqIn80zdJohwiG+z1ScMCnECFL325ntUe4yukxt/AzSyNHWFlC+q+IIYvNT1
         Tm86Mic/Z9CSYnqzXJ/ZIzdAo4MnI2uKKTsFW4VCk5BstivSrtH/am2O+GZaBhF6nSSm
         y4OYNWOgEI0xPZQK5yrFV2qLvRXmciIBAQwQe/PTPjshkFVKu4Ea24JRdQNUPkXHo7Ol
         rZMttOG0dXvQ3KkWqrZBthJeuv6YZy3PMy6N71xGB5VyKsYX4fwets0OB7jei7QvlZ84
         lOFFTUzmJi2kk/7RoOVGpQlXJvJR4kT/W2qWjgUvIYJCIedUIM4qUqMk8pEC6zAq2EdH
         68gw==
X-Forwarded-Encrypted: i=1; AJvYcCUxMnM/4aRJ5JUnHsFbGDljZkiQ0YsbusVaINcMKIQjJBJPF3ONoPQgARgG7qZCHFZdy6QdOZ5FM8Bhu1Rwgg6Ieaw=@vger.kernel.org, AJvYcCV0twGkWF2I2fZ4UEbz/HgRXZHUS+ajwoEdv/gSMJrPL8gIaFGv+KemBrXYVLjYXm0i+g7dagieL51s@vger.kernel.org, AJvYcCX5EXC7KoWFI9FjL3XfizGWNQ2Hg5pC1Lo1CsA7Zxkc+zzD4FfhYZggXZDDZvS2VELzOGc2T0SLHuVIYitg@vger.kernel.org
X-Gm-Message-State: AOJu0YwWZ+BAAIbVGM6QIpxxn/OMAlGffYZztKSwoudaxc7ZUZpzYtiN
	7Cg6uIooocnhy+0fAiMFjAnzAQ3b+m8iSjuuYGHWTTgamtbOCFRntZ2o
X-Gm-Gg: ASbGncvQAJhry9sXbT6cf07kxKDP8Cel69If0uBkKuoSKoAQC8vItS1mTrjqMkJrF6J
	OT5YUIsMtQ1SjITHvKcnMGrtiM5r+M+QwRpEihMBOic+v+ZpxkeNytwVyhHt2x8De1y/n9G9/AM
	2BXfYqmS9hhKYmOnJvbWRicN0PvqfbbFfkjjINLZ8zMWWSvmXjc2B93Lf1cupTsJj2dkrQGGYrP
	1Ym7ze56DqSIZtWYfvkApA93DFRcSuliTjdG0KCCGLZYv/XhNKFMXNgmOM7qwUTT8RX1agoLquf
	WkX0e9gphhCPUlOEDJcfO/gE+nVtnXv9Qv/lINrz7FIRK3WFE50Wl+K3RPaAL3UhaW5dA4A+2wX
	QDiB1EJwGwtNyR4NWw2G0
X-Google-Smtp-Source: AGHT+IEgb3nbN0iVIeen/LbG4sknJalruo4HyGCevDz1eygcOvfBWGBMSq4X1ts+nPwvfRFkUIK59Q==
X-Received: by 2002:a05:600c:3b9c:b0:450:cd25:e69c with SMTP id 5b1f17b1804b1-450d6550c5dmr33841175e9.21.1748624352173;
        Fri, 30 May 2025 09:59:12 -0700 (PDT)
Received: from iku.example.org ([2a06:5906:61b:2d00:bcab:7ec7:2377:13b0])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-450d7f9efa3sm22733455e9.9.2025.05.30.09.59.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 May 2025 09:59:11 -0700 (PDT)
From: Prabhakar <prabhakar.csengg@gmail.com>
X-Google-Original-From: Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To: Biju Das <biju.das.jz@bp.renesas.com>,
	Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>
Cc: dri-devel@lists.freedesktop.org,
	linux-renesas-soc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Prabhakar <prabhakar.csengg@gmail.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH v6 01/12] dt-bindings: display: renesas,rzg2l-du: Add support for RZ/V2H(P) SoC
Date: Fri, 30 May 2025 17:58:55 +0100
Message-ID: <20250530165906.411144-2-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250530165906.411144-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20250530165906.411144-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
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
Reviewed-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
---
v5->v6:
- Added reviewed tag from Laurent

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


