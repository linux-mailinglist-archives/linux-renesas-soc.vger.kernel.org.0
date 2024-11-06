Return-Path: <linux-renesas-soc+bounces-10343-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id BC0159BE0DC
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  6 Nov 2024 09:27:26 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id ED5F41C22B1D
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  6 Nov 2024 08:27:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2F0931D90D9;
	Wed,  6 Nov 2024 08:20:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="eV+t804Q"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com [209.85.218.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 58F8D1E04B2
	for <linux-renesas-soc@vger.kernel.org>; Wed,  6 Nov 2024 08:20:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730881225; cv=none; b=bdAfBu/vZdjqYO30jrsuu5sr0/xeLUVHkBQlYIwCOgLEMFrZ02DQ38/zmnVkagh2xd/xQuV+F4FuKkWRWcNlVsI6JinewyGOMh9U2kVy624n5lpN3SzRltW0kq63GBQ7wgNmb7fWnRxz7qF8wFCg1cNnsVvDXrWvWalsW1CTiL0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730881225; c=relaxed/simple;
	bh=8yJI0mYXsz5dOwT6BjRGT+xWsu+mizxUkLmCvM+DzJs=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=UUquBy1iVNRQONDOx3e1eRZwGGD5FlRUJyS5Yf9ZCcYQvVep0/9EmDk8MeHmwPSVDf9O6W0fKNwD4ER3OTn0dHs5b3Et8ylpKU6KD5p3vttvT9xGqaSm/SbGjMBnovgipVmas27Xlr7oB74zswVLG98+Bn7NHAcZJrN4ab7LgGQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=eV+t804Q; arc=none smtp.client-ip=209.85.218.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Received: by mail-ej1-f41.google.com with SMTP id a640c23a62f3a-a99ebb390a5so111916766b.1
        for <linux-renesas-soc@vger.kernel.org>; Wed, 06 Nov 2024 00:20:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1730881221; x=1731486021; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4rBv1tlenlzUf0GNpxBKVr1uH/zXhu88znHCFxv/0Ig=;
        b=eV+t804QqBhJhyq/mdr2EfUt6o63zlxxjnoQEQtNi7eTtVt9AcyrWDQrtzi3R4qpFn
         Pvz1J11I08z5/14NPkwbp9RyvOQIBHdh+HuHVr6Fjx/YvqKzTW3cvrDB8+44IqtXJCk2
         JCLehX07a7g5q0H/p8C5/l9GPpvSk+imCj4zn6QvZ8Un+nNiCLaPnu7yFLgW0E6eXhdy
         06IIr7P5q1YzLsb0e96H+cQ3nU4z1WV7AXP9XdZGRdXAwuxBC1w5tqNezgFXmgw2G9dV
         aEZjcWvmpQRaM9D6xV0tO7Dx11VNc57zPjqz/LQFLZh4hqnQJs14AYsRB56OUCzMHxrK
         GqpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730881221; x=1731486021;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4rBv1tlenlzUf0GNpxBKVr1uH/zXhu88znHCFxv/0Ig=;
        b=nshY5TuVoz0AseflBP/yY4lbyR9kzouWOdHM7zammzYu6Jqq6IZhWxM2+R11lRJkuI
         n/GVVPzBlYg2/ReNs/dy5gekETp+CmHc/+V8LNQVj9wLqwD9RvSmgJ/smyMi1/twmiwu
         4ZD3Nq6Gr5Jl+oyoxUuz2AD0u7e96JCbYPoXxvQt5D7Cf4mK6X4j1nAniLWJbwqUOc/e
         837vFITmqrFWnyGoAxhRG9qzDbGmvERQ3dy7wTUhLoVDGuxH/puK+t/bWfPXiiwB0NXw
         CLdOm2n9e8UhSEZ0BXiYWOxHzM6jCA8Pjv0pPWCbJE/rmkWHMvyXjnPEETufJ5pb7eT8
         HLBg==
X-Gm-Message-State: AOJu0Yx90jHEikgsKoBy5S08huQjj13UT6iYx3rfHvVXYwwOr6LKwr+m
	2GD7k5rjBG0HdQH0y30tbTkUEuHKsKTQ+7o2Zq72B9adVqDRqUWM4vlLRld/vx4=
X-Google-Smtp-Source: AGHT+IGxd/t66BkIJdhTWGthBklD0jFljSoqbTQh4Ur+Q8xUdEezNOGFGS6kLVKbq+iHDtdgEplMKA==
X-Received: by 2002:a17:907:c0e:b0:a9a:1575:23e3 with SMTP id a640c23a62f3a-a9ec663c7admr178655466b.19.1730881220768;
        Wed, 06 Nov 2024 00:20:20 -0800 (PST)
Received: from claudiu-X670E-Pro-RS.. ([82.78.167.28])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a9eb16a2dbcsm241369766b.40.2024.11.06.00.20.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 Nov 2024 00:20:20 -0800 (PST)
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
Subject: [PATCH 30/31] arm64: dts: renesas: rzg3s-smarc: Enable SSI3
Date: Wed,  6 Nov 2024 10:18:25 +0200
Message-Id: <20241106081826.1211088-31-claudiu.beznea.uj@bp.renesas.com>
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

Enable SSI3.

Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
---
 arch/arm64/boot/dts/renesas/rzg3s-smarc.dtsi | 26 ++++++++++++++++++++
 1 file changed, 26 insertions(+)

diff --git a/arch/arm64/boot/dts/renesas/rzg3s-smarc.dtsi b/arch/arm64/boot/dts/renesas/rzg3s-smarc.dtsi
index 4aa99814b808..6dd439e68bd4 100644
--- a/arch/arm64/boot/dts/renesas/rzg3s-smarc.dtsi
+++ b/arch/arm64/boot/dts/renesas/rzg3s-smarc.dtsi
@@ -64,6 +64,11 @@ vccq_sdhi1: regulator-vccq-sdhi1 {
 	};
 };
 
+&audio_clk2 {
+	clock-frequency = <12288000>;
+	status = "okay";
+};
+
 &i2c0 {
 	status = "okay";
 
@@ -94,6 +99,11 @@ da7212: codec@1a {
 };
 
 &pinctrl {
+	audio_clock_pins: audio-clock {
+		pins = "AUDIO_CLK1", "AUDIO_CLK2";
+		input-enable;
+	};
+
 	key-1-gpio-hog {
 		gpio-hog;
 		gpios = <RZG2L_GPIO(18, 0) GPIO_ACTIVE_LOW>;
@@ -151,6 +161,13 @@ cd {
 			pinmux = <RZG2L_PORT_PINMUX(0, 2, 1)>; /* SD1_CD */
 		};
 	};
+
+	ssi3_pins: ssi3 {
+		pinmux = <RZG2L_PORT_PINMUX(18, 2, 8)>, /* BCK */
+			 <RZG2L_PORT_PINMUX(18, 3, 8)>, /* RCK */
+			 <RZG2L_PORT_PINMUX(18, 4, 8)>, /* TXD */
+			 <RZG2L_PORT_PINMUX(18, 5, 8)>; /* RXD */
+	};
 };
 
 &scif0 {
@@ -171,3 +188,12 @@ &sdhi1 {
 	max-frequency = <125000000>;
 	status = "okay";
 };
+
+&ssi3 {
+	clocks = <&cpg CPG_MOD R9A08G045_SSI3_PCLK2>,
+		 <&cpg CPG_MOD R9A08G045_SSI3_PCLK_SFR>,
+		 <&versa3 2>, <&audio_clk2>;
+	pinctrl-names = "default";
+	pinctrl-0 = <&ssi3_pins>, <&audio_clock_pins>;
+	status = "okay";
+};
-- 
2.39.2


