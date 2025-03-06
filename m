Return-Path: <linux-renesas-soc+bounces-14095-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 985F4A54EF2
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  6 Mar 2025 16:26:29 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 9571E3B345A
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  6 Mar 2025 15:26:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8F27B20F071;
	Thu,  6 Mar 2025 15:26:00 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from relmlie6.idc.renesas.com (relmlor2.renesas.com [210.160.252.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 30A6D20F072;
	Thu,  6 Mar 2025 15:25:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=210.160.252.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741274760; cv=none; b=hhyZ3uecrJvd0ld0yJ2rirrshNM+NsbZBNmzFCZooqu099IuzcW48Clz0RpWCaqnSxd5vG+UzhUs3+O53pMCHNIH0oXq5ajh8OFoRrZH99ElPh3cun6QOsRX085YK6UadjOehLQePuV8tBIzOvh/GBR1/Qgju5SlWD2ju1iIj5E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741274760; c=relaxed/simple;
	bh=/W2NJFMZ1qCxc0uUJrs3zBeu+UEEJs+LzTUG2yJSMNk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=dNJwp+DUZyYItERL/4UYI6rLJwJ9L9eGq20S49zBpRxNFD9Zq7re7J9JYQLKHwqVuCWoIVMG3pJhjHOU/pm8XVQm0aCZ5X9MgLcU3SE0XQJRb6mcAeF5iqYTOYRQFn8XM6uXOse2gAFYJ3xTbHd8SMHL/KI/hGqCExWea1RSajw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; arc=none smtp.client-ip=210.160.252.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
X-CSE-ConnectionGUID: v0NnUoSQQs2KWk5JdzJKQg==
X-CSE-MsgGUID: jKxjzZSXSBCt+ARag6NhRQ==
Received: from unknown (HELO relmlir5.idc.renesas.com) ([10.200.68.151])
  by relmlie6.idc.renesas.com with ESMTP; 07 Mar 2025 00:25:57 +0900
Received: from superbuilder.administration.lan (unknown [10.226.93.123])
	by relmlir5.idc.renesas.com (Postfix) with ESMTP id E1008400091E;
	Fri,  7 Mar 2025 00:25:54 +0900 (JST)
From: Thierry Bultel <thierry.bultel.yh@bp.renesas.com>
To: thierry.bultel@linatsea.fr
Cc: linux-renesas-soc@vger.kernel.org,
	geert@linux-m68k.org,
	paul.barker.ct@bp.renesas.com,
	Thierry Bultel <thierry.bultel.yh@bp.renesas.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	linux-kernel@vger.kernel.org,
	linux-serial@vger.kernel.org,
	devicetree@vger.kernel.org
Subject: [PATCH v4 03/13] dt-bindings: serial: Add compatible for Renesas RZ/T2H SoC in sci
Date: Thu,  6 Mar 2025 16:24:37 +0100
Message-ID: <20250306152451.2356762-4-thierry.bultel.yh@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250306152451.2356762-1-thierry.bultel.yh@bp.renesas.com>
References: <20250306152451.2356762-1-thierry.bultel.yh@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The SCI of RZ/T2H SoC (a.k.a r9a09g077), as a lot
of similarities with other Renesas SoC like G2L, G3S, V2L;
However, it has a different set of registers, and in addition to serial,
this IP also supports SCIe (encoder), SmartCard, i2c and spi.
This is why the 'renesas,sci' fallback for generic SCI does not apply for it.

Signed-off-by: Thierry Bultel <thierry.bultel.yh@bp.renesas.com>
---
Changes v3->v4:
  - Added more details in commit description about why renesas,sci 
    does not apply.
  - Removed uart-has-rtscts for !rzsci.
----
 .../bindings/serial/renesas,sci.yaml          | 63 ++++++++++++-------
 1 file changed, 39 insertions(+), 24 deletions(-)

diff --git a/Documentation/devicetree/bindings/serial/renesas,sci.yaml b/Documentation/devicetree/bindings/serial/renesas,sci.yaml
index 64d3db6e54e5..13c5c47cd72f 100644
--- a/Documentation/devicetree/bindings/serial/renesas,sci.yaml
+++ b/Documentation/devicetree/bindings/serial/renesas,sci.yaml
@@ -9,9 +9,6 @@ title: Renesas Serial Communication Interface
 maintainers:
   - Geert Uytterhoeven <geert+renesas@glider.be>
 
-allOf:
-  - $ref: serial.yaml#
-
 properties:
   compatible:
     oneOf:
@@ -22,6 +19,8 @@ properties:
               - renesas,r9a07g054-sci     # RZ/V2L
           - const: renesas,sci            # generic SCI compatible UART
 
+      - const: renesas,r9a09g077-sci      # RZ/T2H
+
       - items:
           - const: renesas,sci            # generic SCI compatible UART
 
@@ -54,8 +53,6 @@ properties:
         - fck # UART functional clock
         - sck # optional external clock input
 
-  uart-has-rtscts: false
-
 required:
   - compatible
   - reg
@@ -63,25 +60,43 @@ required:
   - clocks
   - clock-names
 
-if:
-  properties:
-    compatible:
-      contains:
-        enum:
-          - renesas,r9a07g043-sci
-          - renesas,r9a07g044-sci
-          - renesas,r9a07g054-sci
-then:
-  properties:
-    resets:
-      maxItems: 1
-
-    power-domains:
-      maxItems: 1
-
-  required:
-    - resets
-    - power-domains
+allOf:
+  - $ref: serial.yaml#
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: renesas,r9a09g077-sci
+    then:
+      properties:
+        power-domains:
+          maxItems: 1
+      required:
+        - power-domains
+
+    else:
+      properties:
+        uart-has-rtscts: false
+
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - renesas,r9a07g043-sci
+              - renesas,r9a07g044-sci
+              - renesas,r9a07g054-sci
+    then:
+      properties:
+        resets:
+          maxItems: 1
+
+        power-domains:
+          maxItems: 1
+
+      required:
+        - resets
+        - power-domains
 
 unevaluatedProperties: false
 
-- 
2.43.0


