Return-Path: <linux-renesas-soc+bounces-4923-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 88B3F8B3206
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 26 Apr 2024 10:10:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id BA3D81C21241
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 26 Apr 2024 08:10:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3238513A87E;
	Fri, 26 Apr 2024 08:10:16 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from andre.telenet-ops.be (andre.telenet-ops.be [195.130.132.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D69028120A
	for <linux-renesas-soc@vger.kernel.org>; Fri, 26 Apr 2024 08:10:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.130.132.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714119016; cv=none; b=gxYm8g4jQOT2eN07R/tz4hRmL9ImoDlD34/NUPpxlHnpd1YTBqOMK79KXxpzuv/a2hu2G3FL4QeJIzROBjg+fh4Pu9uVpLWFOc06J3Ea0GcVTxnwK1u2CNkv8r/TsCF4w2752nZAg5wEXqyFJffhFAnj/rNuheWr5wNaOp+2tz8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714119016; c=relaxed/simple;
	bh=CMviMs+7gm4UYtU6FN68VHTincwAtKHeJMkk5LmCKSg=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=iHLFaEobLAML3MZRA+zV28TfaZPVLBzmDcLVQi3Yj2YNNjIJI2xBThTKuanSr3IKhDjMtiMKBYNiEfYdjvckxoYuM+Q+3C2h7x+SzRC3NqSWlWG4t2GD9UTjHvuh23/GfZQe1rF6pkwjvLfcmWeKfTKaUCfVO0OLS0rvJsLihXU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=glider.be; spf=none smtp.mailfrom=linux-m68k.org; arc=none smtp.client-ip=195.130.132.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=glider.be
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux-m68k.org
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed80:a8cf:a8c7:966f:f6c0])
	by andre.telenet-ops.be with bizsmtp
	id FkAB2C00Q4stinQ01kAB2U; Fri, 26 Apr 2024 10:10:11 +0200
Received: from rox.of.borg ([192.168.97.57])
	by ramsan.of.borg with esmtp (Exim 4.95)
	(envelope-from <geert@linux-m68k.org>)
	id 1s0Ge9-00ACZg-Gp;
	Fri, 26 Apr 2024 10:10:11 +0200
Received: from geert by rox.of.borg with local (Exim 4.95)
	(envelope-from <geert@linux-m68k.org>)
	id 1s0Gep-00CeZX-Fd;
	Fri, 26 Apr 2024 10:10:11 +0200
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>
Cc: linux-clk@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [GIT PULL] clk: renesas: Updates for v6.10 (take two)
Date: Fri, 26 Apr 2024 10:10:10 +0200
Message-Id: <cover.1714118682.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

	Hi Mike, Stephen,

The following changes since commit c0516eb4cf04ac61b6fe1f86cc15b2f5f024ee78:

  clk: renesas: r8a779h0: Add timer clocks (2024-04-08 11:12:32 +0200)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-drivers.git tags/renesas-clk-for-v6.10-tag2

for you to fetch changes up to 5add5ebc4e35a703a49976abfd82e708d9aea4ad:

  clk: renesas: r9a08g045: Add support for power domains (2024-04-25 20:12:17 +0200)

----------------------------------------------------------------
clk: renesas: Updates for v6.10 (take two)

  - Miscellaneous fixes and improvements.
  - Add SPI (MSIOF) and external interrupt (INTC-EX) clocks on R-Car
    V4M,
  - Add interrupt controller (PLIC) clock and reset on RZ/Five,
  - Prepare power domain support for RZ/G2L family members, and add
    actual support on RZ/G3S SoC.

Thanks for pulling!

----------------------------------------------------------------
Christophe JAILLET (1):
      clk: renesas: r8a7740: Remove unused div4_clk.flags field

Claudiu Beznea (7):
      dt-bindings: clock: r9a07g043-cpg: Add power domain IDs
      dt-bindings: clock: r9a07g044-cpg: Add power domain IDs
      dt-bindings: clock: r9a07g054-cpg: Add power domain IDs
      dt-bindings: clock: r9a08g045-cpg: Add power domain IDs
      dt-bindings: clock: renesas,rzg2l-cpg: Update #power-domain-cells = <1> for RZ/G3S
      clk: renesas: rzg2l: Extend power domain support
      clk: renesas: r9a08g045: Add support for power domains

Cong Dang (2):
      clk: renesas: r8a779h0: Add MSIOF clocks
      clk: renesas: r8a779h0: Add INTC-EX clock

Geert Uytterhoeven (2):
      clk: renesas: r8a779a0: Fix CANFD parent clock
      clk: renesas: shmobile: Remove unused CLK_ENABLE_ON_INIT

Lad Prabhakar (1):
      clk: renesas: r9a07g043: Add clock and reset entry for PLIC

 .../bindings/clock/renesas,rzg2l-cpg.yaml          |  18 +-
 drivers/clk/renesas/clk-r8a73a4.c                  |   2 -
 drivers/clk/renesas/clk-r8a7740.c                  |  27 ++-
 drivers/clk/renesas/clk-sh73a0.c                   |   2 -
 drivers/clk/renesas/r8a779a0-cpg-mssr.c            |   2 +-
 drivers/clk/renesas/r8a779h0-cpg-mssr.c            |   7 +
 drivers/clk/renesas/r9a07g043-cpg.c                |   9 +
 drivers/clk/renesas/r9a08g045-cpg.c                |  41 +++++
 drivers/clk/renesas/rzg2l-cpg.c                    | 199 +++++++++++++++++++--
 drivers/clk/renesas/rzg2l-cpg.h                    |  67 +++++++
 include/dt-bindings/clock/r9a07g043-cpg.h          |  52 ++++++
 include/dt-bindings/clock/r9a07g044-cpg.h          |  58 ++++++
 include/dt-bindings/clock/r9a07g054-cpg.h          |  58 ++++++
 include/dt-bindings/clock/r9a08g045-cpg.h          |  70 ++++++++
 14 files changed, 577 insertions(+), 35 deletions(-)

Gr{oetje,eeting}s,

						Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
							    -- Linus Torvalds

