Return-Path: <linux-renesas-soc+bounces-16901-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id EED57AB18DA
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  9 May 2025 17:36:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 9610B5256DA
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  9 May 2025 15:36:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7CB2B22FE19;
	Fri,  9 May 2025 15:36:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RhZERZ7b"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 99A5222F76F;
	Fri,  9 May 2025 15:36:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746804968; cv=none; b=QuHVJxFr6LPzeGz/FKv0q7vMnyJAYUBisOA4cJYrXegvVSJJ65L4T2VG6Xc0xbo/p4hgak3q65/Twmb4yfvQgBcotO30Su8tGJ9LxGhbgUVtgmg20mLd4Hit5XUNh2ECo3G5o9A0STzjPNCk0wTW3R7qbNd/Kl17FJAY3PFNkqg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746804968; c=relaxed/simple;
	bh=ewmhu+2KJsOn3faGkZJWVZKSPL8hGVVtR9u0PSqrkok=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Yi5vod/o0oMyw7DoJVphRxtUEfkwnN29mEjkEyR4teiSUYLMw2/Ys2W3j80g5bKMpU/5OKdqnniK4hWlU9J9+5hFA6gPiApdkPc1xtx2TqBnIB8/rKpEavSkffweHOnbSHFQaWMYKR4GFBSTl/I6CcQrzEeO9B8aLKl3Pr14sq8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=RhZERZ7b; arc=none smtp.client-ip=209.85.221.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-3a0be321968so1242183f8f.2;
        Fri, 09 May 2025 08:36:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746804965; x=1747409765; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HHDEwJeVWIPcfyMkBvC+zNX0SfL//VYDux4SjKN6FQ8=;
        b=RhZERZ7b0ZdMDpQ8qh+d512Ikw9DqrOIljUWZx34ihPU06ajOl8k3vlHr35GRAzREM
         VV4eAiSpn0yBwJM0xbFqHdAKzpxOJH1MP364xBz1NRtebGXs7E2pdTvoGdmNxLzdX2/K
         IIk25K2zFI7wiCVoKOR1fDq/0ap4K1Ug+/0qYfJnMR74g5cQETZakS08xM7AQKXu3ISf
         LNLL9zSZ6fKV8gMREoEDdbAk+zY3XMW7P5Z+ptZnJk/IJDME+qySMD99udGnLEBtL8XD
         Tdx/+/2UbTAHVxx0bsAF8+kuEjFuzkYVXeOvAxLghXWrmuJLFqn03CNOIW0258MZXqnB
         7Blw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746804965; x=1747409765;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=HHDEwJeVWIPcfyMkBvC+zNX0SfL//VYDux4SjKN6FQ8=;
        b=n82UDOcZ+YeVJ2+2hcYRXX3NJYXi7O1XPfQfKgX35m06TxtVkgfDsgkqqPUYJHPKCJ
         4PuRzrk24QQV5ktpaJJLgbkgPomHo6SPYNFPWwWr2yBzJhIS4S2NvdoaziOfhQ4QEALb
         Cmm8iVTUzw47e7IU1oS86y46k3wzef+CmmjA0WbNskjBRFTKh4HZ9KBpMmMKF5w/rLM/
         XoEtqv84CqZUVkyuFxBBDN8cxhJCHyJ0hF28AnKJ+egUwdPMbXLUUJofypI2MxQZRECt
         sqZl7EaV3zrdksLMI5HJ/7CtrZjXgfDP9/SFvjqBFbZd9TjAXhmTrtDFblCuZsNldvKi
         xM1w==
X-Forwarded-Encrypted: i=1; AJvYcCU7nM53vQZ6hP8EbjQ1vI0yFX8TVp76QTJ+AV5NUgTKw9EOZ0PAiUPPwpL5Iv9I4BxSR1g/08u8FXLbCVbd@vger.kernel.org, AJvYcCXKJNRuIXTLleWZ1pl+sp+r+rl1dsjlCpEr9sOtJ2av27gB2Bt/N9uGYVd7+M2y43paxQqi2sHJlkYN@vger.kernel.org
X-Gm-Message-State: AOJu0YwFnKDFijmeulykJ+5wbweRilJEOqOABZFtb7+yyPqWQBOvAbD4
	0Q/CtcdPErvLKaRustjC/GcO4fcwCMxht1LB2t9ZfVyurtumGnYG
X-Gm-Gg: ASbGncveoRlq3lKo+NyRFCoPUeg4OnF2fRjCv+SI0OEe7lzuN3ma4G4hU6Wwu+q6Elu
	ZRcVi0uVPBV/s0aiA4m/iSAizdETDIodXLc3T6zFeBa9Ma9cCaLyMLniJod1B/CGDxn8Z+u82oD
	BvZ/HfGtFPlDy86ZIkgGSVu3yYpxWtIIjfZ7Fa+5hzUI+gy9zRZD6DgRmF93/boIN49NB+DQkAK
	NwOqhc/LG8AXH72N5BhE+0weRyLYGr6U+7sASXheDBoAQRxLW6DrvpC3hSUZi0QQczNn43mZ9Cy
	t4GDnH0nLezv/HpnVL5SbPdprjfSRsYIb3flEHEJrAxctI0DKgZ60GVkSHRaO6lUgg==
X-Google-Smtp-Source: AGHT+IHgXPRqTagRpkgL0FG4S4HtIbFPYAS/Z2w6c/p7V+BOWvlIApjFc+lDgo5NlJTO91KoYAeGGQ==
X-Received: by 2002:a05:6000:430e:b0:39f:efb:c2f6 with SMTP id ffacd0b85a97d-3a1f646600fmr3729519f8f.33.1746804964699;
        Fri, 09 May 2025 08:36:04 -0700 (PDT)
Received: from iku.Home ([2a06:5906:61b:2d00:40e3:34f3:a241:140c])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a1f58ec912sm3550781f8f.23.2025.05.09.08.36.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 May 2025 08:36:03 -0700 (PDT)
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
Subject: [PATCH v2 2/2] arm64: dts: renesas: r9a09g057h44-rzv2h-evk: Enable GBETH
Date: Fri,  9 May 2025 16:35:59 +0100
Message-ID: <20250509153559.326603-3-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250509153559.326603-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20250509153559.326603-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Enable the GBETH nodes on the RZ/V2H Evaluation Kit.

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
---
v1->v2:
- No change.
---
 .../dts/renesas/r9a09g057h44-rzv2h-evk.dts    | 74 +++++++++++++++++++
 1 file changed, 74 insertions(+)

diff --git a/arch/arm64/boot/dts/renesas/r9a09g057h44-rzv2h-evk.dts b/arch/arm64/boot/dts/renesas/r9a09g057h44-rzv2h-evk.dts
index 063eca0ba3e2..6b12bdc3eff9 100644
--- a/arch/arm64/boot/dts/renesas/r9a09g057h44-rzv2h-evk.dts
+++ b/arch/arm64/boot/dts/renesas/r9a09g057h44-rzv2h-evk.dts
@@ -16,6 +16,8 @@ / {
 	compatible = "renesas,rzv2h-evk", "renesas,r9a09g057h44", "renesas,r9a09g057";
 
 	aliases {
+		ethernet0 = &eth0;
+		ethernet1 = &eth1;
 		i2c0 = &i2c0;
 		i2c1 = &i2c1;
 		i2c2 = &i2c2;
@@ -78,6 +80,68 @@ &audio_extal_clk {
 	clock-frequency = <22579200>;
 };
 
+&eth0 {
+	pinctrl-0 = <&eth0_pins>;
+	pinctrl-names = "default";
+	phy-handle = <&phy0>;
+	phy-mode = "rgmii-id";
+	status = "okay";
+
+	mdio {
+		#address-cells = <1>;
+		#size-cells = <0>;
+		compatible = "snps,dwmac-mdio";
+
+		phy0: ethernet-phy@0 {
+			compatible = "ethernet-phy-id0022.1640", "ethernet-phy-ieee802.3-c22";
+			reg = <0>;
+			rxc-skew-psec = <0>;
+			txc-skew-psec = <0>;
+			rxdv-skew-psec = <0>;
+			txdv-skew-psec = <0>;
+			rxd0-skew-psec = <0>;
+			rxd1-skew-psec = <0>;
+			rxd2-skew-psec = <0>;
+			rxd3-skew-psec = <0>;
+			txd0-skew-psec = <0>;
+			txd1-skew-psec = <0>;
+			txd2-skew-psec = <0>;
+			txd3-skew-psec = <0>;
+		};
+	};
+};
+
+&eth1 {
+	pinctrl-0 = <&eth1_pins>;
+	pinctrl-names = "default";
+	phy-handle = <&phy1>;
+	phy-mode = "rgmii-id";
+	status = "okay";
+
+	mdio {
+		#address-cells = <1>;
+		#size-cells = <0>;
+		compatible = "snps,dwmac-mdio";
+
+		phy1: ethernet-phy@1 {
+			compatible = "ethernet-phy-id0022.1640", "ethernet-phy-ieee802.3-c22";
+			reg = <0>;
+			rxc-skew-psec = <0>;
+			txc-skew-psec = <0>;
+			rxdv-skew-psec = <0>;
+			txdv-skew-psec = <0>;
+			rxd0-skew-psec = <0>;
+			rxd1-skew-psec = <0>;
+			rxd2-skew-psec = <0>;
+			rxd3-skew-psec = <0>;
+			txd0-skew-psec = <0>;
+			txd1-skew-psec = <0>;
+			txd2-skew-psec = <0>;
+			txd3-skew-psec = <0>;
+		};
+	};
+};
+
 &gpu {
 	status = "okay";
 	mali-supply = <&reg_0p8v>;
@@ -172,6 +236,16 @@ &ostm7 {
 };
 
 &pinctrl {
+	eth0_pins: eth0 {
+		pins = "ET0_TXC_TXCLK";
+		output-enable;
+	};
+
+	eth1_pins: eth0 {
+		pins = "ET1_TXC_TXCLK";
+		output-enable;
+	};
+
 	i2c0_pins: i2c0 {
 		pinmux = <RZV2H_PORT_PINMUX(3, 0, 1)>, /* I2C0_SDA */
 			 <RZV2H_PORT_PINMUX(3, 1, 1)>; /* I2C0_SCL */
-- 
2.49.0


