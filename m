Return-Path: <linux-renesas-soc+bounces-22670-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 98FCCBB9873
	for <lists+linux-renesas-soc@lfdr.de>; Sun, 05 Oct 2025 16:44:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 03D264E3713
	for <lists+linux-renesas-soc@lfdr.de>; Sun,  5 Oct 2025 14:44:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 88F9528C03E;
	Sun,  5 Oct 2025 14:44:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="eXgBsdDN"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 61E9E28BAAC
	for <linux-renesas-soc@vger.kernel.org>; Sun,  5 Oct 2025 14:44:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759675491; cv=none; b=nXHMZjTLH74k3sNuiskWaE00SesvHrYUxjLAsBinygUD6u+BVasBy8QspK+VKpQwBP8vbU99qztmMrSrAkSqVJcvrpwb5WXFrM+zLCf40usp9Ltb9DCpysgy30ou12Zg+Tipdn+DglVzNcQmybC1xWAErh+pFbKzMsU2kBj495k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759675491; c=relaxed/simple;
	bh=I1oihWgdyskJ1LxebydeKfD1GQmWuZUhSkwFVCe5nTg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=UYnU2aL/cnf8AT6KS8LIJ+JW7GDPQyAOxGjES2NbO1uPhLVA8+tYdiVh0r0qn+tUSatVQpPGRtf3r5H5p6OFn+q/mjDzyBpl6Y8ZdB4v8hjDFB0x6XMCkua1e6JSxM5w22ymjYQ1gEbYRNQ/Zegvh1akxrOFxrzN1q9teZhBDGU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=eXgBsdDN; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=from:to:cc:subject:date:message-id
	:in-reply-to:references:mime-version:content-transfer-encoding;
	 s=k1; bh=iigAy0vTHyQlApehQeXofVPn9GT7gpNDC4C4YPxl1y4=; b=eXgBsd
	DNYK9f46E9t07ypqjtUNPtH60MpK56HOpv0DCxwaWD5ZdFpevAOtQ3lv+vQfUEFk
	Bsow/lLkKlidZ07C0vAl94Wi826P1kwpkYVy6K6+hRvBdbl2tXeOFh57sM+Yqvqe
	9J6TYAP8F48hgx3MVdmapRS6qq0IY+oZ+IoC720b/X5f2ZdSUNw3kfcAdQEuHojJ
	MYLqwCDc9s8zXKcq0/ugR2zJ9gomGqSrs2jEREOz8/XR0Itgky/cfxvezVwNes2s
	ok+9WMe0aEOJn3AMI1hU2wAo5Qv0RKNbRcs8YwT7p5MKg8wl5N3CT+E3LUPzHgBk
	GD9GcGyIPQhONIkw==
Received: (qmail 1418968 invoked from network); 5 Oct 2025 16:44:43 +0200
Received: by mail.zeus03.de with UTF8SMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 5 Oct 2025 16:44:43 +0200
X-UD-Smtp-Session: l3s3148p1@qL4cYGpA+tMujnsm
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: linux-renesas-soc@vger.kernel.org
Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Guenter Roeck <linux@roeck-us.net>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Wim Van Sebroeck <wim@linux-watchdog.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	linux-watchdog@vger.kernel.org,
	devicetree@vger.kernel.org
Subject: [PATCH v2 3/4] dt-bindings: watchdog: factor out RZ/G2L watchdog
Date: Sun,  5 Oct 2025 16:44:18 +0200
Message-ID: <20251005144416.3699-9-wsa+renesas@sang-engineering.com>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20251005144416.3699-6-wsa+renesas@sang-engineering.com>
References: <20251005144416.3699-6-wsa+renesas@sang-engineering.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Renesas created different watchdog IPs but they are all handled in the
same binding documentation. This leads to a lot of conditional handling
which makes it unnecessarily hard to add new items. Factor out the
RZ/G2L watchdog to make handling easier.

Reviewed-by: Guenter Roeck <linux@roeck-us.net>
Reviewed-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
---

Changes since v1:
* dropped 'interrupt-names' for RZ/V2M (Thanks, Prabhakar)
* removed unneeded label from example (Thanks, Prabhakar)
* added tags from Guenter and Prabhakar (Thanks!)

 .../bindings/watchdog/renesas,rzg2l-wdt.yaml  | 112 ++++++++++++++++++
 .../bindings/watchdog/renesas,wdt.yaml        |  45 +------
 2 files changed, 113 insertions(+), 44 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/watchdog/renesas,rzg2l-wdt.yaml

diff --git a/Documentation/devicetree/bindings/watchdog/renesas,rzg2l-wdt.yaml b/Documentation/devicetree/bindings/watchdog/renesas,rzg2l-wdt.yaml
new file mode 100644
index 000000000000..7543e6528f48
--- /dev/null
+++ b/Documentation/devicetree/bindings/watchdog/renesas,rzg2l-wdt.yaml
@@ -0,0 +1,112 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/watchdog/renesas,rzg2l-wdt.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Renesas RZ/G2L Watchdog Timer (WDT) Controller
+
+maintainers:
+  - Biju Das <biju.das.jz@bp.renesas.com>
+
+properties:
+  compatible:
+    oneOf:
+      - items:
+          - enum:
+              - renesas,r9a07g043-wdt    # RZ/G2UL and RZ/Five
+              - renesas,r9a07g044-wdt    # RZ/G2{L,LC}
+              - renesas,r9a07g054-wdt    # RZ/V2L
+              - renesas,r9a08g045-wdt    # RZ/G3S
+          - const: renesas,rzg2l-wdt
+
+      - items:
+          - enum:
+              - renesas,r9a09g011-wdt    # RZ/V2M
+          - const: renesas,rzv2m-wdt     # RZ/V2M
+
+  reg:
+    maxItems: 1
+
+  interrupts:
+    minItems: 1
+    items:
+      - description: Timeout
+      - description: Parity error
+
+  interrupt-names:
+    minItems: 1
+    items:
+      - const: wdt
+      - const: perrout
+
+  clocks:
+    items:
+      - description: Register access clock
+      - description: Main clock
+
+  clock-names:
+    items:
+      - const: pclk
+      - const: oscclk
+
+  power-domains:
+    maxItems: 1
+
+  resets:
+    maxItems: 1
+
+  timeout-sec: true
+
+required:
+  - compatible
+  - reg
+  - interrupts
+  - clocks
+  - clock-names
+  - power-domains
+  - resets
+
+allOf:
+  - $ref: watchdog.yaml#
+
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - renesas,rzg2l-wdt
+    then:
+      properties:
+        interrupts:
+          minItems: 2
+        interrupt-names:
+          minItems: 2
+      required:
+        - interrupt-names
+    else:
+      properties:
+        interrupts:
+          maxItems: 1
+        interrupt-names: false
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/clock/r9a07g044-cpg.h>
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+
+    watchdog@12800800 {
+            compatible = "renesas,r9a07g044-wdt",
+                         "renesas,rzg2l-wdt";
+            reg = <0x12800800 0x400>;
+            clocks = <&cpg CPG_MOD R9A07G044_WDT0_PCLK>,
+                     <&cpg CPG_MOD R9A07G044_WDT0_CLK>;
+            clock-names = "pclk", "oscclk";
+            interrupts = <GIC_SPI 49 IRQ_TYPE_LEVEL_HIGH>,
+                         <GIC_SPI 50 IRQ_TYPE_LEVEL_HIGH>;
+            interrupt-names = "wdt", "perrout";
+            resets = <&cpg R9A07G044_WDT0_PRESETN>;
+            power-domains = <&cpg>;
+    };
diff --git a/Documentation/devicetree/bindings/watchdog/renesas,wdt.yaml b/Documentation/devicetree/bindings/watchdog/renesas,wdt.yaml
index 12ba07781763..2a15c012fd67 100644
--- a/Documentation/devicetree/bindings/watchdog/renesas,wdt.yaml
+++ b/Documentation/devicetree/bindings/watchdog/renesas,wdt.yaml
@@ -13,19 +13,6 @@ maintainers:
 properties:
   compatible:
     oneOf:
-      - items:
-          - enum:
-              - renesas,r9a07g043-wdt    # RZ/G2UL and RZ/Five
-              - renesas,r9a07g044-wdt    # RZ/G2{L,LC}
-              - renesas,r9a07g054-wdt    # RZ/V2L
-              - renesas,r9a08g045-wdt    # RZ/G3S
-          - const: renesas,rzg2l-wdt
-
-      - items:
-          - enum:
-              - renesas,r9a09g011-wdt    # RZ/V2M
-          - const: renesas,rzv2m-wdt     # RZ/V2M
-
       - items:
           - enum:
               - renesas,r8a7742-wdt      # RZ/G1H
@@ -83,16 +70,7 @@ properties:
     maxItems: 2
 
   interrupts:
-    minItems: 1
-    items:
-      - description: Timeout
-      - description: Parity error
-
-  interrupt-names:
-    minItems: 1
-    items:
-      - const: wdt
-      - const: perrout
+    maxItems: 1
 
   clocks:
     minItems: 1
@@ -140,8 +118,6 @@ allOf:
           contains:
             enum:
               - renesas,r9a09g057-wdt
-              - renesas,rzg2l-wdt
-              - renesas,rzv2m-wdt
     then:
       properties:
         clocks:
@@ -155,25 +131,6 @@ allOf:
         clocks:
           maxItems: 1
 
-  - if:
-      properties:
-        compatible:
-          contains:
-            enum:
-              - renesas,rzg2l-wdt
-    then:
-      properties:
-        interrupts:
-          minItems: 2
-        interrupt-names:
-          minItems: 2
-      required:
-        - interrupt-names
-    else:
-      properties:
-        interrupts:
-          maxItems: 1
-
   - if:
       properties:
         compatible:
-- 
2.47.2


