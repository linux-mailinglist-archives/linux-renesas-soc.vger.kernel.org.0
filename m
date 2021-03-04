Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2725B32D6BB
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  4 Mar 2021 16:34:59 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235066AbhCDPeO (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 4 Mar 2021 10:34:14 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48308 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235196AbhCDPeF (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 4 Mar 2021 10:34:05 -0500
Received: from andre.telenet-ops.be (andre.telenet-ops.be [IPv6:2a02:1800:120:4::f00:15])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9ED28C061762
        for <linux-renesas-soc@vger.kernel.org>; Thu,  4 Mar 2021 07:33:02 -0800 (PST)
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed20:403a:b688:43fc:72a5])
        by andre.telenet-ops.be with bizsmtp
        id cFZ0240080zmvuD01FZ0s6; Thu, 04 Mar 2021 16:33:00 +0100
Received: from rox.of.borg ([192.168.97.57])
        by ramsan.of.borg with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
        (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1lHpyF-004lvP-Lh; Thu, 04 Mar 2021 16:32:59 +0100
Received: from geert by rox.of.borg with local (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1lHpyE-00H216-WD; Thu, 04 Mar 2021 16:32:59 +0100
From:   Geert Uytterhoeven <geert+renesas@glider.be>
To:     Magnus Damm <magnus.damm@gmail.com>
Cc:     Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
        linux-renesas-soc@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH v2 1/3] arm64: dts: renesas: falcon: Add I2C EEPROM nodes
Date:   Thu,  4 Mar 2021 16:32:55 +0100
Message-Id: <20210304153257.4059277-2-geert+renesas@glider.be>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210304153257.4059277-1-geert+renesas@glider.be>
References: <20210304153257.4059277-1-geert+renesas@glider.be>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Add device nodes for the I2C EEPROMs on the Falcon CPU and BreakOut
boards.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
v2:
  - Drop EEPROMs not located on the CPU or BreakOut board.
---
 arch/arm64/boot/dts/renesas/r8a779a0-falcon-cpu.dtsi | 7 +++++++
 arch/arm64/boot/dts/renesas/r8a779a0-falcon.dts      | 9 +++++++++
 2 files changed, 16 insertions(+)

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
index 5617b81dd7dc3e87..2047fc475a524576 100644
--- a/arch/arm64/boot/dts/renesas/r8a779a0-falcon.dts
+++ b/arch/arm64/boot/dts/renesas/r8a779a0-falcon.dts
@@ -22,6 +22,15 @@ chosen {
 	};
 };
 
+&i2c0 {
+	eeprom@51 {
+		compatible = "rohm,br24g01", "atmel,24c01";
+		label = "breakout-board";
+		reg = <0x51>;
+		pagesize = <8>;
+	};
+};
+
 &rwdt {
 	timeout-sec = <60>;
 	status = "okay";
-- 
2.25.1

