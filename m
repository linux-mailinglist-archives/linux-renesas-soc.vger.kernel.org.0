Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 86CDC452BEE
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 16 Nov 2021 08:44:09 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231448AbhKPHpt (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 16 Nov 2021 02:45:49 -0500
Received: from relmlor1.renesas.com ([210.160.252.171]:6254 "EHLO
        relmlie5.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S231332AbhKPHpo (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 16 Nov 2021 02:45:44 -0500
X-IronPort-AV: E=Sophos;i="5.87,238,1631545200"; 
   d="scan'208";a="100433337"
Received: from unknown (HELO relmlir5.idc.renesas.com) ([10.200.68.151])
  by relmlie5.idc.renesas.com with ESMTP; 16 Nov 2021 16:42:38 +0900
Received: from localhost.localdomain (unknown [10.166.14.185])
        by relmlir5.idc.renesas.com (Postfix) with ESMTP id 0A99C4007536;
        Tue, 16 Nov 2021 16:42:38 +0900 (JST)
From:   Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
To:     geert+renesas@glider.be, magnus.damm@gmail.com, robh+dt@kernel.org,
        gregkh@linuxfoundation.org, jirislaby@kernel.org
Cc:     linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org,
        linux-serial@vger.kernel.org,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Subject: [PATCH 07/16] dt-bindings: clock: Add r8a779f0 CPG Core Clock Definitions
Date:   Tue, 16 Nov 2021 16:41:21 +0900
Message-Id: <20211116074130.107554-8-yoshihiro.shimoda.uh@renesas.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211116074130.107554-1-yoshihiro.shimoda.uh@renesas.com>
References: <20211116074130.107554-1-yoshihiro.shimoda.uh@renesas.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Add all Clock Pulse Generator Core Clock Outputs for the Renesas
R-Car S4-8 (R8A779F0) SoC.

Signed-off-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
---
 include/dt-bindings/clock/r8a779f0-cpg-mssr.h | 65 +++++++++++++++++++
 1 file changed, 65 insertions(+)
 create mode 100644 include/dt-bindings/clock/r8a779f0-cpg-mssr.h

diff --git a/include/dt-bindings/clock/r8a779f0-cpg-mssr.h b/include/dt-bindings/clock/r8a779f0-cpg-mssr.h
new file mode 100644
index 000000000000..cb0d4593a7bd
--- /dev/null
+++ b/include/dt-bindings/clock/r8a779f0-cpg-mssr.h
@@ -0,0 +1,65 @@
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
+#define R8A779F0_CLK_SDSRC		35
+#define R8A779F0_CLK_SD0H		36
+#define R8A779F0_CLK_SD0		37
+#define R8A779F0_CLK_RPC		38
+#define R8A779F0_CLK_RPCD2		39
+#define R8A779F0_CLK_MSO		40
+#define R8A779F0_CLK_SASYNCRT		41
+#define R8A779F0_CLK_SASYNCPERD1	42
+#define R8A779F0_CLK_SASYNCPERD2	43
+#define R8A779F0_CLK_SASYNCPERD4	44
+#define R8A779F0_CLK_DBGSOC_HSC		45
+#define R8A779F0_CLK_RSW2		46
+#define R8A779F0_CLK_OSC		47
+#define R8A779F0_CLK_ZR			48
+#define R8A779F0_CLK_CPEX		49
+#define R8A779F0_CLK_CBFUSA		50
+#define R8A779F0_CLK_R			51
+
+#endif /* __DT_BINDINGS_CLOCK_R8A779F0_CPG_MSSR_H__ */
-- 
2.25.1

