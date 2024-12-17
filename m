Return-Path: <linux-renesas-soc+bounces-11430-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 8276B9F42F2
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 17 Dec 2024 06:34:16 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id A8209188CEA0
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 17 Dec 2024 05:33:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B56EF189521;
	Tue, 17 Dec 2024 05:32:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="V/v6+HEW"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EBE871607AC;
	Tue, 17 Dec 2024 05:32:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734413555; cv=none; b=DI0yGIsrRM+6M3+NjiDQE4+uzm2+skfR/T4gaRzhwa+1xvsbn7Tx+jtQJDGr6uxZSuaxhmdNU6RTVC3Q6zTZGeGOM0voxWarSFCT1Y+MUUgJ0ES4cXs0XHrjgCLqlupeHg/Cyrb1X8WkaIl8G4RRomQtL6o9uGWpKMcrnx2X574=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734413555; c=relaxed/simple;
	bh=zdX+BCuAKKQPRTtLESLknPTWT46cERQimII1RexZUwY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=T+kRvvRqYsrqJddfsfGfgfpppH2JPpgX9+MzTtY9EsG8+h8sFkuX7xuFX2jUp+EkqYThdJcTu4vb84bUWGFwRCvNkzRtZ2xoT4s6wNVjueBDD+cUZ9J5+zdT1eMizv/AQ4OSZzziPRiPzBvvDemTvEi/3E72HzWZsABxc2mYO5o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=V/v6+HEW; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from [127.0.1.1] (91-157-155-49.elisa-laajakaista.fi [91.157.155.49])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id BE718F88;
	Tue, 17 Dec 2024 06:31:51 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1734413513;
	bh=zdX+BCuAKKQPRTtLESLknPTWT46cERQimII1RexZUwY=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=V/v6+HEWhx42+XBKxnsINSRkF8Je/d0EIYpTJYOpckGaHDigjU87v3d0HT4ryJDUH
	 RF/GbGZZfGu2VmT3R3JhmwUfBmGmP3kASkdWyI6TdQdFVtYiOvkYl6A5sxmc1T8ZRx
	 livx0OlNZjtSvqLmYiq35JzeXpA7fNRMsu9yloe4=
From: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Date: Tue, 17 Dec 2024 07:31:38 +0200
Subject: [PATCH v5 4/7] dt-bindings: display: renesas,du: Add r8a779h0
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241217-rcar-gh-dsi-v5-4-e77421093c05@ideasonboard.com>
References: <20241217-rcar-gh-dsi-v5-0-e77421093c05@ideasonboard.com>
In-Reply-To: <20241217-rcar-gh-dsi-v5-0-e77421093c05@ideasonboard.com>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>, 
 Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Geert Uytterhoeven <geert+renesas@glider.be>, 
 Magnus Damm <magnus.damm@gmail.com>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, LUU HOAI <hoai.luu.ub@renesas.com>, 
 Jagan Teki <jagan@amarulasolutions.com>, Sam Ravnborg <sam@ravnborg.org>, 
 Biju Das <biju.das.jz@bp.renesas.com>
Cc: Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 dri-devel@lists.freedesktop.org, linux-renesas-soc@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>, 
 linux-clk@vger.kernel.org, 
 Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2543;
 i=tomi.valkeinen@ideasonboard.com; h=from:subject:message-id;
 bh=Ub0dswzwl1j3G+wVcHApbdhjxJxX11yllUqt+veC0nY=;
 b=owEBbQKS/ZANAwAIAfo9qoy8lh71AcsmYgBnYQzjNM/sWg/9f3GPg5FpVbwolOq3579AamQBm
 pwwIlmdoTSJAjMEAAEIAB0WIQTEOAw+ll79gQef86f6PaqMvJYe9QUCZ2EM4wAKCRD6PaqMvJYe
 9d3ID/4rWecJAZ0uXRSSEk99SCkURwu3nVhMyZQU9N4smTyDIW6wwZwbnQ3e/tIohv8mRBnAXq4
 crlSB/Zdj+OuIG95yc0ZmWWMD0HxrAKfY4C8iBvlbOdhc4K6fiTk8x5ADIiZSyxq5YK36AZz8b/
 2DX1qYmLEOfAk2npBBtE9KsG1zbELuG/AlTcCdsxAg+PSUUliteYf01d1I5aGYOdNELQXiDLjp2
 jts2KhpO1S33FQDZ30rt5DaYhWzouUYUmbxYQHFEJPCwjYbPTu1jquyRV85mOHF4c+uZkZsNF+K
 976w/JSn7kYPfWJpsWo9AF+DOyajqXWFQHyqe+TxEiOig6rEmF/90ljG5Z/kLGtBg8jhrT3c+V3
 /qVyaX9ygd0aiTqwIroOx07ajKzrt6TgLKVnRcw6k8kTvoM1ldtR0StzT2bUu7urYJ4eR605nRe
 ceCepykdUShWzo/dChNSrCYPUYS2TzfNlzMT5KHcAScT5MkjFffttXEBYdCS2KFCAKPcoAq7kCS
 Acc2xqItecErFVCclMFhEYCM6VfiWLZ/2KhXhOdEdERey3vBDI+/UgQMaC63m+32mu7q05GBwZx
 WFQlXVjuzCxyO2z45GNdULcuYxPDo6HxofYVDbhdsR0MbMs5+EENgek2Q4RljaC+W2jJJwUNA/1
 mFHxOikGhQBo0UQ==
X-Developer-Key: i=tomi.valkeinen@ideasonboard.com; a=openpgp;
 fpr=C4380C3E965EFD81079FF3A7FA3DAA8CBC961EF5

From: Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>

Extend the Renesas DU display bindings to support the r8a779h0 V4M.

Note that we remove the requirement for two ports from the global part
of the bindings, as each conditional part defines the number of required
ports already. This came up with r8a779h0 as it's the first one that has
only one port.

Signed-off-by: Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
Reviewed-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
Tested-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
 .../devicetree/bindings/display/renesas,du.yaml    | 52 ++++++++++++++++++++--
 1 file changed, 48 insertions(+), 4 deletions(-)

diff --git a/Documentation/devicetree/bindings/display/renesas,du.yaml b/Documentation/devicetree/bindings/display/renesas,du.yaml
index ef4568118e94..3880b4c2ea9a 100644
--- a/Documentation/devicetree/bindings/display/renesas,du.yaml
+++ b/Documentation/devicetree/bindings/display/renesas,du.yaml
@@ -41,6 +41,7 @@ properties:
       - renesas,du-r8a77995 # for R-Car D3 compatible DU
       - renesas,du-r8a779a0 # for R-Car V3U compatible DU
       - renesas,du-r8a779g0 # for R-Car V4H compatible DU
+      - renesas,du-r8a779h0 # for R-Car V4M compatible DU
 
   reg:
     maxItems: 1
@@ -69,10 +70,6 @@ properties:
         $ref: /schemas/graph.yaml#/properties/port
         unevaluatedProperties: false
 
-    required:
-      - port@0
-      - port@1
-
     unevaluatedProperties: false
 
   renesas,cmms:
@@ -820,6 +817,53 @@ allOf:
         - reset-names
         - renesas,vsps
 
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - renesas,du-r8a779h0
+    then:
+      properties:
+        clocks:
+          items:
+            - description: Functional clock
+
+        clock-names:
+          items:
+            - const: du.0
+
+        interrupts:
+          maxItems: 1
+
+        resets:
+          maxItems: 1
+
+        reset-names:
+          items:
+            - const: du.0
+
+        ports:
+          properties:
+            port@0:
+              description: DSI 0
+            port@1: false
+            port@2: false
+            port@3: false
+
+          required:
+            - port@0
+
+        renesas,vsps:
+          maxItems: 1
+
+      required:
+        - clock-names
+        - interrupts
+        - resets
+        - reset-names
+        - renesas,vsps
+
 additionalProperties: false
 
 examples:

-- 
2.43.0


