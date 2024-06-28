Return-Path: <linux-renesas-soc+bounces-6894-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id ED59691BF5F
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 28 Jun 2024 15:16:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 2CC331C2114E
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 28 Jun 2024 13:16:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A6361B653;
	Fri, 28 Jun 2024 13:16:06 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from albert.telenet-ops.be (albert.telenet-ops.be [195.130.137.90])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B8C8F156653
	for <linux-renesas-soc@vger.kernel.org>; Fri, 28 Jun 2024 13:16:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.130.137.90
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719580566; cv=none; b=iUXQINldOUZi30sWEpMR7h0mu95B/h1AKzYQ7vR4mNVuLOwxJH0Ee+YM3R0yVsm1QfmfIHNsZJNcfTTlPZUQTdrUzyPf1Q/OviZdbR41fKZv1kOvMdsOpac/lPQGOxWS+1z5C6LEiPI2i4DFNUrw99MR1tlF1BiiHpjbOLKperU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719580566; c=relaxed/simple;
	bh=r/mHKZdQLqlpGC7g5dGwpMeeKMzSbf9wwJHTgeGdDvY=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version:Content-Type; b=eM2jX0W8XOezlTAO8xtoxNor0jklaFnaD3oJ7B88yOy2L/NNtYJpo7W5xrBiAq1rJdae6WJT8RO4PY40NP4zZDcdBSpctzMwMEdJ+i5DRGFelocgk6zdxSR+ANhZq9p+TywbEMoBmtWR1wQIxT1q8oF6l8GsWorctxkdOgbZoQg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=glider.be; spf=none smtp.mailfrom=linux-m68k.org; arc=none smtp.client-ip=195.130.137.90
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=glider.be
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux-m68k.org
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed80:acf4:1256:ab55:12e6])
	by albert.telenet-ops.be with bizsmtp
	id h1G22C00E5ECAAU061G2jd; Fri, 28 Jun 2024 15:16:02 +0200
Received: from rox.of.borg ([192.168.97.57])
	by ramsan.of.borg with esmtp (Exim 4.95)
	(envelope-from <geert@linux-m68k.org>)
	id 1sNBSG-000VGj-LP;
	Fri, 28 Jun 2024 15:16:02 +0200
Received: from geert by rox.of.borg with local (Exim 4.95)
	(envelope-from <geert@linux-m68k.org>)
	id 1sNBSM-00BlRv-H5;
	Fri, 28 Jun 2024 15:16:02 +0200
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>
Cc: linux-clk@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [GIT PULL] clk: renesas: Updates for v6.11 (take two)
Date: Fri, 28 Jun 2024 15:15:59 +0200
Message-Id: <cover.1719579479.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

	Hi Mike, Stephen,

The following changes since commit f92d44a00bd559f411b2c70b677afbc7c4723019:

  clk: renesas: r8a779h0: Add VIN clocks (2024-06-11 09:36:27 +0200)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-drivers.git tags/renesas-clk-for-v6.11-tag2

for you to fetch changes up to c7e58843d1e49a6b54d528a8ea34933cafb713f2:

  clk: renesas: r9a08g045: Add clock, reset and power domain support for I2C (2024-06-27 18:17:13 +0200)

----------------------------------------------------------------
clk: renesas: Updates for v6.11 (take two)

  - Remove obsolete clock DT binding header files,
  - Add Battery Backup (VBATTB) and I2C clocks, resets, and power
    domains on RZ/G3S,
  - Add audio clocks on R-Car V4M,
  - Miscellaneous fixes and improvements.

Thanks for pulling!

----------------------------------------------------------------
Claudiu Beznea (2):
      clk: renesas: r9a08g045: Add clock, reset and power domain support for the VBATTB IP
      clk: renesas: r9a08g045: Add clock, reset and power domain support for I2C

Geert Uytterhoeven (3):
      clk: renesas: r8a779h0: Fix PLL2/PLL4 multipliers in comments
      clk: renesas: Drop "Renesas" from individual driver descriptions
      dt-bindings: clock: rcar-gen2: Remove obsolete header files

Kuninori Morimoto (1):
      clk: renesas: r8a779h0: Add Audio clocks

Marek Vasut (1):
      dt-bindings: clock: r8a7779: Remove duplicate newline

 drivers/clk/renesas/Kconfig               |   4 +-
 drivers/clk/renesas/r8a779h0-cpg-mssr.c   |   8 +-
 drivers/clk/renesas/r9a08g045-cpg.c       |  26 +++++
 include/dt-bindings/clock/r8a7779-clock.h |   1 -
 include/dt-bindings/clock/r8a7790-clock.h | 158 -----------------------------
 include/dt-bindings/clock/r8a7791-clock.h | 161 ------------------------------
 include/dt-bindings/clock/r8a7792-clock.h |  98 ------------------
 include/dt-bindings/clock/r8a7793-clock.h | 159 -----------------------------
 include/dt-bindings/clock/r8a7794-clock.h | 137 -------------------------
 9 files changed, 33 insertions(+), 719 deletions(-)
 delete mode 100644 include/dt-bindings/clock/r8a7790-clock.h
 delete mode 100644 include/dt-bindings/clock/r8a7791-clock.h
 delete mode 100644 include/dt-bindings/clock/r8a7792-clock.h
 delete mode 100644 include/dt-bindings/clock/r8a7793-clock.h
 delete mode 100644 include/dt-bindings/clock/r8a7794-clock.h

Gr{oetje,eeting}s,

						Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
							    -- Linus Torvalds

