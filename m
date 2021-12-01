Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A4B084648AE
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  1 Dec 2021 08:33:23 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1347642AbhLAHgm (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 1 Dec 2021 02:36:42 -0500
Received: from relmlor1.renesas.com ([210.160.252.171]:23247 "EHLO
        relmlie5.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1347603AbhLAHgk (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 1 Dec 2021 02:36:40 -0500
X-IronPort-AV: E=Sophos;i="5.87,278,1631545200"; 
   d="scan'208";a="102002991"
Received: from unknown (HELO relmlir6.idc.renesas.com) ([10.200.68.152])
  by relmlie5.idc.renesas.com with ESMTP; 01 Dec 2021 16:33:17 +0900
Received: from localhost.localdomain (unknown [10.166.14.185])
        by relmlir6.idc.renesas.com (Postfix) with ESMTP id 34BD241FE2AC;
        Wed,  1 Dec 2021 16:33:17 +0900 (JST)
From:   Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
To:     geert+renesas@glider.be, magnus.damm@gmail.com, robh+dt@kernel.org,
        gregkh@linuxfoundation.org, jirislaby@kernel.org
Cc:     linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org,
        linux-serial@vger.kernel.org,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Subject: [PATCH v2 03/14] dt-bindings: clock: Add r8a779f0 CPG Core Clock Definitions
Date:   Wed,  1 Dec 2021 16:32:57 +0900
Message-Id: <20211201073308.1003945-4-yoshihiro.shimoda.uh@renesas.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211201073308.1003945-1-yoshihiro.shimoda.uh@renesas.com>
References: <20211201073308.1003945-1-yoshihiro.shimoda.uh@renesas.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Add all Clock Pulse Generator Core Clock Outputs for the Renesas
R-Car S4-8 (R8A779F0) SoC.

Signed-off-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
---
 include/dt-bindings/clock/r8a779f0-cpg-mssr.h | 64 +++++++++++++++++++
 1 file changed, 64 insertions(+)
 create mode 100644 include/dt-bindings/clock/r8a779f0-cpg-mssr.h

diff --git a/include/dt-bindings/clock/r8a779f0-cpg-mssr.h b/include/dt-bindings/clock/r8a779f0-cpg-mssr.h
new file mode 100644
index 000000000000..f2ae1c6a82dd
--- /dev/null
+++ b/include/dt-bindings/clock/r8a779f0-cpg-mssr.h
@@ -0,0 +1,64 @@
+/* SPDX-License-Identifier: (GPL-2.0 or MIT) */
+/*
+ * Copyright (C) 2021 Renesas Electronics Corp.
+ */
+#ifndef __DT_BINDINGS_CLOCK_R8A779F0_CPG_MSSR_H__
+#define __DT_BINDINGS_CLOCK_R8A779F0_CPG_MSSR_H__
+
+#include <dt-bindings/clock/renesas-cpg-mssr.h>
+
+/* r8a779f0 CPG Core Clocks */
+
+#define R8A779F0_CLK_ZX			0
+#define R8A779F0_CLK_ZS			1
+#define R8A779F0_CLK_ZT			2
+#define R8A779F0_CLK_ZTR		3
+#define R8A779F0_CLK_S0D2		4
+#define R8A779F0_CLK_S0D3		5
+#define R8A779F0_CLK_S0D4		6
+#define R8A779F0_CLK_S0D2_MM		7
+#define R8A779F0_CLK_S0D3_MM		8
+#define R8A779F0_CLK_S0D4_MM		9
+#define R8A779F0_CLK_S0D2_RT		10
+#define R8A779F0_CLK_S0D3_RT		11
+#define R8A779F0_CLK_S0D4_RT		12
+#define R8A779F0_CLK_S0D6_RT		13
+#define R8A779F0_CLK_S0D3_PER		14
+#define R8A779F0_CLK_S0D6_PER		15
+#define R8A779F0_CLK_S0D12_PER		16
+#define R8A779F0_CLK_S0D24_PER		17
+#define R8A779F0_CLK_S0D2_HSC		18
+#define R8A779F0_CLK_S0D3_HSC		19
+#define R8A779F0_CLK_S0D4_HSC		20
+#define R8A779F0_CLK_S0D6_HSC		21
+#define R8A779F0_CLK_S0D12_HSC		22
+#define R8A779F0_CLK_S0D2_CC		23
+#define R8A779F0_CLK_CL			24
+#define R8A779F0_CLK_CL16M		25
+#define R8A779F0_CLK_CL16M_MM		26
+#define R8A779F0_CLK_CL16M_RT		27
+#define R8A779F0_CLK_CL16M_PER		28
+#define R8A779F0_CLK_CL16M_HSC		29
+#define R8A779F0_CLK_Z0			30
+#define R8A779F0_CLK_Z1			31
+#define R8A779F0_CLK_ZB3		32
+#define R8A779F0_CLK_ZB3D2		33
+#define R8A779F0_CLK_ZB3D4		34
+#define R8A779F0_CLK_SD0H		35
+#define R8A779F0_CLK_SD0		36
+#define R8A779F0_CLK_RPC		37
+#define R8A779F0_CLK_RPCD2		38
+#define R8A779F0_CLK_MSO		39
+#define R8A779F0_CLK_SASYNCRT		40
+#define R8A779F0_CLK_SASYNCPERD1	41
+#define R8A779F0_CLK_SASYNCPERD2	42
+#define R8A779F0_CLK_SASYNCPERD4	43
+#define R8A779F0_CLK_DBGSOC_HSC		44
+#define R8A779F0_CLK_RSW2		45
+#define R8A779F0_CLK_OSC		46
+#define R8A779F0_CLK_ZR			47
+#define R8A779F0_CLK_CPEX		48
+#define R8A779F0_CLK_CBFUSA		49
+#define R8A779F0_CLK_R			50
+
+#endif /* __DT_BINDINGS_CLOCK_R8A779F0_CPG_MSSR_H__ */
-- 
2.25.1

