Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1069336FB41
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 30 Apr 2021 15:11:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232481AbhD3NLy (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 30 Apr 2021 09:11:54 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58236 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232505AbhD3NLu (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 30 Apr 2021 09:11:50 -0400
Received: from baptiste.telenet-ops.be (baptiste.telenet-ops.be [IPv6:2a02:1800:120:4::f00:13])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AD1B5C06138F
        for <linux-renesas-soc@vger.kernel.org>; Fri, 30 Apr 2021 06:11:01 -0700 (PDT)
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed20:d4dd:70b4:3264:8d97])
        by baptiste.telenet-ops.be with bizsmtp
        id z1B02400M4p6Y38011B0Md; Fri, 30 Apr 2021 15:11:00 +0200
Received: from rox.of.borg ([192.168.97.57])
        by ramsan.of.borg with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
        (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1lcSv5-001f3q-TT; Fri, 30 Apr 2021 15:10:59 +0200
Received: from geert by rox.of.borg with local (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1lcSv4-00FCOW-TC; Fri, 30 Apr 2021 15:10:58 +0200
From:   Geert Uytterhoeven <geert+renesas@glider.be>
To:     Magnus Damm <magnus.damm@gmail.com>
Cc:     linux-renesas-soc@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH 1/5] ARM: dts: koelsch: Rename sw2 to keyboard
Date:   Fri, 30 Apr 2021 15:10:51 +0200
Message-Id: <3d718cf69e21b1ceea0c29c0e841b9bdda44533d.1619785905.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1619785905.git.geert+renesas@glider.be>
References: <cover.1619785905.git.geert+renesas@glider.be>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Rename "sw2_pins" and "sw2" to "keyboard_pins" resp. "keyboard", to
comply with generic name recommendations.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
 arch/arm/boot/dts/r8a7791-koelsch.dts | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm/boot/dts/r8a7791-koelsch.dts b/arch/arm/boot/dts/r8a7791-koelsch.dts
index 61e881bbbf6ee5aa..2a8b6fd9095cceba 100644
--- a/arch/arm/boot/dts/r8a7791-koelsch.dts
+++ b/arch/arm/boot/dts/r8a7791-koelsch.dts
@@ -81,7 +81,7 @@ lbsc {
 	keyboard {
 		compatible = "gpio-keys";
 
-		pinctrl-0 = <&sw2_pins>;
+		pinctrl-0 = <&keyboard_pins>;
 		pinctrl-names = "default";
 
 		key-1 {
@@ -622,7 +622,7 @@ sound_clk_pins: sound_clk {
 		function = "audio_clk";
 	};
 
-	sw2_pins: sw2 {
+	keyboard_pins: keyboard {
 		pins = "GP_5_0", "GP_5_1", "GP_5_2", "GP_5_3";
 		bias-pull-up;
 	};
-- 
2.25.1

