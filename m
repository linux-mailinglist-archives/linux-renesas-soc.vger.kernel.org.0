Return-Path: <linux-renesas-soc+bounces-10255-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1DE189B8E6C
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  1 Nov 2024 11:00:36 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D63B4280C34
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  1 Nov 2024 10:00:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CCA8F19F432;
	Fri,  1 Nov 2024 09:57:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="qHXvMC+Q"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com [209.85.208.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 403D219D8A0
	for <linux-renesas-soc@vger.kernel.org>; Fri,  1 Nov 2024 09:57:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730455078; cv=none; b=fJdjvJzL85l3j7b+oM3eo2iaT0CLwrWW6mq6ZcgX6wqGk1YhcYQRLmxfT7uVfIVA51cNXD4qkGFGCOnUok840WZ1eI/p7y7M7RnY03UDW8tAK6Ni2tftu7swSpr5JLHPa/6SWaiwfShMwy9X20QLgzdoUTLlUeLqXERyoClVsjU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730455078; c=relaxed/simple;
	bh=pfMUh0nCTx4HqI28z1w+eIfG9KaFRT2lAZq9NXKFrTQ=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=drFelVts9Xzf97So55Hwb9ko1019c90WBjMjTfbpj1ioOoWHNDpiOU9yYx70akiIaVHhv+63lt3lGJYVDN7Ag8bu0SuapxZoaGYooVqhaqy6npZB8NpyoKwlb0VvEyoc0qkHmnOiTG8r90ChA7qH69fjMcFPJ9afT9nnmRAScic=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=qHXvMC+Q; arc=none smtp.client-ip=209.85.208.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Received: by mail-ed1-f45.google.com with SMTP id 4fb4d7f45d1cf-5c957d8bce2so980490a12.2
        for <linux-renesas-soc@vger.kernel.org>; Fri, 01 Nov 2024 02:57:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1730455074; x=1731059874; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RPAiWzbcwfO/oeR5F4JHaOzCtAZr+PBDQTIr9NKTt98=;
        b=qHXvMC+QqUTqrbCnwIVLMQKxqencNzmWE8/ocVP/YfCssl6XQiNFjs94hGCYSgZkYI
         UTRVrfUpNSTzkKKlB4qBUIS8+Nmx8DEa1zB7bQTCARHMJk1kEK7wUCGf6SsXCEi5c6o3
         jznc1rBRO/lLt/161w/PF/WObBV3F3/H+Ovwi7wj21nlNVM0YZaZD/LZzUXnYHj+NpWX
         6Z1qeO+KlSSIntiAsm9M6l2/2/0jKodSOyidPZ9Fz7j5Xebh8QnbPVoxkDLtdmxxLrQi
         r4MCM86h//NWGMDD9z8TDayZ/RFRlmueQMvhcv2gVogULX2PVYgqsi4VBqONdgxgnl+T
         hrxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730455074; x=1731059874;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=RPAiWzbcwfO/oeR5F4JHaOzCtAZr+PBDQTIr9NKTt98=;
        b=fz3XIWiGHWdNrkDZNrY+4KqK0iPtQxDeY0HcR47tct2+f9r27pials4FMw6Nb62q4a
         Jjssf+BFQ9XawYZW4JJKr5/K+QHUmyzw2iaYol4/DkMmUBhMrc5WX4+qvfCIzC3eQtAS
         ZYmfuSPJYG6ZuizJbNVmIisv1HGZc8A61QqoPTWtS9ljWY/2qeT79nxKqlNA/J78OLeC
         dA9OKmQ5xpZSaxPCvuWqjs1tukMkapMGTW+A6R5khkma8p0W2Uw/yHprjYZIlp83rL7r
         OlT18GpqrnnuoTpFgNt+5vuu+6j3xoWKCvLe01M6IcREKay+nMuZC+VjbItaBIThZBCk
         rGLA==
X-Gm-Message-State: AOJu0Yx0O1Myglipf1D+L3KaD9VoRrmiBealcg9xscQbvbWvQsePeY7z
	6FYxOHSw6YK2U1n4XiBkQ0n5KMl0oDmXUud595/6TZQD+xTsmV4rlU1epcCrHO0=
X-Google-Smtp-Source: AGHT+IHrP9FP8fHD/OSWluh8tapezeAqFQ+YzxBMlbpTwIN/za5gGLBDUt6ZXq57lFavCwyaNAz2qw==
X-Received: by 2002:a05:6402:51ca:b0:5cb:728e:926b with SMTP id 4fb4d7f45d1cf-5ceb92a38f5mr2691588a12.17.1730455073635;
        Fri, 01 Nov 2024 02:57:53 -0700 (PDT)
Received: from claudiu-X670E-Pro-RS.. ([82.78.167.190])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5ceac7c8d87sm1364136a12.76.2024.11.01.02.57.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 01 Nov 2024 02:57:52 -0700 (PDT)
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
Subject: [PATCH v6 7/9] arm64: dts: renesas: rzg3s-smarc-som: Enable VBATTB
Date: Fri,  1 Nov 2024 11:57:18 +0200
Message-Id: <20241101095720.2247815-8-claudiu.beznea.uj@bp.renesas.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20241101095720.2247815-1-claudiu.beznea.uj@bp.renesas.com>
References: <20241101095720.2247815-1-claudiu.beznea.uj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>

Enable the VBATTB controller. It provides the clock for RTC.

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
---

Changes in v6:
- none

Changes in v5:
- dropped the status = "okay"; from vbattb_xtal node

Changes in v4:
- added assigned-clocks, assigned-clock-parents properties
- set vbattb_xtal status = "okay"
- collected tags

Changes in v3:
- updated patch description
- dropped vbattclk
- added renesas,vbattb-load-nanofarads on vbattb
- moved vbattb before vbattb_xtal

Changes in v2:
- none

 arch/arm64/boot/dts/renesas/rzg3s-smarc-som.dtsi | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/arch/arm64/boot/dts/renesas/rzg3s-smarc-som.dtsi b/arch/arm64/boot/dts/renesas/rzg3s-smarc-som.dtsi
index 71424e69939e..30bb4f5a7dfd 100644
--- a/arch/arm64/boot/dts/renesas/rzg3s-smarc-som.dtsi
+++ b/arch/arm64/boot/dts/renesas/rzg3s-smarc-som.dtsi
@@ -5,6 +5,7 @@
  * Copyright (C) 2023 Renesas Electronics Corp.
  */
 
+#include <dt-bindings/clock/renesas,r9a08g045-vbattb.h>
 #include <dt-bindings/gpio/gpio.h>
 #include <dt-bindings/pinctrl/rzg2l-pinctrl.h>
 
@@ -344,6 +345,17 @@ mux {
 	};
 };
 
+&vbattb {
+	assigned-clocks = <&vbattb VBATTB_MUX>;
+	assigned-clock-parents = <&vbattb VBATTB_XC>;
+	quartz-load-femtofarads = <12500>;
+	status = "okay";
+};
+
+&vbattb_xtal {
+	clock-frequency = <32768>;
+};
+
 &wdt0 {
 	timeout-sec = <60>;
 	status = "okay";
-- 
2.39.2


