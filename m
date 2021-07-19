Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1771B3CE0EB
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 19 Jul 2021 18:09:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1347075AbhGSPS4 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 19 Jul 2021 11:18:56 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45444 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1345587AbhGSPQs (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 19 Jul 2021 11:16:48 -0400
Received: from baptiste.telenet-ops.be (baptiste.telenet-ops.be [IPv6:2a02:1800:120:4::f00:13])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B8084C0AC0DA
        for <linux-renesas-soc@vger.kernel.org>; Mon, 19 Jul 2021 08:10:55 -0700 (PDT)
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed40:1844:c86f:c84a:fde8])
        by baptiste.telenet-ops.be with bizsmtp
        id X3ek2500S2WKXR1013ekiN; Mon, 19 Jul 2021 17:38:44 +0200
Received: from rox.of.borg ([192.168.97.57])
        by ramsan.of.borg with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
        (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1m5VLv-000skw-Ox; Mon, 19 Jul 2021 17:38:43 +0200
Received: from geert by rox.of.borg with local (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1m5VLu-00Ajl8-Ja; Mon, 19 Jul 2021 17:38:42 +0200
From:   Geert Uytterhoeven <geert+renesas@glider.be>
To:     Magnus Damm <magnus.damm@gmail.com>
Cc:     linux-renesas-soc@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Subject: [PATCH v2 05/10] arm64: dts: renesas: Add support for Salvator-XS with R-Car H3e-2G
Date:   Mon, 19 Jul 2021 17:38:36 +0200
Message-Id: <2a6cc94d27cd87e0231d15c39c5f7cff1e751834.1626708063.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1626708063.git.geert+renesas@glider.be>
References: <cover.1626708063.git.geert+renesas@glider.be>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Add support for the Renesas Salvator-X 2nd version development
board equipped with an R-Car H3e-2G SiP.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Reviewed-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
---
v2:
  - Add Reviewed-by.
---
 arch/arm64/boot/dts/renesas/Makefile          |  2 +
 .../boot/dts/renesas/r8a779m1-salvator-xs.dts | 53 +++++++++++++++++++
 2 files changed, 55 insertions(+)
 create mode 100644 arch/arm64/boot/dts/renesas/r8a779m1-salvator-xs.dts

diff --git a/arch/arm64/boot/dts/renesas/Makefile b/arch/arm64/boot/dts/renesas/Makefile
index 68e30e26564b1276..741801e0ec28da63 100644
--- a/arch/arm64/boot/dts/renesas/Makefile
+++ b/arch/arm64/boot/dts/renesas/Makefile
@@ -63,4 +63,6 @@ dtb-$(CONFIG_ARCH_R8A77995) += r8a77995-draak.dtb
 
 dtb-$(CONFIG_ARCH_R8A779A0) += r8a779a0-falcon.dtb
 
+dtb-$(CONFIG_ARCH_R8A77951) += r8a779m1-salvator-xs.dtb
+
 dtb-$(CONFIG_ARCH_R9A07G044) += r9a07g044l2-smarc.dtb
diff --git a/arch/arm64/boot/dts/renesas/r8a779m1-salvator-xs.dts b/arch/arm64/boot/dts/renesas/r8a779m1-salvator-xs.dts
new file mode 100644
index 0000000000000000..084b75b046802339
--- /dev/null
+++ b/arch/arm64/boot/dts/renesas/r8a779m1-salvator-xs.dts
@@ -0,0 +1,53 @@
+// SPDX-License-Identifier: (GPL-2.0 or MIT)
+/*
+ * Device Tree Source for the Salvator-X 2nd version board with R-Car H3e-2G
+ *
+ * Copyright (C) 2021 Glider bv
+ *
+ * Based on r8a77951-salvator-xs.dts
+ * Copyright (C) 2015-2017 Renesas Electronics Corp.
+ */
+
+/dts-v1/;
+#include "r8a779m1.dtsi"
+#include "salvator-xs.dtsi"
+
+/ {
+	model = "Renesas Salvator-X 2nd version board based on r8a779m1";
+	compatible = "renesas,salvator-xs", "renesas,r8a779m1",
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

