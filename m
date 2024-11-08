Return-Path: <linux-renesas-soc+bounces-10423-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id DE0239C1B93
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  8 Nov 2024 11:56:24 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 9E4482826B6
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  8 Nov 2024 10:56:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4CFC81F8181;
	Fri,  8 Nov 2024 10:51:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="RrYdwrn+"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 369501F80C6
	for <linux-renesas-soc@vger.kernel.org>; Fri,  8 Nov 2024 10:51:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731063072; cv=none; b=l7AMDJzLtaS886wn479iIW7B0Hft7K40YWQWLX04tQ2m1VadkJCtETnitSZe3kn4dR2Uw4HNF1YXWP55B83T3iohaNTLRbR/wksl9/ok949MiKFgXQzgOQASxyC8egNsOBIYoR7LhqIQcXMsvLxMDLh5QMqW+dGOWkwpnlUTx1U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731063072; c=relaxed/simple;
	bh=iwKYtnUO5mBYbaZtdcCegsqfpDom/fKhIFinWfXd0vw=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=d61UI6dwD2cx4CILoSpjULCplmb03Gza3s2XkgSWgi1/8z2A5oMA9cQdV1yOZR2KFi1w18EE27l1CjCsmQmQvbcA0opENzXWvO5FusWLk8JftodxzJq9JFBQ2Y+rBWOFdIuBCWy0DPA3tzaZwJHLBrClL5JfOzovfY0fmvm09i8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=RrYdwrn+; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-43162cf1eaaso23473615e9.0
        for <linux-renesas-soc@vger.kernel.org>; Fri, 08 Nov 2024 02:51:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1731063068; x=1731667868; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nco7UE3UYy9Sta2zuMyVlE3BNHup7IH/6tKlAderS98=;
        b=RrYdwrn+DoD78GUZap2RTZz1d58r/fLthkTd7a+WoeAqV9kbgISfTZgc5SnB+zq1eX
         ixme4sISgIkvqaGg0ueHTKkxaITeMowQk6df+yKXvTZKK9+cQblgOXa9x5313EGgNzLS
         o93HAwf56t+sEW4Kw/PWgyRXQGSb0MSZIHkLqJjVDaz1wjOgYzk6lUveiO35UgJeFslu
         w0qyA/j93Tv8Fx7gLH9kaShuiD5NgSJ7y9BUCaRla/HlNg+5TvXILjbjmEiNkI8za/G+
         WyvvyiRsfESphcUN24J3iSZBSzgQLk9iDwyqG1KgFykCBO58cZodsAgPEwEndLacdZBa
         1r9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731063068; x=1731667868;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=nco7UE3UYy9Sta2zuMyVlE3BNHup7IH/6tKlAderS98=;
        b=c/+9rZfOPVSrjqligboFIPO9KhjrKZNpnZvgXm/V4JpIifdA4WNPiDoazPfEblTGLy
         hxB4ttajs3Xs8NHTIG99upPoZ8nlLIOg3hwZNuLTe4EF+P0WXVwgOBvdsgvL/eTva16i
         psqBfkEt1CIgyDvE1PECCk5d/504wtSBMhXn+xYdtXjNuteOKiWKHQbnghLWC3JOSvL9
         YyT6ZbX3HaQygzRDyEsQ9FKxTG96ahrkd3iJ+87E8mApQzORmfO/7eJok2axe/gErL4S
         08DWd0goY2KpUuRM59FpxjUMekd0oVGc6hV/RLkzcRPbcTJxRJXPuIikXmArIoY643CN
         nFnQ==
X-Gm-Message-State: AOJu0Yx/U5AbdjrxsgP4tkXJxwT1LFKBjBp2A2hC9KtSSENfEeIfkFXB
	dzBg9BBd0OBrvRvnMXwzFnIVT14QuBfZXjRVYXkUWvLUrCZTK11Vy8ph1pGF6+A=
X-Google-Smtp-Source: AGHT+IGMKrD0gPssGmNoCMH/KMgV5TjluvYb5sJslXLi2kOy6vPr8TBZ9YYdW8gPW95TY8Tv75uqMw==
X-Received: by 2002:a05:6000:1868:b0:37c:d1ea:f1ce with SMTP id ffacd0b85a97d-381f1871ae1mr2218295f8f.25.1731063068533;
        Fri, 08 Nov 2024 02:51:08 -0800 (PST)
Received: from claudiu-X670E-Pro-RS.. ([82.78.167.28])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a9ee0dc574dsm220464866b.101.2024.11.08.02.51.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 08 Nov 2024 02:51:07 -0800 (PST)
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
	perex@perex.cz,
	tiwai@suse.com,
	p.zabel@pengutronix.de
Cc: linux-renesas-soc@vger.kernel.org,
	linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-sound@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	claudiu.beznea@tuxon.dev,
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
Subject: [PATCH v2 22/25] arm64: dts: renesas: rzg3s-smarc-som: Add versa3 clock generator node
Date: Fri,  8 Nov 2024 12:49:55 +0200
Message-Id: <20241108104958.2931943-23-claudiu.beznea.uj@bp.renesas.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20241108104958.2931943-1-claudiu.beznea.uj@bp.renesas.com>
References: <20241108104958.2931943-1-claudiu.beznea.uj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>

Add versa3 clock generator node. It provides the clocks for the Ethernet
PHY, PCIe, audio devices.

Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
---

Changes in v2:
- none

 .../boot/dts/renesas/rzg3s-smarc-som.dtsi     | 30 +++++++++++++++++++
 1 file changed, 30 insertions(+)

diff --git a/arch/arm64/boot/dts/renesas/rzg3s-smarc-som.dtsi b/arch/arm64/boot/dts/renesas/rzg3s-smarc-som.dtsi
index 2ed01d391554..6e58d47d85b0 100644
--- a/arch/arm64/boot/dts/renesas/rzg3s-smarc-som.dtsi
+++ b/arch/arm64/boot/dts/renesas/rzg3s-smarc-som.dtsi
@@ -92,6 +92,12 @@ vcc_sdhi2: regulator2 {
 		gpios = <&pinctrl RZG2L_GPIO(8, 1) GPIO_ACTIVE_HIGH>;
 		enable-active-high;
 	};
+
+	x3_clk: x3-clock {
+		compatible = "fixed-clock";
+		#clock-cells = <0>;
+		clock-frequency = <24000000>;
+	};
 };
 
 #if SW_CONFIG3 == SW_ON
@@ -152,6 +158,30 @@ &extal_clk {
 
 &i2c1 {
 	status = "okay";
+
+	versa3: clock-generator@68 {
+		compatible = "renesas,5l35023";
+		reg = <0x68>;
+		clocks = <&x3_clk>;
+		#clock-cells = <1>;
+		assigned-clocks = <&versa3 0>,
+				  <&versa3 1>,
+				  <&versa3 2>,
+				  <&versa3 3>,
+				  <&versa3 4>,
+				  <&versa3 5>;
+		assigned-clock-rates = <24000000>,
+				       <12288000>,
+				       <11289600>,
+				       <25000000>,
+				       <100000000>,
+				       <100000000>;
+		renesas,settings = [
+		  80 00 11 19 4c 42 dc 2f 06 7d 20 1a 5f 1e f2 27
+		  00 40 00 00 00 00 00 00 06 0c 19 02 3f f0 90 86
+		  a0 80 30 30 9c
+		];
+	};
 };
 
 #if SW_CONFIG2 == SW_ON
-- 
2.39.2


