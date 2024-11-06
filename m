Return-Path: <linux-renesas-soc+bounces-10342-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 923B69BE0D4
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  6 Nov 2024 09:26:59 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 1024CB24206
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  6 Nov 2024 08:26:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 417351E04A8;
	Wed,  6 Nov 2024 08:20:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="li6gwWIM"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com [209.85.208.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C4F91E0091
	for <linux-renesas-soc@vger.kernel.org>; Wed,  6 Nov 2024 08:20:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730881222; cv=none; b=Fbx9T5lOym0VoMW4mfoyeQb3//Qozj+079xpuFwT9UQuTgKdPRsvlSJT5+wWgIXg1BbVWQxzn2SM6klOLAmrfWFQjv+585cMrFc0zN/qx3bos/xmU0Oaq3sKNdNyUl1N6/I4/kj2WVOoSNepr/puTqiZR5yh9xpU/w/Tdl6jWUc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730881222; c=relaxed/simple;
	bh=cBRx4XuK7CsWwd3v9rqTNVur89NmIjeQUxS1DPbKU6M=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=OU55iHpucvkerVg7XfCTJZ0nQL1+Ih+iU3eCEG3M9prW29DIxzoiifDOE8muOG4hO8PLDfUtzLIXBqOUWd0JP1745olpxXGZizSvqZ4gMQMBD1iXw2kniDRRcMcJifOjSWWFATTObMowZg6OmBSwKYNKFPjvWP5x+WV6w9JNjoI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=li6gwWIM; arc=none smtp.client-ip=209.85.208.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Received: by mail-ed1-f48.google.com with SMTP id 4fb4d7f45d1cf-5c9404c0d50so7676807a12.3
        for <linux-renesas-soc@vger.kernel.org>; Wed, 06 Nov 2024 00:20:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1730881218; x=1731486018; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cNiwTO6j6ONhEouxb05lD8qGmj3l0fQDnpAOS6jLTbU=;
        b=li6gwWIMiGTy32T/NNYh7XB0lHJ57JHWDHizJnjlL7k4Bwa7Vtmu1OsMBShUraFaZW
         nbPOz1v3mtayqZtMtd8mrNR4Vw87/22vk2CRqVfF6R7KQKXWU0eJxmcfA3pmlxO/T28I
         PvFikMGQrrjFQ7zqr4sqAL9TVwO2+uPYgLzKf8RGm4zAMobhWQtHEa/GBTlZdruisEjO
         0xzRpUtWg0OIAKf4ZJb7/lNERrXaOCSREKcqDYNHE8C6hnn+uOCEnhChXHDyTYkGuUuy
         U/+Jr1ZXbiyMIAGmU2Gp8YoiULuLr489gdmkPCL2L+jSEey2Toxp0eJ7pi6BsYGHiTw2
         acLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730881218; x=1731486018;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=cNiwTO6j6ONhEouxb05lD8qGmj3l0fQDnpAOS6jLTbU=;
        b=FHbSijmlMt2anqUHrRCXOV15NIRKi84JZPeWeVzi/6Wvf2iDehD7hfx3YBw5FO9pjD
         NVnsx8l1kS3hx6yTuD2EulnPVyz5YeSrXAsSpvgGNRRrzn90xrz//03GzFAtX9l2JSJJ
         ZQmbjfMpVweiqzNb+dirqnRE+M6zK1fQhSZ1CN8Sue2NsTJp1PgSWMRJetTnl7gQ4/xY
         1HpEJLhds/VcUTl32YCnzmrJVeFxCm01/DEBA5Qv0yJDUMj/5LSyHNrF0PP6Qk9/ID9z
         27KeIzduB4b11VE8MHD4VdLtk/NOMnR5J71h6nLHgfBH5zFGzQy2HhJtZ8NrHH0iZDZG
         jAIA==
X-Gm-Message-State: AOJu0YwgliGBBcEyJPsdE8eKxqZ/dU0fK9nDgi5COtLv17ghzJacxfuR
	CjSU1PfEubg8P+2iBI8d+xilZ+Bd+mgAc7tYL/KYeul6evrtqV6h6H7V77kbBbk=
X-Google-Smtp-Source: AGHT+IHhhe5RW8/s+uEyBC0bLuZKNA4PoDK1Jdq5Ojvpd1wT1OadkkNH9HltO6un8qy/lPeYu8YCHQ==
X-Received: by 2002:a17:907:cca3:b0:a9e:4b88:e03b with SMTP id a640c23a62f3a-a9e4b88e2famr1674460966b.0.1730881218534;
        Wed, 06 Nov 2024 00:20:18 -0800 (PST)
Received: from claudiu-X670E-Pro-RS.. ([82.78.167.28])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a9eb16a2dbcsm241369766b.40.2024.11.06.00.20.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 Nov 2024 00:20:18 -0800 (PST)
From: Claudiu <claudiu.beznea@tuxon.dev>
X-Google-Original-From: Claudiu <claudiu.beznea.uj@bp.renesas.com>
To: geert+renesas@glider.be,
	mturquette@baylibre.com,
	sboyd@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	biju.das.jz@bp.renesas.com,
	prabhakar.mahadev-lad.rj@bp.renesas.com,
	lgirdwood@gmail.com,
	broonie@kernel.org,
	magnus.damm@gmail.com,
	linus.walleij@linaro.org,
	support.opensource@diasemi.com,
	perex@perex.cz,
	tiwai@suse.com,
	p.zabel@pengutronix.de,
	Adam.Thomson.Opensource@diasemi.com
Cc: linux-renesas-soc@vger.kernel.org,
	linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-sound@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
Subject: [PATCH 29/31] arm64: dts: renesas: Add da7212 audio codec node
Date: Wed,  6 Nov 2024 10:18:24 +0200
Message-Id: <20241106081826.1211088-30-claudiu.beznea.uj@bp.renesas.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20241106081826.1211088-1-claudiu.beznea.uj@bp.renesas.com>
References: <20241106081826.1211088-1-claudiu.beznea.uj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>

Add the da7212 audio codec node. Along with it regulators nodes were
reworked to be able to re-use them on da7212.

Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
---
 .../boot/dts/renesas/rzg3s-smarc-som.dtsi     | 17 ++++++++++----
 arch/arm64/boot/dts/renesas/rzg3s-smarc.dtsi  | 23 +++++++++++++++++++
 2 files changed, 35 insertions(+), 5 deletions(-)

diff --git a/arch/arm64/boot/dts/renesas/rzg3s-smarc-som.dtsi b/arch/arm64/boot/dts/renesas/rzg3s-smarc-som.dtsi
index 6e58d47d85b0..5ee9dac4aebb 100644
--- a/arch/arm64/boot/dts/renesas/rzg3s-smarc-som.dtsi
+++ b/arch/arm64/boot/dts/renesas/rzg3s-smarc-som.dtsi
@@ -63,7 +63,6 @@ vcc_sdhi0: regulator0 {
 		enable-active-high;
 	};
 
-#if SW_CONFIG2 == SW_ON
 	vccq_sdhi0: regulator1 {
 		compatible = "regulator-gpio";
 		regulator-name = "SDHI0 VccQ";
@@ -73,8 +72,8 @@ vccq_sdhi0: regulator1 {
 		gpios-states = <1>;
 		states = <3300000 1>, <1800000 0>;
 	};
-#else
-	reg_1p8v: regulator1 {
+
+	reg_1p8v: regulator2 {
 		compatible = "regulator-fixed";
 		regulator-name = "fixed-1.8V";
 		regulator-min-microvolt = <1800000>;
@@ -82,9 +81,17 @@ reg_1p8v: regulator1 {
 		regulator-boot-on;
 		regulator-always-on;
 	};
-#endif
 
-	vcc_sdhi2: regulator2 {
+	reg_3p3v: regulator3 {
+		compatible = "regulator-fixed";
+		regulator-name = "fixed-3.3V";
+		regulator-min-microvolt = <3300000>;
+		regulator-max-microvolt = <3300000>;
+		regulator-boot-on;
+		regulator-always-on;
+	};
+
+	vcc_sdhi2: regulator4 {
 		compatible = "regulator-fixed";
 		regulator-name = "SDHI2 Vcc";
 		regulator-min-microvolt = <3300000>;
diff --git a/arch/arm64/boot/dts/renesas/rzg3s-smarc.dtsi b/arch/arm64/boot/dts/renesas/rzg3s-smarc.dtsi
index 4509151344c4..4aa99814b808 100644
--- a/arch/arm64/boot/dts/renesas/rzg3s-smarc.dtsi
+++ b/arch/arm64/boot/dts/renesas/rzg3s-smarc.dtsi
@@ -68,6 +68,29 @@ &i2c0 {
 	status = "okay";
 
 	clock-frequency = <1000000>;
+
+	da7212: codec@1a {
+		compatible = "dlg,da7212";
+		reg = <0x1a>;
+
+		#sound-dai-cells = <0>;
+		#address-cells = <1>;
+		#size-cells = <0>;
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
+	};
 };
 
 &pinctrl {
-- 
2.39.2


