Return-Path: <linux-renesas-soc+bounces-33027-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id YKnFHEqSEGqIZgYAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-33027-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 22 May 2026 19:28:42 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id BBF1A5B82FF
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 22 May 2026 19:28:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 4F402306D0DD
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 22 May 2026 17:20:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7A219360EEE;
	Fri, 22 May 2026 17:20:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="hbnJAJwA";
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="aD6Ea5pZ"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mout-p-202.mailbox.org (mout-p-202.mailbox.org [80.241.56.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 22FEE2D94B5;
	Fri, 22 May 2026 17:20:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.241.56.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779470429; cv=none; b=chwgPoTVx3CBjg5WtkXav1r12Wfwa2AoaDpd/Zw4HCu57HqCw5E7AtfEo5NvxirS9s9sYbwMUohJ0BB2LrJfRKqvEFuOp7eDtsDcGPQsTkpG1gi3YLouABh69XKOk9j+MptRuyEWPqVQG5y5TEd7shK4yl7Oit9dvuBTl0fdAJ0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779470429; c=relaxed/simple;
	bh=DANtceujiGoj2POLX5MbBNJT+cQy8ghBhZ0mDPBWyYY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=kg/k6vwlaw3MG3ZU4iVV0OJEzJpWZmglLWVQazMevpClFZfBxmljdC3YUf4k423/bFvzGgDeDhLCBGuBlXOSJv2qXKLnXQKcOR90WyL9nRnbttSy+3suHvsI80JS4ZFJu/mEk91H51GeykUzkkemB1X0dTLyLMrt/G9c4DK/wtY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org; spf=pass smtp.mailfrom=mailbox.org; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=hbnJAJwA; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=aD6Ea5pZ; arc=none smtp.client-ip=80.241.56.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mailbox.org
Received: from smtp102.mailbox.org (smtp102.mailbox.org [10.196.197.102])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-202.mailbox.org (Postfix) with ESMTPS id 4gMX8x19rjz9spn;
	Fri, 22 May 2026 19:20:17 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1779470417;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=RRUXz6EPHvSlNCo/xjx+JIckd1Ua8opeBCSfiKKE/Sc=;
	b=hbnJAJwAPOFVD0LU9gvdBbFlnyzbRsOuPPCj6Nxu+J37bp+TSn17d9TZRtZ1hATqXuR0Rh
	xavl+XL8gbCIgd+M+GA19gD+sT65SzL+Ee0sVdvu8Q1/n2NcRVcHIyX25VX4YX0wq40Vns
	/f6/ktKif9fXf6MFriPG0swrvcsD247SN1pEjv/eSXuGqAjkhXXuErPRabksqW5I1w8DP4
	myqpK4I3p61bxbbyterd7lqE/Si4tgS9LtiDhjeDpEgbaS6gv7FISK6QCi0RX6+0aMwI1S
	h8NBJdYMM2gozjpIyspepDYelMmkUmbD9i9nRSwyvxLrXWVvD9jpThvXidQ40Q==
From: Marek Vasut <marek.vasut+renesas@mailbox.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1779470415;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=RRUXz6EPHvSlNCo/xjx+JIckd1Ua8opeBCSfiKKE/Sc=;
	b=aD6Ea5pZ7qX7Y9McsOXIi++i8FDkp3/oj1avawMgKSMNoQqW2pReit4rfgaN6jLW8x50Ys
	9NPaDs7Vws3EqrpsJ48mYIiUfYzsBpkkIEQgg/QAspQdKOTWw1h2whVBDxPJz8v5lXCl+D
	1Y25ogKSzUs2URne9RD2fsWwADaSxbFD5dxM7/NQUEQkcAeaWE6KzbcrvTbjjfur3IRljp
	i7UJFHBnENC/RxLqchT9pGn4OClYnvYFFMIkNSqutdWVV194qwJucfP+UFjj3MvWrZpunw
	H4aTB3tiJYsDWDa9WpDW4H0SsoAiKMRflo/f8eunn24buUt/+5C1IJFwuc2HSg==
To: linux-arm-kernel@lists.infradead.org
Cc: Nguyen Tran <nguyen.tran.pz@bp.renesas.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Marek Vasut <marek.vasut+renesas@mailbox.org>,
	Brian Masney <bmasney@redhat.com>,
	Conor Dooley <conor+dt@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
	Magnus Damm <magnus.damm@gmail.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Rob Herring <robh@kernel.org>,
	Stephen Boyd <sboyd@kernel.org>,
	Ulf Hansson <ulfh@kernel.org>,
	Wolfram Sang <wsa+renesas@sang-engineering.com>,
	devicetree@vger.kernel.org,
	linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-mmc@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org
Subject: [PATCH v3] arm64: dts: renesas: r8a779md: Add support for R-Car M3Le R8A779MD Geist
Date: Fri, 22 May 2026 19:19:57 +0200
Message-ID: <20260522172000.15096-1-marek.vasut+renesas@mailbox.org>
In-Reply-To: <CAMuHMdWwantdbvPSFoYm=+_OoQQkKwz+K=qwWgy-7tSp1BNJBw@mail.gmail.com>
References: <CAMuHMdWwantdbvPSFoYm=+_OoQQkKwz+K=qwWgy-7tSp1BNJBw@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-MBO-RS-ID: 2561115298b3447d8b3
X-MBO-RS-META: a31ckyqay9xo7ja8x8sgf5i7apn5kwsp
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[mailbox.org,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[mailbox.org:s=mail20150812];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCPT_COUNT_TWELVE(0.00)[19];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-33027-lists,linux-renesas-soc=lfdr.de,renesas];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[bp.renesas.com,glider.be,mailbox.org,redhat.com,kernel.org,renesas.com,gmail.com,baylibre.com,sang-engineering.com,vger.kernel.org];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-0.996];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[marek.vasut@mailbox.org,linux-renesas-soc@vger.kernel.org];
	DKIM_TRACE(0.00)[mailbox.org:+];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas,dt];
	MISSING_XM_UA(0.00)[];
	FROM_HAS_DN(0.00)[]
X-Rspamd-Queue-Id: BBF1A5B82FF
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

From: Nguyen Tran <nguyen.tran.pz@bp.renesas.com>

Add support for the Geist board based on the Renesas R-Car R8A779MD (M3Le)
SoC, a register-compatible variant of the R8A77965 (M3-N) with reduced set
of peripherals.

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
Signed-off-by: Nguyen Tran <nguyen.tran.pz@bp.renesas.com>
Signed-off-by: Marek Vasut <marek.vasut+renesas@mailbox.org>
---
Cc: Brian Masney <bmasney@redhat.com>
Cc: Conor Dooley <conor+dt@kernel.org>
Cc: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>
Cc: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc: Magnus Damm <magnus.damm@gmail.com>
Cc: Michael Turquette <mturquette@baylibre.com>
Cc: Rob Herring <robh@kernel.org>
Cc: Stephen Boyd <sboyd@kernel.org>
Cc: Ulf Hansson <ulfh@kernel.org>
Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: devicetree@vger.kernel.org
Cc: linux-clk@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
Cc: linux-mmc@vger.kernel.org
Cc: linux-renesas-soc@vger.kernel.org
---
V2: - Drop CS2500 variant suffix
    - Drop cells from rcar_sound ports {}
    - Drop ehci1, ohci1, usb2_phy1
    - Drop Salvator-X reference from commit message
    - Split panel DTO into separate patch
    - Drop FCNL node
    - Add another memory node for the second 2 GiB of DRAM,
      although the DRAM layout is patched in by U-Boot
    - Drop FIXME from audio-clkout {}
    - Sort nodes without unit address
    - Rename regulators, use npmv suffix for n.m V regulators
    - Rename x12 node to x12-clock node
    - Add PHY compatible string
    - Use interrupts-extended in PHY node
    - Rename clk_multiplier/clock-generator to clock-controller
    - Use interrupts-extended
    - Reinstate port@0 to rsound
    - Drop iommus from SDHI2
    - Drop DU until it can be tested
V3: - Drop pwm2 and pwm2_pins
    - Follow KSZ9031RNX tSR for reset assert time,
      FIGURE 7-5 Note 2 for reset post-deassert time
    - Add RB from Geert
---
 arch/arm64/boot/dts/renesas/Makefile          |   1 +
 .../arm64/boot/dts/renesas/r8a779md-geist.dts | 720 ++++++++++++++++++
 2 files changed, 721 insertions(+)
 create mode 100644 arch/arm64/boot/dts/renesas/r8a779md-geist.dts

diff --git a/arch/arm64/boot/dts/renesas/Makefile b/arch/arm64/boot/dts/renesas/Makefile
index ca45d2857ea7f..8bf155badd111 100644
--- a/arch/arm64/boot/dts/renesas/Makefile
+++ b/arch/arm64/boot/dts/renesas/Makefile
@@ -60,6 +60,7 @@ r8a77965-salvator-xs-panel-aa104xd12-dtbs := r8a77965-salvator-xs.dtb salvator-p
 dtb-$(CONFIG_ARCH_R8A77965) += r8a77965-salvator-xs-panel-aa104xd12.dtb
 dtb-$(CONFIG_ARCH_R8A77965) += r8a77965-ulcb.dtb
 dtb-$(CONFIG_ARCH_R8A77965) += r8a77965-ulcb-kf.dtb
+dtb-$(CONFIG_ARCH_R8A77965) += r8a779md-geist.dtb
 
 dtb-$(CONFIG_ARCH_R8A77970) += r8a77970-eagle.dtb
 dtb-$(CONFIG_ARCH_R8A77970) += r8a77970-eagle-function-expansion.dtbo
diff --git a/arch/arm64/boot/dts/renesas/r8a779md-geist.dts b/arch/arm64/boot/dts/renesas/r8a779md-geist.dts
new file mode 100644
index 0000000000000..11024bd12eb63
--- /dev/null
+++ b/arch/arm64/boot/dts/renesas/r8a779md-geist.dts
@@ -0,0 +1,720 @@
+// SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+/*
+ * Device Tree Source for the Geist board with R-Car M3Le
+ *
+ * Copyright (C) 2025-2026 Renesas Electronics Corp.
+ */
+
+/dts-v1/;
+#include <dt-bindings/gpio/gpio.h>
+#include <dt-bindings/input/input.h>
+#include "r8a779md.dtsi"
+
+/ {
+	model = "Renesas Geist board based on r8a779md";
+	compatible = "renesas,geist", "renesas,r8a779md", "renesas,r8a77965";
+
+	aliases {
+		serial0 = &scif2;
+		serial1 = &hscif1;
+		ethernet0 = &avb;
+		mmc0 = &sdhi2;
+		mmc1 = &sdhi0;
+	};
+
+	chosen {
+		bootargs = "ignore_loglevel rw root=/dev/nfs ip=on";
+		stdout-path = "serial0:115200n8";
+	};
+
+	audio_clkout: audio-clkout {
+		/*
+		 * This is same as <&rcar_sound 0>
+		 * but needed to avoid cs2500/rcar_sound probe dead-lock
+		 */
+		compatible = "fixed-clock";
+		#clock-cells = <0>;
+		clock-frequency = <12288000>;
+	};
+
+	backlight: backlight {
+		compatible = "pwm-backlight";
+		pwms = <&pwm1 0 50000>;
+
+		brightness-levels = <256 128 64 16 8 4 0>;
+		default-brightness-level = <6>;
+
+		power-supply = <&reg_12v>;
+		enable-gpios = <&gpio6 7 GPIO_ACTIVE_HIGH>;
+	};
+
+	cvbs-in {
+		compatible = "composite-video-connector";
+		label = "CVBS IN";
+
+		port {
+			cvbs_con: endpoint {
+				remote-endpoint = <&adv7482_ain7>;
+			};
+		};
+	};
+
+	hdmi-in {
+		compatible = "hdmi-connector";
+		label = "HDMI IN";
+		type = "a";
+
+		port {
+			hdmi_in_con: endpoint {
+				remote-endpoint = <&adv7482_hdmi>;
+			};
+		};
+	};
+
+	keys {
+		compatible = "gpio-keys";
+
+		pinctrl-0 = <&keys_pins>;
+		pinctrl-names = "default";
+
+		key-1 {
+			gpios = <&gpio5 17 GPIO_ACTIVE_LOW>;
+			linux,code = <KEY_1>;
+			label = "SW4-1";
+			wakeup-source;
+			debounce-interval = <20>;
+		};
+
+		key-2 {
+			gpios = <&gpio5 20 GPIO_ACTIVE_LOW>;
+			linux,code = <KEY_2>;
+			label = "SW4-2";
+			wakeup-source;
+			debounce-interval = <20>;
+		};
+
+		key-3 {
+			gpios = <&gpio5 22 GPIO_ACTIVE_LOW>;
+			linux,code = <KEY_3>;
+			label = "SW4-3";
+			wakeup-source;
+			debounce-interval = <20>;
+		};
+
+		key-4 {
+			gpios = <&gpio5 23 GPIO_ACTIVE_LOW>;
+			linux,code = <KEY_4>;
+			label = "SW4-4";
+			wakeup-source;
+			debounce-interval = <20>;
+		};
+
+		key-a {
+			gpios = <&gpio6 11 GPIO_ACTIVE_LOW>;
+			linux,code = <KEY_A>;
+			label = "TSW0";
+			wakeup-source;
+			debounce-interval = <20>;
+		};
+
+		key-b {
+			gpios = <&gpio6 12 GPIO_ACTIVE_LOW>;
+			linux,code = <KEY_B>;
+			label = "TSW1";
+			wakeup-source;
+			debounce-interval = <20>;
+		};
+
+		key-c {
+			gpios = <&gpio6 13 GPIO_ACTIVE_LOW>;
+			linux,code = <KEY_C>;
+			label = "TSW2";
+			wakeup-source;
+			debounce-interval = <20>;
+		};
+	};
+
+	memory@48000000 {
+		device_type = "memory";
+		/* first 128MB is reserved for secure area. */
+		reg = <0x0 0x48000000 0x0 0x78000000>;
+	};
+
+	memory@480000000 {
+		device_type = "memory";
+		reg = <0x4 0x80000000 0x0 0x80000000>;
+	};
+
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
+	reg_12v: regulator-12v {
+		compatible = "regulator-fixed";
+		regulator-name = "fixed-12V";
+		regulator-min-microvolt = <12000000>;
+		regulator-max-microvolt = <12000000>;
+		regulator-boot-on;
+		regulator-always-on;
+	};
+
+	vbus0_usb2: regulator-vbus0-usb2 {
+		compatible = "regulator-fixed";
+
+		regulator-name = "USB20_VBUS0";
+		regulator-min-microvolt = <5000000>;
+		regulator-max-microvolt = <5000000>;
+
+		gpio = <&gpio6 16 GPIO_ACTIVE_HIGH>;
+		enable-active-high;
+	};
+
+	vcc_sdhi0: regulator-vcc-sdhi0 {
+		compatible = "regulator-fixed";
+
+		regulator-name = "SDHI0 Vcc";
+		regulator-min-microvolt = <3300000>;
+		regulator-max-microvolt = <3300000>;
+
+		gpio = <&gpio5 2 GPIO_ACTIVE_HIGH>;
+		enable-active-high;
+	};
+
+	vccq_sdhi0: regulator-vccq-sdhi0 {
+		compatible = "regulator-gpio";
+
+		regulator-name = "SDHI0 VccQ";
+		regulator-min-microvolt = <1800000>;
+		regulator-max-microvolt = <3300000>;
+
+		gpios = <&gpio5 1 GPIO_ACTIVE_HIGH>;
+		gpios-states = <1>;
+		states = <3300000 1>, <1800000 0>;
+	};
+
+	sound_card: sound {
+		compatible = "audio-graph-card";
+
+		label = "rcar-sound";
+		dais = <&rsnd_port0>; /* AK4619 Audio Codec */
+	};
+
+	x12_clk: x12-clock {
+		compatible = "fixed-clock";
+		#clock-cells = <0>;
+		clock-frequency = <24576000>;
+	};
+
+	/* External DU dot clocks */
+	x21_clk: x21-clock {
+		compatible = "fixed-clock";
+		#clock-cells = <0>;
+		clock-frequency = <33000000>;
+	};
+
+	x22_clk: x22-clock {
+		compatible = "fixed-clock";
+		#clock-cells = <0>;
+		clock-frequency = <33000000>;
+	};
+
+	x23_clk: x23-clock {
+		compatible = "fixed-clock";
+		#clock-cells = <0>;
+		clock-frequency = <25000000>;
+	};
+
+	x3013_clk: x3013-clock {
+		compatible = "fixed-clock";
+		#clock-cells = <0>;
+		clock-frequency = <25000000>;
+	};
+};
+
+&audio_clk_a {
+	clock-frequency = <22579200>;
+};
+
+&avb {
+	pinctrl-0 = <&avb_pins>;
+	pinctrl-names = "default";
+	phy-handle = <&phy0>;
+	tx-internal-delay-ps = <2000>;
+	status = "okay";
+
+	phy0: ethernet-phy@0 {
+		compatible = "ethernet-phy-id0022.1622";
+		rxc-skew-ps = <1500>;
+		reg = <0>;
+		interrupts-extended = <&gpio2 11 IRQ_TYPE_LEVEL_LOW>;
+		reset-gpios = <&gpio2 10 GPIO_ACTIVE_LOW>;
+		reset-assert-us = <10000>;
+		reset-deassert-us = <300>;
+	};
+};
+
+&csi40 {
+	status = "okay";
+
+	ports {
+		port@0 {
+			csi40_in: endpoint {
+				clock-lanes = <0>;
+				data-lanes = <1 2 3 4>;
+				remote-endpoint = <&adv7482_txa>;
+			};
+		};
+	};
+};
+
+&ehci0 {
+	dr_mode = "otg";
+	status = "okay";
+};
+
+&extalr_clk {
+	clock-frequency = <32768>;
+};
+
+&extal_clk {
+	clock-frequency = <16666666>;
+};
+
+&hscif1 {
+	pinctrl-0 = <&hscif1_pins>;
+	pinctrl-names = "default";
+
+	uart-has-rtscts;
+	/* Please only enable hscif1 or scif1 */
+	status = "okay";
+};
+
+&hsusb {
+	dr_mode = "otg";
+	status = "okay";
+};
+
+&i2c2 {
+	pinctrl-0 = <&i2c2_pins>;
+	pinctrl-names = "default";
+	clock-frequency = <100000>;
+	status = "okay";
+
+	ak4619: codec@10 {
+		compatible = "asahi-kasei,ak4619";
+		reg = <0x10>;
+		clocks = <&rcar_sound 3>;
+		clock-names = "mclk";
+		#sound-dai-cells = <0>;
+
+		port {
+			ak4619_endpoint: endpoint {
+				remote-endpoint = <&rsnd_endpoint0>;
+			};
+		};
+	};
+
+	/* Pin-to-pin, register map, and control compatible with CS2000 and CS2200 */
+	cs2500: clock-controller@4f {
+		#clock-cells = <0>;
+		compatible = "cirrus,cs2500", "cirrus,cs2000-cp";
+		reg = <0x4f>;
+		clocks = <&audio_clkout>, <&x12_clk>;
+		clock-names = "clk_in", "ref_clk";
+
+		assigned-clocks = <&cs2500>;
+		assigned-clock-rates = <24576000>; /* 1/1 divide */
+	};
+};
+
+&i2c4 {
+	clock-frequency = <400000>;
+	status = "okay";
+
+	versaclock3: clock-controller@68 {
+		compatible = "renesas,5p35023";
+		reg = <0x68>;
+		#clock-cells = <1>;
+		clocks = <&x3013_clk>;
+		assigned-clocks = <&versaclock3 4>, <&versaclock3 5>;
+		assigned-clock-rates = <100000000>, <100000000>;
+	};
+
+	versaclock5: clock-controller@6a {
+		compatible = "idt,5p49v5923";
+		reg = <0x6a>;
+		#clock-cells = <1>;
+		clocks = <&x23_clk>;
+		clock-names = "xin";
+	};
+
+	video-receiver@70 {
+		compatible = "adi,adv7482";
+		reg = <0x70 0x71 0x72 0x73 0x74 0x75
+		       0x60 0x61 0x62 0x63 0x64 0x65>;
+		reg-names = "main", "dpll", "cp", "hdmi", "edid", "repeater",
+			    "infoframe", "cbus", "cec", "sdp", "txa", "txb" ;
+
+		interrupts-extended = <&gpio6 30 IRQ_TYPE_LEVEL_LOW>,
+				      <&gpio6 31 IRQ_TYPE_LEVEL_LOW>;
+		interrupt-names = "intrq1", "intrq2";
+
+		ports {
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			port@7 {
+				reg = <7>;
+
+				adv7482_ain7: endpoint {
+					remote-endpoint = <&cvbs_con>;
+				};
+			};
+
+			port@8 {
+				reg = <8>;
+
+				adv7482_hdmi: endpoint {
+					remote-endpoint = <&hdmi_in_con>;
+				};
+			};
+
+			port@a {
+				reg = <10>;
+
+				adv7482_txa: endpoint {
+					clock-lanes = <0>;
+					data-lanes = <1 2 3 4>;
+					remote-endpoint = <&csi40_in>;
+				};
+			};
+		};
+	};
+
+	csa_vdd: adc@7c {
+		compatible = "maxim,max9611";
+		reg = <0x7c>;
+
+		shunt-resistor-micro-ohms = <5000>;
+	};
+
+	csa_dvfs: adc@7f {
+		compatible = "maxim,max9611";
+		reg = <0x7f>;
+
+		shunt-resistor-micro-ohms = <5000>;
+	};
+};
+
+&i2c_dvfs {
+	status = "okay";
+
+	clock-frequency = <400000>;
+
+	eeprom@50 {
+		compatible = "rohm,br24t01", "atmel,24c01";
+		reg = <0x50>;
+		pagesize = <8>;
+	};
+};
+
+&ohci0 {
+	dr_mode = "otg";
+	status = "okay";
+};
+
+&pcie_bus_clk {
+	status = "disabled";
+};
+
+&pciec0 {
+	clocks = <&cpg CPG_MOD 319>, <&versaclock3 4>;
+	status = "okay";
+};
+
+&pciec0_rp {
+	clocks = <&versaclock3 5>;
+};
+
+&pfc {
+	pinctrl-0 = <&scif_clk_pins>;
+	pinctrl-names = "default";
+
+	avb_pins: avb {
+		mux {
+			groups = "avb_link", "avb_mdio", "avb_mii";
+			function = "avb";
+		};
+
+		pins_mdio {
+			groups = "avb_mdio";
+			drive-strength = <24>;
+		};
+
+		pins_mii_tx {
+			pins = "PIN_AVB_TX_CTL", "PIN_AVB_TXC", "PIN_AVB_TD0",
+			       "PIN_AVB_TD1", "PIN_AVB_TD2", "PIN_AVB_TD3";
+			drive-strength = <12>;
+		};
+	};
+
+	hscif1_pins: hscif1 {
+		groups = "hscif1_data_a", "hscif1_ctrl_a";
+		function = "hscif1";
+	};
+
+	i2c2_pins: i2c2 {
+		groups = "i2c2_a";
+		function = "i2c2";
+	};
+
+	irq0_pins: irq0 {
+		groups = "intc_ex_irq0";
+		function = "intc_ex";
+	};
+
+	keys_pins: keys {
+		pins = "GP_5_17", "GP_5_20", "GP_5_22";
+		bias-pull-up;
+	};
+
+	pwm1_pins: pwm1 {
+		groups = "pwm1_a";
+		function = "pwm1";
+	};
+
+	scif1_pins: scif1 {
+		groups = "scif1_data_a", "scif1_ctrl";
+		function = "scif1";
+	};
+
+	scif2_pins: scif2 {
+		groups = "scif2_data_a";
+		function = "scif2";
+	};
+
+	scif_clk_pins: scif_clk {
+		groups = "scif_clk_a";
+		function = "scif_clk";
+	};
+
+	sdhi0_pins: sd0 {
+		groups = "sdhi0_data4", "sdhi0_ctrl";
+		function = "sdhi0";
+		power-source = <3300>;
+	};
+
+	sdhi0_pins_uhs: sd0_uhs {
+		groups = "sdhi0_data4", "sdhi0_ctrl";
+		function = "sdhi0";
+		power-source = <1800>;
+	};
+
+	sdhi2_pins: sd2 {
+		groups = "sdhi2_data8", "sdhi2_ctrl", "sdhi2_ds";
+		function = "sdhi2";
+		power-source = <1800>;
+	};
+
+	sound_pins: sound {
+		groups = "ssi01239_ctrl", "ssi0_data", "ssi1_data_a";
+		function = "ssi";
+	};
+
+	sound_clk_pins: sound_clk {
+		groups = "audio_clk_a_a", "audio_clk_b_a", "audio_clk_c_a",
+			 "audio_clkout_a", "audio_clkout3_a";
+		function = "audio_clk";
+	};
+
+	usb0_pins: usb0 {
+		groups = "usb0";
+		function = "usb0";
+	};
+};
+
+&pwm1 {
+	pinctrl-0 = <&pwm1_pins>;
+	pinctrl-names = "default";
+
+	status = "okay";
+};
+
+&rcar_sound {
+	pinctrl-0 = <&sound_pins>, <&sound_clk_pins>;
+	pinctrl-names = "default";
+
+	/* Single DAI */
+	#sound-dai-cells = <0>;
+
+	/* audio_clkout0/1/2/3 */
+	#clock-cells = <1>;
+	clock-frequency = <12288000 11289600>;
+
+	status = "okay";
+
+	/* update <audio_clk_b> to <cs2500> */
+	clocks = <&cpg CPG_MOD 1005>,
+		 <&cpg CPG_MOD 1006>, <&cpg CPG_MOD 1007>,
+		 <&cpg CPG_MOD 1008>, <&cpg CPG_MOD 1009>,
+		 <&cpg CPG_MOD 1010>, <&cpg CPG_MOD 1011>,
+		 <&cpg CPG_MOD 1012>, <&cpg CPG_MOD 1013>,
+		 <&cpg CPG_MOD 1014>, <&cpg CPG_MOD 1015>,
+		 <&cpg CPG_MOD 1022>, <&cpg CPG_MOD 1023>,
+		 <&cpg CPG_MOD 1024>, <&cpg CPG_MOD 1025>,
+		 <&cpg CPG_MOD 1026>, <&cpg CPG_MOD 1027>,
+		 <&cpg CPG_MOD 1028>, <&cpg CPG_MOD 1029>,
+		 <&cpg CPG_MOD 1030>, <&cpg CPG_MOD 1031>,
+		 <&cpg CPG_MOD 1020>, <&cpg CPG_MOD 1021>,
+		 <&cpg CPG_MOD 1020>, <&cpg CPG_MOD 1021>,
+		 <&cpg CPG_MOD 1019>, <&cpg CPG_MOD 1018>,
+		 <&audio_clk_a>, <&cs2500>,
+		 <&audio_clk_c>,
+		 <&cpg CPG_MOD 922>;
+
+	ports {
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		rsnd_port0: port@0 {
+			reg = <0>;
+
+			rsnd_endpoint0: endpoint {
+				remote-endpoint = <&ak4619_endpoint>;
+				dai-format = "left_j";
+				bitclock-master = <&rsnd_endpoint0>;
+				frame-master = <&rsnd_endpoint0>;
+				playback = <&ssi0>, <&src0>, <&dvc0>;
+				capture = <&ssi1>, <&src1>, <&dvc1>;
+			};
+		};
+	};
+};
+
+&rwdt {
+	timeout-sec = <60>;
+	status = "okay";
+};
+
+&scif1 {
+	pinctrl-0 = <&scif1_pins>;
+	pinctrl-names = "default";
+
+	uart-has-rtscts;
+	/* Please only enable hscif1 or scif1 */
+	/* status = "okay"; */
+};
+
+&scif2 {
+	pinctrl-0 = <&scif2_pins>;
+	pinctrl-names = "default";
+
+	status = "okay";
+};
+
+&scif_clk {
+	clock-frequency = <14745600>;
+};
+
+&sdhi0 {
+	pinctrl-0 = <&sdhi0_pins>;
+	pinctrl-1 = <&sdhi0_pins_uhs>;
+	pinctrl-names = "default", "state_uhs";
+
+	vmmc-supply = <&vcc_sdhi0>;
+	vqmmc-supply = <&vccq_sdhi0>;
+	cd-gpios = <&gpio3 12 GPIO_ACTIVE_LOW>;
+	wp-gpios = <&gpio3 13 GPIO_ACTIVE_HIGH>;
+	bus-width = <4>;
+	sd-uhs-sdr50;
+	sd-uhs-sdr104;
+	status = "okay";
+};
+
+&sdhi2 {
+	/* used for on-board 8bit eMMC */
+	pinctrl-0 = <&sdhi2_pins>;
+	pinctrl-1 = <&sdhi2_pins>;
+	pinctrl-names = "default", "state_uhs";
+
+	vmmc-supply = <&reg_3p3v>;
+	vqmmc-supply = <&reg_1p8v>;
+	bus-width = <8>;
+	mmc-hs200-1_8v;
+	no-sd;
+	no-sdio;
+	non-removable;
+	fixed-emmc-driver-type = <1>;
+	full-pwr-cycle-in-suspend;
+	status = "okay";
+};
+
+&ssi1 {
+	shared-pin;
+};
+
+&usb_extal_clk {
+	clock-frequency = <50000000>;
+};
+
+&usb2_phy0 {
+	pinctrl-0 = <&usb0_pins>;
+	pinctrl-names = "default";
+
+	vbus-supply = <&vbus0_usb2>;
+	status = "okay";
+};
+
+&vin0 {
+	status = "okay";
+};
+
+&vin1 {
+	status = "okay";
+};
+
+&vin2 {
+	status = "okay";
+};
+
+&vin3 {
+	status = "okay";
+};
+
+&vin4 {
+	status = "okay";
+};
+
+&vin5 {
+	status = "okay";
+};
+
+&vin6 {
+	status = "okay";
+};
+
+&vin7 {
+	status = "okay";
+};
+
+&vspb {
+	status = "okay";
+};
+
+&vspi0 {
+	status = "okay";
+};
-- 
2.53.0


