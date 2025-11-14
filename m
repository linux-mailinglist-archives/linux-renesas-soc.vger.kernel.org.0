Return-Path: <linux-renesas-soc+bounces-24639-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 85A1AC5CA1A
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 14 Nov 2025 11:40:26 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 82B394F3F5B
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 14 Nov 2025 10:30:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 13A813126D2;
	Fri, 14 Nov 2025 10:30:49 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC1EE2BF015;
	Fri, 14 Nov 2025 10:30:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763116249; cv=none; b=D3PErzW/4kKM81K7ncwY7bJNK5tUv8xXd0lvtzMNNTk/QR1M9pz0UdwEX0pAicj/c7KYfIahdmp7P7hFAOpZPnDDd6omB6cNV7O4PBmjCG2PCDRnydzUMJb9Q0AOtMEmCSOLEOQ5Au/NrfyVXihbLZNJxwKNtyFaujtO4PoHbAQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763116249; c=relaxed/simple;
	bh=tTqtRXYto2sHeJQ2CTwzUyBfEa4VZEkNAH+Sob2qicY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=kxFkgB9f8F18OmFH4T6qec+ghRiCB9dMN5pp/GTvL9/KMEdJV3u9jKb/uUGj2huE2ygc0EXnkyis1ex4SBeb+Avee/EBKQpmdrG3f9ws7SAf4WzLfSf5iNkLlhlBgASbenoXrw3CnvkWEcCvtbd3mXyjZ7ccJGFHSbH2t9zNSUA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6B0B9C4CEFB;
	Fri, 14 Nov 2025 10:30:47 +0000 (UTC)
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>
Cc: linux-clk@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [GIT PULL] clk: renesas: Updates for v6.19 (take two)
Date: Fri, 14 Nov 2025 11:30:41 +0100
Message-ID: <cover.1763115635.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

	Hi Mike, Stephen,

The following changes since commit 07525a693a5ff6592668a0fd647153e4b4933cae:

  clk: renesas: r9a09g056: Add clock and reset entries for ISP (2025-10-27 12:15:00 +0100)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-drivers.git tags/renesas-clk-for-v6.19-tag2

for you to fetch changes up to 5fb2f67341bd4b7c482f2bbda6b78244a51c3923:

  clk: renesas: r9a09g077: Add SPI module clocks (2025-11-13 21:18:25 +0100)

----------------------------------------------------------------
clk: renesas: Updates for v6.19 (take two)

  - Add GPU clocks on R-Car V3U,
  - Add USB3.0 clocks and resets on RZ/V2H and RZ/V2N,
  - Add more serial (RSCI) clocks and resets on RZ/G3E,
  - Add SPI clocks on RZ/T2H and RZ/N2H,
  - Miscellaneous fixes and improvements.

Note that this includes DT binding definition updates for the R-Car V3U,
RZ/V2H, and RZ/V2N SoCs, which are shared by clock driver and DT source
files.

Thanks for pulling!

----------------------------------------------------------------
Biju Das (1):
      clk: renesas: r9a09g047: Add RSCI clocks/resets

Cosmin Tanislav (1):
      clk: renesas: r9a09g077: Add SPI module clocks

Geert Uytterhoeven (2):
      Merge tag 'renesas-r8a779a0-dt-binding-defs-tag2' into renesas-clk-for-v6.19
      Merge tag 'renesas-r9a09g057-dt-binding-defs-tag5' into renesas-clk-for-v6.19

Haotian Zhang (1):
      clk: renesas: r9a06g032: Fix memory leak in error path

Lad Prabhakar (7):
      clk: renesas: r9a09g077: Propagate rate changes to parent clocks
      clk: renesas: r9a09g077: Remove stray blank line
      clk: renesas: r9a09g077: Use devm_ helpers for divider clock registration
      dt-bindings: clock: renesas,r9a09g057-cpg: Add USB3.0 core clocks
      dt-bindings: clock: renesas,r9a09g056-cpg: Add USB3.0 core clocks
      clk: renesas: r9a09g057: Add USB3.0 clocks/resets
      clk: renesas: r9a09g056: Add USB3.0 clocks/resets

Niklas Söderlund (4):
      dt-bindings: clock: r8a779a0: Add ZG core clock
      clk: renesas: rcar-gen4: Add support for clock dividers in FRQCRB
      clk: renesas: r8a779a0: Add ZG Core clock
      clk: renesas: r8a779a0: Add 3DGE module clock

 drivers/clk/renesas/r8a779a0-cpg-mssr.c           |   7 +-
 drivers/clk/renesas/r9a06g032-clocks.c            |   6 +-
 drivers/clk/renesas/r9a09g047-cpg.c               | 126 ++++++++++++++++++++++
 drivers/clk/renesas/r9a09g056-cpg.c               |   9 +-
 drivers/clk/renesas/r9a09g057-cpg.c               |  16 ++-
 drivers/clk/renesas/r9a09g077-cpg.c               |  53 ++++++---
 drivers/clk/renesas/rcar-gen4-cpg.c               |   9 +-
 include/dt-bindings/clock/r8a779a0-cpg-mssr.h     |   1 +
 include/dt-bindings/clock/renesas,r9a09g056-cpg.h |   2 +
 include/dt-bindings/clock/renesas,r9a09g057-cpg.h |   4 +
 10 files changed, 209 insertions(+), 24 deletions(-)

Gr{oetje,eeting}s,

						Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
							    -- Linus Torvalds

