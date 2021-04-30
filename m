Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D445E36FB40
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 30 Apr 2021 15:11:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232484AbhD3NLx (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 30 Apr 2021 09:11:53 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58226 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232481AbhD3NLt (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 30 Apr 2021 09:11:49 -0400
Received: from baptiste.telenet-ops.be (baptiste.telenet-ops.be [IPv6:2a02:1800:120:4::f00:13])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 74EECC06138D
        for <linux-renesas-soc@vger.kernel.org>; Fri, 30 Apr 2021 06:11:01 -0700 (PDT)
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed20:d4dd:70b4:3264:8d97])
        by baptiste.telenet-ops.be with bizsmtp
        id z1Az2400q4p6Y38011AzMS; Fri, 30 Apr 2021 15:11:00 +0200
Received: from rox.of.borg ([192.168.97.57])
        by ramsan.of.borg with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
        (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1lcSv5-001f3v-Fw; Fri, 30 Apr 2021 15:10:59 +0200
Received: from geert by rox.of.borg with local (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1lcSv5-00FCPZ-1K; Fri, 30 Apr 2021 15:10:59 +0200
From:   Geert Uytterhoeven <geert+renesas@glider.be>
To:     Magnus Damm <magnus.damm@gmail.com>
Cc:     linux-renesas-soc@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH 5/5] ARM: dts: silk: Configure pull-up for SOFT_SW GPIO keys
Date:   Fri, 30 Apr 2021 15:10:55 +0200
Message-Id: <45f38a5333feba9bea80efeb5a41a6c3f60deda2.1619785905.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1619785905.git.geert+renesas@glider.be>
References: <cover.1619785905.git.geert+renesas@glider.be>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

The GPIO pins connected to the 4 Software Switches ("SOFT_SW", SW12) do
not have external pull-up resistors, but rely on internal pull-ups being
enabled.  Fortunately this is satisfied by the initial state of these
pins.

Make this explicit by enabling bias-pull-up, to remove the dependency on
initial state and/or boot loader configuration.

While at it, rename the surrounding device node from "gpio-keys" to
"keyboard", to comply with generic node name recommendations.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
 arch/arm/boot/dts/r8a7794-silk.dts | 10 +++++++++-
 1 file changed, 9 insertions(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/r8a7794-silk.dts b/arch/arm/boot/dts/r8a7794-silk.dts
index eb89a27a6ed0c9aa..cafa3046daa4baf4 100644
--- a/arch/arm/boot/dts/r8a7794-silk.dts
+++ b/arch/arm/boot/dts/r8a7794-silk.dts
@@ -45,9 +45,12 @@ memory@40000000 {
 		reg = <0 0x40000000 0 0x40000000>;
 	};
 
-	gpio-keys {
+	keyboard {
 		compatible = "gpio-keys";
 
+		pinctrl-0 = <&keyboard_pins>;
+		pinctrl-names = "default";
+
 		key-3 {
 			gpios = <&gpio5 10 GPIO_ACTIVE_LOW>;
 			linux,code = <KEY_3>;
@@ -358,6 +361,11 @@ du1_pins: du1 {
 		function = "du1";
 	};
 
+	keyboard_pins: keyboard {
+		pins = "GP_3_9", "GP_3_10", "GP_3_11", "GP_3_12";
+		bias-pull-up;
+	};
+
 	ssi_pins: sound {
 		groups = "ssi0129_ctrl", "ssi0_data", "ssi1_data";
 		function = "ssi";
-- 
2.25.1

