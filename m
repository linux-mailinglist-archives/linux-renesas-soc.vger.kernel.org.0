Return-Path: <linux-renesas-soc+bounces-30794-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id kCYMHxmczmnfowYAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-30794-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 02 Apr 2026 18:40:57 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id D136D38C10E
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 02 Apr 2026 18:40:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 4761130B1BF5
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  2 Apr 2026 16:33:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1000C3F54C3;
	Thu,  2 Apr 2026 16:33:04 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from relmlie5.idc.renesas.com (relmlor1.renesas.com [210.160.252.171])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5026E3F54B7;
	Thu,  2 Apr 2026 16:33:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=210.160.252.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775147584; cv=none; b=EtL537DWkTVLbWITEABiVUN0VvHM1FW1cvOzgbNU7j6ZMJO2rFD/k9ACeJ1QKiwfqY50dPSvSAZ7iJddL3yLBUFOQK8BrMozkb2msy5J6Jrpr8EamwPILUXj66bhzOKroP3tFQu1aZ7VH3t38KKd1CoGfbPfGse5wB9GgkyOgGo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775147584; c=relaxed/simple;
	bh=ZvSCySl+xkT9Dr6YWCZiSi1/VSIKxeHwt/7iO/PVm5g=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=GilyvXqYZ4B5V2jydx13VF4KZr0+Hstj3xEuXm7hX6xYBBEGpNRoy/o+GM5uGcUhm6o7YReH+EM9v5L5CPFCAA70Wiyok/SYytIJgtA4/8keyNiWmnvTRXEDveyAYLOezzHNV+PyhGbUqLNt+Dl5SZc+Xj5Z+XNICjep5ft8aVw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; arc=none smtp.client-ip=210.160.252.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
X-CSE-ConnectionGUID: gKzI0NIYTzWKjtHzPkgDcw==
X-CSE-MsgGUID: orBfnzr0SiqkbGM4lon7zQ==
Received: from unknown (HELO relmlir5.idc.renesas.com) ([10.200.68.151])
  by relmlie5.idc.renesas.com with ESMTP; 03 Apr 2026 01:33:01 +0900
Received: from ubuntu.adwin.renesas.com (unknown [10.226.92.38])
	by relmlir5.idc.renesas.com (Postfix) with ESMTP id 1BE7F40083E2;
	Fri,  3 Apr 2026 01:32:56 +0900 (JST)
From: John Madieu <john.madieu.xa@bp.renesas.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Magnus Damm <magnus.damm@gmail.com>
Cc: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	john.madieu@gmail.com,
	linux-renesas-soc@vger.kernel.org,
	linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	John Madieu <john.madieu.xa@bp.renesas.com>
Subject: [PATCh v3 8/8] arm64: dts: renesas: r9a09g047e57-smarc: add DA7212 audio codec support
Date: Thu,  2 Apr 2026 18:31:26 +0200
Message-ID: <20260402163126.12135-9-john.madieu.xa@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260402163126.12135-1-john.madieu.xa@bp.renesas.com>
References: <20260402163126.12135-1-john.madieu.xa@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [0.14 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	DMARC_POLICY_SOFTFAIL(0.10)[renesas.com : SPF not aligned (relaxed), No valid DKIM,none];
	HAS_LIST_UNSUB(-0.01)[];
	RCPT_COUNT_TWELVE(0.00)[14];
	TAGGED_FROM(0.00)[bounces-30794-lists,linux-renesas-soc=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_CC(0.00)[kernel.org,bp.renesas.com,gmail.com,vger.kernel.org];
	FREEMAIL_TO(0.00)[glider.be,baylibre.com,kernel.org,gmail.com];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[john.madieu.xa@bp.renesas.com,linux-renesas-soc@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	R_DKIM_NA(0.00)[];
	NEURAL_HAM(-0.00)[-0.960];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas,dt];
	FROM_HAS_DN(0.00)[]
X-Rspamd-Queue-Id: D136D38C10E
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

RZ/G3E SMARC board has a DA7212 audio codec connected via I2C1 for
sound input/output using SSI3/SSI4 where:

 - The codec receives its master clock from the Versa3 clock
   generator present on the SoM
 - SSI4 shares clock pins with SSI3 to provide a separate data
   line for full-duplex audio capture.

Enable audio support on RZ/G3E SMARC2 EVK boards with a DA7212 audio codec.

Signed-off-by: John Madieu <john.madieu.xa@bp.renesas.com>
---

Changes:

v3: No changes
v2: No changes

 .../boot/dts/renesas/r9a09g047e57-smarc.dts   | 114 ++++++++++++++++++
 1 file changed, 114 insertions(+)

diff --git a/arch/arm64/boot/dts/renesas/r9a09g047e57-smarc.dts b/arch/arm64/boot/dts/renesas/r9a09g047e57-smarc.dts
index 6372f582a7c4..7defd342294a 100644
--- a/arch/arm64/boot/dts/renesas/r9a09g047e57-smarc.dts
+++ b/arch/arm64/boot/dts/renesas/r9a09g047e57-smarc.dts
@@ -32,6 +32,37 @@
 #include "rzg3e-smarc-som.dtsi"
 #include "renesas-smarc2.dtsi"
 
+/*
+ * SSI-DA7212
+ *
+ * These commands are required when Playback/Capture
+ *
+ *	amixer -q cset name='Aux Switch' on
+ *	amixer -q cset name='Mixin Left Aux Left Switch' on
+ *	amixer -q cset name='Mixin Right Aux Right Switch' on
+ *	amixer -q cset name='ADC Switch' on
+ *	amixer -q cset name='Mixout Right Mixin Right Switch' off
+ *	amixer -q cset name='Mixout Left Mixin Left Switch' off
+ *	amixer -q cset name='Headphone Volume' 70%
+ *	amixer -q cset name='Headphone Switch' on
+ *	amixer -q cset name='Mixout Left DAC Left Switch' on
+ *	amixer -q cset name='Mixout Right DAC Right Switch' on
+ *	amixer -q cset name='DAC Left Source MUX' 'DAI Input Left'
+ *	amixer -q cset name='DAC Right Source MUX' 'DAI Input Right'
+ *	amixer -q sset 'Mic 1 Amp Source MUX' 'MIC_P'
+ *	amixer -q sset 'Mic 2 Amp Source MUX' 'MIC_P'
+ *	amixer -q sset 'Mixin Left Mic 1' on
+ *	amixer -q sset 'Mixin Right Mic 2' on
+ *	amixer -q sset 'Mic 1' 90% on
+ *	amixer -q sset 'Mic 2' 90% on
+ *	amixer -q sset 'Lineout' 80% on
+ *	amixer -q set "Headphone" 100% on
+ *
+ * When Capture chained with DVC, use this command to amplify sound
+ *	amixer set 'DVC In',0 80%
+ * For playback, use: amixer set 'DVC Out',0 80%
+ */
+
 / {
 	model = "Renesas SMARC EVK version 2 based on r9a09g047e57";
 	compatible = "renesas,smarc2-evk", "renesas,rzg3e-smarcm",
@@ -55,6 +86,22 @@ vqmmc_sd1_pvdd: regulator-vqmmc-sd1-pvdd {
 		gpios-states = <0>;
 		states = <3300000 0>, <1800000 1>;
 	};
+
+	sound_card: sound {
+		compatible = "audio-graph-card";
+
+		label = "snd-rzg3e";
+
+		dais = <&rsnd_port0>;	/* DA7212 */
+	};
+};
+
+&audio_clkb {
+	clock-frequency = <11289600>;
+};
+
+&audio_clkc {
+	clock-frequency = <12288000>;
 };
 
 &canfd {
@@ -99,6 +146,37 @@ &i2c0 {
 	pinctrl-names = "default";
 };
 
+&i2c1 {
+	da7212: codec@1a {
+		compatible = "dlg,da7212";
+		#sound-dai-cells = <0>;
+		#address-cells = <1>;
+		#size-cells = <0>;
+		reg = <0x1a>;
+
+		clocks = <&versa3 1>;
+		clock-names = "mclk";
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
+
+		port {
+			da7212_endpoint: endpoint {
+				remote-endpoint = <&rsnd_endpoint0>;
+				mclk-fs = <256>;
+			};
+		};
+	};
+};
+
 &keys {
 	pinctrl-0 = <&nmi_pins>;
 	pinctrl-names = "default";
@@ -280,6 +358,42 @@ &sdhi1 {
 	vqmmc-supply = <&vqmmc_sd1_pvdd>;
 };
 
+&snd_rzg3e {
+	pinctrl-0 = <&sound_clk_pins &sound_pins>;
+	pinctrl-names = "default";
+
+	status = "okay";
+
+	/* audio_clkout */
+	#clock-cells = <0>;
+	clock-frequency = <11289600>;
+
+	/* Multi DAI */
+	#sound-dai-cells = <1>;
+
+	ports {
+		#address-cells = <1>;
+		#size-cells = <0>;
+		rsnd_port0: port@0 {
+			reg = <0>;
+			rsnd_endpoint0: endpoint {
+				remote-endpoint = <&da7212_endpoint>;
+
+				dai-format = "i2s";
+				bitclock-master = <&rsnd_endpoint0>;
+				frame-master = <&rsnd_endpoint0>;
+
+				playback = <&ssi3>, <&src1>, <&dvc1>;
+				capture = <&ssi4>, <&src0>, <&dvc0>;
+			};
+		};
+	};
+};
+
+&ssi4 {
+	shared-pin;
+};
+
 &usb3_phy {
 	status = "okay";
 };
-- 
2.25.1


