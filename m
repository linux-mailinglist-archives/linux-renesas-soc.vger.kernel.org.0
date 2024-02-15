Return-Path: <linux-renesas-soc+bounces-2836-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C06C85655A
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 15 Feb 2024 15:09:16 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 3E6B71C239F9
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 15 Feb 2024 14:09:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4C6FB131E5D;
	Thu, 15 Feb 2024 14:08:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="liuXrxrZ"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B3E6131E27
	for <linux-renesas-soc@vger.kernel.org>; Thu, 15 Feb 2024 14:08:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708006136; cv=none; b=i9jsSPm3yqITGMZKzjC7Z37jyjWxo+jOQJWHJwknu+qKb1auzK5UheX4UWS64h9u2ZOW8hBRNUoq8qoaBEI3K7XA40075g7VuM0RIkozM8zVo4UR0igYkqOt43tasHcCh22PVHzg9dnD9DeAzb5SFzG7ea8G7tx59pJHp/tEMSc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708006136; c=relaxed/simple;
	bh=Fchmw8nbRjmpEgAKFhZiNFS9q3+KuEr6rfwjI5iiBZU=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=VpTpTQ1wTt9njQeiqP8cmfxY+mSHTrKsN7Omx8q9qH8B/SvmeODum1SwYDITtxHwbpLeJia0gWXOrd09pF+M+mVbKQU/rMHs2zBc+CO+5/j7Iw6cSjIjLhfSNHH/hpRGe1rp0/qk285uwauJarHdbsUnssqz343E0tMAZDtLIME=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=liuXrxrZ; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-41223e0777dso3520165e9.2
        for <linux-renesas-soc@vger.kernel.org>; Thu, 15 Feb 2024 06:08:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1708006131; x=1708610931; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RbA8yw86zJThN045X0EtpFQpuxqOp8ZxTfaBxRUnlZA=;
        b=liuXrxrZbGTmFmdmO8OCtao8eGk7LPGk4SvNvIU+FaBDtT9LxhieVnL+kCalPxban1
         s1WIbgYoppQ6te8iRs/Z5WbtGskXiAbFlwZcB7eLYC8Sri/ax9l4yxOdlFi54S9d3D0k
         cR8xf0H8g6f0/KQTDYoWg+q0Jol5KZdFZWj2XoT2rr4oAPykgEI05NzM1tRLGEbDl3Kg
         LtOKuXAksdSAAFTKnLq3/9J/mGw7fbIWRxYalMXiqXUsiu03NZIQlryJJG1EbQzWblWn
         sqo99ljpoyAhNdk9b+BiQ34xwbMcRWd+WDnrU559pt0vxzyNZlPQ3UKBn82TMKG6Qwxf
         FWEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708006131; x=1708610931;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=RbA8yw86zJThN045X0EtpFQpuxqOp8ZxTfaBxRUnlZA=;
        b=i/Tj4yhx/clHbzeK6QQA3SoOgLnSugW0XAFqpyXI6vwkpBDfC+v75yAoW0m2EZ+lQL
         JTz3PfnPZD6ei/04D70QgsHqSJ1zS54Rjgt5E8t8i5vEMflcgn6Wu74iPleyt31qrFgz
         PzLXm0YP3QJOW0NZQL0k7I0ZvYZ148vxt8cKesT209E/VzcY5jYzp8X+rXc/ejc+5xs0
         NqFpCy0URmrjNMZi+GQVAbPVVBO9FiEiJAn8d2ds5li/CgV5AMd7zGah9naEs1I07uv7
         2ozhCWuDDNNd0k5r9C6lFpwmPLF6z3oCaj3OVefYB2iABFPum4UaVNPmO23w5IJitJus
         Hueg==
X-Forwarded-Encrypted: i=1; AJvYcCXOapG0H1cIo5ta6LBbtMQl4d9LgPrvmi+ocNS0vXiW+Saodc39PWzxY3XlwBIs41cM163/V7DMh+STWmnogBeyubYyd/RWcyH7yvdja30wOB8=
X-Gm-Message-State: AOJu0YxHyPesO2o2bNHtVtOUST8DJqfFuxBoWZUke2aLY1N4PhhntZNc
	+oX7+jXFVjZznhKWZRSG7Q5Dn/h8ARytVyp7NtItdX/C9DutaOEFScVmKiB86Vg=
X-Google-Smtp-Source: AGHT+IFTyqQpVU/Xoz3zL+teKHGSJqj243sHJATELpm2c6EfTLcTyw9sq8/JlXGwStZDpE18lQp5LQ==
X-Received: by 2002:a05:600c:3b9a:b0:411:50aa:1106 with SMTP id n26-20020a05600c3b9a00b0041150aa1106mr1598084wms.24.1708006131495;
        Thu, 15 Feb 2024 06:08:51 -0800 (PST)
Received: from claudiu-X670E-Pro-RS.. ([82.78.167.20])
        by smtp.gmail.com with ESMTPSA id h17-20020a05600c261100b0040fe4b733f4sm5120950wma.26.2024.02.15.06.08.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Feb 2024 06:08:50 -0800 (PST)
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
Subject: [PATCH v7 1/9] watchdog: rzg2l_wdt: Restrict the driver to ARCH_RZG2L and ARCH_R9A09G011
Date: Thu, 15 Feb 2024 16:08:33 +0200
Message-Id: <20240215140841.2278657-2-claudiu.beznea.uj@bp.renesas.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240215140841.2278657-1-claudiu.beznea.uj@bp.renesas.com>
References: <20240215140841.2278657-1-claudiu.beznea.uj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>

The rzg2l_wdt driver is used only by ARCH_RZG2L and ARCH_R9A09G011
micro-architectures of Renesas. Thus, limit it's usage only to these.

Suggested-by: Biju Das <biju.das.jz@bp.renesas.com>
Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
---

Changes in v7:
- none

Changes in v6:
- none

Changes in v5:
- none

Changes in v4:
- none; this patch is introduced in v4

 drivers/watchdog/Kconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/watchdog/Kconfig b/drivers/watchdog/Kconfig
index 4700b218340f..bdd1527bb916 100644
--- a/drivers/watchdog/Kconfig
+++ b/drivers/watchdog/Kconfig
@@ -921,7 +921,7 @@ config RENESAS_RZN1WDT
 
 config RENESAS_RZG2LWDT
 	tristate "Renesas RZ/G2L WDT Watchdog"
-	depends on ARCH_RENESAS || COMPILE_TEST
+	depends on ARCH_RZG2L || ARCH_R9A09G011 || COMPILE_TEST
 	select WATCHDOG_CORE
 	help
 	  This driver adds watchdog support for the integrated watchdogs in the
-- 
2.39.2


