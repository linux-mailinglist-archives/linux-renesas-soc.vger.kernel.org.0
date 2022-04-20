Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 184F85083CC
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 20 Apr 2022 10:43:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1376858AbiDTIqF (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 20 Apr 2022 04:46:05 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40874 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1376874AbiDTIpv (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 20 Apr 2022 04:45:51 -0400
Received: from relmlie6.idc.renesas.com (relmlor2.renesas.com [210.160.252.172])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 7FFF43B2B3;
        Wed, 20 Apr 2022 01:43:01 -0700 (PDT)
X-IronPort-AV: E=Sophos;i="5.90,275,1643641200"; 
   d="scan'208";a="118557996"
Received: from unknown (HELO relmlir5.idc.renesas.com) ([10.200.68.151])
  by relmlie6.idc.renesas.com with ESMTP; 20 Apr 2022 17:42:58 +0900
Received: from localhost.localdomain (unknown [10.166.15.32])
        by relmlir5.idc.renesas.com (Postfix) with ESMTP id 9815F40062B6;
        Wed, 20 Apr 2022 17:42:58 +0900 (JST)
From:   Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
To:     geert+renesas@glider.be, magnus.damm@gmail.com, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, gregkh@linuxfoundation.org
Cc:     linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org,
        linux-serial@vger.kernel.org,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Subject: [PATCH 07/15] dt-bindings: clock: Add r8a779g0 CPG Core Clock Definitions
Date:   Wed, 20 Apr 2022 17:42:47 +0900
Message-Id: <20220420084255.375700-8-yoshihiro.shimoda.uh@renesas.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220420084255.375700-1-yoshihiro.shimoda.uh@renesas.com>
References: <20220420084255.375700-1-yoshihiro.shimoda.uh@renesas.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,KHOP_HELO_FCRDNS,
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
 include/dt-bindings/clock/r8a779g0-cpg-mssr.h | 87 +++++++++++++++++++
 1 file changed, 87 insertions(+)
 create mode 100644 include/dt-bindings/clock/r8a779g0-cpg-mssr.h

diff --git a/include/dt-bindings/clock/r8a779g0-cpg-mssr.h b/include/dt-bindings/clock/r8a779g0-cpg-mssr.h
new file mode 100644
index 000000000000..07a94cf45581
--- /dev/null
+++ b/include/dt-bindings/clock/r8a779g0-cpg-mssr.h
@@ -0,0 +1,87 @@
+/* SPDX-License-Identifier: (GPL-2.0 or MIT) */
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
+#define R8A779G0_CLK_S0D6_PER		25
+#define R8A779G0_CLK_S0D12_PER		26
+#define R8A779G0_CLK_S0D24_PER		27
+#define R8A779G0_CLK_S0D1_HSC		28
+#define R8A779G0_CLK_S0D2_HSC		29
+#define R8A779G0_CLK_S0D4_HSC		30
+#define R8A779G0_CLK_S0D2_CC		31
+#define R8A779G0_CLK_SVD1_IR		32
+#define R8A779G0_CLK_SVD2_IR		33
+#define R8A779G0_CLK_SVD1_VIP		34
+#define R8A779G0_CLK_SVD2_VIP		35
+#define R8A779G0_CLK_CL			36
+#define R8A779G0_CLK_CL16M		37
+#define R8A779G0_CLK_CL16M_MM		38
+#define R8A779G0_CLK_CL16M_RT		39
+#define R8A779G0_CLK_CL16M_PER		40
+#define R8A779G0_CLK_CL16M_HSC		41
+#define R8A779G0_CLK_Z0			42
+#define R8A779G0_CLK_ZB3		43
+#define R8A779G0_CLK_ZB3D2		44
+#define R8A779G0_CLK_ZB3D4		45
+#define R8A779G0_CLK_ZG			46
+#define R8A779G0_CLK_SD0H		47
+#define R8A779G0_CLK_SD0		48
+#define R8A779G0_CLK_RPC		49
+#define R8A779G0_CLK_RPCD2		50
+#define R8A779G0_CLK_MSO		51
+#define R8A779G0_CLK_CANFD		52
+#define R8A779G0_CLK_CSI		53
+#define R8A779G0_CLK_FRAY		54
+#define R8A779G0_CLK_IPC		55
+#define R8A779G0_CLK_SASYNCRT		56
+#define R8A779G0_CLK_SASYNCPERD1	57
+#define R8A779G0_CLK_SASYNCPERD2	58
+#define R8A779G0_CLK_SASYNCPERD4	59
+#define R8A779G0_CLK_VIOBUSD2		60
+#define R8A779G0_CLK_VCBUSD2		61
+#define R8A779G0_CLK_IMPA1		62
+#define R8A779G0_CLK_DSIEXT		63
+#define R8A779G0_CLK_DSIREF		64
+#define R8A779G0_CLK_ADGH		65
+#define R8A779G0_CLK_OSC		66
+#define R8A779G0_CLK_ZR0		67
+#define R8A779G0_CLK_ZR1		68
+#define R8A779G0_CLK_ZR2		69
+#define R8A779G0_CLK_IMPAD4		70
+#define R8A779G0_CLK_CPEX		71
+#define R8A779G0_CLK_CBFUSA		72
+#define R8A779G0_CLK_R			73
+
+#endif /* __DT_BINDINGS_CLOCK_R8A779G0_CPG_MSSR_H__ */
-- 
2.25.1

