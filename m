Return-Path: <linux-renesas-soc+bounces-8559-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2020896626E
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 30 Aug 2024 15:04:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 7A127B23E55
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 30 Aug 2024 13:04:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8019E1B3B10;
	Fri, 30 Aug 2024 13:02:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="QugKe6OJ"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A4B61B2ED7
	for <linux-renesas-soc@vger.kernel.org>; Fri, 30 Aug 2024 13:02:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725022975; cv=none; b=aI5U6oSAVCAHwCIc6WEr5tQ6FWKyOn9cukOud2LWsLmUyGDOoksc59PHGdnmqi94Escbnj3P/bzK1qZifjLdpLjdQBrBZDvuVspeXm4WVyYljIGEsKWfmiKnljSdszo0ZaygeanFfZPQUuwBryCpPos0xcmOavHw4QgADwmhH0k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725022975; c=relaxed/simple;
	bh=71cKCxh2lP67wOIct2ANTYnPPxIsv0JGrWq49Hv2hAg=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=bsViqmLmP1fZfWg5UUPZejOCfG16yXL5h9bdgaaJA+ts3vYdyzGLTQJ5cww1OFU3tiCk8Y4bJ4CXCGn8Ip+Ai/Zird8OWX8sR1lTA0k20m00+oqKQ2Ocfk0mWySuqkx1iUEHtF7L9S4Tsv5YVJr2nLFC+nXXh+lG/h078Pc6zDA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=QugKe6OJ; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-42ba9b47f4eso10948185e9.1
        for <linux-renesas-soc@vger.kernel.org>; Fri, 30 Aug 2024 06:02:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1725022972; x=1725627772; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=A3wDKjVjYsbUWQ/cY+LDnY6Komdrp4zwFk+fU6Ed6VE=;
        b=QugKe6OJ9ndwXsNPycwURfRCJqT/hWLNDRo9IiSR1SoGvK8GWUfb1X5euAQl5Y2eYw
         9T9ILA+qs/gGd5mrLMX/PyEtI8l/O/1lpTYmIoVt/tfZyLbOXL0lPFMMOYPJ4ABpkkHi
         OAhNPKy3OkGerE8+/dj2M+E0NaoViCy8aB4ARizY6qB69nFE4MxzZ3wItKfD/vusucP4
         sEdxOOOoGzImfzo2Bi6pSoen20bYsHEwShDL3WFXALgWjqNnr2KBHV+m/IxPX3+/jtAP
         c2tVNW5yP3/uQ96eIsiKTcRs53jljtPjcSPP2AQ7yLTF4vbUizPW4NlWEI0xecJxNI2l
         p5Yg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725022972; x=1725627772;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=A3wDKjVjYsbUWQ/cY+LDnY6Komdrp4zwFk+fU6Ed6VE=;
        b=daaCqiskO0EdT5sczvhQjDOYF93fhbpvTgBYHC80Ilh4oXzVNrA18H0xLjqIMUX951
         rXerU2EveAUH25gIzbQrO0yT1wQb7o37OYWCMz1WmD6mNCNOS3f7GP24Zf3wyerHWIRX
         KYj/B1zbuVZjvcuEaWvrGHkOnkBOiAjC8D3F5mHQY4lfIIs482eFaKy1VJlh4TJv5Hzw
         y0YLkP2sUBClck6hIMGdmivoLsTbRzIi8FcEsiIN2S7iN4GJ0qCVUxfZDKkDTLj0x222
         SftnzJDEx3rrry+mD86RSD1QsDiIm9D5OryTTxJlMMdXZ2zwNkjIWXAxiS4RU82uTq4e
         Utmg==
X-Forwarded-Encrypted: i=1; AJvYcCWaLT9CVMEzVIA0I4RaFG43JGokzuHJ36rHOoC39AOLhp0wfomOjllBaXWvtAOwUHt072Wtwt0mmmtreQVDpcW40g==@vger.kernel.org
X-Gm-Message-State: AOJu0YxpYDB5jPUwvQQzBgpsZw7SK66xRw781Uz8fxuPqB8jMAJFBfYI
	shDOGD41zlAls23HtY5Lljo1Cz/noMOzFXM68+//9NJ3TxtTRdgPdOR1ow3nR/M=
X-Google-Smtp-Source: AGHT+IEt0fh7qX9ai2OjXs34VWHMrK1anskSaF9JDjd1vXG1ueCZll0q99NbgTuA38F/kPfX3ifE4g==
X-Received: by 2002:a05:600c:3b0f:b0:426:6fb1:6b64 with SMTP id 5b1f17b1804b1-42bb4c4cbe4mr39745855e9.7.1725022970979;
        Fri, 30 Aug 2024 06:02:50 -0700 (PDT)
Received: from claudiu-X670E-Pro-RS.. ([82.78.167.144])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-42ba642594dsm80361785e9.47.2024.08.30.06.02.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Aug 2024 06:02:50 -0700 (PDT)
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
Subject: [PATCH v3 10/12] arm64: dts: renesas: rzg3s-smarc-som: Enable RTC
Date: Fri, 30 Aug 2024 16:02:16 +0300
Message-Id: <20240830130218.3377060-11-claudiu.beznea.uj@bp.renesas.com>
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

Enable RTC.

Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
---

Changes in v3:
- none

Changes in v2:
- none

 arch/arm64/boot/dts/renesas/rzg3s-smarc-som.dtsi | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/arm64/boot/dts/renesas/rzg3s-smarc-som.dtsi b/arch/arm64/boot/dts/renesas/rzg3s-smarc-som.dtsi
index 591a90ccfe3c..f911c2aa5e66 100644
--- a/arch/arm64/boot/dts/renesas/rzg3s-smarc-som.dtsi
+++ b/arch/arm64/boot/dts/renesas/rzg3s-smarc-som.dtsi
@@ -346,6 +346,10 @@ mux {
 	};
 };
 
+&rtc {
+	status = "okay";
+};
+
 &vbattb {
 	renesas,vbattb-load-nanofarads = <12500>;
 	status = "okay";
-- 
2.39.2


