Return-Path: <linux-renesas-soc+bounces-9769-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C55199F32E
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 15 Oct 2024 18:48:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id DA4A82874AC
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 15 Oct 2024 16:48:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C737D1FAEE3;
	Tue, 15 Oct 2024 16:48:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="Iyxk7sIj"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D222F1F9EAF
	for <linux-renesas-soc@vger.kernel.org>; Tue, 15 Oct 2024 16:48:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729010887; cv=none; b=sngyNSgBCmxlrTvM5Lx5aHn9oX6G5YpaBWBf2grtwn7WeqcsD7l4+Xnby/VpL2YeuaQnlrmiQsUF9O2tdsbas5bkIkm0UtV1bmdATV3ve4rwtgDr5rd813UELKG/7nPB+Uwh0uNvO/CqXM0xj0ofXJM4mmHqr0pKvPENPe/PuQY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729010887; c=relaxed/simple;
	bh=aZbIwEcSSt0dH39z0JtBebgmt6ej6WRax9WCOwkWn7A=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=OW3yhUnYha1AlUOJzZ58MZ0YK/8FLOvRGbR2Dm3VKFksCd7D2/+fT7S+cygRDIBPwhXU64JfkmHzb6HeHWzLD7B3y/gWnjTmY9lq3MjiEbJ+uks3ZBQKaQz9k6R6RBFewV5GfdCB+0vICMAmAd1qOCy7iX9ZTwxa3CFah1P2tYg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=Iyxk7sIj; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-43111cff9d3so42382485e9.1
        for <linux-renesas-soc@vger.kernel.org>; Tue, 15 Oct 2024 09:48:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1729010884; x=1729615684; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=28BpXdSWTssZ0ypW72g+pbX5C7u5uJHyKQlEUMgzrGE=;
        b=Iyxk7sIjXaSAsyyoZ1RaMbriKuJ1rJ/3msj7gN2kWYB4tL2l/fC82dQKbNCq/mAozg
         vH8CuKjsqa02AuUETLA6SqDSKmnhyVELvAcXMsMvpoLSwHrBStCDvSywzrHHgXXMYhv0
         tZqgykih7RP+DVp7tMnbCfNnYOeUzemY3lItR6uAgO7NTUZ5q2nU8hBRKL/peVUaWoEX
         gu45pnsu1jlOSR5RM5ZYi8iVp8iZD1n+gMSKB1EpkIQB2oQ4irdi4hYTZNbr7Q0JY2Ds
         Mk38zUPiE19seAqepfsFax1S55k/NgdzPp0IEjAQn3Dkn+pO1l/TiDW/FtiQFFsrg8NT
         ESpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729010884; x=1729615684;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=28BpXdSWTssZ0ypW72g+pbX5C7u5uJHyKQlEUMgzrGE=;
        b=w/oq+ZfQm6Zd/Pridt7bjRy1Uki5ZyuB6Zamcp/nr3k4iVQ7XoLhjYG6luY1qqpIEJ
         9RgfyvUXwvLdNMyrCgKjuxVUjW0cNaE7ftcWi9lp+qM8pneq73AuFDBFVMjB2PVRwzt+
         lU+Olbys5qZdU9o83PEidv3QIqdvDrM0ittTMYtYAyxdNrRoLHvZTLpBRpHYvlHOSpTH
         eG4+gcoWEx1JnivUQdGaLJC4aKHRnm1Y0gp83GA7Ssnc3MLlz7fJC+nDWPECHWueiqAh
         R6kumvEbXs/uYnLtQIxVWAjSLTbv8s5LDJM9KpirR1091N9RGUKm4i3+wCoaf+d/kF2l
         NWsw==
X-Gm-Message-State: AOJu0YyUsvYMhrAuZ98nlALOYWxK8/pDl51Ukway24+fGSmUoTKa4nsl
	ncn+lrKDpLC+zg9rHu/QEBJTMZmZCMeXGJypTTn6u5qUHJv9vxLCA5JXUDP6xtQ=
X-Google-Smtp-Source: AGHT+IFV4hQGNWpr5pbDWtAVvd2BGrADLGqJrjGSGacjVgpHRTnrURCIxxyqQ9Q10icW6jWU2wR6Gw==
X-Received: by 2002:a05:600c:34cd:b0:42c:a6da:a149 with SMTP id 5b1f17b1804b1-4314a35ea0amr10487485e9.25.1729010884089;
        Tue, 15 Oct 2024 09:48:04 -0700 (PDT)
Received: from claudiu-X670E-Pro-RS.. ([82.78.167.23])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4313f56eab2sm22882045e9.26.2024.10.15.09.48.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Oct 2024 09:48:03 -0700 (PDT)
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
Subject: [PATCH v4 3/4] clk: renesas: r9a08g045: Mark the watchdog and always-on PM domains as IRQ safe
Date: Tue, 15 Oct 2024 19:47:31 +0300
Message-Id: <20241015164732.4085249-4-claudiu.beznea.uj@bp.renesas.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20241015164732.4085249-1-claudiu.beznea.uj@bp.renesas.com>
References: <20241015164732.4085249-1-claudiu.beznea.uj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>

If the watchdog is part of a dedicated power domain (as it may be on
RZ/G3S) the watchdog PM domain need to be powered on in the watchdog
restart handler. Currently, only the clocks are enabled in the watchdog
restart handler. To be able to also power on the PM domain we need to
call pm_runtime_resume_and_get() on the watchdog restart handler, mark
the watchdog device as IRQ safe and register the watchdog PM domain
with GENPD_FLAG_IRQ_SAFE.

Register watchdog PM domain as IRQ safe. Along with it the always-on
PM domain (parent of the watchdog domain) was marked as IRQ safe.

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
---

Changes in v4:
- collected tags

Changes in v3:
- none

Changes in v2:
- changed patch title; it was "clk: renesas: rzg2l-cpg: Mark
  watchdog and always-on PM domains as IRQ safe"

Changes since RFC:
- none; this patch is new

 drivers/clk/renesas/r9a08g045-cpg.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/clk/renesas/r9a08g045-cpg.c b/drivers/clk/renesas/r9a08g045-cpg.c
index a24cafcbc619..f5f454832bb5 100644
--- a/drivers/clk/renesas/r9a08g045-cpg.c
+++ b/drivers/clk/renesas/r9a08g045-cpg.c
@@ -267,7 +267,7 @@ static const struct rzg2l_cpg_pm_domain_init_data r9a08g045_pm_domains[] = {
 	/* Keep always-on domain on the first position for proper domains registration. */
 	DEF_PD("always-on",	R9A08G045_PD_ALWAYS_ON,
 				DEF_REG_CONF(0, 0),
-				GENPD_FLAG_ALWAYS_ON),
+				GENPD_FLAG_ALWAYS_ON | GENPD_FLAG_IRQ_SAFE),
 	DEF_PD("gic",		R9A08G045_PD_GIC,
 				DEF_REG_CONF(CPG_BUS_ACPU_MSTOP, BIT(3)),
 				GENPD_FLAG_ALWAYS_ON),
@@ -278,7 +278,8 @@ static const struct rzg2l_cpg_pm_domain_init_data r9a08g045_pm_domains[] = {
 				DEF_REG_CONF(CPG_BUS_REG1_MSTOP, GENMASK(3, 0)),
 				GENPD_FLAG_ALWAYS_ON),
 	DEF_PD("wdt0",		R9A08G045_PD_WDT0,
-				DEF_REG_CONF(CPG_BUS_REG0_MSTOP, BIT(0)), 0),
+				DEF_REG_CONF(CPG_BUS_REG0_MSTOP, BIT(0)),
+				GENPD_FLAG_IRQ_SAFE),
 	DEF_PD("sdhi0",		R9A08G045_PD_SDHI0,
 				DEF_REG_CONF(CPG_BUS_PERI_COM_MSTOP, BIT(0)), 0),
 	DEF_PD("sdhi1",		R9A08G045_PD_SDHI1,
-- 
2.39.2


