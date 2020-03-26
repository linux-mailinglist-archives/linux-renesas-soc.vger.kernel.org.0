Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A6C42193D65
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 26 Mar 2020 11:57:18 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728000AbgCZK5S (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 26 Mar 2020 06:57:18 -0400
Received: from mout.kundenserver.de ([212.227.17.24]:43261 "EHLO
        mout.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727590AbgCZK5S (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 26 Mar 2020 06:57:18 -0400
Received: from mail.cetitecgmbh.com ([87.190.42.90]) by
 mrelayeu.kundenserver.de (mreue107 [212.227.15.183]) with ESMTPSA (Nemesis)
 id 1N0F9t-1jUIUF0XYN-00xHNi for <linux-renesas-soc@vger.kernel.org>; Thu, 26
 Mar 2020 11:57:16 +0100
Received: from pflvmailgateway.corp.cetitec.com (unknown [127.0.0.1])
        by mail.cetitecgmbh.com (Postfix) with ESMTP id E55BA650227
        for <linux-renesas-soc@vger.kernel.org>; Thu, 26 Mar 2020 10:57:15 +0000 (UTC)
X-Virus-Scanned: amavisd-new at cetitec.com
Received: from mail.cetitecgmbh.com ([127.0.0.1])
        by pflvmailgateway.corp.cetitec.com (pflvmailgateway.corp.cetitec.com [127.0.0.1]) (amavisd-new, port 10024)
        with ESMTP id Z2IhLgsExEOa for <linux-renesas-soc@vger.kernel.org>;
        Thu, 26 Mar 2020 11:57:15 +0100 (CET)
Received: from pfwsexchange.corp.cetitec.com (unknown [10.10.1.99])
        by mail.cetitecgmbh.com (Postfix) with ESMTPS id 6F71964C347
        for <linux-renesas-soc@vger.kernel.org>; Thu, 26 Mar 2020 11:57:15 +0100 (CET)
Received: from pflmari.corp.cetitec.com (10.8.5.79) by
 PFWSEXCHANGE.corp.cetitec.com (10.10.1.99) with Microsoft SMTP Server (TLS)
 id 15.0.1497.2; Thu, 26 Mar 2020 11:57:15 +0100
Received: by pflmari.corp.cetitec.com (Postfix, from userid 1000)
        id 92B2B80506; Thu, 26 Mar 2020 11:35:44 +0100 (CET)
Date:   Thu, 26 Mar 2020 11:35:44 +0100
From:   Alex Riesen <alexander.riesen@cetitec.com>
To:     Kieran Bingham <kieran.bingham@ideasonboard.com>
CC:     Geert Uytterhoeven <geert@linux-m68k.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        "Laurent Pinchart" <laurent.pinchart@ideasonboard.com>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
        <devel@driverdev.osuosl.org>, <linux-media@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-renesas-soc@vger.kernel.org>
Subject: [PATCH v4 9/9] arm64: dts: renesas: salvator: add a connection from
 adv748x codec (HDMI input) to the R-Car SoC
Message-ID: <ad15f80df51c95a7c24498bb0bd3a46f55fbb62e.1585218857.git.alexander.riesen@cetitec.com>
Mail-Followup-To: Alex Riesen <alexander.riesen@cetitec.com>,
        Kieran Bingham <kieran.bingham@ideasonboard.com>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
        devel@driverdev.osuosl.org, linux-media@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org
References: <cover.1585218857.git.alexander.riesen@cetitec.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <cover.1585218857.git.alexander.riesen@cetitec.com>
X-Originating-IP: [10.8.5.79]
X-ClientProxiedBy: PFWSEXCHANGE.corp.cetitec.com (10.10.1.99) To
 PFWSEXCHANGE.corp.cetitec.com (10.10.1.99)
X-EsetResult: clean, is OK
X-EsetId: 37303A290D7F536A6D7C67
X-Provags-ID: V03:K1:aJi5fYhkCL6W+oDRSdWwHdc9isAGxEbAnobzB1znpS3tViXslRe
 E7frowKoTQisI0OUsOGhb0ULmPXDaFZ26/YKQL/NbjW475S0ftKhxMJ5cHXWBaKETEqGMJL
 hnN08D2KxirDo2mkco35+SHPc2ievsByBDO9m/iiv/Iw4FXweXqeFoq5v38TffowxapxW63
 NeSNtWilb5HmAyv902D8Q==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:wpJYjPTy15Y=:oBow6BHsAelYQlEBo6PadU
 dcdvEvYLA3eu9ms3v9Z+PDtDEA6f/kJhEs+KYq5vQWL/D1k44bjcvRdjwelas6CQchRmz+jg1
 6VTmkUIXoQctLsYDSzHMCp8fbkg94VndaXIzW487Lz811QpEGyHY8HR+CRI1RRZyCAe/CB6A3
 WmQmFiJ+Lyp/zQGQVKwsEgVWzRX+EYJ4nKsITC2DWmxz0GVKpcE4PZHSYDiGAD2uLL9gGJSh0
 K5NU+qGUIpvAX6NwzV13gjt7j2aU8DtF2I+mHYXYLbRHpLjb1okITxFrlwSeg+RsmdYSgJv3n
 HVdIqf3Hdd+Uk7N1IZChNP9oVZobI2l4/K+wUHWUAeWndT8CcfHpAQC+0gvTU7BjDM4IlKnxE
 X7FqEpANRAe1PSWmgLnY0BLiHYaaZ6B+7S+zZjr0c7cypkVuzJeoJkaeGaSN47aS1hZiXRQF5
 GKzMnDkxuggvKVjM80Trc7qI2240BKEeSZjZQyfQIEP3FwLpAeKWFHIjmH8K049RH6W4yCKZ7
 qI2uRAbb8PMcVRJbbaZFXsOijvKZ+UoW1C/eYT9u+7EvtMS3vJqu5NjcARhXQM+DvKFxQr8js
 ULH9S1XmRyqk5BnDwLzdTR4I3vS8g8+Bd8vqLGPCCYw2cXmnebcwrHvFPA8v0sFkm0NKNujNd
 MHpkICKLojPl/+AnVKz3l8CED7XDJnPbJ+luPjHoUObvRBsT2O/4UQGu/PWlhHT4s3/16osFL
 Nm89sZVW+5TarQBoP5CSw6vs32d+oklhntEJwet1tTYerbE/+emzKl7mEe90fqXMGe0oHl/mU
 f+P6T4Qh2NqMao12VDaZ9fv/fVEH13MLnOwUCNtYLL1OILOMrsV25obz+IBOSzhb/viTIAX
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

As all known variants of the Salvator board have the HDMI decoder
chip (the ADV7482) connected to the SSI4 on R-Car SoC, the ADV7482
endpoint and the connection definitions are placed in the common board
file.

For the same reason, the CLK_C clock line and I2C configuration (similar
to the ak4613, on the same interface) are added into the common file.

Signed-off-by: Alexander Riesen <alexander.riesen@cetitec.com>

--

v2: Also add ssi4_ctrl pin group in the sound pins. The pins are
    responsible for SCK4 (sample clock) WS4 and (word boundary input),
    and are required for SSI audio input over I2S.

    The adv748x shall provide its own implementation of the output clock
    (MCLK), connected to the audio_clk_c line of the R-Car SoC.

    If the frequency of the ADV748x MCLK were fixed, the clock
    implementation were not necessary, but it does not seem so: the MCLK
    depends on the value in a speed multiplier register and the input sample
    rate (48kHz).

    Remove audio clock C from the clocks of adv7482.

    The clocks property of the video-receiver node lists the input
    clocks of the device, which is quite the opposite from the
    original intention: the adv7482 on Salvator X boards is a
    provide of the MCLK clock for I2S audio output.

    Remove old definition of &sound_card.dais and reduce size of changes
    in the Salvator-X specific device tree source.

    Declare video-receiver a clock producer, as the adv748x driver
    implements the master clock used I2S audio output.

    Suggested-by: Geert Uytterhoeven <geert@linux-m68k.org>

v2: The driver provides only MCLK clock, not the SCLK and LRCLK,
    which are part of the I2S protocol.

    Suggested-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
---
 .../boot/dts/renesas/r8a77950-salvator-x.dts  |  3 +-
 .../boot/dts/renesas/salvator-common.dtsi     | 47 +++++++++++++++++--
 2 files changed, 44 insertions(+), 6 deletions(-)

diff --git a/arch/arm64/boot/dts/renesas/r8a77950-salvator-x.dts b/arch/arm64/boot/dts/renesas/r8a77950-salvator-x.dts
index 2438825c9b22..e16c146808b6 100644
--- a/arch/arm64/boot/dts/renesas/r8a77950-salvator-x.dts
+++ b/arch/arm64/boot/dts/renesas/r8a77950-salvator-x.dts
@@ -146,7 +146,8 @@ &sata {
 &sound_card {
 	dais = <&rsnd_port0	/* ak4613 */
 		&rsnd_port1	/* HDMI0  */
-		&rsnd_port2>;	/* HDMI1  */
+		&rsnd_port2	/* HDMI1  */
+		&rsnd_port3>;	/* adv7482 hdmi-in  */
 };
 
 &usb2_phy2 {
diff --git a/arch/arm64/boot/dts/renesas/salvator-common.dtsi b/arch/arm64/boot/dts/renesas/salvator-common.dtsi
index 98bbcafc8c0d..ead7f8d7a929 100644
--- a/arch/arm64/boot/dts/renesas/salvator-common.dtsi
+++ b/arch/arm64/boot/dts/renesas/salvator-common.dtsi
@@ -460,7 +460,7 @@ pca9654: gpio@20 {
 		#gpio-cells = <2>;
 	};
 
-	video-receiver@70 {
+	adv7482_hdmi_in: video-receiver@70 {
 		compatible = "adi,adv7482";
 		reg = <0x70 0x71 0x72 0x73 0x74 0x75
 		       0x60 0x61 0x62 0x63 0x64 0x65>;
@@ -469,6 +469,7 @@ video-receiver@70 {
 
 		#address-cells = <1>;
 		#size-cells = <0>;
+		#clock-cells = <0>; /* the MCLK for I2S output */
 
 		interrupt-parent = <&gpio6>;
 		interrupt-names = "intrq1", "intrq2";
@@ -510,6 +511,15 @@ adv7482_txb: endpoint {
 				remote-endpoint = <&csi20_in>;
 			};
 		};
+
+		port@c {
+			reg = <12>;
+
+			adv7482_i2s: endpoint {
+				remote-endpoint = <&rsnd_endpoint3>;
+				system-clock-direction-out;
+			};
+		};
 	};
 
 	csa_vdd: adc@7c {
@@ -684,7 +694,8 @@ sdhi3_pins_uhs: sd3_uhs {
 	};
 
 	sound_pins: sound {
-		groups = "ssi01239_ctrl", "ssi0_data", "ssi1_data_a";
+		groups = "ssi01239_ctrl", "ssi0_data", "ssi1_data_a",
+			 "ssi4_data", "ssi4_ctrl";
 		function = "ssi";
 	};
 
@@ -733,8 +744,8 @@ &rcar_sound {
 	pinctrl-0 = <&sound_pins &sound_clk_pins>;
 	pinctrl-names = "default";
 
-	/* Single DAI */
-	#sound-dai-cells = <0>;
+	/* multi DAI */
+	#sound-dai-cells = <1>;
 
 	/* audio_clkout0/1/2/3 */
 	#clock-cells = <1>;
@@ -758,8 +769,19 @@ &rcar_sound {
 		 <&cpg CPG_MOD 1020>, <&cpg CPG_MOD 1021>,
 		 <&cpg CPG_MOD 1019>, <&cpg CPG_MOD 1018>,
 		 <&audio_clk_a>, <&cs2000>,
-		 <&audio_clk_c>,
+		 <&adv7482_hdmi_in>,
 		 <&cpg CPG_CORE CPG_AUDIO_CLK_I>;
+	clock-names = "ssi-all",
+		      "ssi.9", "ssi.8", "ssi.7", "ssi.6",
+		      "ssi.5", "ssi.4", "ssi.3", "ssi.2",
+		      "ssi.1", "ssi.0",
+		      "src.9", "src.8", "src.7", "src.6",
+		      "src.5", "src.4", "src.3", "src.2",
+		      "src.1", "src.0",
+		      "mix.1", "mix.0",
+		      "ctu.1", "ctu.0",
+		      "dvc.0", "dvc.1",
+		      "clk_a", "clk_b", "clk_c", "clk_i";
 
 	ports {
 		#address-cells = <1>;
@@ -777,6 +799,21 @@ rsnd_endpoint0: endpoint {
 				capture  = <&ssi1 &src1 &dvc1>;
 			};
 		};
+		rsnd_port3: port@3 {
+			reg = <3>;
+			rsnd_endpoint3: endpoint {
+				remote-endpoint = <&adv7482_i2s>;
+
+				dai-tdm-slot-num = <8>;
+				dai-tdm-slot-width = <32>;
+				dai-format = "left_j";
+				mclk-fs = <256>;
+				bitclock-master = <&adv7482_i2s>;
+				frame-master = <&adv7482_i2s>;
+
+				capture = <&ssi4>;
+			};
+		};
 	};
 };
 
-- 
2.25.1.25.g9ecbe7eb18

