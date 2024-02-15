Return-Path: <linux-renesas-soc+bounces-2835-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 8FE81856554
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 15 Feb 2024 15:08:57 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 43D591F22A12
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 15 Feb 2024 14:08:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8FA92131E28;
	Thu, 15 Feb 2024 14:08:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="YvCDdk2a"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D34C131752
	for <linux-renesas-soc@vger.kernel.org>; Thu, 15 Feb 2024 14:08:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708006133; cv=none; b=BroWR9ZyYRVaSofj/0bQ1RRn/eUO1BfGFBI83+87Myr0+txfu+II87GGRE9eqLZ/S1gI8x7aQ65OQF8TLDol1V3yevJgjwkZmVgvsluvPfclfYtWzS3hYYd/uDmAle83BQnoMjTDazo7DrAj6OznIQWIE/awUvqWPBygVNUiNPE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708006133; c=relaxed/simple;
	bh=L8O1mWWSllZ6RlPqEmnfhMz1g4yePzxQNQ5ZXSD5H4k=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=D4u6UnpjcyZWaIPJnxEEVH3r2+Qh4ktKdJgn1AAm3a/xb0/WFa64ADZHG1fr4J5viDScBvxuN/AzsIxxPsbfTy+HfMjnx+wdj3M5fyYCHTotgjqjT0I5nLuYlFz2PA+N0TNWPv6G62FO8UIykM0nUFhIPEJbLC0Vqn+Lyo87ARc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=YvCDdk2a; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-412191ed8aaso4514265e9.2
        for <linux-renesas-soc@vger.kernel.org>; Thu, 15 Feb 2024 06:08:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1708006129; x=1708610929; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=df2ADpZm3CQ1dJL2XNQWBN6OYrn3i+pXZ1rw7MP/SYA=;
        b=YvCDdk2aCJAQusvsKF3K47i1nP62Te91CGDkhEmPVhZ05+DYgpON7i2M7DuRRS53Eq
         GErXu5BqO3pzV+XwhsS8lDh5jnWIBXz4xxQeXGfCvFH3ZkrorR28rtPnY7yo6cwwCVF+
         krHUQ8EcS/gGfx9BAFI8/gIMCwfOjrWU4lpbAb/lWNI0rhCWX0vIePiY6beSE4cgIJNV
         fsjuM2dMc0LCAid11jpso0sRHrCOI5TwA7IKt/HV9s14seqC1OA3MHXZqsXvSl1u/KQe
         4MqWgtzd8+Pt/ElkFyXyVJg7QvponK311HKlRvgX8dBdINn3LZGxx0YmIj99/VYnwjjq
         6Ovg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708006129; x=1708610929;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=df2ADpZm3CQ1dJL2XNQWBN6OYrn3i+pXZ1rw7MP/SYA=;
        b=B9GgDhr/dwMSW/n4kfjPtmH2AbjuqK3Y+IefcJNPKuMIFdf+bJdETZecdeLaf7bzKW
         L+R2+qRXqJjITO0xy5iGehjbFVAKjMYNN5CeMBM7rQ7Vmxbz52PxHxpdO65w5g4bOEQM
         x5w4wyLfEvFB6m477d3KHYu/wQ3Q62HmP5l+hQRcWaDUkoTeUoiLnYt2rm2j2CYLeMm2
         rKH8ZbuCaLP0pzGKbWzUQm/K2E32LdS876RAX8BP8Yvcx2OUaq6h46hW7h/LCk3qGLLb
         OMbyYAZnVRXoVoY5SYBwfX6yo8drmMtDil/Yhkrm7m4reXt5pmmC9oT01g6tCSUfk4tq
         yybQ==
X-Forwarded-Encrypted: i=1; AJvYcCVndY7L6z6KIGPJ6KQdSsxyv2q9y3y2AOSO/wZuitNzEZL2CHWC9Y2uqGa0OrgQgmvJb92dYcRmR2aLueBnAXFXtixye72wz63PCro0OTaaVgU=
X-Gm-Message-State: AOJu0YwAD7cG2I7hNAt43cfpiYueD8wuVbWMdnCHoATRFpHQMINLMyKt
	dK6n+Y//onsepc42T5WXGv79IXB43QfaYhEOiqlJ51vLz1AW7Flc7d88o3RDOX8=
X-Google-Smtp-Source: AGHT+IGGgVRw4lTMX9ahqPDqw4yjPZd0+t6hgYsUJxPe+xuXJcvuJzrygJU+Vo3bg4bDJeEPwSEwJg==
X-Received: by 2002:a05:600c:3506:b0:412:1f3f:db1b with SMTP id h6-20020a05600c350600b004121f3fdb1bmr1094223wmq.3.1708006129570;
        Thu, 15 Feb 2024 06:08:49 -0800 (PST)
Received: from claudiu-X670E-Pro-RS.. ([82.78.167.20])
        by smtp.gmail.com with ESMTPSA id h17-20020a05600c261100b0040fe4b733f4sm5120950wma.26.2024.02.15.06.08.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Feb 2024 06:08:48 -0800 (PST)
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
Subject: [PATCH v7 0/9] watchdog: rzg2l_wdt: Add support for RZ/G3S
Date: Thu, 15 Feb 2024 16:08:32 +0200
Message-Id: <20240215140841.2278657-1-claudiu.beznea.uj@bp.renesas.com>
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

Series adds watchdog support for Renesas RZ/G3S (R9A08G045) SoC.

Patches do the following:
- patch 1/9 makes the driver depend on ARCH_RZG2L || ARCH_R9A09G011
- patch 2/9 makes the driver depend on PM
- patches 3-7/9 adds fixes and cleanups for the watchdog driver
- patch 8/9 adds suspend to RAM to the watchdog driver (to be used by
  RZ/G3S)
- patch 9/9 documents the RZ/G3S support

Thank you,
Claudiu Beznea

Changes in v7:
- updated the dependency on patch 2/9

Changes in v6:
- update patch 2/9 description
- fixed the dependency on COMPILE_TEST previously introduced in patch
  2/9

Changes in v5:
- updated description of patch 2/9
- simplify the code in patch 2/9 by using on a new line:
  depends on PM || COMPILE_TEST

Changes in v4:
- added patch "watchdog: rzg2l_wdt: Restrict the driver to ARCH_RZG2L and
  ARCH_R9A09G011"
- collected tags

Changes in v3:
- make driver depend on PM not select it
- drop patches already accepted (patches 1, 10, 11 from v2)
- re-arranged the tags in patch 8/8 as they were messed by b4 am/shazam

Changes in v2:
- added patch "watchdog: rzg2l_wdt: Select PM"
- propagate the return status of rzg2l_wdt_start() to it's callers
  in patch "watchdog: rzg2l_wdt: Use pm_runtime_resume_and_get()" 
- propagate the return status of rzg2l_wdt_stop() to it's callers
  in patch "watchdog: rzg2l_wdt: Check return status of pm_runtime_put()" 
- removed pm_ptr() from patch "watchdog: rzg2l_wdt: Add suspend/resume support"
- s/G2UL/G2L in patch "dt-bindings: watchdog: renesas,wdt: Document RZ/G3S support"
- collected tags

Claudiu Beznea (9):
  watchdog: rzg2l_wdt: Restrict the driver to ARCH_RZG2L and
    ARCH_R9A09G011
  watchdog: rzg2l_wdt: Make the driver depend on PM
  watchdog: rzg2l_wdt: Use pm_runtime_resume_and_get()
  watchdog: rzg2l_wdt: Check return status of pm_runtime_put()
  watchdog: rzg2l_wdt: Remove reset de-assert from probe
  watchdog: rzg2l_wdt: Remove comparison with zero
  watchdog: rzg2l_wdt: Rely on the reset driver for doing proper reset
  watchdog: rzg2l_wdt: Add suspend/resume support
  dt-bindings: watchdog: renesas,wdt: Document RZ/G3S support

 .../bindings/watchdog/renesas,wdt.yaml        |   1 +
 drivers/watchdog/Kconfig                      |   3 +-
 drivers/watchdog/rzg2l_wdt.c                  | 111 ++++++++++--------
 3 files changed, 64 insertions(+), 51 deletions(-)

-- 
2.39.2


