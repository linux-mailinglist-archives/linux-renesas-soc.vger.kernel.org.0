Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5BD2C50D999
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 25 Apr 2022 08:42:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236347AbiDYGpa (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 25 Apr 2022 02:45:30 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43702 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235949AbiDYGp0 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 25 Apr 2022 02:45:26 -0400
Received: from relmlie5.idc.renesas.com (relmlor1.renesas.com [210.160.252.171])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id A51B72AE3C;
        Sun, 24 Apr 2022 23:42:21 -0700 (PDT)
X-IronPort-AV: E=Sophos;i="5.90,287,1643641200"; 
   d="scan'208";a="117888770"
Received: from unknown (HELO relmlir5.idc.renesas.com) ([10.200.68.151])
  by relmlie5.idc.renesas.com with ESMTP; 25 Apr 2022 15:42:20 +0900
Received: from localhost.localdomain (unknown [10.166.15.32])
        by relmlir5.idc.renesas.com (Postfix) with ESMTP id CD41A4009BE4;
        Mon, 25 Apr 2022 15:42:20 +0900 (JST)
From:   Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
To:     geert+renesas@glider.be, magnus.damm@gmail.com, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, gregkh@linuxfoundation.org
Cc:     linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org,
        linux-serial@vger.kernel.org,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH v2 1/7] dt-bindings: power: Add r8a779g0 SYSC power domain definitions
Date:   Mon, 25 Apr 2022 15:41:55 +0900
Message-Id: <20220425064201.459633-2-yoshihiro.shimoda.uh@renesas.com>
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

Add power domain indices for R-Car V4H (r8a779g0).

Signed-off-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
 include/dt-bindings/power/r8a779g0-sysc.h | 45 +++++++++++++++++++++++
 1 file changed, 45 insertions(+)
 create mode 100644 include/dt-bindings/power/r8a779g0-sysc.h

diff --git a/include/dt-bindings/power/r8a779g0-sysc.h b/include/dt-bindings/power/r8a779g0-sysc.h
new file mode 100644
index 000000000000..7daa70f1814e
--- /dev/null
+++ b/include/dt-bindings/power/r8a779g0-sysc.h
@@ -0,0 +1,45 @@
+/* SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause) */
+/*
+ * Copyright (C) 2022 Renesas Electronics Corp.
+ */
+#ifndef __DT_BINDINGS_POWER_R8A779G0_SYSC_H__
+#define __DT_BINDINGS_POWER_R8A779G0_SYSC_H__
+
+/*
+ * These power domain indices match the Power Domain Register Numbers (PDR)
+ */
+
+#define R8A779G0_PD_A1E0D0C0		0
+#define R8A779G0_PD_A1E0D0C1		1
+#define R8A779G0_PD_A1E0D1C0		2
+#define R8A779G0_PD_A1E0D1C1		3
+#define R8A779G0_PD_A2E0D0		16
+#define R8A779G0_PD_A2E0D1		17
+#define R8A779G0_PD_A3E0		20
+#define R8A779G0_PD_A33DGA		24
+#define R8A779G0_PD_A23DGB		25
+#define R8A779G0_PD_A1DSP0		33
+#define R8A779G0_PD_A2IMP01		34
+#define R8A779G0_PD_A2PSC		35
+#define R8A779G0_PD_A2CV0		36
+#define R8A779G0_PD_A2CV1		37
+#define R8A779G0_PD_A1CNN0		41
+#define R8A779G0_PD_A2CN0		42
+#define R8A779G0_PD_A3IR		43
+#define R8A779G0_PD_A1DSP1		45
+#define R8A779G0_PD_A2IMP23		46
+#define R8A779G0_PD_A2DMA		47
+#define R8A779G0_PD_A2CV2		48
+#define R8A779G0_PD_A2CV3		49
+#define R8A779G0_PD_A1DSP2		53
+#define R8A779G0_PD_A1DSP3		54
+#define R8A779G0_PD_A3VIP0		56
+#define R8A779G0_PD_A3VIP1		57
+#define R8A779G0_PD_A3VIP2		58
+#define R8A779G0_PD_A3ISP0		60
+#define R8A779G0_PD_A3ISP1		61
+
+/* Always-on power area */
+#define R8A779G0_PD_ALWAYS_ON		64
+
+#endif /* __DT_BINDINGS_POWER_R8A779G0_SYSC_H__*/
-- 
2.25.1

