Return-Path: <linux-renesas-soc+bounces-21813-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 05CBFB54AC5
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 12 Sep 2025 13:14:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 550011CC7D9F
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 12 Sep 2025 11:14:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 57DC42FF642;
	Fri, 12 Sep 2025 11:14:20 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 39B752FF167;
	Fri, 12 Sep 2025 11:14:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757675660; cv=none; b=EV7pjBpMOTQTn4JwGgatnM7K4233QxO1BRUNlnQvnAopuoMygU6qpbkFdMbPsGuUUtqdAK/HT/4pTH0rx4GC+vSUoZU9w4xspXZraMrP0rgLUxLoRS61mcB77dITPTo7MNTRoP0Tqc/Ybu4RARl3EjeRg0spy912fCMT5U6qxHA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757675660; c=relaxed/simple;
	bh=ihpFWe4dq614jo000yLElq0uq/thAHaDLt+4e0JLcmE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=UDZwwnzHcB+tSWU7YXB/JaUVmMJkukTko0TMqbw8lskPmurlZUUkqOt0/rfd7moa5TdhTbM1zEHkM8M0KVvbYG/5mAzl48mjW9VAI5yaAGrNBzbu2lJ6i2RyYUXiZQz5wXIgS+R0gk6YUynmSHjK7FQyv/0g2CaMgTebP9qHiig=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AE326C4CEF1;
	Fri, 12 Sep 2025 11:14:18 +0000 (UTC)
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>
Cc: linux-clk@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [GIT PULL] clk: renesas: Updates for v6.18 (take two)
Date: Fri, 12 Sep 2025 13:14:15 +0200
Message-ID: <cover.1757670020.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

	Hi Mike, Stephen,

The following changes since commit 6bbf77bb22565332744c74e9806f8fb50402d73e:

  clk: renesas: r9a09g047: Add GPT clocks and resets (2025-08-25 15:57:49 +0200)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-drivers.git tags/renesas-clk-for-v6.18-tag2

for you to fetch changes up to b5788b96cba97da01e1f0e1316133427c1102ff6:

  clk: renesas: r9a09g05[67]: Reduce differences (2025-09-12 09:53:37 +0200)

----------------------------------------------------------------
clk: renesas: Updates for v6.18 (take two)

  - Add Ethernet clocks on RZ/T2H and RZ/N2H,
  - Add USB3.0 clocks and resets on RZ/G3E,
  - Add I3C clocks and resets on RZ/V2H and RZ/V2N,
  - Miscellaneous fixes and improvements.

Note that this includes DT binding definition updates for the RZ/T2H,
RZ/N2H, and RZ/G3E SoCs, which are shared by clock driver and DT source
files.

Thanks for pulling!

----------------------------------------------------------------
Biju Das (2):
      dt-bindings: clock: renesas,r9a09g047-cpg: Add USB3.0 core clocks
      clk: renesas: r9a09g047: Add USB3.0 clocks/resets

Geert Uytterhoeven (3):
      Merge tag 'renesas-r9a09g077-dt-binding-defs-tag4' into renesas-clk-for-v6.18
      Merge tag 'renesas-r9a09g047-dt-binding-defs-tag4' into renesas-clk-for-v6.18
      clk: renesas: r9a09g05[67]: Reduce differences

Lad Prabhakar (4):
      dt-bindings: clock: renesas,r9a09g077/87: Add Ethernet clock IDs
      clk: renesas: r9a09g077: Add Ethernet Subsystem core and module clocks
      clk: renesas: r9a09g057: Add clock and reset entries for I3C
      clk: renesas: r9a09g056: Add clock and reset entries for I3C

Tommaso Merciai (4):
      clk: renesas: rzg2l: Simplify rzg2l_cpg_assert() and rzg2l_cpg_deassert()
      clk: renesas: rzg2l: Re-assert reset on deassert timeout
      clk: renesas: rzv2h: Re-assert reset on deassert timeout
      clk: renesas: rzv2h: Simplify polling condition in __rzv2h_cpg_assert()

Yuan CHen (1):
      clk: renesas: cpg-mssr: Fix memory leak in cpg_mssr_reserved_init()

 drivers/clk/renesas/r9a09g047-cpg.c                |  9 +++-
 drivers/clk/renesas/r9a09g056-cpg.c                | 16 +++++--
 drivers/clk/renesas/r9a09g057-cpg.c                | 11 ++++-
 drivers/clk/renesas/r9a09g077-cpg.c                | 14 +++++-
 drivers/clk/renesas/renesas-cpg-mssr.c             |  7 ++-
 drivers/clk/renesas/rzg2l-cpg.c                    | 52 +++++++++-------------
 drivers/clk/renesas/rzv2h-cpg.c                    | 12 +++--
 include/dt-bindings/clock/renesas,r9a09g047-cpg.h  |  2 +
 .../dt-bindings/clock/renesas,r9a09g077-cpg-mssr.h |  5 +++
 .../dt-bindings/clock/renesas,r9a09g087-cpg-mssr.h |  5 +++
 10 files changed, 90 insertions(+), 43 deletions(-)

Gr{oetje,eeting}s,

						Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
							    -- Linus Torvalds

