Return-Path: <linux-renesas-soc+bounces-14806-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A3F4A7062E
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 25 Mar 2025 17:10:29 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 97DAF3AA0BF
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 25 Mar 2025 16:09:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E36EC2571CD;
	Tue, 25 Mar 2025 16:09:37 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from relmlie5.idc.renesas.com (relmlor1.renesas.com [210.160.252.171])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 51618256C89;
	Tue, 25 Mar 2025 16:09:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=210.160.252.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742918977; cv=none; b=uVD8Th1qUyj2Bz5VnQIuwnGOum4mS92qveSDfHQt2KCRdrbkG9VmIr3B3FKJ7TWMYSR0a1abwJHo2u6GhfF5zXPQPZcmu2UDnl451WXwM67ZwRiuRbyrZtyjMlK9AF28rVuHAvCy+CBBbEd8a+N/luBeSL5YgSeDOLIkI76MqsY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742918977; c=relaxed/simple;
	bh=fZh4mrhdYSpKzwsQDODSKm9TyL1/AcPdZpw3hxr6jWI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=MFXijOqlDDOpfBN6Z1oY3A+RC7ikzPmPZ41UHm1bmUGuL3GDQxmbmkbc1pBmfP8I0yLZG47ILpNuUjclN+79q00o2UWvXPHY+lgYGWHPGtaXFkAm4sY1075cX/pQgrNwb4c4IecNyraF0PJgNLnSwMtPOhF8Gb31YEI+hsaD+s8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; arc=none smtp.client-ip=210.160.252.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
X-CSE-ConnectionGUID: WTFFN/QkSNei29TRmGoXfw==
X-CSE-MsgGUID: KZrHbBxJRwC8qn+B9I+o7Q==
Received: from unknown (HELO relmlir6.idc.renesas.com) ([10.200.68.152])
  by relmlie5.idc.renesas.com with ESMTP; 26 Mar 2025 01:09:35 +0900
Received: from superbuilder.administration.lan (unknown [10.226.93.92])
	by relmlir6.idc.renesas.com (Postfix) with ESMTP id B0D874013742;
	Wed, 26 Mar 2025 01:09:31 +0900 (JST)
From: Thierry Bultel <thierry.bultel.yh@bp.renesas.com>
To: thierry.bultel@linatsea.fr
Cc: linux-renesas-soc@vger.kernel.org,
	geert@linux-m68k.org,
	paul.barker.ct@bp.renesas.com,
	Thierry Bultel <thierry.bultel.yh@bp.renesas.com>,
	Rob Herring <robh@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	linux-kernel@vger.kernel.org,
	linux-serial@vger.kernel.org,
	devicetree@vger.kernel.org
Subject: [PATCH v5 03/13] dt-bindings: serial: Add compatible for Renesas RZ/T2H SoC in sci
Date: Tue, 25 Mar 2025 17:08:51 +0100
Message-ID: <20250325160904.2688858-4-thierry.bultel.yh@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250325160904.2688858-1-thierry.bultel.yh@bp.renesas.com>
References: <20250325160904.2688858-1-thierry.bultel.yh@bp.renesas.com>
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

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
Signed-off-by: Thierry Bultel <thierry.bultel.yh@bp.renesas.com>
---
Changes v4->v5: none
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


