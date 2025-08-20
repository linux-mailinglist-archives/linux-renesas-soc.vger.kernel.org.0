Return-Path: <linux-renesas-soc+bounces-20788-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E97E8B2E61B
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 20 Aug 2025 22:08:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id C55CC5E2A52
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 20 Aug 2025 20:08:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CC0CC2C21D6;
	Wed, 20 Aug 2025 20:07:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KyGQtsIg"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F032429A303;
	Wed, 20 Aug 2025 20:07:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755720432; cv=none; b=ggRF7L677UWPx5ml2ZVqoPggXBdOkIRbwtBK/DM9YEdNhD/DjxURmqlh39HfcLEVsI1jfb4Hwv7BH1+XoUd2FdTgm5xw8TQA9hZ3aMAZA8lGITUai7haoC+uAgpHtr1ZB++wJL9RGdqpT4y8gInWpUtuMTQxIqLwvyE1JLAVfb4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755720432; c=relaxed/simple;
	bh=fleLwPt8jW7w2bC+jDeB/CBOQX5jOZRmsbCMYfBPh2A=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=PQXvDqSVk7Qz+ou3HZDrEeZnMHC1uMAeqzhLBiYCKA2WKcihRJJqkmu/zwi3axCJDW8lT9jCpk1jAeln+dcWG2FUUpeMGrjNLohYZAlj7wabRsRm/SUr7I7PXFDvwEvQF5gz8YACVhbr2oRjVSDaiK9QgoO9Qd+pvKM7XrX7gvQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KyGQtsIg; arc=none smtp.client-ip=209.85.221.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-3c380aa1ad0so191865f8f.3;
        Wed, 20 Aug 2025 13:07:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1755720429; x=1756325229; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Hp1LDU8NmpinNisVo+36YMS3T8yf0OtN7fZ/9hzEG58=;
        b=KyGQtsIg2ZKfFgLFLQmAeDXih7DHzCphrXZloYIUxzu+uYLhPtTHVDs49HZEmxx97U
         uYDADJIjHF4Or4L43eyf6x7dklsKirFC2I6hToeY1NIJG32L+PdUKogp2pUjowL6a21V
         J+aUezGf0eb3lkxc5KzvshjImEd5G/T6/BXVjeKD5C2vahC11DdVQrA6JqaFQG2bMtOM
         qM6yOm0yXa9ToKTkuCiqAqZ4KcPbopy7jpiLU8zS4kj6Nanynbeyv2gRSmdPyYPhS7cd
         eh8TAn5TVZp3h4ajhNBa+15AwftB1YPjmh9hY3zNS5Zgwxsn3AYCCGQNbUYL6BH/fdIR
         u1nQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755720429; x=1756325229;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Hp1LDU8NmpinNisVo+36YMS3T8yf0OtN7fZ/9hzEG58=;
        b=wiIfc6xFKT96MQtzIfndJ2/3R8HtJZYYe5DaVJtXhNWyq/6UkRucQixAVB4pBRDoSB
         N++32gY+2aYk6uQ7XekxRwFZ3i1SJnm8nZ4RW0hrG0xI/vyIFeI3lYvfZSN0MT6Se7vj
         DDJpL3kTq6Vo+3f53E5ebPyEcRSaRp6h4DjJ3kG4//7D8LrXneLM/FZmNnvY7QtjlTim
         M9Wlb0KKPhcpWkLBM8VHAzXN2L4gEImZMfD+ySwXdxeV0V6i5Ztnsg7ydhfHbZqMOQm4
         y9G8wS3QDoJRT51LNaCzXvVJLQT9kxYGlAewktI6yjyPrfijz84qfZenE/8jZpVrNoJ+
         CZCw==
X-Forwarded-Encrypted: i=1; AJvYcCWIYCnLxnLp+iI2atsIlgA7bno/Oa/leT5s6zyCPVZfR7YlxU/SSyfgRO7/ExYGDiU7AT22LyczLbQXoR6x@vger.kernel.org, AJvYcCXWfk5vE0HEFF4pIRh7MeED5OdGuxN5EPryj1JR5HGEViUIfml/BHlz2RtFydmBdOUiWG4/DsFsRZ+u@vger.kernel.org
X-Gm-Message-State: AOJu0YzUgWKi17TAzS6IeUS+LjrToQl/44eYWE/dwGsp1q2olPmWgWEa
	MLdUzJEqVNmG9LERcD/pcfM2ea3jF2P/+infXZyfdAOyAOkC9qZRnuHp
X-Gm-Gg: ASbGnct171Y8yPVPlYuHgEhd5ChkmwN52YElvs0GVb4LooMAvhmGjAl1Tq1L2r5XjGO
	NsUzIsdU/MifAsxCENVkmJhAhPMWTYaGlxhHvi7Va5A9ksWp4Z+KvLMaj1j9vlXaR6OL8xCMzVL
	GpMWiX7vmIn9hO8ldhOYrMqUQicoMV/nZqIoM70ZxUCQszVtClrOCJ+EsPKou++sPsgHaWwRXaT
	lso/rKlOwn4eJBsC2FHG2eeH7NpOsZ/dUYczRZUwWI07geZQ3YKyH4PpwrwZ0Ap+ZZPoCXLb3U7
	C990sCLh3VQCiUeeLAtJWVvUeC8mapnOmvxLV90AFbOP2jF1GQQ3Ci19nRWEXfPZb4mZRN+UnEV
	Y5ExTQGYatiMV0DLSM7YHc6sm2pL5UEpyt5ztFCKRQrlB9A==
X-Google-Smtp-Source: AGHT+IFClHqLhpn6AnryIIiUvQjll02QXc5VYk8upU5aDZaADHN7uGbpzlm+0T2AfBASy6taN4WiRQ==
X-Received: by 2002:a5d:588a:0:b0:3c0:7e02:67b6 with SMTP id ffacd0b85a97d-3c496cb079cmr72596f8f.62.1755720429257;
        Wed, 20 Aug 2025 13:07:09 -0700 (PDT)
Received: from iku.Home ([2a06:5906:61b:2d00:9b1:f84b:89f6:b00e])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3c077789c92sm8810302f8f.52.2025.08.20.13.07.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 Aug 2025 13:07:08 -0700 (PDT)
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
Subject: [PATCH v2 5/9] arm64: dts: renesas: r9a09g087m44-rzt2h-evk: Enable I2C0 and I2C1 support
Date: Wed, 20 Aug 2025 21:06:55 +0100
Message-ID: <20250820200659.2048755-6-prabhakar.mahadev-lad.rj@bp.renesas.com>
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

Enable I2C0 and I2C1 on the RZ/N2H evaluation board.

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
---
v1->v2:
- Replaced RZN2H_PORT_PINMUX with RZT2H_PORT_PINMUX
- Corrected switch settings for I2C1
---
 .../dts/renesas/r9a09g087m44-rzn2h-evk.dts    | 56 +++++++++++++++++++
 1 file changed, 56 insertions(+)

diff --git a/arch/arm64/boot/dts/renesas/r9a09g087m44-rzn2h-evk.dts b/arch/arm64/boot/dts/renesas/r9a09g087m44-rzn2h-evk.dts
index fb2651c4c338..a068661fc442 100644
--- a/arch/arm64/boot/dts/renesas/r9a09g087m44-rzn2h-evk.dts
+++ b/arch/arm64/boot/dts/renesas/r9a09g087m44-rzn2h-evk.dts
@@ -10,6 +10,14 @@
 #include "r9a09g087m44.dtsi"
 #include "rzt2h-n2h-evk-common.dtsi"
 
+/*
+ * I2C0 and LED8/9 share the same pins use the below
+ * macro to choose (and set approopriate DIP switches).
+ */
+#define I2C0	1
+#define LED8	(!I2C0)
+#define LED9	(!I2C0)
+
 / {
 	model = "Renesas RZ/N2H EVK Board based on r9a09g087m44";
 	compatible = "renesas,rzn2h-evk", "renesas,r9a09g087m44", "renesas,r9a09g087";
@@ -60,6 +68,7 @@ led-7 {
 			function-enumerator = <8>;
 		};
 
+#if LED8
 		led-8 {
 			/*
 			 * USER_LED0
@@ -70,7 +79,9 @@ led-8 {
 			function = LED_FUNCTION_DEBUG;
 			function-enumerator = <0>;
 		};
+#endif
 
+#if LED9
 		led-9 {
 			/*
 			 * USER_LED1
@@ -81,6 +92,7 @@ led-9 {
 			function = LED_FUNCTION_DEBUG;
 			function-enumerator = <1>;
 		};
+#endif
 
 		led-10 {
 			/*
@@ -105,3 +117,47 @@ led-11 {
 		};
 	};
 };
+
+#if I2C0
+&i2c0 {
+	pinctrl-0 = <&i2c0_pins>;
+	pinctrl-names = "default";
+	clock-frequency = <400000>;
+	status = "okay";
+};
+#endif
+
+&i2c1 {
+	pinctrl-0 = <&i2c1_pins>;
+	pinctrl-names = "default";
+	clock-frequency = <400000>;
+	status = "okay";
+};
+
+&pinctrl {
+	/*
+	 * I2C0 Pin Configuration:
+	 * ------------------------
+	 * Signal | Pin     | DSW15
+	 * -------|---------|--------------
+	 * SCL    | P14_6   | 8: OFF, 9: ON, 10: OFF
+	 * SDA    | P14_7   | 5: ON, 6: OFF
+	 */
+	i2c0_pins: i2c0-pins {
+		pinmux = <RZT2H_PORT_PINMUX(14, 6, 0x17)>,
+			 <RZT2H_PORT_PINMUX(14, 7, 0x17)>;
+	};
+
+	/*
+	 * I2C1 Pin Configuration:
+	 * ------------------------
+	 * Signal | Pin     | DSW7
+	 * -------|---------|--------------
+	 * SCL    | P03_3   | 1: ON, 2: OFF
+	 * SDA    | P03_4   | 3: ON, 4: OFF
+	 */
+	i2c1_pins: i2c1-pins {
+		pinmux = <RZT2H_PORT_PINMUX(3, 3, 0x17)>,
+			 <RZT2H_PORT_PINMUX(3, 4, 0x17)>;
+	};
+};
-- 
2.51.0


