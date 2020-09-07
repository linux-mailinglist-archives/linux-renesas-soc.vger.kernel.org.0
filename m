Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BBE3225F64E
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  7 Sep 2020 11:20:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728396AbgIGJU0 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 7 Sep 2020 05:20:26 -0400
Received: from relmlor1.renesas.com ([210.160.252.171]:15998 "EHLO
        relmlie5.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1728284AbgIGJUL (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 7 Sep 2020 05:20:11 -0400
X-IronPort-AV: E=Sophos;i="5.76,401,1592838000"; 
   d="scan'208";a="56565789"
Received: from unknown (HELO relmlir5.idc.renesas.com) ([10.200.68.151])
  by relmlie5.idc.renesas.com with ESMTP; 07 Sep 2020 18:20:08 +0900
Received: from localhost.localdomain (unknown [10.166.252.89])
        by relmlir5.idc.renesas.com (Postfix) with ESMTP id 3ABA040031D1;
        Mon,  7 Sep 2020 18:20:08 +0900 (JST)
From:   Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
To:     geert+renesas@glider.be, magnus.damm@gmail.com, robh+dt@kernel.org
Cc:     linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Subject: [PATCH 04/14] dt-bindings: power: Add r8a779a0 SYSC power domain definitions
Date:   Mon,  7 Sep 2020 18:19:40 +0900
Message-Id: <1599470390-29719-5-git-send-email-yoshihiro.shimoda.uh@renesas.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1599470390-29719-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
References: <1599470390-29719-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Adds power domain indices fpr R-Car V3U (r8a779a0).

Signed-off-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
---
 include/dt-bindings/power/r8a779a0-sysc.h | 61 +++++++++++++++++++++++++++++++
 1 file changed, 61 insertions(+)
 create mode 100644 include/dt-bindings/power/r8a779a0-sysc.h

diff --git a/include/dt-bindings/power/r8a779a0-sysc.h b/include/dt-bindings/power/r8a779a0-sysc.h
new file mode 100644
index 0000000..e7e9e89
--- /dev/null
+++ b/include/dt-bindings/power/r8a779a0-sysc.h
@@ -0,0 +1,61 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+/*
+ * Copyright (C) 2020 Renesas Electronics Corp.
+ */
+#ifndef __DT_BINDINGS_POWER_R8A779A0_SYSC_H__
+#define __DT_BINDINGS_POWER_R8A779A0_SYSC_H__
+
+/*
+ * These power domain indices match the numbers of the interrupt bits
+ * representing the power areas in the various Interrupt Registers
+ * (e.g. SYSCISCR0, Interrupt Status/Clear Register 0)
+ */
+
+#define R8A779A0_PD_A1E0D0C0		0
+#define R8A779A0_PD_A1E0D0C1		1
+#define R8A779A0_PD_A1E0D1C0		2
+#define R8A779A0_PD_A1E0D1C1		3
+#define R8A779A0_PD_A1E1D0C0		4
+#define R8A779A0_PD_A1E1D0C1		5
+#define R8A779A0_PD_A1E1D1C0		6
+#define R8A779A0_PD_A1E1D1C1		7
+#define R8A779A0_PD_A2E0D0		16
+#define R8A779A0_PD_A2E0D1		17
+#define R8A779A0_PD_A2E1D0		18
+#define R8A779A0_PD_A2E1D1		19
+#define R8A779A0_PD_A3E0		20
+#define R8A779A0_PD_A3E1		21
+#define R8A779A0_PD_3DG_A		24
+#define R8A779A0_PD_3DG_B		25
+#define R8A779A0_PD_A1CNN2		32
+#define R8A779A0_PD_A1DSP0		33
+#define R8A779A0_PD_A2IMP01		34
+#define R8A779A0_PD_A2DP0		35
+#define R8A779A0_PD_A2CV0		36
+#define R8A779A0_PD_A2CV1		37
+#define R8A779A0_PD_A2CV4		38
+#define R8A779A0_PD_A2CV6		39
+#define R8A779A0_PD_A2CN2		40
+#define R8A779A0_PD_A1CNN0		41
+#define R8A779A0_PD_A2CN0		42
+#define R8A779A0_PD_A3IR		43
+#define R8A779A0_PD_A1CNN1		44
+#define R8A779A0_PD_A1DSP1		45
+#define R8A779A0_PD_A2IMP23		46
+#define R8A779A0_PD_A2DP1		47
+#define R8A779A0_PD_A2CV2		48
+#define R8A779A0_PD_A2CV3		49
+#define R8A779A0_PD_A2CV5		50
+#define R8A779A0_PD_A2CV7		51
+#define R8A779A0_PD_A2CN1		52
+#define R8A779A0_PD_A3VIP0		56
+#define R8A779A0_PD_A3VIP1		57
+#define R8A779A0_PD_A3VIP2		58
+#define R8A779A0_PD_A3VIP3		59
+#define R8A779A0_PD_A3ISP01		60
+#define R8A779A0_PD_A3ISP23		61
+
+/* Always-on power area */
+#define R8A779A0_PD_ALWAYS_ON		64
+
+#endif /* __DT_BINDINGS_POWER_R8A779A0_SYSC_H__ */
-- 
2.7.4

