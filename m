Return-Path: <linux-renesas-soc+bounces-21294-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C6A1B42691
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  3 Sep 2025 18:18:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 50C903A4313
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  3 Sep 2025 16:18:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 399C42C21CB;
	Wed,  3 Sep 2025 16:17:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="C3WQdfc8"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 188DE2C11D7;
	Wed,  3 Sep 2025 16:17:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756916256; cv=none; b=eakIqBBOs2Ye3gI5t+vJdXgb+BtieE6NUqfwe+iY+jSHRfjNZZgbdIyazpEISL7l5ATwMtlo3OQ31u1NyQ9mRVwSXVNHnjDE//96gH/Mvql2VE2C7rBijxytWWSBMAtj/2caviK9jn+YRt/D2To5DEfnndSxb/ddvig3qV8cFak=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756916256; c=relaxed/simple;
	bh=V/eTeUoO94nrf8X5xXa5P7/7D5kjRmYF3BVLIjVZWwc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=bW3Zson7qJCXaYPjPufQGHvFdqiirh9lYVBdvn6AvTZnXlC0UGF/gSPytfS3sN55yp/ZSEVV5nusqqcGPIcnZwmXo7nJFQ775rB8jyDV5272TRH11nOyqf+yK86j1Epssz5tJ/RSaGJ/Ihwjssz7Vf/gDxMqnCf3cEwZ2ZVcGwk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=C3WQdfc8; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-45cb5492350so842865e9.1;
        Wed, 03 Sep 2025 09:17:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1756916252; x=1757521052; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OtgegsYQgoMs+VRvy45Y08IsP3REyx6k5syyJ1k7tLc=;
        b=C3WQdfc8BAdl2L/bN1kERsvCVIFhATWRcV7DpOzFjvpPLLgNg5IBmIv/XbzYWRkjay
         wpefRVKYTQIrF1E/OEUs3QkKjubY5BbPcVfaoF543iqXu1CsTI/tiTPwUtUOSMyuzmZH
         9DJIqmhSwpd9AUvDVvVYrdw2hB/jykkojXfLTPoQ64WcWpI1CNWEb2VXZiwqQohx1vKz
         L+umSrdnR8q11nrUT6anJPZPTwdGHNpWlu4U/qR1vEcCMehe5TdQi0pzNXOWGptI9xf1
         H7ThsgRrelJFqnV3HFeIAEnYd9q+tzN7tYlhV3WjvTjeKwN4xjXgiHw8hzOl8qLg9lNC
         E5eg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756916252; x=1757521052;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=OtgegsYQgoMs+VRvy45Y08IsP3REyx6k5syyJ1k7tLc=;
        b=VMFT2gnbIaJErOoyTwWPxtG0R2T72ED/lO778/ZKT6XzA42DAO/3sUHlmlu9sb7t8W
         8flpB8xtGuddSM0+v2msmHr7CAwLwtCI1lUcLqT3lXNCyOkEU+HugNRAHEGv93v7Zi7j
         ZQshEoFTJPqrEfj8SsSIuTyw7ACMxaRNBujkMNrlMyS+9hhDSh2H553qzCHal+5rbnrr
         QnP4jvEidh2BuqZoT7dBtXDAbnVj1T6AwyTHOaCmkbL3FquY5vw+plnwXJQZgBRYO5Nb
         EWDXWLdgC0N5LQIyQgd1KQwRzgxZU5fSojiVTa2EWZaxphpi4vIkFeteNF1Gdxr5m1K4
         nmmw==
X-Forwarded-Encrypted: i=1; AJvYcCV+J2sXNSyfhpns0puHZHOe0ehbTZPfTYmSfOihkWttswDPJxLdBzdcnmFcN7qSAR6PC/YLonm/6AlQ3inty6EFfqA=@vger.kernel.org, AJvYcCVfqkTUG1vrSpE0jUQ3xW6qATlKulqckrf3whu682K3bPoZl2DDQCw5rB5zalOAG4mG7zX6NIhHJbFN@vger.kernel.org, AJvYcCXn4l4Qd5Q1MdufvfJfDNXWGVyDIRWToErzauFNNszdD1THJ8gLA6gjlCdBFgy8IbJRxX1hVp/yonf2@vger.kernel.org, AJvYcCXvzWxMVqx13s+RDF6PWRwacEl1Pdp0x9a4qwDK2hYcnjGfs/SlYs3BuPzHfQSx8p8fv6zZgGEGwHjWD8gZ@vger.kernel.org
X-Gm-Message-State: AOJu0YyQMUtc+wooHu8/BnrrPE4QQ0ofdm4sAJ/3wpk5dkV6lGDQ8Dlx
	QdGRDu5CQfd9SfYmgdnA5OjB1ZmpoL1GEnp3bJMWVbLRaH17ynsEzz/m
X-Gm-Gg: ASbGncurpaBQpPknOSCJe48KxjytUPXjcl60/dJBCwzwNIJrL/uG1TRj4rqC8PYrPLe
	WXf5XCclFWmr3XpW4JK6WucYXh2vnQzjlAeCUIB4mi9ml0JZnHVd7sQA2ZOvUzXZG9jbkNPG+3g
	M0IGxcyhE/yMYiCCF5TfkUhJOGxLsUDuhuky0Lfga9oi6yZUt3EmCoULBeD6iQwunNzqoxY4HZT
	0h2oLZIKsGxp8m6WQ9RQ7JK0ivlC1h1IDZYIJWzeLfSDq1VErHY1U+0FACFpHPpQOsGZYL+1Gpf
	uRYmIGutfWvX8m7eNecNqTfo+B9RFNMHytPNAXdQdrWgVh/Ke6TFlkPWW+HKoB9Uvsghd+shWLC
	kCAHWCTCSkMU00HttxEUWbmqyEmqHqkEjegYLYFuxrjxIizG5whJCjfRDmt4MZwl0FYX5uGJ9pJ
	glIw==
X-Google-Smtp-Source: AGHT+IFd5CmrZRXPdtdnpZx4wodP7UGYIRF8rXD7UIiPOJu9eHsNXe6+1sJmv/UeL9ZFL4OLKTP3HQ==
X-Received: by 2002:a05:6000:1788:b0:3df:c5e3:55fe with SMTP id ffacd0b85a97d-3dfc5e35ffemr1040752f8f.29.1756916252251;
        Wed, 03 Sep 2025 09:17:32 -0700 (PDT)
Received: from iku.example.org ([2a06:5906:61b:2d00:9019:aa0f:b6e4:7952])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3db72983560sm5645734f8f.1.2025.09.03.09.17.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Sep 2025 09:17:31 -0700 (PDT)
From: Prabhakar <prabhakar.csengg@gmail.com>
X-Google-Original-From: Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To: Andrzej Hajda <andrzej.hajda@intel.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Robert Foss <rfoss@kernel.org>,
	Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
	Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>,
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
Subject: [PATCH v8 4/6] dt-bindings: display: bridge: renesas,dsi: Document RZ/V2H(P) and RZ/V2N
Date: Wed,  3 Sep 2025 17:17:16 +0100
Message-ID: <20250903161718.180488-5-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20250903161718.180488-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20250903161718.180488-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
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


