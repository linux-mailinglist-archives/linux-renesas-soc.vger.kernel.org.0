Return-Path: <linux-renesas-soc+bounces-13696-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id B44D5A4604B
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 26 Feb 2025 14:10:09 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A34103AA19D
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 26 Feb 2025 13:09:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7E5B521B9D2;
	Wed, 26 Feb 2025 13:09:56 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from relmlie5.idc.renesas.com (relmlor1.renesas.com [210.160.252.171])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9385F43166;
	Wed, 26 Feb 2025 13:09:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=210.160.252.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740575396; cv=none; b=P6YWd2P9zrAK2AfqDZ6oWBQIQn4NOuX7cHaPj85K24Sdg4hKzzAO450U3SRirjpqUt+Z5IuMElLC/sNXG+1Vj2BCMHe06QP58YHrY34/u1QaHihE0QaLXXa9WlbszJObWdD5eDCN0DTAoHIvYlGO+6cR1FB+FPwK/gOskk1XbCk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740575396; c=relaxed/simple;
	bh=loUVTvd7vrxnrTURMUb6i0dUPuiJe8Lcma15qRx6cJA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=U9HRmq6prkYQioeLX7bBP3P70JWkHpCG4WjgW9ITTHhcOxbXRTzLZUJeSYF+xUit5igwj/yYW+mLd/FMe9ggaJzBeOwM8CBumxEErKbJ4quWpAbA73KDugpiIK44N9JxMvQnGVNn0f+GG+/gWmzvtfjGWwO4wrS3NOUO9ZiVLto=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; arc=none smtp.client-ip=210.160.252.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
X-CSE-ConnectionGUID: Nox/j8AdRg6mHW4Ouspkjw==
X-CSE-MsgGUID: gmX9pcvNRyamDX3nIc83kQ==
Received: from unknown (HELO relmlir5.idc.renesas.com) ([10.200.68.151])
  by relmlie5.idc.renesas.com with ESMTP; 26 Feb 2025 22:09:52 +0900
Received: from superbuilder.administration.lan (unknown [10.226.92.221])
	by relmlir5.idc.renesas.com (Postfix) with ESMTP id 7A9E94069606;
	Wed, 26 Feb 2025 22:09:48 +0900 (JST)
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
Subject: [PATCH v3 02/13] dt-bindings: clock: Add cpg for the Renesas RZ/T2H SoC
Date: Wed, 26 Feb 2025 14:09:21 +0100
Message-ID: <20250226130935.3029927-3-thierry.bultel.yh@bp.renesas.com>
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

Document RZ/T2H (a.k.a r9a09g077) cpg-mssr (Clock Pulse Generator) binding.

Signed-off-by: Thierry Bultel <thierry.bultel.yh@bp.renesas.com>
Reviewed-by: Paul Barker <paul.barker.ct@bp.renesas.com>
---
 .../bindings/clock/renesas,cpg-mssr.yaml      |  4 +-
 .../clock/renesas,r9a09g077-cpg-mssr.h        | 49 +++++++++++++++++++
 2 files changed, 52 insertions(+), 1 deletion(-)
 create mode 100644 include/dt-bindings/clock/renesas,r9a09g077-cpg-mssr.h

diff --git a/Documentation/devicetree/bindings/clock/renesas,cpg-mssr.yaml b/Documentation/devicetree/bindings/clock/renesas,cpg-mssr.yaml
index 77ce3615c65a..be9a0576e1db 100644
--- a/Documentation/devicetree/bindings/clock/renesas,cpg-mssr.yaml
+++ b/Documentation/devicetree/bindings/clock/renesas,cpg-mssr.yaml
@@ -52,9 +52,10 @@ properties:
       - renesas,r8a779f0-cpg-mssr # R-Car S4-8
       - renesas,r8a779g0-cpg-mssr # R-Car V4H
       - renesas,r8a779h0-cpg-mssr # R-Car V4M
+      - renesas,r9a09g077-cpg-mssr # RZ/T2H
 
   reg:
-    maxItems: 1
+    maxItems: 2
 
   clocks:
     minItems: 1
@@ -68,6 +69,7 @@ properties:
         - extal     # All
         - extalr    # Most R-Car Gen3 and RZ/G2
         - usb_extal # Most R-Car Gen2 and RZ/G1
+        - loco      # RZ/T2H
 
   '#clock-cells':
     description: |
diff --git a/include/dt-bindings/clock/renesas,r9a09g077-cpg-mssr.h b/include/dt-bindings/clock/renesas,r9a09g077-cpg-mssr.h
new file mode 100644
index 000000000000..27c9cdcdf7c8
--- /dev/null
+++ b/include/dt-bindings/clock/renesas,r9a09g077-cpg-mssr.h
@@ -0,0 +1,49 @@
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
+#define R9A09G077_CA55C0		0
+#define R9A09G077_CA55C1		1
+#define R9A09G077_CA55C2		2
+#define R9A09G077_CA55C3		3
+#define R9A09G077_SDHIHS		4
+#define R9A09G077_CLK_PLL1_ETH_PHY	5
+#define R9A09G077_CLK_OSC_ETH_PHY	6
+#define R9A09G077_CLK_ETHPHY		7
+#define R9A09G077_PCLKAH		8
+#define R9A09G077_PCLKAM		9
+#define R9A09G077_PCLKAL		10
+#define R9A09G077_CLK_SEL_ETH_PHY	11
+#define R9A09G077_DFI			12
+#define R9A09G077_PCLKH			13
+#define R9A09G077_PCLKM			14
+#define R9A09G077_PCLKL			15
+#define R9A09G077_PCLKGPTL		16
+#define R9A09G077_PCLKSHOST		17
+#define R9A09G077_PCLKRTC		18
+#define R9A09G077_USB			19
+#define R9A09G077_SPI0			20
+#define R9A09G077_SPI1			21
+#define R9A09G077_SPI2			22
+#define R9A09G077_SPI3			23
+#define R9A09G077_ETCLKA		24
+#define R9A09G077_ETCLKB		25
+#define R9A09G077_ETCLKC		26
+#define R9A09G077_ETCLKD		27
+#define R9A09G077_ETCLKE		28
+#define R9A09G077_ETHCLKE		29
+#define R9A09G077_ETHCLK_EXTAL		30
+#define R9A09G077_ETH_REFCLK		31
+#define R9A09G077_LCDC_CLKA		32
+#define R9A09G077_LCDC_CLKP		33
+#define R9A09G077_CA55			34
+#define R9A09G077_LCDC_CLKD		35
+
+#endif /* __DT_BINDINGS_CLOCK_RENESAS_R9A09G077_CPG_H__ */
-- 
2.43.0


