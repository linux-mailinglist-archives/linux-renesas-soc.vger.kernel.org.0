Return-Path: <linux-renesas-soc+bounces-13490-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 9BB44A3FCA9
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 21 Feb 2025 18:04:07 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 459CE7AB5EF
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 21 Feb 2025 17:01:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DDF2C244198;
	Fri, 21 Feb 2025 17:02:05 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from xavier.telenet-ops.be (xavier.telenet-ops.be [195.130.132.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D716824396A
	for <linux-renesas-soc@vger.kernel.org>; Fri, 21 Feb 2025 17:02:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.130.132.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740157325; cv=none; b=g/L7RcHL9FF6cpSORupAIcdODykURI3gg2L0ac7jiR5vQDWl+R3nNCOv6cUT33dlmAy41JrMYZfcbHNBAeGiYHHiIC5Bbm5knwEIzxqL+RrYzZzbfApy86pr5BAHNHQjwTfGtafST7nDWLh5t6or4oj/M+4YIAH+eUI83qKsUj8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740157325; c=relaxed/simple;
	bh=G5jh78CS0PPFWm2IO43oDWs13N7ANvB9PlARKyawR+4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=PIgmqXHTfk2GUzgjELez6vGef9LuOvU+DmxvQSr5aaImQDPULqQEXBjv3Rt2o4+RJaTRmeO+isfDvJ1lL5NGI0S4mtYW02cnly6LBd1R0pGNTgyWEebe2C+GrZa6+1ZaTEx62y9qchMlXtvlAFiB4gJNlP78ACJHf8kx8Zagz+I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=glider.be; spf=none smtp.mailfrom=linux-m68k.org; arc=none smtp.client-ip=195.130.132.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=glider.be
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux-m68k.org
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed80:ae9a:419e:d123:9695])
	by xavier.telenet-ops.be with cmsmtp
	id GH212E00L0y8aK501H21Cd; Fri, 21 Feb 2025 18:02:01 +0100
Received: from rox.of.borg ([192.168.97.57])
	by ramsan.of.borg with esmtp (Exim 4.97)
	(envelope-from <geert@linux-m68k.org>)
	id 1tlWPF-0000000BMsv-0Ddx;
	Fri, 21 Feb 2025 18:02:01 +0100
Received: from geert by rox.of.borg with local (Exim 4.97)
	(envelope-from <geert@linux-m68k.org>)
	id 1tlWPZ-0000000EP5f-1eof;
	Fri, 21 Feb 2025 18:02:01 +0100
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>
Cc: linux-clk@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [GIT PULL] clk: renesas: Updates for v6.15
Date: Fri, 21 Feb 2025 18:01:59 +0100
Message-ID: <cover.1740157133.git.geert+renesas@glider.be>
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

The following changes since commit 2014c95afecee3e76ca4a56956a936e23283f05b:

  Linux 6.14-rc1 (2025-02-02 15:39:26 -0800)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-drivers.git tags/renesas-clk-for-v6.15-tag1

for you to fetch changes up to 9b12504e8c8c2f1f7e5f16afdd829603dd0c9508:

  clk: renesas: r9a09g047: Add CANFD clocks and resets (2025-02-20 17:42:03 +0100)

----------------------------------------------------------------
clk: renesas: Updates for v6.15

  - Add thermal (TSU) clock, reset, and power domain on RZ/G3S,
  - Add AI accelerator (DRP-AI) clocks and reset on RZ/V2L,
  - Add Image Signal Processor (ISP, FCPVX, VSPX) clocks on R-Car V3U,
    V4H, and V4M,
  - Add Watchdog (WDT), SDHI, Interrupt Controller (ICU), Camera (CRU0),
    and CAN-FD clocks and resets on RZ/G3E,
  - Miscellaneous fixes and improvements.

Thanks for pulling!

----------------------------------------------------------------
Biju Das (4):
      clk: renesas: r9a09g047: Add WDT clocks and resets
      clk: renesas: r9a09g047: Add SDHI clocks/resets
      clk: renesas: r9a09g047: Add ICU clock/reset
      clk: renesas: r9a09g047: Add CANFD clocks and resets

Claudiu Beznea (2):
      clk: renesas: r9a08g045: Add clocks, resets and power domain support for the TSU IP
      clk: renesas: r8a08g045: Check the source of the CPU PLL settings

Lad Prabhakar (5):
      clk: renesas: rzg2l-cpg: Refactor Runtime PM clock validation
      clk: renesas: r9a07g044: Add clock and reset entry for DRP-AI
      clk: renesas: r9a07g043: Fix HP clock source for RZ/Five
      clk: renesas: rzg2l: Update error message
      clk: renesas: rzv2h: Update error message

Niklas Söderlund (6):
      clk: renesas: r8a779a0: Add FCPVX clocks
      clk: renesas: r8a779a0: Add ISP core clocks
      clk: renesas: r8a779g0: Add ISP core clocks
      clk: renesas: r8a779h0: Add ISP core clocks
      clk: renesas: r8a779h0: Add FCPVX clock
      clk: renesas: r8a779h0: Add VSPX clock

Tommaso Merciai (1):
      clk: renesas: r9a09g047: Add CRU0 clocks and resets

 drivers/clk/renesas/r8a779a0-cpg-mssr.c |   8 +++
 drivers/clk/renesas/r8a779g0-cpg-mssr.c |   2 +
 drivers/clk/renesas/r8a779h0-cpg-mssr.c |   3 +
 drivers/clk/renesas/r9a07g043-cpg.c     |   7 ++
 drivers/clk/renesas/r9a07g044-cpg.c     |  55 ++++++++++++++-
 drivers/clk/renesas/r9a08g045-cpg.c     |   9 ++-
 drivers/clk/renesas/r9a09g047-cpg.c     |  83 ++++++++++++++++++++++
 drivers/clk/renesas/rzg2l-cpg.c         | 119 ++++++++++++++++++--------------
 drivers/clk/renesas/rzg2l-cpg.h         |  12 +++-
 drivers/clk/renesas/rzv2h-cpg.c         |   4 +-
 10 files changed, 242 insertions(+), 60 deletions(-)

Gr{oetje,eeting}s,

						Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
							    -- Linus Torvalds

Thanks for pulling!

Gr{oetje,eeting}s,

						Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
							    -- Linus Torvalds

