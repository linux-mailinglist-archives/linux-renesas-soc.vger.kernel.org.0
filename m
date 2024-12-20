Return-Path: <linux-renesas-soc+bounces-11631-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D17759F9043
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 20 Dec 2024 11:31:10 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 9BDC07A1AC9
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 20 Dec 2024 10:31:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EDD4E1BD017;
	Fri, 20 Dec 2024 10:31:01 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from albert.telenet-ops.be (albert.telenet-ops.be [195.130.137.90])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A936719F116
	for <linux-renesas-soc@vger.kernel.org>; Fri, 20 Dec 2024 10:30:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.130.137.90
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734690661; cv=none; b=JmxDN0cBydCeq2FvE5SzT3U75quXUmC5Q7BZ0SZylxy1Vfx0oooIqfFRzn4+m46XqyIZDu+E0PkY09iAC1J+tjvn0heLdhJ71iIFttXmurOzEdpG5UO6I7tJXKrxZitYcGSBufWIgktl9YifmIo5RY6gYyW9/0PPs7Ydcd7dJJE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734690661; c=relaxed/simple;
	bh=SOqtL9cvhNt9YJcGnNDKREujPJGl36Pc+5yLs0QvomQ=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=OBKdZ1IUpcCC6pagD40sr5zoGIxqAWFOmh397AVRm22u25NxTq5MWIP+X6Nq0zgqgreaDEF3/CEVwBurPMsp0r8oXYJfCx23lONhExZqfS/9FEpDmdn5x32vkzKt2gARIAigPrLUec6lo5L55qdgmACza5g6Cd1VbvICKdLvmKw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=glider.be; spf=none smtp.mailfrom=linux-m68k.org; arc=none smtp.client-ip=195.130.137.90
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=glider.be
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux-m68k.org
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed80:7a4e:e361:29f2:181c])
	by albert.telenet-ops.be with cmsmtp
	id qyWq2D00P5V3mYk06yWqa4; Fri, 20 Dec 2024 11:30:50 +0100
Received: from rox.of.borg ([192.168.97.57])
	by ramsan.of.borg with esmtp (Exim 4.95)
	(envelope-from <geert@linux-m68k.org>)
	id 1tOaHN-001s3d-5f;
	Fri, 20 Dec 2024 11:30:50 +0100
Received: from geert by rox.of.borg with local (Exim 4.95)
	(envelope-from <geert@linux-m68k.org>)
	id 1tOaFq-000gO3-1f;
	Fri, 20 Dec 2024 11:29:10 +0100
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>
Cc: linux-clk@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [GIT PULL] clk: renesas: Updates for v6.14
Date: Fri, 20 Dec 2024 11:29:08 +0100
Message-Id: <cover.1734689961.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

	Hi Mike, Stephen,

The following changes since commit 40384c840ea1944d7c5a392e8975ed088ecf0b37:

  Linux 6.13-rc1 (2024-12-01 14:28:56 -0800)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-drivers.git tags/renesas-clk-for-v6.14-tag1

for you to fetch changes up to f962745289958e89bf520407728e384e52ea8e27:

  clk: renesas: r9a08g045: Add clocks, resets and power domain support for the ADC IP (2024-12-10 12:02:24 +0100)

----------------------------------------------------------------
clk: renesas: Updates for v6.14

  - Add sound (SSI), remaining serial (SCIF), and ADC clocks, resets,
    and power domains on RZ/G3S,
  - Add system restart support on RZ/N1,
  - Add camera clocks and resets on RZ/V2H(P),
  - Add display clocks on R-Car V4M,
  - Miscellaneous fixes and improvements.

Thanks for pulling!

----------------------------------------------------------------
Claudiu Beznea (3):
      clk: renesas: r9a08g045: Add clocks, resets and power domains support for SSI
      clk: renesas: r9a08g045: Add clock, reset and power domain for the remaining SCIFs
      clk: renesas: r9a08g045: Add clocks, resets and power domain support for the ADC IP

Javier Carrasco (1):
      clk: renesas: cpg-mssr: Fix 'soc' node handling in cpg_mssr_reserved_init()

Lad Prabhakar (2):
      clk: renesas: rzv2h: Add selective Runtime PM support for clocks
      clk: renesas: r9a09g057: Add support for PLLVDO, CRU clocks, and resets

Tomi Valkeinen (1):
      clk: renesas: r8a779h0: Add display clocks

Wolfram Sang (2):
      clk: renesas: r9a06g032: Add restart handler
      clk: renesas: r9a06g032: Use BIT macro consistently

 drivers/clk/renesas/r8a779h0-cpg-mssr.c |  4 +++
 drivers/clk/renesas/r9a06g032-clocks.c  | 29 +++++++++++++++++++-
 drivers/clk/renesas/r9a08g045-cpg.c     | 47 +++++++++++++++++++++++++++++++++
 drivers/clk/renesas/r9a09g057-cpg.c     | 45 +++++++++++++++++++++++++++++++
 drivers/clk/renesas/renesas-cpg-mssr.c  |  2 +-
 drivers/clk/renesas/rzv2h-cpg.c         | 44 +++++++++++++++++++++++++++---
 drivers/clk/renesas/rzv2h-cpg.h         | 18 ++++++++++---
 7 files changed, 180 insertions(+), 9 deletions(-)

Gr{oetje,eeting}s,

						Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
							    -- Linus Torvalds

