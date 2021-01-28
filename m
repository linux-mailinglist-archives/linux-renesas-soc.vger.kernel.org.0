Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 81677307466
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 28 Jan 2021 12:08:00 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229830AbhA1LGM (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 28 Jan 2021 06:06:12 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55804 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229594AbhA1LGL (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 28 Jan 2021 06:06:11 -0500
Received: from andre.telenet-ops.be (andre.telenet-ops.be [IPv6:2a02:1800:120:4::f00:15])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5D0E7C061573
        for <linux-renesas-soc@vger.kernel.org>; Thu, 28 Jan 2021 03:05:31 -0800 (PST)
Received: from ramsan.of.borg ([84.195.186.194])
        by andre.telenet-ops.be with bizsmtp
        id NB5V2400S4C55Sk01B5VUX; Thu, 28 Jan 2021 12:05:30 +0100
Received: from rox.of.borg ([192.168.97.57])
        by ramsan.of.borg with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
        (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1l557B-001L1j-IL; Thu, 28 Jan 2021 12:05:29 +0100
Received: from geert by rox.of.borg with local (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1l557A-009cta-Sr; Thu, 28 Jan 2021 12:05:28 +0100
From:   Geert Uytterhoeven <geert+renesas@glider.be>
To:     Magnus Damm <magnus.damm@gmail.com>
Cc:     Wolfram Sang <wsa+renesas@sang-engineering.com>,
        linux-renesas-soc@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH/RFC] arm64: dts: renesas: falcon: Add I2C EEPROM nodes
Date:   Thu, 28 Jan 2021 12:05:27 +0100
Message-Id: <20210128110527.2294423-1-geert+renesas@glider.be>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Add device nodes for all I2C EEPROMs on the Falcon board stack.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
Probably we want to move the sub board nodes to separate .dtsi files.

The EEPROM on the CPU board contains some data.
All other EEPROMs are present, but in pristine state (all ones).
---
 .../boot/dts/renesas/r8a779a0-falcon-cpu.dtsi |  7 ++++++
 .../boot/dts/renesas/r8a779a0-falcon.dts      | 23 +++++++++++++++++++
 2 files changed, 30 insertions(+)

diff --git a/arch/arm64/boot/dts/renesas/r8a779a0-falcon-cpu.dtsi b/arch/arm64/boot/dts/renesas/r8a779a0-falcon-cpu.dtsi
index fa284a7260d68251..286a5d5b9b08ff88 100644
--- a/arch/arm64/boot/dts/renesas/r8a779a0-falcon-cpu.dtsi
+++ b/arch/arm64/boot/dts/renesas/r8a779a0-falcon-cpu.dtsi
@@ -82,6 +82,13 @@ &i2c0 {
 
 	status = "okay";
 	clock-frequency = <400000>;
+
+	eeprom@50 {
+		compatible = "rohm,br24g01", "atmel,24c01";
+		label = "cpu-board";
+		reg = <0x50>;
+		pagesize = <8>;
+	};
 };
 
 &i2c1 {
diff --git a/arch/arm64/boot/dts/renesas/r8a779a0-falcon.dts b/arch/arm64/boot/dts/renesas/r8a779a0-falcon.dts
index 5617b81dd7dc3e87..daaa712fafc9d3e2 100644
--- a/arch/arm64/boot/dts/renesas/r8a779a0-falcon.dts
+++ b/arch/arm64/boot/dts/renesas/r8a779a0-falcon.dts
@@ -21,6 +21,29 @@ chosen {
 		stdout-path = "serial0:115200n8";
 	};
 };
+
+&i2c0 {
+	eeprom@51 {
+		compatible = "rohm,br24g01", "atmel,24c01";
+		label = "breakout-board";
+		reg = <0x51>;
+		pagesize = <8>;
+	};
+
+	eeprom@52 {
+		compatible = "rohm,br24g01", "atmel,24c01";
+		label = "csi-dsi-sub-board-id";
+		reg = <0x52>;
+		pagesize = <8>;
+	};
+
+	eeprom@53 {
+		compatible = "rohm,br24g01", "atmel,24c01";
+		label = "ethernet-sub-board-id";
+		reg = <0x53>;
+		pagesize = <8>;
+	};
+};
 
 &rwdt {
 	timeout-sec = <60>;
-- 
2.25.1

