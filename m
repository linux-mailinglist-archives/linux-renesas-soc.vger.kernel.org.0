Return-Path: <linux-renesas-soc+bounces-23958-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 16B6DC248FB
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 31 Oct 2025 11:45:03 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id F2A2F4F0279
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 31 Oct 2025 10:45:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C097E33E37C;
	Fri, 31 Oct 2025 10:44:01 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9750233DEE9;
	Fri, 31 Oct 2025 10:44:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761907441; cv=none; b=Y+2GmgJw+JU1Kdz+hCxw7AUWRrBRMgRCgYC8nSLeAaaDsMHaPiS1pyzrYTmkeSkVSUDnknuqDTHUFd6vJ84tT7DlmZP4kjmXadwpoG87VBaR8Na+ZrQ6MG75thRGB+W+l49goBLAKKfbSIz/CTzXcABFfa+w80RIiRm6AcXm5a4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761907441; c=relaxed/simple;
	bh=POWscKc56oOgEfXEl8SSi8BMadwVxaM+2XZTda17o8c=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=j12TTq0MZQBBxM7nnE5+aI9n3j4fhkEmxCOYrXjqTJ4Evsw0stEUSzASElWmnhddmA02oub+EVKYoZxfGPouM7qBT3D1hfMdFtYM29ZYHGrHhsoTQ598GWiWCqvKvvf2He8aluyNH6aNgnVU0sezjVIAIdwFXTr8YOzojftnlK8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 03B91C116B1;
	Fri, 31 Oct 2025 10:43:59 +0000 (UTC)
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>
Cc: linux-clk@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [GIT PULL] clk: renesas: Updates for v6.19
Date: Fri, 31 Oct 2025 11:43:56 +0100
Message-ID: <cover.1761906750.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

	Hi Mike, Stephen,

The following changes since commit 3a8660878839faadb4f1a6dd72c3179c1df56787:

  Linux 6.18-rc1 (2025-10-12 13:42:36 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-drivers.git tags/renesas-clk-for-v6.19-tag1

for you to fetch changes up to 07525a693a5ff6592668a0fd647153e4b4933cae:

  clk: renesas: r9a09g056: Add clock and reset entries for ISP (2025-10-27 12:15:00 +0100)

----------------------------------------------------------------
clk: renesas: Updates for v6.19

  - Various fixes for the module reset procedure on R-Car Gen4 SoCs,
  - Add ADC and thermal (TSU) clocks on RZ/T2H and RZ/N2H,
  - Add USB clocks and resets on RZ/G3E,
  - Add ISP and display (DSI, LCDC) clocks and resets on RZ/V2H and RZ/V2N,
  - Add thermal (TSU) and RTC clocks and resets on RZ/V2H,
  - Add reset support on RZ/T2H and RZ/N2H,
  - Fix the module stop disable procedure on RZ/T2H and RZ/N2H,
  - Add camera (CRU) clocks and resets on RZ/V2N,
  - Miscellaneous fixes and improvements.

Note that this includes:
  1. DT binding definition updates for the RZ/G3E SoC, which are shared
     by clock driver and DT source files,
  2. The RZ/V2H Clock Pulse Generator PLLDSI API, which is shared by
     clock and MIPI DSI driver source files.

Thanks for pulling!

----------------------------------------------------------------
Cosmin Tanislav (2):
      clk: renesas: r9a09g077: Add ADC module clocks
      clk: renesas: r9a09g077: Add TSU module clock

Daniel Scally (1):
      clk: renesas: r9a09g057: Add clock and reset entries for ISP

Geert Uytterhoeven (5):
      clk: renesas: cpg-lib: Remove unneeded semicolon
      clk: renesas: Use IS_ERR() for pointers that cannot be NULL
      Merge tag 'renesas-r9a09g047-dt-binding-defs-tag5' into renesas-clk-for-v6.19
      clk: renesas: cpg-mssr: Spelling s/offets/offsets/
      Merge tag 'clk-renesas-rzv2h-plldsi-tag' into renesas-clk-for-v6.19

Lad Prabhakar (9):
      clk: renesas: cpg-mssr: Add module reset support for RZ/T2H
      clk: renesas: cpg-mssr: Add read-back and delay handling for RZ/T2H MSTP
      clk: renesas: rzv2h: Add instance field to struct pll
      clk: renesas: rzv2h: Use GENMASK for PLL fields
      clk: renesas: rzv2h: Add support for DSI clocks
      clk: renesas: r9a09g057: Add clock and reset entries for DSI and LCDC
      clk: renesas: r9a09g056: Add clocks and resets for DSI and LCDC modules
      clk: renesas: r9a09g056: Add support for PLLVDO, CRU clocks, and resets
      clk: renesas: r9a09g056: Add clock and reset entries for ISP

Marek Vasut (2):
      clk: renesas: cpg-mssr: Add missing 1ms delay into reset toggle callback
      clk: renesas: cpg-mssr: Read back reset registers to assure values latched

Ovidiu Panait (2):
      clk: renesas: r9a09g057: Add clock and reset entries for TSU
      clk: renesas: r9a09g057: Add clock and reset entries for RTC

Tommaso Merciai (2):
      dt-bindings: clock: renesas,r9a09g047-cpg: Add USB2 PHY core clocks
      clk: renesas: r9a09g047: Add clock and reset entries for USB2

 drivers/clk/renesas/r9a09g047-cpg.c               |  18 +-
 drivers/clk/renesas/r9a09g056-cpg.c               | 109 +++++
 drivers/clk/renesas/r9a09g057-cpg.c               |  86 ++++
 drivers/clk/renesas/r9a09g077-cpg.c               |   4 +
 drivers/clk/renesas/rcar-cpg-lib.c                |   2 +-
 drivers/clk/renesas/renesas-cpg-mssr.c            | 181 ++++++--
 drivers/clk/renesas/rzg2l-cpg.c                   |   2 +-
 drivers/clk/renesas/rzv2h-cpg.c                   | 514 +++++++++++++++++++++-
 drivers/clk/renesas/rzv2h-cpg.h                   |  31 +-
 include/dt-bindings/clock/renesas,r9a09g047-cpg.h |   2 +
 include/linux/clk/renesas.h                       | 145 ++++++
 11 files changed, 1047 insertions(+), 47 deletions(-)

Gr{oetje,eeting}s,

						Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
							    -- Linus Torvalds

