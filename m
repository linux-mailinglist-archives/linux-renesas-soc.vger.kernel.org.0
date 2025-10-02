Return-Path: <linux-renesas-soc+bounces-22610-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 60EC0BB47DE
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 02 Oct 2025 18:18:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 6CE977B48EC
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  2 Oct 2025 16:16:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8C15D260590;
	Thu,  2 Oct 2025 16:17:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gcu9E3PN"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 37475259CB6
	for <linux-renesas-soc@vger.kernel.org>; Thu,  2 Oct 2025 16:17:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759421869; cv=none; b=FYiFVBP/6TuDEALmGqqXJz/nnobjiHxki8CVY7dxWcsTMAHnO1KMmhlIyRJPjo8dTSOs4LxqmYVL6o4aGdYqY7S2tAqTn8m4qoUmvzGArNjm9rV0kWdJfDFfvCVjTGX12jGQ0tVRmKtLegeWA8wNNSnQDY4um42o2XkReFGAhp0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759421869; c=relaxed/simple;
	bh=pthcIo15dRUmIa+oyZv5WitDBQRDjvaf+qQXyfCEx0U=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=NFTG7/yY4oueqVyPvyXCfWBydfdy76iy/Q1QCIEht5gZGfgyRKLPiir2AWYrnQrhmrk7KtVD6EOgYBl0LYmkp4wfMpSr9KxrXSt7Aq0MbvDvDfZVT/Ggqxn8sGdEJVkTi1kw8WmCpcsQS4kabF++V3uvxIu8WZB5aKm5SnyrGcs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gcu9E3PN; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-46e29d65728so7775905e9.3
        for <linux-renesas-soc@vger.kernel.org>; Thu, 02 Oct 2025 09:17:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1759421865; x=1760026665; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qkKeX7BPbEgVgo3v//BIRhkq1mPTtijFKLxIxEvgWwE=;
        b=gcu9E3PNR9JcunhO4Wsd6UHH18bJsPZSPjuq33g/n1bVjSIjxRL+FtHBubjehnxsx9
         di+AvvUXFnP7vcSN6/bbmeevUAUAfBt7rOlOqt8HArEfKvhL4tu9i/dsIYJPy4JrQ5Cm
         YctIqLgts9t6w5gZAMG+c8eQTLi8Eq5gfrHB5+lObYHNwAxNCLxcPsrUKLQRi20Nt86+
         prLqI07LjQr2Wq+Kc6NsRiQRCAmJF/dD+RzUuxtHiOH2xK/RS4PPuQYNP/WPqKbaBriH
         nl68L6UeJBr7FgOmHYzb5cgPOzBRvVIPQTFbfR8im2ACoFog6kEaBM+i6rvu/lghhOUj
         14hQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759421865; x=1760026665;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qkKeX7BPbEgVgo3v//BIRhkq1mPTtijFKLxIxEvgWwE=;
        b=Ig6hCsgWm3l6Gitm0TMafX2goX4ap90TGW4cr2aVJBszUi3O0SI8QiV3GGNzHkcRs8
         g5UTI6GO2ZEMBh/8i82HbHaVXTpfd9FwxpqOWrVfXKk93eGEXROcir3wRa4D7O/StRyc
         XsrxfG8MV1a0DB9sMoP9UK6DZwSvjxxW1dOlF8Po6JLsp7Dh00bzUVFjFvYqU62PL9Oy
         /DF/NsjOB5VEoiEoHSFiCqgHYJpbNf8VIB4P78UMtWW3yx8Kj2Z0vbKx815XQFudvtX0
         iQAP2zhH4TpBW4PdqyvGTRCc1AehZ8gU7+6AfNGGEP6o0tpdA1pqEnByejilbjZ76SKm
         gmzg==
X-Forwarded-Encrypted: i=1; AJvYcCXV8hs3q5xbPz6MzQyXtmrGYGpRW5+fic0n1dIGzWBeqIIgud6P6p3oezUw4lEGJNAT3ScLJhM33glqEbywgRiBvQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yxua+Zv+rXAcg9TdykjwSsRR77jzlPo9Mlac1VWVsnX6KZ1kSiA
	sHiPIL8KB4d1ExbBQ8teJp1wUDlbZrYLD7nK24d+XlQbQejeV664bEm+
X-Gm-Gg: ASbGncsxauL7fLD6hZJLFq6tPjdZpMOyfzJbz7HGKTOcZXXK0QlSC44GDT6brdW8cgU
	MTFNhLnMqkOFqwgUnf/kgdH0YGNNf+0RfJ/6sn1XCn5WVBj6+MaYHzpGbmySMURAMGSD2kC7PPD
	0d5cAx2zgqDEZ3msVM0PEbpJFOwVW03O/Lt7jUVuh0kMNhUjUaCL7fnqt5XWLJ623kzelqE7pwF
	C6NmpFvtbe+x/b7u9nrG1EftLb+1ldI+Wj+DPt2Rj9yELXQqQUTspAOEK3j8077YU0LnOJ2MNZk
	z8hbgQ2LSOSnAbbVprX8PSIbsoG1O7zNqIf1CrTM8/MIVAj+NiqAscRFb0k+bcoqBzTNhfotYw5
	SgREG+yRjf38keTj6XczQuD78KqyClk3MmpnacKAkR3oZDIW/YCsIdZoT9vI13kaY4U8ASbuyVJ
	QDaB6n
X-Google-Smtp-Source: AGHT+IG9wQU4xTz5WLdywFAKe5aNgVUBks9GyCfH4cC+cyVcmN1z4YfpcRspIszTZlJBpEymTZ2zzg==
X-Received: by 2002:a05:600c:8714:b0:45d:f81d:eae7 with SMTP id 5b1f17b1804b1-46e6f7ff18amr11697255e9.28.1759421865283;
        Thu, 02 Oct 2025 09:17:45 -0700 (PDT)
Received: from iku.example.org ([2a06:5906:61b:2d00:607d:d8e6:591c:c858])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-46e5b5e4922sm58605515e9.1.2025.10.02.09.17.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Oct 2025 09:17:44 -0700 (PDT)
From: Prabhakar <prabhakar.csengg@gmail.com>
X-Google-Original-From: Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To: Andrzej Hajda <andrzej.hajda@intel.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Robert Foss <rfoss@kernel.org>,
	Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
	Jonas Karlman <jonas@kwiboo.se>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
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
Subject: [PATCH v9 4/6] dt-bindings: display: bridge: renesas,dsi: Document RZ/V2H(P) and RZ/V2N
Date: Thu,  2 Oct 2025 17:17:26 +0100
Message-ID: <20251002161728.186024-5-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251002161728.186024-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20251002161728.186024-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
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
Reviewed-by: Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
---
v8->v9:
- No changes

v7->v8:
- Added reviewed-by tags from Geert and Tomi

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
2.51.0


