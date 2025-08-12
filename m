Return-Path: <linux-renesas-soc+bounces-20430-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A48D4B239BD
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 12 Aug 2025 22:08:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 932C37B6F1B
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 12 Aug 2025 20:04:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1A7612D73B1;
	Tue, 12 Aug 2025 20:04:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BlzlZcD/"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4BC4A2D7382;
	Tue, 12 Aug 2025 20:04:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755029043; cv=none; b=JVm1X54xq5absPc7DmbiiuynHhi6ukCz7bREUgWMdCX1ah6dT+YODWZziWj19re1/zBc5egQ94mPNiXhpW4ht1TUVnw/1Wz3LXeuxLI30WEoRNn0bGL1ne6w8VpzZzoPzLAQjyfqFQnineu1QJwc+xwPsyD8WnY1S8VYxhvak8s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755029043; c=relaxed/simple;
	bh=qyPp0SGuTAnZdVxG3Ow//35y3Guz/x6cHyRK6x2jAaM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=iTOfdo3zJB3JRmhVAA8M2oxCH2+2lzF3mepcxNnJ5Ap8oBCPbCsDp7xightJ6SrcBhIoFphITX5mMQ1xKs0wZbzwYlH4r7MWLIwnUVrHZh09UhjQo0cb05xOZNwy8AZ9vIGxhdasr5v0gi03tkSZcQ361ZsxMFcPip7BZjZ/6SA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BlzlZcD/; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-458b49c98a7so38392515e9.1;
        Tue, 12 Aug 2025 13:04:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1755029040; x=1755633840; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Kl4l2omKXJdsJQdy9slMl/cHx7WUzp9cgc4iQGIqn/w=;
        b=BlzlZcD/Vk9muFryr38tOxwBFFoWDE9/K3FkRUiYjfLEYSAIOehzdSoIPVZ01zKZ40
         x1XwXxucVa+nEcnTai5HK/CfOuNsAF0scM6qvQDsmnU0QAiqUyzibIWRGT2OptNvO2HJ
         3TD71IbmRBeqUaoZoKz4c2VExcYxGrdbgEaBMNl/t3QZGqjaDH/qxeCs5KuYTBE0leh6
         drsfUtkghWw0PQ6Vf/5bROySOWk+hu9F+7omYp7/D4OsgYJzJrSfce/sSRYzhUg4EmlC
         FmP3ka9fGA3KaMNvSrkhPyaFCSoOztedAkm6hBdhR/Or8r3t72i/Yc96mumlz48N8TXU
         g3dQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755029040; x=1755633840;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Kl4l2omKXJdsJQdy9slMl/cHx7WUzp9cgc4iQGIqn/w=;
        b=ODHkR1twI1szeRRMUTD17vcU2BGw9zvLICcifaLrUkQOvM4mYQQ7kUBQ2BOTFmnsC8
         KzBW+X9WgSP474czwDnG3GAsawwjmyW36hEbAvYx3dKIAn+KDdKzaIgfdtmA2rj3JO/N
         xdjfm8w/tPCjKqeHaqyfwM9lxQrcqdtzd75/yrN43jaMqmmblodCIQiMP+w8LEITG+d5
         8w3yR2vuzGdaWgPjE79923bxZscC5Ldy0oukQpXByZn45nSilJ3dxd2R+zlcXIDjgueb
         uc58RG4oOW43u83dtneEYr4+OJ70I1VUSZgY3wTbcv5OJK2iNGcUyhiz6x6Cf9OUqId3
         khMQ==
X-Forwarded-Encrypted: i=1; AJvYcCUffNyQwxfEWSH2wHAlRZQnB/cJo2kPMdNH9U+TVv+qN6f+VnG5szVvo6PrHRExihhAaBtgFu69JS3OpNrC@vger.kernel.org, AJvYcCVnoxxZfXlFzsTDUv7kzdyx3B/UebweY/R49gM1H2h09fOQNdigHcPhXvGdtDnfaimUrwmW0iG7z/vW@vger.kernel.org
X-Gm-Message-State: AOJu0YzYo20JRtzGhfcryBefh01195qKS8tiOI8ddwFkh8ERatGawX/J
	PC+XcviqiN54VfJXmX2HWZbI58rPX4l8rlBad1hNpOlzZaku48MtMbZ+VHp+Pg==
X-Gm-Gg: ASbGncvbsoH2LKmdhp7rAnNxc37qOGR1u+DutUYnwrOhEi1kwERK6xgn19AXkSP47r7
	f9tHzLS3uiAIjpCWhxP/TZAiKKt0ZuGGJLyPm6bBeHFkpo2E8Qy+hObs/YD15acwvFRFdX3RsYa
	FpgRsiOx8OBjIDpTwscQaV4xNi9p93nA2U3kssyTtm8v/8+PHkSp3C+sHPsArY1TsKzb/sVe1U8
	/qL5DSqLxOUIBrQKDl0AMGBJg4mQ+2e7JNEgUQEJByAVnAZKbMSd/VRSrBc08Qo15mUCfxkNuB3
	8asx9IUnkT1d/hAbk7Yy3o+7hJroQRoWCRfU3TwPu75ZnTI9EUo7V8MnOhTXwi7bfZipw+JP3Qe
	Pw9nebKAhKNaihWKTb24D+r7hRbSijXxYZhBPNikdYAUIbU0VAE4zemHzSJ3jKdunt0rLQF7UXW
	+5eo6tIp3U
X-Google-Smtp-Source: AGHT+IG6hyXOgInknf1ePnIuYxZdFyVNH4i/t7aC5Sh+pUMXGuiz2QA+eUQf6GnhOM4JIcggL1086g==
X-Received: by 2002:a05:600c:5486:b0:43d:563:6fef with SMTP id 5b1f17b1804b1-45a165e2f30mr2571895e9.21.1755029039486;
        Tue, 12 Aug 2025 13:03:59 -0700 (PDT)
Received: from iku.Home (97e54365.skybroadband.com. [151.229.67.101])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-45a16dde163sm297645e9.12.2025.08.12.13.03.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 Aug 2025 13:03:58 -0700 (PDT)
From: Prabhakar <prabhakar.csengg@gmail.com>
X-Google-Original-From: Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: linux-renesas-soc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Prabhakar <prabhakar.csengg@gmail.com>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH 12/13] arm64: dts: renesas: rzt2h/rzn2h: Enable MicroSD card slot
Date: Tue, 12 Aug 2025 21:03:43 +0100
Message-ID: <20250812200344.3253781-13-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250812200344.3253781-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20250812200344.3253781-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Enable MicroSD card slot which is connected to SDHI1 on the RZ/T2H and
RZ/N2H EVKs.

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
---
 .../dts/renesas/r9a09g077m44-rzt2h-evk.dts    |  9 ++++
 .../dts/renesas/r9a09g087m44-rzn2h-evk.dts    |  6 +++
 .../dts/renesas/rzt2h-n2h-evk-common.dtsi     | 50 +++++++++++++++++++
 3 files changed, 65 insertions(+)

diff --git a/arch/arm64/boot/dts/renesas/r9a09g077m44-rzt2h-evk.dts b/arch/arm64/boot/dts/renesas/r9a09g077m44-rzt2h-evk.dts
index 05945a8a3228..1841700b264f 100644
--- a/arch/arm64/boot/dts/renesas/r9a09g077m44-rzt2h-evk.dts
+++ b/arch/arm64/boot/dts/renesas/r9a09g077m44-rzt2h-evk.dts
@@ -20,6 +20,13 @@
  */
 #define SD0_EMMC	1
 
+/*
+ * P17_4 = SD1_CD; SW2[3] = ON
+ * P08_5 = SD1_PWEN; SW2[3] = ON
+ * P08_6 = IOVS SW2[3] = ON; SW5[3] = OFF; SW5[4] = ON
+ */
+#define SD1_MICRO_SD	1
+
 #include "rzt2h-n2h-evk-common.dtsi"
 
 / {
@@ -43,10 +50,12 @@ led2 {
 			gpios = <&pinctrl RZT2H_GPIO(6, 7) GPIO_ACTIVE_LOW>;
 		};
 
+#if (!SD1_MICRO_SD)
 		led3 {
 			/* SW2-3: OFF */
 			gpios = <&pinctrl RZT2H_GPIO(8, 5) GPIO_ACTIVE_LOW>;
 		};
+#endif
 
 		led4 {
 			/* SW8-3: ON, SW8-4: OFF */
diff --git a/arch/arm64/boot/dts/renesas/r9a09g087m44-rzn2h-evk.dts b/arch/arm64/boot/dts/renesas/r9a09g087m44-rzn2h-evk.dts
index 89baa601a179..1b13995e5020 100644
--- a/arch/arm64/boot/dts/renesas/r9a09g087m44-rzn2h-evk.dts
+++ b/arch/arm64/boot/dts/renesas/r9a09g087m44-rzn2h-evk.dts
@@ -19,6 +19,12 @@
  */
 #define SD0_EMMC       1
 
+/*
+ * P17_4 = SD1_CD; DSW5[3] = ON; DSW19[1] = OFF; DSW19[2] = ON
+ * P08_6 = IOVSp DSW5[3] = ON
+ */
+#define SD1_MICRO_SD	1
+
 #include "rzt2h-n2h-evk-common.dtsi"
 
 /*
diff --git a/arch/arm64/boot/dts/renesas/rzt2h-n2h-evk-common.dtsi b/arch/arm64/boot/dts/renesas/rzt2h-n2h-evk-common.dtsi
index 7fa49de2a243..304a0c8764ca 100644
--- a/arch/arm64/boot/dts/renesas/rzt2h-n2h-evk-common.dtsi
+++ b/arch/arm64/boot/dts/renesas/rzt2h-n2h-evk-common.dtsi
@@ -36,6 +36,18 @@ reg_3p3v: regulator-3p3v {
 		regulator-boot-on;
 		regulator-always-on;
 	};
+
+#if SD1_MICRO_SD
+	vccq_sdhi1: regulator-vccq-sdhi1 {
+		compatible = "regulator-gpio";
+		regulator-name = "SDHI1 VccQ";
+		regulator-min-microvolt = <1800000>;
+		regulator-max-microvolt = <3300000>;
+		gpios = <&pinctrl RZT2H_GPIO(8, 6) GPIO_ACTIVE_HIGH>;
+		gpios-states = <0>;
+		states = <3300000 0>, <1800000 1>;
+	};
+#endif
 };
 
 &extal_clk {
@@ -91,6 +103,30 @@ sd0-emmc-ctrl-pins {
 				 <RZT2H_PORT_PINMUX(13, 2, 0x29)>; /* SD0_RST# */
 		};
 	};
+
+#if SD1_MICRO_SD
+	sdhi1-pwen-hog {
+		gpio-hog;
+		gpios = <RZT2H_GPIO(8, 5) GPIO_ACTIVE_HIGH>;
+		output-high;
+		line-name = "SD1_PWEN";
+	};
+#endif
+
+	sdhi1_pins: sd1-group {
+		sd1-data-pins {
+			pinmux = <RZT2H_PORT_PINMUX(16, 7, 0x29)>, /* SD1_DATA0 */
+				 <RZT2H_PORT_PINMUX(17, 0, 0x29)>, /* SD1_DATA1 */
+				 <RZT2H_PORT_PINMUX(17, 1, 0x29)>, /* SD1_DATA2 */
+				 <RZT2H_PORT_PINMUX(17, 2, 0x29)>; /* SD1_DATA3 */
+		};
+
+		sd1-ctrl-pins {
+			pinmux = <RZT2H_PORT_PINMUX(16, 5, 0x29)>, /* SD1_CLK */
+				 <RZT2H_PORT_PINMUX(16, 6, 0x29)>, /* SD1_CMD */
+				 <RZT2H_PORT_PINMUX(17, 4, 0x29)>; /* SD1_CD */
+		};
+	};
 };
 
 &sci0 {
@@ -113,3 +149,17 @@ &sdhi0 {
 	status = "okay";
 };
 #endif
+
+#if SD1_MICRO_SD
+&sdhi1 {
+	pinctrl-0 = <&sdhi1_pins>;
+	pinctrl-1 = <&sdhi1_pins>;
+	pinctrl-names = "default", "state_uhs";
+	vmmc-supply = <&reg_3p3v>;
+	vqmmc-supply = <&vccq_sdhi1>;
+	bus-width = <4>;
+	sd-uhs-sdr50;
+	sd-uhs-sdr104;
+	status = "okay";
+};
+#endif
-- 
2.50.1


