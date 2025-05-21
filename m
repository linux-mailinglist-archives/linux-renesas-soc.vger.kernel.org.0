Return-Path: <linux-renesas-soc+bounces-17321-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 4DF21ABF77A
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 21 May 2025 16:14:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 5E845188DC75
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 21 May 2025 14:13:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 38CD21A071C;
	Wed, 21 May 2025 14:10:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="VjfA0xGd"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-lf1-f42.google.com (mail-lf1-f42.google.com [209.85.167.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 683D718DF9D
	for <linux-renesas-soc@vger.kernel.org>; Wed, 21 May 2025 14:10:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747836643; cv=none; b=V4tmpygF58ix347e6nJMD7NC6kPOBt/BT1M6DUyVqGBYMzKNiRZtVbUcjCjsmMcNF/aWbBRpibjEfFvmaiB5vfCkOd3grDMu9uEpIuf/vn8UzUBjf8RzNnn6rOgslyY67ZFzf7w0/NnM70C7/tMm17SLmgDgcmxVoiy/fstLXL4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747836643; c=relaxed/simple;
	bh=OQ1NjhaRqgeRJck8clk8hAkhTOm7Z0typP+i2KOU6uY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=JVDoZJ+l/Wj4XOKoHU/PdaCB+slBHYe7b1/ob6hSsST1j+AWeqFodXk7kgpt4euoooNhNqiJ+TC4UkkMSKzZ4XoefsARNsmY2+Gebcl5pfbbMaOYNE1rxZ8W2qGKfG440tQiqKqVIflADT5Nkp4Wvivp415L5E0pv4ZEhFgISZI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=VjfA0xGd; arc=none smtp.client-ip=209.85.167.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Received: by mail-lf1-f42.google.com with SMTP id 2adb3069b0e04-54b10594812so8057825e87.1
        for <linux-renesas-soc@vger.kernel.org>; Wed, 21 May 2025 07:10:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1747836639; x=1748441439; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=j2m/AQHhUKCMB2ooeH4OXmkM2QdyDkeRoTJbiJc49Qw=;
        b=VjfA0xGdXDoWq9hSZ2KqMc3b7yEDYNdulcYH+LMi+10GXsb7u7OU/QZpubAOvuf3o1
         hkn0s+Gfz3NAGOUnGJSbNm039VM+MMpQIJLry1M47eJIbV+moaFrgNxG1rzqRnpvFOv8
         CbxU2X/KeA6Z5Wo581riRsjyuRoCY75pEGfABGEZ+MhhkHGYC4tdPqNWbpW+bY/9XU9q
         7V1KQlkomcrDxazHXO3RR5JC2c5LLM+WnCXI+86584dgzytyKqUH/g12GDc5ix6bOns+
         YJ0K+tp7pvvvT90m7FwqPMJLboR+oZvN/3MWXKqE//6aeD+lazcckOawDAVTdm6Y2iKe
         tMXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747836639; x=1748441439;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=j2m/AQHhUKCMB2ooeH4OXmkM2QdyDkeRoTJbiJc49Qw=;
        b=iY3z+QVmr3LvmqI4a8o3Rn73VVZ26R3Qq2YI/mwze6oo1BOqzCTJrJnjvDgJVFbUh9
         4k1W7M3I0Kddb3n+r+ERwMxwp/V9DVSsURzF6pRZTn0CO1IjapDj8zKrLwaWrKCAGazl
         TZOMFBrNaRSU3tFgAzKAOSVTw1KU99fIuhx6yiwxiHH+PddNrE1Dbv+J6jtD5dHEshQx
         s0ueERWew424qfFacVy3cH9eERNaAfr6YOAyL102djb4Xm8++JNqRRX4/tipQsCz+hIa
         +Tn2n1ghknYrgwG0ugFNdd8Ps509hRFde/vlAj0z9zeCcrvvLnI6XzNbc7OAusHLUgaq
         oYBw==
X-Forwarded-Encrypted: i=1; AJvYcCVR0FOtfgGTZFVHVEl2XpSVqymKPm0BMiOfNx8FS7vwgdti8a1L8c8jtJ2ZWWMwoloC4OMd2XOWB6rrMKlSuc5efA==@vger.kernel.org
X-Gm-Message-State: AOJu0YzcelrbmwcD1iica3c+p0CSZQmTn35GJOcT2RyCnrvXClGgxh68
	qUvMlRtJQ9DS8ac6PZlG3LcSlyggQwjb3UJMrYK5t2wNL8TdqjqQ+1vqQCF1XnbXlhVafRYR2Mz
	oV0aO
X-Gm-Gg: ASbGncvbtnL2q91zSMynyF4+yMNph8UJ1Ge48sYk6lBTKV2WtERwRd3GllgSSK+audt
	4lshuPQqU8+/y0y+GkwLPXvNXw5QVx3pRUYchnNfkJJOXmM1KUbKCatCdwan8YmErxVbn5hcAn3
	avTPrjMnR+3WFy/qRwBi2FwwmjQpttfehLh11T6KknYUdHeQkFJ5zmm3Xee78IFMJOl2er3plu3
	b225foHoUi0vnQwasbvjh27k/Q1oYNraHm5vxrH1k+oVFMdxLHwI1YGfZc/e7WcPUDXhOu9aYh6
	9lTzy6UyrUkE2UX0gcWfu3iT0qLZQbeX+zICuYblmSYemT6LoAZm4GSiiBngbOfeFSBi8GY379M
	sSxMR
X-Google-Smtp-Source: AGHT+IGdD+yAG7ixkuPBvb5SmYpr1MB+zCBzWTmXhHcnzFLU4L4Om8QGyJVgnGJCce8K1qT9dbWwIA==
X-Received: by 2002:a17:907:968f:b0:ad2:53fc:a884 with SMTP id a640c23a62f3a-ad52d549101mr2013009566b.29.1747836628448;
        Wed, 21 May 2025 07:10:28 -0700 (PDT)
Received: from claudiu-X670E-Pro-RS.. ([82.78.167.58])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ad52d271916sm914552866b.69.2025.05.21.07.10.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 May 2025 07:10:27 -0700 (PDT)
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
	kees@kernel.org,
	gustavoars@kernel.org,
	biju.das.jz@bp.renesas.com
Cc: claudiu.beznea@tuxon.dev,
	linux-phy@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	linux-hardening@vger.kernel.org,
	john.madieu.xa@bp.renesas.com,
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
Subject: [PATCH v3 12/12] arm64: dts: renesas: rzg3s-smarc: Enable USB support
Date: Wed, 21 May 2025 17:09:43 +0300
Message-ID: <20250521140943.3830195-13-claudiu.beznea.uj@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250521140943.3830195-1-claudiu.beznea.uj@bp.renesas.com>
References: <20250521140943.3830195-1-claudiu.beznea.uj@bp.renesas.com>
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
Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
---

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


