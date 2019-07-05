Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 498C5606BC
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  5 Jul 2019 15:40:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728855AbfGENj5 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 5 Jul 2019 09:39:57 -0400
Received: from relmlor1.renesas.com ([210.160.252.171]:12182 "EHLO
        relmlie5.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1728387AbfGENj4 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 5 Jul 2019 09:39:56 -0400
X-IronPort-AV: E=Sophos;i="5.62,455,1554735600"; 
   d="scan'208";a="20655197"
Received: from unknown (HELO relmlir6.idc.renesas.com) ([10.200.68.152])
  by relmlie5.idc.renesas.com with ESMTP; 05 Jul 2019 22:39:53 +0900
Received: from fabrizio-dev.ree.adwin.renesas.com (unknown [10.226.36.196])
        by relmlir6.idc.renesas.com (Postfix) with ESMTP id 718C242559AA;
        Fri,  5 Jul 2019 22:39:51 +0900 (JST)
From:   Fabrizio Castro <fabrizio.castro@bp.renesas.com>
To:     Geert Uytterhoeven <geert+renesas@glider.be>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>
Cc:     Fabrizio Castro <fabrizio.castro@bp.renesas.com>,
        Simon Horman <horms@verge.net.au>,
        Magnus Damm <magnus.damm@gmail.com>,
        linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Biju Das <biju.das@bp.renesas.com>, xu_shunji@hoperun.com
Subject: [PATCH 3/3] arm64: dts: renesas: hihope-common: Add HDMI audio support
Date:   Fri,  5 Jul 2019 14:39:39 +0100
Message-Id: <1562333979-28516-4-git-send-email-fabrizio.castro@bp.renesas.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1562333979-28516-1-git-send-email-fabrizio.castro@bp.renesas.com>
References: <1562333979-28516-1-git-send-email-fabrizio.castro@bp.renesas.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

This patch adds support for HDMI audio to the device tree
common to the HiHope RZ/G2M and the HiHope RZ/G2N.

Signed-off-by: Fabrizio Castro <fabrizio.castro@bp.renesas.com>
---
 arch/arm64/boot/dts/renesas/hihope-common.dtsi | 48 ++++++++++++++++++++++++++
 1 file changed, 48 insertions(+)

diff --git a/arch/arm64/boot/dts/renesas/hihope-common.dtsi b/arch/arm64/boot/dts/renesas/hihope-common.dtsi
index 52d61c9..67f22ce 100644
--- a/arch/arm64/boot/dts/renesas/hihope-common.dtsi
+++ b/arch/arm64/boot/dts/renesas/hihope-common.dtsi
@@ -81,6 +81,14 @@
 		regulator-always-on;
 	};
 
+	sound_card: sound {
+		compatible = "audio-graph-card";
+
+		label = "rcar-sound";
+
+		dais = <&rsnd_port0>;
+	};
+
 	vbus0_usb2: regulator-vbus0-usb2 {
 		compatible = "regulator-fixed";
 
@@ -129,6 +137,10 @@
 	};
 };
 
+&audio_clk_a {
+	clock-frequency = <22579200>;
+};
+
 &du {
 	clocks = <&cpg CPG_MOD 724>,
 		 <&cpg CPG_MOD 723>,
@@ -168,6 +180,7 @@
 
 &hdmi0 {
 	status = "okay";
+	#sound-dai-cells = <0>;
 
 	ports {
 		port@1 {
@@ -176,6 +189,12 @@
 				remote-endpoint = <&hdmi0_con>;
 			};
 		};
+		port@2 {
+			reg = <2>;
+			dw_hdmi0_snd_in: endpoint {
+				remote-endpoint = <&rsnd_endpoint0>;
+			};
+		};
 	};
 };
 
@@ -272,6 +291,11 @@
 		power-source = <1800>;
 	};
 
+	sound_clk_pins: sound_clk {
+		groups = "audio_clk_a_a";
+		function = "audio_clk";
+	};
+
 	usb0_pins: usb0 {
 		groups = "usb0";
 		function = "usb0";
@@ -295,6 +319,30 @@
 	};
 };
 
+&rcar_sound {
+	pinctrl-0 = <&sound_clk_pins>;
+	pinctrl-names = "default";
+
+	status = "okay";
+
+	/* Single DAI */
+	#sound-dai-cells = <0>;
+
+	ports {
+		rsnd_port0: port@0 {
+			rsnd_endpoint0: endpoint {
+				remote-endpoint = <&dw_hdmi0_snd_in>;
+
+				dai-format = "i2s";
+				bitclock-master = <&rsnd_endpoint0>;
+				frame-master = <&rsnd_endpoint0>;
+
+				playback = <&ssi2>;
+			};
+		};
+	};
+};
+
 &rwdt {
 	timeout-sec = <60>;
 	status = "okay";
-- 
2.7.4

