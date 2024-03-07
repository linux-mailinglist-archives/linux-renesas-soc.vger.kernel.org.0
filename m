Return-Path: <linux-renesas-soc+bounces-3555-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C6951875157
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  7 Mar 2024 15:08:19 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id F41291C2430C
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  7 Mar 2024 14:08:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1317812D774;
	Thu,  7 Mar 2024 14:07:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="FGb6tuPu"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com [209.85.218.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F309F12DD8F
	for <linux-renesas-soc@vger.kernel.org>; Thu,  7 Mar 2024 14:07:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709820470; cv=none; b=NvJMhRhcB4PciM9fipXD17SYEJPxsMgDNe8HWerSYxY+YAQLjtLW2nSvcqcQL+pm49RmKj0XyDB+hcsSiKkEGc5WgQbJSt7TmXLZwUbEFE67glrOqkNRHruDo4Xw1b9UOLm/FN6RLuT1nfowqjzQshvYAqnl00CRN49RAPQgQ8w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709820470; c=relaxed/simple;
	bh=X6mr7ss3hBz+KcOkyD+aKlFcN4fw3b05uNnI+q4ZcYM=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=Ivgn5RarH2JRg2okO77Rl+uo8JshJSv7HL4Oz7MxQ/bRUKAV6q7rqNI5xR/0uESLap2kfsca2nqs096mKqw7kMBAqiNgV8t4BpGdO7DAU1W+xzIYX8QCZsbNESYa/RjtSGJ/t9hKLeQkz58OG+i8i8k+0TdVPC257/1knxZ1QP0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=FGb6tuPu; arc=none smtp.client-ip=209.85.218.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Received: by mail-ej1-f50.google.com with SMTP id a640c23a62f3a-a293f2280c7so162100766b.1
        for <linux-renesas-soc@vger.kernel.org>; Thu, 07 Mar 2024 06:07:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1709820465; x=1710425265; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=7qvoqgbf8BgmpB/WA74qzufv4GkITZwzS6+LGmIQY3Q=;
        b=FGb6tuPupwuScfJUpsAclHLb6UlcXo5srLgd4RT5EWMttHM0wm2zpc5YYsqYvfi1Nt
         NS0VZl8Zx6i0FRrmMHp0bpMDa8tEwR1H7h8VjPe8u3dHKQ65z9DM24FzJvL/TDAuxXiT
         /OkrPt7O63MOz452hviSp9BAQVz65eN5kIuHjlU+/b6LsVBF8KeiAiwpI68sMOWJcGPV
         2rr4QZsPYIhiZcDlSD+3/NV6gnWnhb7HYsrI7+2efduWYcBFduATMfvBT8ScxLUSPOKW
         /YxRMxPk3Sa7QMPYDil01STQfwBV3a9z65TYLnCx9ndnIFUhZo5outFmh3xh4GgRCVpr
         Zx/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709820465; x=1710425265;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7qvoqgbf8BgmpB/WA74qzufv4GkITZwzS6+LGmIQY3Q=;
        b=bd7gRu1OEzD/nLvQ0kPCR43wvmIQvS4AxgIN1gWYR7n0jOEADv7KkWJcDq9IVqMOSE
         +jw2NLjUTgWMwDbQiBAYkU/scZTemmViP3soXkGZxN7aiOPTq1QSR9bDCTRP8P7E6ws0
         8sp6oEhtFB32ZJaJN+9WoAfCvMOq+gNsyrLUEh2eKpe3TUsJ3bNuSTWuKL+sm3se0s2e
         o4BizRVEbN+YG1AJnTI7sccOqvYmWeCbPQOWd6josNJE7xRP467YogTn/Amdojz3k9Jx
         zalyNAX5Mfv0hr61jpMsQg/w8o6R4Ue8BQIZDonJA7hn05b9X8/tA4oj0Cy948HVXKcx
         Vp4Q==
X-Gm-Message-State: AOJu0YyCdeFQJ7deg0zzptEPvDjx1g1OVTNliJuDMRdw1kymxNNE7yX5
	uHl58K1PAOX5qPHtQX/rjVhQcvqFqU4zT4uBI70Rakc63qI2u11uYjHMydVJboM=
X-Google-Smtp-Source: AGHT+IGe9ehohUZqONm1c72a7RNSuywN/LKsDYfSndJQuoACdSv5VuHGXxdcyjhAOzi7I1PAms9HYA==
X-Received: by 2002:a17:906:138d:b0:a45:abec:cff4 with SMTP id f13-20020a170906138d00b00a45abeccff4mr5234619ejc.32.1709820465129;
        Thu, 07 Mar 2024 06:07:45 -0800 (PST)
Received: from claudiu-X670E-Pro-RS.. ([82.78.167.38])
        by smtp.gmail.com with ESMTPSA id v23-20020a1709067d9700b00a42ee62b634sm8200648ejo.106.2024.03.07.06.07.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 Mar 2024 06:07:44 -0800 (PST)
From: Claudiu <claudiu.beznea@tuxon.dev>
X-Google-Original-From: Claudiu <claudiu.beznea.uj@bp.renesas.com>
To: geert+renesas@glider.be,
	mturquette@baylibre.com,
	sboyd@kernel.org,
	robh@kernel.org,
	krzysztof.kozlowski+dt@linaro.org,
	conor+dt@kernel.org,
	magnus.damm@gmail.com
Cc: linux-renesas-soc@vger.kernel.org,
	linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	claudiu.beznea@tuxon.dev,
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
Subject: [PATCH v2 00/10] clk: renesas: rzg2l: Add support for power domains
Date: Thu,  7 Mar 2024 16:07:18 +0200
Message-Id: <20240307140728.190184-1-claudiu.beznea.uj@bp.renesas.com>
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

Along with MSTOP functionality there is also module power down
functionality (which is currently available only on RZ/G3S). This has
been also implemented through power domains.

The DT bindings were updated with power domain IDs (plain integers
that matches the DT with driver data structures). The current DT
bindings were updated with module IDs for the modules listed in tables
with name "Registers for Module Standby Mode" (see HW manual) exception
being RZ/G3S where, due to the power down functionality, the DDR,
TZCDDR, OTFDE_DDR were also added, to avoid system being blocked due
to the following lines of code from patch 7/17.

+       /* Prepare for power down the BUSes in power down mode. */
+       if (info->pm_domain_pwrdn_mstop)
+               writel(CPG_PWRDN_MSTOP_ENABLE, priv->base + CPG_PWRDN_MSTOP);

Domain IDs were added to all SoC specific bindings.

Thank you,
Claudiu Beznea 

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

Claudiu Beznea (10):
  dt-bindings: clock: r9a07g043-cpg: Add power domain IDs
  dt-bindings: clock: r9a07g044-cpg: Add power domain IDs
  dt-bindings: clock: r9a07g054-cpg: Add power domain IDs
  dt-bindings: clock: r9a08g045-cpg: Add power domain IDs
  dt-bindings: clock: renesas,rzg2l-cpg: Update #power-domain-cells =
    <1> for RZ/G3S
  clk: renesas: rzg2l: Extend power domain support
  clk: renesas: r9a08g045: Add support for power domains
  clk: renesas: rzg2l-cpg: Add suspend/resume support for power domains
  clk: renesas: r9a08g045: Add the RZG2L_PD_F_CONSOLE flag to scif0 PM
    domain
  arm64: dts: renesas: r9a08g045: Update #power-domain-cells = <1>

 .../bindings/clock/renesas,rzg2l-cpg.yaml     |  18 +-
 arch/arm64/boot/dts/renesas/r9a08g045.dtsi    |  20 +-
 drivers/clk/renesas/r9a08g045-cpg.c           |  61 ++++
 drivers/clk/renesas/rzg2l-cpg.c               | 267 +++++++++++++++++-
 drivers/clk/renesas/rzg2l-cpg.h               |  78 +++++
 include/dt-bindings/clock/r9a07g043-cpg.h     |  52 ++++
 include/dt-bindings/clock/r9a07g044-cpg.h     |  58 ++++
 include/dt-bindings/clock/r9a07g054-cpg.h     |  58 ++++
 include/dt-bindings/clock/r9a08g045-cpg.h     |  70 +++++
 9 files changed, 658 insertions(+), 24 deletions(-)

-- 
2.39.2


