Return-Path: <linux-renesas-soc+bounces-17444-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 41FC7AC24E7
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 23 May 2025 16:24:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 5BBA7A428D5
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 23 May 2025 14:24:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 02AEE296141;
	Fri, 23 May 2025 14:24:39 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from relmlie6.idc.renesas.com (relmlor2.renesas.com [210.160.252.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2D76D2951D2;
	Fri, 23 May 2025 14:24:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=210.160.252.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748010278; cv=none; b=p1oQh4Qk+SldxqlIZXhRXRMrnAeUI+WCbuhqLqay4zqJ1qQ/XIELdY4Lj63fxdSRRVbn7PQhFfoDgzaxVuJYqGKPCAjk8D5HN+dX4F/St4+o/oj83abR/nqh0sI6Yj8DNfvOB15C1ntMpAIqkRsKr6WNyNbVfp5P0Sc8ymZRYTw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748010278; c=relaxed/simple;
	bh=VOFi7LJzolyACMQJ67UnIpF7Ko1ZJPwhGF/DBt+S5jc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=kHfPvtIoOTTYKAYsK8Y4wVfjNRN899+sZOWBdSC5L3mImKZXtrZ3C5IdAJjGJRWsUQy2WzBYYrpVNpxlEDe3R+rCM9Vs4DKZZY0lOwyLxefdU9FEZbbGxYeVvl3XiX/+cnpjPiGztdhf9cHYFh9w4gbrM2mBceKx2oZXxUvJOKw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; arc=none smtp.client-ip=210.160.252.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
X-CSE-ConnectionGUID: /hxN5aaDTIK0aYecVrWBSA==
X-CSE-MsgGUID: lymfqjB1TKyQQeLkvu0B+Q==
Received: from unknown (HELO relmlir5.idc.renesas.com) ([10.200.68.151])
  by relmlie6.idc.renesas.com with ESMTP; 23 May 2025 23:24:31 +0900
Received: from superbuilder.administration.lan (unknown [10.226.92.97])
	by relmlir5.idc.renesas.com (Postfix) with ESMTP id 3F0004010DE6;
	Fri, 23 May 2025 23:24:27 +0900 (JST)
From: Thierry Bultel <thierry.bultel.yh@bp.renesas.com>
To: thierry.bultel@linatsea.fr
Cc: linux-renesas-soc@vger.kernel.org,
	geert@linux-m68k.org,
	paul.barker.ct@bp.renesas.com,
	Thierry Bultel <thierry.bultel.yh@bp.renesas.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Rob Herring <robh@kernel.org>,
	linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v10 02/10] dt-bindings: clock: Add cpg for the Renesas RZ/T2H SoC
Date: Fri, 23 May 2025 16:24:06 +0200
Message-ID: <20250523142417.2840797-3-thierry.bultel.yh@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250523142417.2840797-1-thierry.bultel.yh@bp.renesas.com>
References: <20250523142417.2840797-1-thierry.bultel.yh@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Document RZ/T2H (a.k.a r9a09g077) cpg-mssr (Clock Pulse Generator) binding.

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
Signed-off-by: Thierry Bultel <thierry.bultel.yh@bp.renesas.com>
---
Changes v9->v10:
  - Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
Changes v8->v9:
  - keep clock names in generic section because T2H is a subset
  - removed R9A09G077_CLK_BSC, to only keep R9A09G077_CLK_CKIO
  - removed R9A09G077_MSTP* macros and module clocks definitions
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
 .../bindings/clock/renesas,cpg-mssr.yaml      | 46 ++++++++++++++-----
 .../clock/renesas,r9a09g077-cpg-mssr.h        | 27 +++++++++++
 2 files changed, 62 insertions(+), 11 deletions(-)
 create mode 100644 include/dt-bindings/clock/renesas,r9a09g077-cpg-mssr.h

diff --git a/Documentation/devicetree/bindings/clock/renesas,cpg-mssr.yaml b/Documentation/devicetree/bindings/clock/renesas,cpg-mssr.yaml
index 77ce3615c65a..708ab6bd7d44 100644
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
@@ -92,16 +98,6 @@ properties:
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
@@ -111,6 +107,34 @@ required:
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
index 000000000000..1b22fe88dec7
--- /dev/null
+++ b/include/dt-bindings/clock/renesas,r9a09g077-cpg-mssr.h
@@ -0,0 +1,27 @@
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
+#define R9A09G077_CLK_CKIO		7
+#define R9A09G077_CLK_PCLKAH		8
+#define R9A09G077_CLK_PCLKAM		9
+#define R9A09G077_CLK_PCLKAL		10
+#define R9A09G077_CLK_PCLKGPTL		11
+#define R9A09G077_CLK_PCLKH		12
+#define R9A09G077_CLK_PCLKM		13
+
+#endif /* __DT_BINDINGS_CLOCK_RENESAS_R9A09G077_CPG_H__ */
-- 
2.43.0


