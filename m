Return-Path: <linux-renesas-soc+bounces-20792-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A522B2E624
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 20 Aug 2025 22:09:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id E3D7A5E41CF
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 20 Aug 2025 20:09:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3847A2D662E;
	Wed, 20 Aug 2025 20:07:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UxAuUssO"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E1842D3ED2;
	Wed, 20 Aug 2025 20:07:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755720437; cv=none; b=RBxFGOlFKxz3nbQi/Gc8Mw9NvX14rgrf2s/w/ObRtx+Otu4qs4rPHGGeLkfG+dX1hxiYR9bkK+nKNUzEu2edL0eI8bJti8UTHhEMtIo67S/11ChqiKleY4YTYIaK2baZQXXKLBASzAkV0Km23XpU34/zevTAJzDx39H4LeZ7jO4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755720437; c=relaxed/simple;
	bh=XoviqCDA0OOQa563ZMmC2R+DH7F+UIZ4DLkYKhZ+dlw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=qASeF5VUih/aIWqykw+m/UYd8Hr3QN9/vnc6b+rd8hp9WACzi7fGq//rhFV9fSCUQxQcInnrqpLhTv9L6oxSa6cX8VzdZsf4tAAv8xt3TZFj2dOFx5T+mCwPyd/sEocgcEOUXdaU2ZgnV/emzPk9UNbBsfsR8Y802WHoPJShvXQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=UxAuUssO; arc=none smtp.client-ip=209.85.221.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-3b9edf4cf6cso176362f8f.3;
        Wed, 20 Aug 2025 13:07:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1755720434; x=1756325234; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Jle4hQvSXfsgPZwxfGq/QEpJ/leMSDmL2Th0IpwGXyo=;
        b=UxAuUssOehz5iyvTzaY1u9/lJUTohcIYf21rEIoP7zdX3KE7xFIsdx8OMpKAA8sfVQ
         OpzK56AeTLbwEd8eKMAWFxEVgFcHqamvD334ZVgBmig/TuZ+6FtalSmrhi2v9WLQK7g5
         j+2a1Jfq3WeXKFStZX4AOoaI2R2XZoQlsB9G5CbQBX2HLze3PiBvm2PUFhf9+PtlrdkT
         PoGz/ax3Kr4MNho6PVFQNXJdm0PU0MA/NdkddSUuhPIDmGjTBGnylMwmGFS33DKfco0g
         eicKAZ9yv0ThTCWM4cew3ChZmX2TeVZlr9HTejGp/ltosQQ8NXdoA7jbEnIPMGZXfAXR
         4qkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755720434; x=1756325234;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Jle4hQvSXfsgPZwxfGq/QEpJ/leMSDmL2Th0IpwGXyo=;
        b=Rij58nDu1NTaNXqxYYnSm3Nw1aTeNHBDfQQrRhry0N7CpjHalJ+fGO/0vJYh5C1cNM
         ZGge5weGdWQiIg1dDrouYDUBIWONgq/ia1/xXqtSHlbS+KjJm5sVR9e/TCmHXlGARBqN
         EoA/kaLYkFWH+3aSl6KETWmYQB/fWcxcJtT6jzoUOET3TiH5uZjoTwkNtmxbWjkNRsWR
         O2lByuGVoBiEnaV5Y+60wNVIWxLvJJZ9E6XvcKa0EgKSpScftXL70os7wHCzDoYIsgTi
         j6sWWMJOQKyRV0hzm+EBm2Ci9yVN8KbEgiv55SG+Vgb3Mz6jBbk+ESDjJ+zJGffKf5S/
         8+dw==
X-Forwarded-Encrypted: i=1; AJvYcCXlswcfbiKY9ioDcVst2UxpaLffRPbYN94EcxBfkgr1+ijJzlACnPTh1sQdPsTeNRx7Z/KQkaH18OAqVCEL@vger.kernel.org, AJvYcCXzk2AU/cvtY2PXmElp/hahi8PAz1dnPh0UdBWHbifKMsyK90DCXQyvJ5CmviYCo5eTgrM1N10PXl+5@vger.kernel.org
X-Gm-Message-State: AOJu0YyLwjwido54biwuDhCaW+rk9Oo0gnYV4P/6GhHKOoj9cgDbSc8E
	9aW+k13oxPbpQmXFdyjKSkoavw264oIkW342V4t77mLwrMkH59deZtSD
X-Gm-Gg: ASbGncuZyAbNSLMY0PN7Lbq9hREca4h0Imwio6bn/zeRWZRklGdjxm/ZV9MSMWRExgz
	GNNTvHIc3CbCJL55iUZHmv1y/l2+NGGtl5E5+TXKujh8ZFMe103QDG4UK7X9quZlkMle57jjIZ+
	EyubABd0V2WnenWjA7lqub6sW1eWhTRv6VeDfEroGahw2brHfWvve8tg7RBa/xieQrR5lIQ/k54
	rZ23ZP74nNyp2HaMGd/GCc9Eja/N+Zwkpy4bhZHAeCYQShrVpJIbNOYUTVCXGhhM1QviodQqFxe
	L9/pZEl8C5vBdeQ5o+ZhULZQEtPadmPHtJvt1vwk3diVp2Dsz9CrwOKsdt3M/0DQJ5SG/y+njn6
	6e6DHjS41NBK919+iWf9/czlfPmIJTbxp7ME9fbZ07BTbg7acmJ1a2SD+
X-Google-Smtp-Source: AGHT+IFhaIcEn2tuoGVX++FEcniQvkhaYseECBJYgg3Gu1uxJpi8Txdej6pcveLnRr1pEP9QBrx/bA==
X-Received: by 2002:a05:6000:1a8f:b0:3c3:7cba:6d05 with SMTP id ffacd0b85a97d-3c4978384aemr63693f8f.57.1755720433514;
        Wed, 20 Aug 2025 13:07:13 -0700 (PDT)
Received: from iku.Home ([2a06:5906:61b:2d00:9b1:f84b:89f6:b00e])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3c077789c92sm8810302f8f.52.2025.08.20.13.07.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 Aug 2025 13:07:12 -0700 (PDT)
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
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH v2 9/9] arm64: dts: renesas: rzt2h/rzn2h: Enable SD card slot
Date: Wed, 20 Aug 2025 21:06:59 +0100
Message-ID: <20250820200659.2048755-10-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20250820200659.2048755-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20250820200659.2048755-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Enable SD card slot which is connected to SDHI0 on the RZ/T2H and
RZ/N2H EVKs.

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
---
v1->v2:
- Dropped sd0-sd-prefixes
- Dropped DATA4-7 from data-pins
---
 .../dts/renesas/r9a09g077m44-rzt2h-evk.dts    |  5 ++
 .../dts/renesas/r9a09g087m44-rzn2h-evk.dts    |  9 ++++
 .../dts/renesas/rzt2h-n2h-evk-common.dtsi     | 51 +++++++++++++++++++
 3 files changed, 65 insertions(+)

diff --git a/arch/arm64/boot/dts/renesas/r9a09g077m44-rzt2h-evk.dts b/arch/arm64/boot/dts/renesas/r9a09g077m44-rzt2h-evk.dts
index 37330c837f64..264f7ddb8cc5 100644
--- a/arch/arm64/boot/dts/renesas/r9a09g077m44-rzt2h-evk.dts
+++ b/arch/arm64/boot/dts/renesas/r9a09g077m44-rzt2h-evk.dts
@@ -14,8 +14,13 @@
  * Lets by default enable the eMMC, note we need the below SW settings
  * for eMMC.
  * SW2[1] = ON; SW2[2] = ON
+ *
+ * To enable SD card and disable eMMC on SDHI0 disable the below macro
+ * and set the below switch setting:
+ * SW2[1] = OFF; SW2[2] = ON
  */
 #define SD0_EMMC	1
+#define SD0_SD		(!SD0_EMMC)
 
 /*
  * P17_4 = SD1_CD; SW2[3] = ON
diff --git a/arch/arm64/boot/dts/renesas/r9a09g087m44-rzn2h-evk.dts b/arch/arm64/boot/dts/renesas/r9a09g087m44-rzn2h-evk.dts
index 87178933bee8..80f358fb2d74 100644
--- a/arch/arm64/boot/dts/renesas/r9a09g087m44-rzn2h-evk.dts
+++ b/arch/arm64/boot/dts/renesas/r9a09g087m44-rzn2h-evk.dts
@@ -15,8 +15,17 @@
  * for eMMC.
  * DSW5[1] = ON; DSW5[2] = ON
  * DSW17[5] = OFF; DSW17[6] = ON
+ *
+ * To enable SD card and disable eMMC on SDHI0 disable the below macro
+ * and set the below switch setting:
+ * DSW5[1] = OFF; DSW5[2] = ON
+ * P22_6 = SD0_WP; DSW15[1] = OFF; DSW15[2] = ON
+ * P22_5 = SD0_CD; DSW15[3] = OFF; DSW15[4] = ON
+ * P02_6 = SD0_IOVS; DSW17[5] = OFF; DSW17[6] = ON
+ * P02_5 = SD0_PWEN; DSW17[7] = OFF; DSW17[8] = ON
  */
 #define SD0_EMMC       1
+#define SD0_SD		(!SD0_EMMC)
 
 /*
  * P17_4 = SD1_CD; DSW5[3] = ON; DSW19[1] = OFF; DSW19[2] = ON
diff --git a/arch/arm64/boot/dts/renesas/rzt2h-n2h-evk-common.dtsi b/arch/arm64/boot/dts/renesas/rzt2h-n2h-evk-common.dtsi
index 34572630ecbe..8b9d04dce8ae 100644
--- a/arch/arm64/boot/dts/renesas/rzt2h-n2h-evk-common.dtsi
+++ b/arch/arm64/boot/dts/renesas/rzt2h-n2h-evk-common.dtsi
@@ -40,6 +40,18 @@ reg_3p3v: regulator-3p3v {
 		regulator-always-on;
 	};
 
+#if SD0_SD
+	vqmmc_sdhi0: regulator-vqmmc-sdhi0 {
+		compatible = "regulator-gpio";
+		regulator-name = "SDHI0 VqmmC";
+		gpios = <&pinctrl RZT2H_GPIO(2, 6) GPIO_ACTIVE_HIGH>;
+		regulator-min-microvolt = <1800000>;
+		regulator-max-microvolt = <3300000>;
+		gpios-states = <0>;
+		states = <3300000 0>, <1800000 1>;
+	};
+#endif
+
 #if SD1_MICRO_SD
 	vccq_sdhi1: regulator-vccq-sdhi1 {
 		compatible = "regulator-gpio";
@@ -107,6 +119,31 @@ ctrl-pins {
 		};
 	};
 
+#if SD0_SD
+	sdhi0-pwen-hog {
+		gpio-hog;
+		gpios = <RZT2H_GPIO(2, 5) GPIO_ACTIVE_HIGH>;
+		output-high;
+		line-name = "SD0_PWEN";
+	};
+#endif
+
+	sdhi0_sd_pins: sd0-sd-group {
+		data-pins {
+			pinmux = <RZT2H_PORT_PINMUX(12, 2, 0x29)>, /* SD0_DATA0 */
+				 <RZT2H_PORT_PINMUX(12, 3, 0x29)>, /* SD0_DATA1 */
+				 <RZT2H_PORT_PINMUX(12, 4, 0x29)>, /* SD0_DATA2 */
+				 <RZT2H_PORT_PINMUX(12, 5, 0x29)>; /* SD0_DATA3 */
+		};
+
+		ctrl-pins {
+			pinmux = <RZT2H_PORT_PINMUX(12, 0, 0x29)>, /* SD0_CLK */
+				 <RZT2H_PORT_PINMUX(12, 1, 0x29)>, /* SD0_CMD */
+				 <RZT2H_PORT_PINMUX(22, 5, 0x29)>, /* SD0_CD */
+				 <RZT2H_PORT_PINMUX(22, 6, 0x29)>; /* SD0_WP */
+		};
+	};
+
 #if SD1_MICRO_SD
 	sdhi1-pwen-hog {
 		gpio-hog;
@@ -153,6 +190,20 @@ &sdhi0 {
 };
 #endif
 
+#if SD0_SD
+&sdhi0 {
+	pinctrl-0 = <&sdhi0_sd_pins>;
+	pinctrl-1 = <&sdhi0_sd_pins>;
+	pinctrl-names = "default", "state_uhs";
+	vmmc-supply = <&reg_3p3v>;
+	vqmmc-supply = <&vqmmc_sdhi0>;
+	bus-width = <4>;
+	sd-uhs-sdr50;
+	sd-uhs-sdr104;
+	status = "okay";
+};
+#endif
+
 #if SD1_MICRO_SD
 &sdhi1 {
 	pinctrl-0 = <&sdhi1_pins>;
-- 
2.51.0


