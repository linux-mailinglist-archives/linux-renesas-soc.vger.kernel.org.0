Return-Path: <linux-renesas-soc+bounces-21379-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id A64BBB446F4
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  4 Sep 2025 22:05:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 6330A5A0ADC
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  4 Sep 2025 20:05:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 50FB027A909;
	Thu,  4 Sep 2025 20:05:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="scEoM5kE";
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="mZ3kdp8r"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mout-p-101.mailbox.org (mout-p-101.mailbox.org [80.241.56.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8667E27A92B;
	Thu,  4 Sep 2025 20:05:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.241.56.151
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757016305; cv=none; b=HXn4DOAI1T4NhCdmeDeuRd8AMJ8k5b79041IfVwcZgglR1eVYhjbXyuDMTvedb2B62OaRV7UIsXVWwJN6GzbLRPLlZJDmRfiszEy0latoQkKMMgfzoo3HMBfvWzA5ox/6IlZo0Ckr0D4x1tT/rmX0QtQlDYb2kXSOskmnktJRWY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757016305; c=relaxed/simple;
	bh=y50L6FeD0Mv3lCwYG0R03wfIPdSBOuW+hlcf/PwONn8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=rIis8700bo3x+yPrh7Q5BlBUY0RQzrGnOCopLRcqWW+18AdhTStxzu0ss0WcWEiSf792O//z92rwOgVa782V2cKSYiX58Dua57ltJCZJ5XSI+e+eAfbFMjDPSxQp3+FxFjH0BBx59Q/srQ3oXpFoy1/CpN15wOJwZl+0faKlUYM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org; spf=pass smtp.mailfrom=mailbox.org; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=scEoM5kE; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=mZ3kdp8r; arc=none smtp.client-ip=80.241.56.151
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mailbox.org
Received: from smtp202.mailbox.org (smtp202.mailbox.org [IPv6:2001:67c:2050:b231:465::202])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-101.mailbox.org (Postfix) with ESMTPS id 4cHr714Cqdz9tNg;
	Thu,  4 Sep 2025 22:05:01 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1757016301;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=wxrn1xPJXjVzjC6eiOM9+qgIFPLs1DYtRf+UTTdmbuA=;
	b=scEoM5kEKoU33XYZBy4HohcKw6x2DVLWAJRGUa75UzrYSetwsUmMkcIkt3LQPrK+ZxBJlS
	iNkCu7T7SaAfvX3Lf2SvEj3BUaxMlZtJ93jqjcJbu2ylGG3Th8g/mb0GmtJhq6/H1wQnsX
	22Z9/Trkiufy29vMw4BdxEbFqfr9SbgHVF5CNxYPLuyfLvtpHzxDLiNt7eMp4sYTajNF9f
	r7AimCVNaJZr4mc2N0Udx5Ho8fr+1VKZL8+iFGWanQXM2ahvt/7KpAUgnQeb3r7qBPRB1w
	0ppMb5iJZMV2HFtSUPmK0Tk0yEZv5P+fnuBh2UCMDu0w/WtVrHzKGTtd9NW00A==
Authentication-Results: outgoing_mbo_mout;
	dkim=pass header.d=mailbox.org header.s=mail20150812 header.b=mZ3kdp8r;
	spf=pass (outgoing_mbo_mout: domain of marek.vasut+renesas@mailbox.org designates 2001:67c:2050:b231:465::202 as permitted sender) smtp.mailfrom=marek.vasut+renesas@mailbox.org
From: Marek Vasut <marek.vasut+renesas@mailbox.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1757016299;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=wxrn1xPJXjVzjC6eiOM9+qgIFPLs1DYtRf+UTTdmbuA=;
	b=mZ3kdp8rOtZe2kNIT/MoDTxLy/nhzngoVbACCe7DXBKVsrNATERldm+Mrx/rex1bXd3aIL
	799fPEcjFEkZcEzGE8W40HLs5yc0k8AVa/3ML/CJRrmx0AGvCORltqQ9IqZjjup6L5dqEM
	AZzY1M1iO56cDG9Uo7k2vj7OnWw+eIXVzVpEI/TyMp1gm2IIva9c1sD38WWmoenfdebVGy
	znq5aAfF2cIvJvFyUfEETGpthZUmjOna9UP7A66dkxC0dMjNGsPbqTGfQCqn9HvYrbkQTU
	+Z1VP1O5WXDQDuirvqxBE/RJt7Edy39QOSCgfwsY6yUeZ5D4bgcBzVpIo7JT2g==
To: linux-arm-kernel@lists.infradead.org
Cc: Marek Vasut <marek.vasut+renesas@mailbox.org>,
	Conor Dooley <conor+dt@kernel.org>,
	David Airlie <airlied@gmail.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Rob Herring <robh@kernel.org>,
	Robert Foss <rfoss@kernel.org>,
	Simona Vetter <simona@ffwll.ch>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>,
	devicetree@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	linux-renesas-soc@vger.kernel.org
Subject: [PATCH 4/4] dt-bindings: display: bridge: renesas,dsi-csi2-tx: Allow panel@ subnode
Date: Thu,  4 Sep 2025 22:03:08 +0200
Message-ID: <20250904200431.168363-4-marek.vasut+renesas@mailbox.org>
In-Reply-To: <20250904200431.168363-1-marek.vasut+renesas@mailbox.org>
References: <20250904200431.168363-1-marek.vasut+renesas@mailbox.org>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-MBO-RS-META: fenskp44gq75nsuwf4tpwxqtz5nw9hky
X-MBO-RS-ID: 9f8996e81f69a55848b
X-Rspamd-Queue-Id: 4cHr714Cqdz9tNg

This controller can have both bridges and panels connected to it. In
order to describe panels properly in DT, pull in dsi-controller.yaml
and disallow only unevaluatedProperties, because the panel node is
optional. Include example binding with panel.

Signed-off-by: Marek Vasut <marek.vasut+renesas@mailbox.org>
---
Cc: Conor Dooley <conor+dt@kernel.org>
Cc: David Airlie <airlied@gmail.com>
Cc: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>
Cc: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
Cc: Neil Armstrong <neil.armstrong@linaro.org>
Cc: Rob Herring <robh@kernel.org>
Cc: Robert Foss <rfoss@kernel.org>
Cc: Simona Vetter <simona@ffwll.ch>
Cc: Thomas Zimmermann <tzimmermann@suse.de>
Cc: Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
Cc: devicetree@vger.kernel.org
Cc: dri-devel@lists.freedesktop.org
Cc: linux-renesas-soc@vger.kernel.org
---
 .../display/bridge/renesas,dsi-csi2-tx.yaml   | 53 ++++++++++++++++++-
 1 file changed, 51 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/display/bridge/renesas,dsi-csi2-tx.yaml b/Documentation/devicetree/bindings/display/bridge/renesas,dsi-csi2-tx.yaml
index c167795c63f64..f663bc6a6f831 100644
--- a/Documentation/devicetree/bindings/display/bridge/renesas,dsi-csi2-tx.yaml
+++ b/Documentation/devicetree/bindings/display/bridge/renesas,dsi-csi2-tx.yaml
@@ -14,6 +14,9 @@ description: |
   R-Car Gen4 SoCs. The encoder can operate in either DSI or CSI-2 mode, with up
   to four data lanes.
 
+allOf:
+  - $ref: /schemas/display/dsi-controller.yaml#
+
 properties:
   compatible:
     enum:
@@ -80,14 +83,14 @@ required:
   - resets
   - ports
 
-additionalProperties: false
+unevaluatedProperties: false
 
 examples:
   - |
     #include <dt-bindings/clock/r8a779a0-cpg-mssr.h>
     #include <dt-bindings/power/r8a779a0-sysc.h>
 
-    dsi0: dsi-encoder@fed80000 {
+    dsi0: dsi@fed80000 {
         compatible = "renesas,r8a779a0-dsi-csi2-tx";
         reg = <0xfed80000 0x10000>;
         power-domains = <&sysc R8A779A0_PD_ALWAYS_ON>;
@@ -117,4 +120,50 @@ examples:
             };
         };
     };
+
+  - |
+    #include <dt-bindings/clock/r8a779g0-cpg-mssr.h>
+    #include <dt-bindings/power/r8a779g0-sysc.h>
+
+    dsi1: dsi@fed80000 {
+        #address-cells = <1>;
+        #size-cells = <0>;
+        compatible = "renesas,r8a779g0-dsi-csi2-tx";
+        reg = <0xfed80000 0x10000>;
+        clocks = <&cpg CPG_MOD 415>,
+                 <&cpg CPG_CORE R8A779G0_CLK_DSIEXT>,
+                 <&cpg CPG_CORE R8A779G0_CLK_DSIREF>;
+        clock-names = "fck", "dsi", "pll";
+        power-domains = <&sysc R8A779G0_PD_ALWAYS_ON>;
+        resets = <&cpg 415>;
+
+        ports {
+            #address-cells = <1>;
+            #size-cells = <0>;
+
+            port@0 {
+                reg = <0>;
+            };
+
+            port@1 {
+                reg = <1>;
+
+                dsi0port1_out: endpoint {
+                    remote-endpoint = <&panel_in>;
+                    data-lanes = <1 2>;
+                };
+            };
+        };
+
+        panel@0 {
+            reg = <0>;
+            compatible = "raspberrypi,dsi-7inch";
+
+            port {
+                panel_in: endpoint {
+                    remote-endpoint = <&dsi0port1_out>;
+                };
+            };
+        };
+    };
 ...
-- 
2.50.1


