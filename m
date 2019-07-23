Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0F4F871E9F
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 23 Jul 2019 20:04:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387413AbfGWSDr (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 23 Jul 2019 14:03:47 -0400
Received: from mail-pl1-f196.google.com ([209.85.214.196]:44768 "EHLO
        mail-pl1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728108AbfGWSDq (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 23 Jul 2019 14:03:46 -0400
Received: by mail-pl1-f196.google.com with SMTP id t14so20880348plr.11
        for <linux-renesas-soc@vger.kernel.org>; Tue, 23 Jul 2019 11:03:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id;
        bh=1TIOqRhmss/ILQ6dGAsRS8I/11uneux/Ft/KPtslfz8=;
        b=f8dCI0zhMHEiSPY68o35pzenvfQ4+eFDAAeztNaIKAjxUT6m+g0rg7aUtW4mVRjL/i
         tQf+INL0+wqUOztKJnEIti5HzkDVD/ZkFSWhNONSFaX0BBxq+WlUO5QAGK0CLgzOsDSX
         K3as7ykZpv5UKhPM2s5LPtUA/6xnl7rUoZNku0s8cbaO5CNdjti0w5cT9Qs08rB2ir5I
         683t6whwZT/JemGszEs49iRfFgkZAdtLhpYsA8mhZxGEt9a3+0fei8dW9U1t1MDIfpIk
         kviMom8TLtxmxRpAZ1jKztJQKvW1VtIbrLuMaT13+LcR7bJxTDBm11cbpOW78xsEHRa1
         K1Hw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=1TIOqRhmss/ILQ6dGAsRS8I/11uneux/Ft/KPtslfz8=;
        b=GeNybNsIH3wCnpJWcRhPBhwWDEbwaUZGeuTmsC0AN+SytWEaR3DiifGef/+cbI00pf
         I5PN7NIeHmKLGP6cHIsIMb3OSGXQ09tV+mteBP7W1rbEpYl/O+w8bz03gbPaiOrAAlIP
         SzbboJSCV/SekDxR80qv/8Z0pZ3rNe221174DbNjMiwJIXIvii++Ras4e2kFLy821Mse
         6LlU73Byl1eceGjytAIXlubnB8dThgIdZMqqUjdjSIrAAtAvGy+xIk3yv2k0/L6hQBoP
         1hcCOlD9y7sdsIQNwqVwMmA1IK850gIPBpvIJidD/kbITbQmX/8CtBqq+ydDsAbQrO+G
         TlsQ==
X-Gm-Message-State: APjAAAX/VVPAzu8x6UisXYNYEoqqW5zNvd5BzUa5W7IGfBm9EOu2r/wg
        5W9KTdZtFEbkQULI9PYie8inm0Ep
X-Google-Smtp-Source: APXvYqwkNMk/D1dT8XUrS0aDZ7DSLZPr9tlvafvfKtUG3xc4qiopu2JFr4HthixHv2hp5VO8Y1IsuA==
X-Received: by 2002:a17:902:9f8e:: with SMTP id g14mr35835075plq.67.1563905025772;
        Tue, 23 Jul 2019 11:03:45 -0700 (PDT)
Received: from localhost.localdomain (KD118155013174.ppp-bb.dion.ne.jp. [118.155.13.174])
        by smtp.gmail.com with ESMTPSA id v138sm50594318pfc.15.2019.07.23.11.03.43
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
        Tue, 23 Jul 2019 11:03:45 -0700 (PDT)
From:   Yoshihiro Kaneko <ykaneko0929@gmail.com>
To:     linux-renesas-soc@vger.kernel.org
Cc:     Simon Horman <horms@verge.net.au>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        Magnus Damm <magnus.damm@gmail.com>,
        linux-arm-kernel@lists.infradead.org
Subject: [PATCH] arm64: dts: renesas: ulcb-kf: sort nodes
Date:   Wed, 24 Jul 2019 03:03:35 +0900
Message-Id: <1563905015-2911-1-git-send-email-ykaneko0929@gmail.com>
X-Mailer: git-send-email 1.9.1
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Sort nodes.

If node address is present
   * Sort by node address, grouping all nodes with the same compat string
     and sorting the group alphabetically.
Else
   * Sort alphabetically

This should not have any run-time effect.

Signed-off-by: Yoshihiro Kaneko <ykaneko0929@gmail.com>
---

This patch is based on the devel branch of Simon Horman's renesas tree.

 arch/arm64/boot/dts/renesas/ulcb-kf.dtsi | 118 +++++++++++++++----------------
 1 file changed, 59 insertions(+), 59 deletions(-)

diff --git a/arch/arm64/boot/dts/renesas/ulcb-kf.dtsi b/arch/arm64/boot/dts/renesas/ulcb-kf.dtsi
index 27851a7..5ac22a8 100644
--- a/arch/arm64/boot/dts/renesas/ulcb-kf.dtsi
+++ b/arch/arm64/boot/dts/renesas/ulcb-kf.dtsi
@@ -100,13 +100,6 @@
 			line-name = "Audio_Out_OFF";
 		};
 
-		sd-wifi-mux {
-			gpio-hog;
-			gpios = <5 GPIO_ACTIVE_HIGH>;
-			output-low;	/* Connect WL1837 */
-			line-name = "SD WiFi mux";
-		};
-
 		hub_pwen {
 			gpio-hog;
 			gpios = <6 GPIO_ACTIVE_HIGH>;
@@ -121,6 +114,13 @@
 			line-name = "HUB rst";
 		};
 
+		otg_extlpn {
+			gpio-hog;
+			gpios = <9 GPIO_ACTIVE_HIGH>;
+			output-high;
+			line-name = "OTG EXTLPn";
+		};
+
 		otg_offvbusn {
 			gpio-hog;
 			gpios = <8 GPIO_ACTIVE_HIGH>;
@@ -128,11 +128,11 @@
 			line-name = "OTG OFFVBUSn";
 		};
 
-		otg_extlpn {
+		sd-wifi-mux {
 			gpio-hog;
-			gpios = <9 GPIO_ACTIVE_HIGH>;
-			output-high;
-			line-name = "OTG EXTLPn";
+			gpios = <5 GPIO_ACTIVE_HIGH>;
+			output-low;	/* Connect WL1837 */
+			line-name = "SD WiFi mux";
 		};
 
 		snd_rst {
@@ -279,14 +279,50 @@
 		power-source = <3300>;
 	};
 
+	sound_pcm_pins: sound-pcm {
+		groups = "ssi349_ctrl", "ssi3_data", "ssi4_data";
+		function = "ssi";
+	};
+
 	usb0_pins: usb0 {
 		groups = "usb0";
 		function = "usb0";
 	};
+};
 
-	sound_pcm_pins: sound-pcm {
-		groups = "ssi349_ctrl", "ssi3_data", "ssi4_data";
-		function = "ssi";
+&rcar_sound {
+	pinctrl-0 = <&sound_pins
+		     &sound_clk_pins
+		     &sound_pcm_pins>;
+
+	ports {
+		/* rsnd_port0/1 are on salvator-common */
+		rsnd_port2: port@2 {
+			reg = <2>;
+			rsnd_for_pcm3168a_play: endpoint {
+				remote-endpoint = <&pcm3168a_endpoint_p>;
+
+				dai-format = "i2s";
+				bitclock-master = <&rsnd_for_pcm3168a_play>;
+				frame-master = <&rsnd_for_pcm3168a_play>;
+				dai-tdm-slot-num = <8>;
+
+				playback = <&ssi3>;
+			};
+		};
+		rsnd_port3: port@3 {
+			reg = <3>;
+			rsnd_for_pcm3168a_capture: endpoint {
+				remote-endpoint = <&pcm3168a_endpoint_c>;
+
+				dai-format = "i2s";
+				bitclock-master = <&rsnd_for_pcm3168a_capture>;
+				frame-master = <&rsnd_for_pcm3168a_capture>;
+				dai-tdm-slot-num = <6>;
+
+				capture  = <&ssi4>;
+			};
+		};
 	};
 };
 
@@ -322,17 +358,6 @@
 	};
 };
 
-&usb2_phy0 {
-	pinctrl-0 = <&usb0_pins>;
-	pinctrl-names = "default";
-
-	status = "okay";
-};
-
-&xhci0 {
-	status = "okay";
-};
-
 &sound_card {
 	dais = <&rsnd_port0	/* ak4613 */
 		&rsnd_port1	/* HDMI0  */
@@ -341,42 +366,17 @@
 		>;
 };
 
-&rcar_sound {
-	pinctrl-0 = <&sound_pins
-		     &sound_clk_pins
-		     &sound_pcm_pins>;
-
-	ports {
-		/* rsnd_port0/1 are on salvator-common */
-		rsnd_port2: port@2 {
-			reg = <2>;
-			rsnd_for_pcm3168a_play: endpoint {
-				remote-endpoint = <&pcm3168a_endpoint_p>;
-
-				dai-format = "i2s";
-				bitclock-master = <&rsnd_for_pcm3168a_play>;
-				frame-master = <&rsnd_for_pcm3168a_play>;
-				dai-tdm-slot-num = <8>;
-
-				playback = <&ssi3>;
-			};
-		};
-		rsnd_port3: port@3 {
-			reg = <3>;
-			rsnd_for_pcm3168a_capture: endpoint {
-				remote-endpoint = <&pcm3168a_endpoint_c>;
+&ssi4 {
+	shared-pin;
+};
 
-				dai-format = "i2s";
-				bitclock-master = <&rsnd_for_pcm3168a_capture>;
-				frame-master = <&rsnd_for_pcm3168a_capture>;
-				dai-tdm-slot-num = <6>;
+&usb2_phy0 {
+	pinctrl-0 = <&usb0_pins>;
+	pinctrl-names = "default";
 
-				capture  = <&ssi4>;
-			};
-		};
-	};
+	status = "okay";
 };
 
-&ssi4 {
-	shared-pin;
+&xhci0 {
+	status = "okay";
 };
-- 
1.9.1

