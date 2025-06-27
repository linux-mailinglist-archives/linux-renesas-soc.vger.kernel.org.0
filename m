Return-Path: <linux-renesas-soc+bounces-18839-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A658AEB7E5
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 27 Jun 2025 14:40:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 4231C5623F4
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 27 Jun 2025 12:40:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A71FA2D3EDA;
	Fri, 27 Jun 2025 12:40:41 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A7942676D9;
	Fri, 27 Jun 2025 12:40:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751028041; cv=none; b=SXShUaI+6NrAOt7jK2DBXOo4Sze7vvk8e7WJFbyDSd32f619JvQOSsnc/kc7Qq7KQg+1gb2QI0Ns09dWrrOHNq6GUAZM6OU7VhLiRsj6gBiCnD0FgV7PejrsLnQnHD1D5MTHWRBiIKHna4wPEOzkKe23fva5gISI6WQJjF1sGoU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751028041; c=relaxed/simple;
	bh=Q3jNiVM+YcgIYTzNm3pT/8+2MA0+y7yNnCCai3D7Scw=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=WDl4QKfyXnc/LL8B9E12Shsxu9ZJeg2k2rQZWUL7VmPnngW1y7yPNGKnYZDUn/zHEd8O3ImScv++BwDbCxvePSSU7Myq/eLnYTrTEpuLYmODU9kbINMMf7h4krqdit/IXaN7p4iCgwnkccYd04gLzNSPoYsrzsZxMxQNfi0W/rs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D1C15C4CEE3;
	Fri, 27 Jun 2025 12:40:39 +0000 (UTC)
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>
Cc: linux-clk@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [GIT PULL] clk: renesas: Updates for v6.17
Date: Fri, 27 Jun 2025 14:40:34 +0200
Message-ID: <cover.1751027127.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

	Hi Mike, Stephen,

The following changes since commit 19272b37aa4f83ca52bdf9c16d5d81bdd1354494:

  Linux 6.16-rc1 (2025-06-08 13:44:43 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-drivers.git tags/renesas-clk-for-v6.17-tag1

for you to fetch changes up to b7c26cbd5b704a350b3176669f47047153903bc9:

  clk: renesas: rzv2h: Add missing include file (2025-06-26 16:28:50 +0200)

----------------------------------------------------------------
clk: renesas: Updates for v6.17

  - Initial support for the Renesas RZ/T2H (R9A09G077) and RZ/N2H
    (R9A09G087) SoCs,
  - Add Ethernet clocks and resets on RZ/V2H and RZ/V2N,
  - Add timer, I2C, watchdog, GPU, and USB2.0 clocks and resets on
    RZ/V2N,
  - Rework Module Stop and Power Domain support on the RZ/G2L family of
    SoCs (especially on RZ/G3S),
  - Add I3C clocks and resets on RZ/G3E,
  - Miscellaneous fixes and improvements.

Note that this includes DT binding definitions for the RZ/T2H and RZ/N2H
SoCs, which are shared by the clock driver and DT source files.

Thanks for pulling!

----------------------------------------------------------------
Claudiu Beznea (8):
      clk: renesas: rzg2l: Postpone updating priv->clks[]
      clk: renesas: rzg2l: Move pointers after hw member
      clk: renesas: rzg2l: Add macro to loop through module clocks
      clk: renesas: rzg2l: Add support for MSTOP in clock enable/disable API
      clk: renesas: r9a08g045: Drop power domain instantiation
      clk: renesas: rzg2l: Drop MSTOP based power domain support
      dt-bindings: clock: rzg2l: Drop power domain IDs
      Revert "dt-bindings: clock: renesas,rzg2l-cpg: Update #power-domain-cells = <1> for RZ/G3S"

Fabrizio Castro (1):
      clk: renesas: rzv2h: Add missing include file

Geert Uytterhoeven (4):
      Merge tag 'renesas-r9a09g077-dt-binding-defs-tag' into renesas-clk-for-v6.17
      clk: renesas: rzg2l: Rename mstp_clock to mod_clock
      Merge tag 'renesas-r9a09g077-dt-binding-defs-tag2' into renesas-clk-for-v6.17
      Merge tag 'renesas-r9a09g087-dt-binding-defs-tag1' into renesas-clk-for-v6.17

Lad Prabhakar (13):
      clk: renesas: rzv2h: Skip monitor checks for external clocks
      clk: renesas: r9a09g057: Add clock and reset entries for GBETH0/1
      clk: renesas: r9a09g056-cpg: Add clock and reset entries for GBETH0/1
      clk: renesas: r9a09g056-cpg: Add clock and reset entries for OSTM instances
      clk: renesas: r9a09g056: Add clock and reset entries for RIIC controllers
      clk: renesas: r9a09g056: Add clock and reset entries for WDT controllers
      clk: renesas: r9a09g056: Add clocks and resets for Mali-G31 GPU
      clk: renesas: r9a09g056: Add clock and reset entries for USB2.0
      clk: renesas: rzv2h: Fix missing CLK_SET_RATE_PARENT flag for ddiv clocks
      dt-bindings: clock: renesas,r9a09g077: Add PCLKL core clock ID
      dt-bindings: clock: renesas,cpg-mssr: Document RZ/N2H support
      clk: renesas: r9a09g077: Add PCLKL core clock
      clk: renesas: Add CPG/MSSR support to RZ/N2H SoC

Paul Barker (1):
      dt-bindings: soc: renesas: Document RZ/N2H (R9A09G087) SoC

Raag Jadav (1):
      clk: renesas: rzv2h: Use devm_kmemdup_array()

Thierry Bultel (3):
      dt-bindings: clock: renesas,cpg-mssr: Document RZ/T2H support
      clk: renesas: Pass sub struct of cpg_mssr_priv to cpg_clk_register
      clk: renesas: Add support for R9A09G077 SoC

Tommaso Merciai (1):
      clk: renesas: r9a09g047: Add I3C0 clocks and resets

 .../bindings/clock/renesas,cpg-mssr.yaml           |  49 +-
 .../bindings/clock/renesas,rzg2l-cpg.yaml          |  18 +-
 .../devicetree/bindings/soc/renesas/renesas.yaml   |  10 +
 drivers/clk/renesas/Kconfig                        |  10 +
 drivers/clk/renesas/Makefile                       |   2 +
 drivers/clk/renesas/r7s9210-cpg-mssr.c             |   7 +-
 drivers/clk/renesas/r8a77970-cpg-mssr.c            |   8 +-
 drivers/clk/renesas/r9a07g043-cpg.c                | 132 +++---
 drivers/clk/renesas/r9a07g044-cpg.c                | 168 +++----
 drivers/clk/renesas/r9a08g045-cpg.c                | 227 ++++-----
 drivers/clk/renesas/r9a09g011-cpg.c                | 116 ++---
 drivers/clk/renesas/r9a09g047-cpg.c                |   8 +
 drivers/clk/renesas/r9a09g056-cpg.c                | 165 +++++++
 drivers/clk/renesas/r9a09g057-cpg.c                |  64 +++
 drivers/clk/renesas/r9a09g077-cpg.c                | 243 ++++++++++
 drivers/clk/renesas/rcar-gen2-cpg.c                |   5 +-
 drivers/clk/renesas/rcar-gen2-cpg.h                |   3 +-
 drivers/clk/renesas/rcar-gen3-cpg.c                |   6 +-
 drivers/clk/renesas/rcar-gen3-cpg.h                |   3 +-
 drivers/clk/renesas/rcar-gen4-cpg.c                |   6 +-
 drivers/clk/renesas/rcar-gen4-cpg.h                |   3 +-
 drivers/clk/renesas/renesas-cpg-mssr.c             | 193 +++++---
 drivers/clk/renesas/renesas-cpg-mssr.h             |  32 +-
 drivers/clk/renesas/rzg2l-cpg.c                    | 509 ++++++++++++---------
 drivers/clk/renesas/rzg2l-cpg.h                    |  66 +--
 drivers/clk/renesas/rzv2h-cpg.c                    |  35 +-
 drivers/clk/renesas/rzv2h-cpg.h                    |  25 +-
 include/dt-bindings/clock/r9a07g043-cpg.h          |  53 ---
 include/dt-bindings/clock/r9a07g044-cpg.h          |  58 ---
 include/dt-bindings/clock/r9a07g054-cpg.h          |  58 ---
 include/dt-bindings/clock/r9a08g045-cpg.h          |  71 ---
 .../dt-bindings/clock/renesas,r9a09g077-cpg-mssr.h |  28 ++
 .../dt-bindings/clock/renesas,r9a09g087-cpg-mssr.h |  28 ++
 33 files changed, 1449 insertions(+), 960 deletions(-)
 create mode 100644 drivers/clk/renesas/r9a09g077-cpg.c
 create mode 100644 include/dt-bindings/clock/renesas,r9a09g077-cpg-mssr.h
 create mode 100644 include/dt-bindings/clock/renesas,r9a09g087-cpg-mssr.h

Gr{oetje,eeting}s,

						Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
							    -- Linus Torvalds

