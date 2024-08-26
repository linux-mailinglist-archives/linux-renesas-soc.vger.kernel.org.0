Return-Path: <linux-renesas-soc+bounces-8307-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id B593F95F4EB
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 26 Aug 2024 17:26:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 71F3E282B89
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 26 Aug 2024 15:26:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1B8BA186E48;
	Mon, 26 Aug 2024 15:25:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="YIk6fmpm"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com [209.85.167.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F327A19408C
	for <linux-renesas-soc@vger.kernel.org>; Mon, 26 Aug 2024 15:25:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724685944; cv=none; b=Bx1uzd+cr79jk4fsO2EiXcnCIVv8zspYGqeF9uu1MHExWF5VKFybU7dhTyR4DqECBSTZHMDoMTscovmtYK+gYUyrkJTZmTCT5jrXYshnCFNT4Re0xO9SD2vv3h7Sy0JEBvppqHGWMY9js3L1MApi1WIFEVM5ON0g/ZiV4yTlZRI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724685944; c=relaxed/simple;
	bh=/DMKkyAX33V/uuPtD4o6lStnmjdqMZbSaNtMNVCkcFg=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=M09Z18CKGMIHuijcq3paEQbEEz+l0ZJhRX6la12h5WJjloQoCj/MWmTerhlPRLTJFHROXWKvXNdm545+zn2BZ2f/duS5N8qrP2X93vzlb8PnRUfwyEYz9qI6CXNPHezfRHk/tMTYtHkqRQ8M+DrK8AW9DXOOKtwPrszgmzkgpI4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=YIk6fmpm; arc=none smtp.client-ip=209.85.167.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Received: by mail-lf1-f54.google.com with SMTP id 2adb3069b0e04-533462b9428so7581246e87.3
        for <linux-renesas-soc@vger.kernel.org>; Mon, 26 Aug 2024 08:25:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1724685940; x=1725290740; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=WVZxPwWU6fTdIbk77ZAZBmOWFDE8RmLRjC5RiWd9L5I=;
        b=YIk6fmpm/iQe/kDeAf+huYnLY8U7zrRTJX5PXKokopJUU3BJ5Ga/DYDx2pSOpVteKf
         0angm6/wfHQZilQ8pogOcKw/1Co/qT3TLT/RvNX4GVPd2pBCEb5c16FlqV7aw86G8rhG
         vs9Ep3wKjsyqVrD4/2wTH9GJ0FhxhGP5CLjdp2EZidykc5WFi2qsO2DI2PuJEDIEA0sV
         uvhmXTYcTRkgH55DgJQx3P7C+owpRC5qawP7zfabiVQEhFQB9GORu+WgvSHXd5xtH0Cd
         IKJsCwylTc8UMq0ReR3Dg17tNVAhWZvJvvhylgnsfUumNdELCvN1X3AZtMSwuuzeHuM1
         hLBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724685940; x=1725290740;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=WVZxPwWU6fTdIbk77ZAZBmOWFDE8RmLRjC5RiWd9L5I=;
        b=WT0pPtbZ93kR16OMZp5QPOgsXAVuw14w5fgookdHacBWWHs3l6zNvMvoFReZEOnduA
         IQk9qx1LcEwMMv5DP/BoVUWbSTnnUrhBoEF6qVf+e/nrlwqXwwKQLxdu/7cu/NgDTLIV
         kDelu0kT+kLbV6IB+cPHFQk39L5b4J6l/fAJgB6qSK1DIqse4eKS6yXYlWjr+7y83AbA
         CYJC1brL5yYm3oGECwvA7cXqMnKfgWi2QgwRGbMoeG2FLeuYl5lT+kPvWrb+zjxzPmbO
         WoEeIrCaV15xfEzkZQuX9WScdQgl8sSIl9Edv+s5HCnXqWIdd1SmlZA+7dQ7n+9YL42a
         lBnw==
X-Gm-Message-State: AOJu0YxxHDJ78JiMXcBa7hArKI2G4QefLFPiDENfkyycDl8qQbc5zm56
	511xKk+2MBpC7O+66WPQyKiuxuqXMlZ4ELq+wk8YMTaj2DcCIrlfC0fV8O1KeUM=
X-Google-Smtp-Source: AGHT+IGqJgMZFTxRO1awmSGF6GW+2CPuDRMo7JmoLYQGXIKpOJ+edUP1SwWEqW7Tv6u077l7Xl+BJg==
X-Received: by 2002:a05:6512:b22:b0:52c:ddef:4eb7 with SMTP id 2adb3069b0e04-53438846f4cmr8424456e87.20.1724685939527;
        Mon, 26 Aug 2024 08:25:39 -0700 (PDT)
Received: from claudiu-X670E-Pro-RS.. ([82.78.167.144])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a868f437d5fsm683005866b.99.2024.08.26.08.25.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Aug 2024 08:25:39 -0700 (PDT)
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
Subject: [PATCH 0/3] watchdog: rzg2l_wdt: Enable properly the watchdog clocks and power domain
Date: Mon, 26 Aug 2024 18:25:26 +0300
Message-Id: <20240826152529.2080248-1-claudiu.beznea.uj@bp.renesas.com>
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

Changes since RFC:
- dropped patches 01/03, 02/03 from RFC
- adjusted power domain driver to be able to register the
  watchdog PM domain as an IRQ safe one
- drop clock prepare approach from watchdog driver presented in RFC
  and rely only on pm_runtime_resume_and_get()
- mark the watchdog device as IRQ safe

Claudiu Beznea (3):
  clk: renesas: rzg2l-cpg: Use GENPD_FLAG_* flags instead of local ones
  clk: renesas: rzg2l-cpg: Mark watchdog and always-on domains as IRQ
    safe
  watchdog: rzg2l_wdt: Power on the watchdog domain in the restart
    handler

 drivers/clk/renesas/r9a08g045-cpg.c | 43 ++++++++++++-----------------
 drivers/clk/renesas/rzg2l-cpg.c     | 13 +++++----
 drivers/clk/renesas/rzg2l-cpg.h     | 10 ++-----
 drivers/watchdog/rzg2l_wdt.c        | 21 ++++++++++++--
 4 files changed, 47 insertions(+), 40 deletions(-)

-- 
2.39.2


