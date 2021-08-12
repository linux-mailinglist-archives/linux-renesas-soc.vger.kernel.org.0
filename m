Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 234783EA36E
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 12 Aug 2021 13:24:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236845AbhHLLYx (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 12 Aug 2021 07:24:53 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33888 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236819AbhHLLYw (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 12 Aug 2021 07:24:52 -0400
Received: from newton.telenet-ops.be (newton.telenet-ops.be [IPv6:2a02:1800:120:4::f00:d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5D5FCC06179B
        for <linux-renesas-soc@vger.kernel.org>; Thu, 12 Aug 2021 04:24:27 -0700 (PDT)
Received: from baptiste.telenet-ops.be (baptiste.telenet-ops.be [IPv6:2a02:1800:120:4::f00:13])
        by newton.telenet-ops.be (Postfix) with ESMTPS id 4GlkqF5shfzMrBZs
        for <linux-renesas-soc@vger.kernel.org>; Thu, 12 Aug 2021 13:24:25 +0200 (CEST)
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed20:438:1ff1:1071:f524])
        by baptiste.telenet-ops.be with bizsmtp
        id gbQR2500w1gJxCh01bQR5e; Thu, 12 Aug 2021 13:24:25 +0200
Received: from rox.of.borg ([192.168.97.57])
        by ramsan.of.borg with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
        (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1mE8oz-002FjR-AE; Thu, 12 Aug 2021 13:24:25 +0200
Received: from geert by rox.of.borg with local (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1mE8oy-00745c-7j; Thu, 12 Aug 2021 13:24:24 +0200
From:   Geert Uytterhoeven <geert+renesas@glider.be>
To:     Magnus Damm <magnus.damm@gmail.com>,
        Rob Herring <robh+dt@kernel.org>
Cc:     linux-renesas-soc@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Subject: [PATCH v2 24/29] arm64: dts: renesas: Add support for Ebisu with R-Car E3e
Date:   Thu, 12 Aug 2021 13:24:14 +0200
Message-Id: <aa90507abc4f3c4bca478884c3611bf4c5a346c0.1628766192.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1628766192.git.geert+renesas@glider.be>
References: <cover.1628766192.git.geert+renesas@glider.be>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Add support for the Renesas Ebisu development board equipped with an
R-Car E3e SoC.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
---
v2:
  - Add Reviewed-by.
---
 arch/arm64/boot/dts/renesas/Makefile           |  2 ++
 arch/arm64/boot/dts/renesas/r8a779m6-ebisu.dts | 18 ++++++++++++++++++
 2 files changed, 20 insertions(+)
 create mode 100644 arch/arm64/boot/dts/renesas/r8a779m6-ebisu.dts

diff --git a/arch/arm64/boot/dts/renesas/Makefile b/arch/arm64/boot/dts/renesas/Makefile
index 13446aecdfccb080..c28c36efa10021c5 100644
--- a/arch/arm64/boot/dts/renesas/Makefile
+++ b/arch/arm64/boot/dts/renesas/Makefile
@@ -87,4 +87,6 @@ dtb-$(CONFIG_ARCH_R8A77965) += r8a779m5-salvator-xs.dtb
 dtb-$(CONFIG_ARCH_R8A77965) += r8a779m5-ulcb.dtb
 dtb-$(CONFIG_ARCH_R8A77965) += r8a779m5-ulcb-kf.dtb
 
+dtb-$(CONFIG_ARCH_R8A77990) += r8a779m6-ebisu.dtb
+
 dtb-$(CONFIG_ARCH_R9A07G044) += r9a07g044l2-smarc.dtb
diff --git a/arch/arm64/boot/dts/renesas/r8a779m6-ebisu.dts b/arch/arm64/boot/dts/renesas/r8a779m6-ebisu.dts
new file mode 100644
index 0000000000000000..baff1f823546d85e
--- /dev/null
+++ b/arch/arm64/boot/dts/renesas/r8a779m6-ebisu.dts
@@ -0,0 +1,18 @@
+// SPDX-License-Identifier: (GPL-2.0 or MIT)
+/*
+ * Device Tree Source for the Ebisu board with R-Car E3e
+ *
+ * Copyright (C) 2021 Glider bv
+ *
+ * Based on r8a77990-ebisu.dts
+ * Copyright (C) 2018 Renesas Electronics Corp.
+ */
+
+/dts-v1/;
+#include "r8a779m6.dtsi"
+#include "ebisu.dtsi"
+
+/ {
+	model = "Renesas Ebisu board based on r8a779m6";
+	compatible = "renesas,ebisu", "renesas,r8a779m6", "renesas,r8a77990";
+};
-- 
2.25.1

