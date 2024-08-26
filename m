Return-Path: <linux-renesas-soc+bounces-8310-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 165EC95F4FE
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 26 Aug 2024 17:26:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C2721282B8A
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 26 Aug 2024 15:26:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 30438194C62;
	Mon, 26 Aug 2024 15:25:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="gbldyVGl"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-lj1-f173.google.com (mail-lj1-f173.google.com [209.85.208.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3AD271946B8
	for <linux-renesas-soc@vger.kernel.org>; Mon, 26 Aug 2024 15:25:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724685949; cv=none; b=Miw9dLUmYxLqCtqHdy1bJ5h4pPTqJ4ArD0FqSSZApVOFga7K8SlE2ZQaIB/SOU4yB+R3B0w6x4b4akdWQYNEr4NElIC0w3vgSXc2sWAPiTeHlUZ6WjrxbK851na7iTm6uRUHozi+FFl3kk9+ja2aigo7fKXUTKIuy21dljrLvhA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724685949; c=relaxed/simple;
	bh=XWVC5HUqa4FOSOr6jFDlVoBbwf0lh/Ow1BEEkfWRRYA=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=uy2bcMn3zXC2i4aJixdn5AiBoqNaRMqD/UF4Re6kgSJEElDtKy8RW5dlCiCP5a6m/92D44AEHlzZ6NF9gsKoDO3YcvwaWI3jg9GXdhRrEHmDmrl5kGcaQJ1E2/UkAE0NVu4s+DzVtrk91qGRtdZJp01PLSegDE/LUnwLrClpGbo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=gbldyVGl; arc=none smtp.client-ip=209.85.208.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Received: by mail-lj1-f173.google.com with SMTP id 38308e7fff4ca-2f029e9c9cfso54497751fa.2
        for <linux-renesas-soc@vger.kernel.org>; Mon, 26 Aug 2024 08:25:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1724685944; x=1725290744; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4X7RWHf9c2Nsin/P0/MRWONZQiMlvlo7ShNISxGRapI=;
        b=gbldyVGlJeZfkyhrR68yz9aFdsGuOpqlIaqQo/94wYzFHVjo+tJVVbB5oHkrcafTUU
         GM7WQ3KRyNuMoA0IVDEBe2D6dq2vI7XQkIWJNokLZqLSlVSiLnUYtj+ZMdFdAGSs5j72
         zfQUN+EECMn8Q8xAtIiR3dRZ04xkeon+VW5Fkcu3HfDsYh4B1jgvdd2EUHnwExvyUxra
         zQj2BabNosdbC1tmhTa5n70iy1q3i3XagGiiUU7brPRcSwOpZg5eCvDHgEA4/VpQmCrp
         7yJEvqSkXD6EZY2DRaginvaTlZatcaRoijxuVMbmeGvMz9Vnw4oaOEJmEBfkicSb8aFl
         0zeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724685944; x=1725290744;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4X7RWHf9c2Nsin/P0/MRWONZQiMlvlo7ShNISxGRapI=;
        b=JvTtNIrIhJCdlK2YNZqwXxSZiiooQI9Ed/bk68SGfgcTxNVKOqUHd8mUZwv5g7FmEN
         xC8lV8WEQv7hGxZfrZ3TsTLmGulCUsnP4TuKvkaYkIci0S7QSU+LUGFG5gEmI5SiusOE
         ublKpXZitGKyzpbzeg7Nodz/msykYn9kP/platwltZ/07fLxTMU+S+p83iCdqCrygGjy
         pq8vUc92psfgsV7NJYrc56CCo5oPNUWbJhIvzoC7Vfxp9A/kr1HGcNKk4VZLoqoiI8nz
         o1jbAHWCNiCR0o9HVpm28HL5TCz0HXVyJT7d2TVtSDODmV5+FOD8egAC78hTtggHcJ8W
         b7CQ==
X-Gm-Message-State: AOJu0YywV8u6pV4wgQqlo1tz0FiQL9u4Wh9zjumWUVoFpJKdrNqEORl6
	WvaoY/Tt4vUV59oQ8bJCZSkzd51nPsY8XI6geg2WBETcNBwALseijAU8O/34xwQ=
X-Google-Smtp-Source: AGHT+IG/0Rw3KjFlXHyoNSA5O3duIeqvGmjekfYBFzagXObV7ksdyWtivPN8UapEZYUG+dChI+97qw==
X-Received: by 2002:a2e:b704:0:b0:2ef:2905:f36d with SMTP id 38308e7fff4ca-2f4f5750715mr71543281fa.16.1724685944207;
        Mon, 26 Aug 2024 08:25:44 -0700 (PDT)
Received: from claudiu-X670E-Pro-RS.. ([82.78.167.144])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a868f437d5fsm683005866b.99.2024.08.26.08.25.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Aug 2024 08:25:43 -0700 (PDT)
From: Claudiu <claudiu.beznea@tuxon.dev>
X-Google-Original-From: Claudiu <claudiu.beznea.uj@bp.renesas.com>
To: geert+renesas@glider.be,
	mturquette@baylibre.com,
	sboyd@kernel.org,
	wim@linux-watchdog.org,
	linux@roeck-us.net,
	ulf.hansson@linaro.org
Cc: linux-renesas-soc@vger.kernel.org,
	linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-watchdog@vger.kernel.org,
	linux-pm@vger.kernel.org,
	claudiu.beznea@tuxon.dev,
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
Subject: [PATCH 3/3] watchdog: rzg2l_wdt: Power on the watchdog domain in the restart handler
Date: Mon, 26 Aug 2024 18:25:29 +0300
Message-Id: <20240826152529.2080248-4-claudiu.beznea.uj@bp.renesas.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240826152529.2080248-1-claudiu.beznea.uj@bp.renesas.com>
References: <20240826152529.2080248-1-claudiu.beznea.uj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>

On RZ/G3S the watchdog can be part of a software-controlled PM domain. In
this case, the watchdog device need to be powered on in
struct watchdog_ops::restart API. This can be done though
pm_runtime_resume_and_get() API if the watchdog PM domain and watchdog
device are marked as IRQ safe. We mark the watchdog PM domain as IRQ safe
with GENPD_FLAG_IRQ_SAFE when the watchdog PM domain is registered and the
watchdog device though pm_runtime_irq_safe().

Before commit e4cf89596c1f ("watchdog: rzg2l_wdt: Fix 'BUG: Invalid wait
context'") pm_runtime_get_sync() was used in watchdog restart handler
(which is similar to pm_runtime_resume_and_get() except the later one
handles the runtime resume errors).

Commit e4cf89596c1f ("watchdog: rzg2l_wdt: Fix 'BUG: Invalid wait
context'") dropped the pm_runtime_get_sync() and replaced it with
clk_prepare_enable() to avoid invalid wait context due to genpd_lock()
in genpd_runtime_resume() being called from atomic context. But
clk_prepare_enable() doesn't fit for this either (as reported by
Ulf Hansson) as clk_prepare() can also sleep (it just not throw invalid
wait context warning as it is not written for this).

Because the watchdog device is marked now as IRQ safe (though this patch)
the irq_safe_dev_in_sleep_domain() call from genpd_runtime_resume() returns
1 for devices not registering an IRQ safe PM domain for watchdog (as the
watchdog device is IRQ safe, PM domain is not and watchdog PM domain is
always-on), this being the case of RZ/G2 devices that uses this driver,
we can now drop also the clk_prepare_enable() calls in restart handler and
rely on pm_runtime_resume_and_get().

Thus, drop clk_prepare_enable() and use pm_runtime_resume_and_get() in
watchdog restart handler.

Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
---
 drivers/watchdog/rzg2l_wdt.c | 21 +++++++++++++++++++--
 1 file changed, 19 insertions(+), 2 deletions(-)

diff --git a/drivers/watchdog/rzg2l_wdt.c b/drivers/watchdog/rzg2l_wdt.c
index 2a35f890a288..e9e0408c96f7 100644
--- a/drivers/watchdog/rzg2l_wdt.c
+++ b/drivers/watchdog/rzg2l_wdt.c
@@ -12,6 +12,7 @@
 #include <linux/module.h>
 #include <linux/of.h>
 #include <linux/platform_device.h>
+#include <linux/pm_domain.h>
 #include <linux/pm_runtime.h>
 #include <linux/reset.h>
 #include <linux/units.h>
@@ -166,8 +167,23 @@ static int rzg2l_wdt_restart(struct watchdog_device *wdev,
 	struct rzg2l_wdt_priv *priv = watchdog_get_drvdata(wdev);
 	int ret;
 
-	clk_prepare_enable(priv->pclk);
-	clk_prepare_enable(priv->osc_clk);
+	/*
+	 * In case of RZ/G3S the watchdog device may be part of an IRQ safe power
+	 * domain that is currently powered off. In this case we need to power
+	 * it on before accessing registers. Along with this the clocks will be
+	 * enabled. We don't undo the pm_runtime_resume_and_get() as the device
+	 * need to be on for the reboot to happen.
+	 *
+	 * For the rest of RZ/G2 devices (and for RZ/G3S with old device trees
+	 * where PM domains are registered like on RZ/G2 devices) it is safe
+	 * to call pm_runtime_resume_and_get() as the
+	 * irq_safe_dev_in_sleep_domain() call in genpd_runtime_resume()
+	 * returns non zero value and the genpd_lock() is avoided, thus, there
+	 * will be no invalid wait context reported by lockdep.
+	 */
+	ret = pm_runtime_resume_and_get(wdev->parent);
+	if (ret)
+		return ret;
 
 	if (priv->devtype == WDT_RZG2L) {
 		ret = reset_control_deassert(priv->rstc);
@@ -275,6 +291,7 @@ static int rzg2l_wdt_probe(struct platform_device *pdev)
 
 	priv->devtype = (uintptr_t)of_device_get_match_data(dev);
 
+	pm_runtime_irq_safe(&pdev->dev);
 	pm_runtime_enable(&pdev->dev);
 
 	priv->wdev.info = &rzg2l_wdt_ident;
-- 
2.39.2


