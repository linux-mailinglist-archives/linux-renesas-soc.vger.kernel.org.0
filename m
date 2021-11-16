Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F0F21452BF5
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 16 Nov 2021 08:44:12 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231470AbhKPHpv (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 16 Nov 2021 02:45:51 -0500
Received: from relmlor2.renesas.com ([210.160.252.172]:3759 "EHLO
        relmlie6.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S231367AbhKPHpn (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 16 Nov 2021 02:45:43 -0500
X-IronPort-AV: E=Sophos;i="5.87,238,1631545200"; 
   d="scan'208";a="100767136"
Received: from unknown (HELO relmlir5.idc.renesas.com) ([10.200.68.151])
  by relmlie6.idc.renesas.com with ESMTP; 16 Nov 2021 16:42:37 +0900
Received: from localhost.localdomain (unknown [10.166.14.185])
        by relmlir5.idc.renesas.com (Postfix) with ESMTP id C25A2400C4FD;
        Tue, 16 Nov 2021 16:42:37 +0900 (JST)
From:   Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
To:     geert+renesas@glider.be, magnus.damm@gmail.com, robh+dt@kernel.org,
        gregkh@linuxfoundation.org, jirislaby@kernel.org
Cc:     linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org,
        linux-serial@vger.kernel.org,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Subject: [PATCH 05/16] dt-bindings: power: Add r8a779f0 SYSC power domain definitions
Date:   Tue, 16 Nov 2021 16:41:19 +0900
Message-Id: <20211116074130.107554-6-yoshihiro.shimoda.uh@renesas.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211116074130.107554-1-yoshihiro.shimoda.uh@renesas.com>
References: <20211116074130.107554-1-yoshihiro.shimoda.uh@renesas.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Add power domain indices for R-Car S4-8 (r8a779f0).

Signed-off-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
---
 include/dt-bindings/power/r8a779f0-sysc.h | 30 +++++++++++++++++++++++
 1 file changed, 30 insertions(+)
 create mode 100644 include/dt-bindings/power/r8a779f0-sysc.h

diff --git a/include/dt-bindings/power/r8a779f0-sysc.h b/include/dt-bindings/power/r8a779f0-sysc.h
new file mode 100644
index 000000000000..97e6ed5c16d5
--- /dev/null
+++ b/include/dt-bindings/power/r8a779f0-sysc.h
@@ -0,0 +1,30 @@
+/* SPDX-License-Identifier: (GPL-2.0 or MIT) */
+/*
+ * Copyright (C) 2021 Renesas Electronics Corp.
+ */
+#ifndef __DT_BINDINGS_POWER_R8A779F0_SYSC_H__
+#define __DT_BINDINGS_POWER_R8A779F0_SYSC_H__
+
+/*
+ * These power domain indices match the Power Domain Register Numbers (PDR)
+ */
+
+#define R8A779F0_PD_A1E0D0C0		0
+#define R8A779F0_PD_A1E0D0C1		1
+#define R8A779F0_PD_A1E0D1C0		2
+#define R8A779F0_PD_A1E0D1C1		3
+#define R8A779F0_PD_A1E1D0C0		4
+#define R8A779F0_PD_A1E1D0C1		5
+#define R8A779F0_PD_A1E1D1C0		6
+#define R8A779F0_PD_A1E1D1C1		7
+#define R8A779F0_PD_A2E0D0		16
+#define R8A779F0_PD_A2E0D1		17
+#define R8A779F0_PD_A2E1D0		18
+#define R8A779F0_PD_A2E1D1		19
+#define R8A779F0_PD_A3E0		20
+#define R8A779F0_PD_A3E1		21
+
+/* Always-on power area */
+#define R8A779F0_PD_ALWAYS_ON		22
+
+#endif /* __DT_BINDINGS_POWER_R8A779A0_SYSC_H__*/
-- 
2.25.1

