Return-Path: <linux-renesas-soc+bounces-7345-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id E1D89931529
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 15 Jul 2024 14:58:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 772B0B24096
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 15 Jul 2024 12:58:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 33A4618D4C0;
	Mon, 15 Jul 2024 12:56:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="eVr2nrDj"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-lj1-f175.google.com (mail-lj1-f175.google.com [209.85.208.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B30518D4B9;
	Mon, 15 Jul 2024 12:56:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721048162; cv=none; b=q+YHF+x8t7oEuW6zR6JIox9UTPH1uqL2cWUxhbcJOL4gKi9JQmxXcjpWC7kv8SH6dm/gFQGc5IiP9Pb1aO/RVh4tzqbOP9EK1vp8fU2seC60+K55mcJfR8lSpQ9iMZjxBVjHTFaUGEyeyF66S4Ix+DEPUgCDB8vdwOeutciHp/o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721048162; c=relaxed/simple;
	bh=PT2giZVeyMwG7Ia77KJkmK48CNCreprqxcNF/DRxLzo=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=hW6oOsfjXK5yrvqnGjhHCHIckQgKHscGer99gBMrlxGUOKo0GEn6ejCMN30iKFTyBoI9luJO0radhAi6ud7JdBo0UH3k8OS3MjHyfbuMJNzY0DB10gE6IDxpxV7s8thOE28mHLW7CP1RGVT6o/0wNsAz9JDmgvf31UcCvSWVNoo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=eVr2nrDj; arc=none smtp.client-ip=209.85.208.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lj1-f175.google.com with SMTP id 38308e7fff4ca-2eea8ea8c06so61696951fa.2;
        Mon, 15 Jul 2024 05:56:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1721048159; x=1721652959; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=bq5WlkKjBpLTTy056SbzimB2Bvvk4nkUO1ENR4jivK4=;
        b=eVr2nrDjrL4ekR75m8Cz9eqb74Q35JjEuNx5dFrlw4tg+nqc3CVpBBab55FBXGY12C
         d9WAb69NhFNOC1cv6SxussR8S4F5kAMNBXeD8HqeUaxyXoqondvW0K7BkmY6JRoz8WlG
         CvQTc3ilZnVJaelr2+0cuSU5aJpoocWh+WlQrFlDfg/30GzWGtYXBKCWEsNIcMXAhJQB
         IOn66CIAVlwkHhYCHBNLqoFpkIyLpeUW42Qd3R6/ZVPjB4uEhrb8A/hO58YfBFTz6Uke
         7QHsbLV+yFtXw24XUUSfJjuYsC5VGH1/HQf1+9z027ZXdB0WfNohMdWPMMeaFQyBivhv
         Sd8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721048159; x=1721652959;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=bq5WlkKjBpLTTy056SbzimB2Bvvk4nkUO1ENR4jivK4=;
        b=cLt6xuxAQDVZfJVhcRnUBRhq5jcz2Xo5tCCp0ArDK0TZhZ9hOMpSlNVcC0HogXMfZ/
         7RorFHrJa3MNxCwK4Zv1CtrGcBDtXWTX5vSu7UpzpBtuBfzOnOC/Qu+Szh+snyc6h5KH
         A6IwpR0/SHPMqyYssJ/Fnp+19BxEh9cmUDlzAG7eAZjPvWOHxeveMc3v56d2hzOKCbNR
         9UYYyANWKbZLDxmLnEBBqsRZclvYQcOcITarW7P+9VFUyKzi3wOeObMKQgzhWvdx3wpH
         uSiEhhKP7HHx8T/0U+tR+MEnsFWPoQSNW//9EWe3pTSD7RZ+7enzYxBbQXEF97r8wlO7
         el+A==
X-Forwarded-Encrypted: i=1; AJvYcCVRy+Co+Yi+WDliFRYqe0f1olNAsQcLalwvK2RM/fZucizLTCmZJjt/J4VX+DSeH2YkhyguRacYil7Qi0wG4B58b6gtS1uW/c4Y+olaxdNjN++7iPN5j38vzLu6iG5LkQ470HcRl6Gx1gdbE9OGCOHdaojn3IoZQg80e4u/oUjtZvGdEzkyFBM++vM=
X-Gm-Message-State: AOJu0YwmVh6GzlG9W7Jm7O/gjNkEXyvjTqmmUwYjiS8SzSdOtpWqmoBM
	7eOobVMRPxVZN+4ps/LXLApFd+7D72McJmC4QNekrHqH27kQpMp1
X-Google-Smtp-Source: AGHT+IFYYNFw/3hdL1b9TERxylHLD8pPw7jmsMNBsvv1dhqw1hdTfDWlSpVD3+/nF/2mtIa/qo/ymg==
X-Received: by 2002:a2e:9892:0:b0:2ec:1810:e50a with SMTP id 38308e7fff4ca-2eeb3188dcdmr125720911fa.32.1721048156335;
        Mon, 15 Jul 2024 05:55:56 -0700 (PDT)
Received: from prasmi.home ([2a00:23c8:2500:a01:2595:4364:d152:dff3])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-427a5e81f0dsm86091355e9.12.2024.07.15.05.55.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Jul 2024 05:55:55 -0700 (PDT)
From: Prabhakar <prabhakar.csengg@gmail.com>
X-Google-Original-From: Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Magnus Damm <magnus.damm@gmail.com>
Cc: devicetree@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Prabhakar <prabhakar.csengg@gmail.com>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH v4 0/3] Add CPG support for RZ/V2H(P) SoC
Date: Mon, 15 Jul 2024 13:54:35 +0100
Message-Id: <20240715125438.553688-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
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

v3 -> v4
- Included RB tag form Krzysztof for patch 1/3
- Changed reset and clock values to hex
- Renamed __DT_BINDINGS_CLOCK_R9A09G057_CPG_H__ to
  __DT_BINDINGS_CLOCK_RENESAS_R9A09G057_CPG_H__
- Dropped masking of parent clks with 0xffff
- Dropped storing mod clk id and now calculating it
  based on index and bit.
- Made parent to u16 in struct rzv2h_mod_clk
- Made a copy of resets array in struct rzv2h_cpg_priv
- Added a comment for core clocks in patch 3/3
- Made r9a09g057_mod_clks as __initconst
- Made r9a09g057_resets as __initconst
- Made r9a09g057_cpg_info as __initconst

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

v1 -> v2
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

 .../bindings/clock/renesas,rzv2h-cpg.yaml     |  80 ++
 drivers/clk/renesas/Kconfig                   |   9 +
 drivers/clk/renesas/Makefile                  |   2 +
 drivers/clk/renesas/r9a09g057-cpg.c           |  80 ++
 drivers/clk/renesas/rzv2h-cpg.c               | 685 ++++++++++++++++++
 drivers/clk/renesas/rzv2h-cpg.h               | 153 ++++
 .../dt-bindings/clock/renesas,r9a09g057-cpg.h |  21 +
 7 files changed, 1030 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/clock/renesas,rzv2h-cpg.yaml
 create mode 100644 drivers/clk/renesas/r9a09g057-cpg.c
 create mode 100644 drivers/clk/renesas/rzv2h-cpg.c
 create mode 100644 drivers/clk/renesas/rzv2h-cpg.h
 create mode 100644 include/dt-bindings/clock/renesas,r9a09g057-cpg.h

-- 
2.34.1


