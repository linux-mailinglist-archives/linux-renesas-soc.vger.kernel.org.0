Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A9DC1A9AFB
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  5 Sep 2019 08:59:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730767AbfIEG7V (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 5 Sep 2019 02:59:21 -0400
Received: from relmlor1.renesas.com ([210.160.252.171]:20428 "EHLO
        relmlie5.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726047AbfIEG7U (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 5 Sep 2019 02:59:20 -0400
X-IronPort-AV: E=Sophos;i="5.64,469,1559487600"; 
   d="scan'208";a="25803740"
Received: from unknown (HELO relmlir6.idc.renesas.com) ([10.200.68.152])
  by relmlie5.idc.renesas.com with ESMTP; 05 Sep 2019 15:59:18 +0900
Received: from be1yocto.ree.adwin.renesas.com (unknown [172.29.43.62])
        by relmlir6.idc.renesas.com (Postfix) with ESMTP id 0AE2541C7F9E;
        Thu,  5 Sep 2019 15:59:15 +0900 (JST)
From:   Biju Das <biju.das@bp.renesas.com>
To:     Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>
Cc:     Biju Das <biju.das@bp.renesas.com>, devicetree@vger.kernel.org,
        Simon Horman <horms@verge.net.au>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Fabrizio Castro <fabrizio.castro@bp.renesas.com>,
        linux-renesas-soc@vger.kernel.org
Subject: [PATCH] clk: renesas: Add r8a774b1 CPG Core Clock Definitions
Date:   Thu,  5 Sep 2019 07:52:40 +0100
Message-Id: <1567666360-28035-1-git-send-email-biju.das@bp.renesas.com>
X-Mailer: git-send-email 2.7.4
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Add all RZ/G2N Clock Pulse Generator Core Clock Outputs, as listed in
Table 8.2d ("List of Clocks [RZ/G2N]") of the RZ/G2N Hardware User's
Manual.

Signed-off-by: Biju Das <biju.das@bp.renesas.com>
---
 include/dt-bindings/clock/r8a774b1-cpg-mssr.h | 57 +++++++++++++++++++++++++++
 1 file changed, 57 insertions(+)
 create mode 100644 include/dt-bindings/clock/r8a774b1-cpg-mssr.h

diff --git a/include/dt-bindings/clock/r8a774b1-cpg-mssr.h b/include/dt-bindings/clock/r8a774b1-cpg-mssr.h
new file mode 100644
index 0000000..1355451
--- /dev/null
+++ b/include/dt-bindings/clock/r8a774b1-cpg-mssr.h
@@ -0,0 +1,57 @@
+/* SPDX-License-Identifier: GPL-2.0
+ *
+ * Copyright (C) 2019 Renesas Electronics Corp.
+ */
+#ifndef __DT_BINDINGS_CLOCK_R8A774B1_CPG_MSSR_H__
+#define __DT_BINDINGS_CLOCK_R8A774B1_CPG_MSSR_H__
+
+#include <dt-bindings/clock/renesas-cpg-mssr.h>
+
+/* r8a774b1 CPG Core Clocks */
+#define R8A774B1_CLK_Z			0
+#define R8A774B1_CLK_ZG			1
+#define R8A774B1_CLK_ZTR		2
+#define R8A774B1_CLK_ZTRD2		3
+#define R8A774B1_CLK_ZT			4
+#define R8A774B1_CLK_ZX			5
+#define R8A774B1_CLK_S0D1		6
+#define R8A774B1_CLK_S0D2		7
+#define R8A774B1_CLK_S0D3		8
+#define R8A774B1_CLK_S0D4		9
+#define R8A774B1_CLK_S0D6		10
+#define R8A774B1_CLK_S0D8		11
+#define R8A774B1_CLK_S0D12		12
+#define R8A774B1_CLK_S1D2		13
+#define R8A774B1_CLK_S1D4		14
+#define R8A774B1_CLK_S2D1		15
+#define R8A774B1_CLK_S2D2		16
+#define R8A774B1_CLK_S2D4		17
+#define R8A774B1_CLK_S3D1		18
+#define R8A774B1_CLK_S3D2		19
+#define R8A774B1_CLK_S3D4		20
+#define R8A774B1_CLK_LB			21
+#define R8A774B1_CLK_CL			22
+#define R8A774B1_CLK_ZB3		23
+#define R8A774B1_CLK_ZB3D2		24
+#define R8A774B1_CLK_CR			25
+#define R8A774B1_CLK_DDR		26
+#define R8A774B1_CLK_SD0H		27
+#define R8A774B1_CLK_SD0		28
+#define R8A774B1_CLK_SD1H		29
+#define R8A774B1_CLK_SD1		30
+#define R8A774B1_CLK_SD2H		31
+#define R8A774B1_CLK_SD2		32
+#define R8A774B1_CLK_SD3H		33
+#define R8A774B1_CLK_SD3		34
+#define R8A774B1_CLK_RPC		35
+#define R8A774B1_CLK_RPCD2		36
+#define R8A774B1_CLK_MSO		37
+#define R8A774B1_CLK_HDMI		38
+#define R8A774B1_CLK_CSI0		39
+#define R8A774B1_CLK_CP			40
+#define R8A774B1_CLK_CPEX		41
+#define R8A774B1_CLK_R			42
+#define R8A774B1_CLK_OSC		43
+#define R8A774B1_CLK_CANFD		44
+
+#endif /* __DT_BINDINGS_CLOCK_R8A774B1_CPG_MSSR_H__ */
-- 
2.7.4

