Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A94925EDD1B
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 28 Sep 2022 14:47:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231759AbiI1MrZ (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 28 Sep 2022 08:47:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55176 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231703AbiI1MrX (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 28 Sep 2022 08:47:23 -0400
Received: from baptiste.telenet-ops.be (baptiste.telenet-ops.be [IPv6:2a02:1800:120:4::f00:13])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5A59F59275
        for <linux-renesas-soc@vger.kernel.org>; Wed, 28 Sep 2022 05:47:22 -0700 (PDT)
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed50:5556:1b6:16f5:2874])
        by baptiste.telenet-ops.be with bizsmtp
        id RQnL2800E40fT9J01QnLpY; Wed, 28 Sep 2022 14:47:20 +0200
Received: from rox.of.borg ([192.168.97.57])
        by ramsan.of.borg with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
        (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1odWTA-0006o0-AB; Wed, 28 Sep 2022 14:47:20 +0200
Received: from geert by rox.of.borg with local (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1odWT9-0032KE-K1; Wed, 28 Sep 2022 14:47:19 +0200
From:   Geert Uytterhoeven <geert+renesas@glider.be>
To:     Magnus Damm <magnus.damm@gmail.com>
Cc:     linux-renesas-soc@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH] arm64: dts: renesas: white-hawk-cpu: Add PCA9654 I/O Expander
Date:   Wed, 28 Sep 2022 14:47:19 +0200
Message-Id: <e75ea6feaedc013c504a032a6cf1cb7dd809ce27.1664369170.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.3 required=5.0 tests=BAYES_00,
        HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_LOW,SPF_HELO_NONE,SPF_NONE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Describe the PCA9654 I/O Expander on the White Hawk CPU board.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
Tested on the White Hawk development board using CP97/CP98[1].
To be queued in renesas-devel for v6.2.

[1] "arm64: dts: renesas: r8a779g0: whitehawk-cpu: Add overlay for CP97/98"
    https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-drivers.git/commit/?h=topic/renesas-overlays&id=df07ccc20a99337a5d80f8e8062dcae3626757ab

 .../boot/dts/renesas/r8a779g0-white-hawk-cpu.dtsi     | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/arch/arm64/boot/dts/renesas/r8a779g0-white-hawk-cpu.dtsi b/arch/arm64/boot/dts/renesas/r8a779g0-white-hawk-cpu.dtsi
index 895f0bd9f754080f..f424b827fcbc7666 100644
--- a/arch/arm64/boot/dts/renesas/r8a779g0-white-hawk-cpu.dtsi
+++ b/arch/arm64/boot/dts/renesas/r8a779g0-white-hawk-cpu.dtsi
@@ -135,6 +135,17 @@ &i2c0 {
 	status = "okay";
 	clock-frequency = <400000>;
 
+	io_expander_a: gpio@20 {
+		compatible = "onnn,pca9654";
+		reg = <0x20>;
+		interrupt-parent = <&gpio0>;
+		interrupts = <0 IRQ_TYPE_LEVEL_LOW>;
+		gpio-controller;
+		#gpio-cells = <2>;
+		interrupt-controller;
+		#interrupt-cells = <2>;
+	};
+
 	eeprom@50 {
 		compatible = "rohm,br24g01", "atmel,24c01";
 		label = "cpu-board";
-- 
2.25.1

