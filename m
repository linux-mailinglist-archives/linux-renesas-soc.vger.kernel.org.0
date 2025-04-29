Return-Path: <linux-renesas-soc+bounces-16444-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 93CA0AA0570
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 29 Apr 2025 10:20:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 209817A9D91
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 29 Apr 2025 08:19:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7CCB2294A1A;
	Tue, 29 Apr 2025 08:20:20 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from relmlie5.idc.renesas.com (relmlor1.renesas.com [210.160.252.171])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 04B1F274FF3;
	Tue, 29 Apr 2025 08:20:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=210.160.252.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745914820; cv=none; b=clo9IEieM9kEGYuA0qr+uVmPWhQOQ5h2/L9to3Nnc2cYEZCR6R67VtEK49Fs55X0poCuy45h6GjodMqSw/e0uip8dQB1EhA8kPNfwZtxpWsud4DEPBEMwAvxBPMp08vjqlpXk7wEQyVFTxVxIg/M6GZjaQn4GPNJdaadTMP1oJQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745914820; c=relaxed/simple;
	bh=Gky1g6B8luLp9Pwpqnz6N+LMa4mTmUa530/QZlxlZv4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ZEMEedVgSc+KsaARgYLfFtHyUuq6D7ioveKAT1ZHQ5XgECK2ipOyHbz1p/i8FngCKJWZageCxbCYalfSBfUa4mI9U/f+hsK+5kxI9Iw2B8mJYIU9htnknLazKPlb7NOnivf23h1Kaym8/re7NDP1HHygkWsbc38QGBvzonzu35M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; arc=none smtp.client-ip=210.160.252.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
X-CSE-ConnectionGUID: MA9/Ey1sROeVyKNWjYQGWQ==
X-CSE-MsgGUID: w8tkJYR3T+OHKI0I6HsGYA==
Received: from unknown (HELO relmlir5.idc.renesas.com) ([10.200.68.151])
  by relmlie5.idc.renesas.com with ESMTP; 29 Apr 2025 17:20:14 +0900
Received: from superbuilder.administration.lan (unknown [10.226.93.118])
	by relmlir5.idc.renesas.com (Postfix) with ESMTP id 6777D4005651;
	Tue, 29 Apr 2025 17:20:11 +0900 (JST)
From: Thierry Bultel <thierry.bultel.yh@bp.renesas.com>
To: thierry.bultel@linatsea.fr
Cc: linux-renesas-soc@vger.kernel.org,
	geert@linux-m68k.org,
	paul.barker.ct@bp.renesas.com,
	Thierry Bultel <thierry.bultel.yh@bp.renesas.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v8 03/11] dt-bindings: clock: Add cpg for the Renesas RZ/T2H SoC
Date: Tue, 29 Apr 2025 10:19:45 +0200
Message-ID: <20250429081956.3804621-4-thierry.bultel.yh@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250429081956.3804621-1-thierry.bultel.yh@bp.renesas.com>
References: <20250429081956.3804621-1-thierry.bultel.yh@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Document RZ/T2H (a.k.a r9a09g077) cpg-mssr (Clock Pulse Generator) binding.

Signed-off-by: Thierry Bultel <thierry.bultel.yh@bp.renesas.com>
---
Changes v7->v8:
  - extra parenthesis
  - added loco
  - renesas-cpg-mssr.h: removed unused clocks, added a macro for mstp
Changes v6->v7:
  - Add description for reg property
Changes v5->v6:
  - Set clock minItem constraint
  - Moved additionalProperties after 'allOf' section
Changes v4->v5:
  - Set reg minItems and maxItems defaults at top level
Changes v3->v4:
  - Handle maxItems and clocks names properly in schema. 
---
 .../bindings/clock/renesas,cpg-mssr.yaml      | 58 ++++++++++++++-----
 .../clock/renesas,r9a09g077-cpg-mssr.h        | 48 +++++++++++++++
 2 files changed, 90 insertions(+), 16 deletions(-)
 create mode 100644 include/dt-bindings/clock/renesas,r9a09g077-cpg-mssr.h

diff --git a/Documentation/devicetree/bindings/clock/renesas,cpg-mssr.yaml b/Documentation/devicetree/bindings/clock/renesas,cpg-mssr.yaml
index 77ce3615c65a..464827f2067e 100644
--- a/Documentation/devicetree/bindings/clock/renesas,cpg-mssr.yaml
+++ b/Documentation/devicetree/bindings/clock/renesas,cpg-mssr.yaml
@@ -52,9 +52,15 @@ properties:
       - renesas,r8a779f0-cpg-mssr # R-Car S4-8
       - renesas,r8a779g0-cpg-mssr # R-Car V4H
       - renesas,r8a779h0-cpg-mssr # R-Car V4M
+      - renesas,r9a09g077-cpg-mssr # RZ/T2H
 
   reg:
-    maxItems: 1
+    minItems: 1
+    items:
+      - description: base address of register block 0
+      - description: base address of register block 1
+    description: base addresses of clock controller. Some controllers
+      (like r9a09g077) use two blocks instead of a single one.
 
   clocks:
     minItems: 1
@@ -63,11 +69,6 @@ properties:
   clock-names:
     minItems: 1
     maxItems: 2
-    items:
-      enum:
-        - extal     # All
-        - extalr    # Most R-Car Gen3 and RZ/G2
-        - usb_extal # Most R-Car Gen2 and RZ/G1
 
   '#clock-cells':
     description: |
@@ -92,16 +93,6 @@ properties:
       the datasheet.
     const: 1
 
-if:
-  not:
-    properties:
-      compatible:
-        items:
-          enum:
-            - renesas,r7s9210-cpg-mssr
-then:
-  required:
-    - '#reset-cells'
 
 required:
   - compatible
@@ -111,6 +102,41 @@ required:
   - '#clock-cells'
   - '#power-domain-cells'
 
+allOf:
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: renesas,r9a09g077-cpg-mssr
+    then:
+      properties:
+        reg:
+          minItems: 2
+        clock-names:
+          items:
+            - const: extal
+    else:
+      properties:
+        reg:
+          maxItems: 1
+        clock-names:
+          items:
+            enum:
+              - extal     # All
+              - extalr    # Most R-Car Gen3 and RZ/G2
+              - usb_extal # Most R-Car Gen2 and RZ/G1
+
+  - if:
+      not:
+        properties:
+          compatible:
+            items:
+              enum:
+                - renesas,r7s9210-cpg-mssr
+    then:
+      required:
+        - '#reset-cells'
+
 additionalProperties: false
 
 examples:
diff --git a/include/dt-bindings/clock/renesas,r9a09g077-cpg-mssr.h b/include/dt-bindings/clock/renesas,r9a09g077-cpg-mssr.h
new file mode 100644
index 000000000000..d5b16d08e75d
--- /dev/null
+++ b/include/dt-bindings/clock/renesas,r9a09g077-cpg-mssr.h
@@ -0,0 +1,48 @@
+/* SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+ *
+ * Copyright (C) 2025 Renesas Electronics Corp.
+ */
+
+#ifndef __DT_BINDINGS_CLOCK_RENESAS_R9A09G077_CPG_H__
+#define __DT_BINDINGS_CLOCK_RENESAS_R9A09G077_CPG_H__
+
+#include <dt-bindings/clock/renesas-cpg-mssr.h>
+
+/* R9A09G077 CPG Core Clocks */
+#define R9A09G077_CLK_CA55C0		0
+#define R9A09G077_CLK_CA55C1		1
+#define R9A09G077_CLK_CA55C2		2
+#define R9A09G077_CLK_CA55C3		3
+#define R9A09G077_CLK_CA55S		4
+#define R9A09G077_CLK_CR52_CPU0		5
+#define R9A09G077_CLK_CR52_CPU1		6
+#define R9A09G077_CLK_BSC		7
+#define R9A09G077_CLK_CKIO		R9A09G077_CLK_BSC
+#define R9A09G077_CLK_PCLKAH		8
+#define R9A09G077_CLK_PCLKAM		9
+#define R9A09G077_CLK_PCLKAL		10
+#define R9A09G077_CLK_PCLKGPTL		11
+#define R9A09G077_CLK_PCLKH		12
+#define R9A09G077_CLK_PCLKM		13
+
+
+#define R9A09G077_MSTPCRA	0
+#define R9A09G077_MSTPCRB	1
+#define R9A09G077_MSTPCRC	2
+#define R9A09G077_MSTPCRD	3
+#define R9A09G077_MSTPCRE	4
+#define R9A09G077_MSTPCRG	7
+#define R9A09G077_MSTPCRI	8
+#define R9A09G077_MSTPCRJ	9
+#define R9A09G077_MSTPCRK	10
+#define R9A09G077_MSTPCRL	11
+#define R9A09G077_MSTPCRM	12
+#define R9A09G077_MSTPCRN	13
+
+#define R9A09G077_MSTP(mstp, idx) (100*(mstp)+(idx))
+
+/* R9A09G077 CPG Module Clocks */
+#define R9A09G077_PCLK_SCI0	R9A09G077_MSTP(R9A09G077_MSTPCRA, 8)
+
+#endif /* __DT_BINDINGS_CLOCK_RENESAS_R9A09G077_CPG_H__ */
+
-- 
2.43.0


