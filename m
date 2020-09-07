Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6071F25F647
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  7 Sep 2020 11:20:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728180AbgIGJUO (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 7 Sep 2020 05:20:14 -0400
Received: from relmlor2.renesas.com ([210.160.252.172]:44534 "EHLO
        relmlie6.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1728278AbgIGJUK (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 7 Sep 2020 05:20:10 -0400
X-IronPort-AV: E=Sophos;i="5.76,401,1592838000"; 
   d="scan'208";a="56349407"
Received: from unknown (HELO relmlir5.idc.renesas.com) ([10.200.68.151])
  by relmlie6.idc.renesas.com with ESMTP; 07 Sep 2020 18:20:08 +0900
Received: from localhost.localdomain (unknown [10.166.252.89])
        by relmlir5.idc.renesas.com (Postfix) with ESMTP id 9927740062BD;
        Mon,  7 Sep 2020 18:20:08 +0900 (JST)
From:   Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
To:     geert+renesas@glider.be, magnus.damm@gmail.com, robh+dt@kernel.org
Cc:     linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Subject: [PATCH 07/14] dt-bindings: clock: Add r8a77961 CPG Core Clock Definitions
Date:   Mon,  7 Sep 2020 18:19:43 +0900
Message-Id: <1599470390-29719-8-git-send-email-yoshihiro.shimoda.uh@renesas.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1599470390-29719-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
References: <1599470390-29719-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Add all Clock Pulse Generator Core Clock Outputs for the Renesas R-Car
V3U (R8A779A0) SoC.

Signed-off-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
---
 include/dt-bindings/clock/r8a779a0-cpg-mssr.h | 63 +++++++++++++++++++++++++++
 1 file changed, 63 insertions(+)
 create mode 100644 include/dt-bindings/clock/r8a779a0-cpg-mssr.h

diff --git a/include/dt-bindings/clock/r8a779a0-cpg-mssr.h b/include/dt-bindings/clock/r8a779a0-cpg-mssr.h
new file mode 100644
index 0000000..9ed14ea
--- /dev/null
+++ b/include/dt-bindings/clock/r8a779a0-cpg-mssr.h
@@ -0,0 +1,63 @@
+/* SPDX-License-Identifier: GPL-2.0 */
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
+#define R8A779A0_CLK_S1			7
+#define R8A779A0_CLK_S3			8
+#define R8A779A0_CLK_S1D1		9
+#define R8A779A0_CLK_S1D2		10
+#define R8A779A0_CLK_S1D4		11
+#define R8A779A0_CLK_S1D8		12
+#define R8A779A0_CLK_S1D12		13
+#define R8A779A0_CLK_S2D1		14
+#define R8A779A0_CLK_S2D2		15
+#define R8A779A0_CLK_S2D4		16
+#define R8A779A0_CLK_S3D1		17
+#define R8A779A0_CLK_S3D2		18
+#define R8A779A0_CLK_S3D4		19
+#define R8A779A0_CLK_LB			20
+#define R8A779A0_CLK_CP			21
+#define R8A779A0_CLK_CL			22
+#define R8A779A0_CLK_CL16MCK		23
+#define R8A779A0_CLK_ZB30		24
+#define R8A779A0_CLK_ZB30D2		25
+#define R8A779A0_CLK_ZB30D4		26
+#define R8A779A0_CLK_ZB31		27
+#define R8A779A0_CLK_ZB31D2		28
+#define R8A779A0_CLK_ZB31D4		29
+#define R8A779A0_CLK_SD0H		30
+#define R8A779A0_CLK_SD0		31
+#define R8A779A0_CLK_RPC		32
+#define R8A779A0_CLK_RPCD2		33
+#define R8A779A0_CLK_MSO		34
+#define R8A779A0_CLK_CANFD		35
+#define R8A779A0_CLK_CSI0		36
+#define R8A779A0_CLK_FRAY		37
+#define R8A779A0_CLK_POST		38
+#define R8A779A0_CLK_POST2		39
+#define R8A779A0_CLK_POST3		40
+#define R8A779A0_CLK_DSI		41
+#define R8A779A0_CLK_VIP		42
+#define R8A779A0_CLK_ADGH		43
+#define R8A779A0_CLK_CNNDSP		44
+#define R8A779A0_CLK_ICU		45
+#define R8A779A0_CLK_ICUD2		46
+#define R8A779A0_CLK_VCBUS		47
+#define R8A779A0_CLK_CBFUSA		48
+#define R8A779A0_CLK_RCLK		49
+#define R8A779A0_CLK_OSCCLK		50
+
+#endif /* __DT_BINDINGS_CLOCK_R8A779A0_CPG_MSSR_H__ */
-- 
2.7.4

