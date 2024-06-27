Return-Path: <linux-renesas-soc+bounces-6839-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B1DB91AC52
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 27 Jun 2024 18:14:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id CB88A1C22E52
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 27 Jun 2024 16:14:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5A9A6199389;
	Thu, 27 Jun 2024 16:14:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BHjZrp+V"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 947E3196D9E;
	Thu, 27 Jun 2024 16:14:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719504850; cv=none; b=cX3++wYsh+Nx6BcCC9sUKQv95h0Ty84Z/r6qLZttImdJAWMZj0CML2ZaWsGujJsgM6SZ5aq2JwsFR+4c+upQI9HE3xKi/oQ8VBX7byO24fs3I6rldOpXc5kdHSTidmpAS4/UTfNOy4UVQCoK5K3L8/HL9Ecd4Ht+0AHouITzNLE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719504850; c=relaxed/simple;
	bh=ZF0e3blb4nkfxDT/Lk1jsmEIQpYEBc8vtkml4fKLlHc=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=btjrJCRt1lRE4TyT8xIm2KFR+UN/w5CMZviIcYVqQmgGj/yIwfHVN+LwFC/vfcWTRraXcCQFy3JL6oOCMie9qVjfktxdZ18HAnYtUd5ZL3bUaGGRvE3xPs6YrUVvHF+SlXLSntIWsQofCTYtm5wnyWHCkXP8Ja4anTDzQo5c1cc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BHjZrp+V; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-425624255f3so9519595e9.0;
        Thu, 27 Jun 2024 09:14:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1719504847; x=1720109647; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=jTj+hsohZCwvn5JvJWMvp1AvmENpEz8VBLpfD7Al/MU=;
        b=BHjZrp+V3bYq7HMPe968dYhO38YS04xv7U1dxxvZdbDqNdZJrLIhpxEU0usxIbgjUe
         M/QpeB0yk5uw64TL5pjiF7RcpsOi1ZlxFgfnAib6KiU2cSHu8492hzdRm831xpVhcrvG
         JnuzfC8w+nLHUCZD1p8braG6G3ieyMuduDg5bw6Eybs/Ti/1W+cscvr8kBw15Wtx3gOs
         yQG++OHfh52Shk0MhYQVss6me8fuwYnry52zhYP4wGmMPQ5me5ZyNvrdSrmf79GjiFhd
         lVx5ZAq1xY6fVXzPY4v9e7X2tUmpW99tZtG0jjvF11oy6XfCOmIj/6mQHb/Wow2r8gny
         wnyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719504847; x=1720109647;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=jTj+hsohZCwvn5JvJWMvp1AvmENpEz8VBLpfD7Al/MU=;
        b=JA3uSFn1v1saPuYg9Zqu33WpLDLUBqwzFQZ/ftDwJ7fwXVthyq1ZRM4N9Inwdyb162
         Sf/saxprpZ5F2But4Pzr4nzr6XdU9N+riq977a+ifSAR8JE9KLOa5INwUj95rkJfoGus
         xSO3vXkjxcmI6c5OxifHkpEoaYrfaV9nBJSwEOEqRIpft3jnOUT0DQ38EMjIGYoBpX8u
         nGs95MMqVSWOE9FRzI0mikWNeNNu+dd1u6T9NpCp9/l/hIkeiohtKa+ijFJjMU8Gng0P
         hfo7f5GFqgwgx81h6dkA4rydJUmG5PsqUI/uI3r3FHPZBe66gWV+4O5gTrksjba4AIw0
         zTPA==
X-Forwarded-Encrypted: i=1; AJvYcCXPiL/N2VDOzoTIX26zcRDHuEF/oDsXy/ILT8YPSgGTIfb1qo4hDUisgORnsyaS/eqwKTnopo87vHOThM7NjnesX8ouAZvjXLU7YxStKLLN8bFJ3mHnlwIGz6PbYpHYHfalQ/N9ZDkcFwZbLQiyUsnFogIy1fiASEcUFFH/luP8pH9IgCGsCNManLg=
X-Gm-Message-State: AOJu0YwmHVhdSMk/+wAsnM7K4bCU6xPL89WTd126juIu5q007kG186py
	43u8uGmUQjZjmqQk39jhGo8w03WExKlO/5fv1Ql/EnbZLxB9C9Ml
X-Google-Smtp-Source: AGHT+IFQo+q6DuCegO0ZL8Hsi0VNhDaCgjuC070ft5yVFF2mi4EF1NNrs96nPeASsVw4i65RjRSwbg==
X-Received: by 2002:a05:600c:3547:b0:424:84fb:9fd2 with SMTP id 5b1f17b1804b1-4256437a756mr25771595e9.19.1719504846565;
        Thu, 27 Jun 2024 09:14:06 -0700 (PDT)
Received: from prasmi.home ([2a00:23c8:2500:a01:9638:4c3:829:6df3])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-424c8424677sm72372435e9.35.2024.06.27.09.14.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Jun 2024 09:14:06 -0700 (PDT)
From: Prabhakar <prabhakar.csengg@gmail.com>
X-Google-Original-From: Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Magnus Damm <magnus.damm@gmail.com>,
	linux-clk@vger.kernel.org
Cc: devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	Prabhakar <prabhakar.csengg@gmail.com>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH v3 0/3] Add CPG support for RZ/V2H(P) SoC
Date: Thu, 27 Jun 2024 17:13:12 +0100
Message-Id: <20240627161315.98143-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Hi All,

This patch series aims to add the CPG support for the Renesas
RZ/V2H(P) SoC.

v2 -> v3
- Dropped '|' for CPG description
- Dropped description for '#power-domain-cells' property
- Added 3 clock inputs for CPG
- Dropped label in example node
- Used 4 spaces for example node
- Renamed r9a09g057-cpg.h -> renesas,r9a09g057-cpg.h
- Merged adding renesas,r9a09g057-cpg.h in DT binding patch
- Updated commit message for patch 1/3
- Dropped num_hw_resets from struct rzv2h_cpg_priv
- Dropped range_check for module clocks
- Made mon_index to s8 instead of u8 in struct rzv2h_mod_clk
- Added support for critical module clocks with DEF_MOD_CRITICAL
- Added check for mon_index in rzv2h_mod_clock_endisable and
  rzv2h_mod_clock_is_enabled()
- Added CLK_PLLDTY
- Added core clocks sys_0_pclk and iotop_0_shclk
- Dropped r9a09g057_crit_mod_clks

v1->v2
- Updated commit message
- Updated description for binding as suggested by Geert
- Updated descriptions for clocks and resets property
- Renamed extal->qextal
- Updated '#power-domain-cells' value
- Dropped the module clocks and just added the core clocks
- Introduced family specific config option
- Now using register indexes for CLKON/CLKMON/RST/RSTMON
- Introduced PLL_CONF macro
- Dropped function pointer to get PLL_CLK1/2 offsets
- Added range check for core clks
- Dropped NULLified clocks check
- Dropped pll_clk1/clk2_offset
- Made r9a09g057_mod_clks/r9a09g057_resets as static const

v1: https://patchwork.kernel.org/project/linux-renesas-soc/cover/20240524082800.333991-1-prabhakar.mahadev-lad.rj@bp.renesas.com/

Cheers,
Prabhakar

Lad Prabhakar (3):
  dt-bindings: clock: renesas: Document RZ/V2H(P) SoC CPG
  clk: renesas: Add family-specific clock driver for RZ/V2H(P)
  clk: renesas: Add RZ/V2H(P) CPG driver

 .../bindings/clock/renesas,rzv2h-cpg.yaml     |  80 +++
 drivers/clk/renesas/Kconfig                   |   9 +
 drivers/clk/renesas/Makefile                  |   2 +
 drivers/clk/renesas/r9a09g057-cpg.c           |  79 +++
 drivers/clk/renesas/rzv2h-cpg.c               | 667 ++++++++++++++++++
 drivers/clk/renesas/rzv2h-cpg.h               | 161 +++++
 .../dt-bindings/clock/renesas,r9a09g057-cpg.h |  21 +
 7 files changed, 1019 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/clock/renesas,rzv2h-cpg.yaml
 create mode 100644 drivers/clk/renesas/r9a09g057-cpg.c
 create mode 100644 drivers/clk/renesas/rzv2h-cpg.c
 create mode 100644 drivers/clk/renesas/rzv2h-cpg.h
 create mode 100644 include/dt-bindings/clock/renesas,r9a09g057-cpg.h

-- 
2.34.1


