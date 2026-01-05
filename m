Return-Path: <linux-renesas-soc+bounces-26297-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 07DE8CF4B2F
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 05 Jan 2026 17:32:32 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id AF7733265237
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  5 Jan 2026 16:10:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B8E1234D924;
	Mon,  5 Jan 2026 15:57:32 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A9CB34D91E;
	Mon,  5 Jan 2026 15:57:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767628652; cv=none; b=Ynrlk9y/c9p5gsDWGf1QURox5EYWyS8CR75oc7quKvIqL1bCDqGPomiA0mKCCU6/n+sgp4ZRv3HWtvkXeH8WCC/Gdxvhrw8PeaeteIVosiGj+hj+4x2bB5sN8qE+3th48gbp0vC2f52emuOj9qFjBTJQEi7+z55n3xs22ciQ3A0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767628652; c=relaxed/simple;
	bh=75eYUgm+NMzohjTfBmaqFj9a5sT7EiYpHCKhOHu1sKI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=FunImfvvCaP7cz4FChxtTWxOJbPdFwuVuLT8X4FozqNco3745zer1yKIJ0ZrokEEOMtWfve37urtiOKtY7dxL/yTK7LIEHChjPKJL7HwMhLeabu8SQiCEzzbfwotVbvSim1SoewKgy2ceS8A1hgEyUlOjhiXf65ysAQZAgFpoYs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 10947C116D0;
	Mon,  5 Jan 2026 15:57:30 +0000 (UTC)
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>
Cc: linux-clk@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [GIT PULL] clk: renesas: Updates for v6.20
Date: Mon,  5 Jan 2026 16:57:26 +0100
Message-ID: <cover.1767628282.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

	Hi Mike, Stephen,

The following changes since commit 8f0b4cce4481fb22653697cced8d0d04027cb1e8:

  Linux 6.19-rc1 (2025-12-14 16:05:07 +1200)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-drivers.git tags/renesas-clk-for-v6.20-tag1

for you to fetch changes up to ebb3acf4d7c95b52265084168b59a565bf972883:

  clk: renesas: r9a09g056: Add clock and reset entries for TSU (2025-12-29 11:43:22 +0100)

----------------------------------------------------------------
clk: renesas: Updates for v6.20

  - Add Expanded Serial Peripheral Interface (xSPI) clocks and resets on
    RZ/T21H and RZ/N2H,
  - Add DMAC, interrupt controller (ICU), SPI, and thermal (TSU) clocks
    and resets on RZ/V2N,
  - Add more serial (RSCI) clocks and resets on RZ/V2H and RZ/V2N,
  - Miscellaneous fixes and improvements.

Note that this includes DT binding definition updates for the RZ/T2H and
RZ/N2H SoCs, which are shared by clock driver and DT source files.

Thanks for pulling!

----------------------------------------------------------------
Chris Brandt (2):
      clk: renesas: rzg2l: Fix intin variable size
      clk: renesas: rzg2l: Select correct div round macro

Geert Uytterhoeven (1):
      Merge tag 'renesas-r9a09g077-dt-binding-defs-tag5' into renesas-clk-for-v6.20

Lad Prabhakar (8):
      dt-bindings: clock: renesas,r9a09g077/87: Add XSPI0/1 IDs
      clk: renesas: r9a09g077: Add xSPI core and module clocks
      clk: renesas: r9a09g077: Propagate rate changes through mux parents
      clk: renesas: r9a09g056: Add entries for the DMACs
      clk: renesas: r9a09g056: Add entries for ICU
      clk: renesas: r9a09g056: Add entries for the RSPIs
      clk: renesas: r9a09g056: Add entries for RSCIs
      clk: renesas: r9a09g057: Add entries for RSCIs

Ovidiu Panait (1):
      clk: renesas: r9a09g056: Add clock and reset entries for TSU

 drivers/clk/renesas/r9a09g056-cpg.c                | 178 +++++++++++++++++++
 drivers/clk/renesas/r9a09g057-cpg.c                | 126 +++++++++++++
 drivers/clk/renesas/r9a09g077-cpg.c                | 195 ++++++++++++++++++++-
 drivers/clk/renesas/rzg2l-cpg.c                    |   6 +-
 .../dt-bindings/clock/renesas,r9a09g077-cpg-mssr.h |   2 +
 .../dt-bindings/clock/renesas,r9a09g087-cpg-mssr.h |   2 +
 6 files changed, 502 insertions(+), 7 deletions(-)

Gr{oetje,eeting}s,

						Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
							    -- Linus Torvalds

