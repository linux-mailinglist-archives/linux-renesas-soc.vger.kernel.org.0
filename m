Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6618B39E5A4
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  7 Jun 2021 19:39:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229997AbhFGRlD (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 7 Jun 2021 13:41:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39234 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230481AbhFGRlC (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 7 Jun 2021 13:41:02 -0400
Received: from michel.telenet-ops.be (michel.telenet-ops.be [IPv6:2a02:1800:110:4::f00:18])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A5EB2C061789
        for <linux-renesas-soc@vger.kernel.org>; Mon,  7 Jun 2021 10:39:10 -0700 (PDT)
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed20:c184:ea65:c3d6:a616])
        by michel.telenet-ops.be with bizsmtp
        id EHf82500t1G4u2S06Hf8BZ; Mon, 07 Jun 2021 19:39:09 +0200
Received: from rox.of.borg ([192.168.97.57])
        by ramsan.of.borg with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
        (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1lqJDQ-00E7jE-I1; Mon, 07 Jun 2021 19:39:08 +0200
Received: from geert by rox.of.borg with local (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1lqJDP-007945-TJ; Mon, 07 Jun 2021 19:39:07 +0200
From:   Geert Uytterhoeven <geert+renesas@glider.be>
To:     Magnus Damm <magnus.damm@gmail.com>
Cc:     linux-renesas-soc@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH 1/4] arm64: dts: renesas: salvator-x(s): Factor out HDMI1 parts
Date:   Mon,  7 Jun 2021 19:39:02 +0200
Message-Id: <a1d9dcd481d36e5b6e78934e587f6391022030b5.1623087028.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1623087028.git.geert+renesas@glider.be>
References: <cover.1623087028.git.geert+renesas@glider.be>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Move the common parts related to the second HDMI interface on
Salvator-X(S) boards to salvator-common.dtsi, to reduce current and
avoid future duplication of board descriptions.

As this interface is not present on all SoCs that can be found on
Salvator-X(S), but only on R-Car H3, its description are protected by
the preprocessor symbol SOC_HAS_HDMI1, defined in r8a77951.dtsi.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
 .../boot/dts/renesas/r8a77950-salvator-x.dts  | 47 -------------------
 .../boot/dts/renesas/r8a77951-salvator-x.dts  | 47 -------------------
 .../boot/dts/renesas/r8a77951-salvator-xs.dts | 47 -------------------
 arch/arm64/boot/dts/renesas/r8a77951.dtsi     |  2 +
 .../boot/dts/renesas/salvator-common.dtsi     | 46 +++++++++++++++++-
 5 files changed, 47 insertions(+), 142 deletions(-)

diff --git a/arch/arm64/boot/dts/renesas/r8a77950-salvator-x.dts b/arch/arm64/boot/dts/renesas/r8a77950-salvator-x.dts
index 3e3b954a4a9defe8..718d1597af03dc2e 100644
--- a/arch/arm64/boot/dts/renesas/r8a77950-salvator-x.dts
+++ b/arch/arm64/boot/dts/renesas/r8a77950-salvator-x.dts
@@ -52,29 +52,6 @@ &ehci2 {
 	status = "okay";
 };
 
-&hdmi1 {
-	status = "okay";
-
-	ports {
-		port@1 {
-			reg = <1>;
-			rcar_dw_hdmi1_out: endpoint {
-				remote-endpoint = <&hdmi1_con>;
-			};
-		};
-		port@2 {
-			reg = <2>;
-			dw_hdmi1_snd_in: endpoint {
-				remote-endpoint = <&rsnd_endpoint2>;
-			};
-		};
-	};
-};
-
-&hdmi1_con {
-	remote-endpoint = <&rcar_dw_hdmi1_out>;
-};
-
 &ohci2 {
 	status = "okay";
 };
@@ -86,34 +63,10 @@ usb2_pins: usb2 {
 	};
 };
 
-&rcar_sound {
-	ports {
-		/* rsnd_port0/1 are described in salvator-common.dtsi */
-		rsnd_port2: port@2 {
-			reg = <2>;
-			rsnd_endpoint2: endpoint {
-				remote-endpoint = <&dw_hdmi1_snd_in>;
-
-				dai-format = "i2s";
-				bitclock-master = <&rsnd_endpoint2>;
-				frame-master = <&rsnd_endpoint2>;
-
-				playback = <&ssi3>;
-			};
-		};
-	};
-};
-
 &sata {
 	status = "okay";
 };
 
-&sound_card {
-	dais = <&rsnd_port0	/* ak4613 */
-		&rsnd_port1	/* HDMI0  */
-		&rsnd_port2>;	/* HDMI1  */
-};
-
 &usb2_phy2 {
 	pinctrl-0 = <&usb2_pins>;
 	pinctrl-names = "default";
diff --git a/arch/arm64/boot/dts/renesas/r8a77951-salvator-x.dts b/arch/arm64/boot/dts/renesas/r8a77951-salvator-x.dts
index cf2165bdf62511ff..d75fb9a9d3e4309d 100644
--- a/arch/arm64/boot/dts/renesas/r8a77951-salvator-x.dts
+++ b/arch/arm64/boot/dts/renesas/r8a77951-salvator-x.dts
@@ -52,29 +52,6 @@ &ehci2 {
 	status = "okay";
 };
 
-&hdmi1 {
-	status = "okay";
-
-	ports {
-		port@1 {
-			reg = <1>;
-			rcar_dw_hdmi1_out: endpoint {
-				remote-endpoint = <&hdmi1_con>;
-			};
-		};
-		port@2 {
-			reg = <2>;
-			dw_hdmi1_snd_in: endpoint {
-				remote-endpoint = <&rsnd_endpoint2>;
-			};
-		};
-	};
-};
-
-&hdmi1_con {
-	remote-endpoint = <&rcar_dw_hdmi1_out>;
-};
-
 &ohci2 {
 	status = "okay";
 };
@@ -86,34 +63,10 @@ usb2_pins: usb2 {
 	};
 };
 
-&rcar_sound {
-	ports {
-		/* rsnd_port0/1 are described in salvator-common.dtsi */
-		rsnd_port2: port@2 {
-			reg = <2>;
-			rsnd_endpoint2: endpoint {
-				remote-endpoint = <&dw_hdmi1_snd_in>;
-
-				dai-format = "i2s";
-				bitclock-master = <&rsnd_endpoint2>;
-				frame-master = <&rsnd_endpoint2>;
-
-				playback = <&ssi3>;
-			};
-		};
-	};
-};
-
 &sata {
 	status = "okay";
 };
 
-&sound_card {
-	dais = <&rsnd_port0	/* ak4613 */
-		&rsnd_port1	/* HDMI0  */
-		&rsnd_port2>;	/* HDMI1  */
-};
-
 &usb2_phy2 {
 	pinctrl-0 = <&usb2_pins>;
 	pinctrl-names = "default";
diff --git a/arch/arm64/boot/dts/renesas/r8a77951-salvator-xs.dts b/arch/arm64/boot/dts/renesas/r8a77951-salvator-xs.dts
index 37202fcdc35bc773..fb8734ea5bc37b49 100644
--- a/arch/arm64/boot/dts/renesas/r8a77951-salvator-xs.dts
+++ b/arch/arm64/boot/dts/renesas/r8a77951-salvator-xs.dts
@@ -57,29 +57,6 @@ &ehci3 {
 	status = "okay";
 };
 
-&hdmi1 {
-	status = "okay";
-
-	ports {
-		port@1 {
-			reg = <1>;
-			rcar_dw_hdmi1_out: endpoint {
-				remote-endpoint = <&hdmi1_con>;
-			};
-		};
-		port@2 {
-			reg = <2>;
-			dw_hdmi1_snd_in: endpoint {
-				remote-endpoint = <&rsnd_endpoint2>;
-			};
-		};
-	};
-};
-
-&hdmi1_con {
-	remote-endpoint = <&rcar_dw_hdmi1_out>;
-};
-
 &hsusb3 {
 	dr_mode = "otg";
 	status = "okay";
@@ -127,35 +104,11 @@ usb2_ch3_pins: usb2_ch3 {
 	};
 };
 
-&rcar_sound {
-	ports {
-		/* rsnd_port0/1 are described in salvator-common.dtsi */
-		rsnd_port2: port@2 {
-			reg = <2>;
-			rsnd_endpoint2: endpoint {
-				remote-endpoint = <&dw_hdmi1_snd_in>;
-
-				dai-format = "i2s";
-				bitclock-master = <&rsnd_endpoint2>;
-				frame-master = <&rsnd_endpoint2>;
-
-				playback = <&ssi3>;
-			};
-		};
-	};
-};
-
 /* SW12-7 must be set 'Off' (MD12 set to 1) which is not the default! */
 &sata {
 	status = "okay";
 };
 
-&sound_card {
-	dais = <&rsnd_port0	/* ak4613 */
-		&rsnd_port1	/* HDMI0  */
-		&rsnd_port2>;	/* HDMI1  */
-};
-
 &usb2_phy2 {
 	pinctrl-0 = <&usb2_pins>;
 	pinctrl-names = "default";
diff --git a/arch/arm64/boot/dts/renesas/r8a77951.dtsi b/arch/arm64/boot/dts/renesas/r8a77951.dtsi
index 2e4c18b8eee49f5e..68e54ead31b451ca 100644
--- a/arch/arm64/boot/dts/renesas/r8a77951.dtsi
+++ b/arch/arm64/boot/dts/renesas/r8a77951.dtsi
@@ -11,6 +11,8 @@
 
 #define CPG_AUDIO_CLK_I		R8A7795_CLK_S0D4
 
+#define SOC_HAS_HDMI1
+
 / {
 	compatible = "renesas,r8a7795";
 	#address-cells = <2>;
diff --git a/arch/arm64/boot/dts/renesas/salvator-common.dtsi b/arch/arm64/boot/dts/renesas/salvator-common.dtsi
index e4d9742e147a1bd9..ea1d8693a38eacbb 100644
--- a/arch/arm64/boot/dts/renesas/salvator-common.dtsi
+++ b/arch/arm64/boot/dts/renesas/salvator-common.dtsi
@@ -208,7 +208,11 @@ sound_card: sound {
 		label = "rcar-sound";
 
 		dais = <&rsnd_port0	/* ak4613 */
-			&rsnd_port1>;	/* HDMI0  */
+			&rsnd_port1	/* HDMI0  */
+#ifdef SOC_HAS_HDMI1
+			&rsnd_port2	/* HDMI1  */
+#endif
+			>;
 	};
 
 	vbus0_usb2: regulator-vbus0-usb2 {
@@ -428,6 +432,31 @@ &hdmi0_con {
 	remote-endpoint = <&rcar_dw_hdmi0_out>;
 };
 
+#ifdef SOC_HAS_HDMI1
+&hdmi1 {
+	status = "okay";
+
+	ports {
+		port@1 {
+			reg = <1>;
+			rcar_dw_hdmi1_out: endpoint {
+				remote-endpoint = <&hdmi1_con>;
+			};
+		};
+		port@2 {
+			reg = <2>;
+			dw_hdmi1_snd_in: endpoint {
+				remote-endpoint = <&rsnd_endpoint2>;
+			};
+		};
+	};
+};
+
+&hdmi1_con {
+	remote-endpoint = <&rcar_dw_hdmi1_out>;
+};
+#endif /* SOC_HAS_HDMI1 */
+
 &hscif1 {
 	pinctrl-0 = <&hscif1_pins>;
 	pinctrl-names = "default";
@@ -824,6 +853,21 @@ rsnd_endpoint1: endpoint {
 				playback = <&ssi2>;
 			};
 		};
+
+#ifdef SOC_HAS_HDMI1
+		rsnd_port2: port@2 {
+			reg = <2>;
+			rsnd_endpoint2: endpoint {
+				remote-endpoint = <&dw_hdmi1_snd_in>;
+
+				dai-format = "i2s";
+				bitclock-master = <&rsnd_endpoint2>;
+				frame-master = <&rsnd_endpoint2>;
+
+				playback = <&ssi3>;
+			};
+		};
+#endif /* SOC_HAS_HDMI1 */
 	};
 };
 
-- 
2.25.1

