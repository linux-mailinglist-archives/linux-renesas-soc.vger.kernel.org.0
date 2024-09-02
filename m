Return-Path: <linux-renesas-soc+bounces-8608-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 1929F9688AF
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  2 Sep 2024 15:24:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 71868B2282D
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  2 Sep 2024 13:24:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7F8B120FA8B;
	Mon,  2 Sep 2024 13:24:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="LmjjR7U3"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com [209.85.218.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 22CA420125D
	for <linux-renesas-soc@vger.kernel.org>; Mon,  2 Sep 2024 13:24:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725283460; cv=none; b=SsZsXrV7OCfAvebYhxP2dHXLMMdsgOUgYXLjYocVf2AKgiO1+Uw1R67GR42Bcq4KpklBrvazjq49YE1l3UjLdeFHvjXLjNqLsDjQ2l9vEnpa/iE3hajWwzt5qSiO+jBot86NhAG9WpslJioNsgTP4ja2fOOEYft/+4vfkC9F0tg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725283460; c=relaxed/simple;
	bh=Abxa8BkfsJuLjrDSm+JLHl1KZHPfBQ7Y/v/znoZjjdM=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=aI/TO/G11hyUSTJJJF6UCc60uD4lEMSX1tNvEuqQ/b4I0UTjhb1jqlbH0Dm3S61oUaRlnbh+rEGkn+TyvaAVHgTuWv1UDUXy4WmSkodJPwpzK4JIt65U2+5EGxXUKpNKcJZzxgrxdmgMhToEYY5Ege+PZl8McubXSYpzzxM80BQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=LmjjR7U3; arc=none smtp.client-ip=209.85.218.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Received: by mail-ej1-f50.google.com with SMTP id a640c23a62f3a-a86883231b4so510144266b.3
        for <linux-renesas-soc@vger.kernel.org>; Mon, 02 Sep 2024 06:24:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1725283455; x=1725888255; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=B2OrY7LmS5ARPSvD7Xeqfyw/hCUAImQblS8V1N5kgNU=;
        b=LmjjR7U3F9OKRrrq8tatiKAwO2QEiPY76JqPdLHfcOGML35uuFYi+cfYLHkKMafEyC
         Lwr7hKyD8mvcYeXibt5oL3Q+eQKGrhtNLUDJp9dhhwvgzlQwlLhJ57UFVIaM5UnQ/qg4
         xWneUuEcfl6NpC6EuOYCaSA6kHYbbCYCbEk3xp8es5ToHaLFWyJWnLgIknsQdnu1soSr
         tsiGMA6WantKS/atgqaq8XtbLp+Ss1s1I9SwCKu6R7vLdJP9iMibPU6wY7lUq2WIFz23
         7Zv6FMpC8UzenyAANOL2IO0HX2KtR4HeFNLJkriE/0Lx4W1LzNTTjtP9Um3rRI3miTru
         ZiQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725283455; x=1725888255;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=B2OrY7LmS5ARPSvD7Xeqfyw/hCUAImQblS8V1N5kgNU=;
        b=dFQ6QJiviNuJkVMdTKMon/tOCt2kRoVHUW245rdX85CTtNJcMLkpalEu8YbPVrm8qi
         0Ok8UHCP2kyGufA4kgMJ2wuXRebY4+5HkF8pKMBOOGz/FJUsga9eRglWqfb2YoBdjrbb
         E/G8pAiBgPAPmZOgklgqFjz6SyVqbZV/DCACnwRTCRtxSCICAUOJ6NFChBxV+LZla/Um
         lMs/l1Ddz45A7SQ9IvHiS2Dg2Q05dXJm1u3EdbOgL7/UI6f69syHGykmmaVzhXw/v76c
         F6q8pMXlRtKY41LQTo2WemMS9Io+dzmEIKrqaCRl5HMqNSJ1ea4SgiLmRfuZMTu2/tQt
         Sibw==
X-Gm-Message-State: AOJu0YwM2169wliMeo5dP1LNoHUpxDUqA2PP4IvhuliLCGJIlk91akll
	hNoxw65LFDvmDhn3am6yUpS1+86QQ6Kjk5FczapgMYfkJlCvb7gsWGVJe7ani1g=
X-Google-Smtp-Source: AGHT+IHq2+YTpWos8UI4QD8URbF/o1Hr+oJBrO2/y4dbGstIixrmAx2AK2gC4/Vkm+N+BUjHdjr3Lw==
X-Received: by 2002:a17:907:7e85:b0:a7a:aa35:408a with SMTP id a640c23a62f3a-a89d87821c7mr526219066b.25.1725283455134;
        Mon, 02 Sep 2024 06:24:15 -0700 (PDT)
Received: from claudiu-X670E-Pro-RS.. ([82.78.167.144])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a898900f6e0sm556060266b.77.2024.09.02.06.24.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Sep 2024 06:24:14 -0700 (PDT)
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
	claudiu.beznea@tuxon.dev,
	linux-pm@vger.kernel.org,
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
Subject: [PATCH v3 0/4] watchdog: rzg2l_wdt: Enable properly the watchdog clocks and power domain
Date: Mon,  2 Sep 2024 16:23:58 +0300
Message-Id: <20240902132402.2628900-1-claudiu.beznea.uj@bp.renesas.com>
X-Mailer: git-send-email 2.39.2
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>

Hi,

Watchdog device available on RZ/G3S SoC is part of a software-controlled
power domain. The watchdog driver implements struct
watchdog_ops::restart() handler which is called in atomic context via
this call chain:

kernel_restart() ->
  machine_restart() ->
    do_kernel_restart() ->
      atomic_notifier_call_chain() ->
        watchdog_restart_notifier()
          rzg2l_wdt_restart()

When the rzg2l_wdt_restart() is called it may happen that the watchdog
clocks to be disabled and the associated power domain to be off.
Accessing watchdog registers in this state leads to aborts and system
blocks.

To solve this issue the watchdog power domain was marked as IRQ safe
as well as watchdog device (as proposed by Ulf Hansson). Along with
it the clk_prepare_enable() calls from the watchdog restart() handler
were removed and all is based now on pm_runtime_resume_and_get()
as explained in patch 03/03.

Series contains also power domain driver changes to be able to
register the watchdog PM domain as an IRQ safe one.

Initial RFC series for solving this issue was posted at [1].

It is safe to merge watchdog and PM domain driver changes though
different trees.

Thank you,
Claudiu Beznea

[1] https://lore.kernel.org/all/20240619120920.2703605-1-claudiu.beznea.uj@bp.renesas.com/

Changes in v3:
- added patch "clk: renesas: rzg2l-cpg: Move PM domain power on in
  rzg2l_cpg_pd_setup()"
- addressed review comments
- collected tags
- per-patch changes are listed in individual patches

Changes in v2:
- adjusted patch title for patch 02/03
- adjusted description for patch 03/03 along with comment
  from code

Changes since RFC:
- dropped patches 01/03, 02/03 from RFC
- adjusted power domain driver to be able to register the
  watchdog PM domain as an IRQ safe one
- drop clock prepare approach from watchdog driver presented in RFC
  and rely only on pm_runtime_resume_and_get()
- mark the watchdog device as IRQ safe


Claudiu Beznea (4):
  clk: renesas: rzg2l-cpg: Move PM domain power on in
    rzg2l_cpg_pd_setup()
  clk: renesas: rzg2l-cpg: Use GENPD_FLAG_* flags instead of local ones
  clk: renesas: r9a08g045: Mark the watchdog and always-on PM domains as
    IRQ safe
  watchdog: rzg2l_wdt: Power on the watchdog domain in the restart
    handler

 drivers/clk/renesas/r9a08g045-cpg.c | 43 ++++++++++++-----------------
 drivers/clk/renesas/rzg2l-cpg.c     | 38 ++++++++++++-------------
 drivers/clk/renesas/rzg2l-cpg.h     | 10 ++-----
 drivers/watchdog/rzg2l_wdt.c        | 20 ++++++++++++--
 4 files changed, 56 insertions(+), 55 deletions(-)

-- 
2.39.2


