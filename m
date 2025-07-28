Return-Path: <linux-renesas-soc+bounces-19718-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 41A78B142D0
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 28 Jul 2025 22:15:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 581905425BA
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 28 Jul 2025 20:15:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E280D27CB35;
	Mon, 28 Jul 2025 20:14:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="F/i2e2BX"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F0F8E27AC4B;
	Mon, 28 Jul 2025 20:14:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753733688; cv=none; b=P0ugfz1JhQNibd89SQ2keKLyqZ5ZjS94aCTGB0o3bwBDGhN06ALb1zZK3tTPjBLqXns1dvKrDGMmfS1v37Zdd/+sPgt+NJQYgSdMT3X3YV5DKtxBi3zt2UpvozNcUgUx+fQe0AX6uB/IqNIdDszTsNoYToBdo/+bWxzJkfawepw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753733688; c=relaxed/simple;
	bh=HGUOEyV8+2X94EwX9Kkc1Ik95YcKgkDvNbP6mNxsuYA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=bC+T3qiPKvt2osjLGx1zwPTMXQ9nHDQruOd9nojnNkrILnn7k+Bhm9rysJ4+m9dC7jj5yjOSdoeORCFuNExwmjX3aSlw91zZuT3ufVGkum7+z7MA+LRJVcREJDnEXvtxrLXWyNu6TlXantttucqbIlvuZyUubQXHdYhYaSz3XlM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=F/i2e2BX; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-4563cfac19cso51539705e9.2;
        Mon, 28 Jul 2025 13:14:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1753733684; x=1754338484; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xsKr9U/Lsla7ASXIDbg0RnYrGFWyhEYxMUb3V5AUIYU=;
        b=F/i2e2BXSBXSWwC3NFUKVpQV5+Bg234x+0hKaDjr5MLZRn/JHZqciX3YWEoVSmsPN+
         LhQd5iDpui0/0rwl67F7BWziu/E7gpexW1vxA8HhkZNw82k/9FAxiTjC9eIYihFI5XCM
         8c9fNn+Du6PR0oezYn6bSuwwJMj/1wIe+pCgGSQtpaGNEaS+ABNJRSt/6iqeVqkF92fP
         5ho0OJoqF28p7CD5NNs1zB+oiuDjTqpznXCZlv0pl26wJY7uQt7by/LIhd8oFpCW/Z3P
         V90L0BjfzT2lR5UP5kj3U670X4i5YwWr7nCgbIRlfsOpuROQchBlC6n0ftR7SuYggvuN
         /lkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753733684; x=1754338484;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xsKr9U/Lsla7ASXIDbg0RnYrGFWyhEYxMUb3V5AUIYU=;
        b=pPzRuDMw/nJDRfxvoVkLoW/5VGpJCuEW2VA3baNycBNsdaUTWOJ3YQvKaEiJmMYGRf
         DUFI3rnnbGpzQhmr/hnsctG26kInlWEfpuwPoTuEL/q4FrU+s8gK6YcofKnhuyKgcTgS
         mPR6/m7pkDKnOQq3y2wBUxhD4ZfPotP7g8lWvh8ckrYCj1LPvkcpN1/U9GnZI46J4qtC
         48Q6czD4wjVEL/c0rGAsM7CgZ5N8s0aujSgvsVUoda1dv2qRXbNH1MPX6i3jHPxOFKv0
         X2M6OFQyVLmvxc1ARIDU+Ebritb+czkwhUQVnQky0AdCY0UgEy0VjoWbhZTblrTqdydt
         Adog==
X-Forwarded-Encrypted: i=1; AJvYcCUJKTksf3eIVn8CcIpmRoEcyoDCbYUJJ53t58kKKwMxrW0GdgIKoVySYAyFp/t+VfyTN4VdWuFzummZ@vger.kernel.org, AJvYcCUmvKgTKC2GtzsbRinZC8SS+rcc1Jg7ytZzkAe97Xjpd6yZx380WHVKTCf1YBx88chnY+2Tl0Haf/0w3o934rr2Xt4=@vger.kernel.org, AJvYcCVafq33UdcawfXlbC0fo+qtM/+1qZZCmmGxKR32hP5kJzdPn6Ah4+FXLfb6wjyeiiEXS9U49km5BMB/uSOe@vger.kernel.org, AJvYcCXSfqiTZ6MDjy1SuXQuv102ZKmKLlZlRlsXaXF55JgFYgpwRG517/C8YzaXA+Tghp3+QxostJfTNMJa@vger.kernel.org
X-Gm-Message-State: AOJu0Yz6nXh6nFpWE9x8nZ07SdaQEejjBM0P4Txaw3vY7al7oIbnEshD
	w8LYdT8xup0EAW6Qxr8h8wAvOu1FGrGKqnOV+w84CVHjsqFI8b4HIfP2
X-Gm-Gg: ASbGncs0rW17dDLZRviK0nbAPMNAMfrAHGUFBifmn2ApT556j52mNCAKRpMcKONlh3h
	xfx2Nh/61BhdZaCVTyKOdE+48C1aC5drgaKm8n6NTm0R+La6VBFRVrXxJ6babU8RUXY2JwqvEwO
	BOy1arGa0cGMbn5FoXFHo9eDK/GInztzoWp9v9cQYFbSyopi0I8a4oGLfOqTupnkRCoRr8zpbb0
	UI4qWEKnlbmh8fixMdgj8LJUd6FZTRT+cJE8mF+WHHVA6AP+HcG1FZ8HTnyZjwu5saXYyZayQhB
	VpNwByp23kWL1rzFCPjoqHf/A3m4OZ0Gvb4lVmBHSpUcJc0ke+dFEoEuCGzjWfO6mrg7VuWb+hK
	DsfSILoGcFj6sHc5CGliidecQmiCBqzioopCGwBRxT32PkOBco53B+GpQhbDv7Sq0+HvHmfqct8
	qNKYJJQvQ=
X-Google-Smtp-Source: AGHT+IEUuNcHOeAWdj0gIvB3GRqBx2ONsSi3vaEA4s1TNTEmWl2Fj7ZlUH8VSVsaLrvW0IJwWOHZwg==
X-Received: by 2002:a05:600c:529a:b0:453:2433:1c5b with SMTP id 5b1f17b1804b1-45876307420mr106740915e9.5.1753733684061;
        Mon, 28 Jul 2025 13:14:44 -0700 (PDT)
Received: from iku.example.org (97e54365.skybroadband.com. [151.229.67.101])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3b78889682bsm4317760f8f.77.2025.07.28.13.14.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Jul 2025 13:14:43 -0700 (PDT)
From: Prabhakar <prabhakar.csengg@gmail.com>
X-Google-Original-From: Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>,
	Andrzej Hajda <andrzej.hajda@intel.com>,
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
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Magnus Damm <magnus.damm@gmail.com>
Cc: dri-devel@lists.freedesktop.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	linux-clk@vger.kernel.org,
	Prabhakar <prabhakar.csengg@gmail.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH v7 4/6] dt-bindings: display: bridge: renesas,dsi: Document RZ/V2H(P) and RZ/V2N
Date: Mon, 28 Jul 2025 21:14:33 +0100
Message-ID: <20250728201435.3505594-5-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250728201435.3505594-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20250728201435.3505594-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Add the compatible string "renesas,r9a09g057-mipi-dsi" for the Renesas
RZ/V2H(P) (R9A09G057) SoC. While the MIPI DSI LINK registers are shared
with the RZ/G2L SoC, the D-PHY register layout differs. Additionally, the
RZ/V2H(P) uses only two resets compared to three on RZ/G2L, and requires
five clocks instead of six.

To reflect these hardware differences, update the binding schema to
support the reduced clock and reset requirements for RZ/V2H(P).

Since the RZ/V2N (R9A09G056) SoC integrates an identical DSI IP to
RZ/V2H(P), the same "renesas,r9a09g057-mipi-dsi" compatible string is
reused for RZ/V2N.

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
v6->v7:
- Renamed pllclk to pllrefclk
- Preserved the reviewed by tag from Geert and Krzysztof

v5->v6:
- Preserved the sort order (by part number).
- Added reviewed tag from Geert.

v4->v5:
- No changes

v3->v4:
- No changes

v2->v3:
- Collected reviewed tag from Krzysztof

v1->v2:
- Kept the sort order for schema validation
- Added  `port@1: false` for RZ/V2H(P) SoC
---
 .../bindings/display/bridge/renesas,dsi.yaml  | 120 +++++++++++++-----
 1 file changed, 91 insertions(+), 29 deletions(-)

diff --git a/Documentation/devicetree/bindings/display/bridge/renesas,dsi.yaml b/Documentation/devicetree/bindings/display/bridge/renesas,dsi.yaml
index 5a99d9b9635e..c20625b8425e 100644
--- a/Documentation/devicetree/bindings/display/bridge/renesas,dsi.yaml
+++ b/Documentation/devicetree/bindings/display/bridge/renesas,dsi.yaml
@@ -14,16 +14,21 @@ description: |
   RZ/G2L alike family of SoC's. The encoder can operate in DSI mode, with
   up to four data lanes.
 
-allOf:
-  - $ref: /schemas/display/dsi-controller.yaml#
-
 properties:
   compatible:
-    items:
+    oneOf:
+      - items:
+          - enum:
+              - renesas,r9a07g044-mipi-dsi # RZ/G2{L,LC}
+              - renesas,r9a07g054-mipi-dsi # RZ/V2L
+          - const: renesas,rzg2l-mipi-dsi
+
+      - items:
+          - const: renesas,r9a09g056-mipi-dsi # RZ/V2N
+          - const: renesas,r9a09g057-mipi-dsi
+
       - enum:
-          - renesas,r9a07g044-mipi-dsi # RZ/G2{L,LC}
-          - renesas,r9a07g054-mipi-dsi # RZ/V2L
-      - const: renesas,rzg2l-mipi-dsi
+          - renesas,r9a09g057-mipi-dsi # RZ/V2H(P)
 
   reg:
     maxItems: 1
@@ -49,34 +54,56 @@ properties:
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
+          - description: DSI D-PHY PLL reference clock
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
+          - const: pllrefclk
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
@@ -130,6 +157,41 @@ required:
 
 unevaluatedProperties: false
 
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
2.50.1


