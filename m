Return-Path: <linux-renesas-soc+bounces-16161-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 90F0BA93DC3
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 18 Apr 2025 20:47:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 4D1738A8292
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 18 Apr 2025 18:47:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C41DB2367CE;
	Fri, 18 Apr 2025 18:47:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZpDduzFJ"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE2FA22DF9E;
	Fri, 18 Apr 2025 18:47:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745002035; cv=none; b=Eatvktqc9qOuaLV270NnaY4UupeeOregNjkyueRuVbh9zPgE9B5BJlNXUYgRhIioq1UWlsRj9Qx6C4cnrTG2KbtVSrBIRYkU0jp6kb2yfb4xZJAVZ4NNIZ5LCkODHt0kHferfd0Ez/dZoUCyZfo7SLjU92w7mXSzKoFTIbpHeN8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745002035; c=relaxed/simple;
	bh=naks42ii09RqmGRP1MUFNM7nNEmzudxD1JV3d+XXVyI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=YG1LrMVMG5U6WZbGz6QrQpXqzSACjArz0AnjDnnBFvIcdhipIKaD+Xuqs6lj/Z8P7VXvIpzijajECbf2BeH9s9ZELFrtidXG/uF0c5rtaoPV7mjTQ754RjMmLyrIYV+xpL8derosJEkgpADgcdkJrMw2wXdpnMII9+IrOI6w544=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZpDduzFJ; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-43cfe63c592so24701315e9.2;
        Fri, 18 Apr 2025 11:47:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1745002032; x=1745606832; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kZNBBcR2M8Y/5VP20+u5ALNuftmnVQQo1BWxYc8E9fQ=;
        b=ZpDduzFJZtHhxSAfM2TQMxTC+C72zIrXXneLm5NQ9qELvPPLhroTzAlvQxCbT8Y7dD
         jsRphZrq8mMzIBthnuzPZuWY8Z6llvkzcE7JPNmVP+iNuR8RNqKz7CwV+CtRbVb53TBB
         QzU4Euonze+VOyhSzD37jCPNmiiYp8TkSCN4S6159vS4c6xuNaY1nxFJJzfUTKRmwMPm
         INPxTtFVvpkgtAf1P9UfPXO/QFN7k/zi6rM+mpECD9ca9XJmYsVuOm43st+hjWJkn7/M
         Hb69xGYHtjlJcT2O3+ZcqLfNsTXtw8Hv9X0Gr2KHXegMNLjT6mYNCeRvA3BiJXSRWocB
         C82Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745002032; x=1745606832;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=kZNBBcR2M8Y/5VP20+u5ALNuftmnVQQo1BWxYc8E9fQ=;
        b=iF416RzkyOxIa+1uVZkOThm8oFZYt9GZ97MczVrEkMP3gRwFn1PbBFYXS0axLB8v7j
         IuHR4juO8OFJAs70oj+Oct5bVcDNyPB54biyBHz19NDJmXv/9aFbOz+PlmAaEtneRPWL
         4DTdIVqEkUVpFSxUEE/+A22BKjVdJn/u4P6SsJmXKydlcseA1t/B4p5ePM2NSQ4xUWMK
         EfKd58CoYf3D88Un1bTPvN8IJ5US5rFOe1DT6Ko+oDj9jIhoCCwtQIxAn+BxmHLhQS3h
         MMTc3fC1fW/lGjVYIbIciOgSX1kv8FRMUb8gpYAER2Z1+qBNcWvpCaMM3WCV7wVcD7tE
         oMaA==
X-Forwarded-Encrypted: i=1; AJvYcCUEc5iOt7nHl6sous5rFR2m4k8qXO8/TqNulTYRS9m9rR5VtGxMEtFSSVYCnvt7EJaI15kKoaJ53TQmPaCA@vger.kernel.org, AJvYcCW7fFgj39NgRJ1FuPTtdd5dA4AAWOxFevQf3dXnzVziYR3q38oUqgWuLNW1QlS+Senizdui6j58OWR25VDZf6iqDD0=@vger.kernel.org, AJvYcCX6FX95yldBAEkbLp9U0+xltDscI9aEViKvwY6A54AGAQ074G9kZRH00COqMkxC/WJLbL6i2+qMXSOd@vger.kernel.org, AJvYcCX8eJFg+3EZJXD/4Q++S5Wb4F/98Zozjt2V16IpU2WogNRGS/74Ys4nO53qhm5pOG7DCvCim/w803xT@vger.kernel.org
X-Gm-Message-State: AOJu0Yz/OIdxw360WSXO57gfWWCIJCeCu1mp3D+GOlmB+a6PPHv8x3BQ
	oZvQJuGFglVCfaoJ2CJZwr9lEilDhSiWgrCIFfAyyeanmDnsWZ98
X-Gm-Gg: ASbGncts5JRS8jOaXxVxRENv0YtT8QO/u+pLKh0zV5m3pEstcz+Y7oamZ6Ao4SJIpxT
	ZsCmTMmTx8eq0rCw8oxY9un10dWz43ydhg1pCP0U2CAKduxuWyWWysVXmgK2b9ZoNxGzDREb7MI
	tuTWpuB1pQdCgc225jd4UQ5PY6qlJhLMEOkP0Z08kwZaTbveYtZn5WNMRo/4KisdGQAwZjRgrxf
	WRWZlCfslhV828ytu1lc9IFqtnuUqoP1pnH6jpVwFTyfkvHxVGN8FsWRWy5t4cbmL3gyjzJufvL
	fa7UjeO+nzGzG5MeOTLnmdljUtPY639s2U8iPKJ0bzsA3ki2i9Eiera/1r2++EBcfw==
X-Google-Smtp-Source: AGHT+IFfw7ZnSqeRFrgYbx7UP4/0/xBnRaa4Kr11SsYoKPv+VoyqssOKgGovJp9wgMdTTWAUrP1fiQ==
X-Received: by 2002:a05:600c:1e15:b0:43d:82c:2b23 with SMTP id 5b1f17b1804b1-4406abfaae3mr27038495e9.23.1745002031599;
        Fri, 18 Apr 2025 11:47:11 -0700 (PDT)
Received: from iku.Home ([2a06:5906:61b:2d00:36cb:c641:13d7:bd3d])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-39efa4931b8sm3404336f8f.80.2025.04.18.11.47.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Apr 2025 11:47:11 -0700 (PDT)
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
Subject: [PATCH v3 04/15] dt-bindings: display: bridge: renesas,dsi: Add support for RZ/V2H(P) SoC
Date: Fri, 18 Apr 2025 19:46:47 +0100
Message-ID: <20250418184658.456398-5-prabhakar.mahadev-lad.rj@bp.renesas.com>
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
v2->v3:
- No changes

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


