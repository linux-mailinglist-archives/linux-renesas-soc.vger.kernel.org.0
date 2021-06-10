Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CBA063A2870
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 10 Jun 2021 11:37:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230201AbhFJJjm (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 10 Jun 2021 05:39:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37444 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230203AbhFJJji (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 10 Jun 2021 05:39:38 -0400
Received: from michel.telenet-ops.be (michel.telenet-ops.be [IPv6:2a02:1800:110:4::f00:18])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D9021C0611C1
        for <linux-renesas-soc@vger.kernel.org>; Thu, 10 Jun 2021 02:37:41 -0700 (PDT)
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed20:a946:bccb:b1a1:3055])
        by michel.telenet-ops.be with bizsmtp
        id FMde2500N0wnyou06Mdel8; Thu, 10 Jun 2021 11:37:39 +0200
Received: from rox.of.borg ([192.168.97.57])
        by ramsan.of.borg with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
        (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1lrH86-00FDXB-H2; Thu, 10 Jun 2021 11:37:38 +0200
Received: from geert by rox.of.borg with local (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1lrH85-00BTmc-UT; Thu, 10 Jun 2021 11:37:37 +0200
From:   Geert Uytterhoeven <geert+renesas@glider.be>
To:     Magnus Damm <magnus.damm@gmail.com>,
        Rob Herring <robh+dt@kernel.org>
Cc:     linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH 12/14] arm64: dts: renesas: Add support for M3ULCB+Kingfisher with R-Car M3e-2G
Date:   Thu, 10 Jun 2021 11:37:25 +0200
Message-Id: <82fcc6ca4df7a8c40c34ce7bd39c3d9ab171f2bf.1623315732.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1623315732.git.geert+renesas@glider.be>
References: <cover.1623315732.git.geert+renesas@glider.be>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Add support for the Renesas R-Car Starter Kit Pro and Kingfisher combo
equipped with an R-Car M3e-2G SiP.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
 arch/arm64/boot/dts/renesas/Makefile           |  1 +
 .../boot/dts/renesas/r8a779m3-ulcb-kf.dts      | 18 ++++++++++++++++++
 2 files changed, 19 insertions(+)
 create mode 100644 arch/arm64/boot/dts/renesas/r8a779m3-ulcb-kf.dts

diff --git a/arch/arm64/boot/dts/renesas/Makefile b/arch/arm64/boot/dts/renesas/Makefile
index f29dd27692ba4a66..5c73eb7baeadc8c4 100644
--- a/arch/arm64/boot/dts/renesas/Makefile
+++ b/arch/arm64/boot/dts/renesas/Makefile
@@ -69,3 +69,4 @@ dtb-$(CONFIG_ARCH_R8A77951) += r8a779m1-ulcb-kf.dtb
 
 dtb-$(CONFIG_ARCH_R8A77961) += r8a779m3-salvator-xs.dtb
 dtb-$(CONFIG_ARCH_R8A77961) += r8a779m3-ulcb.dtb
+dtb-$(CONFIG_ARCH_R8A77961) += r8a779m3-ulcb-kf.dtb
diff --git a/arch/arm64/boot/dts/renesas/r8a779m3-ulcb-kf.dts b/arch/arm64/boot/dts/renesas/r8a779m3-ulcb-kf.dts
new file mode 100644
index 0000000000000000..6bacee1d2ef5c857
--- /dev/null
+++ b/arch/arm64/boot/dts/renesas/r8a779m3-ulcb-kf.dts
@@ -0,0 +1,18 @@
+// SPDX-License-Identifier: (GPL-2.0 or MIT)
+/*
+ * Device Tree Source for the M3ULCB Kingfisher board with R-Car M3e-2G
+ *
+ * Copyright (C) 2021 Glider bv
+ *
+ * Based on r8a77961-ulcb-kf.dts
+ * Copyright (C) 2020 Eugeniu Rosca <rosca.eugeniu@gmail.com>
+ */
+
+#include "r8a779m3-ulcb.dts"
+#include "ulcb-kf.dtsi"
+
+/ {
+	model = "Renesas M3ULCB Kingfisher board based on r8a779m3";
+	compatible = "shimafuji,kingfisher", "renesas,m3ulcb",
+		     "renesas,r8a779m3", "renesas,r8a77961";
+};
-- 
2.25.1

