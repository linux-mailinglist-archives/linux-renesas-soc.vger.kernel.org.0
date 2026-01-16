Return-Path: <linux-renesas-soc+bounces-26917-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 0DBD1D2FED3
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 16 Jan 2026 11:54:06 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 187A1300943D
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 16 Jan 2026 10:51:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CBF733612E0;
	Fri, 16 Jan 2026 10:51:08 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B32DE2D97AB;
	Fri, 16 Jan 2026 10:51:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768560668; cv=none; b=P2TOVdiMStudTyxPHTgwftt4dYYwCmGgQstGQMDknLaCY0LMlgBpWcnIEL/lvceLZlJKobL6QpsPytv7bjtTxJRU+SJJ2L5H08t2UkK90vlJZYDxtv2IhemPViC4+3yMC6OeslwoN831F3xZeT5qOhMAUnV1Fp1X84Jvz8pkbeM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768560668; c=relaxed/simple;
	bh=KBpbA7Ryv1uTG1ceWsoOiLWATvIVPJhzUwj24hmQws8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=AEDY3HLN19stfxGE/M7+rBGqWNlCEU11HqpG09x2IAg39+WdP7WQG5hqo4z/lwHSlI6sVoFsel96DHlRYfUa5gMxl9DC3EOcwFGbkUiOaLaJk2afVdfhmC109o4uDMXjQLQY4Z6l041Co1/hs6GL2o/5mdDyDmp238VubJVlfts=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 30573C116C6;
	Fri, 16 Jan 2026 10:51:07 +0000 (UTC)
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>
Cc: linux-clk@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [GIT PULL] clk: renesas: Updates for v6.20 (take two)
Date: Fri, 16 Jan 2026 11:51:04 +0100
Message-ID: <cover.1768559843.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

	Hi Mike, Stephen,

The following changes since commit ebb3acf4d7c95b52265084168b59a565bf972883:

  clk: renesas: r9a09g056: Add clock and reset entries for TSU (2025-12-29 11:43:22 +0100)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-drivers.git tags/renesas-clk-for-v6.20-tag2

for you to fetch changes up to 4fef3fd633be4a1a18c490a63f4131284f6ee0f4:

  clk: renesas: Add missing log message terminators (2026-01-16 10:48:33 +0100)

----------------------------------------------------------------
clk: renesas: Updates for v6.20 (take two)

  - Fix s2ram on RZ/T2H and RZ/N2H,
  - Add CAN-FD clocks and resets on RZ/T2H, RZ/N2H, RZ/V2H, and RZ/V2N,
  - Miscellaneous fixes and improvements.

Note that this includes DT binding definition updates for the RZ/T2H and
RZ/N2H SoCs, which are shared by clock driver and DT source files.

Thanks for pulling!

----------------------------------------------------------------
Biju Das (2):
      clk: renesas: rzg2l: Deassert reset on assert timeout
      clk: renesas: rzv2h: Deassert reset on assert timeout

Chris Brandt (1):
      clk: renesas: rzg2l: Remove DSI clock rate restrictions

Cosmin Tanislav (2):
      clk: renesas: cpg-mssr: Simplify pointer math in cpg_rzt2h_mstp_read()
      clk: renesas: cpg-mssr: Handle RZ/T2H register layout in PM callbacks

Geert Uytterhoeven (2):
      Merge tag 'renesas-r9a09g077-dt-binding-defs-tag6' into renesas-clk-for-v6.20
      clk: renesas: Add missing log message terminators

Lad Prabhakar (5):
      dt-bindings: clock: renesas,r9a09g077/87: Add PCLKCAN ID
      clk: renesas: r9a09g077: Add CANFD clocks
      clk: renesas: r9a09g057: Add entries for CANFD
      clk: renesas: r9a09g056: Add entries for CANFD
      clk: renesas: cpg-mssr: Unlock before reset verification

 drivers/clk/renesas/clk-vbattb.c                   |   4 +-
 drivers/clk/renesas/r9a09g056-cpg.c                |  10 ++
 drivers/clk/renesas/r9a09g057-cpg.c                |  10 ++
 drivers/clk/renesas/r9a09g077-cpg.c                |  13 +-
 drivers/clk/renesas/renesas-cpg-mssr.c             |  54 +++---
 drivers/clk/renesas/rzg2l-cpg.c                    | 189 ++++++++++++++++-----
 drivers/clk/renesas/rzv2h-cpg.c                    |  15 +-
 .../dt-bindings/clock/renesas,r9a09g077-cpg-mssr.h |   1 +
 .../dt-bindings/clock/renesas,r9a09g087-cpg-mssr.h |   1 +
 include/linux/clk/renesas.h                        |  11 ++
 10 files changed, 237 insertions(+), 71 deletions(-)

Gr{oetje,eeting}s,

						Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
							    -- Linus Torvalds

