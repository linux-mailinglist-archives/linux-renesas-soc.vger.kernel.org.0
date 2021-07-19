Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B9B233CE0DC
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 19 Jul 2021 18:09:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1347287AbhGSPSi (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 19 Jul 2021 11:18:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44970 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1347424AbhGSPQR (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 19 Jul 2021 11:16:17 -0400
Received: from andre.telenet-ops.be (andre.telenet-ops.be [IPv6:2a02:1800:120:4::f00:15])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F1B84C0AC0CC
        for <linux-renesas-soc@vger.kernel.org>; Mon, 19 Jul 2021 08:10:54 -0700 (PDT)
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed40:1844:c86f:c84a:fde8])
        by andre.telenet-ops.be with bizsmtp
        id X3ej2501P2WKXR1013ekz9; Mon, 19 Jul 2021 17:38:44 +0200
Received: from rox.of.borg ([192.168.97.57])
        by ramsan.of.borg with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
        (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1m5VLv-000sl1-JZ; Mon, 19 Jul 2021 17:38:43 +0200
Received: from geert by rox.of.borg with local (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1m5VLu-00Ajlh-PM; Mon, 19 Jul 2021 17:38:42 +0200
From:   Geert Uytterhoeven <geert+renesas@glider.be>
To:     Magnus Damm <magnus.damm@gmail.com>
Cc:     linux-renesas-soc@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Subject: [PATCH v2 10/10] arm64: dts: renesas: Add support for M3ULCB+Kingfisher with R-Car M3e-2G
Date:   Mon, 19 Jul 2021 17:38:41 +0200
Message-Id: <54262b64be6d5c7a7ede3302259e9d15218d48a0.1626708063.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1626708063.git.geert+renesas@glider.be>
References: <cover.1626708063.git.geert+renesas@glider.be>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Add support for the Renesas R-Car Starter Kit Pro and Kingfisher combo
equipped with an R-Car M3e-2G SiP.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
---
v2:
  - Add Reviewed-by.
---
 arch/arm64/boot/dts/renesas/Makefile           |  1 +
 .../boot/dts/renesas/r8a779m3-ulcb-kf.dts      | 18 ++++++++++++++++++
 2 files changed, 19 insertions(+)
 create mode 100644 arch/arm64/boot/dts/renesas/r8a779m3-ulcb-kf.dts

diff --git a/arch/arm64/boot/dts/renesas/Makefile b/arch/arm64/boot/dts/renesas/Makefile
index 8a2bec836d305064..15a53b5139669aa6 100644
--- a/arch/arm64/boot/dts/renesas/Makefile
+++ b/arch/arm64/boot/dts/renesas/Makefile
@@ -69,5 +69,6 @@ dtb-$(CONFIG_ARCH_R8A77951) += r8a779m1-ulcb-kf.dtb
 
 dtb-$(CONFIG_ARCH_R8A77961) += r8a779m3-salvator-xs.dtb
 dtb-$(CONFIG_ARCH_R8A77961) += r8a779m3-ulcb.dtb
+dtb-$(CONFIG_ARCH_R8A77961) += r8a779m3-ulcb-kf.dtb
 
 dtb-$(CONFIG_ARCH_R9A07G044) += r9a07g044l2-smarc.dtb
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

