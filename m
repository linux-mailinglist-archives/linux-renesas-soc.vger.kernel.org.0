Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C93F55083C9
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 20 Apr 2022 10:43:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1376873AbiDTIqD (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 20 Apr 2022 04:46:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40868 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1376872AbiDTIpv (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 20 Apr 2022 04:45:51 -0400
Received: from relmlie6.idc.renesas.com (relmlor2.renesas.com [210.160.252.172])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id E64C03B2A7;
        Wed, 20 Apr 2022 01:43:00 -0700 (PDT)
X-IronPort-AV: E=Sophos;i="5.90,275,1643641200"; 
   d="scan'208";a="118557993"
Received: from unknown (HELO relmlir5.idc.renesas.com) ([10.200.68.151])
  by relmlie6.idc.renesas.com with ESMTP; 20 Apr 2022 17:42:58 +0900
Received: from localhost.localdomain (unknown [10.166.15.32])
        by relmlir5.idc.renesas.com (Postfix) with ESMTP id 5D05B401073A;
        Wed, 20 Apr 2022 17:42:58 +0900 (JST)
From:   Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
To:     geert+renesas@glider.be, magnus.damm@gmail.com, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, gregkh@linuxfoundation.org
Cc:     linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org,
        linux-serial@vger.kernel.org,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Subject: [PATCH 05/15] dt-bindings: power: Add r8a779g0 SYSC power domain definitions
Date:   Wed, 20 Apr 2022 17:42:45 +0900
Message-Id: <20220420084255.375700-6-yoshihiro.shimoda.uh@renesas.com>
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

Add power domain indices for R-Car V4H (r8a779g0).

Signed-off-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
---
 include/dt-bindings/power/r8a779g0-sysc.h | 45 +++++++++++++++++++++++
 1 file changed, 45 insertions(+)
 create mode 100644 include/dt-bindings/power/r8a779g0-sysc.h

diff --git a/include/dt-bindings/power/r8a779g0-sysc.h b/include/dt-bindings/power/r8a779g0-sysc.h
new file mode 100644
index 000000000000..da79c4b39556
--- /dev/null
+++ b/include/dt-bindings/power/r8a779g0-sysc.h
@@ -0,0 +1,45 @@
+/* SPDX-License-Identifier: (GPL-2.0 or MIT) */
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

