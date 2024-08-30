Return-Path: <linux-renesas-soc+bounces-8555-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 225C5966255
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 30 Aug 2024 15:04:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 5579C1C23513
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 30 Aug 2024 13:04:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 548321B2526;
	Fri, 30 Aug 2024 13:02:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="Cr829d5Z"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-lf1-f51.google.com (mail-lf1-f51.google.com [209.85.167.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B4861A7ADA
	for <linux-renesas-soc@vger.kernel.org>; Fri, 30 Aug 2024 13:02:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725022971; cv=none; b=i/EXttbBzWgrAGqO2QoNzq8fabICQLPKQMIuyt0lhnbmZDuKW5cfrblHowrs1f52S1lU/dRLPWib3aMf3WNKHYMAdQB5OcRTjiAqNbI/X3Ue766deGKOAsyGJceXorn7yX/WFSc2QIu+UgVQBubd/24CaAbAEhSe5QfaWB00zhw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725022971; c=relaxed/simple;
	bh=Kn8JY+f5fHXbVdAysJnh2gUAir0at5VP87GfCZJ8SYE=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=K8ZmK4pNC3QCn7vMV8N01saSls4fBiljpmd72r+KF0/zpGVLytijW+FvnFd7Kif7LhTAoe6mpsZdeoLA+jPo4s0V4m9U7U1p3hIg3WZ+0PKkIMP77dRRzcC/37qmOcX9N6+1Pe0UodJwBWKk2GGOAYW/1DRwuSS1Tr/lkszPF64=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=Cr829d5Z; arc=none smtp.client-ip=209.85.167.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Received: by mail-lf1-f51.google.com with SMTP id 2adb3069b0e04-533488ffaebso2166473e87.0
        for <linux-renesas-soc@vger.kernel.org>; Fri, 30 Aug 2024 06:02:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1725022967; x=1725627767; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ukqX5sC9LJpcoIMKohkjjIWRhtJZ817S3qSAcOa4kZM=;
        b=Cr829d5Zt41qpIs9ViBHVJeEeQFYIdWlS9cKMccjC6960HVWXZ1YpyXYmf3gjnhKoN
         n/BxzTPyaXTLy4HQsZ1R6jUUnutMsGbN6GQMQApm+h5hmz0ra4nANN6akw/2OwQJKhtI
         CHgsMET93HrYX5+pX7yggpmC12uECH/RcIurf0u2NFv1pChNz5GX6eynhslWC+rklUee
         IgYtFaBOldVIrkDT369zYdeq8hq0C3wQc1doN4mY5WdDkHij441V0JWHD1hn3jL7TpIJ
         4efGq6cA6srmfYbwtvRxOwjhQECe6p12oaVrH7ZRzbrEx6oq8dKI6OWDIN2tV6wQt+BQ
         ehMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725022967; x=1725627767;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ukqX5sC9LJpcoIMKohkjjIWRhtJZ817S3qSAcOa4kZM=;
        b=LQMkicfaumNF0bdKyj6sYO2gqkT6qe27P/8YzybpdRLpAePgl4UcjNgTMsh+oO429b
         PxE0qxgDeBI5MqVToUV5TVIJg3YfE3gJQT45a/WLmPsGLo02DZoI/l+yJR1J6JjUalkb
         EhtRbDIePeQvojK8rS+8eTRhqa5rz9briX8NKvnKOXdx6gdvLep56gmXQ/pXcpY6cAv6
         R1dL5MGJQUQbiVofVi9C+gybP4wlHV/DA+QUxuPWHle8sPD0X8h6K7o21hltdL+7z94a
         MoZa1kqQoeZJv+ky033GJUacq32pANVbzJ8+sWwxxIMybNBTQkey0pWhublGM2rpsrJU
         gwEA==
X-Forwarded-Encrypted: i=1; AJvYcCUVW/QAtv65ZCcWMd+diOJlSdD2zJDTgpUa7NN3Oglbwzpdj/6vimkMZ+C4EG3cG3ODs/vcHH6SDsQZl8jUNLSE2A==@vger.kernel.org
X-Gm-Message-State: AOJu0YwUKZkdr8W+Q/3O/30j0QlnNpP4z69U9gCVT+puO/DT8Ty+LGO/
	8FUYD6U10Uqu2LSap9G5CIIoOFLsAf7+hPFxO92dTkWX2nnIC+K75dmEWSi0JOw=
X-Google-Smtp-Source: AGHT+IF9cc2jwjLzI4jgE1O9TLs1SvEtqqWHN58dUrodIH74E0JWxf1LOzmgmFTE6AuLu3nFrEl8sQ==
X-Received: by 2002:a05:6512:15a0:b0:530:ac0a:15e8 with SMTP id 2adb3069b0e04-53546af3fb5mr1440203e87.11.1725022965066;
        Fri, 30 Aug 2024 06:02:45 -0700 (PDT)
Received: from claudiu-X670E-Pro-RS.. ([82.78.167.144])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-42ba642594dsm80361785e9.47.2024.08.30.06.02.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Aug 2024 06:02:44 -0700 (PDT)
From: Claudiu <claudiu.beznea@tuxon.dev>
X-Google-Original-From: Claudiu <claudiu.beznea.uj@bp.renesas.com>
To: geert+renesas@glider.be,
	mturquette@baylibre.com,
	sboyd@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	alexandre.belloni@bootlin.com,
	magnus.damm@gmail.com,
	p.zabel@pengutronix.de
Cc: claudiu.beznea@tuxon.dev,
	linux-renesas-soc@vger.kernel.org,
	linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-rtc@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
Subject: [PATCH v3 07/12] arm64: dts: renesas: r9a08g045: Add VBATTB node
Date: Fri, 30 Aug 2024 16:02:13 +0300
Message-Id: <20240830130218.3377060-8-claudiu.beznea.uj@bp.renesas.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240830130218.3377060-1-claudiu.beznea.uj@bp.renesas.com>
References: <20240830130218.3377060-1-claudiu.beznea.uj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>

Add the DT node for the VBATTB IP along with DT bindings for the clock
it provides.

Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
---

Changes in v3:
- dropped the child nodes of vbattb; along with this dropped ranges,
  interrupt-names, #address-cells, #size-cells
- added vbattb_xtal as input clock for vbattb

Changes in v2:
- update compatibles
- updated clocks and clock-names for clock-controller node
- removed the power domain from the clock-controller as this is
  controlled by parent node in v2

 arch/arm64/boot/dts/renesas/r9a08g045.dtsi | 19 +++++++++++++++++++
 1 file changed, 19 insertions(+)

diff --git a/arch/arm64/boot/dts/renesas/r9a08g045.dtsi b/arch/arm64/boot/dts/renesas/r9a08g045.dtsi
index 067a26a66c24..247fa80a4f53 100644
--- a/arch/arm64/boot/dts/renesas/r9a08g045.dtsi
+++ b/arch/arm64/boot/dts/renesas/r9a08g045.dtsi
@@ -160,6 +160,18 @@ i2c3: i2c@10090c00 {
 			status = "disabled";
 		};
 
+		vbattb: vbattb@1005c000 {
+			compatible = "renesas,r9a08g045-vbattb";
+			reg = <0 0x1005c000 0 0x1000>;
+			interrupts = <GIC_SPI 43 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&cpg CPG_MOD R9A08G045_VBAT_BCLK>, <&vbattb_xtal>;
+			clock-names = "bclk", "rtx";
+			#clock-cells = <1>;
+			power-domains = <&cpg>;
+			resets = <&cpg R9A08G045_VBAT_BRESETN>;
+			status = "disabled";
+		};
+
 		cpg: clock-controller@11010000 {
 			compatible = "renesas,r9a08g045-cpg";
 			reg = <0 0x11010000 0 0x10000>;
@@ -425,4 +437,11 @@ timer {
 		interrupt-names = "sec-phys", "phys", "virt", "hyp-phys",
 				  "hyp-virt";
 	};
+
+	vbattb_xtal: vbattb-xtal {
+		compatible = "fixed-clock";
+		#clock-cells = <0>;
+		/* This value must be overridden by the board. */
+		clock-frequency = <0>;
+	};
 };
-- 
2.39.2


