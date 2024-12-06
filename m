Return-Path: <linux-renesas-soc+bounces-11013-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B8C59E6D67
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  6 Dec 2024 12:28:02 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 3A82416AB8D
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  6 Dec 2024 11:26:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 88B4B2066EE;
	Fri,  6 Dec 2024 11:14:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="O/DzIXZm"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com [209.85.218.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB8A31FECC8
	for <linux-renesas-soc@vger.kernel.org>; Fri,  6 Dec 2024 11:14:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733483662; cv=none; b=dCgE7RNEYMH9vKAPGE6WODs0JctIX/+d+N58x5Ssv9XSTde8mVfygoCE6cYcZe3NvY3y1cYq5+AcktG9PLUf+lOLqtIcxE9FZJGHS9ZNIdUyQQwSd4JnhVvrVm79lGL9FM3LZYbrC/hS1g1fYqd2klAIfsOPQn5nz6sg2Jj10rI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733483662; c=relaxed/simple;
	bh=k6RYl4HHJUltxEdvGU/+maC6QDo0j1srIvB9wl/UUgs=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=N5cYR+4l2KVuXMNu0nD7UHqcZvtFKjwZsJ9RGn32D9U7ZNVklVnxwUC2+yHxccgT6cOm+nrKoDC1GXxc3m3Xh9xZ/yb32jRoUQCCoGbxVtQQ1PaKuEbUgYzVLFnkzuHzfQnH5vQhpYZ16p58g+iyKwUo2vwRRpBMkXbnSB0utwU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=O/DzIXZm; arc=none smtp.client-ip=209.85.218.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Received: by mail-ej1-f49.google.com with SMTP id a640c23a62f3a-a9a68480164so239930366b.3
        for <linux-renesas-soc@vger.kernel.org>; Fri, 06 Dec 2024 03:14:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1733483659; x=1734088459; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=iFCyto6njNpoAkuMysILtuSD/dfeIfCHeW4EjJllGlU=;
        b=O/DzIXZmwkX0i93A3+iL4GxA5PUZ4biXdFVEanjgqHaxP2uRiI0mZmvnExjlxUKvZc
         Ea7vCb9jdG98JaqXn5GGTxR9DFXmipTPkzeUhdRFX9h0uVQLcOulp/c9GiFasF6zadjl
         1L5KwJE7o+MXYLd4zMkxzS3nmBhbj3tgrpcTx7dAC6Vw0MOV1CbJ5UHJFdf+Mw19pdeN
         T96x6knK+REJq++MKkJEX/T7GlyYJwQnztS2Go2zPmIbY1cYQFer33mFFtflWuJW5FUe
         1LNCrCzpGLSFxpfjO98xf/7ZGv0c5Avlp0pcNdgDnovqnXV/2cys8NTfYfmDIP408ka+
         8Gyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733483659; x=1734088459;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=iFCyto6njNpoAkuMysILtuSD/dfeIfCHeW4EjJllGlU=;
        b=W6FY5+WtuxdlFWfVmUypD3d8+PQLzkvJTvuEF3fgIW391I7GOY8q5WAAAt7EN834Sb
         Y8jnryQgRok3Ydd4b/eeR11FxKx0uvMYHw8BtRsP7rC0zMkFv90s5dswv7ETbj6OJ9oD
         Oo4ydX7S9gR0t6ZUGVJouazkXCsNOF+ujFNQ9LyX8qlRyEGaYeUDg1QfmeObce1RDVIg
         mFvw/Y53OgeiKQIeV6jxy3aC8n8q6xYLX2tEuLVUNUTpyu3RrGOEr4o9RQhlEmQLaqEc
         kw16Jd88jouJmjy8PZVXNsDYZjulltxeAashWksEX9w3HMDUEKPB1jkU73zLWPKMulE3
         J+dQ==
X-Forwarded-Encrypted: i=1; AJvYcCWNDU5D7TlezCQG7Dwq4JaeJPC7KyVNlW9F9BphP1OhRPynKLQsZvpqUh/Gt+Irhvef68Ns8+nFuXYrqPwMvx44rg==@vger.kernel.org
X-Gm-Message-State: AOJu0YxvSGw0ahFwjeuZ1BPVPEpG5K0K2AGSDKJywq776+5Xi4c841o1
	0MsrS6IRb33PdmKEX+sdRQ2Sb+V7UwOKnda0NcstRDSTqJbUucy5CVw8gw5L6s4=
X-Gm-Gg: ASbGnctt4Rk6s3B33pFV8GPQWSjVMgX4WWvY9ahS5IZrSM0SOLiHDNzX3f+PFNpWzF9
	ZRLW1mmxA1zm/QRC4OzrFwQmqMEtXjX0l0RhniEm4UuAH99fWvJW7dKw2DTmPGZBOodL9IlzmLl
	uZ9F0oRQPzqmE0W1H/Cj2R0wYRSNgfbFjz3LeYCghW7OQKNBa/y7BZX1UHAv4PTtDPVIbnblJxZ
	0ZanulLEV4llKbiSsjdf5q3RW/J4yF6zrSIPns275jLuVUFdITTNe7HOsY2j7KXAzhTr1KHBO3y
	L2jn
X-Google-Smtp-Source: AGHT+IF8K/WU6hQLOeMVWhzwcTVS0WLZFH6PaGYPfojVpOBWvreAqVKSNqVp/mmguRkGijNh7B7IJQ==
X-Received: by 2002:a17:907:7850:b0:aa5:f288:e7e3 with SMTP id a640c23a62f3a-aa639fed04fmr165508366b.15.1733483659089;
        Fri, 06 Dec 2024 03:14:19 -0800 (PST)
Received: from claudiu-X670E-Pro-RS.. ([82.78.167.161])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aa625eee2a6sm226877866b.90.2024.12.06.03.14.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Dec 2024 03:14:18 -0800 (PST)
From: Claudiu <claudiu.beznea@tuxon.dev>
X-Google-Original-From: Claudiu <claudiu.beznea.uj@bp.renesas.com>
To: prabhakar.mahadev-lad.rj@bp.renesas.com,
	jic23@kernel.org,
	lars@metafoo.de,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	geert+renesas@glider.be,
	magnus.damm@gmail.com,
	mturquette@baylibre.com,
	sboyd@kernel.org,
	p.zabel@pengutronix.de
Cc: claudiu.beznea@tuxon.dev,
	linux-iio@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-clk@vger.kernel.org,
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
Subject: [PATCH v2 14/15] arm64: dts: renesas: r9a08g045: Add ADC node
Date: Fri,  6 Dec 2024 13:13:36 +0200
Message-Id: <20241206111337.726244-15-claudiu.beznea.uj@bp.renesas.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20241206111337.726244-1-claudiu.beznea.uj@bp.renesas.com>
References: <20241206111337.726244-1-claudiu.beznea.uj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>

Add the device tree node for the ADC IP available on the Renesas RZ/G3S
SoC.

Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
---

Changes in v2:
- none

 arch/arm64/boot/dts/renesas/r9a08g045.dtsi | 53 ++++++++++++++++++++++
 1 file changed, 53 insertions(+)

diff --git a/arch/arm64/boot/dts/renesas/r9a08g045.dtsi b/arch/arm64/boot/dts/renesas/r9a08g045.dtsi
index be8a0a768c65..eb57a52d2086 100644
--- a/arch/arm64/boot/dts/renesas/r9a08g045.dtsi
+++ b/arch/arm64/boot/dts/renesas/r9a08g045.dtsi
@@ -87,6 +87,59 @@ rtc: rtc@1004ec00 {
 			status = "disabled";
 		};
 
+		adc: adc@10058000 {
+			compatible = "renesas,r9a08g045-adc";
+			reg = <0 0x10058000 0 0x400>;
+			interrupts = <GIC_SPI 312 IRQ_TYPE_EDGE_RISING>;
+			clocks = <&cpg CPG_MOD R9A08G045_ADC_ADCLK>,
+				 <&cpg CPG_MOD R9A08G045_ADC_PCLK>;
+			clock-names = "adclk", "pclk";
+			resets = <&cpg R9A08G045_ADC_PRESETN>,
+				 <&cpg R9A08G045_ADC_ADRST_N>;
+			reset-names = "presetn", "adrst-n";
+			power-domains = <&cpg>;
+			#io-channel-cells = <1>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+			status = "disabled";
+
+			channel@0 {
+				reg = <0>;
+			};
+
+			channel@1 {
+				reg = <1>;
+			};
+
+			channel@2 {
+				reg = <2>;
+			};
+
+			channel@3 {
+				reg = <3>;
+			};
+
+			channel@4 {
+				reg = <4>;
+			};
+
+			channel@5 {
+				reg = <5>;
+			};
+
+			channel@6 {
+				reg = <6>;
+			};
+
+			channel@7 {
+				reg = <7>;
+			};
+
+			channel@8 {
+				reg = <8>;
+			};
+		};
+
 		vbattb: clock-controller@1005c000 {
 			compatible = "renesas,r9a08g045-vbattb";
 			reg = <0 0x1005c000 0 0x1000>;
-- 
2.39.2


