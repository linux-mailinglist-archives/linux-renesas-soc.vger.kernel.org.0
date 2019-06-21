Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D3B484E304
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 21 Jun 2019 11:16:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726426AbfFUJQp (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 21 Jun 2019 05:16:45 -0400
Received: from kirsty.vergenet.net ([202.4.237.240]:34780 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726210AbfFUJQp (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 21 Jun 2019 05:16:45 -0400
Received: from reginn.horms.nl (watermunt.horms.nl [80.127.179.77])
        by kirsty.vergenet.net (Postfix) with ESMTPA id ABBB725BE34;
        Fri, 21 Jun 2019 19:16:36 +1000 (AEST)
Received: by reginn.horms.nl (Postfix, from userid 7100)
        id B957F940C81; Fri, 21 Jun 2019 11:16:32 +0200 (CEST)
From:   Simon Horman <horms+renesas@verge.net.au>
To:     linux-renesas-soc@vger.kernel.org
Cc:     linux-arm-kernel@lists.infradead.org,
        Magnus Damm <magnus.damm@gmail.com>,
        Fabrizio Castro <fabrizio.castro@bp.renesas.com>,
        Simon Horman <horms+renesas@verge.net.au>
Subject: [PATCH 08/53] arm64: dts: renesas: cat874: Add HDMI audio
Date:   Fri, 21 Jun 2019 11:15:46 +0200
Message-Id: <a597dcb1d4ab7ddbba7e80b023eff892926f146c.1561107232.git.horms+renesas@verge.net.au>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <cover.1561107232.git.horms+renesas@verge.net.au>
References: <cover.1561107232.git.horms+renesas@verge.net.au>
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

From: Fabrizio Castro <fabrizio.castro@bp.renesas.com>

The CAT874 board pushes sound via I2S over SSI0 into the
TDA19988BET chip.
This commit wires things up so that we can get sound out of
the HDMI interface.

Signed-off-by: Fabrizio Castro <fabrizio.castro@bp.renesas.com>
Signed-off-by: Simon Horman <horms+renesas@verge.net.au>
---
 arch/arm64/boot/dts/renesas/r8a774c0-cat874.dts | 56 +++++++++++++++++++++++++
 1 file changed, 56 insertions(+)

diff --git a/arch/arm64/boot/dts/renesas/r8a774c0-cat874.dts b/arch/arm64/boot/dts/renesas/r8a774c0-cat874.dts
index 06239503093b..b7183f1b0b23 100644
--- a/arch/arm64/boot/dts/renesas/r8a774c0-cat874.dts
+++ b/arch/arm64/boot/dts/renesas/r8a774c0-cat874.dts
@@ -8,6 +8,7 @@
 /dts-v1/;
 #include "r8a774c0.dtsi"
 #include <dt-bindings/gpio/gpio.h>
+#include <dt-bindings/display/tda998x.h>
 
 / {
 	model = "Silicon Linux RZ/G2E 96board platform (CAT874)";
@@ -63,6 +64,23 @@
 		reg = <0x0 0x48000000 0x0 0x78000000>;
 	};
 
+	sound: sound {
+		compatible = "simple-audio-card";
+
+		simple-audio-card,name = "CAT874 HDMI sound";
+		simple-audio-card,format = "i2s";
+		simple-audio-card,bitclock-master = <&sndcpu>;
+		simple-audio-card,frame-master = <&sndcpu>;
+
+		sndcpu: simple-audio-card,cpu {
+			sound-dai = <&rcar_sound>;
+		};
+
+		sndcodec: simple-audio-card,codec {
+			sound-dai = <&tda19988>;
+		};
+	};
+
 	vcc_sdhi0: regulator-vcc-sdhi0 {
 		compatible = "regulator-fixed";
 
@@ -93,6 +111,10 @@
 	};
 };
 
+&audio_clk_a {
+	clock-frequency = <22579200>;
+};
+
 &du {
 	pinctrl-0 = <&du_pins>;
 	pinctrl-names = "default";
@@ -133,6 +155,10 @@
 
 		video-ports = <0x234501>;
 
+		#sound-dai-cells = <0>;
+		audio-ports = <TDA998x_I2S 0x03>;
+		clocks = <&rcar_sound 1>;
+
 		ports {
 			#address-cells = <1>;
 			#size-cells = <0>;
@@ -216,6 +242,36 @@
 		function = "sdhi0";
 		power-source = <1800>;
 	};
+
+	sound_pins: sound {
+		groups = "ssi01239_ctrl", "ssi0_data";
+		function = "ssi";
+	};
+
+	sound_clk_pins: sound_clk {
+		groups = "audio_clkout1_a";
+		function = "audio_clk";
+	};
+};
+
+&rcar_sound {
+	pinctrl-0 = <&sound_pins &sound_clk_pins>;
+	pinctrl-names = "default";
+
+	/* Single DAI */
+	#sound-dai-cells = <0>;
+
+	/* audio_clkout0/1/2/3 */
+	#clock-cells = <1>;
+	clock-frequency = <11289600>;
+
+	status = "okay";
+
+	rcar_sound,dai {
+		dai0 {
+			playback = <&ssi0 &src0 &dvc0>;
+		};
+	};
 };
 
 &rwdt {
-- 
2.11.0

