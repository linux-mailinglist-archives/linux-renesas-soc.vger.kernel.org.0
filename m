Return-Path: <linux-renesas-soc+bounces-21408-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 52CD0B447F7
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  4 Sep 2025 23:02:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 1774AA472BA
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  4 Sep 2025 21:02:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C6CD628DB71;
	Thu,  4 Sep 2025 21:02:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="BLU6ojmz";
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="skZHeZzw"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mout-p-101.mailbox.org (mout-p-101.mailbox.org [80.241.56.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1934D28D8D9;
	Thu,  4 Sep 2025 21:02:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.241.56.151
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757019738; cv=none; b=tM33+1RZpmHe1pVrbwUabpE2uXXjCRVKSmo2v6FRs4H19UFkrTC/mOlDQ1PkxOxJljUWnfNXDfPHu3lXtIYboL6LqSnrJLoqiRN3b63tE33eqS+tkEC7u/ycrZ94LapC/pOSi5gGVlK7Df3ITDuSeTUMAddSVufn/qQVtijtCIg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757019738; c=relaxed/simple;
	bh=VLv3jn2hMJlCrMv5jp3YX4m/NNkkUw2BH3Egf5A90o4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=YO3z+hFSAQu55LmBS4SD7luAuTbDJNKE2Xz7Qeg4PsYRj6TlSALvkw7ccHAZv/EMILyJPKBOPrneS89t60pHfB2KgjWl3vvkIvRRvjwXMSQgxIrP+kCWSBIZKeLEhCmo42vN4tsUib3LPtHO/nQmlAGEBRYTnx1WATosqtmPEFQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org; spf=pass smtp.mailfrom=mailbox.org; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=BLU6ojmz; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=skZHeZzw; arc=none smtp.client-ip=80.241.56.151
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mailbox.org
Received: from smtp1.mailbox.org (smtp1.mailbox.org [10.196.197.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-101.mailbox.org (Postfix) with ESMTPS id 4cHsP323rdz9t9t;
	Thu,  4 Sep 2025 23:02:15 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1757019735;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=9eiZud4hV5GLxjoVHfr0ylMs4kj6wFYeY2X3yDCIbCI=;
	b=BLU6ojmz3UqMdlPi86xOkIem14ZaCOfYUXg9eNvbVokAx3giKG9nHFqMuLmvmw1W5WTgzj
	mVRF1jRunxKbj2kMfg/4pECBXDlOFpaEn1sg9JK51/XO9sN2bAuzmKQQQ2X6LnxWgarobE
	F1869hBDnS+pJxxA0SIshUorGd2hXS+G991rA0GHQQe6EWjodxK4++LANmuLAgcI1oKKX6
	AO8uPzBUwhHOyg8ijFd0dBHY4PRzL1QCrwZIBP+AM8HhNs5RqeRBUVLJ+vlEoueuB/ey5D
	EYgm9mBHZSo9LctDtn/ALoNHHEAijpJEKBdfXC9JDPe4WCCxlbNbwrPiMiAd/A==
From: Marek Vasut <marek.vasut+renesas@mailbox.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1757019733;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=9eiZud4hV5GLxjoVHfr0ylMs4kj6wFYeY2X3yDCIbCI=;
	b=skZHeZzw815n0z7fk7Kwa/XFOQ+SunzsB48YHXzWVpezAKAMI8CRw16QFXO0sWXUJuWqGx
	6CPtTwyjlztPLfJJNauWRtVHBQomEVc90oEK759QWvIGpNYaWOPYc7rzYse/bLQyBIbF1W
	lTEirEs5+e6IaauMrs03VFYicwrboajyGO81O96hqZC4fKsGNWD52HMIz6PeNeGQUPSiyz
	Y4igU2HR3Fo7+0aB8mZ6KoMPw0FBl57KJnal9X0xKeiE/B77Z+wBLE8wl7ODrVMbcTqYsF
	AvjHTgsj+5azpIqrb3juD37fTTccVT0nb7miN3hBLpekJDz5vwuGtjXsy5U3Mg==
To: dri-devel@lists.freedesktop.org
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
	linux-renesas-soc@vger.kernel.org
Subject: [PATCH v2 4/4] dt-bindings: display: bridge: renesas,dsi-csi2-tx: Allow panel@ subnode
Date: Thu,  4 Sep 2025 23:01:21 +0200
Message-ID: <20250904210147.186728-4-marek.vasut+renesas@mailbox.org>
In-Reply-To: <20250904210147.186728-1-marek.vasut+renesas@mailbox.org>
References: <20250904210147.186728-1-marek.vasut+renesas@mailbox.org>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-MBO-RS-ID: a441562d15219098e86
X-MBO-RS-META: mm4musqksnjdhu3q1dmh55kyqipi3ba4

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
V2: Drop the dsi0: and dsi1: controller labels
---
 .../display/bridge/renesas,dsi-csi2-tx.yaml   | 53 ++++++++++++++++++-
 1 file changed, 51 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/display/bridge/renesas,dsi-csi2-tx.yaml b/Documentation/devicetree/bindings/display/bridge/renesas,dsi-csi2-tx.yaml
index c167795c63f64..51d685ed82891 100644
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
+    dsi@fed80000 {
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
+    dsi@fed80000 {
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


