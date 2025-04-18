Return-Path: <linux-renesas-soc+bounces-16160-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id AC7A0A93DBA
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 18 Apr 2025 20:47:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B68361B67012
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 18 Apr 2025 18:47:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2324722E01E;
	Fri, 18 Apr 2025 18:47:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QjCNz5hE"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 45D9422D4FA;
	Fri, 18 Apr 2025 18:47:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745002034; cv=none; b=ls/f3OAKh/LYbeKQjccolrWtrd5PQQ8X5QDMhsU+aMjoHeVKZL02oYeKrwpKUK4Tiik92A3mEJ+paftPOMxZSOCmOuHFAsGrDKfGGWJlphf4EUFdNHZqa79iehlkt1oJu06m55B//prqtZk7EB19QP07Vx2uNB9lB+N+YfkXEwI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745002034; c=relaxed/simple;
	bh=jQTLZlOtljs4Zu7lNJfOsa8qS2ssot4XA34nS43K2Ng=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=NZ1UESVJUtp7DNtrL+DTmB+awKelawnYbjUpH8sqnGz6pVcuBckLJF1BYWRTbXiDuaOEQYSXu+NYijYc2KdH8xrYu/ZQqwPNGTlIX3CoMIpXPu9ecXCNXfZfzm9qJWtEObAcaQN8T+6Dir09PfrE+fXyW3s2uckAFEekXkYovnU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QjCNz5hE; arc=none smtp.client-ip=209.85.221.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-3914bc3e01aso1327721f8f.2;
        Fri, 18 Apr 2025 11:47:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1745002030; x=1745606830; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JA4Gzqui520XvKDgLFTWbJLAfJxRvucBmm1a9C+IgC8=;
        b=QjCNz5hE2K0YEgkrbikZnif8azOHmw7iyznxXBG3vC7o72adcKBwjNSLrqAJI9YxTG
         xI547B3xfKQhIC/7l7Lh75BmiiQR7OHARq8T9j9UUJr2CMqG0apasVpgxttJXFx7tZS/
         uXECiijvz2jzrRycCYKYBfYDNq2pDW0kZUQccHdpoUyOSz/+XdYWJ+6hF9Quuu2m7XS6
         sZqaoXEDE1qx9npNuiFow3mPgKpP1TGIH73pFqwfKDvm4JhD+UbafA77d9AmcBJ4zGLC
         /Bl3F+CcQSj3yDHjgEgOUfNi5EZ1VgG26xRVKxjfJj8mmGhGA4l8wnUYXAg98ayK8GPf
         VnIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745002030; x=1745606830;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=JA4Gzqui520XvKDgLFTWbJLAfJxRvucBmm1a9C+IgC8=;
        b=ZEmkZ1dc42yP2s6vINTos821v0FitBKzZIDvGE86Hw8s65EVsx/NyVdiVA6l3bU4XS
         oRnl7oQzIuYkgKx9D4agrNXnWKKWS/YdTvFr97qipHdfFYTY2hlakZIAWGIhT+8oiXSo
         4nQBIs57M2EIH+WTdcHtdTjNuTzyNFO8AOi2Er3uTog5cRH5/cRjvPPEs3gYZyBLr6hs
         YrDAsmfCaTjQcQCKGQw3uYyJRNEW9mA5LpYtEkGti5KcAcNK45PkLTH0mYKRT53VFM/j
         zZ8dkVNzhlbcp0tjAEr54OcOSWnmg/ViBn6UHdHsFCz9TNj0xShwpF7AYznRbxXydeUJ
         Czkg==
X-Forwarded-Encrypted: i=1; AJvYcCUEZV/BLqEnGbaUWWFLNbAfqfvcZwr1O1I/s5WSw/VcC0zms/AovaS1cIgflfHbZrLNL/FTjuXp4j6D@vger.kernel.org, AJvYcCVlGYE9hAS3ZAka4eh6VoUZ0N9IXIVcFNuiRccP7SGhBUV6IHfj20YAE3KCZod0YtnovRwayOQ04Ls1RKdSyN1uRNs=@vger.kernel.org, AJvYcCWjeSgiE03PTI5GMTEz0i3S51PCX0P4yMToJVMHxqeXpz4it7cWByRHoee3IYIE/1qO4WY6x5H6QmFpFttM@vger.kernel.org, AJvYcCX8Mj753OEVzMRJaNeEenmGxEOPW9uTGosUxpSSwJ0u2gkJOR7AJQ/oSeMfevBr8sfyaDnJGc8cvqm5@vger.kernel.org
X-Gm-Message-State: AOJu0YxG5UvLVOIO4yzQHijo5kop6+NkGv5jJm1nBbFIqwxUcuX8JCVv
	c3fEXXVZ/axwQ19Jg7iJa9vJHe/Doq8dhwJvbz3XFmCH1x5l/TSv
X-Gm-Gg: ASbGncutHHDWPjMtKwt1gnMTbGHYGwQ6WFIx4R2KvO1J1hqnGFO2kohnbyBZlbhZfr2
	Hg9FoOTR5IuZloM5ht36O12hVCgmFhyWDO6kMDczIivAlg3wCZ6Uca7N9D12oBdzNRltOJFgSx2
	BVy9USUlv99zUxY0puX99JZyPRZiYgW5pavQK5bItSyuRdt/5Bscl/uqztsl9v9RZ0Eg44hmh57
	MKrt7wa5kzz4FLs4i2BOP2GyeRotA7lhXtyOsRor58VqcqO4dM45Q/EEXDwRNWbS/etAFB24+5n
	/iy+59BYX9JQBHzmEWLLY1lftQ4lk4VqsOI8qJMuHzlCVdHndDJZTnojClzN/QyZxg==
X-Google-Smtp-Source: AGHT+IG79+Xzgm+XZga2TyIMFd6/uqPiEpAEqn9ilP5gPzSy9wE1lxpvKq79sxI9ZGAXxADMR+n3TQ==
X-Received: by 2002:a05:6000:178d:b0:39c:c64e:cf58 with SMTP id ffacd0b85a97d-39efbaf20ccmr2872071f8f.55.1745002030471;
        Fri, 18 Apr 2025 11:47:10 -0700 (PDT)
Received: from iku.Home ([2a06:5906:61b:2d00:36cb:c641:13d7:bd3d])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-39efa4931b8sm3404336f8f.80.2025.04.18.11.47.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Apr 2025 11:47:09 -0700 (PDT)
From: Prabhakar <prabhakar.csengg@gmail.com>
X-Google-Original-From: Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To: Andrzej Hajda <andrzej.hajda@intel.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Robert Foss <rfoss@kernel.org>,
	Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
	Jonas Karlman <jonas@kwiboo.se>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Magnus Damm <magnus.damm@gmail.com>
Cc: dri-devel@lists.freedesktop.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	linux-clk@vger.kernel.org,
	Prabhakar <prabhakar.csengg@gmail.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH v3 03/15] dt-bindings: display: renesas,rzg2l-du: Add support for RZ/V2H(P) SoC
Date: Fri, 18 Apr 2025 19:46:46 +0100
Message-ID: <20250418184658.456398-4-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250418184658.456398-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20250418184658.456398-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
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
---
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


