Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C3FF9E1A09
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 23 Oct 2019 14:29:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2391312AbfJWM30 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 23 Oct 2019 08:29:26 -0400
Received: from xavier.telenet-ops.be ([195.130.132.52]:39200 "EHLO
        xavier.telenet-ops.be" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725947AbfJWM3Z (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 23 Oct 2019 08:29:25 -0400
Received: from ramsan ([84.194.98.4])
        by xavier.telenet-ops.be with bizsmtp
        id H0VK2100A05gfCL010VKSW; Wed, 23 Oct 2019 14:29:23 +0200
Received: from rox.of.borg ([192.168.97.57])
        by ramsan with esmtp (Exim 4.90_1)
        (envelope-from <geert@linux-m68k.org>)
        id 1iNFlP-0000Fs-7w; Wed, 23 Oct 2019 14:29:19 +0200
Received: from geert by rox.of.borg with local (Exim 4.90_1)
        (envelope-from <geert@linux-m68k.org>)
        id 1iNFlP-0003BL-6Y; Wed, 23 Oct 2019 14:29:19 +0200
From:   Geert Uytterhoeven <geert+renesas@glider.be>
To:     Magnus Damm <magnus.damm@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>
Cc:     Philipp Zabel <p.zabel@pengutronix.de>,
        Eugeniu Rosca <erosca@de.adit-jv.com>,
        devicetree@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH v2 5/5] dt-bindings: power: Add r8a77961 SYSC power domain definitions
Date:   Wed, 23 Oct 2019 14:29:11 +0200
Message-Id: <20191023122911.12166-6-geert+renesas@glider.be>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20191023122911.12166-1-geert+renesas@glider.be>
References: <20191023122911.12166-1-geert+renesas@glider.be>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Add power domain indices for the R-Car M3-W+ (R8A77961) SoC.

Based on Rev. 2.00 of the R-Car Series, 3rd Generation, Hardware User’s
Manual (Jul. 31, 2019).

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
Reviewed-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
---
v2:
  - Add Reviewed-by.
---
 include/dt-bindings/power/r8a77961-sysc.h | 32 +++++++++++++++++++++++
 1 file changed, 32 insertions(+)
 create mode 100644 include/dt-bindings/power/r8a77961-sysc.h

diff --git a/include/dt-bindings/power/r8a77961-sysc.h b/include/dt-bindings/power/r8a77961-sysc.h
new file mode 100644
index 0000000000000000..7a3800996f7c0252
--- /dev/null
+++ b/include/dt-bindings/power/r8a77961-sysc.h
@@ -0,0 +1,32 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+/*
+ * Copyright (C) 2019 Glider bvba
+ */
+#ifndef __DT_BINDINGS_POWER_R8A77961_SYSC_H__
+#define __DT_BINDINGS_POWER_R8A77961_SYSC_H__
+
+/*
+ * These power domain indices match the numbers of the interrupt bits
+ * representing the power areas in the various Interrupt Registers
+ * (e.g. SYSCISR, Interrupt Status Register)
+ */
+
+#define R8A77961_PD_CA57_CPU0		 0
+#define R8A77961_PD_CA57_CPU1		 1
+#define R8A77961_PD_CA53_CPU0		 5
+#define R8A77961_PD_CA53_CPU1		 6
+#define R8A77961_PD_CA53_CPU2		 7
+#define R8A77961_PD_CA53_CPU3		 8
+#define R8A77961_PD_CA57_SCU		12
+#define R8A77961_PD_CR7			13
+#define R8A77961_PD_A3VC		14
+#define R8A77961_PD_3DG_A		17
+#define R8A77961_PD_3DG_B		18
+#define R8A77961_PD_CA53_SCU		21
+#define R8A77961_PD_A3IR		24
+#define R8A77961_PD_A2VC1		26
+
+/* Always-on power area */
+#define R8A77961_PD_ALWAYS_ON		32
+
+#endif /* __DT_BINDINGS_POWER_R8A77961_SYSC_H__ */
-- 
2.17.1

