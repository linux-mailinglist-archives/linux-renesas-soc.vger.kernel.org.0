Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 64C423EA36B
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 12 Aug 2021 13:24:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236815AbhHLLYw (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 12 Aug 2021 07:24:52 -0400
Received: from newton.telenet-ops.be ([195.130.132.45]:53174 "EHLO
        newton.telenet-ops.be" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236810AbhHLLYv (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 12 Aug 2021 07:24:51 -0400
Received: from baptiste.telenet-ops.be (baptiste.telenet-ops.be [IPv6:2a02:1800:120:4::f00:13])
        by newton.telenet-ops.be (Postfix) with ESMTPS id 4GlkqF4j0gzMr92x
        for <linux-renesas-soc@vger.kernel.org>; Thu, 12 Aug 2021 13:24:25 +0200 (CEST)
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed20:438:1ff1:1071:f524])
        by baptiste.telenet-ops.be with bizsmtp
        id gbQR2500l1gJxCh01bQR5T; Thu, 12 Aug 2021 13:24:25 +0200
Received: from rox.of.borg ([192.168.97.57])
        by ramsan.of.borg with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
        (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1mE8oz-002Fiw-3I; Thu, 12 Aug 2021 13:24:25 +0200
Received: from geert by rox.of.borg with local (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1mE8ox-007442-Pn; Thu, 12 Aug 2021 13:24:23 +0200
From:   Geert Uytterhoeven <geert+renesas@glider.be>
To:     Magnus Damm <magnus.damm@gmail.com>,
        Rob Herring <robh+dt@kernel.org>
Cc:     linux-renesas-soc@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Subject: [PATCH v2 12/29] arm64: dts: renesas: Add support for Salvator-XS with R-Car H3e
Date:   Thu, 12 Aug 2021 13:24:02 +0200
Message-Id: <aa680c5f52864b0f5f7e2f82993bf92f0b17b680.1628766192.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1628766192.git.geert+renesas@glider.be>
References: <cover.1628766192.git.geert+renesas@glider.be>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Add support for the Renesas Salvator-X 2nd version development
board equipped with an R-Car H3e SiP.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
---
v2:
  - Add Reviewed-by.
---
 arch/arm64/boot/dts/renesas/Makefile          |  2 +
 .../boot/dts/renesas/r8a779m0-salvator-xs.dts | 53 +++++++++++++++++++
 2 files changed, 55 insertions(+)
 create mode 100644 arch/arm64/boot/dts/renesas/r8a779m0-salvator-xs.dts

diff --git a/arch/arm64/boot/dts/renesas/Makefile b/arch/arm64/boot/dts/renesas/Makefile
index 15a53b5139669aa6..69bdf8e92a459f1f 100644
--- a/arch/arm64/boot/dts/renesas/Makefile
+++ b/arch/arm64/boot/dts/renesas/Makefile
@@ -63,6 +63,8 @@ dtb-$(CONFIG_ARCH_R8A77995) += r8a77995-draak.dtb
 
 dtb-$(CONFIG_ARCH_R8A779A0) += r8a779a0-falcon.dtb
 
+dtb-$(CONFIG_ARCH_R8A77951) += r8a779m0-salvator-xs.dtb
+
 dtb-$(CONFIG_ARCH_R8A77951) += r8a779m1-salvator-xs.dtb
 dtb-$(CONFIG_ARCH_R8A77951) += r8a779m1-ulcb.dtb
 dtb-$(CONFIG_ARCH_R8A77951) += r8a779m1-ulcb-kf.dtb
diff --git a/arch/arm64/boot/dts/renesas/r8a779m0-salvator-xs.dts b/arch/arm64/boot/dts/renesas/r8a779m0-salvator-xs.dts
new file mode 100644
index 0000000000000000..571c5e42240a6308
--- /dev/null
+++ b/arch/arm64/boot/dts/renesas/r8a779m0-salvator-xs.dts
@@ -0,0 +1,53 @@
+// SPDX-License-Identifier: (GPL-2.0 or MIT)
+/*
+ * Device Tree Source for the Salvator-X 2nd version board with R-Car H3e
+ *
+ * Copyright (C) 2021 Glider bv
+ *
+ * Based on r8a77951-salvator-xs.dts
+ * Copyright (C) 2015-2017 Renesas Electronics Corp.
+ */
+
+/dts-v1/;
+#include "r8a779m0.dtsi"
+#include "salvator-xs.dtsi"
+
+/ {
+	model = "Renesas Salvator-X 2nd version board based on r8a779m0";
+	compatible = "renesas,salvator-xs", "renesas,r8a779m0",
+		     "renesas,r8a7795";
+
+	memory@48000000 {
+		device_type = "memory";
+		/* first 128MB is reserved for secure area. */
+		reg = <0x0 0x48000000 0x0 0x38000000>;
+	};
+
+	memory@500000000 {
+		device_type = "memory";
+		reg = <0x5 0x00000000 0x0 0x40000000>;
+	};
+
+	memory@600000000 {
+		device_type = "memory";
+		reg = <0x6 0x00000000 0x0 0x40000000>;
+	};
+
+	memory@700000000 {
+		device_type = "memory";
+		reg = <0x7 0x00000000 0x0 0x40000000>;
+	};
+};
+
+&du {
+	clocks = <&cpg CPG_MOD 724>,
+		 <&cpg CPG_MOD 723>,
+		 <&cpg CPG_MOD 722>,
+		 <&cpg CPG_MOD 721>,
+		 <&versaclock6 1>,
+		 <&x21_clk>,
+		 <&x22_clk>,
+		 <&versaclock6 2>;
+	clock-names = "du.0", "du.1", "du.2", "du.3",
+		      "dclkin.0", "dclkin.1", "dclkin.2", "dclkin.3";
+};
-- 
2.25.1

