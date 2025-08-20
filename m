Return-Path: <linux-renesas-soc+bounces-20787-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E557B2E618
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 20 Aug 2025 22:08:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 27DC35E4150
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 20 Aug 2025 20:08:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AE3EA2BD031;
	Wed, 20 Aug 2025 20:07:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PUlbCCKR"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F09332877E0;
	Wed, 20 Aug 2025 20:07:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755720431; cv=none; b=WZL8oPlu0lm9rpHgkpZt47V4wnhwWCOyDkoWshX4xmAbUbAKku67vzFiGaIfVClZ0vCxENAPoekZ73J6miOCm93pabwHAIp9td358GXVpVKU8UkReDjnj/CYE6m7v8xY5RsyQReZBrkZArUEO77v8571k0LQM1SOi6EIV+YtPXc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755720431; c=relaxed/simple;
	bh=sozlqLWeT1+jNjM64S/OHSTC4VqSsbyyBC3w0sXVNgw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=T83ZYWzuVniw9+JeSDDT7cZFE6sQop+0vJ3Iui//cokF6I9usSyKKJ/0Ei60msVVQUJKmW1nBH+nw4iOaSpil/fZPfCqhywDhzj2f8IK4VcrSJiPJQfMpWW+RscUKKS8T0IdmIqJs66/8RCFVpfJRrKn9GMSuLduYwpPF0z0HCc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=PUlbCCKR; arc=none smtp.client-ip=209.85.221.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-3b9e41101d4so193898f8f.2;
        Wed, 20 Aug 2025 13:07:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1755720428; x=1756325228; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7/wwmcHkLgp79eUzET5WpOvX0IIuUOcob2yhhnZmcZ4=;
        b=PUlbCCKRqtdUcoIaxqq01qu85tF2gaE80QWlTPjM5tsff21x9pMDaiN7AC7WDpVuHg
         NnvdDbCIZcJ7Umz+4KaANgRrrh84hv7f5LiPvYWYFTARnegTsbf+xMobMycq/euC9jJM
         p0iP7w6qlsQULYEBjkLfO3Wto0aTw0nGh12yFJbjnC/qVAOvtBkDU8Hc6uiWL+WshFsM
         Lep8QRHimRTCFkRVi8TqugUqlDd1drfM/VCLoVsLpUBOaJWdw2+z7vKYDd0MnVzMJ4NP
         UzHg5DzVnwjld+Ov8a9G+36iQsstmcRdzHiunE1xVwLL/TpLKzZxWtldGGHkc5jhyKA2
         s3Jw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755720428; x=1756325228;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7/wwmcHkLgp79eUzET5WpOvX0IIuUOcob2yhhnZmcZ4=;
        b=ciDCzYpkzuzIY4M4sVWgzfxC0ARAGOsK4cO+FyB+e9pnZge/Cfxr8MfjMddny/VwtE
         ESX000j7YHxQmvBKLjOBgYXbyFPDOk1/sgC2FNpw5YUQhzWiVhnnSUcJx0bbfxQAYPTN
         WSuNWWo+7L+c32kp2+TgPvkwFVq3iQNlr9FFCdVq28yUg2hSpkEjuqh0TJkQ/QG0B5sU
         7bLuB6ndQnqIs0S5iTkcReQie76PY9sTALIo9vQlhnGSIy7nw8lW54QgXp06w1XoNZ8H
         /71osofmXE0H0rhfYw09LmdDbMiHW0v39La7ZdslcVck+vtW8ny8ySdsSmKr15bGgLrh
         q4OQ==
X-Forwarded-Encrypted: i=1; AJvYcCV+4WYnU4iDJJJqFk4ObhomZlAkPp8rgGX2jY9YUdjqamKBAz/daIfOSZO19P/Pjb9deR9EIs7ACnesq2sd@vger.kernel.org, AJvYcCWF1NeqbtkUPC9TlNKpJOKgMqPFwMeYB5A6VIZ83Eu5yXqYEohdfaq9/K+iUnofCoPs2Lq9ncQYCNQe@vger.kernel.org
X-Gm-Message-State: AOJu0YxKVfc9JHnxNt7b2/UXbD98V/7k8+uwdAQsYnSJpPIKOBYORdO3
	IQJllr58fO/+vPlDuro5sJu6aFi1ZfTBgu8xvy7NgIwAKazkdlutIEIz
X-Gm-Gg: ASbGncukfrwmc5uoT3Qj3J/v5dMg6NkkJ9wo2KD/HjHGrxBgQQxGoLOGpzJ6jx3uF3X
	WapPhrLNgffcENldT9u8f2jcCCjzK/RUrt9Q9TPApXU6++gDKHmmzZW9a1sPYjIJGEq2fJflBMz
	V/pwdHn416x1RHMve4ymmOum8rKWHD+Y8jKoK4f2Dv3HxnZDIg0n+D41cJl/wFGNOlF2DLtlAaY
	c8nLypI8QNdOAh1D90+K1Ks5h7PP49bNzQljDmBE519kTTacA+a6eyYWtisgYd8iBA/Fc8izj6v
	//OmLpYKBH2uPA4X9euWyB9TezBj23UJEdOsuyIknblKKfg1w/Y7+G8Fc/AK6CX3tNL/n3W0V6K
	uttHdfpFItgngfksdU9Jklj32Ol+KRWO6QfgiX1dNjFBu8A==
X-Google-Smtp-Source: AGHT+IEukn1Pt3K5XsSTtJQR9vtf9jSPRiXCXDwO86ek2Xr5EZ6XGY7B0WuudL7jzuoMphbC6l6FZA==
X-Received: by 2002:a5d:64c4:0:b0:3c3:de64:927c with SMTP id ffacd0b85a97d-3c496da8bb2mr66326f8f.38.1755720428099;
        Wed, 20 Aug 2025 13:07:08 -0700 (PDT)
Received: from iku.Home ([2a06:5906:61b:2d00:9b1:f84b:89f6:b00e])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3c077789c92sm8810302f8f.52.2025.08.20.13.07.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 Aug 2025 13:07:07 -0700 (PDT)
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
Subject: [PATCH v2 4/9] arm64: dts: renesas: rzt2h-evk-common: Add pinctrl for SCI0 node
Date: Wed, 20 Aug 2025 21:06:54 +0100
Message-ID: <20250820200659.2048755-5-prabhakar.mahadev-lad.rj@bp.renesas.com>
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

Add pinctrl for SCI0 node.

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
v1->v2:
- Dropped including <dt-bindings/pinctrl/renesas,r9a09g077-pinctrl.h>
- Added Reviewed-by tag from Geert
---
 .../boot/dts/renesas/rzt2h-n2h-evk-common.dtsi  | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)

diff --git a/arch/arm64/boot/dts/renesas/rzt2h-n2h-evk-common.dtsi b/arch/arm64/boot/dts/renesas/rzt2h-n2h-evk-common.dtsi
index 28330ff63b2b..06300f806685 100644
--- a/arch/arm64/boot/dts/renesas/rzt2h-n2h-evk-common.dtsi
+++ b/arch/arm64/boot/dts/renesas/rzt2h-n2h-evk-common.dtsi
@@ -25,6 +25,23 @@ &extal_clk {
 	clock-frequency = <25000000>;
 };
 
+&pinctrl {
+	/*
+	 * SCI0 Pin Configuration:
+	 * ------------------------
+	 * Signal     | Pin     | RZ/T2H (SW4) | RZ/N2H (DSW9)
+	 * -----------|---------|--------------|---------------
+	 * SCI0_RXD   | P27_4   | 5: ON, 6: OFF| 1: ON, 2: OFF
+	 * SCI0_TXD   | P27_5   | 7: ON, 8: OFF| 3: ON, 4: OFF
+	 */
+	sci0_pins: sci0-pins {
+		pinmux = <RZT2H_PORT_PINMUX(27, 4, 0x14)>,
+			 <RZT2H_PORT_PINMUX(27, 5, 0x14)>;
+	};
+};
+
 &sci0 {
+	pinctrl-0 = <&sci0_pins>;
+	pinctrl-names = "default";
 	status = "okay";
 };
-- 
2.51.0


