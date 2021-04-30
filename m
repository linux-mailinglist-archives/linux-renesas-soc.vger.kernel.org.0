Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 818D636FB3C
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 30 Apr 2021 15:11:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231696AbhD3NLu (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 30 Apr 2021 09:11:50 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58222 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232475AbhD3NLt (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 30 Apr 2021 09:11:49 -0400
Received: from xavier.telenet-ops.be (xavier.telenet-ops.be [IPv6:2a02:1800:120:4::f00:14])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 38857C06138B
        for <linux-renesas-soc@vger.kernel.org>; Fri, 30 Apr 2021 06:11:01 -0700 (PDT)
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed20:d4dd:70b4:3264:8d97])
        by xavier.telenet-ops.be with bizsmtp
        id z1Az2400K4p6Y38011AzRx; Fri, 30 Apr 2021 15:10:59 +0200
Received: from rox.of.borg ([192.168.97.57])
        by ramsan.of.borg with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
        (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1lcSv5-001f3r-D3; Fri, 30 Apr 2021 15:10:59 +0200
Received: from geert by rox.of.borg with local (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1lcSv4-00FCOn-UG; Fri, 30 Apr 2021 15:10:58 +0200
From:   Geert Uytterhoeven <geert+renesas@glider.be>
To:     Magnus Damm <magnus.damm@gmail.com>
Cc:     linux-renesas-soc@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH 2/5] ARM: dts: lager: Configure pull-up for SOFT_SW GPIO keys
Date:   Fri, 30 Apr 2021 15:10:52 +0200
Message-Id: <9fae3c0c2c0000f6b43c9ce87fe64a594b30a7da.1619785905.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1619785905.git.geert+renesas@glider.be>
References: <cover.1619785905.git.geert+renesas@glider.be>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

The GPIO pins connected to the 4 Software Switches (SW2) do not have
external pull-up resistors, but rely on internal pull-ups being enabled.
Fortunately this is satisfied by the initial state of these pins.

Make this explicit by enabling bias-pull-up, to remove the dependency on
initial state and/or boot loader configuration.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
 arch/arm/boot/dts/r8a7790-lager.dts | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/arch/arm/boot/dts/r8a7790-lager.dts b/arch/arm/boot/dts/r8a7790-lager.dts
index 2dad0742d2ba159b..fa6d986b5d4632cf 100644
--- a/arch/arm/boot/dts/r8a7790-lager.dts
+++ b/arch/arm/boot/dts/r8a7790-lager.dts
@@ -81,6 +81,9 @@ lbsc {
 	keyboard {
 		compatible = "gpio-keys";
 
+		pinctrl-0 = <&keyboard_pins>;
+		pinctrl-names = "default";
+
 		one {
 			linux,code = <KEY_1>;
 			label = "SW2-1";
@@ -659,6 +662,11 @@ sound_clk_pins: sound_clk {
 		groups = "audio_clk_a";
 		function = "audio_clk";
 	};
+
+	keyboard_pins: keyboard {
+		pins = "GP_1_14", "GP_1_24", "GP_1_26", "GP_1_28";
+		bias-pull-up;
+	};
 };
 
 &ether {
-- 
2.25.1

