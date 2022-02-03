Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 60ED24A87A9
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  3 Feb 2022 16:26:57 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1344047AbiBCP04 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 3 Feb 2022 10:26:56 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42770 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237798AbiBCP0z (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 3 Feb 2022 10:26:55 -0500
Received: from andre.telenet-ops.be (andre.telenet-ops.be [IPv6:2a02:1800:120:4::f00:15])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1FDBDC061714
        for <linux-renesas-soc@vger.kernel.org>; Thu,  3 Feb 2022 07:26:54 -0800 (PST)
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed40:15aa:ab80:d2f:edb])
        by andre.telenet-ops.be with bizsmtp
        id qfSs260074dXKBW01fSsyG; Thu, 03 Feb 2022 16:26:52 +0100
Received: from rox.of.borg ([192.168.97.57])
        by ramsan.of.borg with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
        (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1nFe0Z-00D0pS-Vj; Thu, 03 Feb 2022 16:26:51 +0100
Received: from geert by rox.of.borg with local (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1nFe0Z-002ty4-C7; Thu, 03 Feb 2022 16:26:51 +0100
From:   Geert Uytterhoeven <geert+renesas@glider.be>
To:     Magnus Damm <magnus.damm@gmail.com>
Cc:     Wolfram Sang <wsa+renesas@sang-engineering.com>,
        LUU HOAI <hoai.luu.ub@renesas.com>,
        linux-renesas-soc@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH 3/3] arm64: dts: renesas: spider: Add Ethernet sub-board
Date:   Thu,  3 Feb 2022 16:26:49 +0100
Message-Id: <5aa58816182b34d9e5795bc1e22784f4e4879d13.1643898884.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1643898884.git.geert+renesas@glider.be>
References: <cover.1643898884.git.geert+renesas@glider.be>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Add a DTS file for the Spider Ether TSN sub-board (RTP8A779F0ASKB0ST0S),
and include it from the main r8a779f0-spider.dts.

For now its contents are limited to the Board ID EEPROM.

Extracted from a larger patch in the BSP by LUU HOAI.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
 .../dts/renesas/r8a779f0-spider-ethernet.dtsi     | 15 +++++++++++++++
 arch/arm64/boot/dts/renesas/r8a779f0-spider.dts   |  1 +
 2 files changed, 16 insertions(+)
 create mode 100644 arch/arm64/boot/dts/renesas/r8a779f0-spider-ethernet.dtsi

diff --git a/arch/arm64/boot/dts/renesas/r8a779f0-spider-ethernet.dtsi b/arch/arm64/boot/dts/renesas/r8a779f0-spider-ethernet.dtsi
new file mode 100644
index 0000000000000000..15e8d1ebf575f09a
--- /dev/null
+++ b/arch/arm64/boot/dts/renesas/r8a779f0-spider-ethernet.dtsi
@@ -0,0 +1,15 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Device Tree Source for the Spider Ethernet sub-board
+ *
+ * Copyright (C) 2021 Renesas Electronics Corp.
+ */
+
+&i2c4 {
+	eeprom@52 {
+		compatible = "rohm,br24g01", "atmel,24c01";
+		label = "ethernet-sub-board";
+		reg = <0x52>;
+		pagesize = <8>;
+	};
+};
diff --git a/arch/arm64/boot/dts/renesas/r8a779f0-spider.dts b/arch/arm64/boot/dts/renesas/r8a779f0-spider.dts
index 78c4730538fdc9d3..2e3b719cc749492d 100644
--- a/arch/arm64/boot/dts/renesas/r8a779f0-spider.dts
+++ b/arch/arm64/boot/dts/renesas/r8a779f0-spider.dts
@@ -7,6 +7,7 @@
 
 /dts-v1/;
 #include "r8a779f0-spider-cpu.dtsi"
+#include "r8a779f0-spider-ethernet.dtsi"
 
 / {
 	model = "Renesas Spider CPU and Breakout boards based on r8a779f0";
-- 
2.25.1

