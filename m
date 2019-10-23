Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id CC00EE1A1D
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 23 Oct 2019 14:29:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2391318AbfJWM3t (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 23 Oct 2019 08:29:49 -0400
Received: from laurent.telenet-ops.be ([195.130.137.89]:55572 "EHLO
        laurent.telenet-ops.be" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2391328AbfJWM3s (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 23 Oct 2019 08:29:48 -0400
Received: from ramsan ([84.194.98.4])
        by laurent.telenet-ops.be with bizsmtp
        id H0Vl2100E05gfCL010Vltl; Wed, 23 Oct 2019 14:29:46 +0200
Received: from rox.of.borg ([192.168.97.57])
        by ramsan with esmtp (Exim 4.90_1)
        (envelope-from <geert@linux-m68k.org>)
        id 1iNFlp-0000eR-Rl; Wed, 23 Oct 2019 14:29:45 +0200
Received: from geert by rox.of.borg with local (Exim 4.90_1)
        (envelope-from <geert@linux-m68k.org>)
        id 1iNFlp-0003Dz-Qb; Wed, 23 Oct 2019 14:29:45 +0200
From:   Geert Uytterhoeven <geert+renesas@glider.be>
To:     Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>
Cc:     Eugeniu Rosca <erosca@de.adit-jv.com>, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH v2 2/4] dt-bindings: clock: Add r8a77961 CPG Core Clock Definitions
Date:   Wed, 23 Oct 2019 14:29:39 +0200
Message-Id: <20191023122941.12342-3-geert+renesas@glider.be>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20191023122941.12342-1-geert+renesas@glider.be>
References: <20191023122941.12342-1-geert+renesas@glider.be>
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Add all Clock Pulse Generator Core Clock Outputs for the Renesas R-Car
M3-W+ (R8A77961) SoC, as listed in Table 8.2b ("List of Clocks [R-Car
M3-W/R-Car M3-W+]") of the R-Car Series, 3rd Generation Hardware User's
Manual (Rev. 2.00, Jul. 31, 2019).  A gap is added for CSIREF, to
preserve compatibility with the definitions for R-Car M3-W (R8A77960).

Note that internal CPG clocks (S0, S1, S2, S3, SDSRC, SSPSRC, and POST2)
are not included, as they are used as internal clock sources only, and
never referenced from DT.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
Reviewed-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
---
v2:
  - Add Reviewed-by.
---
 include/dt-bindings/clock/r8a77961-cpg-mssr.h | 65 +++++++++++++++++++
 1 file changed, 65 insertions(+)
 create mode 100644 include/dt-bindings/clock/r8a77961-cpg-mssr.h

diff --git a/include/dt-bindings/clock/r8a77961-cpg-mssr.h b/include/dt-bindings/clock/r8a77961-cpg-mssr.h
new file mode 100644
index 0000000000000000..7921d785546d12ce
--- /dev/null
+++ b/include/dt-bindings/clock/r8a77961-cpg-mssr.h
@@ -0,0 +1,65 @@
+/* SPDX-License-Identifier: GPL-2.0+
+ *
+ * Copyright (C) 2019 Renesas Electronics Corp.
+ */
+#ifndef __DT_BINDINGS_CLOCK_R8A77961_CPG_MSSR_H__
+#define __DT_BINDINGS_CLOCK_R8A77961_CPG_MSSR_H__
+
+#include <dt-bindings/clock/renesas-cpg-mssr.h>
+
+/* r8a77961 CPG Core Clocks */
+#define R8A77961_CLK_Z			0
+#define R8A77961_CLK_Z2			1
+#define R8A77961_CLK_ZR			2
+#define R8A77961_CLK_ZG			3
+#define R8A77961_CLK_ZTR			4
+#define R8A77961_CLK_ZTRD2		5
+#define R8A77961_CLK_ZT			6
+#define R8A77961_CLK_ZX			7
+#define R8A77961_CLK_S0D1		8
+#define R8A77961_CLK_S0D2		9
+#define R8A77961_CLK_S0D3		10
+#define R8A77961_CLK_S0D4		11
+#define R8A77961_CLK_S0D6		12
+#define R8A77961_CLK_S0D8		13
+#define R8A77961_CLK_S0D12		14
+#define R8A77961_CLK_S1D1		15
+#define R8A77961_CLK_S1D2		16
+#define R8A77961_CLK_S1D4		17
+#define R8A77961_CLK_S2D1		18
+#define R8A77961_CLK_S2D2		19
+#define R8A77961_CLK_S2D4		20
+#define R8A77961_CLK_S3D1		21
+#define R8A77961_CLK_S3D2		22
+#define R8A77961_CLK_S3D4		23
+#define R8A77961_CLK_LB			24
+#define R8A77961_CLK_CL			25
+#define R8A77961_CLK_ZB3			26
+#define R8A77961_CLK_ZB3D2		27
+#define R8A77961_CLK_ZB3D4		28
+#define R8A77961_CLK_CR			29
+#define R8A77961_CLK_CRD2		30
+#define R8A77961_CLK_SD0H		31
+#define R8A77961_CLK_SD0			32
+#define R8A77961_CLK_SD1H		33
+#define R8A77961_CLK_SD1			34
+#define R8A77961_CLK_SD2H		35
+#define R8A77961_CLK_SD2			36
+#define R8A77961_CLK_SD3H		37
+#define R8A77961_CLK_SD3			38
+#define R8A77961_CLK_SSP2		39
+#define R8A77961_CLK_SSP1		40
+#define R8A77961_CLK_SSPRS		41
+#define R8A77961_CLK_RPC			42
+#define R8A77961_CLK_RPCD2		43
+#define R8A77961_CLK_MSO			44
+#define R8A77961_CLK_CANFD		45
+#define R8A77961_CLK_HDMI		46
+#define R8A77961_CLK_CSI0		47
+/* CLK_CSIREF was removed */
+#define R8A77961_CLK_CP			49
+#define R8A77961_CLK_CPEX		50
+#define R8A77961_CLK_R			51
+#define R8A77961_CLK_OSC			52
+
+#endif /* __DT_BINDINGS_CLOCK_R8A77961_CPG_MSSR_H__ */
-- 
2.17.1

