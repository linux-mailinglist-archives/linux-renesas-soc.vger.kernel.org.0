Return-Path: <linux-renesas-soc+bounces-9907-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 727679A4C5C
	for <lists+linux-renesas-soc@lfdr.de>; Sat, 19 Oct 2024 10:50:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 1CEC31F22368
	for <lists+linux-renesas-soc@lfdr.de>; Sat, 19 Oct 2024 08:50:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8E4F31E1029;
	Sat, 19 Oct 2024 08:48:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="JC/05x2I"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 276401E0DE7
	for <linux-renesas-soc@vger.kernel.org>; Sat, 19 Oct 2024 08:48:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729327694; cv=none; b=KtEvxYbumZrORV7H7jJIiZvWsbYJyF0Joex8CqU9swRt09PSp3QPiPtYuhzsL/bBcXs6svyw1rZq5IMSgK3s+pBnA8MFrVhKiilWfmuIK6pxS5AIvKPR6u8Ze6E4cjQeLMEf6eeCYDfTD8epnyx2qbdXTnMcAKdeVrimBts9C7U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729327694; c=relaxed/simple;
	bh=QkgHvw9IBOeGPAakrzCTmrkD96bz5qPFYSsEtoUc+6s=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=S/68KbNlDQvnIDfdDWyI2PgBQepycPxpxxt+oeM1Df/qkz2knsaYgb5O3w/mg9TMB5vkvBv8mYEqDRpL0T75GCeuTpHqh4djzIZUjSf0CNfxtfM8vwou8buOcXYEbzSEuxv7/mj9ZISp92PVxkqUsGVQZQ611IXEIa9KBIKH3dE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=JC/05x2I; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-43155afca99so21448175e9.1
        for <linux-renesas-soc@vger.kernel.org>; Sat, 19 Oct 2024 01:48:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1729327690; x=1729932490; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=i1BDFdSyg41e2LABdQN1el7m1GZPq2Uu7y0UUTGsVos=;
        b=JC/05x2IHqKMY4XIqE+GHpMTkBvG0/11CN9YZc3OVSjOKYWFvQ1atbCGQaWR+GH59t
         QkZz4ydXhituuzlsJ/l31CPa6n1HuCUjFdebymIKmmL5wg3/wqwGUFMw0CX4NlRkX8qq
         Sd+5hCBt5o1Yv3jZ+y416VU5R3oH/rCdgd6TjG+FelftvsAsACKXFVxUDdqQjOW2ABny
         tgjIs6e+Gq3Uqr+IR0Xcwf8bzvs2m8JWl9SL4tkg1XnPVdc/XTAEqc7Sr9CQO4MXGTmI
         GVL7DMuGZS0pPSXJxA0k92zPplTIEg7+N1jgULjon7iXnk1ECU/SVao7m/vrKAYvhwiU
         HxjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729327690; x=1729932490;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=i1BDFdSyg41e2LABdQN1el7m1GZPq2Uu7y0UUTGsVos=;
        b=ncWQc6pn1Q2P9und+Rd907iPdmZqyKnwuPEKbeMyKb1wZ6p+Zr6I+uBZn1UOjA/cJY
         uRXAwWzFR9R/KrHTJrF9FqBVcx6i5iYxFcH5f4DK+lDM8D0WbtozZipb4UOAJu/f6A2V
         DJvzwXEkKQiC3PlX1bQX8eWwGcW/9pZzS7+gZkEzY5K1sCG+tsHePevmJjN+m15VdDr+
         KPvUDcCQjbgHBpNhEEZgjF3DA2gtgu8eo6HnCBqPszknt7zWkh7d/wvh4yJW8ADXlN3C
         yuRai8KM70CPxjKcPCGzbgnpppcEa1xXgXnckiNNvgW9Uy9HC5K1f+286O5qr3JVPH4A
         v6Uw==
X-Gm-Message-State: AOJu0YyeeKOjaHPCLCBccGw48HZ1NxiRbOLXIfLVUCk4Jglsi66b2WKu
	SnEnwBMIl9+PzmvVvfVvWaPLIVMNaQHntlNDkLD2UnV1PIfEw8FjM5QV03LsPQg=
X-Google-Smtp-Source: AGHT+IGHzPKJDiCrpkrv0zEGse3U3VvdpNmMFQCy8z/QXuS15hpNd6JHm2gDYDjdinG8u1jiTCFuqw==
X-Received: by 2002:a05:600c:3b85:b0:42f:84ec:3e0 with SMTP id 5b1f17b1804b1-43158721801mr65450245e9.9.1729327690371;
        Sat, 19 Oct 2024 01:48:10 -0700 (PDT)
Received: from claudiu-X670E-Pro-RS.. ([82.78.167.23])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-37ecf0eccbasm3898731f8f.81.2024.10.19.01.48.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 19 Oct 2024 01:48:09 -0700 (PDT)
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
Cc: linux-renesas-soc@vger.kernel.org,
	linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-rtc@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	claudiu.beznea@tuxon.dev,
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
Subject: [PATCH v4 11/12] arm64: dts: renesas: rzg3s-smarc-som: Enable RTC
Date: Sat, 19 Oct 2024 11:47:37 +0300
Message-Id: <20241019084738.3370489-12-claudiu.beznea.uj@bp.renesas.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20241019084738.3370489-1-claudiu.beznea.uj@bp.renesas.com>
References: <20241019084738.3370489-1-claudiu.beznea.uj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>

Enable RTC.

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
---

Changes in v4:
- collected tags

Changes in v3:
- none

Changes in v2:
- none

 arch/arm64/boot/dts/renesas/rzg3s-smarc-som.dtsi | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/arm64/boot/dts/renesas/rzg3s-smarc-som.dtsi b/arch/arm64/boot/dts/renesas/rzg3s-smarc-som.dtsi
index 6be0ffdcb87e..939820a925d6 100644
--- a/arch/arm64/boot/dts/renesas/rzg3s-smarc-som.dtsi
+++ b/arch/arm64/boot/dts/renesas/rzg3s-smarc-som.dtsi
@@ -347,6 +347,10 @@ mux {
 	};
 };
 
+&rtc {
+	status = "okay";
+};
+
 &vbattb {
 	assigned-clocks = <&vbattb VBATTB_MUX>;
 	assigned-clock-parents = <&vbattb VBATTB_XC>;
-- 
2.39.2


