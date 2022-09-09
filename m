Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B46365B348E
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  9 Sep 2022 11:54:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229614AbiIIJyV (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 9 Sep 2022 05:54:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50782 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229517AbiIIJyK (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 9 Sep 2022 05:54:10 -0400
Received: from laurent.telenet-ops.be (laurent.telenet-ops.be [IPv6:2a02:1800:110:4::f00:19])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4B2E8B0B1D
        for <linux-renesas-soc@vger.kernel.org>; Fri,  9 Sep 2022 02:54:08 -0700 (PDT)
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed50:91db:705e:cfbc:a001])
        by laurent.telenet-ops.be with bizsmtp
        id Hlu62800W0sKggw01lu63y; Fri, 09 Sep 2022 11:54:06 +0200
Received: from rox.of.borg ([192.168.97.57])
        by ramsan.of.borg with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
        (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1oWai6-004bsc-0K; Fri, 09 Sep 2022 11:54:06 +0200
Received: from geert by rox.of.borg with local (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1oWai4-004i4t-Ev; Fri, 09 Sep 2022 11:54:04 +0200
From:   Geert Uytterhoeven <geert+renesas@glider.be>
To:     Magnus Damm <magnus.damm@gmail.com>
Cc:     linux-renesas-soc@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH 08/14] arm64: dts: renesas: white-hawk: Add Ethernet sub-board
Date:   Fri,  9 Sep 2022 11:53:55 +0200
Message-Id: <991600919513dd05a9a7d9c170c6924baf14d1a2.1662715538.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1662715538.git.geert+renesas@glider.be>
References: <cover.1662715538.git.geert+renesas@glider.be>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.4 required=5.0 tests=BAYES_00,
        HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_LOW,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Add a DTS file for the R-Car V4H White Hawk RAVB/Ethernet(1000Base-T1)
sub-board (RTP8A779G0ASKB0SE0SA000), and include it from the main
r8a779g0-white-hawk.dts.

For now its contents are limited to the Board ID EEPROM.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
 .../renesas/r8a779g0-white-hawk-ethernet.dtsi    | 16 ++++++++++++++++
 .../boot/dts/renesas/r8a779g0-white-hawk.dts     |  1 +
 2 files changed, 17 insertions(+)
 create mode 100644 arch/arm64/boot/dts/renesas/r8a779g0-white-hawk-ethernet.dtsi

diff --git a/arch/arm64/boot/dts/renesas/r8a779g0-white-hawk-ethernet.dtsi b/arch/arm64/boot/dts/renesas/r8a779g0-white-hawk-ethernet.dtsi
new file mode 100644
index 0000000000000000..4f411f95c674bd51
--- /dev/null
+++ b/arch/arm64/boot/dts/renesas/r8a779g0-white-hawk-ethernet.dtsi
@@ -0,0 +1,16 @@
+// SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+/*
+ * Device Tree Source for the R-Car V4H White Hawk RAVB/Ethernet(1000Base-T1)
+ * sub-board
+ *
+ * Copyright (C) 2022 Glider bv
+ */
+
+&i2c0 {
+	eeprom@53 {
+		compatible = "rohm,br24g01", "atmel,24c01";
+		label = "ethernet-sub-board-id";
+		reg = <0x53>;
+		pagesize = <8>;
+	};
+};
diff --git a/arch/arm64/boot/dts/renesas/r8a779g0-white-hawk.dts b/arch/arm64/boot/dts/renesas/r8a779g0-white-hawk.dts
index 07b0675ef6b87904..e8be90903081bb5d 100644
--- a/arch/arm64/boot/dts/renesas/r8a779g0-white-hawk.dts
+++ b/arch/arm64/boot/dts/renesas/r8a779g0-white-hawk.dts
@@ -8,6 +8,7 @@
 /dts-v1/;
 #include "r8a779g0-white-hawk-cpu.dtsi"
 #include "r8a779g0-white-hawk-csi-dsi.dtsi"
+#include "r8a779g0-white-hawk-ethernet.dtsi"
 
 / {
 	model = "Renesas White Hawk CPU and Breakout boards based on r8a779g0";
-- 
2.25.1

