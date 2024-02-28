Return-Path: <linux-renesas-soc+bounces-3308-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id DDD6C86AA00
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 28 Feb 2024 09:33:40 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 996B7289964
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 28 Feb 2024 08:33:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A2BAF2D610;
	Wed, 28 Feb 2024 08:33:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="ZM/U2kNr"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com [209.85.208.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E13E62CCB3
	for <linux-renesas-soc@vger.kernel.org>; Wed, 28 Feb 2024 08:33:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709109200; cv=none; b=tlFz4cG3ukh8EP0iCMl9lBX2tSH5SeL6eCvE/+zKWlcQBix6p7SbZ5gNi/pr1tCKKetkK9tJv48AOiCasqGV19MiSq1CgNWPgZMRGRvsUxGuw1BEZu2nXSNGsD/8E8o/QWQpcmUBFnU7C3jW+LaHTSKErnPR3ldL5U/pemTzD7Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709109200; c=relaxed/simple;
	bh=4KW2eteISFg901CtKgTrDBwePA4eC/YGUAT/SCGnHTs=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=iTc02kNEXKkTqFF3CDa2RJbXFIZtxim6htVkhblCItCFRhhb7f+0v74HjOO0g+JY4MaYKfm44E6JGBXuhH9AevUKQSCGq5TdFqLdtS/t/0BgOWps/Yqh7GUsR7B4KPgFGn9Ojqc9UCeCsFCpwbjxHvV+H4Ws8y1eOVK83QqIqyI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=ZM/U2kNr; arc=none smtp.client-ip=209.85.208.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Received: by mail-ed1-f46.google.com with SMTP id 4fb4d7f45d1cf-5645960cd56so6240874a12.1
        for <linux-renesas-soc@vger.kernel.org>; Wed, 28 Feb 2024 00:33:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1709109197; x=1709713997; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PnFYEJs3Iq+V6PjN2KZQWymEIOW45yt0wje1tPFg4A4=;
        b=ZM/U2kNrbg19oicg0+uF52u1KwzkGtSQE6bPraHG/u6xA7CkK/nVHrnQRpjOZDP8yt
         1wJiZUP97YwBEqbCmGALYnahyyxN3SN0STzct4OQAhZjpNTcsxFo/ygopK5XwXoxWq4x
         5hfVQuAOWtHgFQzNPlCRss0afFRFoo/bB4LHR8eKXKgutvig9wEXhBLvTkUa7pPLPNSS
         JQB3JVbvcqJsEWdOSuJTXOByFFrNWPGf/2M1m7nF+dL+JOnidcFfVtoYTsONCDsm3b4G
         +CpKXMaSfAyq1FZ7ztE2NeEqu3kRoveRVzP7f1j1Ejx7dJkhw3cIanx7sNvKIPa88hdY
         iDSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709109197; x=1709713997;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=PnFYEJs3Iq+V6PjN2KZQWymEIOW45yt0wje1tPFg4A4=;
        b=g0FKyO3WOE6Hoy8++25vPLW/Zr1yv8cAlzA0lA6+EcsFCEw15mCi3xW20uiCKFizoU
         SF55PJhC5q6UNCWeP3gQoEbNZKnn6NoWSRQ1kAti7RzTXpMvVdZ7Ttqf1uUP8OekQ7rU
         1jvo1NFcPgE71zxA8B8ovFnJQ29nZo6k0vDby0q62BLjo6FXNsjtAYusc7FOZv44d6mO
         ZM3WiH+vYKC1VMX9B8uBHeuAG60fho8yQauniS30ZbpNTtUM6OLRE54h4xzVwlQw+2P+
         /Q+PFXwt8a89ekcZJcYsGMgov2YxwdAD88D+vPFC6QjKTv2z6hMHZGZcTHWPlG+1i48m
         1PCw==
X-Forwarded-Encrypted: i=1; AJvYcCXT02mMeAvXOYhISbyhaS4ljmDF+YXh0evau0doKbvLIaTpWf5SQ1d+xi/wAr1e7OdG0f8pXWJPTP22nsy/AYenvmW9ZD+ja3vHanDa5JyeHDU=
X-Gm-Message-State: AOJu0YwS5ZTgAiGNGZ4YRYN+HtprpfpauHvgO/SSkcymCB5KHgWOm0ru
	t15B70Yl7aQeUpAITqAfkjzw4XFkunvnzh+bi99exeU+OvhFaqijG5K+S/8QE8k=
X-Google-Smtp-Source: AGHT+IGZRjze950xjJVA2VcumQb1pOfGPCAVAzPqLCiaxYnVRKaE4zgI53TtdNhF3uybSJmX0D29Ag==
X-Received: by 2002:a17:906:3b55:b0:a43:f927:4432 with SMTP id h21-20020a1709063b5500b00a43f9274432mr641705ejf.77.1709109197347;
        Wed, 28 Feb 2024 00:33:17 -0800 (PST)
Received: from claudiu-X670E-Pro-RS.. ([82.78.167.83])
        by smtp.gmail.com with ESMTPSA id qh16-20020a170906ecb000b00a432777eb77sm1593987ejb.60.2024.02.28.00.33.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Feb 2024 00:33:17 -0800 (PST)
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
Subject: [PATCH v8 02/10] watchdog: rzg2l_wdt: Make the driver depend on PM
Date: Wed, 28 Feb 2024 10:32:45 +0200
Message-Id: <20240228083253.2640997-3-claudiu.beznea.uj@bp.renesas.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240228083253.2640997-1-claudiu.beznea.uj@bp.renesas.com>
References: <20240228083253.2640997-1-claudiu.beznea.uj@bp.renesas.com>
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
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
---

Changes in v8:
- collected tags

Changes in v7:
- updated the dependency to PM || COMPILE_TEST to be able to
  compile-test the driver when compiling for a
  !(ARCH_RZG2L || ARCH_R9A09G011) platform and CONFIG_PM is disabled

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
index bdd1527bb916..cd2e29da7a54 100644
--- a/drivers/watchdog/Kconfig
+++ b/drivers/watchdog/Kconfig
@@ -922,6 +922,7 @@ config RENESAS_RZN1WDT
 config RENESAS_RZG2LWDT
 	tristate "Renesas RZ/G2L WDT Watchdog"
 	depends on ARCH_RZG2L || ARCH_R9A09G011 || COMPILE_TEST
+	depends on PM || COMPILE_TEST
 	select WATCHDOG_CORE
 	help
 	  This driver adds watchdog support for the integrated watchdogs in the
-- 
2.39.2


