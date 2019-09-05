Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B76A6A9AF7
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  5 Sep 2019 08:58:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730937AbfIEG6r (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 5 Sep 2019 02:58:47 -0400
Received: from relmlor2.renesas.com ([210.160.252.172]:28751 "EHLO
        relmlie6.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1730778AbfIEG6q (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 5 Sep 2019 02:58:46 -0400
X-IronPort-AV: E=Sophos;i="5.64,469,1559487600"; 
   d="scan'208";a="25584386"
Received: from unknown (HELO relmlir5.idc.renesas.com) ([10.200.68.151])
  by relmlie6.idc.renesas.com with ESMTP; 05 Sep 2019 15:58:44 +0900
Received: from be1yocto.ree.adwin.renesas.com (unknown [172.29.43.62])
        by relmlir5.idc.renesas.com (Postfix) with ESMTP id 62B2A400B9F5;
        Thu,  5 Sep 2019 15:58:42 +0900 (JST)
From:   Biju Das <biju.das@bp.renesas.com>
To:     Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>
Cc:     Biju Das <biju.das@bp.renesas.com>, devicetree@vger.kernel.org,
        Simon Horman <horms@verge.net.au>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Fabrizio Castro <fabrizio.castro@bp.renesas.com>,
        linux-renesas-soc@vger.kernel.org
Subject: [PATCH] dt-bindings: power: Add r8a774b1 SYSC power domain definitions
Date:   Thu,  5 Sep 2019 07:52:06 +0100
Message-Id: <1567666326-27373-1-git-send-email-biju.das@bp.renesas.com>
X-Mailer: git-send-email 2.7.4
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

This patch adds power domain indices for RZ/G2N(a.k.a r8a774b1) SoC.

Signed-off-by: Biju Das <biju.das@bp.renesas.com>
---
 include/dt-bindings/power/r8a774b1-sysc.h | 26 ++++++++++++++++++++++++++
 1 file changed, 26 insertions(+)
 create mode 100644 include/dt-bindings/power/r8a774b1-sysc.h

diff --git a/include/dt-bindings/power/r8a774b1-sysc.h b/include/dt-bindings/power/r8a774b1-sysc.h
new file mode 100644
index 0000000..3737364
--- /dev/null
+++ b/include/dt-bindings/power/r8a774b1-sysc.h
@@ -0,0 +1,26 @@
+/* SPDX-License-Identifier: GPL-2.0
+ *
+ * Copyright (C) 2019 Renesas Electronics Corp.
+ */
+#ifndef __DT_BINDINGS_POWER_R8A774B1_SYSC_H__
+#define __DT_BINDINGS_POWER_R8A774B1_SYSC_H__
+
+/*
+ * These power domain indices match the numbers of the interrupt bits
+ * representing the power areas in the various Interrupt Registers
+ * (e.g. SYSCISR, Interrupt Status Register)
+ */
+
+#define R8A774B1_PD_CA57_CPU0		 0
+#define R8A774B1_PD_CA57_CPU1		 1
+#define R8A774B1_PD_A3VP		 9
+#define R8A774B1_PD_CA57_SCU		12
+#define R8A774B1_PD_A3VC		14
+#define R8A774B1_PD_3DG_A		17
+#define R8A774B1_PD_3DG_B		18
+#define R8A774B1_PD_A2VC1		26
+
+/* Always-on power area */
+#define R8A774B1_PD_ALWAYS_ON		32
+
+#endif /* __DT_BINDINGS_POWER_R8A774B1_SYSC_H__ */
-- 
2.7.4

