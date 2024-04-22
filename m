Return-Path: <linux-renesas-soc+bounces-4767-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E0BF8ACB4B
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 22 Apr 2024 12:54:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 9B8341F213F5
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 22 Apr 2024 10:54:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 727401465AA;
	Mon, 22 Apr 2024 10:54:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="m5YXdNGM"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 398DD146006
	for <linux-renesas-soc@vger.kernel.org>; Mon, 22 Apr 2024 10:54:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713783244; cv=none; b=F2sf43uuG5Ui2lLxsD0W36Z4FJmHt6I4tTxOiuc44Dy5aRDzKmsEGzj93pNB8l6/7LtZzOkTNbBENb/crsqd02viQ8j1EoB2XCAzOruHcpNG1EWpQDmjkKc4ke2ySYEaVlKtt6KSGE3nA8SRZP8bWk1PgVW4BsdJQ448lqw8z+w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713783244; c=relaxed/simple;
	bh=qE5Vwmtp9Qv3JNLaDibUL1/hbZOmTstWoD1DhaLuYLI=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=fH3tHx0A1kdR6osJ9lwLFMudrccSWuf9a7XK6Lc3K9M+Pk5s5lT0SgrduclUvmHuJK+qjkf9EKS7k6pDNYCznRoBOKn+CJiZ/ZQfanR2+tpTe9VAmhAkkfj9t/OxsZwfZOTXfG4sZIFHN9wX8ns7YhXipnDD6pwV4fl4DH4DRfw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=m5YXdNGM; arc=none smtp.client-ip=209.85.221.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-343f62d8124so3447606f8f.2
        for <linux-renesas-soc@vger.kernel.org>; Mon, 22 Apr 2024 03:54:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1713783239; x=1714388039; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=kyXgtdlSsX9JbCqrqT1KpAPo69/BzSus4iMQG/5X7PE=;
        b=m5YXdNGM8jOgkhQiDFF/wFnN3bFfOxHqz+15kBreooLUytilfyoAzjd79KONgFkzux
         dHW9EybhBm1v14ECaydUF2WareSnWNbRZZn3nST/ZLDJwv7SSAQqd2kw0ueCXU0O3ctZ
         7n4Ev6kJkh5IG3oLpF73AJaLQHehZBGZId8Yzfg7HxAtxOVOhrVC8VDBp1qkQqcTmgyd
         PAi4p2TqmREgM2UwFbT0uXu0ikcw9TYI0ttmpnuPeZuM12/cSB8Clfyq/OX73X3phhRe
         a/BlKZ8UbZoPo8/CGFm6pzqWd+XkjM0tAGakeKWEBVoCJ1PCsurp0PPJAZ4mc/6JglZT
         hSBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713783239; x=1714388039;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=kyXgtdlSsX9JbCqrqT1KpAPo69/BzSus4iMQG/5X7PE=;
        b=odExoqalbhvL1eSIdRLi+u85ExOrydflc6Vi2YClOZXYzSgkcKB9yeojMC1aroP7Hc
         jCtKqK5Gd4jk+6bzcjYwnxIfWc3WfRBn8tltyuaOfeAI8D3FJ4oFRndSMnMEN8toB8H0
         JmIAmkjedght1BNgay/vVejMZqYLCQvLXjv8iKW4v3CT7JC96PzgHosu6R4ne0BqyqcB
         1gDmx233spAuReNxCDOlXkZ6cajc1WUw2SThvZNVNfBIX4inQRJULijYBaMcJqWHxmq2
         MDkwA/BJbHnjwXiuMY/tkOPSpGxhH317U4F7P9RRaRTX88u/fQDL6wX2hGZri8UV2DsJ
         SlZQ==
X-Gm-Message-State: AOJu0YyXyqdO72gUk9sA2Eyhuc92BeV+3aAwgEaVdF4NlKvELdkZMbFY
	LhpzRV5sQzJ99YOkPBPX81Mmd3ubLSREvKDXXof3yTxf+bPo5C85UImazgFD2z7SjUiWq8Q66iK
	XHxg=
X-Google-Smtp-Source: AGHT+IE2HFhfOY3a7coK7WBeBu9s0c6ROdImq1nPtwwG99XgO1IXvZsqHnwGsmXXQujjgOBA5sQxiQ==
X-Received: by 2002:a5d:56ce:0:b0:349:8ba8:e26d with SMTP id m14-20020a5d56ce000000b003498ba8e26dmr6552380wrw.13.1713783239258;
        Mon, 22 Apr 2024 03:53:59 -0700 (PDT)
Received: from claudiu-X670E-Pro-RS.. ([82.78.167.53])
        by smtp.gmail.com with ESMTPSA id v13-20020a05600c444d00b0041a3f700ccesm4321037wmn.40.2024.04.22.03.53.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Apr 2024 03:53:58 -0700 (PDT)
From: Claudiu <claudiu.beznea@tuxon.dev>
X-Google-Original-From: Claudiu <claudiu.beznea.uj@bp.renesas.com>
To: geert+renesas@glider.be,
	mturquette@baylibre.com,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	magnus.damm@gmail.com,
	ulf.hansson@linaro.org
Cc: linux-renesas-soc@vger.kernel.org,
	linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-pm@vger.kernel.org,
	claudiu.beznea@tuxon.dev,
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
Subject: [PATCH v4 0/8] clk: renesas: rzg2l: Add support for power domains
Date: Mon, 22 Apr 2024 13:53:47 +0300
Message-Id: <20240422105355.1622177-1-claudiu.beznea.uj@bp.renesas.com>
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

Series adds support for power domains on rzg2l driver.

RZ/G2L kind of devices support a functionality called MSTOP (module
stop/standby). According to hardware manual the module could be switch
to standby after its clocks are disabled. The reverse order of operation
should be done when enabling a module (get the module out of standby,
enable its clocks etc).

In [1] the MSTOP settings were implemented by adding code in driver
to attach the MSTOP state to the IP clocks. But it has been proposed
to implement it as power domain. The result is this series.

The DT bindings were updated with power domain IDs (plain integers
that matches the DT with driver data structures). The current DT
bindings were updated with module IDs for the modules listed in tables
with name "Registers for Module Standby Mode" (see HW manual) exception
being RZ/G3S where, due to the power down functionality, the DDR,
TZCDDR, OTFDE_DDR were also added.

Domain IDs were added to all SoC specific bindings.

Thank you,
Claudiu Beznea 

Changes in v4:
- dropped the pwrdn functionality until it is better understanded
- dropped patch "clk: renesas: rzg2l-cpg: Add suspend/resume
  support for power domains" from v3; this will be replaced
  by propertly calling device_set_wakup_path() in serial console
  driver
- instantiated the watchdog domain in r8a08g045 clock driver; this
  allow applying r9a08g045 clock patch w/o affecting watchdog and later,
  after all good with watchdog patches series at [2], only patch
  "arm64: dts: renesas: r9a08g045: Update #power-domain-cells = <1>"
  will need to be applied

Changes in v3:
- collected tags
- dinamically detect if a SCIF is serial console and populate
  pd->suspend_check
- dropped patch 09/10 from v2

Changes in v2:
- addressed review comments
- dropped:
    - dt-bindings: clock: r9a09g011-cpg: Add always-on power domain IDs
    - clk: renesas: r9a07g043: Add initial support for power domains
    - clk: renesas: r9a07g044: Add initial support for power domains
    - clk: renesas: r9a09g011: Add initial support for power domains
    - clk: renesas: r9a09g011: Add initial support for power domains
    - arm64: dts: renesas: r9a07g043: Update #power-domain-cells = <1>
    - arm64: dts: renesas: r9a07g044: Update #power-domain-cells = <1>
    - arm64: dts: renesas: r9a07g054: Update #power-domain-cells = <1>
    - arm64: dts: renesas: r9a09g011: Update #power-domain-cells = <1>
  as suggested in the review process
- dropped "arm64: dts: renesas: rzg3s-smarc-som: Guard the ethernet IRQ
  GPIOs with proper flags" patch as it was integrated
- added suspend to RAM support
- collected tag

[1] https://lore.kernel.org/all/20231120070024.4079344-4-claudiu.beznea.uj@bp.renesas.com/
[2] https://lore.kernel.org/all/20240410134044.2138310-1-claudiu.beznea.uj@bp.renesas.com/

Claudiu Beznea (8):
  dt-bindings: clock: r9a07g043-cpg: Add power domain IDs
  dt-bindings: clock: r9a07g044-cpg: Add power domain IDs
  dt-bindings: clock: r9a07g054-cpg: Add power domain IDs
  dt-bindings: clock: r9a08g045-cpg: Add power domain IDs
  dt-bindings: clock: renesas,rzg2l-cpg: Update #power-domain-cells =
    <1> for RZ/G3S
  clk: renesas: rzg2l: Extend power domain support
  clk: renesas: r9a08g045: Add support for power domains
  arm64: dts: renesas: r9a08g045: Update #power-domain-cells = <1>

 .../bindings/clock/renesas,rzg2l-cpg.yaml     |  18 +-
 arch/arm64/boot/dts/renesas/r9a08g045.dtsi    |  20 +-
 drivers/clk/renesas/r9a08g045-cpg.c           |  41 ++++
 drivers/clk/renesas/rzg2l-cpg.c               | 199 ++++++++++++++++--
 drivers/clk/renesas/rzg2l-cpg.h               |  67 ++++++
 include/dt-bindings/clock/r9a07g043-cpg.h     |  52 +++++
 include/dt-bindings/clock/r9a07g044-cpg.h     |  58 +++++
 include/dt-bindings/clock/r9a07g054-cpg.h     |  58 +++++
 include/dt-bindings/clock/r9a08g045-cpg.h     |  70 ++++++
 9 files changed, 558 insertions(+), 25 deletions(-)

-- 
2.39.2


