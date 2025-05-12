Return-Path: <linux-renesas-soc+bounces-17006-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C09CFAB4400
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 12 May 2025 20:46:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 636FF3ABAAA
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 12 May 2025 18:43:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7BF00297123;
	Mon, 12 May 2025 18:43:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FJpo5YFC"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 89CFC296FBA;
	Mon, 12 May 2025 18:43:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747075394; cv=none; b=LSgWUzC1lFnCGnNMl7KQHaYkxgXX8MdQZaXtlLZHc8YNSv3BAV5b0+NBmC77SbzfPXn2TONGjsHgZ3RhRvG4dY8dlyB4xEYaP2Pe6XvAs7RpGEpJB8ojlS9jPxXOLrSIP8tJ3osKYvNDslrbLfDgaTveqn5eI1yGLXpYPlyAReI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747075394; c=relaxed/simple;
	bh=ZqUapxjat4NVLHNKyOXq/tIgM0UFPoSITTlLAeX7Wpk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=GRvzk5Mfha7ELZqh0szeJ3thj1SmhMUrLJp/HpsrSqIiMa54e1O496MD4500tUNsitQeBalYjsRZqr2WqTYjN00X7EVLnvzbjRS/CY5+4CnvSOyvfFHtKLqoOBiMwSjPEwjbXOp/MtoQxK8xNuKSJE7Ogs4/icrmBZlAcWDJF28=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=FJpo5YFC; arc=none smtp.client-ip=209.85.221.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-3a1d8c09683so2656425f8f.0;
        Mon, 12 May 2025 11:43:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747075391; x=1747680191; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kd8ToXBYqgNmbVcyeLHk5NPIyHmj3DKveR0qgHKffVY=;
        b=FJpo5YFCrZZhkN/svAmwR15978eCAtdR1gSV3Pc+44idy1SH46EE6if/BxU4P+87aT
         akUVwE/b+3yOAWZ/icM3AAQgTXLKksISpZ/kAo4tF1TGsuqyIVW79IBLhQVoi9j6GKDF
         lmIAZ8g+Fef7IUC8/ZQTzV9U46I0hEpUKBlTOCek38nknuSo6F24jioIOhpR8k0vaTq6
         ogXoxXRiP7iOZOaxUmVVaEvhB+RDS/lyZvMGLRiEnXN2AxCLFZmxzKOiMcuhLm6L6iBy
         vRu9uixO/VkFVOKJGmODBhbgHrPmlYn9fg/uJVdDm78F/D9RAdzZxyb9hyc3Fb7UFN9b
         plmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747075391; x=1747680191;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=kd8ToXBYqgNmbVcyeLHk5NPIyHmj3DKveR0qgHKffVY=;
        b=PmrT/Ya2LGfCXYG27EE1qh4gEfopfh3JgDRwCrIYoLCMGYhE4lAXPimEluqIj6zezL
         YnWia0+tGAXouH7sDbDgpMtyqkXim06cgL/468bTyCff14qTusJCPTXmddpyQM2o5wKV
         QxBn6Fh6TdBg1NhMlG8bon+5KJLfWtGuXrnc9OdD6ZIkH3mgCS1q3oduaZnHUmB3IPs9
         r/Z5nSv7jwAX6/HwNUYDQ7WGslx+lxh34/rl+acd72jJoBdU6hW82dbcKR6lN4wor8RL
         ECSDmZ50VpuiqVlIFMBWsaBxydszrT6w+oMUPQwoLsFca16ygqS4feYHnymyfwsFx21e
         vBpg==
X-Forwarded-Encrypted: i=1; AJvYcCU3VHnCYLBlo653Ggd+W2bocf7m5RMWX1e+399YAZ+WUxQgkqAHdN0CaFuxzmpe8bycLtS4ViC3Bw+L@vger.kernel.org, AJvYcCUCHuXekbsZT5tC8yqisecWUbSzBthPEc+d2ZoMAIoclV3QEYmjKlY+thMytQIOlnj0gwh2iegI+TK5@vger.kernel.org, AJvYcCWp3ccOFBW1/U5tL7f2S9eBF5zcQA9nerfKYAoGhE47WI+bH4UJBP1Lz5oDIfzIyJgfsyMCNln4yrodNRPBx1lkwDg=@vger.kernel.org, AJvYcCXQoL9/gLqjhhL6VruZQcls5jPcDV7YxDsCj26elcsixOrZ2pjzCScyl/rwYGP8Y7O68UZaCK4Fwla79v2S@vger.kernel.org
X-Gm-Message-State: AOJu0Yy9qJd+2p1DjK05SygGeolHpbgOuyGqNIjrm8zIz1u+ID8VWpNc
	TXX1olFtn26e0SblwQpkII7MVVbdiamIKsQZmzMhQH0aCsfLDqCf
X-Gm-Gg: ASbGnctO+5qrXpHW9LIVzGqiAqjm9IsjESvKgNVI37f2pBFixQ/gc6giUWo+qWGegM+
	7kOb15RlJIavbShCTm6N69uOIf9ub8qIrP7l3Y+16Es9yd5FRn/+UGezNxCDlG7+eXw+mK8b8gc
	uJOY437IjBv+ncvKVrEJk5STl/i9Zf7PCcLkQyV2rROoY9LELa5Q9mIW4RyUzfUF3K2inh29ley
	5wCltSn/r82F11yUYIwonMUJyb4Ut13j9KZvoDeeSFv97mMXgQcSHP/Szm59gFZkEljvgSWbSFc
	nLFyaaqArQnJTDMvOBbLWxAAcXKlNoLmLXOYVQ8z+MEmbiPOLrnKeqUln//4taEuILp0evrin+O
	A
X-Google-Smtp-Source: AGHT+IGI/+dH/CdURfxD6W7eKPlxKN1PN9yE2+rZsr9QKCyZcAYXw2DqE75q2i4hHMhdjtyzGe26ew==
X-Received: by 2002:a05:6000:1868:b0:3a0:b392:c2f with SMTP id ffacd0b85a97d-3a1f648782cmr10654178f8f.44.1747075390143;
        Mon, 12 May 2025 11:43:10 -0700 (PDT)
Received: from iku.Home ([2a06:5906:61b:2d00:581b:951a:bc46:a124])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a1f57ddd53sm13309203f8f.1.2025.05.12.11.43.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 May 2025 11:43:09 -0700 (PDT)
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
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH v5 3/4] dt-bindings: display: bridge: renesas,dsi: Add support for RZ/V2H(P) SoC
Date: Mon, 12 May 2025 19:43:01 +0100
Message-ID: <20250512184302.241417-4-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250512184302.241417-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20250512184302.241417-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
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


