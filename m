Return-Path: <linux-renesas-soc+bounces-8006-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id DE66495B140
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 22 Aug 2024 11:14:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 9482D1F23004
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 22 Aug 2024 09:14:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 858B917B401;
	Thu, 22 Aug 2024 09:14:14 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from baptiste.telenet-ops.be (baptiste.telenet-ops.be [195.130.132.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC11017A92F
	for <linux-renesas-soc@vger.kernel.org>; Thu, 22 Aug 2024 09:14:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.130.132.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724318054; cv=none; b=cgfacBrbutM0W2XVrc1lIWIq8iVdX+YUvQzeNoiWkjhgNBkLO1UG1Rz8puIoSSyebZetOTJDUJQBQ0gBy4e/3DnDrlkMHo12YMEbSdUVa7VNwq9wuqojhhrJHOSkXYPrlszs5FHQF/pEkH7KRYxhUuOubPO7/OOsilSi/ArMd4M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724318054; c=relaxed/simple;
	bh=ZEn582CeTz1VVi0VgC29FzZH4xdaCnRULOwrh5+x7t4=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=GMsLsKkB72smGg9hhkmhZXU69oeGclD7EcOUecK4T/ZcB0U2VM489J5Ax8cB0BQ7RuqDl0LGALYp6CwELvy8GewFJmmH2VInwc79mpKGhbHygQaOn2rU6z2yn6wMqcfcs7mEHTTrNQFGO0GKt92g1OcNd0UBbg4/WJovYl6WYGw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=glider.be; spf=none smtp.mailfrom=linux-m68k.org; arc=none smtp.client-ip=195.130.132.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=glider.be
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux-m68k.org
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed80:410c:b78a:c35b:cd3e])
	by baptiste.telenet-ops.be with bizsmtp
	id 2xEA2D00X22R5AR01xEAHc; Thu, 22 Aug 2024 11:14:10 +0200
Received: from rox.of.borg ([192.168.97.57])
	by ramsan.of.borg with esmtp (Exim 4.95)
	(envelope-from <geert@linux-m68k.org>)
	id 1sh3tQ-000VYO-8J;
	Thu, 22 Aug 2024 11:14:10 +0200
Received: from geert by rox.of.borg with local (Exim 4.95)
	(envelope-from <geert@linux-m68k.org>)
	id 1sh3tS-002LKm-Fy;
	Thu, 22 Aug 2024 11:14:10 +0200
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>
Cc: linux-clk@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [GIT PULL] clk: renesas: Updates for v6.12
Date: Thu, 22 Aug 2024 11:14:09 +0200
Message-Id: <cover.1724317714.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

	Hi Mike, Stephen,

The following changes since commit 8400291e289ee6b2bf9779ff1c83a291501f017b:

  Linux 6.11-rc1 (2024-07-28 14:19:55 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-drivers.git tags/renesas-clk-for-v6.12-tag1

for you to fetch changes up to 120c2833b72f4bdbd67ea2cf70b9d96d1c235717:

  clk: renesas: r8a779h0: Add CANFD clock (2024-08-20 09:48:24 +0200)

----------------------------------------------------------------
clk: renesas: Updates for v6.12

  - Add PCIe, PWM, and CAN-FD clocks on R-Car V4M,
  - Add LCD controller clocks and resets on RZ/G2UL,
  - Add DMA clocks and resets on RZ/G3S,
  - Add fractional multiplication PLL support on R-Car Gen4,
  - Document support for the Renesas RZ/G2M v3.0 (r8a774a3) SoC,
  - Add support for the RZ/V2H(P) (R9A09G057) SoC,
  - Miscellaneous fixes and improvements.

Thanks for pulling!

----------------------------------------------------------------
Biju Das (1):
      clk: renesas: r9a07g043: Add LCDC clock and reset entries

Claudiu Beznea (1):
      clk: renesas: r9a08g045: Add DMA clocks and resets

Cong Dang (2):
      clk: renesas: r8a779h0: Add PWM clock
      clk: renesas: r8a779h0: Add CANFD clock

Geert Uytterhoeven (19):
      clk: renesas: r8a779a0: cpg_pll_configs should be __initconst
      clk: renesas: r8a779f0: cpg_pll_configs should be __initconst
      clk: renesas: r8a779g0: cpg_pll_configs should be __initconst
      clk: renesas: r8a779h0: Initial clock descriptions should be __initconst
      clk: renesas: rcar-gen4: Removed unused SSMODE_* definitions
      clk: renesas: rcar-gen4: Clarify custom PLL clock support
      clk: renesas: rcar-gen4: Use FIELD_GET()
      clk: renesas: rcar-gen4: Use defines for common CPG registers
      clk: renesas: rcar-gen4: Add support for fractional multiplication
      clk: renesas: rcar-gen4: Add support for variable fractional PLLs
      clk: renesas: rcar-gen4: Add support for fixed variable PLLs
      clk: renesas: rcar-gen4: Add support for fractional 9.24 PLLs
      clk: renesas: r8a779a0: Use defines for PLL control registers
      clk: renesas: r8a779f0: Model PLL1/2/3/6 as fractional PLLs
      clk: renesas: r8a779g0: Model PLL1/3/4/6 as fractional PLLs
      clk: renesas: r8a779h0: Model PLL1/2/3/4/6 as fractional PLLs
      clk: renesas: rcar-gen4: Remove unused variable PLL2 clock type
      clk: renesas: rcar-gen4: Remove unused fixed PLL clock types
      clk: renesas: rcar-gen4: Remove unused default PLL2/3/4/6 configs

Lad Prabhakar (5):
      clk: renesas: rzg2l-cpg: Use devres API to register clocks
      clk: renesas: rzg2l-cpg: Refactor to use priv for clks and base in clock register functions
      dt-bindings: clock: renesas: Document RZ/V2H(P) SoC CPG
      clk: renesas: Add family-specific clock driver for RZ/V2H(P)
      clk: renesas: Add RZ/V2H(P) CPG driver

Oliver Rhodes (1):
      dt-bindings: clock: renesas,cpg-mssr: Document RZ/G2M v3.0 (r8a774a3) clock

Yoshihiro Shimoda (1):
      clk: renesas: r8a779h0: Add PCIe clock

 .../bindings/clock/renesas,cpg-mssr.yaml           |   1 +
 .../bindings/clock/renesas,rzv2h-cpg.yaml          |  80 +++
 drivers/clk/renesas/Kconfig                        |   9 +
 drivers/clk/renesas/Makefile                       |   2 +
 drivers/clk/renesas/r8a779a0-cpg-mssr.c            |  37 +-
 drivers/clk/renesas/r8a779f0-cpg-mssr.c            |  30 +-
 drivers/clk/renesas/r8a779g0-cpg-mssr.c            |  38 +-
 drivers/clk/renesas/r8a779h0-cpg-mssr.c            |  41 +-
 drivers/clk/renesas/r9a07g043-cpg.c                |  12 +
 drivers/clk/renesas/r9a08g045-cpg.c                |   3 +
 drivers/clk/renesas/r9a09g057-cpg.c                |  80 +++
 drivers/clk/renesas/rcar-gen4-cpg.c                | 210 ++++---
 drivers/clk/renesas/rcar-gen4-cpg.h                |  36 +-
 drivers/clk/renesas/rzg2l-cpg.c                    |  71 ++-
 drivers/clk/renesas/rzv2h-cpg.c                    | 690 +++++++++++++++++++++
 drivers/clk/renesas/rzv2h-cpg.h                    | 151 +++++
 include/dt-bindings/clock/renesas,r9a09g057-cpg.h  |  21 +
 17 files changed, 1325 insertions(+), 187 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/clock/renesas,rzv2h-cpg.yaml
 create mode 100644 drivers/clk/renesas/r9a09g057-cpg.c
 create mode 100644 drivers/clk/renesas/rzv2h-cpg.c
 create mode 100644 drivers/clk/renesas/rzv2h-cpg.h
 create mode 100644 include/dt-bindings/clock/renesas,r9a09g057-cpg.h

Gr{oetje,eeting}s,

						Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
							    -- Linus Torvalds

