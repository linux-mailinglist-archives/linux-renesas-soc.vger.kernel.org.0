Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7597717D96E
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  9 Mar 2020 07:49:39 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726248AbgCIGti (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 9 Mar 2020 02:49:38 -0400
Received: from relmlor1.renesas.com ([210.160.252.171]:8724 "EHLO
        relmlie5.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1725942AbgCIGti (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 9 Mar 2020 02:49:38 -0400
X-IronPort-AV: E=Sophos;i="5.70,532,1574089200"; 
   d="scan'208";a="41360339"
Received: from unknown (HELO relmlir5.idc.renesas.com) ([10.200.68.151])
  by relmlie5.idc.renesas.com with ESMTP; 09 Mar 2020 15:49:36 +0900
Received: from localhost.localdomain (unknown [10.166.15.86])
        by relmlir5.idc.renesas.com (Postfix) with ESMTP id CB43F400618F;
        Mon,  9 Mar 2020 15:49:36 +0900 (JST)
From:   Yuya Hamamachi <yuya.hamamachi.sx@renesas.com>
To:     linux-renesas-soc@vger.kernel.org
Cc:     Yuya Hamamachi <yuya.hamamachi.sx@renesas.com>
Subject: [PATCH 2/2] arm64: dts: renesas: Add support for M3ULCB with R-Car M3-W+
Date:   Mon,  9 Mar 2020 15:44:25 +0900
Message-Id: <20200309064425.25437-3-yuya.hamamachi.sx@renesas.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200309064425.25437-1-yuya.hamamachi.sx@renesas.com>
References: <20200309064425.25437-1-yuya.hamamachi.sx@renesas.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Add initial support for the Renesas M3ULCB board equipped with an R-Car
M3-W+ SiP with 8 (2 x 4) GiB of RAM.
To avoid build error on 'ulcb.dtsi', ssi2 is added into 'r8a77961.dtsi'.

Based on commit 92980759c1699a3c10beb00f411270197ac89544
("arm64: dts: renesas: Add support for Salvator-XS with R-Car M3-W+").

Signed-off-by: Yuya Hamamachi <yuya.hamamachi.sx@renesas.com>
---
 arch/arm64/boot/dts/renesas/Makefile          |  1 +
 arch/arm64/boot/dts/renesas/r8a77961-ulcb.dts | 31 +++++++++++++++++++
 arch/arm64/boot/dts/renesas/r8a77961.dtsi     |  1 +
 3 files changed, 33 insertions(+)
 create mode 100644 arch/arm64/boot/dts/renesas/r8a77961-ulcb.dts

diff --git a/arch/arm64/boot/dts/renesas/Makefile b/arch/arm64/boot/dts/renesas/Makefile
index 94d5ad03197d..a4c77d095ffb 100644
--- a/arch/arm64/boot/dts/renesas/Makefile
+++ b/arch/arm64/boot/dts/renesas/Makefile
@@ -12,6 +12,7 @@ dtb-$(CONFIG_ARCH_R8A77951) += r8a77951-ulcb.dtb r8a77951-ulcb-kf.dtb
 dtb-$(CONFIG_ARCH_R8A77960) += r8a77960-salvator-x.dtb r8a77960-salvator-xs.dtb
 dtb-$(CONFIG_ARCH_R8A77960) += r8a77960-ulcb.dtb r8a77960-ulcb-kf.dtb
 dtb-$(CONFIG_ARCH_R8A77961) += r8a77961-salvator-xs.dtb
+dtb-$(CONFIG_ARCH_R8A77961) += r8a77961-ulcb.dtb
 dtb-$(CONFIG_ARCH_R8A77965) += r8a77965-salvator-x.dtb r8a77965-salvator-xs.dtb
 dtb-$(CONFIG_ARCH_R8A77965) += r8a77965-ulcb.dtb r8a77965-ulcb-kf.dtb
 dtb-$(CONFIG_ARCH_R8A77970) += r8a77970-eagle.dtb r8a77970-v3msk.dtb
diff --git a/arch/arm64/boot/dts/renesas/r8a77961-ulcb.dts b/arch/arm64/boot/dts/renesas/r8a77961-ulcb.dts
new file mode 100644
index 000000000000..7db5c53dc8fc
--- /dev/null
+++ b/arch/arm64/boot/dts/renesas/r8a77961-ulcb.dts
@@ -0,0 +1,31 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Device Tree Source for the M3ULCB (R-Car Starter Kit Pro) board with R-Car M3-W+
+ *
+ * Copyright (C) 2020 Renesas Electronics Corp.
+ */
+
+/dts-v1/;
+#include "r8a77961.dtsi"
+#include "ulcb.dtsi"
+
+/ {
+	model = "Renesas M3ULCB board based on r8a77961";
+	compatible = "renesas,m3ulcb", "renesas,r8a77961";
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
diff --git a/arch/arm64/boot/dts/renesas/r8a77961.dtsi b/arch/arm64/boot/dts/renesas/r8a77961.dtsi
index b6915319a61c..dce2a7d55ae5 100644
--- a/arch/arm64/boot/dts/renesas/r8a77961.dtsi
+++ b/arch/arm64/boot/dts/renesas/r8a77961.dtsi
@@ -870,6 +870,7 @@ rcar_sound,src {
 			rcar_sound,ssi {
 				ssi0: ssi-0 { };
 				ssi1: ssi-1 { };
+				ssi2: ssi-2 { };
 			};
 		};
 
-- 
2.25.1

