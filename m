Return-Path: <linux-renesas-soc+bounces-23520-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 32194C01A5D
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 23 Oct 2025 16:09:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A1C063B9588
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 23 Oct 2025 13:59:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D675C32B997;
	Thu, 23 Oct 2025 13:58:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="jPwUFSeg"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com [209.85.218.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B678632B99C
	for <linux-renesas-soc@vger.kernel.org>; Thu, 23 Oct 2025 13:58:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761227922; cv=none; b=UpwIgJKiudZmVSiiy5RdSGw8iucl6ZB41dLSqG3JYe2pazlZZK8LMdh0tLg33X/iflsQuCdDQYjOBfE1612bewbjv5uJt1k6T4Wpjp8Ko2q1Mbwa38rOIKdQac4Y/qRNZhcETnqUk4VHne2tEtYYLRn1wJQB7ugH1Nv5vYBEnj8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761227922; c=relaxed/simple;
	bh=50hw/72TpRU+0O/DF7+aRtgAC5bIC3qKK0GLCIJ0bWY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Vl+KrfJeQ+pjts6eZ+104qBlTAN2Uhz8Vugf8I6zVE0g40RkBmik+rcgOkNEF41GnK9w34jeaH+3TwEvv2tRar7ZqJOTw3AO+36Jq0/78MLrPI43jrS/A3fHW1n3oNkqmQEj/FaKplMGkmp0ybbli6giNELHhf+kemZQKBSkx7k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=jPwUFSeg; arc=none smtp.client-ip=209.85.218.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Received: by mail-ej1-f47.google.com with SMTP id a640c23a62f3a-b3b3a6f4dd4so182031166b.0
        for <linux-renesas-soc@vger.kernel.org>; Thu, 23 Oct 2025 06:58:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1761227919; x=1761832719; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EDOk3wzJ/Csdlnb+sDEwzVll8zo5EaNbS49j4wNtazc=;
        b=jPwUFSegNA5zL2D0GbNPVyGJVe5ioYTQn6Gb66hqPUcR24NIenJE3WyW+y0WmCbicr
         GNMwqksrzBLZDyhC5Zp/XFiC3X5I1M+DOHjAehpuHTNqH3awHZEFTMKYKz9UCXNAiayI
         nWJRMT5Ou4R9ICg20A/Gcrz4JVr5s4YKgXyT8Lk8kncrXkfmciT6InsvRvrWm3YckICB
         5Ep8Im8wdDFr5oB1tyIWTBVkFexPo8rRSzZ/wqaXXsGjSY11Ggenu8OroN3waldp58wv
         Rx0GmGLmSBVBM8JsUUijJOpEHPJb9eSDA8Ka5h7uzsXVo0sxUfoJQQiZ9xPHfaOUREZq
         UeXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761227919; x=1761832719;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=EDOk3wzJ/Csdlnb+sDEwzVll8zo5EaNbS49j4wNtazc=;
        b=LDC0lpixf89IesrhxRPz2pbWD/1QaapIboqGW9tWDAdMHr6Kr4C5PkAv+oK5QBC7V3
         Di7PYi8Fbuv+/PgtiSuR+vDf8rcVz62Yp2bmPfpJVbtyEHTeoo30wUuzNPQU9sGnlHPi
         z2I05to0Lp41peYVNNjkTv+cJbiACFqPcmgwj9T5JHdBWgsxR/3285mmTa5hOoNDISl9
         DjmsHiHvtzcOIbZip0J5COkIh69Y20CJVUX6Zb/DsxmfHEtIfU1PE6ySigZGy7xViP68
         KeqMfd2G4qEICvxTMPs6KVzGmuoyO9QKQ3FSujtQLoq9KltuwdZVNUH8jX4DcwOQjayc
         QnkQ==
X-Forwarded-Encrypted: i=1; AJvYcCWdG66j+TH1o+BBSL8iIH7mzaqHIkDkoWLgw2Y7Zafa9vh4heMYsbggWEL0H+rm+kkvkO5z8aFTM4vVOKyAwj37jQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YxtWcn4Mq+nWgIRj0hqLnBorQMUo8BZh0op4UcS8EvPMMZugl7b
	zFaXTMuEXOmb9JmLn/M1BcHNKjq6GFHkDBvcGd6dHajc1r5a/CowVzeydVNg/pQmd28=
X-Gm-Gg: ASbGnctB56DYyquOZ0djk5gTAQ9eN9EATtYRQHK5XRJLaDvtB6Hyy3eosmTfAafSlEp
	5/I8FYCyp3zlCojiBplbv5XnI2GOBNwoSlRquboLeXny5ZmKO5Xri/BrKjFixA5p50AbYpYoaHX
	s4fXHxI4zNNybq+7p7l0zYoD6gCHWKcz8W+PVNdc2jJnp0Yps2J3H6kHb+ScM1pfamM1KYY80yS
	fL0zLPVsU66uM6uasc6hSc6ryZex0tkab3ss/iuTc0Y12Bw1mQxNpmr4Xyu7kuOqEHA+InnP7f1
	lq3k0u+ENOgMjMRz69F6w5rQpWQNs9x+mf0ToRluv1FewgHk4Y7aehGqDku2Gk3Erf35tH3Sslb
	NBTb3vRomuoq5BlumCstO85w+FnFbOaRHQWHMkkxiWnLVac8qQPXPcUCAMxXkPg84mcYK11mtV0
	Qy2CCAl998jg8GMXg+Z3/rU7JeDSe9pElIGz9C/jVq
X-Google-Smtp-Source: AGHT+IFBx3dgJXH4lEpxnlJJFwOwoH+u/MOZe+M6OK+FLRB/x3UWGEvHv5qUZS/pYvr0WhrpOqUmSg==
X-Received: by 2002:a17:907:3d9e:b0:b3e:3c1c:d301 with SMTP id a640c23a62f3a-b64769cb8cfmr2888032566b.61.1761227918932;
        Thu, 23 Oct 2025 06:58:38 -0700 (PDT)
Received: from claudiu-X670E-Pro-RS.. ([82.78.167.151])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b6d511f8634sm226114066b.29.2025.10.23.06.58.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Oct 2025 06:58:38 -0700 (PDT)
From: Claudiu <claudiu.beznea@tuxon.dev>
X-Google-Original-From: Claudiu <claudiu.beznea.uj@bp.renesas.com>
To: vkoul@kernel.org,
	kishon@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	p.zabel@pengutronix.de,
	geert+renesas@glider.be,
	magnus.damm@gmail.com,
	yoshihiro.shimoda.uh@renesas.com,
	biju.das.jz@bp.renesas.com
Cc: claudiu.beznea@tuxon.dev,
	linux-phy@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>,
	Wolfram Sang <wsa+renesas@sang-engineering.com>
Subject: [PATCH v8 7/7] arm64: dts: renesas: rzg3s-smarc: Enable USB support
Date: Thu, 23 Oct 2025 16:58:10 +0300
Message-ID: <20251023135810.1688415-8-claudiu.beznea.uj@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251023135810.1688415-1-claudiu.beznea.uj@bp.renesas.com>
References: <20251023135810.1688415-1-claudiu.beznea.uj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>

Enable USB support (host, device, USB PHYs).

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
Tested-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
---

Changes in v8:
- none

Changes in v7:
- none

Changes in v6:
- collected tags

Changes in v5:
- none

Changes in v4:
- none

Changes in v3:
- collected tags

Changes in v2:
- this was patch 15/16 in v1:
- dropped sysc enablement as it is now done in SoC dtsi file

 arch/arm64/boot/dts/renesas/rzg3s-smarc.dtsi | 57 ++++++++++++++++++++
 1 file changed, 57 insertions(+)

diff --git a/arch/arm64/boot/dts/renesas/rzg3s-smarc.dtsi b/arch/arm64/boot/dts/renesas/rzg3s-smarc.dtsi
index 5e044a4d0234..5586dd43c4d5 100644
--- a/arch/arm64/boot/dts/renesas/rzg3s-smarc.dtsi
+++ b/arch/arm64/boot/dts/renesas/rzg3s-smarc.dtsi
@@ -92,6 +92,20 @@ &audio_clk2 {
 	clock-frequency = <12288000>;
 };
 
+&ehci0 {
+	dr_mode = "otg";
+	status = "okay";
+};
+
+&ehci1 {
+	status = "okay";
+};
+
+&hsusb {
+	dr_mode = "otg";
+	status = "okay";
+};
+
 &i2c0 {
 	status = "okay";
 
@@ -132,6 +146,15 @@ power-monitor@44 {
 	};
 };
 
+&ohci0 {
+	dr_mode = "otg";
+	status = "okay";
+};
+
+&ohci1 {
+	status = "okay";
+};
+
 &pinctrl {
 	audio_clock_pins: audio-clock {
 		pins = "AUDIO_CLK1", "AUDIO_CLK2";
@@ -207,6 +230,27 @@ ssi3_pins: ssi3 {
 			 <RZG2L_PORT_PINMUX(18, 4, 8)>, /* TXD */
 			 <RZG2L_PORT_PINMUX(18, 5, 8)>; /* RXD */
 	};
+
+	usb0_pins: usb0 {
+		peri {
+			pinmux = <RZG2L_PORT_PINMUX(5, 0, 1)>, /* VBUS */
+				 <RZG2L_PORT_PINMUX(5, 2, 1)>; /* OVC */
+		};
+
+		otg {
+			pinmux = <RZG2L_PORT_PINMUX(5, 3, 1)>; /* OTG_ID */
+			bias-pull-up;
+		};
+	};
+
+	usb1_pins: usb1 {
+		pinmux = <RZG2L_PORT_PINMUX(5, 4, 5)>, /* OVC */
+			 <RZG2L_PORT_PINMUX(6, 0, 1)>; /* VBUS */
+	};
+};
+
+&phyrst {
+	status = "okay";
 };
 
 &scif0 {
@@ -242,3 +286,16 @@ &ssi3 {
 	pinctrl-0 = <&ssi3_pins>, <&audio_clock_pins>;
 	status = "okay";
 };
+
+&usb2_phy0 {
+	pinctrl-0 = <&usb0_pins>;
+	pinctrl-names = "default";
+	vbus-supply = <&usb0_vbus_otg>;
+	status = "okay";
+};
+
+&usb2_phy1 {
+	pinctrl-0 = <&usb1_pins>;
+	pinctrl-names = "default";
+	status = "okay";
+};
-- 
2.43.0


