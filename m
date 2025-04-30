Return-Path: <linux-renesas-soc+bounces-16538-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 7CCE5AA55CE
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 30 Apr 2025 22:42:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 73DC5984302
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 30 Apr 2025 20:41:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 74FC62D0276;
	Wed, 30 Apr 2025 20:41:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bIRedCNP"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E4682C1E33;
	Wed, 30 Apr 2025 20:41:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746045685; cv=none; b=IRAC0jaByedBJjkLN9IVS9a7dPoHBXHH9z1ML+lTSJ2ueO/fuIIsmnixit6w1nh/jH/c/0scLehdNUzB7n0cTyL6zw1H/GhQEur7tPyVeAR4eNtoeianToMw2A22BGmdtC7/FtZmAHMyAhGcjSvhl2OVnfUVrWvgM2bKxKg4xR0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746045685; c=relaxed/simple;
	bh=y9RanTDCK95O3sXyhtwa3LzBzemnwjtblESp+uo9hos=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=lNm2PVHtmle+rdKsVci6UMIbXC9xLOhX5gTSlpzWWqSnr7g/iYn5Ld7KdXFUqq/DjBr6SpYcqGoKV2LKj7PapoOMYsL62eRw/DopFHPnz+SsWT9/udgb0+pORA1+G/15SpaBLrRCSht/PbNOmg/VUJjaUs5IcnP9M8vaH9/S+wE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bIRedCNP; arc=none smtp.client-ip=209.85.221.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-3913d129c1aso229954f8f.0;
        Wed, 30 Apr 2025 13:41:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746045682; x=1746650482; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jc5lidqt7Cbw64Edi7Dquoi+na+E/0kDd6ZUHEglJ3Q=;
        b=bIRedCNPGXSXO3bhNW68oomM7GpR94iNCYhMnI8bD2kbiNrx5PnxNM+9htqWm42iqC
         uo/hr6BzOApj+9s8xWmv9e/0scLu3xiOQfsw88WVo02fUdiZ3wR7tuRVM0p+1JnFSXEe
         gYHlRAs6KCAsL/Q0CtOaujwaIYfPE+HXc+8mhR7P61MWdLem/i0e2tITfhfw4N+GzBRE
         ExxBp+L6Fyqpm/IlG/nT6rCEHaP//D0vVqb1wKEQV9bNnEuHDHL3mrTUtt6Fwlkz0mOZ
         uvZAszpyiiXu683OcxE1po9Q42JHJzQbXXRtJYs4vpbWwgvLJUCqaVTXgxDw+w4wIS0d
         5SKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746045682; x=1746650482;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jc5lidqt7Cbw64Edi7Dquoi+na+E/0kDd6ZUHEglJ3Q=;
        b=XSpp9bjARvnAG0x5WdjpMUeNBLaHBsH/wljhRntElEUBcoZlqJKIlbS+3LlQRbSwFo
         EevFZ0SmuAUe0R6k67Ai03gP5q2dvgumXwYpypCFFHr4o+9wiujH8Q7RqtHKPLYiy7+E
         /IRQghxtfbLlLAZfvN7R3zbmMtwpqC0gpUF9d6GjgEWOA6hoLzzoemr8DYcdh+KYXieV
         ZkgetIO1v3hNxWdMOPtn7lGZ84qY2PLKKi1Emv1jNPAEfPwVafxhdAjS+eDABkJvn8Cq
         WB/ttxuYf5gCrBysXKuXXD7UBMLF3EIpPFF8242rRSmXmsJOfO7dkrXQhy2UhkTKV4FY
         1llQ==
X-Forwarded-Encrypted: i=1; AJvYcCUFw58djnU3G6xL7TykjzBmrbJQM2AaK15SSwyoGzh1Owt9L4dsXYeeRbeOsIgRyajrgJdeMbe4jAzkOdue@vger.kernel.org, AJvYcCUkY7u4gFIjlw3+dlOsKIn3TGv471SUMMmzC/AZkDa317WpBuhn9wnxPvbU4BixepaEo4eLEy3MU+qJ@vger.kernel.org, AJvYcCUnLkXwmkefMen4o8iMzmvs8lKG5Q2O6gvtYehOmBVJCVWpJhAP0GaOGoQO1VCYhN3enJ6MhrkWB63Fue9WHS8Ig5Y=@vger.kernel.org, AJvYcCVU+vxYqwnrdHEyV7UhweGub8vGJWcjrC+NuAxfVnlcNG/Vg0dchg0lOOhkWCBdOiDIzGwExFiDa5fQ@vger.kernel.org
X-Gm-Message-State: AOJu0Yz4ERzW62ixm/sowoAbw27ikP5wGFMWQzsvcwksdlN/fZuegHrK
	4mQltf8HIDHbz45d6vhuDGekdUk7zNtm1J2inUkv0pMM+batr2aPxT3+M/ih
X-Gm-Gg: ASbGnctDWmJZQ+GqaaqQKtb6QJ9hQYvavzyWXwctLBXz4p2DPGNonHqOlUEQabZ9XaK
	8d0qO/a4YKTsQgHtAB7gUla5logbdBwFvvIlJAP7TqNxltXB6vK1560mGH5Hcs/xHOD2zZxwgQV
	Fh0Alfr1yu+dwDmKVpHaGGmfBs2Fdq5wXLGmoSVIJZPiHlWLH/fdbmAcAL2TITFX6gMu5b/UetU
	w6GPk9XWAOHM8W2f0ups1pynlJ9wmqUahQDF+guhuhLTO1x2cpscL1URFTWAxze74rEu7USFDt9
	uDJOpqOrsogMbE+QSqaIKiRb4GbyXdfX+3uHt2NdphU8Z2bXXxuNVkJkBjsKiJW+7HBpL7dEesI
	=
X-Google-Smtp-Source: AGHT+IHHUzMFGKdxDgyqCJTuyhZ0PlVXOJ6jz8lXKnYp+UQF/DbTdDXvcPgePTRPDX4p19budtmtQw==
X-Received: by 2002:a05:6000:2207:b0:39c:2673:4f10 with SMTP id ffacd0b85a97d-3a092d05854mr732931f8f.23.1746045681638;
        Wed, 30 Apr 2025 13:41:21 -0700 (PDT)
Received: from iku.example.org ([2a06:5906:61b:2d00:c5ac:bf15:f358:81a8])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a073ca56d5sm18098132f8f.32.2025.04.30.13.41.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Apr 2025 13:41:21 -0700 (PDT)
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
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
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
Subject: [PATCH v4 04/15] dt-bindings: display: bridge: renesas,dsi: Add support for RZ/V2H(P) SoC
Date: Wed, 30 Apr 2025 21:41:01 +0100
Message-ID: <20250430204112.342123-5-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250430204112.342123-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20250430204112.342123-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
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


