Return-Path: <linux-renesas-soc+bounces-11193-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E2849EB7DE
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 10 Dec 2024 18:15:21 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 52E60162A0E
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 10 Dec 2024 17:15:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8C50F240372;
	Tue, 10 Dec 2024 17:10:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="jx6caag1"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com [209.85.208.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8AF58241F4D
	for <linux-renesas-soc@vger.kernel.org>; Tue, 10 Dec 2024 17:10:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733850658; cv=none; b=G4lvJMLNJXXHzwFjJDnTPRsTTTYymGdVTtw21X1hKhHRRX7N/AtSrxNtsZmHrxxNZS1vgDeO/+DTimEUd+yMC93Gz2ExE5Tjxgp7+saMWRs9HRtT6gQ9n6DbaKweBkWaJZyNwVbXL+sixpyBZ+93sWbPc22fFJq1AMiAJCyYNWM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733850658; c=relaxed/simple;
	bh=d78/cjRoA1rGuCezGVFS8ZJSQg5DxH7DXWKg06PRmuY=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=UBLI+K7kTe/YaQ1kt1pxNJOtUg0JioOOLPmbsRrhER4KlPtWQ3VTlKeJULgxYHf8hJzDzw3Q+EAXRMGeo+aGh8YvO27iSZtbJ4o5r4CxTYbx0G/Jo9OcAbb6E86xq52oSHUX8Hb+jJl2tyXn74A4blFva3Adf3zKdoSHjVrFb9o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=jx6caag1; arc=none smtp.client-ip=209.85.208.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Received: by mail-ed1-f50.google.com with SMTP id 4fb4d7f45d1cf-5d3dce16a3dso6043481a12.1
        for <linux-renesas-soc@vger.kernel.org>; Tue, 10 Dec 2024 09:10:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1733850655; x=1734455455; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XG8zYqRJnsZkhZfRr2g1CnvN6FDBTlyfj/tmdbveBiw=;
        b=jx6caag1FYIcxb+as7XhlwVVacZd/ekU9KnjO00lsodxHeXPYAK+G4uBi7/HDdlwBb
         x+nB9qINuLm029N9r5tjrwgkQdSMhJWEjW2KElU2DMSqV9YZbYzVT/PiiseM909qmiRX
         OSXQKQAH2vhof7kbqRRvQru+KyBuW6nJCDTvGF/8sGexnxZY/u+qU2Gs6wmYS7ZLOiw5
         Wgqistxd93er9z4AOGdsYExS0pcX6p1cZWkowHg1dLesFdZtEjXP6Jezg1N+l2dOoh33
         BtedPGoyeGg2dTlxYlR7EwaScHpQ+DePhTZLUnsMQPaQFGZ45SUSZvQsroeSNvyfMVLh
         2XMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733850655; x=1734455455;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=XG8zYqRJnsZkhZfRr2g1CnvN6FDBTlyfj/tmdbveBiw=;
        b=ntVRJJJPngZeJ8o6CTcd2l9C5FsHJeIwf9Nho7epPRxOGS6XnHQ2HM7r+Bj7dGNxvL
         VDg6cK9vQSHXQ+LD5lL1pVNjj3BktXYJ/ZFoTsX/bP3VpYNFAFK/7NMkTiAATmuqjwbP
         SHOe4bzIc87ttR1tulR0kDUFXlNZXkFfodEZEhFIc1bWvWX5ElZuR4mIrfhIBG7RgeoO
         d+7guvW9TMu4HJ+XCAbvuwIdHU1jCcZbKElFhHsQxxjCfZ6e+h81jux4Cbf3Tgj8gAZ1
         8lhZoFVo4U+ufXxRTBQlixIxU5+1qJiLPrZb/VkOaIG0m3IBIAbcOTL9XYFaLHZG8Lr5
         xgUw==
X-Forwarded-Encrypted: i=1; AJvYcCV2gl0tinuhijQ0emIxOFlzc7wkCKUrVGdSPb4IHiv6wIDdklogZfuY8aBCMgB8eZzVqDWkSXZeSN0Vp+wlm8MwTg==@vger.kernel.org
X-Gm-Message-State: AOJu0YwRq7vO7o+sG1buHOHDpLqzLFtQ9kXRjOgotumZHnCVaVKqukZH
	+nqjmtr4+refuDUhI+s4Qe+lYRwPDWhL0yq67lARVD2yYYZdtT+8T7IALfqz+hU=
X-Gm-Gg: ASbGncvxvkzNc17L53DvZnZ0rz41QuaYY9oJl91GHYzqg95eRwQwISpnAfZMZfQhnJu
	cJ7P2ioTPbXM2Dc13MLFiBXReA0T/bdhzPtLPcbvwGesbDArjgzTa4DUGSaNpW9LKW1fRbpzEfH
	u5p1+YpR+zxWLrEQDLyxotGnzt5KiYUrrwxpn5pI21fbASiixjfdDrE/ySZoFAWJwVIMRy7FfdX
	BYV7NFpn5NIgA7P3Q7DVe3YWh2aMKf07Ra7s1wsfBam5YORju27phoY5JvWy+ALtG3C9xxNAIvi
	MVosjo+p
X-Google-Smtp-Source: AGHT+IEgKnHNaC3IX1FEtNtvTz24/8StgSao5VAD6Ub2m7Bx+D6TJNFGkozP9JnrbZSvN4zlM3/+Ng==
X-Received: by 2002:a05:6402:510a:b0:5d0:d208:4cad with SMTP id 4fb4d7f45d1cf-5d41e16362amr4621139a12.2.1733850654831;
        Tue, 10 Dec 2024 09:10:54 -0800 (PST)
Received: from claudiu-X670E-Pro-RS.. ([82.78.167.161])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5d3e7936581sm4853124a12.56.2024.12.10.09.10.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Dec 2024 09:10:53 -0800 (PST)
From: Claudiu <claudiu.beznea@tuxon.dev>
X-Google-Original-From: Claudiu <claudiu.beznea.uj@bp.renesas.com>
To: geert+renesas@glider.be,
	mturquette@baylibre.com,
	sboyd@kernel.org,
	robh+dt@kernel.org,
	lgirdwood@gmail.com,
	broonie@kernel.org,
	magnus.damm@gmail.com,
	perex@perex.cz,
	tiwai@suse.com,
	p.zabel@pengutronix.de,
	biju.das.jz@bp.renesas.com
Cc: claudiu.beznea@tuxon.dev,
	linux-renesas-soc@vger.kernel.org,
	linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	alsa-devel@alsa-project.org,
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
Subject: [PATCH v4 21/24] arm64: dts: renesas: rzg3s-smarc-som: Add versa3 clock generator node
Date: Tue, 10 Dec 2024 19:09:50 +0200
Message-Id: <20241210170953.2936724-22-claudiu.beznea.uj@bp.renesas.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20241210170953.2936724-1-claudiu.beznea.uj@bp.renesas.com>
References: <20241210170953.2936724-1-claudiu.beznea.uj@bp.renesas.com>
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

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
Reviewed-by: Biju Das <biju.das.jz@bp.renesas.com>
Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
---

Changes in v4:
- collected tags

Changes in v3:
- none

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


