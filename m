Return-Path: <linux-renesas-soc+bounces-15585-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7DBA2A81663
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  8 Apr 2025 22:10:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id B1C0F7A7F27
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  8 Apr 2025 20:09:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 36A53254840;
	Tue,  8 Apr 2025 20:09:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lJOvkZI7"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3032625335B;
	Tue,  8 Apr 2025 20:09:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744142974; cv=none; b=Q8d4ZdxnMkHZY7QLFwSLCH0U2WtowebGAq7GlvvIJDrifH9c4vW4jK0OlZs4g+uXfQBQKjPvsOvljk7hI7FKg+Co83Q8Sw6ibWxc09KU97lPrxb6FCJKs0ErVQBkqrE1m7q1tkWE4oy1VpCYTA2zA2Rpon0M7slu7S6EG5FCutI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744142974; c=relaxed/simple;
	bh=QpGFBkMGqVVvlWld6Bn+OTPerdH40sn1RNMjM515peU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=RM0mRKy5mLoylqD4rGT3dFwS/HwsCvLhWU4iqqEVQoLS1x2Xhq6oRUrJnUGwWGTDCtJS2tbDO6FsCoBt46wl92mW8t3SjzwXyQTQBwe98X+wUoBJtwPcKqkGorUiST3Tr24xfTtfQ1LpJieLjLysXPsj5OHCNaMWAFGpmQmjua4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=lJOvkZI7; arc=none smtp.client-ip=209.85.221.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-3914a5def6bso3603878f8f.1;
        Tue, 08 Apr 2025 13:09:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744142970; x=1744747770; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XlVzg4NVSeKl87qIFaZeC52Gwyjlz5o95Zgekktm3qw=;
        b=lJOvkZI7alsmuZVGv2msqd0ZbDxNpIrxZ26TIz8GbiR+b/fzUujgdEq80sEAhIRiNL
         z3Wfc8fS2tyLWTjRjX49oyq6VoiZKfNNugvAOKmBGklpTUC9RJrXURd2zuTolP680/Ek
         LKZ1GkgBN+HQCrBUJHJgY9no4AehfqCg7tz2yMyHTQqnsPXryXwF/+KGeB9rF0eLKo4i
         5Dc0SWxEJZAHy28Nu2QVrr26B8Z+MQopsAN1erMWoOZNhngF8fGHorjaC0vuX4IpinmW
         y7FoEx7Jc/k1q5qKJvtlm+H9Hsee1V35gE2fmhnDQ92PrWhNBHPBrXhW+d74fXKxajpb
         yjgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744142970; x=1744747770;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=XlVzg4NVSeKl87qIFaZeC52Gwyjlz5o95Zgekktm3qw=;
        b=ILZNO0zwK9i5Lokgh1To+ZVaQISzrAi8UxuJ6sFsrgd0Axi1oO3mdlKxY5i6hPe7DX
         qEdJyG5zwwNfH1aDEWcu0ViUDI/GXcLFQFCQ/5BYfseJ5xhOlh92Fp8d+gl6bfGrxsCA
         AX7EAFxKoMqzdTlqZyan7+Dn8DanzQuq6RKh7MyW20Wcpeq/2d3NEqoy9hILLuKa87Jh
         HSA2jyVPVTZ+9IUpHRc4oq/8YC7c40OTzvX54AKB4Qhp3+CfaIOkE9uHBV+aZjY4+3Lt
         0LBSIfPmS4EeADnkJlSD4fPQ++6SLv7wMnFKn9kyac5gzsLxLF365eDrLNfJ2BQHS6ah
         rsrw==
X-Forwarded-Encrypted: i=1; AJvYcCVqKLDbtxQVs29u/xbFFZVlgPxbEv0hFsKjRMrFWpmHh+3+6ofxbJgjWC/JdOcxlbT9HYdHwbtoU48d@vger.kernel.org, AJvYcCWCu11DPzLYaLb03hUjZlHSYQi4xXnol4pbREBlyrXe97InJruKL9yU/sdWE0OPI/gDncDmqpt/UjUw0M6r@vger.kernel.org, AJvYcCXrO+CLeudCQ8VZLrtgFI+GLHv3P4TYsHPpucj8B3ee6NLKCHoPm5QvOxzR7TL4PoQgSufeVbvBWZBm@vger.kernel.org
X-Gm-Message-State: AOJu0YwmGw+GdK9/7k4JmIknySouXIJZ4EYjlGe8IYypnEzH9YWZ/11r
	/XVMYDro7L4vUE70BluYgoT94mZPlmAZ/kpho3YyjjZWXeMhec3N
X-Gm-Gg: ASbGnctKqXbplN+vgh+D4Kf4AaUVl8BYB1sf5HUwOtXYrHIUql8HknjgSKrHyuQ8jc8
	i35Hc4T7tPAQJww4apTaYuj5zGKBVUspGmBBfn1jOtuKoAvCDQXaheIxuVNVDRjBe6MotF8kffO
	TGwykoNv2AuRtp2yopysrRxpZRWHcuhDD9lFhYNw9XOG/i/Iz8eZEXEXQdvfNUt2IK+CiO216c3
	BUogCpXezDGLmoAB9iTNUv6HgtApBTWxNTwHgP4BRxkC51/z5oSS+PmwFkQY/a/lIv8oZFzKVTz
	242WxhLB42Kt7fa823VNP74GafZRXleg1yB5yhVGd7wGc2MwnPNrq4m1HYB/t2Brq6gh
X-Google-Smtp-Source: AGHT+IEky1B9P24RH7aU7IbVChI3HtZLaevuLomuMTpk4Aj9HGTqHLpA1ydqcIBugec1598YEv+xSw==
X-Received: by 2002:a5d:598b:0:b0:390:fbcf:56be with SMTP id ffacd0b85a97d-39d884c5fa8mr53836f8f.0.1744142970285;
        Tue, 08 Apr 2025 13:09:30 -0700 (PDT)
Received: from iku.Home ([2a06:5906:61b:2d00:469:6216:b7f8:fc55])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43ec1795782sm174892875e9.26.2025.04.08.13.09.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Apr 2025 13:09:29 -0700 (PDT)
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
	Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Magnus Damm <magnus.damm@gmail.com>,
	dri-devel@lists.freedesktop.org,
	devicetree@vger.kernel.org,
	linux-clk@vger.kernel.org
Cc: linux-renesas-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Prabhakar <prabhakar.csengg@gmail.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH v2 04/15] dt-bindings: display: bridge: renesas,dsi: Add support for RZ/V2H(P) SoC
Date: Tue,  8 Apr 2025 21:09:01 +0100
Message-ID: <20250408200916.93793-5-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250408200916.93793-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20250408200916.93793-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

The MIPI DSI interface on the RZ/V2H(P) SoC is nearly identical to that of
the RZ/G2L SoC. While the LINK registers are the same for both SoCs, the
D-PHY registers differ. Additionally, the number of resets for DSI on
RZ/V2H(P) is two compared to three on the RZ/G2L.

To accommodate these differences, a SoC-specific
`renesas,r9a09g057-mipi-dsi` compatible string has been added for the
RZ/V2H(P) SoC.

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
v1->v2:
- Added enum for RZ/V2H as suggested by Krzysztof as the list
  will grow in the future (while adding RZ/G3E SoC).
- Added Reviewed-by tag from Krzysztof.
---
 .../bindings/display/bridge/renesas,dsi.yaml  | 116 +++++++++++++-----
 1 file changed, 87 insertions(+), 29 deletions(-)

diff --git a/Documentation/devicetree/bindings/display/bridge/renesas,dsi.yaml b/Documentation/devicetree/bindings/display/bridge/renesas,dsi.yaml
index e08c24633926..5980df2b389b 100644
--- a/Documentation/devicetree/bindings/display/bridge/renesas,dsi.yaml
+++ b/Documentation/devicetree/bindings/display/bridge/renesas,dsi.yaml
@@ -14,16 +14,17 @@ description: |
   RZ/G2L alike family of SoC's. The encoder can operate in DSI mode, with
   up to four data lanes.
 
-allOf:
-  - $ref: /schemas/display/dsi-controller.yaml#
-
 properties:
   compatible:
-    items:
+    oneOf:
       - enum:
-          - renesas,r9a07g044-mipi-dsi # RZ/G2{L,LC}
-          - renesas,r9a07g054-mipi-dsi # RZ/V2L
-      - const: renesas,rzg2l-mipi-dsi
+          - renesas,r9a09g057-mipi-dsi # RZ/V2H(P)
+
+      - items:
+          - enum:
+              - renesas,r9a07g044-mipi-dsi # RZ/G2{L,LC}
+              - renesas,r9a07g054-mipi-dsi # RZ/V2L
+          - const: renesas,rzg2l-mipi-dsi
 
   reg:
     maxItems: 1
@@ -49,34 +50,56 @@ properties:
       - const: debug
 
   clocks:
-    items:
-      - description: DSI D-PHY PLL multiplied clock
-      - description: DSI D-PHY system clock
-      - description: DSI AXI bus clock
-      - description: DSI Register access clock
-      - description: DSI Video clock
-      - description: DSI D-PHY Escape mode transmit clock
+    oneOf:
+      - items:
+          - description: DSI D-PHY PLL multiplied clock
+          - description: DSI D-PHY system clock
+          - description: DSI AXI bus clock
+          - description: DSI Register access clock
+          - description: DSI Video clock
+          - description: DSI D-PHY Escape mode transmit clock
+      - items:
+          - description: DSI D-PHY PLL multiplied clock
+          - description: DSI AXI bus clock
+          - description: DSI Register access clock
+          - description: DSI Video clock
+          - description: DSI D-PHY Escape mode transmit clock
 
   clock-names:
-    items:
-      - const: pllclk
-      - const: sysclk
-      - const: aclk
-      - const: pclk
-      - const: vclk
-      - const: lpclk
+    oneOf:
+      - items:
+          - const: pllclk
+          - const: sysclk
+          - const: aclk
+          - const: pclk
+          - const: vclk
+          - const: lpclk
+      - items:
+          - const: pllclk
+          - const: aclk
+          - const: pclk
+          - const: vclk
+          - const: lpclk
 
   resets:
-    items:
-      - description: MIPI_DSI_CMN_RSTB
-      - description: MIPI_DSI_ARESET_N
-      - description: MIPI_DSI_PRESET_N
+    oneOf:
+      - items:
+          - description: MIPI_DSI_CMN_RSTB
+          - description: MIPI_DSI_ARESET_N
+          - description: MIPI_DSI_PRESET_N
+      - items:
+          - description: MIPI_DSI_ARESET_N
+          - description: MIPI_DSI_PRESET_N
 
   reset-names:
-    items:
-      - const: rst
-      - const: arst
-      - const: prst
+    oneOf:
+      - items:
+          - const: rst
+          - const: arst
+          - const: prst
+      - items:
+          - const: arst
+          - const: prst
 
   power-domains:
     maxItems: 1
@@ -130,6 +153,41 @@ required:
 
 additionalProperties: false
 
+allOf:
+  - $ref: ../dsi-controller.yaml#
+
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: renesas,r9a09g057-mipi-dsi
+    then:
+      properties:
+        clocks:
+          maxItems: 5
+
+        clock-names:
+          maxItems: 5
+
+        resets:
+          maxItems: 2
+
+        reset-names:
+          maxItems: 2
+    else:
+      properties:
+        clocks:
+          minItems: 6
+
+        clock-names:
+          minItems: 6
+
+        resets:
+          minItems: 3
+
+        reset-names:
+          minItems: 3
+
 examples:
   - |
     #include <dt-bindings/clock/r9a07g044-cpg.h>
-- 
2.49.0


