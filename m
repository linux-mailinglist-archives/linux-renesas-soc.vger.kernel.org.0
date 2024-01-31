Return-Path: <linux-renesas-soc+bounces-2113-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 25622843C26
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 31 Jan 2024 11:21:11 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 6177DB26710
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 31 Jan 2024 10:21:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C66B96A027;
	Wed, 31 Jan 2024 10:20:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="Pg9cCo5w"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com [209.85.218.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B5A569979
	for <linux-renesas-soc@vger.kernel.org>; Wed, 31 Jan 2024 10:20:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706696434; cv=none; b=dmQhHheJ1vgjRwZTAf5egAMnB16ZeOgoLGcTk/zcn4W/n5hmmcSRnzhqNxDOU/iM79B2Zvsr/xd5d34epG9O6PBxy0+11vensMBIWsfyrAjDf0uYzjtCekf7an55GrJbkv7+VFW1J0yf2Am7uo8vg861qXpL8Gye+CO5Swm0ZAg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706696434; c=relaxed/simple;
	bh=oE5h6rY9x2tGBQVchOg35/O8P8LJYFf57f/PwB4KFbQ=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=e2zhRGc1MJHmoENvhTKRZDCkfpRLz09cNv0IFBZE/cPQB8hMmMNnP6Hxvm/HBcwaaaas6ALBnpq1mm2mucvkGPVVVMlogq853UTwUOtFfnbp5g+iru9Ag9EnIjYkMaDPXI/j4muNyvtbgV+Bs+T7njo8bp9x0yjI47+Ds8GQ8XQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=Pg9cCo5w; arc=none smtp.client-ip=209.85.218.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Received: by mail-ej1-f43.google.com with SMTP id a640c23a62f3a-a359446b57dso425063066b.3
        for <linux-renesas-soc@vger.kernel.org>; Wed, 31 Jan 2024 02:20:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1706696430; x=1707301230; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cWlqSYVWXt5E/so3s3DVsM24TfFqYzGuXtgHed/wp8s=;
        b=Pg9cCo5whVGCPrI1h6Ugn6aINl+R1r3uzw4Ux9+JVFxGjoSbqT56X+nByGCCxBSLi/
         9OUQqHjJEd/slrg+MnVv8e3IYPQn0n7FNQesxKZTwTJD/PHnpB3yZMeCekhJw8tcK54/
         7Rk+1nuZqllNj+uMHEJ9FErxTve/XVeNzmNgmDzl8TKm+SojnGxIJFhqzk3fePYv9Cun
         UWnCSUoyt6gNMTi+BLQY0dYN8JDorldB62XgGXi9UQeTJ7fzGtdyxI9ZisdkFyKzYG9/
         LRH31dnStthHvgj3HCV7Rtw2orw9pm6ld8xtyjyitjua0KQlxTNtubRBh5mhof3xkrGI
         GZuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706696430; x=1707301230;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=cWlqSYVWXt5E/so3s3DVsM24TfFqYzGuXtgHed/wp8s=;
        b=qSaUY1SrFdoaqo+2ygfRSnyft1jP8RRhD2QWLCiSPQGexciqwC8hyT5GNsDIRWkYMo
         0WaKsXFL3PaUaIQvU3AbhghMTx5iUGLyshiSCLQYZhlQAlddx+Z4aWYVgNsPodFdeD0y
         wFakcfDrx6s17WDskBZT2U7AjkeSsqoY0i/Pzv4LRm8+OG+Gcm+77DgX4Y1fXB++RC07
         w+2rJh5tb+kIt2YxZybz/6BIDq6SynFUpnGALTLREHshr/EqvsdvKXXH+LdaoIqcFshn
         s/FcKrHY5UhST00B7psopGoz+MEHVXVTUO+cpFf7UqVpjqAvjZYk3nvnPEANDZr+qmxO
         byrQ==
X-Gm-Message-State: AOJu0YwrOMfS4dPXtOQVs/sqUFvuboxH1uuadIxcDUXDyju0uqVTntTA
	kd4WrWaXDaRgImsfy2Qj761rqXiNhpj8APUepFE09CtNLTDH/iH8xV5Y7EyH7FM=
X-Google-Smtp-Source: AGHT+IEkBPX0RB46Y+mzBkMyZp5TJ/mY/ycL6/YMwrbMHqhH1xrh8VAu+2o9p9g6kPEAGsMlAOeU9g==
X-Received: by 2002:a17:906:2511:b0:a36:8d18:4c23 with SMTP id i17-20020a170906251100b00a368d184c23mr345341ejb.11.1706696430161;
        Wed, 31 Jan 2024 02:20:30 -0800 (PST)
X-Forwarded-Encrypted: i=0; AJvYcCV1Ri1NVLh0NF5zlUaVk2LHboPFKt3vlX5nUZsfLUp8tfHumWoZsFReo2sckPYwFpztR0dhc/i/AzIS1SgQThJAAT8xhaV2eyz/8uaAX9i+MxzAMDTGiIxJx/ZBgukcQsrpQO7YFc2maiQNWUHrW9Z1gzDs6auk1cSHE4JgFEb3S0XHSQMC797OzoOuBVeMkkvOtaiGPJSDut0wixUE+I4Ge8VlS1+MQJqyka3A9hZCUaxbR3xlhlPXmJz9jy7MK9BsayDmaQ59Cjbx+95l0qmfpkilxhAc+CItk1amXZLDJagZ8LksjARqf05noT9rvFDsejY5UR+9BraUA1P+isPYrib6pE+o/hEi9V4inqT+ocI40qzJ2rqjbhoylihNjjMYpC4dRoVAiQAxrSscQYbeYIC8MvaQFU3sJ2QzCo96E8Tkqk9I+MDSlZ+tycATmiePuE/Imr6r6jjX9KrYpXS1gAJSg1syvFoSHnQjo8BOS1p0xLEdc+Kf5CMDfZF8daMrT90sgI8NxG9qt4FwqHo5rZQFiOvptavSv66oURwSOuOvbsSJhXLohaOas5XyJToTOR2UkHi99fugqwlOIKWtYajk527FODjYHf+RRs8TAmM=
Received: from claudiu-X670E-Pro-RS.. ([82.78.167.87])
        by smtp.gmail.com with ESMTPSA id vk6-20020a170907cbc600b00a3524be5a86sm5212966ejc.103.2024.01.31.02.20.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 31 Jan 2024 02:20:29 -0800 (PST)
From: Claudiu <claudiu.beznea@tuxon.dev>
X-Google-Original-From: Claudiu <claudiu.beznea.uj@bp.renesas.com>
To: wim@linux-watchdog.org,
	linux@roeck-us.net,
	robh+dt@kernel.org,
	krzysztof.kozlowski+dt@linaro.org,
	conor+dt@kernel.org,
	geert+renesas@glider.be,
	magnus.damm@gmail.com,
	mturquette@baylibre.com,
	sboyd@kernel.org,
	p.zabel@pengutronix.de,
	biju.das.jz@bp.renesas.com
Cc: linux-watchdog@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	linux-clk@vger.kernel.org,
	claudiu.beznea@tuxon.dev,
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
Subject: [PATCH v2 02/11] watchdog: rzg2l_wdt: Select PM
Date: Wed, 31 Jan 2024 12:20:08 +0200
Message-Id: <20240131102017.1841495-3-claudiu.beznea.uj@bp.renesas.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240131102017.1841495-1-claudiu.beznea.uj@bp.renesas.com>
References: <20240131102017.1841495-1-claudiu.beznea.uj@bp.renesas.com>
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
a driver that don't work select CONFIG_PM.

Suggested-by: Guenter Roeck <linux@roeck-us.net>
Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
---

Changes in v2:
- this patch is new

 drivers/watchdog/Kconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/watchdog/Kconfig b/drivers/watchdog/Kconfig
index 7d22051b15a2..495dcd1c5139 100644
--- a/drivers/watchdog/Kconfig
+++ b/drivers/watchdog/Kconfig
@@ -912,6 +912,7 @@ config RENESAS_RZG2LWDT
 	tristate "Renesas RZ/G2L WDT Watchdog"
 	depends on ARCH_RENESAS || COMPILE_TEST
 	select WATCHDOG_CORE
+	select PM
 	help
 	  This driver adds watchdog support for the integrated watchdogs in the
 	  Renesas RZ/G2L SoCs. These watchdogs can be used to reset a system.
-- 
2.39.2


