Return-Path: <linux-renesas-soc+bounces-13697-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 72950A4604E
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 26 Feb 2025 14:10:19 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 70D3F1890982
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 26 Feb 2025 13:10:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5D77C2185B8;
	Wed, 26 Feb 2025 13:10:01 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from relmlie6.idc.renesas.com (relmlor2.renesas.com [210.160.252.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A929D43166;
	Wed, 26 Feb 2025 13:09:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=210.160.252.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740575401; cv=none; b=MQhfe2bKM/qaK5Lvt5dC8IdFcASJt55Es8xsg4HWo9gURZzzmejaaQkHUhKULZoMfkAbywl/M6B3LKTJx0EQdd7gOeRtWmbdlX/U+kfhAcVHyPbfnOE4a4QQBnb6ik2EOVtRRDY1ICfg937rD0G6PgzIuJExiVJHL64bhXkWn2w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740575401; c=relaxed/simple;
	bh=o5t4cFV3wxJpaiMJDORlGOpPXAIWAbjsTHYamNCaKMA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=FWXdJruz4IK9e7qLwTnNFDINVTn+G9TAFuAC0GgXR11Vkv7pe0oEGWMFyEvEp6tfRvVyeYJpSTonumsA4ZB9IQnS0BhRm+IJOJh6HgA/e8ZyOJwJPd6UXDcFW5gL4xxPGFeGDHahNzPZ5mcMZNVNw3p8SNliTBSbAMOpmk7qdVM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; arc=none smtp.client-ip=210.160.252.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
X-CSE-ConnectionGUID: e8ftspgiRJy/k+TgACujnw==
X-CSE-MsgGUID: 1/UN7JG1SLK9VJqhFwUVbA==
Received: from unknown (HELO relmlir5.idc.renesas.com) ([10.200.68.151])
  by relmlie6.idc.renesas.com with ESMTP; 26 Feb 2025 22:09:57 +0900
Received: from superbuilder.administration.lan (unknown [10.226.92.221])
	by relmlir5.idc.renesas.com (Postfix) with ESMTP id 4DF1E406960A;
	Wed, 26 Feb 2025 22:09:53 +0900 (JST)
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
Subject: [PATCH v3 03/13] dt-bindings: serial: Add compatible for Renesas RZ/T2H SoC in sci
Date: Wed, 26 Feb 2025 14:09:22 +0100
Message-ID: <20250226130935.3029927-4-thierry.bultel.yh@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250226130935.3029927-1-thierry.bultel.yh@bp.renesas.com>
References: <20250226130935.3029927-1-thierry.bultel.yh@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Document RZ/T2H (a.k.a r9a09g077) in SCI binding.

Signed-off-by: Thierry Bultel <thierry.bultel.yh@bp.renesas.com>
Reviewed-by: Paul Barker <paul.barker.ct@bp.renesas.com>
---
 .../bindings/serial/renesas,sci.yaml          | 64 ++++++++++++-------
 1 file changed, 40 insertions(+), 24 deletions(-)

diff --git a/Documentation/devicetree/bindings/serial/renesas,sci.yaml b/Documentation/devicetree/bindings/serial/renesas,sci.yaml
index 64d3db6e54e5..2c4080283963 100644
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
@@ -63,25 +60,44 @@ required:
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
+        uart-has-rtscts: true
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


