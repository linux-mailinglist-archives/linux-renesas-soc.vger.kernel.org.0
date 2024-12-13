Return-Path: <linux-renesas-soc+bounces-11292-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id C390B9F0E62
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 13 Dec 2024 15:04:37 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 406B2188D33A
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 13 Dec 2024 14:04:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 560751E25F9;
	Fri, 13 Dec 2024 14:03:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="OK/K0M/g"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C7D41E230D;
	Fri, 13 Dec 2024 14:03:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734098608; cv=none; b=suz3ZfOv9U6wppjqCZnkJia2sGWjqGdR/iGRUUkwU6l0SDYNvaYbhtJsiiu09gqVUqEUcA6BPxr1h1FjiXPyQODXPnsJoV1XShQgTrbJUqtoiHNswSElZO/f7WkCh+EJ6B4ezTt+t6pFFDZNk9eFXTup91YJ+SFFaNRNPK0fUzc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734098608; c=relaxed/simple;
	bh=s8GnwIastABqRYEgykdh0qV/3mI75TJf2ezU8ZRKyls=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=CeolwTrlajEzaUOEHRrA3+MRFayu/ASyQjmPsHRS8G4oCT+QO0gejhNwDcOh4Ll4BrsQ1exG8VUKslN5T5RHcPYJm+MQfqM+LWa0OF6XueTxRTG2BOuj2tOZY3p7O5sYd5i1+EwnvY45hij7J6B0qb//wWaMc/Z4FWc9AEHJgXs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=OK/K0M/g; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from [127.0.1.1] (91-157-155-49.elisa-laajakaista.fi [91.157.155.49])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 23C8DF89;
	Fri, 13 Dec 2024 15:02:47 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1734098568;
	bh=s8GnwIastABqRYEgykdh0qV/3mI75TJf2ezU8ZRKyls=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=OK/K0M/gdrW8l2SKVhlE4xSB7HFjh3NAUDxd7Su+XtFDnpWo1NXFUctBuR1Mwp55Y
	 UQGu/nqBUV+mKjLq1w7PVftoHrJGxu3tDzA+b3W8WYKz9/6db4ST9LNzBjXazOn0oW
	 dPAu0wUOm1+jvUJQPT4zMw46uk3zelobtWFVEVCo=
From: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Date: Fri, 13 Dec 2024 16:03:00 +0200
Subject: [PATCH v4 4/7] dt-bindings: display: renesas,du: Add r8a779h0
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241213-rcar-gh-dsi-v4-4-f8e41425207b@ideasonboard.com>
References: <20241213-rcar-gh-dsi-v4-0-f8e41425207b@ideasonboard.com>
In-Reply-To: <20241213-rcar-gh-dsi-v4-0-f8e41425207b@ideasonboard.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2567;
 i=tomi.valkeinen@ideasonboard.com; h=from:subject:message-id;
 bh=DlMcRdYcnOPSOXZIM2VtaP0Ahd5x/Ya+ls1XSUX4y2M=;
 b=owEBbQKS/ZANAwAIAfo9qoy8lh71AcsmYgBnXD6glDgmqkhLH0IZeJC6ZrUOcPFWbnQ8ITbod
 zDTExHobMOJAjMEAAEIAB0WIQTEOAw+ll79gQef86f6PaqMvJYe9QUCZ1w+oAAKCRD6PaqMvJYe
 9eQgD/0TndBrULvtWLewQlxlpLdHIAMKwdolvYhHdA0mb7+bQqGmB61hZi7nPPFJyH3z1IeqM9d
 jq1+D6h6xPtY8O5wa7ESWEelrLMnukisV7zv8+zGAeb3N7VOdS7qNdxhcYsMjMHfH7r3Xxkj+xX
 Ge1ttqhiNuVbhvi/Lm3A8QW2wD3NVWNTeL2GgawKFVrmK19QRQ6taIuY2oQ7vy8oV7AsW+FpWTB
 Zx5KPfhtGlqIrLU1r19bZuOt33em/6Qn9c+EsGIBTpORaaOxRqxqdEIUJKSt1xGR403MZIzGXz3
 y35KGsiDWsdlXAtCzs9UqPv4Cesv4zJZQbKlG4eHfPIfE8EDrV0VXdt0N9nBiS99nwat5YbyAiW
 8WR2ocArMjBg8vTB0eJHYlyVr5uGmVm4ddnpYXmLjzb8IvjFhNBW9EGO37DyThwztgE4EiX9fC4
 TV/KJjGmWJZD9SXFqDdTKyxUV4uR5AhzBRQ/OnxBAkCEF5U5ky6mzEFDGuBhXWV8evWYj7gOdMq
 u43jWUskHcRYe5efqRzYtE5ZM1RCtT1bu0puJSyKmECmR/BWLeA/gSqnUAh+3lg3Errqo4fsy8o
 Zlfk0EiAN/EHQkiIyMLDZol01nqr/MUxo9VAo8nPH5g12EaaoQOtGAiaz1/JEzGEF6QQQeQDlmn
 /3NM6jTJpsvAChQ==
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
 .../devicetree/bindings/display/renesas,du.yaml    | 53 ++++++++++++++++++++--
 1 file changed, 49 insertions(+), 4 deletions(-)

diff --git a/Documentation/devicetree/bindings/display/renesas,du.yaml b/Documentation/devicetree/bindings/display/renesas,du.yaml
index e5fbc4ffe29c..1b4cd8fac825 100644
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
@@ -817,6 +814,54 @@ allOf:
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
+          minItems: 1
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


