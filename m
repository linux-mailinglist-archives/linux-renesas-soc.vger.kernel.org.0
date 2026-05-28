Return-Path: <linux-renesas-soc+bounces-33250-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id GFKiLz70F2q5WAgAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-33250-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 28 May 2026 09:52:30 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E4B35EE01C
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 28 May 2026 09:52:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 36D3F3218785
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 28 May 2026 07:46:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B1A4035203C;
	Thu, 28 May 2026 07:46:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KMFYtORR"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C408D34FF40
	for <linux-renesas-soc@vger.kernel.org>; Thu, 28 May 2026 07:46:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779954383; cv=none; b=T9qVmEt+hwe+FTOlcqGmY0SFxhj/k+3aPdqgp754PZ2ACiqddYrovb+j17OiQK2V5PKSTwwrCloKqMB7X5lycB50nYX0GIzbLh4upeL6SnrN5y6DWzLjLG2+22MQGt5ZVJXFoMptWTj2SaP4dP+sm2URIgWLahz1vhY4GrqvQe0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779954383; c=relaxed/simple;
	bh=T2BbW+F04dL5BYNDF02sLvZ+Bg+ug+6Nq73MnadW3Jg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Vr18yOogNuFmrthMldsz7XFGhkntMg667LbljU/5BMuELYhsamY2pNc02TbRCSWapgnz8pxPIXLqY6QdXO7DxjkyhPIjokJl4DyHjn3F0UH4+2Bzv7J8RQugcty2h3S2Vld3hUs1H3RVzrRaK0YaDqgQNb0BZDU6bbIJ0CwzNCs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KMFYtORR; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-49068493267so29027735e9.1
        for <linux-renesas-soc@vger.kernel.org>; Thu, 28 May 2026 00:46:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779954380; x=1780559180; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=x9zM5o3H4qWfdcvyLtZEOcC72mRexEYzz1hosJKfOgA=;
        b=KMFYtORRUjBrnsqHgY2aCxS5W733hdgjmpedIFujfndvCRQIYpBmrg83fdGeijYwF9
         rIjpGz6wUdXWsUyugGW+WfbVkjqR5xenXCpvXQ0+dewTudt6WrRMKNneDk9lFxcSKptr
         J0NbuqaJ+gtRLBFkz8ms2mDYoHt2zbbaBFTxWluTXwZ6xw+SE5Rk0JwnyxIjDKDyRUeI
         /g8yuC0s+kzB6QNoPtwKfsDwvIGB4fPSlVOxhyO0P8TWB756LqkAb5jMZQwb/Nsqc5ZV
         UEOBAQKzqSnm42jprAMJFWBiti5I/1k+ZAcgp/BsjZp5rdl8luN3SD5YH17h+oKNYNED
         GuIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779954380; x=1780559180;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=x9zM5o3H4qWfdcvyLtZEOcC72mRexEYzz1hosJKfOgA=;
        b=hVtjPcR0IXd2Yuuo3KVd+q6lRboo0Z9QLWhP4e9fRuj1Qnz2uG3plCr+KcAjojp06L
         GblADXEbyG3dN6HWTkMzIMptq6RT6isRyKZOcaxz3glhZP6hux1HKSgEdoYamfIj8YZ0
         aoxndxFiEAPjWHUt1BCPSGAJ3d528QIXXGBleeptZw6omPWUlo48wsodGBjMmVDmeWbN
         GEiyJPl5jJxTWviSd4ATy8C7zI8FvR6HPKDVbBvVTn++VMcgd8mJPN0KksN73hUAoq1N
         Q2A5z1UVTurjau/ioeSy2b/WAg86WztHCozBFcc1l1YAtJDRewLD1tldQqFICjBaZ9WR
         qYmg==
X-Forwarded-Encrypted: i=1; AFNElJ+T+SogvdYXR11fN5wvcfqnAAbWchVyuQpPgjVaDZzdGRzdHOkcqwQjo5s4uD1NrvnA3Ddq9Pw5X4jZ/i8vNikkMw==@vger.kernel.org
X-Gm-Message-State: AOJu0YzgOChDyAZN9adfNMb+vl6sTBFBDC2zRjTA6iAARr9Junmhi26K
	olZ72a1enp8E1zUSa/D9q42wreBk6hFvIRUChdlcRDYlE+V7axm0ZiaJ
X-Gm-Gg: Acq92OHXtviKjTb8z9KlxsikCrHsaCK3L/sNLqWeWfgYPGyRDAYyVpFSKqKAUlRMy+u
	WQjqYP4dTDbbIZYLYHiG7TnSBER/zDeNI9xPnPsTY2yqSXchh+KuJdrp5cLjEPmpZplhlzZ4Aqh
	PydvwB7/txnjYM7aIdTOT5FSDwPsGdABHTD/Lq3lJH98HbMCTHCedrmdCzfwyqewC1wYTrRG4pI
	5spUpOupsK5V49ip/za4LCBfyi2aieil0qTo5HYr27jBFdF9MXlIbL2qkzD/mY4r7UE/uNP4ZY3
	4Y8axeQWNvleJMUA5wxZMXyWLP7v77BsiNXZQ2RqXBhZNcFg1QzNmE8WbtkhvD5r+IjZfS4HgmH
	algslHPad5447RSkFtrb8SIJPKEMTj1xf/Ib80J0x9+OifU3m01JcHLPvvF/DF0TGvgRiZ8Sse5
	ViRA0YF4hj7oVXiyvcr3dLaMwW1Th6mmDWQbM6Lk1Q25lHtnY/dbRJCmF/4gk=
X-Received: by 2002:a05:600c:8681:b0:490:778:4fe8 with SMTP id 5b1f17b1804b1-490428ce8c7mr305045955e9.25.1779954380059;
        Thu, 28 May 2026 00:46:20 -0700 (PDT)
Received: from localhost.localdomain ([2a00:23c4:a700:7301:c724:a823:10ad:6b85])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4908f0a3c2dsm10865885e9.31.2026.05.28.00.46.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 28 May 2026 00:46:19 -0700 (PDT)
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
Subject: [PATCH v2 2/2] arm64: dts: renesas: r9a08g046l48-smarc: Enable audio
Date: Thu, 28 May 2026 08:45:45 +0100
Message-ID: <20260528074615.91110-3-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260528074615.91110-1-biju.das.jz@bp.renesas.com>
References: <20260528074615.91110-1-biju.das.jz@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-33250-lists,linux-renesas-soc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_CC(0.00)[bp.renesas.com,vger.kernel.org,gmail.com];
	PRECEDENCE_BULK(0.00)[];
	FREEMAIL_TO(0.00)[glider.be,gmail.com,kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[gmail.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	FROM_NEQ_ENVFROM(0.00)[bijudasau@gmail.com,linux-renesas-soc@vger.kernel.org];
	NEURAL_HAM(-0.00)[-0.999];
	DBL_PROHIBIT(0.00)[0.0.0.0:email];
	RCVD_COUNT_FIVE(0.00)[5];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas,dt];
	FREEMAIL_FROM(0.00)[gmail.com];
	DBL_BLOCKED_OPENRESOLVER(0.00)[2.220.108.0:email,renesas.com:email,bp.renesas.com:mid,1a:email,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo]
X-Rspamd-Queue-Id: 1E4B35EE01C
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

From: Biju Das <biju.das.jz@bp.renesas.com>

Enable audio on RZ/G3L SMARC EVK by linking SSI0 with DA7212 audio CODEC.
The SSI0 signals are multiplexed with SD2 and are selected by a switch
SW_SD2_EN#. Add regulator nodes regulator-{1p8v,3p3v} to SoM DTSI for
reuse with eMMC.

Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
v1->v2:
 * Added guard for snd_rzg3l with the SW_I3C_EN macro.
 * Sorted ssi0_pins.
---
 .../boot/dts/renesas/r9a08g046l48-smarc.dts   | 72 +++++++++++++++++++
 .../boot/dts/renesas/rzg3l-smarc-som.dtsi     | 22 ++++++
 2 files changed, 94 insertions(+)

diff --git a/arch/arm64/boot/dts/renesas/r9a08g046l48-smarc.dts b/arch/arm64/boot/dts/renesas/r9a08g046l48-smarc.dts
index 1512b7df39bd..32d3b08a3cf3 100644
--- a/arch/arm64/boot/dts/renesas/r9a08g046l48-smarc.dts
+++ b/arch/arm64/boot/dts/renesas/r9a08g046l48-smarc.dts
@@ -9,6 +9,7 @@
 
 /* Switch selection settings */
 #define RZ_BOOT_MODE3		1
+#define SW_SD2_EN		0
 #define SW_DPI_EN		0
 #define SW_GPIO4		1
 #define SW_I3C_EN		0
@@ -38,6 +39,32 @@ aliases {
 		i2c3 = &i2c3;
 		serial3 = &scif0;
 	};
+
+#if !SW_SD2_EN && !SW_I3C_EN
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
+		pinmux = <RZG3L_PORT_PINMUX(H, 0, 9)>, /* SSIF0_RXD */
+			 <RZG3L_PORT_PINMUX(H, 1, 9)>, /* SSIF0_BCK */
+			 <RZG3L_PORT_PINMUX(H, 2, 9)>, /* SSIF0_RCK */
+			 <RZG3L_PORT_PINMUX(H, 3, 9)>; /* SSIF0_TXD */
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
index 5e58e08e7fad..091a227233cb 100644
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


