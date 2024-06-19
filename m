Return-Path: <linux-renesas-soc+bounces-6495-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E52B90EA77
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 19 Jun 2024 14:10:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id AB10FB236E2
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 19 Jun 2024 12:09:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DB637140E40;
	Wed, 19 Jun 2024 12:09:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="HH/SuoGS"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com [209.85.218.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8DE1113E3F2
	for <linux-renesas-soc@vger.kernel.org>; Wed, 19 Jun 2024 12:09:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718798988; cv=none; b=sYix5JN10RBaY/9eYXzPsPxcU4jLB/voWsJusvGOAe1J5atY9ISSgK7f9Lvv+7XqQXbNCCr+BO8byXGED6w7OzQ8LaxCUQmHAkCBhObsnX24/s1JslMPH0MhPmhFbpjotWHrpcTlicB/CneQL4kO9H3z2kE8zetzRvIdT2x6dcU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718798988; c=relaxed/simple;
	bh=KLqszOBKq4UmcEK8dgplUQIW8Sbc/rgdmN5Zvo5C8vo=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=jMrqh4A5Mlob2WuRasSbm70l4hMcsy6KmgC5NvEIzX04292qiRnvAs2MImbqw08fICAeseeXTmgf63hFlrUUyeK/Gac4AwMjcl3fqB1AXMG4Mg1+FBSjpQfvvm4FkUVfiyHb5QV1eP2sOEhAAkh4d/ld6H6ittCntZhlcEZ5xRg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=HH/SuoGS; arc=none smtp.client-ip=209.85.218.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Received: by mail-ej1-f50.google.com with SMTP id a640c23a62f3a-a62ef52e837so838919066b.3
        for <linux-renesas-soc@vger.kernel.org>; Wed, 19 Jun 2024 05:09:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1718798985; x=1719403785; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=repF/9O8y233ry+RsrFhVhQxIwnZs5AMfgnT6lVaZq8=;
        b=HH/SuoGSfXZMTan3gmpSo/HF4q2FSJ0kzlVBGGaDVb5ofp+graaFrmv39ac42krIsz
         Myeqwg+nRL0fWvszjQ5/TXf8KCDnyGpQOvsS05I0sjvztM94fs4EjoFX6JBpQ459jCuO
         RjxP/SmKXglQhuFZPl9W/Nhpf5ABJ88SKO4K3XncNSRogXlY9FZ56/JxUsGHgt9kf3d8
         7X0Q1cic8Re2xgSr04WI4cNvMo5Kk8N9KHVNL2RSOOspvzL1lMp+l1OTO0WXmMYR/zUI
         x14jlnGEfKNSjWVN3FWUltFgF1RyPTJgtPghQjvyybmRFWJhtL+3XJhKV3Y94ZMjtyme
         WLsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718798985; x=1719403785;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=repF/9O8y233ry+RsrFhVhQxIwnZs5AMfgnT6lVaZq8=;
        b=va8fpzrfI1sYCtzL/3l6bx4sbymexq1Hsqtn19SsqdvMibGVbdXBuqhiTzv7ophd/j
         t5aEP8DIf0fOE9TOgLepyfJsW4WLGzGAZXKJqNyIDEk/tASx+DemZNh44PnMxLnWn/Um
         Bqd/lkpAYTIsChPExhW6iQzM9jfjjYPDVX+dblabkmChup/PKw4mNSI9uiKW27YIP04g
         K/qRe6PXmlxwUVJ+QPf9vtPQqFtfmhJ7nrL6bjva0GqJmRk5UadunF4ZFyZaeVhIi3Yb
         DCtC8Oar8lfTCYhkq+Jak0M7EbWJcxOO5dJRjvXtzTaXPWc3xx3sHg9/YJqYJ2KE4p5g
         Afew==
X-Forwarded-Encrypted: i=1; AJvYcCXYbjfjxGJJy5cU7lRNWeyI3jqVTl1uMrQCLBH69pBsgSODjCZpulvODKSkrXIURQBcoQNiYXj4E+YaHkJ/iiTyKoWWqKOAKQXK2GpNyjy/DMw=
X-Gm-Message-State: AOJu0YyIeBSANkYc2W97yqs36b2/s3bsNiFq+XVPPmH/YnmPsfONuvEq
	6v/YF7QnIL3G/HRwMFwQskf/6Q05us5MvmnyZ30WJhwSRQZAVe/QKUGUeCWOLPQ=
X-Google-Smtp-Source: AGHT+IEFsYgFlNsijCDzTIVv0iYZUa1HsZiHTq3BILY+nUISrrrwCJfk4oLG1DUHWcQA7IKgxnV5zw==
X-Received: by 2002:a17:907:c78c:b0:a6f:6063:6bab with SMTP id a640c23a62f3a-a6fab607200mr197334766b.16.1718798984925;
        Wed, 19 Jun 2024 05:09:44 -0700 (PDT)
Received: from claudiu-X670E-Pro-RS.. ([82.78.167.70])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a6f56da43fbsm659014066b.39.2024.06.19.05.09.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Jun 2024 05:09:44 -0700 (PDT)
From: Claudiu <claudiu.beznea@tuxon.dev>
X-Google-Original-From: Claudiu <claudiu.beznea.uj@bp.renesas.com>
To: ulf.hansson@linaro.org,
	wim@linux-watchdog.org,
	linux@roeck-us.net,
	rafael@kernel.org
Cc: linux-pm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-watchdog@vger.kernel.org,
	claudiu.beznea@tuxon.dev,
	geert+renesas@glider.be,
	linux-renesas-soc@vger.kernel.org,
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
Subject: [PATCH RFC 1/3] pmdomain: core: Add a helper to power on the restart devices
Date: Wed, 19 Jun 2024 15:09:18 +0300
Message-Id: <20240619120920.2703605-2-claudiu.beznea.uj@bp.renesas.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240619120920.2703605-1-claudiu.beznea.uj@bp.renesas.com>
References: <20240619120920.2703605-1-claudiu.beznea.uj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>

Restart devices (e.g., watchdog) may be part of a software-controlled power
domain. In the case of watchdog devices, if they implement the
struct watchdog::restart() API, this is called though:

kernel_restart() ->
  machine_restart() ->
    do_kernel_restart() ->
      atomic_notifier_call_chain() ->
        watchdog_restart_notifier()

The watchdog_restart_notifier() is called with local interrupts disabled
and SMP disabled (machine_restart() calls local_irq_disable() and
smp_send_stop() before calling do_kernel_restart()).

If the restart device (e.g., watchdog) is part of a software-controlled
power domain and this domain is off at the moment of restart, we need to
power it on before configuring the watchdog device.

Add the dev_pm_genpd_resume_restart_dev() function to power on a restart
device in these scenarios.

Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
---
 drivers/pmdomain/core.c   | 18 ++++++++++++++++++
 include/linux/pm_domain.h |  2 ++
 2 files changed, 20 insertions(+)

diff --git a/drivers/pmdomain/core.c b/drivers/pmdomain/core.c
index 83d978743659..d05bd72f6cfe 100644
--- a/drivers/pmdomain/core.c
+++ b/drivers/pmdomain/core.c
@@ -1540,6 +1540,24 @@ void dev_pm_genpd_resume(struct device *dev)
 }
 EXPORT_SYMBOL_GPL(dev_pm_genpd_resume);
 
+/**
+ * dev_pm_genpd_resume_restart_dev - Try to synchronously resume the genpd for
+ * a reset device
+ * @dev: The reset device that is attached to the genpd, which needs to be
+ * resumed.
+ *
+ * This routine should tipicaly be called for a restart device (e.g. watchdog)
+ * that needs to be resumed during system restart phase.
+ */
+void dev_pm_genpd_resume_restart_dev(struct device *dev)
+{
+	if (system_state != SYSTEM_RESTART)
+		return;
+
+	dev_pm_genpd_resume(dev);
+}
+EXPORT_SYMBOL_GPL(dev_pm_genpd_resume_restart_dev);
+
 #else /* !CONFIG_PM_SLEEP */
 
 #define genpd_prepare		NULL
diff --git a/include/linux/pm_domain.h b/include/linux/pm_domain.h
index 71e4f0fb8867..9f8ecfa0bf3c 100644
--- a/include/linux/pm_domain.h
+++ b/include/linux/pm_domain.h
@@ -347,9 +347,11 @@ static inline void dev_pm_genpd_synced_poweroff(struct device *dev)
 #ifdef CONFIG_PM_GENERIC_DOMAINS_SLEEP
 void dev_pm_genpd_suspend(struct device *dev);
 void dev_pm_genpd_resume(struct device *dev);
+void dev_pm_genpd_resume_restart_dev(struct device *dev);
 #else
 static inline void dev_pm_genpd_suspend(struct device *dev) {}
 static inline void dev_pm_genpd_resume(struct device *dev) {}
+static inline void dev_pm_genpd_resume_restart_dev(struct device *dev) {}
 #endif
 
 /* OF PM domain providers */
-- 
2.39.2


