Return-Path: <linux-renesas-soc+bounces-10831-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E4F8B9E1A09
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  3 Dec 2024 11:55:54 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id AA56A2838D8
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  3 Dec 2024 10:55:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A59DC1E2855;
	Tue,  3 Dec 2024 10:55:51 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from relmlie5.idc.renesas.com (relmlor1.renesas.com [210.160.252.171])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C98EC1E284A;
	Tue,  3 Dec 2024 10:55:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=210.160.252.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733223351; cv=none; b=Iog8UDY9bCor3ePaWBoRA86bjgAKBz0G/jem4ci5SyA2XA1emlTDPpIpSbafc5i/dtz2Db/ULu4GnowLvFV1AeEmXCMUB0MG1/2XmmYcHlFoO29OzHlXtPvzJ/WzZ6JfSlLdx9ib+V7ki/NT/lakcp9qHnm8mH6stBjd6wOZpwk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733223351; c=relaxed/simple;
	bh=il5uQxRRwe3m1cW8/aVHsvKrWXrxpCQj0vVq+9VUl88=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=siRdRtgfXIzlXYmKDCYjJr5QKAMQWuvlYV3/gU/zkltX9FnbpgVzNNTE0J4ekE6GV+VUZOR1c54hvb5YYAXaSX8YFUz4jJhA/MZ4V3b/yBRg85bAQ36CVPNLcljNHzxWCW4o4aRyHgc6H7/xWx8CDToBLVSfEUGUcsnZrETt9OA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; arc=none smtp.client-ip=210.160.252.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
X-CSE-ConnectionGUID: r4vTt+CxSIOfAhlqah7OKQ==
X-CSE-MsgGUID: YrcfNOrUQZ6zR4nofdf4Ig==
X-IronPort-AV: E=Sophos;i="6.12,204,1728918000"; 
   d="scan'208";a="226779505"
Received: from unknown (HELO relmlir5.idc.renesas.com) ([10.200.68.151])
  by relmlie5.idc.renesas.com with ESMTP; 03 Dec 2024 19:50:40 +0900
Received: from localhost.localdomain (unknown [10.226.93.2])
	by relmlir5.idc.renesas.com (Postfix) with ESMTP id 9A6DA4003FA4;
	Tue,  3 Dec 2024 19:50:24 +0900 (JST)
From: Biju Das <biju.das.jz@bp.renesas.com>
To: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: Biju Das <biju.das.jz@bp.renesas.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	linux-renesas-soc@vger.kernel.org,
	linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org,
	Biju Das <biju.das.au@gmail.com>,
	Conor Dooley <conor.dooley@microchip.com>
Subject: [PATCH v2 04/13] dt-bindings: clock: renesas: Document RZ/G3E SoC CPG
Date: Tue,  3 Dec 2024 10:49:31 +0000
Message-ID: <20241203105005.103927-5-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241203105005.103927-1-biju.das.jz@bp.renesas.com>
References: <20241203105005.103927-1-biju.das.jz@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Document the device tree bindings for the Renesas RZ/G3E SoC
Clock Pulse Generator (CPG).

Also define constants for the core clocks of the RZ/G3E SoC.

Acked-by: Conor Dooley <conor.dooley@microchip.com>
Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
v1->v2:
 * Added Ack from Conor Dooley.
 * Fixed typo "CORE_CLK*"->"CORECLK*" to match with hardware manual.
---
 .../bindings/clock/renesas,rzv2h-cpg.yaml     | 15 +++++++------
 .../dt-bindings/clock/renesas,r9a09g047-cpg.h | 21 +++++++++++++++++++
 2 files changed, 30 insertions(+), 6 deletions(-)
 create mode 100644 include/dt-bindings/clock/renesas,r9a09g047-cpg.h

diff --git a/Documentation/devicetree/bindings/clock/renesas,rzv2h-cpg.yaml b/Documentation/devicetree/bindings/clock/renesas,rzv2h-cpg.yaml
index 926c503bed1f..c3fe76abd549 100644
--- a/Documentation/devicetree/bindings/clock/renesas,rzv2h-cpg.yaml
+++ b/Documentation/devicetree/bindings/clock/renesas,rzv2h-cpg.yaml
@@ -4,19 +4,22 @@
 $id: http://devicetree.org/schemas/clock/renesas,rzv2h-cpg.yaml#
 $schema: http://devicetree.org/meta-schemas/core.yaml#
 
-title: Renesas RZ/V2H(P) Clock Pulse Generator (CPG)
+title: Renesas RZ/{G3E,V2H(P)} Clock Pulse Generator (CPG)
 
 maintainers:
   - Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
 
 description:
-  On Renesas RZ/V2H(P) SoCs, the CPG (Clock Pulse Generator) handles generation
-  and control of clock signals for the IP modules, generation and control of resets,
-  and control over booting, low power consumption and power supply domains.
+  On Renesas RZ/{G3E,V2H(P)} SoCs, the CPG (Clock Pulse Generator) handles
+  generation and control of clock signals for the IP modules, generation and
+  control of resets, and control over booting, low power consumption and power
+  supply domains.
 
 properties:
   compatible:
-    const: renesas,r9a09g057-cpg
+    enum:
+      - renesas,r9a09g047-cpg # RZ/G3E
+      - renesas,r9a09g057-cpg # RZ/V2H
 
   reg:
     maxItems: 1
@@ -37,7 +40,7 @@ properties:
     description: |
       - For CPG core clocks, the two clock specifier cells must be "CPG_CORE"
         and a core clock reference, as defined in
-        <dt-bindings/clock/renesas,r9a09g057-cpg.h>,
+        <dt-bindings/clock/renesas,r9a09g0*-cpg.h>,
       - For module clocks, the two clock specifier cells must be "CPG_MOD" and
         a module number.  The module number is calculated as the CLKON register
         offset index multiplied by 16, plus the actual bit in the register
diff --git a/include/dt-bindings/clock/renesas,r9a09g047-cpg.h b/include/dt-bindings/clock/renesas,r9a09g047-cpg.h
new file mode 100644
index 000000000000..1d031bf6bf03
--- /dev/null
+++ b/include/dt-bindings/clock/renesas,r9a09g047-cpg.h
@@ -0,0 +1,21 @@
+/* SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+ *
+ * Copyright (C) 2024 Renesas Electronics Corp.
+ */
+#ifndef __DT_BINDINGS_CLOCK_RENESAS_R9A09G047_CPG_H__
+#define __DT_BINDINGS_CLOCK_RENESAS_R9A09G047_CPG_H__
+
+#include <dt-bindings/clock/renesas-cpg-mssr.h>
+
+/* Core Clock list */
+#define R9A09G047_SYS_0_PCLK			0
+#define R9A09G047_CA55_0_CORECLK0		1
+#define R9A09G047_CA55_0_CORECLK1		2
+#define R9A09G047_CA55_0_CORECLK2		3
+#define R9A09G047_CA55_0_CORECLK3		4
+#define R9A09G047_CA55_0_PERIPHCLK		5
+#define R9A09G047_CM33_CLK0			6
+#define R9A09G047_CST_0_SWCLKTCK		7
+#define R9A09G047_IOTOP_0_SHCLK			8
+
+#endif /* __DT_BINDINGS_CLOCK_RENESAS_R9A09G047_CPG_H__ */
-- 
2.43.0


