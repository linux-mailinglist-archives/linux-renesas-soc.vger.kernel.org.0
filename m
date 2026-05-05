Return-Path: <linux-renesas-soc+bounces-32081-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id gCnJKMnl+Wn2EwMAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-32081-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 05 May 2026 14:42:49 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 40FC54CDC36
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 05 May 2026 14:42:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 7B21B304873C
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  5 May 2026 12:38:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7F7D547D952;
	Tue,  5 May 2026 12:37:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="OnfzBPYm"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE4C847B41F
	for <linux-renesas-soc@vger.kernel.org>; Tue,  5 May 2026 12:37:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777984639; cv=none; b=LmdOaHQqYDP7DZ9kIJdZQoXjeiID3AUry6wLm8cFzS49i31khM30kUEivehzX4CqwdI8J8tzxnEix70/V2ZMGpnauLzrb/uxa+Mkt3a/wBcZKP9NZ+hd0fC0SN+O0jYwa/rPne5rXOWnuAvcuaj3lCvnp1u+lThJzLwtUKrRCgM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777984639; c=relaxed/simple;
	bh=b/mak/r1sycuwjITYX91V+q/izoc3h3s54xC5DZ+fcA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=g1adxbuSxB4xC5+vZcaqnXv8ijf0emo+PLUEbS2M0BLhg4qaK0DL457+HHtrDFd6fm4dV18c/l0qXdiQ/TPDd+FM4ZtKdQ6kjTOy/pPs8LmE7+bHEp7W588x+O8l/INPEVN2Bm1KTADI/zVpJEyN1d/izL8YcFKraSu0yYKfmWQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=OnfzBPYm; arc=none smtp.client-ip=209.85.221.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-44a044cb827so3639666f8f.0
        for <linux-renesas-soc@vger.kernel.org>; Tue, 05 May 2026 05:37:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777984636; x=1778589436; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Nf+neV8yauOFpv4dlYkHYDMAjiQADvKWuGkswiXLOt0=;
        b=OnfzBPYmNTD8bBHa9ZfbG8AbCjQqjRqs2KYgGKQjptqgqxCVz34bHjN+m+cWq6prJJ
         NxzCQ6DEIuIMqOjg3baJR+ATq4CT+reFWbm/fKtaqmnb35jX2YLuGARNCZuCJqhZuGX6
         aYmCi60OkJ8f5rqzOQgoPHbEm/7JpJf6ZWFpFDmHGTx1qB1Fp6Rr1kshJE0QltGGMccY
         GdedP2OlXADW6jCGukTUmsOSDyGyAN/dCzCqMHUPprW10zQ1kR/MCueDcdxH/kLZMNOe
         OCVSslUyX///Enx/g0oxquP/ao6Md5i8clmIefQAj9m8kCrahZ0CxXDsAvsv/hRirEMs
         /zBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777984636; x=1778589436;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Nf+neV8yauOFpv4dlYkHYDMAjiQADvKWuGkswiXLOt0=;
        b=rDXjYHxfA24uto0sGmo0RXHlIHjNvoNN8GfG9zNwrkwVOMzD8Ce80jCxSoXLy8DaZW
         OEZbANP5ioBwAhvTicZIrrsureFz7rMiI17vP3si6ULIuxwF6gP2OsV19XqxoIDSLw7Z
         liYqs8Mdfg60cui3/4aD83DK7tH5xsgtUok7yBroV2uk3pQFNcasqzyZj8tSx8glIFWJ
         dPT3mc0xBwQMRJvrmivp/oJNu5725wCrsFGsRKKCmE84QeNeXEhEVZwnqN9XIO5b5WPm
         b7YiqJ2cjhXcs/3mc3ajQli1maCxv/yRk0RReuBvUqaHI78JiyzFhYhvA8AvxWZSqAf1
         GxAg==
X-Forwarded-Encrypted: i=1; AFNElJ9R5Az5JLgsLPfR5Dep1M/xPTcCIcvI7ZbPQmC77puvMJJH9Vrdl++d8Le2R2iCvUVX106vyo6tdtlfqvkslfVRYg==@vger.kernel.org
X-Gm-Message-State: AOJu0YxnsrH3kyrGNAESVfmP5gGwEG1KRz1Xq+1vubaK9Lk3zbvw1kDX
	Zu00HxKmbLyUsFDrj04+DpdJYL7fk78f9pBr7pn+87tAVAWN5sh+HJAN
X-Gm-Gg: AeBDiesYaqoXTyUzYPD0jKa6iZeR/+WmFrEepaZC+8MQzDPt4ucGJx71Q7o9cdi2xAU
	nwtUCRp1i/6mABfpRY7WbTgo7jjwoftpfKG+vISspJ0B1rNt3x+fsRemJhT8kj2umPApOn3DFIc
	oH1NBFReRmms9pZSPS9O6LHl8X+GSpc2EG/H/7vGMQ0IAgd/1nDPHQvLUfCvJukLmt6HS8aBVuI
	UH+ftFOjik23bNuf0rBGXD9DjuVt3orrLhpr/Nsor6VW5n86FoBjL6iSMjnjoZlweJFKcAN4fYN
	9xZ9nPb8GaLUy7RYp4s0QwPHkRCqlh1SMbLO5K4Gh0oeOhRRLeeyMhuXp5EDUUJ3/HlqHCwWBAz
	qZsnjFJ/pe5PAn7OX14/IIj0mzuXfVmI/HFpmIk6eaF49iZZicojue+QvfXlGpqoYCZgbymkU/S
	UeXBgf5J5I7ENPhGGVE52Jl+yS/x/uoZcONOOi5yq+72YiHtpQRT9rAF7p66g=
X-Received: by 2002:a05:6000:2512:b0:43d:77e1:6a66 with SMTP id ffacd0b85a97d-44bb33f1d66mr23648585f8f.8.1777984636108;
        Tue, 05 May 2026 05:37:16 -0700 (PDT)
Received: from localhost.localdomain ([2a00:23c4:a758:8a01:1da3:f63c:84a5:197e])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-45055960902sm4703780f8f.28.2026.05.05.05.37.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 May 2026 05:37:15 -0700 (PDT)
From: Biju <biju.das.au@gmail.com>
X-Google-Original-From: Biju <biju.das.jz@bp.renesas.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: Biju Das <biju.das.jz@bp.renesas.com>,
	linux-renesas-soc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Biju Das <biju.das.au@gmail.com>
Subject: [PATCH 5/5] arm64: dts: renesas: r9a08g046l48-smarc: Enable audio
Date: Tue,  5 May 2026 13:37:03 +0100
Message-ID: <20260505123708.134069-6-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260505123708.134069-1-biju.das.jz@bp.renesas.com>
References: <20260505123708.134069-1-biju.das.jz@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: 40FC54CDC36
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [3.84 / 15.00];
	SEM_URIBL(3.50)[0.0.0.0:email];
	R_MISSING_CHARSET(0.50)[];
	MAILLIST(-0.15)[generic];
	BAD_REP_POLICIES(0.10)[];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-32081-lists,linux-renesas-soc=lfdr.de];
	FROM_NEQ_ENVFROM(0.00)[bijudasau@gmail.com,linux-renesas-soc@vger.kernel.org];
	DMARC_POLICY_ALLOW(0.00)[gmail.com,none];
	FREEMAIL_CC(0.00)[bp.renesas.com,vger.kernel.org,gmail.com];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[glider.be,gmail.com,kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	TO_DN_SOME(0.00)[];
	R_DKIM_ALLOW(0.00)[gmail.com:s=20251104];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_SPAM(0.00)[0.893];
	FREEMAIL_FROM(0.00)[gmail.com];
	DBL_PROHIBIT(0.00)[2.220.108.0:email];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_HAS_DN(0.00)[];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas,dt];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	R_SPF_ALLOW(0.00)[+ip4:172.232.135.74:c];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	ARC_ALLOW(0.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DBL_BLOCKED_OPENRESOLVER(0.00)[bp.renesas.com:mid,renesas.com:email,0.0.0.0:email,1a:email]

From: Biju Das <biju.das.jz@bp.renesas.com>

Enable audio on RZ/G3L SMARC EVK by linking SSI0 with DA7212 audio CODEC.
The SSI0 signals are multiplexed with SD2 and are selected by a switch
SW_SD2_EN#. Add regulator nodes regulator-{1p8v,3p3v} to SoM DTSI for
reuse with eMMC.

Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
 .../boot/dts/renesas/r9a08g046l48-smarc.dts   | 72 +++++++++++++++++++
 .../boot/dts/renesas/rzg3l-smarc-som.dtsi     | 22 ++++++
 2 files changed, 94 insertions(+)

diff --git a/arch/arm64/boot/dts/renesas/r9a08g046l48-smarc.dts b/arch/arm64/boot/dts/renesas/r9a08g046l48-smarc.dts
index 9752d9d6a59c..80fb4e53c24b 100644
--- a/arch/arm64/boot/dts/renesas/r9a08g046l48-smarc.dts
+++ b/arch/arm64/boot/dts/renesas/r9a08g046l48-smarc.dts
@@ -9,6 +9,7 @@
 
 /* Switch selection settings */
 #define RZ_BOOT_MODE3		0
+#define SW_SD2_EN		0
 #define SW_DPI_EN		0
 #define SW_GPIO4		0
 #define SW_I3C_EN		0
@@ -38,6 +39,32 @@ aliases {
 		i2c3 = &i2c3;
 		serial3 = &scif0;
 	};
+
+#if !SW_SD2_EN
+	snd_rzg3l: sound {
+		compatible = "simple-audio-card";
+		simple-audio-card,name = "snd_rzg3l";
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		ssi_link_play: simple-audio-card,dai-link@0 {
+			reg = <0>;
+			format = "i2s";
+			bitclock-master = <&cpu_dai>;
+			frame-master = <&cpu_dai>;
+			mclk-fs = <256>;
+
+			cpu_dai: cpu {
+				sound-dai = <&ssi0>;
+			};
+
+			codec_dai: codec {
+				sound-dai = <&da7212>;
+				clocks = <&versa3 1>;
+			};
+		};
+	};
+#endif
 };
 
 &i2c2 {
@@ -53,6 +80,27 @@ &i2c3 {
 	pinctrl-names = "default";
 
 	status = "okay";
+
+	da7212: codec@1a {
+		compatible = "dlg,da7212";
+		reg = <0x1a>;
+
+		clocks = <&versa3 1>;
+		clock-names = "mclk";
+
+		#sound-dai-cells = <0>;
+
+		dlg,micbias1-lvl = <2500>;
+		dlg,micbias2-lvl = <2500>;
+		dlg,dmic-data-sel = "lrise_rfall";
+		dlg,dmic-samplephase = "between_clkedge";
+		dlg,dmic-clkrate = <3000000>;
+
+		VDDA-supply = <&reg_1p8v>;
+		VDDSP-supply = <&reg_3p3v>;
+		VDDMIC-supply = <&reg_3p3v>;
+		VDDIO-supply = <&reg_1p8v>;
+	};
 };
 #endif
 
@@ -71,6 +119,11 @@ &keys {
 };
 
 &pinctrl {
+	audio_clk_pins: audio-clock {
+		pinmux = <RZG3L_PORT_PINMUX(H, 4, 6)>, /* AUDIO_CLK_B */
+			 <RZG3L_PORT_PINMUX(H, 5, 6)>; /* AUDIO_CLK_C */
+	};
+
 	i2c2_pins: i2c2 {
 		pinmux = <RZG3L_PORT_PINMUX(A, 4, 4)>, /* RIIC2_SCL */
 			 <RZG3L_PORT_PINMUX(A, 5, 4)>; /* RIIC2_SDA */
@@ -85,9 +138,28 @@ scif0_pins: scif0 {
 		pins = "SCIF0_TXD", "SCIF0_RXD";
 		power-source = <1800>;
 	};
+
+	ssi0_pins: ssi0 {
+		pinmux = <RZG3L_PORT_PINMUX(H, 1, 9)>, /* SSIF0_BCK */
+			 <RZG3L_PORT_PINMUX(H, 2, 9)>, /* SSIF0_RCK */
+			 <RZG3L_PORT_PINMUX(H, 3, 9)>, /* SSIF0_TXD */
+			 <RZG3L_PORT_PINMUX(H, 0, 9)>; /* SSIF0_RXD */
+	};
 };
 
 &scif0 {
 	pinctrl-0 = <&scif0_pins>;
 	pinctrl-names = "default";
 };
+
+#if !SW_SD2_EN
+&ssi0 {
+	clocks = <&cpg CPG_MOD R9A08G046_SSI0_PCLK2>,
+		 <&cpg CPG_MOD R9A08G046_SSI0_PCLK_SFR>,
+		 <&versa3 2>, <&versa3 3>;
+	pinctrl-0 = <&audio_clk_pins>, <&ssi0_pins>;
+	pinctrl-names = "default";
+
+	status = "okay";
+};
+#endif
diff --git a/arch/arm64/boot/dts/renesas/rzg3l-smarc-som.dtsi b/arch/arm64/boot/dts/renesas/rzg3l-smarc-som.dtsi
index 419a0e1584bc..0c5b195ec57e 100644
--- a/arch/arm64/boot/dts/renesas/rzg3l-smarc-som.dtsi
+++ b/arch/arm64/boot/dts/renesas/rzg3l-smarc-som.dtsi
@@ -13,6 +13,10 @@
  *      0 - SMARC_I2C_GP is enabled
  *      1 - I3C is enabled
  *
+ * Switch position SYS.4, Macro SW_SD2_EN:
+ *      0 - Select I2S0
+ *      1 - Select SD2
+ *
  * Switch position SYS.5, Macro SW_DPI_EN:
  *      0 - Select multiple SMARC signals active
  *      1 - Select LCD
@@ -41,6 +45,24 @@ memory@48000000 {
 		reg = <0x0 0x48000000 0x0 0x78000000>;
 	};
 
+	reg_1p8v: regulator-1p8v {
+		compatible = "regulator-fixed";
+		regulator-name = "fixed-1.8V";
+		regulator-min-microvolt = <1800000>;
+		regulator-max-microvolt = <1800000>;
+		regulator-boot-on;
+		regulator-always-on;
+	};
+
+	reg_3p3v: regulator-3p3v {
+		compatible = "regulator-fixed";
+		regulator-name = "fixed-3.3V";
+		regulator-min-microvolt = <3300000>;
+		regulator-max-microvolt = <3300000>;
+		regulator-boot-on;
+		regulator-always-on;
+	};
+
 	x2_clk: x2-clock {
 		compatible = "fixed-clock";
 		#clock-cells = <0>;
-- 
2.43.0


