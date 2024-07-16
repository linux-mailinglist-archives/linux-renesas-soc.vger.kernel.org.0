Return-Path: <linux-renesas-soc+bounces-7367-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5FF7F93240E
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 16 Jul 2024 12:32:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 9D194B22F7F
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 16 Jul 2024 10:32:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B5F8C19A280;
	Tue, 16 Jul 2024 10:30:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="oOdrnT2j"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-lj1-f180.google.com (mail-lj1-f180.google.com [209.85.208.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D23461993A3
	for <linux-renesas-soc@vger.kernel.org>; Tue, 16 Jul 2024 10:30:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721125852; cv=none; b=fe9xJM5I8mDWId8ixrEp/iL+If2AvJLrMMUxxOSj58IKmifDgLh33S2GEtaJ7KFMiFYp2qb9La0NkWakiBnEhHBVW8J+f4hnzF8IchsMyoJB+W0F2mE0XvSlzbaQPokr78VPHKQjnBIkL4P6occaMGKBAz4hpr2tx4nYRykcuVA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721125852; c=relaxed/simple;
	bh=kHYvG6Jmfou0a/3H3JPJCy+a3te9zYGMB7WNF7i3CEI=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=FsmdaG8orKgPKWn4HKY9XZx2eG2IsA6LjNrq+YS14SVLtid9gA05uRCPCzI7CfFPpYfOXtq2rp9Wj6Yb5k6uYYZk1BHa2l9qmm89i3iIoHHt+AmmPu7nzhylU7/vHSU7jTexYnRS26g2cdNLlkp/4D77homMqgZHwATH7Rcc21s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=oOdrnT2j; arc=none smtp.client-ip=209.85.208.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Received: by mail-lj1-f180.google.com with SMTP id 38308e7fff4ca-2eeb2d60efbso64900331fa.1
        for <linux-renesas-soc@vger.kernel.org>; Tue, 16 Jul 2024 03:30:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1721125849; x=1721730649; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SgEFJU9TqEeEi7v4UfFzMf6SUYm8BDlnIzCjSGdepnE=;
        b=oOdrnT2jlbBMpxuKx3C0WXIRN4heqySo5g9u45cJHalGbz/kK0wpmpgg4xzpStvp2n
         omNnvyDO2vgDq5lY1yniqfUOiAd784/GJIc00gk/zaxDmAEVIrIWW0tG5dC7R98Ui45p
         FFy2zXBlWdGKcoZWotI39hVEy3FUwQ4HorhV3tVhvwDqE5ENL6PF3lO/6MNf/Tcif4y0
         Uhz0iBxTnQpThrHwIzwSmdYhMy/DK8EZSSdB1whVlpYutT/pq7OUPBMVIXzjli0eGcef
         zHdHqzvlJC1K5wBu562357GNLliijHt2ikXQ8omDzAY37zdSlFu5U7C/vpN29zZsykXk
         vmxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721125849; x=1721730649;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=SgEFJU9TqEeEi7v4UfFzMf6SUYm8BDlnIzCjSGdepnE=;
        b=VvYYzhV/NlQuVIjPd0GQ0sCLSqVlf9HerIUp5ZOABjxwT0YyJspk6iHo7W+txE3NDu
         P0btXWIeua+GaTLtiW14c/nE/cZu81cKmCiBCEXnZHFCL03bcRmDeEKa7se/Sy+u2LsJ
         y0GlANnXU5bn2H10/rR3nfh6g5/rbt98HR5LXBrVt6KvBZnM3gxNugLfIVUcYhmcOS0Y
         3w0zxe7m4WYny6Xmk0HHzpVFV/Ba/j7DVCBi21BPq8WTORqhUxBWiPKdsBuJLSf8g+7l
         2YCLPcxfiqNWjAnaUPmLfa8GanEEK7LiPvDPRzWPaYHJcBQZrufHMXOAq8FnxqbGPjv9
         ncbA==
X-Forwarded-Encrypted: i=1; AJvYcCWStIQMv0fOgSUO0DxeFUTkWU2fa095MY+K2DJ8hhuznP6uaLgvsiYDv9IuiKL064nBNZhvqU6yxbycdeNAKHfMGlfitgQ4cRvFfXMAJOBCljA=
X-Gm-Message-State: AOJu0Yz1qL0KDolYTOujDSghdgwLPRNYqn15oP/ER26yBLLJbKL65MXd
	sZqynEJqu+BcfSIlII9E/w3SKxqB90HPNz4F0YahvGwThdLc6eZD+obWKKW8kFg=
X-Google-Smtp-Source: AGHT+IE4UrP8ocZy8DYCRi6ljSVc7gUaTDEwV0MlfP0Wt1LcKXTzKRIXgiUNL8wbFViSdsnBD2NBxA==
X-Received: by 2002:a2e:9ed9:0:b0:2ec:5699:5e6 with SMTP id 38308e7fff4ca-2eef4190aedmr11234431fa.26.1721125848934;
        Tue, 16 Jul 2024 03:30:48 -0700 (PDT)
Received: from claudiu-X670E-Pro-RS.. ([82.78.167.171])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-427a5e77488sm121546145e9.9.2024.07.16.03.30.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Jul 2024 03:30:48 -0700 (PDT)
From: Claudiu <claudiu.beznea@tuxon.dev>
X-Google-Original-From: Claudiu <claudiu.beznea.uj@bp.renesas.com>
To: lee@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	alexandre.belloni@bootlin.com,
	geert+renesas@glider.be,
	magnus.damm@gmail.com,
	mturquette@baylibre.com,
	sboyd@kernel.org,
	p.zabel@pengutronix.de
Cc: devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-rtc@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-clk@vger.kernel.org,
	claudiu.beznea@tuxon.dev,
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
Subject: [PATCH v2 08/11] arm64: dts: renesas: rzg3s-smarc-som: Enable VBATTB clock
Date: Tue, 16 Jul 2024 13:30:22 +0300
Message-Id: <20240716103025.1198495-9-claudiu.beznea.uj@bp.renesas.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240716103025.1198495-1-claudiu.beznea.uj@bp.renesas.com>
References: <20240716103025.1198495-1-claudiu.beznea.uj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>

Enable the VBATTB clock controller.

Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
---

Changes in v2:
- none

 arch/arm64/boot/dts/renesas/rzg3s-smarc-som.dtsi | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/arch/arm64/boot/dts/renesas/rzg3s-smarc-som.dtsi b/arch/arm64/boot/dts/renesas/rzg3s-smarc-som.dtsi
index 8a3d302f1535..517ce275916a 100644
--- a/arch/arm64/boot/dts/renesas/rzg3s-smarc-som.dtsi
+++ b/arch/arm64/boot/dts/renesas/rzg3s-smarc-som.dtsi
@@ -341,6 +341,19 @@ mux {
 	};
 };
 
+&vbattb_xtal {
+	clock-frequency = <32768>;
+};
+
+&vbattb {
+	status = "okay";
+};
+
+&vbattclk {
+	renesas,vbattb-load-nanofarads = <12500>;
+	status = "okay";
+};
+
 &wdt0 {
 	timeout-sec = <60>;
 	status = "okay";
-- 
2.39.2


