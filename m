Return-Path: <linux-renesas-soc+bounces-21080-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id C9839B3BAFC
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 29 Aug 2025 14:18:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 26C244E04FA
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 29 Aug 2025 12:18:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 390273148AC;
	Fri, 29 Aug 2025 12:18:40 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1EBDD3128BA;
	Fri, 29 Aug 2025 12:18:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756469920; cv=none; b=PUxWMdl0vlWBVvo70iiKOL4swDwcBnM/Pc41ZmJ+loPVN4sEFsW348gC/qcd0atZZbeK6WhQcokTqOecqQrUY0u+VP+6NIdRQlS4Mi9DMHs5YvvyA9IMKimgXW/O9ofKk4ioonRVIj1emcje1bgTI9/GMLWTgrrYSFG8oGIrsH8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756469920; c=relaxed/simple;
	bh=A2UcC2Spy8fXkJkpa5GTZfEnkeSzPGRwdV1fYBisDqU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=kmhNLKJ2lzG+MfhT8ME+KWDI8Cjj9hiYuo+r7109HajdX7mE0RhKgWJQ3u+z2qnvsr/VnHr8uBx7NJ5+84nIKtTj2xAPiUFqtK1aWSYqizlzCi/CLFo4EquHUpIv/1+fuXSf3SkAX86rCRqY07dEL6wEQ91sHGtbYk6y7ztWIXI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ACA4FC4CEF1;
	Fri, 29 Aug 2025 12:18:38 +0000 (UTC)
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>
Cc: linux-clk@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [GIT PULL] clk: renesas: Updates for v6.18
Date: Fri, 29 Aug 2025 14:18:34 +0200
Message-ID: <cover.1756469006.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

	Hi Mike, Stephen,

The following changes since commit f63aaf6e71de897954fbde4e4a17a9dcdbe5e7e1:

  clk: renesas: mstp: Add genpd OF provider at postcore_initcall() (2025-08-18 09:36:55 +0200)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-drivers.git tags/renesas-clk-for-v6.18-tag1

for you to fetch changes up to 6bbf77bb22565332744c74e9806f8fb50402d73e:

  clk: renesas: r9a09g047: Add GPT clocks and resets (2025-08-25 15:57:49 +0200)

----------------------------------------------------------------
clk: renesas: Updates for v6.18

  - Add USB and remaining serial (SCI) clocks and resets on RZ/T2H and
    RZ/N2H,
  - Add I3C and PCIe clocks and resets on RZ/G3S,
  - Add DMAC and PWM (GPT) clocks and resets on RZ/G3E,
  - Add Module Stop (MSTOP) support on RZ/G2L and RZ/G2UL,
  - Convert from round_rate() to determine_rate(),
  - Miscellaneous fixes and improvements.

Note that:
  1. This is based on renesas-clk-fixes-for-v6.17-tag1, which you
     have not pulled yet,
  2. This includes DT binding definition updates for the RZ/T2H and
     RZ/N2H SoCs, which are shared by clock driver, pin control driver,
     and DT source files.

Thanks for pulling!

----------------------------------------------------------------
Biju Das (1):
      clk: renesas: r9a09g047: Add GPT clocks and resets

Brian Masney (2):
      clk: renesas: rzg2l: convert from round_rate() to determine_rate()
      clk: renesas: rzv2h: remove round_rate() in favor of determine_rate()

Claudiu Beznea (5):
      clk: renesas: r9a08g045: Add PCIe clocks and resets
      clk: renesas: r9a08g045: Add MSTOP for GPIO
      clk: renesas: r9a07g044: Add MSTOP for RZ/G2L
      clk: renesas: r9a07g043: Add MSTOP for RZ/G2UL
      clk: renesas: r9a07g04[34]: Use tabs instead of spaces

Geert Uytterhoeven (1):
      Merge tag 'renesas-r9a09g077-dt-binding-defs-tag3' into renesas-clk-for-v6.18

Lad Prabhakar (4):
      dt-bindings: clock: renesas,r9a09g077/87: Add USB_CLK clock ID
      dt-bindings: pinctrl: renesas: Document RZ/T2H and RZ/N2H SoCs
      clk: renesas: r9a09g077: Add USB core and module clocks
      clk: renesas: r9a09g077: Add module clocks for SCI1-SCI5

Tommaso Merciai (1):
      clk: renesas: r9a09g047: Add DMAC clocks and resets

Wolfram Sang (1):
      clk: renesas: r9a08g045: Add I3C clocks and resets

 .../pinctrl/renesas,r9a09g077-pinctrl.yaml         | 172 +++++++++++++++++++++
 drivers/clk/renesas/r9a07g043-cpg.c                | 140 ++++++++---------
 drivers/clk/renesas/r9a07g044-cpg.c                | 162 +++++++++----------
 drivers/clk/renesas/r9a08g045-cpg.c                |  29 +++-
 drivers/clk/renesas/r9a09g047-cpg.c                |  27 ++++
 drivers/clk/renesas/r9a09g077-cpg.c                |  29 +++-
 drivers/clk/renesas/rzg2l-cpg.c                    |   9 +-
 drivers/clk/renesas/rzg2l-cpg.h                    |   1 +
 drivers/clk/renesas/rzv2h-cpg.c                    |  10 --
 .../dt-bindings/clock/renesas,r9a09g077-cpg-mssr.h |   1 +
 .../dt-bindings/clock/renesas,r9a09g087-cpg-mssr.h |   1 +
 .../pinctrl/renesas,r9a09g077-pinctrl.h            |  22 +++
 12 files changed, 435 insertions(+), 168 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/pinctrl/renesas,r9a09g077-pinctrl.yaml
 create mode 100644 include/dt-bindings/pinctrl/renesas,r9a09g077-pinctrl.h

Gr{oetje,eeting}s,

						Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
							    -- Linus Torvalds

