Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 247D13EA38B
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 12 Aug 2021 13:24:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236910AbhHLLZA (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 12 Aug 2021 07:25:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33900 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236856AbhHLLYx (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 12 Aug 2021 07:24:53 -0400
Received: from baptiste.telenet-ops.be (baptiste.telenet-ops.be [IPv6:2a02:1800:120:4::f00:13])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B7304C0617BB
        for <linux-renesas-soc@vger.kernel.org>; Thu, 12 Aug 2021 04:24:27 -0700 (PDT)
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed20:438:1ff1:1071:f524])
        by baptiste.telenet-ops.be with bizsmtp
        id gbQR250051gJxCh01bQR4w; Thu, 12 Aug 2021 13:24:25 +0200
Received: from rox.of.borg ([192.168.97.57])
        by ramsan.of.borg with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
        (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1mE8oy-002Fim-Np; Thu, 12 Aug 2021 13:24:24 +0200
Received: from geert by rox.of.borg with local (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1mE8oy-00746G-DC; Thu, 12 Aug 2021 13:24:24 +0200
From:   Geert Uytterhoeven <geert+renesas@glider.be>
To:     Magnus Damm <magnus.damm@gmail.com>,
        Rob Herring <robh+dt@kernel.org>
Cc:     linux-renesas-soc@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Subject: [PATCH v2 28/29] arm64: dts: renesas: Add support for H3ULCB+Kingfisher with R-Car H3Ne
Date:   Thu, 12 Aug 2021 13:24:18 +0200
Message-Id: <c4a0d7889c08ec0239e0dda1c31f24c8320b4d98.1628766192.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1628766192.git.geert+renesas@glider.be>
References: <cover.1628766192.git.geert+renesas@glider.be>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Add support for the Renesas R-Car Starter Kit Premier and Kingfisher
combo equipped with an R-Car H3Ne SiP.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
---
v2:
  - Add Reviewed-by.
---
 arch/arm64/boot/dts/renesas/Makefile          |  1 +
 .../boot/dts/renesas/r8a779m8-ulcb-kf.dts     | 19 +++++++++++++++++++
 2 files changed, 20 insertions(+)
 create mode 100644 arch/arm64/boot/dts/renesas/r8a779m8-ulcb-kf.dts

diff --git a/arch/arm64/boot/dts/renesas/Makefile b/arch/arm64/boot/dts/renesas/Makefile
index c7d2b91a833b00b8..498f1c4a3b271b93 100644
--- a/arch/arm64/boot/dts/renesas/Makefile
+++ b/arch/arm64/boot/dts/renesas/Makefile
@@ -93,5 +93,6 @@ dtb-$(CONFIG_ARCH_R8A77995) += r8a779m7-draak.dtb
 
 dtb-$(CONFIG_ARCH_R8A77951) += r8a779m8-salvator-xs.dtb
 dtb-$(CONFIG_ARCH_R8A77951) += r8a779m8-ulcb.dtb
+dtb-$(CONFIG_ARCH_R8A77951) += r8a779m8-ulcb-kf.dtb
 
 dtb-$(CONFIG_ARCH_R9A07G044) += r9a07g044l2-smarc.dtb
diff --git a/arch/arm64/boot/dts/renesas/r8a779m8-ulcb-kf.dts b/arch/arm64/boot/dts/renesas/r8a779m8-ulcb-kf.dts
new file mode 100644
index 0000000000000000..3a2c80fb1a3d271f
--- /dev/null
+++ b/arch/arm64/boot/dts/renesas/r8a779m8-ulcb-kf.dts
@@ -0,0 +1,19 @@
+// SPDX-License-Identifier: (GPL-2.0 or MIT)
+/*
+ * Device Tree Source for the H3ULCB Kingfisher board with R-Car H3Ne
+ *
+ * Copyright (C) 2021 Glider bv
+ *
+ * Based on r8a77951-ulcb-kf.dts
+ * Copyright (C) 2017 Renesas Electronics Corp.
+ * Copyright (C) 2017 Cogent Embedded, Inc.
+ */
+
+#include "r8a779m8-ulcb.dts"
+#include "ulcb-kf.dtsi"
+
+/ {
+	model = "Renesas H3ULCB Kingfisher board based on r8a779m8";
+	compatible = "shimafuji,kingfisher", "renesas,h3ulcb",
+		     "renesas,r8a779m8", "renesas,r8a7795";
+};
-- 
2.25.1

