Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7DE4836FB3E
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 30 Apr 2021 15:11:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232519AbhD3NLv (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 30 Apr 2021 09:11:51 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58224 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232476AbhD3NLt (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 30 Apr 2021 09:11:49 -0400
Received: from baptiste.telenet-ops.be (baptiste.telenet-ops.be [IPv6:2a02:1800:120:4::f00:13])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5E51BC06138C
        for <linux-renesas-soc@vger.kernel.org>; Fri, 30 Apr 2021 06:11:01 -0700 (PDT)
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed20:d4dd:70b4:3264:8d97])
        by baptiste.telenet-ops.be with bizsmtp
        id z1Az2400k4p6Y38011AzMR; Fri, 30 Apr 2021 15:11:00 +0200
Received: from rox.of.borg ([192.168.97.57])
        by ramsan.of.borg with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
        (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1lcSv5-001f3s-EV; Fri, 30 Apr 2021 15:10:59 +0200
Received: from geert by rox.of.borg with local (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1lcSv4-00FCP8-VN; Fri, 30 Apr 2021 15:10:58 +0200
From:   Geert Uytterhoeven <geert+renesas@glider.be>
To:     Magnus Damm <magnus.damm@gmail.com>
Cc:     linux-renesas-soc@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH 3/5] ARM: dts: blanche: Configure pull-up for SOFT_SW and SW25 GPIO keys
Date:   Fri, 30 Apr 2021 15:10:53 +0200
Message-Id: <011e4c461767f2dd690b655b3dd501eb554184c1.1619785905.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1619785905.git.geert+renesas@glider.be>
References: <cover.1619785905.git.geert+renesas@glider.be>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

The GPIO pins connected to the 4 Software Switches (SW2) and the second
Tact Switch (SW25) do not have external pull-up resistors, but rely on
internal pull-ups being enabled.  Fortunately this is satisfied by the
initial state of these pins.

Make this explicit by enabling bias-pull-up, to remove the dependency on
initial state and/or boot loader configuration.

Note that the GPIO pin connected to the first Tact Switch (SW24) does
have an external pull-up resistor.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
 arch/arm/boot/dts/r8a7792-blanche.dts | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/arch/arm/boot/dts/r8a7792-blanche.dts b/arch/arm/boot/dts/r8a7792-blanche.dts
index c100ae903a46bb1c..62aa9f61321bea74 100644
--- a/arch/arm/boot/dts/r8a7792-blanche.dts
+++ b/arch/arm/boot/dts/r8a7792-blanche.dts
@@ -112,6 +112,9 @@ x2_clk: x2 {
 	keyboard {
 		compatible = "gpio-keys";
 
+		pinctrl-0 = <&keyboard_pins>;
+		pinctrl-names = "default";
+
 		key-1 {
 			linux,code = <KEY_1>;
 			label = "SW2-1";
@@ -235,6 +238,11 @@ du1_pins: du1 {
 		function = "du1";
 	};
 
+	keyboard_pins: keyboard {
+		pins = "GP_3_10", "GP_3_11", "GP_3_12", "GP_3_15", "GP_11_02";
+		bias-pull-up;
+	};
+
 	pmic_irq_pins: pmicirq {
 		groups = "intc_irq2";
 		function = "intc";
-- 
2.25.1

