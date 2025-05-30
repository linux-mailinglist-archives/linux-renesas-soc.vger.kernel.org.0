Return-Path: <linux-renesas-soc+bounces-17734-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id BE55AAC9491
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 30 May 2025 19:19:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 231E016D4ED
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 30 May 2025 17:19:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EFE0023815B;
	Fri, 30 May 2025 17:18:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="In0gB4uo"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA0EF236A9F;
	Fri, 30 May 2025 17:18:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748625539; cv=none; b=cjUbONgn0U7Wan3aGx0bxA2oxoddIDx09dAvvmVOv21WInZwqK9Ksi4VcjyXZlPoQQDPBdCLiBwRMykP8sBQTZeAYiCLhx5xHfy7Ri/4T88cmprnhafJC3zkk0v2rZeGBVhqrs0OGO8RPogesTrj77r3EqIObnkQ1IwBe3ue0v0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748625539; c=relaxed/simple;
	bh=7qZGUf3xDtWhNhY7eInj5G7x5nr1Bm8yfz1NmfPKMOo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Rx+//DblpG84r6UVlefPZHYTIL3sqDrLRAqZdUKaNvmyjl62EsKXMHGWxkdMTetJAAuRCXWX+iEssHd49KOdMdXWJHrqVKaO95MbWTzXRqDL0gXYzgCy2pyu2Rxvez8pgQYoe3RgDrM1oMKcf8KRZeznuqV/culxb9ibuafMem8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=In0gB4uo; arc=none smtp.client-ip=209.85.221.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-3a3673e12c4so1564220f8f.2;
        Fri, 30 May 2025 10:18:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1748625535; x=1749230335; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7h13WzJkQLQSnoZkHLJqQ5H4JRARwyv4OMjokFuUIjs=;
        b=In0gB4uo19CjsZVYWAX6v4V8TD5tctp/quhB62hNRzMPJcdnrznIWOTbjnXIk8n4Vo
         hajT7OOsI0VRg+u8OlcNLob4i8or06qnVRwyhQW3I+o8AX4iuy3dPei98gKBwCzIOxLq
         ysK59FhoUwAWmfhXrVBEqnEkZnwO/vk0zwOhNERxK1YNvz7R444wqHFrQlJ5DW/+grTn
         oByEdn2kW3rMZnQTw52H+yYuEluZpkkJzpn5idDFQPB/ekey3gjaHEDdEIGcMSH6D/tZ
         k1MpEFWWXLOectVe//MZUxnGnlXcgSUHcKTxrYRYyPBJfrRZ4nvbWNYqZwRz0mG+273p
         dNaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748625535; x=1749230335;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7h13WzJkQLQSnoZkHLJqQ5H4JRARwyv4OMjokFuUIjs=;
        b=aN6W7u2snaALQf38ScDEKnp/eN4Z/1x6epsbqlPtw1CFB3v4FvNlac+ef/uDnv6zk+
         d3UY2nl3FYOXWac48rAPWjHAYpMGLSISBLkszJXvWKImQma+Mrnv4DWwheCs3Xwwh0V8
         t4toLXYOz9ztUHaHdcJi0GKug/L0dy6UN0ebgZL44SOFw6T60lruth491J4W8ha2lZpv
         Oo4dqnaXw7HznQ7/VScSTdCJZdnUyM6VY/AaP+syp7EVQ95Vsv6odWZlemKwVg9n81YX
         vFcFMGTzP65g6DVZWNBxZV4aZK38EPX0kQNCCWE5QjAzd3iKlfIZhyHaueA1yKmxiLSV
         wtrQ==
X-Forwarded-Encrypted: i=1; AJvYcCUXbPjyLG/wqh+ocCPttjwyv7MfBkTlXVEJfk6gr/8XGUUo8XKjNbYhDfMH2ILO8r6r9v1abIkdMK0DX1xyE6B/bT4=@vger.kernel.org, AJvYcCUsqdg3ilqWk+ajUNEo3yIllZE1C0ahKhPIyNdPIrPFyYR8WwwlzyX853Jnn0AwjRoYO4RurGJyZBZOJOtK@vger.kernel.org, AJvYcCVO98OPNqmDlbrNyng2PYSZKm9ZPAf5bZW1tpkIwlUfxvyRsErhHP35gJ1mtwV89gB9MC+Fz0v2u0nw@vger.kernel.org, AJvYcCWOR8g4urNa8ajE7OYjJ/A/umnMkJuNM5+3h/Tpu9UbH2REm+Bxcd9j/nk2apld/7VC7aD8Ed8ft/j4@vger.kernel.org
X-Gm-Message-State: AOJu0YweAzHszc21f5CPRXLjebLD+UrL4pkmCuJalvQGfU8mCUyT7gL6
	XFMF7xrri0CGvs2jUnoiyp0clLuxbKGF//JsrIgQmQoAQ1TAgAp70k5r
X-Gm-Gg: ASbGncuMclh7Hw4m8rf9Tyk1AwLhs8sbcTHbVxLHB3dYmWPbYdfc02rat56dYaEQij7
	yB2ndtGbaNFFlQ5QiHMtsdj1ooehcW9M/C8zMxZ2Jf+wSXP2YgitLrYjfTLt08fgZigODcyTcF0
	Ju7N7Y25v5yB3KQ15BpIWCoBlHTbOWFmocchvQ2ULEbu4pd1QjhoaXqqqLt2OmDYiTftnZu2sYp
	0GP8Q5Njjz4KTp22w0cUbwTGM9EKQUDdU/AUKh4h6L6uo1Xtph3ipxOdXjybiP4hYfpzyu6tUvr
	F3jqK7uGRh5gdkdZ8ZBn91Svs2u+LQGPktc42LawGMANuKgOZ1UzUIJZEjxrseEyTcQ/Frr6sSo
	ZPAFve0AU2Waihng0+XGE
X-Google-Smtp-Source: AGHT+IH2idWWZFXjlSQOopaIOLY+xY1Y90qwyjkVZC1ZhF8cdwvuECG6UW/WmMELJgLtk/CXIY6DOA==
X-Received: by 2002:a05:6000:2887:b0:3a4:f6d6:3d61 with SMTP id ffacd0b85a97d-3a4f7ab160cmr3201827f8f.57.1748625534893;
        Fri, 30 May 2025 10:18:54 -0700 (PDT)
Received: from iku.example.org ([2a06:5906:61b:2d00:bcab:7ec7:2377:13b0])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a4f00972c1sm5395963f8f.68.2025.05.30.10.18.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 May 2025 10:18:54 -0700 (PDT)
From: Prabhakar <prabhakar.csengg@gmail.com>
X-Google-Original-From: Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>,
	Andrzej Hajda <andrzej.hajda@intel.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Robert Foss <rfoss@kernel.org>,
	Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
	Jonas Karlman <jonas@kwiboo.se>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
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
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH v6 3/4] dt-bindings: display: bridge: renesas,dsi: Add support for RZ/V2H(P) SoC
Date: Fri, 30 May 2025 18:18:40 +0100
Message-ID: <20250530171841.423274-4-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250530171841.423274-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20250530171841.423274-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
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
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
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
 .../bindings/display/bridge/renesas,dsi.yaml  | 116 +++++++++++++-----
 1 file changed, 87 insertions(+), 29 deletions(-)

diff --git a/Documentation/devicetree/bindings/display/bridge/renesas,dsi.yaml b/Documentation/devicetree/bindings/display/bridge/renesas,dsi.yaml
index e08c24633926..8c7e2b17ba79 100644
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
+      - items:
+          - enum:
+              - renesas,r9a07g044-mipi-dsi # RZ/G2{L,LC}
+              - renesas,r9a07g054-mipi-dsi # RZ/V2L
+          - const: renesas,rzg2l-mipi-dsi
+
       - enum:
-          - renesas,r9a07g044-mipi-dsi # RZ/G2{L,LC}
-          - renesas,r9a07g054-mipi-dsi # RZ/V2L
-      - const: renesas,rzg2l-mipi-dsi
+          - renesas,r9a09g057-mipi-dsi # RZ/V2H(P)
 
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


