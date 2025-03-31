Return-Path: <linux-renesas-soc+bounces-15150-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5CADCA765D4
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 31 Mar 2025 14:28:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 4E3FC3AB753
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 31 Mar 2025 12:27:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 871401E5B65;
	Mon, 31 Mar 2025 12:27:41 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from relmlie6.idc.renesas.com (relmlor2.renesas.com [210.160.252.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4713E1E570D;
	Mon, 31 Mar 2025 12:27:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=210.160.252.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743424061; cv=none; b=MuX2NMS6M//X7EWb8ydBByss/j6S34oWWjndWpLgcaMRFEibsgkWw+pM5YwFv/sRRuGoFhR4FqYtEiTirf9rCOQg2AB5KBDFbZnqHX6EuuvvwNP+3AD/zcmo9CovPgJDTJL0eD5RTYZMa2drPCIiPGkI4U22ubU1G/6v2gcvTmk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743424061; c=relaxed/simple;
	bh=x0es9V3DsXF8DVzR4VK9Jfp+pv+W4i7lJVtf7myoIC0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ktDMm4c6J7MMH0kLkUN//6Hnq9fHp/hTbjClgRz8go0dscXUdMWRd0A665nZ31tiCgeYk5Dk60ZgqV/UhhWxV/rfKVW3rf0NLigIEUCNQL5b6WQ2TTfd1cW3uWn9Hwhce5w7AdCNxXXCB7RSRQ3PnjZ7lc2qcYT2V3vxznGZPro=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; arc=none smtp.client-ip=210.160.252.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
X-CSE-ConnectionGUID: f9Ajii2PQK+32YJfnfSZ4w==
X-CSE-MsgGUID: yhLpZMmsSvaTgGmj4/+GZw==
Received: from unknown (HELO relmlir6.idc.renesas.com) ([10.200.68.152])
  by relmlie6.idc.renesas.com with ESMTP; 31 Mar 2025 21:27:39 +0900
Received: from superbuilder.administration.lan (unknown [10.226.93.144])
	by relmlir6.idc.renesas.com (Postfix) with ESMTP id 22C3141F57FC;
	Mon, 31 Mar 2025 21:27:34 +0900 (JST)
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
Subject: [PATCH v6 03/13] dt-bindings: serial: Add compatible for Renesas RZ/T2H SoC in sci
Date: Mon, 31 Mar 2025 14:26:44 +0200
Message-ID: <20250331122657.3390355-4-thierry.bultel.yh@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250331122657.3390355-1-thierry.bultel.yh@bp.renesas.com>
References: <20250331122657.3390355-1-thierry.bultel.yh@bp.renesas.com>
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
Changes v5->v6: none
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


