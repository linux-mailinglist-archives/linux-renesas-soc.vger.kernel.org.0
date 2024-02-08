Return-Path: <linux-renesas-soc+bounces-2454-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 7981B84DF2D
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  8 Feb 2024 12:04:50 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 098F9B2AA92
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  8 Feb 2024 11:04:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 009B2762D3;
	Thu,  8 Feb 2024 10:58:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="KgVSImEb"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 244A06F08C
	for <linux-renesas-soc@vger.kernel.org>; Thu,  8 Feb 2024 10:58:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707389908; cv=none; b=MDOlPrZLOOXA3vr5hj5BSYubUNvP/Fb/AkdYkksN0LJEA4WAijl7cIn0DDyg/mvnkQszpjlQB3H6c0RNwGwXwwszLdcBcRExziPFKbUu4E+PTeUGHTRnpX67ElIf1JtvJmLZ2C4ya1csJ2acg6GfF8QbZOg7OQ6kysp3ATqgiic=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707389908; c=relaxed/simple;
	bh=S7S9sqQ3ggEg18SOFOed2Jym7q/ivWFzaRP6SFRCjV0=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=pNQ+EHPjvZF0jfwWAm7sb0Gpqr9HOEYeuZQmCWdjj0gp6YNFv8/iHDqjSkfnBJXtELWf64HPzJolfvcb7KeaZubMrEQdblMp1tp3uJ9AC4vjmCwekmLOL9PkUCkdy3lRQRCvCqkwJ9VVTIpzU40nJB+Szbsy4FdwFotRm6RkO5E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=KgVSImEb; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-4101565d20bso14085975e9.2
        for <linux-renesas-soc@vger.kernel.org>; Thu, 08 Feb 2024 02:58:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1707389905; x=1707994705; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XZrX8iqhyNfDwckgzPgw0FurzK0Uc4mk39O6wr0LL+Y=;
        b=KgVSImEbOiSfwJ5aT4udSK1ICrUMSk3aalVCnbs9vNJXsQF4xri8YgoRL32C45KSnX
         djijS4Dl34W2s9KvDK4gW8BWN+yXl7aEI4PGAnsEGCJhgJ/kCaO4qNg8b+k7RfTnkAWH
         1vs/ArUIIUqshrJx7M0RBRx6jcg0FnLbfb3LDiavdS5uk18/b/JOkQKS4owm+KL8UsBw
         ZhmHGt1feqL2NQgpwW185YYrwitvE1dFiKJugb3IUNVd2rad+WGaEkZYcwXw7zvuV/yU
         RbnQFpi4VRn5WC/zBIw8ag0iyg05eX2jbSN1SDaKgWWvzNs+A7v80UGLOwqLNvD3afTj
         KPYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707389905; x=1707994705;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=XZrX8iqhyNfDwckgzPgw0FurzK0Uc4mk39O6wr0LL+Y=;
        b=aFA0YaPFqGBmWZguANim04M4GqNInD5xQxNm7v8W6fVMaPDVdapo9K1ODBTwmU7j7f
         RTXb1oqi6p94S6srNqS5lFY5vmmy3cFOpwX0iEp4Too3EX5DRRKvxYgbKJ+fOBolqrmG
         uyZD7WWuw39UPGieCN40ycnH03JOgkImhNBonwf8QzXIpXJIwVGcYQjBIZj3sp3RRb9l
         Nr1GYjVSbwlKZan2elG3+uboJqODBgnRNVyFpTYnv+S5SbRFNe3s95IB6pjwM6QiHTg4
         wvrVf5jWU9sc0Uq4cBWCw82XEx7kFKrpvmbPDvf2K+3vMGG7WxcAkCA68i0X++mTty47
         bqCw==
X-Gm-Message-State: AOJu0Yx7kR0XoIzArel1Woo2AEk8F5sW0yfKRngfZgvuZ1QcXO562xxg
	ThaWgYERshBa84laGSlQ0e31/+M+pbEuk2sv162H2o9Z9qfdBrX0L+fuB2Fxaz4=
X-Google-Smtp-Source: AGHT+IHiKa2aWVvZ5wWM6BN18KnaYPFH9sH4LdgZNJ7HWsICnd5UzUFy0FJPu7XOFaXbko3RH8QsUA==
X-Received: by 2002:a5d:4a85:0:b0:337:67e:a1ef with SMTP id o5-20020a5d4a85000000b00337067ea1efmr4985765wrq.7.1707389905201;
        Thu, 08 Feb 2024 02:58:25 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCU20IlnCTOKR9u10hKgbo977Fd4kc/KrktWXzWiEVdvqwJos7ihokRR4V25Yjwwzj3pEkR+XiHqdj15tWkUkMWpBbYelizf0i+jTbETSNcSLQ9qGo/4NafuqgpzCK2g9x8AZrdg0Byt5/rT8xS7NlNfSrG44jwnG+CodWrootFCZfBQSe+dXrtD44kyrafmAw2sRxLa/ZrmYoXF7jSkvdE6Clf0V2HzggIX38HwWffmYH4dQnbdea2FfM2pgW8qHzCTORMrYVESe9NpAOFcmYEN+b0rw9c7ZGEaE6KlxQLR8KJe+/ce7e+uaICTwdJjSikQoeRKVrCSS/z4fiLGsw8hLkvq0Wwzi3A12u/J+xmg3gXAwps2xHHzfcdh2juaykhW50cze6F3214BOzBa7KlUXpwWU4QzgQ+Xhu8ek8EM3hqQFcpCHt2HzNnm0QRR7eUg5ROdfgqIAKvFngluv3vCeN5x9nneL2kkv6ryhhvxdaTB2aMz+PqslZOnA5j00tuMEXorAcEugQ==
Received: from claudiu-X670E-Pro-RS.. ([82.78.167.45])
        by smtp.gmail.com with ESMTPSA id a6-20020adffac6000000b0033b4a52bfbfsm3344153wrs.57.2024.02.08.02.58.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Feb 2024 02:58:24 -0800 (PST)
From: Claudiu <claudiu.beznea@tuxon.dev>
X-Google-Original-From: Claudiu <claudiu.beznea.uj@bp.renesas.com>
To: wim@linux-watchdog.org,
	linux@roeck-us.net,
	robh@kernel.org,
	krzysztof.kozlowski+dt@linaro.org,
	conor+dt@kernel.org,
	p.zabel@pengutronix.de,
	geert+renesas@glider.be,
	magnus.damm@gmail.com,
	biju.das.jz@bp.renesas.com
Cc: linux-watchdog@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	claudiu.beznea@tuxon.dev,
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
Subject: [PATCH v6 2/9] watchdog: rzg2l_wdt: Make the driver depend on PM
Date: Thu,  8 Feb 2024 12:58:10 +0200
Message-Id: <20240208105817.2619703-3-claudiu.beznea.uj@bp.renesas.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240208105817.2619703-1-claudiu.beznea.uj@bp.renesas.com>
References: <20240208105817.2619703-1-claudiu.beznea.uj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>

The rzg2l_wdt watchdog driver cannot work w/o CONFIG_PM=y (e.g. the
clocks are enabled though pm_runtime_* specific APIs). To avoid building
a driver that doesn't work make explicit the dependency on CONFIG_PM.

Suggested-by: Guenter Roeck <linux@roeck-us.net>
Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
---

Changes in v6:
- update patch description
- fixed the dependency on COMPILE_TEST previously introduced

Changes in v5:
- updated patch description
- added on a new line the dependency on PM and COMPILE_TEST

Changes in v4:
- s/ARCH_RENESAS/ARCH_RZG2L || ARCH_R9A09G011 due to patch 1/9

Changes in v3:
- make driver depend on PM; with that the "unmet direct dependency"
  Reported-by: kernel test robot <lkp@intel.com>
  was also fixed
- adapt commit message

Changes in v2:
- this patch is new

 drivers/watchdog/Kconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/watchdog/Kconfig b/drivers/watchdog/Kconfig
index f6cb63a0d889..8bd87880ca3b 100644
--- a/drivers/watchdog/Kconfig
+++ b/drivers/watchdog/Kconfig
@@ -911,6 +911,7 @@ config RENESAS_RZN1WDT
 config RENESAS_RZG2LWDT
 	tristate "Renesas RZ/G2L WDT Watchdog"
 	depends on ARCH_RZG2L || ARCH_R9A09G011 || COMPILE_TEST
+	depends on PM
 	select WATCHDOG_CORE
 	help
 	  This driver adds watchdog support for the integrated watchdogs in the
-- 
2.39.2


