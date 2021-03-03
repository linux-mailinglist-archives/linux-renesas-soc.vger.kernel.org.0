Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 19CE232C63B
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  4 Mar 2021 02:02:14 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234744AbhCDA2C (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 3 Mar 2021 19:28:02 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57818 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235543AbhCCOGS (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 3 Mar 2021 09:06:18 -0500
Received: from michel.telenet-ops.be (michel.telenet-ops.be [IPv6:2a02:1800:110:4::f00:18])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7C601C061788
        for <linux-renesas-soc@vger.kernel.org>; Wed,  3 Mar 2021 06:05:34 -0800 (PST)
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed20:cd47:42a6:c822:e50b])
        by michel.telenet-ops.be with bizsmtp
        id bq5Y2400F4huzR806q5Y9t; Wed, 03 Mar 2021 15:05:33 +0100
Received: from rox.of.borg ([192.168.97.57])
        by ramsan.of.borg with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
        (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1lHS84-004QKw-6a; Wed, 03 Mar 2021 15:05:32 +0100
Received: from geert by rox.of.borg with local (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1lHS83-00GXQ5-GZ; Wed, 03 Mar 2021 15:05:31 +0100
From:   Geert Uytterhoeven <geert+renesas@glider.be>
To:     Magnus Damm <magnus.damm@gmail.com>,
        Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc:     linux-renesas-soc@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH] arm64: dts: renesas: Consolidate Salvator-X(S) HDMI0 handling
Date:   Wed,  3 Mar 2021 15:05:29 +0100
Message-Id: <20210303140529.3941670-1-geert+renesas@glider.be>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Now all Salvator-X(S) SoC/board combinations have support for HDMI
sound, all HDMI0 connector and sound descriptions are identical.
Replace them by shared descriptions in salvator-common.dtsi, to reduce
duplication.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
To be queued in renesas-devel for v5.13.

 .../boot/dts/renesas/r8a77950-salvator-x.dts  | 37 +--------------
 .../boot/dts/renesas/r8a77951-salvator-x.dts  | 37 +--------------
 .../boot/dts/renesas/r8a77951-salvator-xs.dts | 37 +--------------
 .../boot/dts/renesas/r8a77960-salvator-x.dts  | 46 -------------------
 .../boot/dts/renesas/r8a77960-salvator-xs.dts | 46 -------------------
 .../boot/dts/renesas/r8a77961-salvator-xs.dts | 46 -------------------
 .../boot/dts/renesas/r8a77965-salvator-x.dts  | 45 ------------------
 .../boot/dts/renesas/r8a77965-salvator-xs.dts | 45 ------------------
 .../boot/dts/renesas/salvator-common.dtsi     | 39 +++++++++++++++-
 9 files changed, 41 insertions(+), 337 deletions(-)

diff --git a/arch/arm64/boot/dts/renesas/r8a77950-salvator-x.dts b/arch/arm64/boot/dts/renesas/r8a77950-salvator-x.dts
index 2438825c9b22e26d..3e3b954a4a9defe8 100644
--- a/arch/arm64/boot/dts/renesas/r8a77950-salvator-x.dts
+++ b/arch/arm64/boot/dts/renesas/r8a77950-salvator-x.dts
@@ -52,29 +52,6 @@ &ehci2 {
 	status = "okay";
 };
 
-&hdmi0 {
-	status = "okay";
-
-	ports {
-		port@1 {
-			reg = <1>;
-			rcar_dw_hdmi0_out: endpoint {
-				remote-endpoint = <&hdmi0_con>;
-			};
-		};
-		port@2 {
-			reg = <2>;
-			dw_hdmi0_snd_in: endpoint {
-				remote-endpoint = <&rsnd_endpoint1>;
-			};
-		};
-	};
-};
-
-&hdmi0_con {
-	remote-endpoint = <&rcar_dw_hdmi0_out>;
-};
-
 &hdmi1 {
 	status = "okay";
 
@@ -111,19 +88,7 @@ usb2_pins: usb2 {
 
 &rcar_sound {
 	ports {
-		/* rsnd_port0 is on salvator-common */
-		rsnd_port1: port@1 {
-			reg = <1>;
-			rsnd_endpoint1: endpoint {
-				remote-endpoint = <&dw_hdmi0_snd_in>;
-
-				dai-format = "i2s";
-				bitclock-master = <&rsnd_endpoint1>;
-				frame-master = <&rsnd_endpoint1>;
-
-				playback = <&ssi2>;
-			};
-		};
+		/* rsnd_port0/1 are described in salvator-common.dtsi */
 		rsnd_port2: port@2 {
 			reg = <2>;
 			rsnd_endpoint2: endpoint {
diff --git a/arch/arm64/boot/dts/renesas/r8a77951-salvator-x.dts b/arch/arm64/boot/dts/renesas/r8a77951-salvator-x.dts
index a402a2fb6e3c313b..cf2165bdf62511ff 100644
--- a/arch/arm64/boot/dts/renesas/r8a77951-salvator-x.dts
+++ b/arch/arm64/boot/dts/renesas/r8a77951-salvator-x.dts
@@ -52,29 +52,6 @@ &ehci2 {
 	status = "okay";
 };
 
-&hdmi0 {
-	status = "okay";
-
-	ports {
-		port@1 {
-			reg = <1>;
-			rcar_dw_hdmi0_out: endpoint {
-				remote-endpoint = <&hdmi0_con>;
-			};
-		};
-		port@2 {
-			reg = <2>;
-			dw_hdmi0_snd_in: endpoint {
-				remote-endpoint = <&rsnd_endpoint1>;
-			};
-		};
-	};
-};
-
-&hdmi0_con {
-	remote-endpoint = <&rcar_dw_hdmi0_out>;
-};
-
 &hdmi1 {
 	status = "okay";
 
@@ -111,19 +88,7 @@ usb2_pins: usb2 {
 
 &rcar_sound {
 	ports {
-		/* rsnd_port0 is on salvator-common */
-		rsnd_port1: port@1 {
-			reg = <1>;
-			rsnd_endpoint1: endpoint {
-				remote-endpoint = <&dw_hdmi0_snd_in>;
-
-				dai-format = "i2s";
-				bitclock-master = <&rsnd_endpoint1>;
-				frame-master = <&rsnd_endpoint1>;
-
-				playback = <&ssi2>;
-			};
-		};
+		/* rsnd_port0/1 are described in salvator-common.dtsi */
 		rsnd_port2: port@2 {
 			reg = <2>;
 			rsnd_endpoint2: endpoint {
diff --git a/arch/arm64/boot/dts/renesas/r8a77951-salvator-xs.dts b/arch/arm64/boot/dts/renesas/r8a77951-salvator-xs.dts
index e5922329a4b896e4..37202fcdc35bc773 100644
--- a/arch/arm64/boot/dts/renesas/r8a77951-salvator-xs.dts
+++ b/arch/arm64/boot/dts/renesas/r8a77951-salvator-xs.dts
@@ -57,29 +57,6 @@ &ehci3 {
 	status = "okay";
 };
 
-&hdmi0 {
-	status = "okay";
-
-	ports {
-		port@1 {
-			reg = <1>;
-			rcar_dw_hdmi0_out: endpoint {
-				remote-endpoint = <&hdmi0_con>;
-			};
-		};
-		port@2 {
-			reg = <2>;
-			dw_hdmi0_snd_in: endpoint {
-				remote-endpoint = <&rsnd_endpoint1>;
-			};
-		};
-	};
-};
-
-&hdmi0_con {
-	remote-endpoint = <&rcar_dw_hdmi0_out>;
-};
-
 &hdmi1 {
 	status = "okay";
 
@@ -152,19 +129,7 @@ usb2_ch3_pins: usb2_ch3 {
 
 &rcar_sound {
 	ports {
-		/* rsnd_port0 is on salvator-common */
-		rsnd_port1: port@1 {
-			reg = <1>;
-			rsnd_endpoint1: endpoint {
-				remote-endpoint = <&dw_hdmi0_snd_in>;
-
-				dai-format = "i2s";
-				bitclock-master = <&rsnd_endpoint1>;
-				frame-master = <&rsnd_endpoint1>;
-
-				playback = <&ssi2>;
-			};
-		};
+		/* rsnd_port0/1 are described in salvator-common.dtsi */
 		rsnd_port2: port@2 {
 			reg = <2>;
 			rsnd_endpoint2: endpoint {
diff --git a/arch/arm64/boot/dts/renesas/r8a77960-salvator-x.dts b/arch/arm64/boot/dts/renesas/r8a77960-salvator-x.dts
index ecfbeafeaf367f15..d5543f26c4720cea 100644
--- a/arch/arm64/boot/dts/renesas/r8a77960-salvator-x.dts
+++ b/arch/arm64/boot/dts/renesas/r8a77960-salvator-x.dts
@@ -35,49 +35,3 @@ &du {
 	clock-names = "du.0", "du.1", "du.2",
 		      "dclkin.0", "dclkin.1", "dclkin.2";
 };
-
-&hdmi0 {
-	status = "okay";
-
-	ports {
-		port@1 {
-			reg = <1>;
-			rcar_dw_hdmi0_out: endpoint {
-				remote-endpoint = <&hdmi0_con>;
-			};
-		};
-		port@2 {
-			reg = <2>;
-			dw_hdmi0_snd_in: endpoint {
-				remote-endpoint = <&rsnd_endpoint1>;
-			};
-		};
-	};
-};
-
-&hdmi0_con {
-	remote-endpoint = <&rcar_dw_hdmi0_out>;
-};
-
-&rcar_sound {
-	ports {
-		/* rsnd_port0 is on salvator-common */
-		rsnd_port1: port@1 {
-			reg = <1>;
-			rsnd_endpoint1: endpoint {
-				remote-endpoint = <&dw_hdmi0_snd_in>;
-
-				dai-format = "i2s";
-				bitclock-master = <&rsnd_endpoint1>;
-				frame-master = <&rsnd_endpoint1>;
-
-				playback = <&ssi2>;
-			};
-		};
-	};
-};
-
-&sound_card {
-	dais = <&rsnd_port0	/* ak4613 */
-		&rsnd_port1>;	/* HDMI0  */
-};
diff --git a/arch/arm64/boot/dts/renesas/r8a77960-salvator-xs.dts b/arch/arm64/boot/dts/renesas/r8a77960-salvator-xs.dts
index 249896a38fdcc7a8..9ebb47b6bf2dcbc1 100644
--- a/arch/arm64/boot/dts/renesas/r8a77960-salvator-xs.dts
+++ b/arch/arm64/boot/dts/renesas/r8a77960-salvator-xs.dts
@@ -35,49 +35,3 @@ &du {
 	clock-names = "du.0", "du.1", "du.2",
 		      "dclkin.0", "dclkin.1", "dclkin.2";
 };
-
-&hdmi0 {
-	status = "okay";
-
-	ports {
-		port@1 {
-			reg = <1>;
-			rcar_dw_hdmi0_out: endpoint {
-				remote-endpoint = <&hdmi0_con>;
-			};
-		};
-		port@2 {
-			reg = <2>;
-			dw_hdmi0_snd_in: endpoint {
-				remote-endpoint = <&rsnd_endpoint1>;
-			};
-		};
-	};
-};
-
-&hdmi0_con {
-	remote-endpoint = <&rcar_dw_hdmi0_out>;
-};
-
-&rcar_sound {
-	ports {
-		/* rsnd_port0 is on salvator-common */
-		rsnd_port1: port@1 {
-			reg = <1>;
-			rsnd_endpoint1: endpoint {
-				remote-endpoint = <&dw_hdmi0_snd_in>;
-
-				dai-format = "i2s";
-				bitclock-master = <&rsnd_endpoint1>;
-				frame-master = <&rsnd_endpoint1>;
-
-				playback = <&ssi2>;
-			};
-		};
-	};
-};
-
-&sound_card {
-	dais = <&rsnd_port0	/* ak4613 */
-		&rsnd_port1>;	/* HDMI0  */
-};
diff --git a/arch/arm64/boot/dts/renesas/r8a77961-salvator-xs.dts b/arch/arm64/boot/dts/renesas/r8a77961-salvator-xs.dts
index 1e76033651062c39..c7f14177f7b95b5a 100644
--- a/arch/arm64/boot/dts/renesas/r8a77961-salvator-xs.dts
+++ b/arch/arm64/boot/dts/renesas/r8a77961-salvator-xs.dts
@@ -40,49 +40,3 @@ &du {
 	clock-names = "du.0", "du.1", "du.2",
 		      "dclkin.0", "dclkin.1", "dclkin.2";
 };
-
-&hdmi0 {
-	status = "okay";
-
-	ports {
-		port@1 {
-			reg = <1>;
-			rcar_dw_hdmi0_out: endpoint {
-				remote-endpoint = <&hdmi0_con>;
-			};
-		};
-		port@2 {
-			reg = <2>;
-			dw_hdmi0_snd_in: endpoint {
-				remote-endpoint = <&rsnd_endpoint1>;
-			};
-		};
-	};
-};
-
-&hdmi0_con {
-	remote-endpoint = <&rcar_dw_hdmi0_out>;
-};
-
-&rcar_sound {
-	ports {
-		/* rsnd_port0 is on salvator-common */
-		rsnd_port1: port@1 {
-			reg = <1>;
-			rsnd_endpoint1: endpoint {
-				remote-endpoint = <&dw_hdmi0_snd_in>;
-
-				dai-format = "i2s";
-				bitclock-master = <&rsnd_endpoint1>;
-				frame-master = <&rsnd_endpoint1>;
-
-				playback = <&ssi2>;
-			};
-		};
-	};
-};
-
-&sound_card {
-	dais = <&rsnd_port0	/* ak4613 */
-		&rsnd_port1>;	/* HDMI0  */
-};
diff --git a/arch/arm64/boot/dts/renesas/r8a77965-salvator-x.dts b/arch/arm64/boot/dts/renesas/r8a77965-salvator-x.dts
index 660a0240eec56268..f84c64ed4df7b045 100644
--- a/arch/arm64/boot/dts/renesas/r8a77965-salvator-x.dts
+++ b/arch/arm64/boot/dts/renesas/r8a77965-salvator-x.dts
@@ -30,48 +30,3 @@ &du {
 	clock-names = "du.0", "du.1", "du.3",
 		      "dclkin.0", "dclkin.1", "dclkin.3";
 };
-
-&hdmi0 {
-	status = "okay";
-
-	ports {
-		port@1 {
-			reg = <1>;
-			rcar_dw_hdmi0_out: endpoint {
-				remote-endpoint = <&hdmi0_con>;
-			};
-		};
-		port@2 {
-			reg = <2>;
-			dw_hdmi0_snd_in: endpoint {
-				remote-endpoint = <&rsnd_endpoint1>;
-			};
-		};
-	};
-};
-
-&hdmi0_con {
-	remote-endpoint = <&rcar_dw_hdmi0_out>;
-};
-
-&rcar_sound {
-	ports {
-		rsnd_port1: port@1 {
-			reg = <1>;
-			rsnd_endpoint1: endpoint {
-				remote-endpoint = <&dw_hdmi0_snd_in>;
-
-				dai-format = "i2s";
-				bitclock-master = <&rsnd_endpoint1>;
-				frame-master = <&rsnd_endpoint1>;
-
-				playback = <&ssi2>;
-			};
-		};
-	};
-};
-
-&sound_card {
-	dais = <&rsnd_port0	/* ak4613 */
-		&rsnd_port1>;	/* HDMI0  */
-};
diff --git a/arch/arm64/boot/dts/renesas/r8a77965-salvator-xs.dts b/arch/arm64/boot/dts/renesas/r8a77965-salvator-xs.dts
index d7e621101af7e631..729756c24c7479a3 100644
--- a/arch/arm64/boot/dts/renesas/r8a77965-salvator-xs.dts
+++ b/arch/arm64/boot/dts/renesas/r8a77965-salvator-xs.dts
@@ -31,29 +31,6 @@ &du {
 		      "dclkin.0", "dclkin.1", "dclkin.3";
 };
 
-&hdmi0 {
-	status = "okay";
-
-	ports {
-		port@1 {
-			reg = <1>;
-			rcar_dw_hdmi0_out: endpoint {
-				remote-endpoint = <&hdmi0_con>;
-			};
-		};
-		port@2 {
-			reg = <2>;
-			dw_hdmi0_snd_in: endpoint {
-				remote-endpoint = <&rsnd_endpoint1>;
-			};
-		};
-	};
-};
-
-&hdmi0_con {
-	remote-endpoint = <&rcar_dw_hdmi0_out>;
-};
-
 &pca9654 {
 	pcie-sata-switch-hog {
 		gpio-hog;
@@ -63,29 +40,7 @@ pcie-sata-switch-hog {
 	};
 };
 
-&rcar_sound {
-	ports {
-		rsnd_port1: port@1 {
-			reg = <1>;
-			rsnd_endpoint1: endpoint {
-				remote-endpoint = <&dw_hdmi0_snd_in>;
-
-				dai-format = "i2s";
-				bitclock-master = <&rsnd_endpoint1>;
-				frame-master = <&rsnd_endpoint1>;
-
-				playback = <&ssi2>;
-			};
-		};
-	};
-};
-
 /* SW12-7 must be set 'Off' (MD12 set to 1) which is not the default! */
 &sata {
 	status = "okay";
 };
-
-&sound_card {
-	dais = <&rsnd_port0	/* ak4613 */
-		&rsnd_port1>;	/* HDMI0  */
-};
diff --git a/arch/arm64/boot/dts/renesas/salvator-common.dtsi b/arch/arm64/boot/dts/renesas/salvator-common.dtsi
index 99a8d887e3821f22..3c810bbdc5cef69e 100644
--- a/arch/arm64/boot/dts/renesas/salvator-common.dtsi
+++ b/arch/arm64/boot/dts/renesas/salvator-common.dtsi
@@ -204,7 +204,8 @@ sound_card: sound {
 
 		label = "rcar-sound";
 
-		dais = <&rsnd_port0>;
+		dais = <&rsnd_port0	/* ak4613 */
+			&rsnd_port1>;	/* HDMI0  */
 	};
 
 	vbus0_usb2: regulator-vbus0-usb2 {
@@ -400,6 +401,29 @@ &extalr_clk {
 	clock-frequency = <32768>;
 };
 
+&hdmi0 {
+	status = "okay";
+
+	ports {
+		port@1 {
+			reg = <1>;
+			rcar_dw_hdmi0_out: endpoint {
+				remote-endpoint = <&hdmi0_con>;
+			};
+		};
+		port@2 {
+			reg = <2>;
+			dw_hdmi0_snd_in: endpoint {
+				remote-endpoint = <&rsnd_endpoint1>;
+			};
+		};
+	};
+};
+
+&hdmi0_con {
+	remote-endpoint = <&rcar_dw_hdmi0_out>;
+};
+
 &hscif1 {
 	pinctrl-0 = <&hscif1_pins>;
 	pinctrl-names = "default";
@@ -783,6 +807,19 @@ rsnd_endpoint0: endpoint {
 				capture  = <&ssi1>, <&src1>, <&dvc1>;
 			};
 		};
+
+		rsnd_port1: port@1 {
+			reg = <1>;
+			rsnd_endpoint1: endpoint {
+				remote-endpoint = <&dw_hdmi0_snd_in>;
+
+				dai-format = "i2s";
+				bitclock-master = <&rsnd_endpoint1>;
+				frame-master = <&rsnd_endpoint1>;
+
+				playback = <&ssi2>;
+			};
+		};
 	};
 };
 
-- 
2.25.1

