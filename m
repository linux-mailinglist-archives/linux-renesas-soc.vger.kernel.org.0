Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DC0F933D7FF
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 16 Mar 2021 16:47:58 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230157AbhCPPr2 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 16 Mar 2021 11:47:28 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39952 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237430AbhCPPrJ (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 16 Mar 2021 11:47:09 -0400
Received: from michel.telenet-ops.be (michel.telenet-ops.be [IPv6:2a02:1800:110:4::f00:18])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6C4E5C061756
        for <linux-renesas-soc@vger.kernel.org>; Tue, 16 Mar 2021 08:47:09 -0700 (PDT)
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed20:b1e0:9434:c5b6:aecd])
        by michel.telenet-ops.be with bizsmtp
        id h3n72400L0UTkXy063n7Ty; Tue, 16 Mar 2021 16:47:07 +0100
Received: from rox.of.borg ([192.168.97.57])
        by ramsan.of.borg with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
        (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1lMBuU-0089uq-Nu; Tue, 16 Mar 2021 16:47:06 +0100
Received: from geert by rox.of.borg with local (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1lMBuU-00AD5N-7p; Tue, 16 Mar 2021 16:47:06 +0100
From:   Geert Uytterhoeven <geert+renesas@glider.be>
To:     Magnus Damm <magnus.damm@gmail.com>,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Hoang Vo <hoang.vo.eb@renesas.com>
Cc:     linux-renesas-soc@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH 2/3] arm64: dts: renesas: falcon: Move watchdog config to CPU board DTS
Date:   Tue, 16 Mar 2021 16:47:04 +0100
Message-Id: <20210316154705.2433528-3-geert+renesas@glider.be>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210316154705.2433528-1-geert+renesas@glider.be>
References: <20210316154705.2433528-1-geert+renesas@glider.be>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

The 32 kHz oscillator driving the R-Car V3U watchdog is located on the
Falcon CPU board.  Hence move the watchdog configuration from the main
Falcon DTS file to the DTS file that describes the CPU board.

Fixes: d207dc500bbcf8c6 ("arm64: dts: renesas: falcon: Enable watchdog timer")
Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
 arch/arm64/boot/dts/renesas/r8a779a0-falcon-cpu.dtsi | 5 +++++
 arch/arm64/boot/dts/renesas/r8a779a0-falcon.dts      | 5 -----
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/arch/arm64/boot/dts/renesas/r8a779a0-falcon-cpu.dtsi b/arch/arm64/boot/dts/renesas/r8a779a0-falcon-cpu.dtsi
index 44dbd34eecb43fb4..97d40e3e05ff3b1b 100644
--- a/arch/arm64/boot/dts/renesas/r8a779a0-falcon-cpu.dtsi
+++ b/arch/arm64/boot/dts/renesas/r8a779a0-falcon-cpu.dtsi
@@ -186,6 +186,11 @@ scif_clk_pins: scif_clk {
 	};
 };
 
+&rwdt {
+	timeout-sec = <60>;
+	status = "okay";
+};
+
 &scif0 {
 	pinctrl-0 = <&scif0_pins>;
 	pinctrl-names = "default";
diff --git a/arch/arm64/boot/dts/renesas/r8a779a0-falcon.dts b/arch/arm64/boot/dts/renesas/r8a779a0-falcon.dts
index d6a9eddb14d9e9cc..04cd2ae5b4f4892e 100644
--- a/arch/arm64/boot/dts/renesas/r8a779a0-falcon.dts
+++ b/arch/arm64/boot/dts/renesas/r8a779a0-falcon.dts
@@ -27,8 +27,3 @@ eeprom@51 {
 		pagesize = <8>;
 	};
 };
-
-&rwdt {
-	timeout-sec = <60>;
-	status = "okay";
-};
-- 
2.25.1

