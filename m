Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 142F6E1A91
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 23 Oct 2019 14:34:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2389972AbfJWMdq (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 23 Oct 2019 08:33:46 -0400
Received: from laurent.telenet-ops.be ([195.130.137.89]:35714 "EHLO
        laurent.telenet-ops.be" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2391611AbfJWMdq (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 23 Oct 2019 08:33:46 -0400
Received: from ramsan ([84.194.98.4])
        by laurent.telenet-ops.be with bizsmtp
        id H0Zk2100d05gfCL010ZkaV; Wed, 23 Oct 2019 14:33:44 +0200
Received: from rox.of.borg ([192.168.97.57])
        by ramsan with esmtp (Exim 4.90_1)
        (envelope-from <geert@linux-m68k.org>)
        id 1iNFpg-0003uD-4t; Wed, 23 Oct 2019 14:33:44 +0200
Received: from geert by rox.of.borg with local (Exim 4.90_1)
        (envelope-from <geert@linux-m68k.org>)
        id 1iNFpg-0003Qc-3g; Wed, 23 Oct 2019 14:33:44 +0200
From:   Geert Uytterhoeven <geert+renesas@glider.be>
To:     Magnus Damm <magnus.damm@gmail.com>
Cc:     Eugeniu Rosca <erosca@de.adit-jv.com>,
        linux-renesas-soc@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH v2 09/11] arm64: dts: renesas: Add support for Salvator-XS with R-Car M3-W+
Date:   Wed, 23 Oct 2019 14:33:40 +0200
Message-Id: <20191023123342.13100-10-geert+renesas@glider.be>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20191023123342.13100-1-geert+renesas@glider.be>
References: <20191023123342.13100-1-geert+renesas@glider.be>
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Add initial support for the Renesas Salvator-X 2nd version development
board equipped with an R-Car M3-W+ SiP with 8 (2 x 4) GiB of RAM.

The memory map is as follows:
  - Bank0: 4GiB RAM : 0x000048000000 -> 0x000bfffffff
		      0x000480000000 -> 0x004ffffffff
  - Bank1: 4GiB RAM : 0x000600000000 -> 0x006ffffffff

Based on a patch in the BSP by Takeshi Kihara
<takeshi.kihara.df@renesas.com>.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
Reviewed-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Tested-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
---
v2:
  - Add Reviewed-by, Tested-by.
---
 arch/arm64/boot/dts/renesas/Makefile          |  1 +
 .../boot/dts/renesas/r8a77961-salvator-xs.dts | 31 +++++++++++++++++++
 2 files changed, 32 insertions(+)
 create mode 100644 arch/arm64/boot/dts/renesas/r8a77961-salvator-xs.dts

diff --git a/arch/arm64/boot/dts/renesas/Makefile b/arch/arm64/boot/dts/renesas/Makefile
index 937a3e4c3fadebb3..8fdbd2267384186b 100644
--- a/arch/arm64/boot/dts/renesas/Makefile
+++ b/arch/arm64/boot/dts/renesas/Makefile
@@ -15,6 +15,7 @@ dtb-$(CONFIG_ARCH_R8A7796) += r8a7796-salvator-xs.dtb
 dtb-$(CONFIG_ARCH_R8A77960) += r8a7796-salvator-x.dtb r8a7796-m3ulcb.dtb
 dtb-$(CONFIG_ARCH_R8A77960) += r8a7796-m3ulcb-kf.dtb
 dtb-$(CONFIG_ARCH_R8A77960) += r8a7796-salvator-xs.dtb
+dtb-$(CONFIG_ARCH_R8A77961) += r8a77961-salvator-xs.dtb
 dtb-$(CONFIG_ARCH_R8A77965) += r8a77965-salvator-x.dtb r8a77965-salvator-xs.dtb
 dtb-$(CONFIG_ARCH_R8A77965) += r8a77965-m3nulcb.dtb
 dtb-$(CONFIG_ARCH_R8A77965) += r8a77965-m3nulcb-kf.dtb
diff --git a/arch/arm64/boot/dts/renesas/r8a77961-salvator-xs.dts b/arch/arm64/boot/dts/renesas/r8a77961-salvator-xs.dts
new file mode 100644
index 0000000000000000..4abd78ac1cd597d9
--- /dev/null
+++ b/arch/arm64/boot/dts/renesas/r8a77961-salvator-xs.dts
@@ -0,0 +1,31 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Device Tree Source for the Salvator-X 2nd version board with R-Car M3-W+
+ *
+ * Copyright (C) 2018 Renesas Electronics Corp.
+ */
+
+/dts-v1/;
+#include "r8a77961.dtsi"
+#include "salvator-xs.dtsi"
+
+/ {
+	model = "Renesas Salvator-X 2nd version board based on r8a77961";
+	compatible = "renesas,salvator-xs", "renesas,r8a77961";
+
+	memory@48000000 {
+		device_type = "memory";
+		/* first 128MB is reserved for secure area. */
+		reg = <0x0 0x48000000 0x0 0x78000000>;
+	};
+
+	memory@400000000 {
+		device_type = "memory";
+		reg = <0x4 0x80000000 0x0 0x80000000>;
+	};
+
+	memory@600000000 {
+		device_type = "memory";
+		reg = <0x6 0x00000000 0x1 0x00000000>;
+	};
+};
-- 
2.17.1

