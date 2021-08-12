Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A167D3EA382
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 12 Aug 2021 13:24:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236814AbhHLLY7 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 12 Aug 2021 07:24:59 -0400
Received: from leibniz.telenet-ops.be ([195.130.137.77]:53656 "EHLO
        leibniz.telenet-ops.be" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236834AbhHLLYx (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 12 Aug 2021 07:24:53 -0400
Received: from baptiste.telenet-ops.be (baptiste.telenet-ops.be [IPv6:2a02:1800:120:4::f00:13])
        by leibniz.telenet-ops.be (Postfix) with ESMTPS id 4GlkqF2bsKzMrDTk
        for <linux-renesas-soc@vger.kernel.org>; Thu, 12 Aug 2021 13:24:25 +0200 (CEST)
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed20:438:1ff1:1071:f524])
        by baptiste.telenet-ops.be with bizsmtp
        id gbQR2500B1gJxCh01bQR4y; Thu, 12 Aug 2021 13:24:25 +0200
Received: from rox.of.borg ([192.168.97.57])
        by ramsan.of.borg with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
        (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1mE8oy-002Fim-R2; Thu, 12 Aug 2021 13:24:24 +0200
Received: from geert by rox.of.borg with local (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1mE8oy-007469-CO; Thu, 12 Aug 2021 13:24:24 +0200
From:   Geert Uytterhoeven <geert+renesas@glider.be>
To:     Magnus Damm <magnus.damm@gmail.com>,
        Rob Herring <robh+dt@kernel.org>
Cc:     linux-renesas-soc@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Subject: [PATCH v2 27/29] arm64: dts: renesas: Add support for H3ULCB with R-Car H3Ne
Date:   Thu, 12 Aug 2021 13:24:17 +0200
Message-Id: <1858660058f491e5a836d026bd68051f4511d010.1628766192.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1628766192.git.geert+renesas@glider.be>
References: <cover.1628766192.git.geert+renesas@glider.be>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Add support for the Renesas R-Car Starter Kit Premier equipped with an
R-Car H3Ne SiP.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
---
v2:
  - Add Reviewed-by.
---
 arch/arm64/boot/dts/renesas/Makefile          |  1 +
 arch/arm64/boot/dts/renesas/r8a779m8-ulcb.dts | 52 +++++++++++++++++++
 2 files changed, 53 insertions(+)
 create mode 100644 arch/arm64/boot/dts/renesas/r8a779m8-ulcb.dts

diff --git a/arch/arm64/boot/dts/renesas/Makefile b/arch/arm64/boot/dts/renesas/Makefile
index a14642a9e45a2a4b..c7d2b91a833b00b8 100644
--- a/arch/arm64/boot/dts/renesas/Makefile
+++ b/arch/arm64/boot/dts/renesas/Makefile
@@ -92,5 +92,6 @@ dtb-$(CONFIG_ARCH_R8A77990) += r8a779m6-ebisu.dtb
 dtb-$(CONFIG_ARCH_R8A77995) += r8a779m7-draak.dtb
 
 dtb-$(CONFIG_ARCH_R8A77951) += r8a779m8-salvator-xs.dtb
+dtb-$(CONFIG_ARCH_R8A77951) += r8a779m8-ulcb.dtb
 
 dtb-$(CONFIG_ARCH_R9A07G044) += r9a07g044l2-smarc.dtb
diff --git a/arch/arm64/boot/dts/renesas/r8a779m8-ulcb.dts b/arch/arm64/boot/dts/renesas/r8a779m8-ulcb.dts
new file mode 100644
index 0000000000000000..d91ae596a6bf1f02
--- /dev/null
+++ b/arch/arm64/boot/dts/renesas/r8a779m8-ulcb.dts
@@ -0,0 +1,52 @@
+// SPDX-License-Identifier: (GPL-2.0 or MIT)
+/*
+ * Device Tree Source for the H3ULCB (R-Car Starter Kit Premier) with R-Car H3Ne
+ *
+ * Copyright (C) 2021 Glider bv
+ *
+ * Based on r8a77951-ulcb.dts
+ * Copyright (C) 2016 Cogent Embedded, Inc.
+ */
+
+/dts-v1/;
+#include "r8a779m8.dtsi"
+#include "ulcb.dtsi"
+
+/ {
+	model = "Renesas H3ULCB board based on r8a779m8";
+	compatible = "renesas,h3ulcb", "renesas,r8a779m8", "renesas,r8a7795";
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
+		 <&versaclock5 1>,
+		 <&versaclock5 3>,
+		 <&versaclock5 4>,
+		 <&versaclock5 2>;
+	clock-names = "du.0", "du.1", "du.2", "du.3",
+		      "dclkin.0", "dclkin.1", "dclkin.2", "dclkin.3";
+};
-- 
2.25.1

