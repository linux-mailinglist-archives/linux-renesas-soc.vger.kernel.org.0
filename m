Return-Path: <linux-renesas-soc+bounces-18744-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 68668AE882D
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 25 Jun 2025 17:32:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 51CEB5A4DFE
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 25 Jun 2025 15:31:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AE0E62D1914;
	Wed, 25 Jun 2025 15:31:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BBfuF1Gu"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E5AA12C17B4;
	Wed, 25 Jun 2025 15:31:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750865472; cv=none; b=gOOFriH9Zp7MX9rjxfVQo51pDHlBmv90nP8h2piJsakseVFwn7nIqNLRVWni5FUO2SHyy2N3dV2CECDuAzSVC3fglToQtgdwepUHSqbUReA1NOy2/ZOC7T/oOH6YUcugxxyH7IHNWxliVmhc6iXchzfiECw2PfDsI2Qc+RzPloM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750865472; c=relaxed/simple;
	bh=weH2cAQ/3DVUM7LHB3TvhDCM3oLZQAz+dxGthkVG5QQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=gXM2LBqcxT4vy5QNFYeFOpgZZDU5RCvK/gTXzCcIfUwquYewvqoC2EzK5B9Vs5m7BAQ4kySM0sD4SPh1FLeNoiZ1KFF1NNfZtxKUdswWiv7ExySTcVoNMgZ4oAhDzaIqLe+hrkoau94pfsgGNNWLQAp0cjYgiBPOscIolwzQ6Zk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BBfuF1Gu; arc=none smtp.client-ip=209.85.221.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-3a525eee2e3so1335116f8f.2;
        Wed, 25 Jun 2025 08:31:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750865469; x=1751470269; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LY4TwwfwXfLie+PiPv4cDIvYW/iHGEE3OEwUApO9+IA=;
        b=BBfuF1GuV0dagdM2ntr8NKFFmxBxU3PC/Uard8dJQWeYZH2s9Lwsyrq2AGVH8i/wBq
         xZtZgeewOc0OPSKeMaVE7M0sIhP3uAiLXDuYo0FOoPLLlKfx9DJY2tb8TLst6X9TalSv
         S4emR2aOD3ndoKgtg3gwEdb2yWmLmmP+hKyn1iNUsF3Uf8uype9Hvpx5eCMf0mPSxfOz
         YkJR2mgtWR1JDSRnacsdYhaN0p0uKLO79k/pimuznbFTBvOq1cNX8MMRqUDuZ53p46hl
         1OOKwi/GKQD3w8G50tnrzaDiwMoBjwcOzubG7Cryjj8iHjua9G3mK7A7z3q4GafsvL++
         NwWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750865469; x=1751470269;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=LY4TwwfwXfLie+PiPv4cDIvYW/iHGEE3OEwUApO9+IA=;
        b=aw82dCQ9pxR7ePPAClvR/P8E5qEuAS8C4hCnfyW4p9Iwo6iphbsnjXUP3nNR+1p6Gj
         yQbI9kr0tlkIY73L+zmLPWr5KyfVVxWDo8slXSAY5M7bwFJyKaFNybpOKi/5z6gjR9QU
         Fhq86jqfnD838ux//Y+67OQHuS2X/FLn4kP3pPHFlv/2MhWQbVdxsmTtr2VCG3jcisvM
         w18Z6WaDTANz1YQhyQDhqdDOrT0O+Ikx55l9Ose/81Sr1kWFaQ5e+qM1FKFTxQMpiB7n
         RuPvUa8pwf7oc+Ccmt2ZcICR0R3fx5Xu6ZoKS4EkxVgTkG7Y4vAE869rZj7HOuAB9K9L
         Jlzg==
X-Forwarded-Encrypted: i=1; AJvYcCUKJRn46u9YI345hFVuAFYTIhfaX7cvy4wOoprMd6fDE+YxDdt198N/Tb6QIbQ40N1DFctK9mbWhv+5cJAK@vger.kernel.org, AJvYcCUuaiRTwVb1ss10qhvN4RGtWAu6Lr1IVT5zHsr/+Tiv2dd374IYiV9Q2BVyj96O9C5xToj2U15LhHEs@vger.kernel.org
X-Gm-Message-State: AOJu0YxY3ORgWor3VWo2Y7cIv8/fwy7RAuqY0FbRL79XKVHFUNYSADiE
	Zolz8xHb8j+jXiA1oW6qspAb1j+Z5Z1r66t08M5Fmsh0bX8zE9Yg/Dzn
X-Gm-Gg: ASbGnctDxSJKpiTFZmV70oNvL5PtPdnIUVXMncuQnBEMnKmiOM/e6sDTtjFZzOp4DcA
	ukfC0irGiDj9YowUAoJo3CenVRDXX4Ru0XSf5hAAwgdi+vDKM4KGL0a2OyYUBOCON/jd2GGR6YL
	eYVswByOoG3B9vd9cfw1BP8rU4wCc9gxKFk/Kyv+/9rwG1L6dkl3rtkr0T0a9yes8Rgii6MxSHU
	xZYT4CSjtWovHdaVJVufYvY9kaP6n62GtNxfwwUstVIy6LXRcKSreASCoyidmq0mLe7PBmO0qtu
	hdUXhh/nRn1U1a69jL4diYGzX1RXrhYLoKnjZBKnQeUhwbJt5FXM1ZNC5JI7bPXHzBnK/gv3sZ2
	Cg404aOhk3ZMgFlPPkSXO
X-Google-Smtp-Source: AGHT+IHl9L1Is1Xq7lvuONK1ybEe4EH+Hkbh8aK35UkSMV0ANBBp/Xoqh3029eK/tRyeM61pp2nQUQ==
X-Received: by 2002:a05:6000:2484:b0:3a6:d604:a017 with SMTP id ffacd0b85a97d-3a6ed63d398mr2974345f8f.24.1750865468899;
        Wed, 25 Jun 2025 08:31:08 -0700 (PDT)
Received: from iku.example.org ([2a06:5906:61b:2d00:c47e:d783:f875:2c7c])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a6e80f296bsm4899180f8f.60.2025.06.25.08.31.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Jun 2025 08:31:06 -0700 (PDT)
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
Subject: [PATCH 5/6] arm64: dts: renesas: r9a09g077m44-rzt2h-evk: Add user LEDs
Date: Wed, 25 Jun 2025 16:30:41 +0100
Message-ID: <20250625153042.159690-6-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250625153042.159690-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20250625153042.159690-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Add USER LED0-LED8, which are available on RZ/T2H EVK.

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
---
 .../dts/renesas/r9a09g077m44-rzt2h-evk.dts    | 50 +++++++++++++++++++
 1 file changed, 50 insertions(+)

diff --git a/arch/arm64/boot/dts/renesas/r9a09g077m44-rzt2h-evk.dts b/arch/arm64/boot/dts/renesas/r9a09g077m44-rzt2h-evk.dts
index 486584fefead..f36a289a4d9c 100644
--- a/arch/arm64/boot/dts/renesas/r9a09g077m44-rzt2h-evk.dts
+++ b/arch/arm64/boot/dts/renesas/r9a09g077m44-rzt2h-evk.dts
@@ -7,10 +7,60 @@
 
 /dts-v1/;
 
+#include <dt-bindings/gpio/gpio.h>
+
 #include "r9a09g077m44.dtsi"
 #include "rzt2h-n2h-evk-common.dtsi"
 
 / {
 	model = "Renesas RZ/T2H EVK Board based on r9a09g077m44";
 	compatible = "renesas,rzt2h-evk", "renesas,r9a09g077m44", "renesas,r9a09g077";
+
+	leds {
+		compatible = "gpio-leds";
+
+		led0 {
+			/* SW8-9: ON, SW8-10: OFF */
+			gpios = <&pinctrl RZT2H_GPIO(23, 1) GPIO_ACTIVE_LOW>;
+		};
+
+		led1 {
+			/* SW5-1: OFF, SW5-2: ON */
+			gpios = <&pinctrl RZT2H_GPIO(32, 2) GPIO_ACTIVE_LOW>;
+		};
+
+		led2 {
+			gpios = <&pinctrl RZT2H_GPIO(6, 7) GPIO_ACTIVE_LOW>;
+		};
+
+		led3 {
+			/* SW2-3: OFF */
+			gpios = <&pinctrl RZT2H_GPIO(8, 5) GPIO_ACTIVE_LOW>;
+		};
+
+		led4 {
+			/* SW8-3: ON, SW8-4: OFF */
+			gpios = <&pinctrl RZT2H_GPIO(18, 0) GPIO_ACTIVE_LOW>;
+		};
+
+		led5 {
+			/* SW8-1: ON, SW8-2: OFF */
+			gpios = <&pinctrl RZT2H_GPIO(18, 1) GPIO_ACTIVE_LOW>;
+		};
+
+		led6 {
+			/* SW5-9: OFF, SW5-10: ON */
+			gpios = <&pinctrl RZT2H_GPIO(22, 7) GPIO_ACTIVE_LOW>;
+		};
+
+		led7 {
+			/* SW5-7: OFF, SW5-8: ON */
+			gpios = <&pinctrl RZT2H_GPIO(23, 0) GPIO_ACTIVE_LOW>;
+		};
+
+		led8 {
+			/* SW7-5: OFF, SW7-6: ON */
+			gpios = <&pinctrl RZT2H_GPIO(23, 5) GPIO_ACTIVE_LOW>;
+		};
+	};
 };
-- 
2.49.0


