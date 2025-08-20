Return-Path: <linux-renesas-soc+bounces-20786-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 25D03B2E615
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 20 Aug 2025 22:07:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 431A55E3F04
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 20 Aug 2025 20:07:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9375F296BA4;
	Wed, 20 Aug 2025 20:07:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Nk9KHKFT"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B08E028467C;
	Wed, 20 Aug 2025 20:07:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755720430; cv=none; b=arvZ45Wnd+dQ77aPKy4MT7y95al6qoIiU97KAGG5/b+jozC4sshvXAUyqZmaDGSwBndy3It4PeyHhj3nudGXMXWk2KF1ddkQXezjDakWDobMkOpFKLFFW7RXawuCF987nKS8f4w/T/A/PLY1yzhlvSJVkf2qFMKke3Nstfct2AM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755720430; c=relaxed/simple;
	bh=BuOliBv6yFVPecW5OjypG+5UxFYOh25IuA0zSGzksqk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=PVRmfxohpbi2j3KKyDR5N3LsNr2ITNBo1gT/oNQENKetueAPmeBoR8rwpo9hxQXAMTUtW0ZKQ8dbtjPt6UkdEI9QD0wIMtkxPqEEL57/1XKuXi7ehcPlRCgK7pWE8lmubuji2HJeZqrO0kUdiJNyEm7FUrWettbLIfvQD2KHDPI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Nk9KHKFT; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-45a1b004a31so1785095e9.0;
        Wed, 20 Aug 2025 13:07:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1755720427; x=1756325227; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CfhuKrNJnFYJqjai8qE1RlQIGfig8XVFwxYyfvOI/gk=;
        b=Nk9KHKFTKJ/tXFJVG5k9qIqn2GdqlIcWErG0EKCXnEKkD6QcqNP20TPjFgayHGHRhu
         fQn88k/Qt2K1ge0HZEJIxoXJJAG9DSMTZVRl0H7a+qKE0e3g28zo6Qt+KHr2b7fm5ctQ
         T7Q6BaONt4eXtQEA4OYujcw+fZzJ15auyxwYysXpUqjcTNoWSeAst5WX9KQEfjln6uJz
         3pn9+FwkyYHKzvU7L/GETQYFgVePUtrZwA2qJ1weuJfi7Y/snGcoOFlCi/vHaSGmi71y
         HyN8tE7eTtsJLhtptbrylge0z5/H5jZwwBdc2dPc+P3VmoyUtvNRXBr3Wm8D5Ct4CUKq
         R2iQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755720427; x=1756325227;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=CfhuKrNJnFYJqjai8qE1RlQIGfig8XVFwxYyfvOI/gk=;
        b=UEpUxOhEopFMi+Y14AIq3vbKBEIBucXAxLFqKhlWs/xP6msM+xz9HQs2TLvjsXagRN
         UQbfAjIPNE8GtB8Tkn8Ml3l7RwDZByp3W9n25IW0h+q1bBdloJH8uaJ8LtH0QUg0T61J
         +Y4x3z5BbTXy9g8wsnOZ4VU9/KK1lGa4WMD9tkeFNCoVeoWTMnAvjMWf08NKP6PmkF4G
         qWWtA3lxSnD2XpFqkinb2y8v7nLbEoUZxAXkCEKE/EMz39+qAbqcsRJUzph8/pasr0mS
         lX39FhSbevdSEBWEC0g8dXrbKMtT83FFvhhP3cBvDVt3/Cg9Knv0kZg5jhIUpXxJkrRi
         A9UA==
X-Forwarded-Encrypted: i=1; AJvYcCUc3dldK3NOw+FZOpN1q6z/T3SCNgZqDdO0sRU8QcSegU1631vhzvO7M9eiXoUKBk1fdaypon3m+ACn@vger.kernel.org, AJvYcCXUkdElASfVEr2K5eCFwQiN08FhM6lZAt9PPP3jkFNn2i447qZzUBX6Vxmo/Hw1NzVdCGOXbw5ePFZsRcVl@vger.kernel.org
X-Gm-Message-State: AOJu0YwZemHYk5LDc87agEvLHgVR0Kt8rTcRygy2tO3K6PzADFxcZm11
	bC3LhWmw2d/i1CzK9t+YomY9/zc+xzL0B9A0zYD+4XqG2FHzLDT+QML8
X-Gm-Gg: ASbGncsXh2SQ3J/1vnonDNRyHSkQEqb2myQCAI5KGXl2oxoejvZ1UndRqQhk8xDMU9t
	/qGYVPWRZk2iFwniBPPIOJH86d5ZXnvwjVkwVnlor86pnitN0sOGaD70sESNRTUpm3pc9hEK0x7
	NR9OkaF+jd26EFXasg7f28vjMLr4mIGHRAOUGli4dNe9i3qvst/vk737rZ/EMrleSFTOSD7mW59
	1WxdYr17qvqaAs2h4HzUysVFRBiInao/7ylBXoEhKbISZ0iR9oP32kPD1HcU/Arm4G+jKJbu4BA
	jVCGs7y8VqAT7EHj4soPUljINFyyI30fpndmAu7L4FAzmJGhdRcffS3RihQMdGjcOFLG6z83A7h
	/h94gzJsg75cFLUfPC368iUM/n+HP7gK01Jo7kOj8deYbrjtJVC9aZF7/
X-Google-Smtp-Source: AGHT+IHbA1GTYdiaho9APxkcXtHHwPvoAeo4bc2klK+O92iYQS0ZhQ3/RxAlT1Ti0VGBfEDOpSQ+tw==
X-Received: by 2002:a05:600c:198c:b0:459:dfde:3359 with SMTP id 5b1f17b1804b1-45b47a018d9mr26906235e9.32.1755720426989;
        Wed, 20 Aug 2025 13:07:06 -0700 (PDT)
Received: from iku.Home ([2a06:5906:61b:2d00:9b1:f84b:89f6:b00e])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3c077789c92sm8810302f8f.52.2025.08.20.13.07.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 Aug 2025 13:07:06 -0700 (PDT)
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
Subject: [PATCH v2 3/9] arm64: dts: renesas: r9a09g087m44-rzn2h-evk: Add user LEDs
Date: Wed, 20 Aug 2025 21:06:53 +0100
Message-ID: <20250820200659.2048755-4-prabhakar.mahadev-lad.rj@bp.renesas.com>
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

Add USER LED3-LED11, which are available on RZ/N2H EVK.

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
---
v1->v2:
- Updated commit message
- Changed led node names
- Added color/function/function-enumerator properties
- Replaced GPIO_ACTIVE_LOW with GPIO_ACTIVE_HIGH
- Updated switch settings for led-9
---
 .../dts/renesas/r9a09g087m44-rzn2h-evk.dts    | 91 +++++++++++++++++++
 1 file changed, 91 insertions(+)

diff --git a/arch/arm64/boot/dts/renesas/r9a09g087m44-rzn2h-evk.dts b/arch/arm64/boot/dts/renesas/r9a09g087m44-rzn2h-evk.dts
index d6ba14a26f03..fb2651c4c338 100644
--- a/arch/arm64/boot/dts/renesas/r9a09g087m44-rzn2h-evk.dts
+++ b/arch/arm64/boot/dts/renesas/r9a09g087m44-rzn2h-evk.dts
@@ -13,4 +13,95 @@
 / {
 	model = "Renesas RZ/N2H EVK Board based on r9a09g087m44";
 	compatible = "renesas,rzn2h-evk", "renesas,r9a09g087m44", "renesas,r9a09g087";
+
+	leds {
+		compatible = "gpio-leds";
+
+		led-3 {
+			/* DSW18-7: ON, DSW18-8: OFF */
+			gpios = <&pinctrl RZT2H_GPIO(31, 6) GPIO_ACTIVE_HIGH>;
+			color = <LED_COLOR_ID_GREEN>;
+			function = LED_FUNCTION_DEBUG;
+			function-enumerator = <4>;
+		};
+
+		led-4 {
+			/* DSW18-9: ON, DSW18-10: OFF */
+			gpios = <&pinctrl RZT2H_GPIO(18, 1) GPIO_ACTIVE_HIGH>;
+			color = <LED_COLOR_ID_RED>;
+			function = LED_FUNCTION_DEBUG;
+			function-enumerator = <5>;
+		};
+
+		led-5 {
+			/* DSW18-1: ON, DSW18-2: OFF */
+			gpios = <&pinctrl RZT2H_GPIO(22, 7) GPIO_ACTIVE_HIGH>;
+			color = <LED_COLOR_ID_GREEN>;
+			function = LED_FUNCTION_DEBUG;
+			function-enumerator = <6>;
+		};
+
+		led-6 {
+			/* DSW18-3: ON, DSW18-4: OFF */
+			gpios = <&pinctrl RZT2H_GPIO(23, 0) GPIO_ACTIVE_HIGH>;
+			color = <LED_COLOR_ID_GREEN>;
+			function = LED_FUNCTION_DEBUG;
+			function-enumerator = <7>;
+		};
+
+		led-7 {
+			/*
+			 * DSW18-5: ON, DSW18-6: OFF
+			 * DSW19-3: OFF, DSW19-4: ON
+			 */
+			gpios = <&pinctrl RZT2H_GPIO(14, 3) GPIO_ACTIVE_HIGH>;
+			color = <LED_COLOR_ID_GREEN>;
+			function = LED_FUNCTION_DEBUG;
+			function-enumerator = <8>;
+		};
+
+		led-8 {
+			/*
+			 * USER_LED0
+			 * DSW15-8: OFF, DSW15-9: OFF, DSW15-10: ON
+			 */
+			gpios = <&pinctrl RZT2H_GPIO(14, 6) GPIO_ACTIVE_HIGH>;
+			color = <LED_COLOR_ID_GREEN>;
+			function = LED_FUNCTION_DEBUG;
+			function-enumerator = <0>;
+		};
+
+		led-9 {
+			/*
+			 * USER_LED1
+			 * DSW15-5: OFF, DSW15-6: ON
+			 */
+			gpios = <&pinctrl RZT2H_GPIO(14, 7) GPIO_ACTIVE_HIGH>;
+			color = <LED_COLOR_ID_GREEN>;
+			function = LED_FUNCTION_DEBUG;
+			function-enumerator = <1>;
+		};
+
+		led-10 {
+			/*
+			 * USER_LED2
+			 * DSW17-3: OFF, DSW17-4: ON
+			 */
+			gpios = <&pinctrl RZT2H_GPIO(2, 7) GPIO_ACTIVE_HIGH>;
+			color = <LED_COLOR_ID_YELLOW>;
+			function = LED_FUNCTION_DEBUG;
+			function-enumerator = <2>;
+		};
+
+		led-11 {
+			/*
+			 * USER_LED3
+			 * DSW17-1: OFF, DSW17-2: ON
+			 */
+			gpios = <&pinctrl RZT2H_GPIO(3, 0) GPIO_ACTIVE_HIGH>;
+			color = <LED_COLOR_ID_RED>;
+			function = LED_FUNCTION_DEBUG;
+			function-enumerator = <3>;
+		};
+	};
 };
-- 
2.51.0


