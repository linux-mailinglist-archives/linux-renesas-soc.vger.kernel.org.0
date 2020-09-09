Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6B2A8262EFD
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  9 Sep 2020 15:15:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730299AbgIINOd (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 9 Sep 2020 09:14:33 -0400
Received: from relmlor2.renesas.com ([210.160.252.172]:49169 "EHLO
        relmlie6.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1730328AbgIINNn (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 9 Sep 2020 09:13:43 -0400
X-IronPort-AV: E=Sophos;i="5.76,409,1592838000"; 
   d="scan'208";a="56620012"
Received: from unknown (HELO relmlir6.idc.renesas.com) ([10.200.68.152])
  by relmlie6.idc.renesas.com with ESMTP; 09 Sep 2020 22:13:42 +0900
Received: from localhost.localdomain (unknown [10.166.252.89])
        by relmlir6.idc.renesas.com (Postfix) with ESMTP id 758D449DB584;
        Wed,  9 Sep 2020 22:13:42 +0900 (JST)
From:   Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
To:     geert+renesas@glider.be, magnus.damm@gmail.com
Cc:     linux-renesas-soc@vger.kernel.org,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Subject: [PATCH v2 1/4] dt-bindings: clock: Add r8a779a0 CPG Core Clock Definitions
Date:   Wed,  9 Sep 2020 22:13:28 +0900
Message-Id: <1599657211-17504-2-git-send-email-yoshihiro.shimoda.uh@renesas.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1599657211-17504-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
References: <1599657211-17504-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Add all Clock Pulse Generator Core Clock Outputs for the Renesas R-Car
V3U (R8A779A0) SoC.

Signed-off-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
---
 include/dt-bindings/clock/r8a779a0-cpg-mssr.h | 55 +++++++++++++++++++++++++++
 1 file changed, 55 insertions(+)
 create mode 100644 include/dt-bindings/clock/r8a779a0-cpg-mssr.h

diff --git a/include/dt-bindings/clock/r8a779a0-cpg-mssr.h b/include/dt-bindings/clock/r8a779a0-cpg-mssr.h
new file mode 100644
index 0000000..f1d737c
--- /dev/null
+++ b/include/dt-bindings/clock/r8a779a0-cpg-mssr.h
@@ -0,0 +1,55 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+/*
+ * Copyright (C) 2020 Renesas Electronics Corp.
+ */
+#ifndef __DT_BINDINGS_CLOCK_R8A779A0_CPG_MSSR_H__
+#define __DT_BINDINGS_CLOCK_R8A779A0_CPG_MSSR_H__
+
+#include <dt-bindings/clock/renesas-cpg-mssr.h>
+
+/* r8a779A0 CPG Core Clocks */
+#define R8A779A0_CLK_Z0			0
+#define R8A779A0_CLK_ZX			1
+#define R8A779A0_CLK_Z1			2
+#define R8A779A0_CLK_ZR			3
+#define R8A779A0_CLK_ZS			4
+#define R8A779A0_CLK_ZT			5
+#define R8A779A0_CLK_ZTR		6
+#define R8A779A0_CLK_S1D1		7
+#define R8A779A0_CLK_S1D2		8
+#define R8A779A0_CLK_S1D4		9
+#define R8A779A0_CLK_S1D8		10
+#define R8A779A0_CLK_S1D12		11
+#define R8A779A0_CLK_S3D1		12
+#define R8A779A0_CLK_S3D2		13
+#define R8A779A0_CLK_S3D4		14
+#define R8A779A0_CLK_LB			15
+#define R8A779A0_CLK_CP			16
+#define R8A779A0_CLK_CL			17
+#define R8A779A0_CLK_CL16MCK		18
+#define R8A779A0_CLK_ZB30		19
+#define R8A779A0_CLK_ZB30D2		20
+#define R8A779A0_CLK_ZB30D4		21
+#define R8A779A0_CLK_ZB31		22
+#define R8A779A0_CLK_ZB31D2		23
+#define R8A779A0_CLK_ZB31D4		24
+#define R8A779A0_CLK_SD0H		25
+#define R8A779A0_CLK_SD0		26
+#define R8A779A0_CLK_RPC		27
+#define R8A779A0_CLK_RPCD2		28
+#define R8A779A0_CLK_MSO		29
+#define R8A779A0_CLK_CANFD		30
+#define R8A779A0_CLK_CSI0		31
+#define R8A779A0_CLK_FRAY		32
+#define R8A779A0_CLK_DSI		33
+#define R8A779A0_CLK_VIP		34
+#define R8A779A0_CLK_ADGH		35
+#define R8A779A0_CLK_CNNDSP		36
+#define R8A779A0_CLK_ICU		37
+#define R8A779A0_CLK_ICUD2		38
+#define R8A779A0_CLK_VCBUS		39
+#define R8A779A0_CLK_CBFUSA		40
+#define R8A779A0_CLK_R			41
+#define R8A779A0_CLK_OSC		42
+
+#endif /* __DT_BINDINGS_CLOCK_R8A779A0_CPG_MSSR_H__ */
-- 
2.7.4

