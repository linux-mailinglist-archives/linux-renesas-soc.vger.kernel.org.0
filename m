Return-Path: <linux-renesas-soc+bounces-33381-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id OLxcLBgMG2qH+ggAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-33381-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Sat, 30 May 2026 18:11:04 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E0CC60DF43
	for <lists+linux-renesas-soc@lfdr.de>; Sat, 30 May 2026 18:11:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 1C5E0301361B
	for <lists+linux-renesas-soc@lfdr.de>; Sat, 30 May 2026 16:11:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AEABF33CE80;
	Sat, 30 May 2026 16:10:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="EZuj9ePK"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8003834040A
	for <linux-renesas-soc@vger.kernel.org>; Sat, 30 May 2026 16:10:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780157459; cv=none; b=ZGLH+cy5ply0+k8ioej/VivZGwwIpxXKGMLIsD0D9iFQlaTCio4OvDIyXiqvuCWHa7jcapjrtsoptThSenZXA27AyYTvUlD/UdXow+geUgKH4y2vkfr7b26ckmvtBprPU152nOUFQ/Zj3OemogXPw3WXS/ZsEKwqgviUDRV/OYY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780157459; c=relaxed/simple;
	bh=9nqzV9nCuj+pWLA2mc+jr8wnii4qN9LEHDjZ+v11wWU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=f3wt+cjslEWgjaIujBv5F7aXzbalnrcK7csIczAFwFHgSdJR0L7YoFA+phedXOOn209YBCkXRwrTt2n/h+f6AJ+H6Go6KGZIGB0SlvFX5OtUQZWbYzoYqOxR7ruFUnbWViwwa1Jfuf0JRlr2YmLnJcJ2WBloKv+jNjReRRHKw04=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=EZuj9ePK; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-49039a8851fso91200485e9.2
        for <linux-renesas-soc@vger.kernel.org>; Sat, 30 May 2026 09:10:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780157455; x=1780762255; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AAjmoyR7zpHY56vJj4UPbKN386Z+BkQBwCykIyLvjOU=;
        b=EZuj9ePKCgzz2Y6srB4GnFG4VbA94neiP/jSygp6ZqdwliTc5E++Ag7a7yBxYb/TW6
         dcI87nLW+HzvTRPponeHzsqTIMdXtx61/TwAHx+wWEAiegyaVkzZiFDN4Ui5kjXjMDgz
         S+bLj5DP1Wb5pOd2rJvB1hlobfr9tRsQkToK4O4EGRgB2D3y7pj3ENzQj6ruollNuVxX
         WY0zgvBW437elB/QToxZMwVg9pT+XSFaoK8h978xZHE/orZ/Blsubo812RMxyhYsoViS
         6vrkG/lGkoxhrfu22JVGr9E2fV9/rlzvwywi41kfOS/SsoDJpn0GNcMEyfG6HdZQgsUz
         uroQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780157455; x=1780762255;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=AAjmoyR7zpHY56vJj4UPbKN386Z+BkQBwCykIyLvjOU=;
        b=mrTS5ZP4GnUJ9zDOqfGJwb5WSNxnRL0/WIAo2+BavDqRN7TkYtsTh3zvtD/JPfi7QU
         9r1ydHh2t5zxGjezwKTMbnTsh6Y5Bd9tWbx6S2ZJXEEuwtXUqaQBcdXcGlF9fqmLPV7/
         DrL56TrrB8q/UPsr61cZNj5XcMcw/PWrdHdFdT5sG8M8zyCq7ebVhjnrf8VgENQcobXT
         aaI2mMHEuXA5ajXNni63bVbxb6S3OMuRGCqcyUaVx/JvuWCulyFu5ap7SREnr1ODUaRu
         QKboiT0EOySSO1ZkAs2u0wkFrcqaE1wQJO4whOjeIBx9u/uC2sJVhHneKyxXmaZJJYiA
         hf4g==
X-Forwarded-Encrypted: i=1; AFNElJ8dRMMrw72y7liJvdD0KdsBcb4IvmzflPJiu3erZHH1OX8dUG7FsH8ydSwsi6ab2D2rhh/SnqrqCEFDwhAdftCWBQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yx6iUXOUfjmdo9ke35AsbitO3vI+M7bCWKCj5T20W7ro8Br/WxL
	bwfKtGOeJpxZnpxofv6ROhoa7mg4YjG+WvfU+/Uym1IKhuU7DspQOsxa
X-Gm-Gg: Acq92OFiMq5EeecmRMpkiBq+ILs3Xa1bYQuIAzGtkoctDGaIhVcPCpP1eITz0Bmp559
	ma0DeJbZ7JaItfn1Tz3VOY01j/jpvtJctY569PHg5xBr6mWmMdTvYmW5vqBsC+vqY+vo8jWeDyf
	Qn8dMfd0Hn8IdnsR8Tnnc7c0vkIfyQ5NQ6VNf/RElrltFHK+7nTuGv0bDJcILyEA2babsjDumyx
	CW0CsVXMGDFDKZ3/BeCkIQhP3/d+I42fKZHqufT3SOCBo8i33bHoPHHn3Z0uxHKeNS9Z8rySncD
	g9uajevEBuzUzdEGNrrspOAPX27pg+0/ZMWFUPe8J0jYSV6TkHINXJLcj2p5uf+2ogdTet115DQ
	7UgSMHm0ZVEZgptYZ+bGCR3GhY5unQvremoeiVUOwtIv6e8ldsZVWJRcx/q0welRD3Dzq7gQkyG
	K7h7qA5eV3AI/JOqnh6hvlrxexnyTMD4SF4UD5NU59Dm3s13BEe/KPE1mjDjc=
X-Received: by 2002:a05:600c:c492:b0:490:9d1b:f088 with SMTP id 5b1f17b1804b1-490a29e4383mr68711555e9.2.1780157454533;
        Sat, 30 May 2026 09:10:54 -0700 (PDT)
Received: from localhost.localdomain ([2a00:23c4:a700:7301:5db6:a512:6ab4:aa07])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4909d6f35f8sm105350435e9.13.2026.05.30.09.10.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 30 May 2026 09:10:53 -0700 (PDT)
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
Subject: [PATCH 16/17] arm64: dts: renesas: rzg3l-smarc-som: Enable SD/eMMC on SDHI0
Date: Sat, 30 May 2026 17:10:43 +0100
Message-ID: <20260530161050.131041-2-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260530161050.131041-1-biju.das.jz@bp.renesas.com>
References: <20260530161050.131041-1-biju.das.jz@bp.renesas.com>
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
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-33381-lists,linux-renesas-soc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[bp.renesas.com,vger.kernel.org,gmail.com];
	FREEMAIL_TO(0.00)[glider.be,gmail.com,kernel.org];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[bijudasau@gmail.com,linux-renesas-soc@vger.kernel.org];
	RCPT_COUNT_SEVEN(0.00)[11];
	NEURAL_HAM(-0.00)[-0.999];
	RCVD_COUNT_FIVE(0.00)[5];
	DKIM_TRACE(0.00)[gmail.com:+];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas,dt];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo,bp.renesas.com:mid,renesas.com:email,2.220.108.0:email]
X-Rspamd-Queue-Id: 4E0CC60DF43
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

From: Biju Das <biju.das.jz@bp.renesas.com>

Add support for enabling SD card or eMMC on SDHI0 on the RZ/G3L SMARC
SoM. The selection between SD and eMMC is controlled by the
SW_SD0_DEV_SEL macro in the board DTS, which must match the position
of switch SYS.1 on the SoM. By default, eMMC is enabled.

Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
 .../boot/dts/renesas/r9a08g046l48-smarc.dts   |   1 +
 .../boot/dts/renesas/rzg3l-smarc-som.dtsi     | 111 ++++++++++++++++++
 2 files changed, 112 insertions(+)

diff --git a/arch/arm64/boot/dts/renesas/r9a08g046l48-smarc.dts b/arch/arm64/boot/dts/renesas/r9a08g046l48-smarc.dts
index a4cc07408b3f..2f16a2bb6dc8 100644
--- a/arch/arm64/boot/dts/renesas/r9a08g046l48-smarc.dts
+++ b/arch/arm64/boot/dts/renesas/r9a08g046l48-smarc.dts
@@ -9,6 +9,7 @@
 
 /* Switch selection settings */
 #define RZ_BOOT_MODE3		1
+#define SW_SD0_DEV_SEL		0
 #define SW_SD2_EN		0
 #define SW_DPI_EN		0
 #define SW_GPIO4		1
diff --git a/arch/arm64/boot/dts/renesas/rzg3l-smarc-som.dtsi b/arch/arm64/boot/dts/renesas/rzg3l-smarc-som.dtsi
index 091a227233cb..446c7780cb30 100644
--- a/arch/arm64/boot/dts/renesas/rzg3l-smarc-som.dtsi
+++ b/arch/arm64/boot/dts/renesas/rzg3l-smarc-som.dtsi
@@ -9,6 +9,10 @@
  * Please set the below switch position on the SoM and the corresponding macro
  * on the board DTS:
  *
+ * Switch position SYS.1, Macro SW_SD0_DEV_SEL:
+ *      0 - SD0 is connected to eMMC (default)
+ *      1 - SD0 is connected to uSD0 card
+ *
  * Switch position SYS.2, Macro SW_I3C_EN:
  *      0 - SMARC_I2C_GP is enabled
  *      1 - I3C is enabled
@@ -37,6 +41,7 @@ aliases {
 		ethernet0 = &eth0;
 		ethernet1 = &eth1;
 		i2c0 = &i2c0;
+		mmc0 = &sdhi0;
 	};
 
 	memory@48000000 {
@@ -63,6 +68,19 @@ reg_3p3v: regulator-3p3v {
 		regulator-always-on;
 	};
 
+#if SW_SD0_DEV_SEL
+	vqmmc_sd0_pvdd: vqmmc-sd0-pvdd {
+		compatible = "regulator-gpio";
+		regulator-name = "SD0_PVDD";
+		regulator-min-microvolt = <1800000>;
+		regulator-max-microvolt = <3300000>;
+		gpios = <&pinctrl RZG3L_GPIO(L, 4) GPIO_ACTIVE_HIGH>;
+		gpios-states = <0>;
+		states = <3300000 0>, <1800000 1>;
+		regulator-ramp-delay = <1200>;
+	};
+#endif
+
 	x2_clk: x2-clock {
 		compatible = "fixed-clock";
 		#clock-cells = <0>;
@@ -216,7 +234,100 @@ i2c0_pins: i2c0 {
 		pinmux = <RZG3L_PORT_PINMUX(L, 2, 4)>, /* RIIC0_SCL */
 			 <RZG3L_PORT_PINMUX(L, 3, 4)>; /* RIIC0_SDA */
 	};
+
+	sd0-pwr-en-hog {
+		gpio-hog;
+		gpios = <RZG3L_GPIO(5, 1) GPIO_ACTIVE_HIGH>;
+		output-high;
+		line-name = "sd0_pwr_en";
+	};
+
+	sdhi0_emmc_pins: sd0-emmc {
+		sd0-ctrl {
+			pins = "SD0_CLK", "SD0_CMD";
+			power-source = <1800>;
+		};
+
+		sd0-data {
+			pins = "SD0_DAT0", "SD0_DAT1", "SD0_DAT2", "SD0_DAT3",
+			       "SD0_DAT4", "SD0_DAT5", "SD0_DAT6", "SD0_DAT7";
+			power-source = <1800>;
+		};
+
+		sd0-rst {
+			pins = "SD0_RST#";
+			power-source = <1800>;
+		};
+
+		sd0-ds {
+			pins = "SD0_DS";
+			power-source = <1800>;
+		};
+	};
+
+	sdhi0_usd_pins: sd0-usd {
+		sd0-cd {
+			pinmux = <RZG2L_PORT_PINMUX(5, 0, 8)>; /* SD0_CD */
+		};
+
+		sd0-ctrl {
+			pins = "SD0_CLK", "SD0_CMD";
+			power-source = <3300>;
+		};
+
+		sd0-data {
+			pins = "SD0_DAT0", "SD0_DAT1", "SD0_DAT2", "SD0_DAT3";
+			power-source = <3300>;
+		};
+	};
+
+	sdhi0_usd_uhs_pins: sd0-usd-uhs {
+		sd0-cd {
+			pinmux = <RZG2L_PORT_PINMUX(5, 0, 8)>; /* SD0_CD */
+		};
+
+		sd0-ctrl {
+			pins = "SD0_CLK", "SD0_CMD";
+			power-source = <1800>;
+		};
+
+		sd0-data {
+			pins = "SD0_DAT0", "SD0_DAT1", "SD0_DAT2", "SD0_DAT3";
+			power-source = <1800>;
+		};
+	};
+};
+
+#if (SW_SD0_DEV_SEL)
+&sdhi0 {
+	pinctrl-0 = <&sdhi0_usd_pins>;
+	pinctrl-1 = <&sdhi0_usd_uhs_pins>;
+	pinctrl-names = "default", "state_uhs";
+
+	vmmc-supply = <&reg_3p3v>;
+	vqmmc-supply = <&vqmmc_sd0_pvdd>;
+	bus-width = <4>;
+	sd-uhs-sdr50;
+	sd-uhs-sdr104;
+	status = "okay";
+};
+#else
+&sdhi0 {
+	pinctrl-0 = <&sdhi0_emmc_pins>;
+	pinctrl-1 = <&sdhi0_emmc_pins>;
+	pinctrl-names = "default", "state_uhs";
+
+	vmmc-supply = <&reg_3p3v>;
+	vqmmc-supply = <&reg_1p8v>;
+	bus-width = <8>;
+	mmc-hs200-1_8v;
+	mmc-hs400-1_8v;
+	mmc-hs400-enhanced-strobe;
+	non-removable;
+	fixed-emmc-driver-type = <1>;
+	status = "okay";
 };
+#endif
 
 &wdt0 {
 	timeout-sec = <60>;
-- 
2.43.0


