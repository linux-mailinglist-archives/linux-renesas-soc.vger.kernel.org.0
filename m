Return-Path: <linux-renesas-soc+bounces-8557-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id C5989966262
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 30 Aug 2024 15:04:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 8428D2827F9
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 30 Aug 2024 13:04:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5DC341A7AD6;
	Fri, 30 Aug 2024 13:02:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="DRekLhrv"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB5E11B250F
	for <linux-renesas-soc@vger.kernel.org>; Fri, 30 Aug 2024 13:02:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725022972; cv=none; b=jFEbUDv1MsyFzheUzOHtF+wQZzSe36RDC8h9CssvshPovMwsiSUyGDeHvfQSWMsswnQOtiP9yMYi3A4kQa+IprTBQOOp1elfqzzKAk18+n0NTWkr7kAtWjdVE51/QhmwTRSYsHbnKhbrN6wc4H0goesoaqqdEyPUiyi5cdAiIrI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725022972; c=relaxed/simple;
	bh=SOGK7YXZYXutzKsB4rqBEXBmAsm7IDgcVUg5Tr6j8dw=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=oJS5iDTvVlJ0Cjuvlii/AnuA9sItM672z6SLO9Go7G0XfT4otoHUreBKbbJf+2KmGR6yrRdgLVVTLJuD7Wd63+Pz90IkTcy4yRZ1YZjukB1OjozoYMJXx9/iA/cbkdSMj1Ujb061lcryD6XC3qWfjESYjSlEcfhabf5uGHbaEDg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=DRekLhrv; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-42bb7298bdeso19273035e9.1
        for <linux-renesas-soc@vger.kernel.org>; Fri, 30 Aug 2024 06:02:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1725022967; x=1725627767; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rkRwte9q+8AOt+nLdxE1AfujOX2Kar+XMD+HzKexS/o=;
        b=DRekLhrvNR22sORM1LeuRJ4p+LqPx+oKKOhb/DEhpiiLaMQnPIEZcTmuaDu3lGGobY
         tA7OrP2P3zx2j/XMu32oIVT000RrGPkOWvonvn/fvVhk7d/h2/CBVsMqPU0eSMUi6nQ3
         EHRTNKuTXQ5fud/pPzn6dzZg8K/NI3+FV+qNS5D9Lze6cSdaq4r/y5xBQF9XzYpe4DZz
         A+zItSmkt+NLz4YtVb5SE50rFgjZyae3yuaTIzC191agS53UaaFdRtPdRgxyUpE8Bhzp
         1WTJ9XarU9nTW1k1bk8dZ5WYssdDMiMLStXR0Z5jjhPXtZ8LE9nXRSHbH7fsfG6G1mKt
         mxtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725022967; x=1725627767;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=rkRwte9q+8AOt+nLdxE1AfujOX2Kar+XMD+HzKexS/o=;
        b=dPJYtjbBpyDR2Apx1g2wLPiGuS8udAJccjmqSjceyee53Qh27VyhNpCe90z+dCPupB
         p3z5S10AGB93lL5Njmy5N5YwLdEAxj5EWeLikbfy+MT3k6yFuv0TY9V7en8YiT4eJC64
         apW4kwlkAEORu7R3Y6V7V7qXHsP7e8mqOlnx2KxDBzwUx86AUHtPHVCVw5P/xIBPzzix
         myYuAQlCm/kgm2CAfDTJhkmliuMBFH018vBYfCRNsSV3YN6qLlSsCJ01miep6LkydIJU
         OgNZXcktzISTYDD4HZVzAwXWmuvCvMOMm5F3pysDotk4kc7/e0wrkqGDf4vDc7Jij/ZB
         Y+ZA==
X-Forwarded-Encrypted: i=1; AJvYcCV3O7C4vPTNNxZy9yT/z/Iu/GTxbNbITq6X0E9He4EuFwpcm4PvwwWxH4ipq1bY3YSDmUJVreoz+MsoEYBzz0ygvw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yzsb1wE/x8AwV/VT3lhpOjSqoj7ZrM+hA/IZ4k7Puo/QIwjKXta
	VhB4YoEB8FSWVjl6ux8P+jkdUkEEZOA4wME7d4uvhKO5cLHV7hkfwleFyCqWOslToNf0kQ4lI0O
	b
X-Google-Smtp-Source: AGHT+IGU92UJsrTL2eS34wvxlFxInUfaWmAHimLJ8uHD9As/Je5eM6xtpedH3VaOd1rgq+IJrO4c2w==
X-Received: by 2002:a05:600c:3b10:b0:426:6ed5:fcb with SMTP id 5b1f17b1804b1-42bb01ae1fbmr61952375e9.4.1725022966892;
        Fri, 30 Aug 2024 06:02:46 -0700 (PDT)
Received: from claudiu-X670E-Pro-RS.. ([82.78.167.144])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-42ba642594dsm80361785e9.47.2024.08.30.06.02.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Aug 2024 06:02:46 -0700 (PDT)
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
Subject: [PATCH v3 08/12] arm64: dts: renesas: r9a08g045: Add RTC node
Date: Fri, 30 Aug 2024 16:02:14 +0300
Message-Id: <20240830130218.3377060-9-claudiu.beznea.uj@bp.renesas.com>
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

Add the DT node for the RTC IP available on the Renesas RZ/G3S SoC.

Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
---

Changes in v3:
- added CPG clock, power domain, reset
- and assigned-clocks, assigned-clock-parents to configure the
  VBATTCLK
- included dt-bindings/clock/r9a08g045-vbattb.h

Changes in v2:
- updated compatibles

 arch/arm64/boot/dts/renesas/r9a08g045.dtsi | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)

diff --git a/arch/arm64/boot/dts/renesas/r9a08g045.dtsi b/arch/arm64/boot/dts/renesas/r9a08g045.dtsi
index 247fa80a4f53..ac9b6733d289 100644
--- a/arch/arm64/boot/dts/renesas/r9a08g045.dtsi
+++ b/arch/arm64/boot/dts/renesas/r9a08g045.dtsi
@@ -7,6 +7,7 @@
 
 #include <dt-bindings/interrupt-controller/arm-gic.h>
 #include <dt-bindings/clock/r9a08g045-cpg.h>
+#include <dt-bindings/clock/r9a08g045-vbattb.h>
 
 / {
 	compatible = "renesas,r9a08g045";
@@ -160,6 +161,22 @@ i2c3: i2c@10090c00 {
 			status = "disabled";
 		};
 
+		rtc: rtc@1004ec00 {
+			compatible = "renesas,r9a08g045-rtca3", "renesas,rz-rtca3";
+			reg = <0 0x1004ec00 0 0x400>;
+			interrupts = <GIC_SPI 315 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 316 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 317 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-names = "alarm", "period", "carry";
+			clocks = <&cpg CPG_MOD R9A08G045_VBAT_BCLK>, <&vbattb VBATTB_VBATTCLK>;
+			clock-names = "bus", "counter";
+			assigned-clocks = <&vbattb VBATTB_MUX>;
+			assigned-clock-parents = <&vbattb VBATTB_XC>;
+			power-domains = <&cpg>;
+			resets = <&cpg R9A08G045_VBAT_BRESETN>;
+			status = "disabled";
+		};
+
 		vbattb: vbattb@1005c000 {
 			compatible = "renesas,r9a08g045-vbattb";
 			reg = <0 0x1005c000 0 0x1000>;
-- 
2.39.2


