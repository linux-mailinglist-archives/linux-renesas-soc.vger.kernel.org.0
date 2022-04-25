Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id CB36850D9A0
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 25 Apr 2022 08:42:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235949AbiDYGpc (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 25 Apr 2022 02:45:32 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43696 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235124AbiDYGp2 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 25 Apr 2022 02:45:28 -0400
Received: from relmlie5.idc.renesas.com (relmlor1.renesas.com [210.160.252.171])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id ED9212AE1B;
        Sun, 24 Apr 2022 23:42:24 -0700 (PDT)
X-IronPort-AV: E=Sophos;i="5.90,287,1643641200"; 
   d="scan'208";a="117888773"
Received: from unknown (HELO relmlir5.idc.renesas.com) ([10.200.68.151])
  by relmlie5.idc.renesas.com with ESMTP; 25 Apr 2022 15:42:21 +0900
Received: from localhost.localdomain (unknown [10.166.15.32])
        by relmlir5.idc.renesas.com (Postfix) with ESMTP id E7A144009BE6;
        Mon, 25 Apr 2022 15:42:20 +0900 (JST)
From:   Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
To:     geert+renesas@glider.be, magnus.damm@gmail.com, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, gregkh@linuxfoundation.org
Cc:     linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org,
        linux-serial@vger.kernel.org,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Subject: [PATCH v2 2/7] dt-bindings: clock: Add r8a779g0 CPG Core Clock Definitions
Date:   Mon, 25 Apr 2022 15:41:56 +0900
Message-Id: <20220425064201.459633-3-yoshihiro.shimoda.uh@renesas.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220425064201.459633-1-yoshihiro.shimoda.uh@renesas.com>
References: <20220425064201.459633-1-yoshihiro.shimoda.uh@renesas.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-1.8 required=5.0 tests=BAYES_00,KHOP_HELO_FCRDNS,
        SPF_HELO_NONE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Add all Clock Pulse Generator Core Clock Outputs for the Renesas
R-Car V4H (R8A779G0) SoC.

Signed-off-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
---
 include/dt-bindings/clock/r8a779g0-cpg-mssr.h | 90 +++++++++++++++++++
 1 file changed, 90 insertions(+)
 create mode 100644 include/dt-bindings/clock/r8a779g0-cpg-mssr.h

diff --git a/include/dt-bindings/clock/r8a779g0-cpg-mssr.h b/include/dt-bindings/clock/r8a779g0-cpg-mssr.h
new file mode 100644
index 000000000000..754c54a6eb06
--- /dev/null
+++ b/include/dt-bindings/clock/r8a779g0-cpg-mssr.h
@@ -0,0 +1,90 @@
+/* SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause) */
+/*
+ * Copyright (C) 2022 Renesas Electronics Corp.
+ */
+#ifndef __DT_BINDINGS_CLOCK_R8A779G0_CPG_MSSR_H__
+#define __DT_BINDINGS_CLOCK_R8A779G0_CPG_MSSR_H__
+
+#include <dt-bindings/clock/renesas-cpg-mssr.h>
+
+/* r8a779g0 CPG Core Clocks */
+
+#define R8A779G0_CLK_ZX			0
+#define R8A779G0_CLK_ZS			1
+#define R8A779G0_CLK_ZT			2
+#define R8A779G0_CLK_ZTR		3
+#define R8A779G0_CLK_S0D2		4
+#define R8A779G0_CLK_S0D3		5
+#define R8A779G0_CLK_S0D4		6
+#define R8A779G0_CLK_S0D1_VIO		7
+#define R8A779G0_CLK_S0D2_VIO		8
+#define R8A779G0_CLK_S0D4_VIO		9
+#define R8A779G0_CLK_S0D8_VIO		10
+#define R8A779G0_CLK_S0D1_VC		11
+#define R8A779G0_CLK_S0D2_VC		12
+#define R8A779G0_CLK_S0D4_VC		13
+#define R8A779G0_CLK_S0D2_MM		14
+#define R8A779G0_CLK_S0D4_MM		15
+#define R8A779G0_CLK_S0D2_U3DG		16
+#define R8A779G0_CLK_S0D4_U3DG		17
+#define R8A779G0_CLK_S0D2_RT		18
+#define R8A779G0_CLK_S0D3_RT		19
+#define R8A779G0_CLK_S0D4_RT		20
+#define R8A779G0_CLK_S0D6_RT		21
+#define R8A779G0_CLK_S0D24_RT		22
+#define R8A779G0_CLK_S0D2_PER		23
+#define R8A779G0_CLK_S0D3_PER		24
+#define R8A779G0_CLK_S0D4_PER		25
+#define R8A779G0_CLK_S0D6_PER		26
+#define R8A779G0_CLK_S0D12_PER		27
+#define R8A779G0_CLK_S0D24_PER		28
+#define R8A779G0_CLK_S0D1_HSC		29
+#define R8A779G0_CLK_S0D2_HSC		30
+#define R8A779G0_CLK_S0D4_HSC		31
+#define R8A779G0_CLK_S0D2_CC		32
+#define R8A779G0_CLK_SVD1_IR		33
+#define R8A779G0_CLK_SVD2_IR		34
+#define R8A779G0_CLK_SVD1_VIP		35
+#define R8A779G0_CLK_SVD2_VIP		36
+#define R8A779G0_CLK_CL			37
+#define R8A779G0_CLK_CL16M		38
+#define R8A779G0_CLK_CL16M_MM		39
+#define R8A779G0_CLK_CL16M_RT		40
+#define R8A779G0_CLK_CL16M_PER		41
+#define R8A779G0_CLK_CL16M_HSC		42
+#define R8A779G0_CLK_Z0			43
+#define R8A779G0_CLK_ZB3		44
+#define R8A779G0_CLK_ZB3D2		45
+#define R8A779G0_CLK_ZB3D4		46
+#define R8A779G0_CLK_ZG			47
+#define R8A779G0_CLK_SD0H		48
+#define R8A779G0_CLK_SD0		49
+#define R8A779G0_CLK_RPC		50
+#define R8A779G0_CLK_RPCD2		51
+#define R8A779G0_CLK_MSO		52
+#define R8A779G0_CLK_CANFD		53
+#define R8A779G0_CLK_CSI		54
+#define R8A779G0_CLK_FRAY		55
+#define R8A779G0_CLK_IPC		56
+#define R8A779G0_CLK_SASYNCRT		57
+#define R8A779G0_CLK_SASYNCPERD1	58
+#define R8A779G0_CLK_SASYNCPERD2	59
+#define R8A779G0_CLK_SASYNCPERD4	60
+#define R8A779G0_CLK_VIOBUS		61
+#define R8A779G0_CLK_VIOBUSD2		62
+#define R8A779G0_CLK_VCBUS		63
+#define R8A779G0_CLK_VCBUSD2		64
+#define R8A779G0_CLK_DSIEXT		65
+#define R8A779G0_CLK_DSIREF		66
+#define R8A779G0_CLK_ADGH		67
+#define R8A779G0_CLK_OSC		68
+#define R8A779G0_CLK_ZR0		69
+#define R8A779G0_CLK_ZR1		70
+#define R8A779G0_CLK_ZR2		71
+#define R8A779G0_CLK_IMPA		72
+#define R8A779G0_CLK_IMPAD4		73
+#define R8A779G0_CLK_CPEX		74
+#define R8A779G0_CLK_CBFUSA		75
+#define R8A779G0_CLK_R			76
+
+#endif /* __DT_BINDINGS_CLOCK_R8A779G0_CPG_MSSR_H__ */
-- 
2.25.1

