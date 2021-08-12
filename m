Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2BFA13EA395
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 12 Aug 2021 13:24:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236854AbhHLLZD (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 12 Aug 2021 07:25:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33932 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236885AbhHLLYy (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 12 Aug 2021 07:24:54 -0400
Received: from xavier.telenet-ops.be (xavier.telenet-ops.be [IPv6:2a02:1800:120:4::f00:14])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id ED8B7C0613A1
        for <linux-renesas-soc@vger.kernel.org>; Thu, 12 Aug 2021 04:24:27 -0700 (PDT)
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed20:438:1ff1:1071:f524])
        by xavier.telenet-ops.be with bizsmtp
        id gbQR2501K1gJxCh01bQS3a; Thu, 12 Aug 2021 13:24:26 +0200
Received: from rox.of.borg ([192.168.97.57])
        by ramsan.of.borg with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
        (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1mE8oz-002FjB-Nm; Thu, 12 Aug 2021 13:24:25 +0200
Received: from geert by rox.of.borg with local (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1mE8oy-00744b-0M; Thu, 12 Aug 2021 13:24:24 +0200
From:   Geert Uytterhoeven <geert+renesas@glider.be>
To:     Magnus Damm <magnus.damm@gmail.com>,
        Rob Herring <robh+dt@kernel.org>
Cc:     linux-renesas-soc@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Subject: [PATCH v2 17/29] arm64: dts: renesas: Add support for M3ULCB+Kingfisher with R-Car M3e
Date:   Thu, 12 Aug 2021 13:24:07 +0200
Message-Id: <ee0caf7946b2bef7ba6efb77cd43c2f7f2cb3afc.1628766192.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1628766192.git.geert+renesas@glider.be>
References: <cover.1628766192.git.geert+renesas@glider.be>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Add support for the Renesas R-Car Starter Kit Pro and Kingfisher combo
equipped with an R-Car M3e SiP.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
---
v2:
  - Add Reviewed-by.
---
 arch/arm64/boot/dts/renesas/Makefile           |  1 +
 .../boot/dts/renesas/r8a779m2-ulcb-kf.dts      | 18 ++++++++++++++++++
 2 files changed, 19 insertions(+)
 create mode 100644 arch/arm64/boot/dts/renesas/r8a779m2-ulcb-kf.dts

diff --git a/arch/arm64/boot/dts/renesas/Makefile b/arch/arm64/boot/dts/renesas/Makefile
index eb744f7876751699..b55314feb8abdf98 100644
--- a/arch/arm64/boot/dts/renesas/Makefile
+++ b/arch/arm64/boot/dts/renesas/Makefile
@@ -73,6 +73,7 @@ dtb-$(CONFIG_ARCH_R8A77951) += r8a779m1-ulcb-kf.dtb
 
 dtb-$(CONFIG_ARCH_R8A77961) += r8a779m2-salvator-xs.dtb
 dtb-$(CONFIG_ARCH_R8A77961) += r8a779m2-ulcb.dtb
+dtb-$(CONFIG_ARCH_R8A77961) += r8a779m2-ulcb-kf.dtb
 
 dtb-$(CONFIG_ARCH_R8A77961) += r8a779m3-salvator-xs.dtb
 dtb-$(CONFIG_ARCH_R8A77961) += r8a779m3-ulcb.dtb
diff --git a/arch/arm64/boot/dts/renesas/r8a779m2-ulcb-kf.dts b/arch/arm64/boot/dts/renesas/r8a779m2-ulcb-kf.dts
new file mode 100644
index 0000000000000000..27c642553860fdf8
--- /dev/null
+++ b/arch/arm64/boot/dts/renesas/r8a779m2-ulcb-kf.dts
@@ -0,0 +1,18 @@
+// SPDX-License-Identifier: (GPL-2.0 or MIT)
+/*
+ * Device Tree Source for the M3ULCB Kingfisher board with R-Car M3e
+ *
+ * Copyright (C) 2021 Glider bv
+ *
+ * Based on r8a77961-ulcb-kf.dts
+ * Copyright (C) 2020 Eugeniu Rosca <rosca.eugeniu@gmail.com>
+ */
+
+#include "r8a779m2-ulcb.dts"
+#include "ulcb-kf.dtsi"
+
+/ {
+	model = "Renesas M3ULCB Kingfisher board based on r8a779m2";
+	compatible = "shimafuji,kingfisher", "renesas,m3ulcb",
+		     "renesas,r8a779m2", "renesas,r8a77961";
+};
-- 
2.25.1

