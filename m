Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A7689415166
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 22 Sep 2021 22:30:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237309AbhIVUcD (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 22 Sep 2021 16:32:03 -0400
Received: from perceval.ideasonboard.com ([213.167.242.64]:57854 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232274AbhIVUcC (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 22 Sep 2021 16:32:02 -0400
Received: from Monstersaurus.local (cpc89244-aztw30-2-0-cust3082.18-1.cable.virginm.net [86.31.172.11])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id D4696F1;
        Wed, 22 Sep 2021 22:30:30 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1632342631;
        bh=ul9fCFg1tRByddGFWfXoN4EyqWHQr5uWkhY1V0hbcVI=;
        h=From:To:Cc:Subject:Date:From;
        b=rN2MyfFVkF3D84cvww+NlemN1EIfm993kWu7yyqvGJvXZvei5nrHfv0AnYtHGK3J7
         59VgHtLSY4fGxCUtP0p4agZjz5MLpDNbURKXrlzCNy42qf+7VTC8MOAnn1O4B1MiXw
         bLDbZMEmQhnqlDpm3RC8ZSHxaA5eHMKW/Ka3Rpss=
From:   Kieran Bingham <kieran.bingham@ideasonboard.com>
To:     linux-renesas-soc@vger.kernel.org,
        Geert Uytterhoeven <geert@glider.be>
Cc:     Kieran Bingham <kieran.bingham@ideasonboard.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Magnus Damm <magnus.damm@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        devicetree@vger.kernel.org (open list:OPEN FIRMWARE AND FLATTENED
        DEVICE TREE BINDINGS), linux-kernel@vger.kernel.org (open list)
Subject: [PATCH] arm64: dts: renesas: r8a779a0: falcon-cpu: Add SW46 switch support
Date:   Wed, 22 Sep 2021 21:30:27 +0100
Message-Id: <20210922203027.3229474-1-kieran.bingham@ideasonboard.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Add support for SW46-1 and SW46-2 as switches using the gpio-keys
framework.

Signed-off-by: Kieran Bingham <kieran.bingham@ideasonboard.com>
---

SW_LID and SW_DOCK are selected as low-impact switch events for the
default configuration. Would SW_RFKILL_ALL, and SW_MUTE_DEVICE be
preferred as more 'functional' defaults? (I have otherwise avoided these
to hopefully prevent unwanted / undocumented effects occuring on
development hardware running a full interface which may parse these)

I'd expect them to be overridden by any platform using them anyway.

Testing of these switches (and the buttons) shown at:
  https://paste.debian.net/1212884/
---
 .../boot/dts/renesas/r8a779a0-falcon-cpu.dtsi | 21 ++++++++++++++++++-
 1 file changed, 20 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/renesas/r8a779a0-falcon-cpu.dtsi b/arch/arm64/boot/dts/renesas/r8a779a0-falcon-cpu.dtsi
index d595fbad4589..5d188a7d6e73 100644
--- a/arch/arm64/boot/dts/renesas/r8a779a0-falcon-cpu.dtsi
+++ b/arch/arm64/boot/dts/renesas/r8a779a0-falcon-cpu.dtsi
@@ -52,6 +52,24 @@ keys {
 		pinctrl-0 = <&keys_pins>;
 		pinctrl-names = "default";
 
+		sw-1 {
+			gpios = <&gpio1 28 GPIO_ACTIVE_LOW>;
+			linux,code = <SW_LID>;
+			linux,input-type = <EV_SW>;
+			label = "SW46-1";
+			wakeup-source;
+			debounce-interval = <20>;
+		};
+
+		sw-2 {
+			gpios = <&gpio1 29 GPIO_ACTIVE_LOW>;
+			linux,code = <SW_DOCK>;
+			linux,input-type = <EV_SW>;
+			label = "SW46-2";
+			wakeup-source;
+			debounce-interval = <20>;
+		};
+
 		key-1 {
 			gpios = <&gpio6 18 GPIO_ACTIVE_LOW>;
 			linux,code = <KEY_1>;
@@ -193,7 +211,8 @@ i2c6_pins: i2c6 {
 	};
 
 	keys_pins: keys {
-		pins = "GP_6_18", "GP_6_19", "GP_6_20";
+		pins = "GP_1_28", "GP_1_29",
+		       "GP_6_18", "GP_6_19", "GP_6_20";
 		bias-pull-up;
 	};
 
-- 
2.30.2

