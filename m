Return-Path: <linux-renesas-soc+bounces-7368-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id CF2A6932416
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 16 Jul 2024 12:32:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 78FAF1F23F17
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 16 Jul 2024 10:32:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 055D219A2B5;
	Tue, 16 Jul 2024 10:30:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="KCU0FCGG"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 096AE198E6E
	for <linux-renesas-soc@vger.kernel.org>; Tue, 16 Jul 2024 10:30:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721125853; cv=none; b=ePlvuPIRh0gzMKykEwGwb7wqMF4TpxjjpdCDygKM6C5uLGdeompp1lFXO+4VpITLyNgEaCVhS1riFtH/9jTnlc6kLkB3yD76WFNI3zaBnV2TVkUs2mBFnGibQbVwbE6w9yrr+x5t5Av2lyfPw58JoVOPB4+YQUWd0jTXAj+jd+k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721125853; c=relaxed/simple;
	bh=Yma0qTMMXu0a2MbLRmuXJu/JnB7PKFVYrRohVbWmkNg=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=TxnX7LOnUsPIAR7R+NT+nqwikFQZMtVNfxTw/SnoL9+H1lvB8x5ZSqE/u4EJcnjH0aM8UpfOrFU8cTVeuE6pul4hm58bDm6DKIJJZ3bq2VJgS6eGJAc1KlsZon7I/3v0woz2q83eBasnqSbA7bgTQLuZ/RvVR2G2L+UseuIBh3k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=KCU0FCGG; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-42795086628so35787585e9.3
        for <linux-renesas-soc@vger.kernel.org>; Tue, 16 Jul 2024 03:30:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1721125850; x=1721730650; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/G5+44h167VOsiaOPrdd9U616TrltprIHsWsocA1F5A=;
        b=KCU0FCGGhREK7zVJjftkrnJWEpFCeocN6hdC1uV1OQd5HXNtrKkfvSl4dBD3Gs4OF3
         o0Kx3sk/hxVFIPL9Tb9vviDxLMCig8wB9yx/7CtTMYDvJnrg2MZeP0K3pCHaJbL17Fig
         DINjVdIkZ3BFv+OfsUywi0Q4DP97bZyzk/F1Ke/hTTygyDP3KhGkfpiU6mIZz0qOTrvR
         Kv1m67I9zVotqgLPfRG/TzJqdVKCwrn7enQxUNCnRClnp+rVosJPcn65tsXkfM/yLdiZ
         ZVtWUBjUJ+819+hLDPCvjJWpHXnxPh/+bqM0727M66tdlSDCNtRRUJSB0G4YG8NScB0U
         ugSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721125850; x=1721730650;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/G5+44h167VOsiaOPrdd9U616TrltprIHsWsocA1F5A=;
        b=XKpnIXvdDpaAyv3Va89m6wDuW3ghiOhVyg20ZDJ1AnmB6ekIDZpvAE0hCAqE4Lp+AC
         M5qx9AMGphsrERGXa3Zra2QeebGZu5XT9Qvv2ecQsYKp6WN9THPHm1YMpR+12Sy1+2L6
         OfMsCI9hFBrLl0XF2afbs+MG+5GxbAShIzc8WeK75gcCxrgwNrs3rrANJ3nHwmeHBGPY
         jQ/eIN2xS88vcgz6lOGpUfioVtpRWKF2wsD1R2N6w5f4JJ09IH068zG3wUayL7vi3lnP
         SmvuC6l9uQx5wDv6sB0w6pgbpsLKUlFhLXcOT6A4ejUfNOEWSsJ7O+CWZzKNu4nSflmq
         JuUw==
X-Forwarded-Encrypted: i=1; AJvYcCWoO1C+Bw+d94GO66uZIqrl+AeSGARRtnMK1PYmKuvHrXU2sn7pJtnkUJEdr9NZ1SB3OdNztMf15OcKgzZZJ8IzYOEQ5Aogxh90FroESAUfpIY=
X-Gm-Message-State: AOJu0Yz2ZWeaWiQwiz5B0E10Px/tuxSsDpeZ7LXY209DPYgVrAYXk1IH
	u6rpzRP2ncQ3jt71pY2sVT4G6JDSi33FFRmoibG8EHN9nWybUpjueppPGMNf9wo=
X-Google-Smtp-Source: AGHT+IF+j4vpd59rXfwJJpale0+2M2xjNcq85fj7Hc313ckK0UPmDoi685v/0yv7e97UdhOY9yZPEA==
X-Received: by 2002:a05:600c:1547:b0:426:6f5f:9da6 with SMTP id 5b1f17b1804b1-427ba697bd1mr9207585e9.27.1721125850521;
        Tue, 16 Jul 2024 03:30:50 -0700 (PDT)
Received: from claudiu-X670E-Pro-RS.. ([82.78.167.171])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-427a5e77488sm121546145e9.9.2024.07.16.03.30.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Jul 2024 03:30:50 -0700 (PDT)
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
Subject: [PATCH v2 09/11] arm64: dts: renesas: rzg3s-smarc-som: Enable RTC
Date: Tue, 16 Jul 2024 13:30:23 +0300
Message-Id: <20240716103025.1198495-10-claudiu.beznea.uj@bp.renesas.com>
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

Enable RTC.

Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
---

Changes in v2:
- none

 arch/arm64/boot/dts/renesas/rzg3s-smarc-som.dtsi | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/arm64/boot/dts/renesas/rzg3s-smarc-som.dtsi b/arch/arm64/boot/dts/renesas/rzg3s-smarc-som.dtsi
index 517ce275916a..82a80fd8e7ec 100644
--- a/arch/arm64/boot/dts/renesas/rzg3s-smarc-som.dtsi
+++ b/arch/arm64/boot/dts/renesas/rzg3s-smarc-som.dtsi
@@ -341,6 +341,10 @@ mux {
 	};
 };
 
+&rtc {
+	status = "okay";
+};
+
 &vbattb_xtal {
 	clock-frequency = <32768>;
 };
-- 
2.39.2


