Return-Path: <linux-renesas-soc+bounces-16384-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 27391A9C91E
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 25 Apr 2025 14:42:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 75FDD17913F
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 25 Apr 2025 12:42:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0A3664438B;
	Fri, 25 Apr 2025 12:42:40 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from riemann.telenet-ops.be (riemann.telenet-ops.be [195.130.137.80])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 46D5523F291
	for <linux-renesas-soc@vger.kernel.org>; Fri, 25 Apr 2025 12:42:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.130.137.80
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745584959; cv=none; b=QundybHbtMXA6HGJ4VHkKRl62ki5TxqSICpbfPSpZAiClLRlFKgzmknc6rAYKznSxuszkXTS5dgsVoWtt45Q5pkz/9+IRWReGtxCi05OCGmWuPgz7ALFkEdMLQNgKD9psgt4H0XgJdfyhj3uv0qpirv1YQdJtmkhRNa78nze8tY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745584959; c=relaxed/simple;
	bh=qGiYQH4QC34+fmlTmy4Ko+9qKnMTkYv8U+25/BEy6Rw=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=YKxjErWiVGCdZ71+K2h6o6YDHERGYEBMPmv2HyHGrDc6DTXTVdndTXlfLts46yVT3372YixSmkkahkwmg1+wULt19EA0Oha+w258oXmIsJGn3jxze/I4QRrRNlBF5Eo06E3oI9IrrSrkYS9n9yyJXZnNPRQoaatqm6pDlDtvNIo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=glider.be; spf=none smtp.mailfrom=linux-m68k.org; arc=none smtp.client-ip=195.130.137.80
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=glider.be
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux-m68k.org
Received: from albert.telenet-ops.be (albert.telenet-ops.be [IPv6:2a02:1800:110:4::f00:1a])
	by riemann.telenet-ops.be (Postfix) with ESMTPS id 4ZkXP22S1nz4xr2h
	for <linux-renesas-soc@vger.kernel.org>; Fri, 25 Apr 2025 14:35:18 +0200 (CEST)
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed80:3329:b4bc:d565:c72])
	by albert.telenet-ops.be with cmsmtp
	id hQbH2E00L16PE0206QbHuK; Fri, 25 Apr 2025 14:35:17 +0200
Received: from rox.of.borg ([192.168.97.57])
	by ramsan.of.borg with esmtp (Exim 4.97)
	(envelope-from <geert@linux-m68k.org>)
	id 1u8IGq-00000001gJw-1TMR;
	Fri, 25 Apr 2025 14:35:17 +0200
Received: from geert by rox.of.borg with local (Exim 4.97)
	(envelope-from <geert@linux-m68k.org>)
	id 1u8IGz-0000000CKje-2WEU;
	Fri, 25 Apr 2025 14:35:17 +0200
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>
Cc: linux-clk@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [GIT PULL] clk: renesas: Updates for v6.16
Date: Fri, 25 Apr 2025 14:35:16 +0200
Message-ID: <cover.1745583433.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

	Hi Mike, Stephen,

The following changes since commit 0af2f6be1b4281385b618cb86ad946eded089ac8:

  Linux 6.15-rc1 (2025-04-06 13:11:33 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-drivers.git tags/renesas-clk-for-v6.16-tag1

for you to fetch changes up to 93f2878136262e6efcc6320bc31ada62fb0afd20:

  clk: renesas: r9a09g057: Add clock and reset entries for USB2 (2025-04-22 11:38:28 +0200)

----------------------------------------------------------------
clk: renesas: Updates for v6.16

  - Add GPU and USB2 clocks and resets on RZ/V2H(P),
  - Add support for the RZ/V2N (R9A09G056) SoC,
  - Add GPU clocks and resets on RZ/G3E,
  - Miscellaneous fixes and improvements.

Note that this includes a DT binding definition update for the RZ/V2H(P)
SoC, and DT bindings and bindings definitions for the RZ/V2N SoC, which
are shared by the clock driver and DT source files.

Thanks for pulling!

----------------------------------------------------------------
Biju Das (2):
      clk: renesas: rzv2h: Fix a typo
      clk: renesas: rzv2h: Support static dividers without RMW

Geert Uytterhoeven (2):
      Merge tag 'renesas-r9a09g056-dt-binding-defs-tag1' into renesas-clk-for-v6.16
      Merge tag 'renesas-r9a09g057-dt-binding-defs-tag3' into renesas-clk-for-v6.16

Lad Prabhakar (17):
      clk: renesas: rzv2h: Refactor PLL configuration handling
      clk: renesas: rzv2h: Remove unused `type` field from `struct pll_clk`
      clk: renesas: rzv2h: Add support for enabling PLLs
      clk: renesas: rzv2h: Rename PLL field macros for consistency
      clk: renesas: r9a09g057: Add clock and reset entries for GE3D
      dt-bindings: soc: renesas: Document Renesas RZ/V2N SoC variants and EVK
      dt-bindings: soc: renesas: Document SYS for RZ/V2N SoC
      dt-bindings: clock: renesas: Document RZ/V2N SoC CPG
      dt-bindings: pinctrl: renesas: Document RZ/V2N SoC
      clk: renesas: rzv2h: Sort compatible list based on SoC part number
      clk: renesas: rzv2h: Add support for RZ/V2N SoC
      clk: renesas: rzv2h: Add support for static mux clocks
      clk: renesas: rzv2h: Add macro for defining static dividers
      clk: renesas: rzv2h: Use str_on_off() helper in rzv2h_mod_clock_endisable()
      clk: renesas: rzv2h: Use both CLK_ON and CLK_MON bits for clock state validation
      dt-bindings: clock: renesas,r9a09g057-cpg: Add USB2 PHY and GBETH PTP core clocks
      clk: renesas: r9a09g057: Add clock and reset entries for USB2

Tommaso Merciai (3):
      clk: renesas: rzv2h: Improve rzv2h_ddiv_set_rate()
      clk: renesas: rzv2h: Simplify rzv2h_cpg_assert()/rzv2h_cpg_deassert()
      clk: renesas: r9a09g047: Add clock and reset entries for GE3D

 .../bindings/clock/renesas,rzv2h-cpg.yaml          |   5 +-
 .../bindings/pinctrl/renesas,rzg2l-pinctrl.yaml    |   2 +
 .../soc/renesas/renesas,r9a09g057-sys.yaml         |   1 +
 .../devicetree/bindings/soc/renesas/renesas.yaml   |  15 ++
 drivers/clk/renesas/Kconfig                        |   5 +
 drivers/clk/renesas/Makefile                       |   1 +
 drivers/clk/renesas/r9a09g047-cpg.c                |  13 +-
 drivers/clk/renesas/r9a09g056-cpg.c                | 152 +++++++++++++++++
 drivers/clk/renesas/r9a09g057-cpg.c                |  36 +++-
 drivers/clk/renesas/rzv2h-cpg.c                    | 186 +++++++++++++++------
 drivers/clk/renesas/rzv2h-cpg.h                    |  87 +++++++++-
 include/dt-bindings/clock/renesas,r9a09g056-cpg.h  |  24 +++
 include/dt-bindings/clock/renesas,r9a09g057-cpg.h  |   4 +
 13 files changed, 467 insertions(+), 64 deletions(-)
 create mode 100644 drivers/clk/renesas/r9a09g056-cpg.c
 create mode 100644 include/dt-bindings/clock/renesas,r9a09g056-cpg.h

Gr{oetje,eeting}s,

						Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
							    -- Linus Torvalds

