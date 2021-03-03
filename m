Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2D5B732C62F
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  4 Mar 2021 02:02:02 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1351458AbhCDA14 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 3 Mar 2021 19:27:56 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50040 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1381657AbhCCNaf (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 3 Mar 2021 08:30:35 -0500
Received: from laurent.telenet-ops.be (laurent.telenet-ops.be [IPv6:2a02:1800:110:4::f00:19])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6021DC061756
        for <linux-renesas-soc@vger.kernel.org>; Wed,  3 Mar 2021 05:29:45 -0800 (PST)
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed20:cd47:42a6:c822:e50b])
        by laurent.telenet-ops.be with bizsmtp
        id bpVj2400d4huzR801pVjVg; Wed, 03 Mar 2021 14:29:44 +0100
Received: from rox.of.borg ([192.168.97.57])
        by ramsan.of.borg with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
        (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1lHRZP-004Pt3-Az; Wed, 03 Mar 2021 14:29:43 +0100
Received: from geert by rox.of.borg with local (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1lHRZO-00GWbD-So; Wed, 03 Mar 2021 14:29:42 +0100
From:   Geert Uytterhoeven <geert+renesas@glider.be>
To:     Magnus Damm <magnus.damm@gmail.com>
Cc:     Ulrich Hecht <uli+renesas@fpond.eu>,
        Linus Walleij <linus.walleij@linaro.org>,
        linux-renesas-soc@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH] ARM: dts: koelsch: Configure pull-up for SOFT_SW GPIO keys
Date:   Wed,  3 Mar 2021 14:29:41 +0100
Message-Id: <20210303132941.3938516-1-geert+renesas@glider.be>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

The GPIO pins connected to the 4 Software Switches ("SOFT_SW", SW2) do
not have external pull-up resistors, but rely on internal pull-ups being
enabled.  Fortunately this is satisfied by the initial state of these
pins.

Make this explicit by enabling bias-pull-up, to remove the dependency on
initial state and/or boot loader configuration.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
To be queued in renesas-devel for v5.13.

It is safe to apply this before R-Car M2-W bias support[1] has landed,
as pinctrl_bind_pins() does not consider -ENOTSUPP a fatal error.

[1] https://lore.kernel.org/r/20210303132619.3938128-1-geert+renesas@glider.be
---
 arch/arm/boot/dts/r8a7791-koelsch.dts | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/arch/arm/boot/dts/r8a7791-koelsch.dts b/arch/arm/boot/dts/r8a7791-koelsch.dts
index 751e07fb102cf454..c6c93c4452ee1e88 100644
--- a/arch/arm/boot/dts/r8a7791-koelsch.dts
+++ b/arch/arm/boot/dts/r8a7791-koelsch.dts
@@ -81,6 +81,9 @@ lbsc {
 	keyboard {
 		compatible = "gpio-keys";
 
+		pinctrl-0 = <&sw2_pins>;
+		pinctrl-names = "default";
+
 		key-1 {
 			gpios = <&gpio5 0 GPIO_ACTIVE_LOW>;
 			linux,code = <KEY_1>;
@@ -615,6 +618,11 @@ sound_clk_pins: sound_clk {
 		groups = "audio_clk_a";
 		function = "audio_clk";
 	};
+
+	sw2_pins: sw2 {
+		pins = "GP_5_0", "GP_5_1", "GP_5_2", "GP_5_3";
+		bias-pull-up;
+	};
 };
 
 &ether {
-- 
2.25.1

