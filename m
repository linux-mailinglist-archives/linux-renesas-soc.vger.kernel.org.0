Return-Path: <linux-renesas-soc+bounces-2543-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id CF63584FA51
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  9 Feb 2024 17:58:27 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 85C0B1F237A3
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  9 Feb 2024 16:58:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EFFAE7F496;
	Fri,  9 Feb 2024 16:55:28 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from riemann.telenet-ops.be (riemann.telenet-ops.be [195.130.137.80])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 00F697E116
	for <linux-renesas-soc@vger.kernel.org>; Fri,  9 Feb 2024 16:55:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.130.137.80
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707497728; cv=none; b=p/jHWkNG49sSOzG8w13EW2TmTh8J5hSteHqwYFQS7E+/3qArOiGSszwV9wYUIdo0Z/YxLZHAwfZCQF1AZi7Lke2ln0p6yzthUpMbDq90LCElGEAIMmENKGV6dS8DZjr3hhx6Qa6OIO61+UjmdXp51pk6hEsHze950lbTDC9E128=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707497728; c=relaxed/simple;
	bh=Ar6jZZtmxNtSGD1n3iT9Lz+PyHaa/Q+C5SBE/Q9Zo60=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=eI4jHVZSqT2MaqOH7JgCcMYfSb/fETpADwxnsn9FDr8xzdxHL1vV7Y65b96FwMlWgtnrgOQewTNNVB4mT6XuAxBt+degTG7+5hrRezi8jB1ypcefNPB1cH9OT4AxGPtG5IOMlqgw/2TV/4TGFmUT+GqLauyAjvBaNjcc24QvgnQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=glider.be; spf=none smtp.mailfrom=linux-m68k.org; arc=none smtp.client-ip=195.130.137.80
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=glider.be
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux-m68k.org
Received: from baptiste.telenet-ops.be (baptiste.telenet-ops.be [IPv6:2a02:1800:120:4::f00:13])
	by riemann.telenet-ops.be (Postfix) with ESMTPS id 4TWg2j288Bz4wyFj
	for <linux-renesas-soc@vger.kernel.org>; Fri,  9 Feb 2024 17:55:25 +0100 (CET)
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed40:55fd:ff17:c1c8:954d])
	by baptiste.telenet-ops.be with bizsmtp
	id l4vJ2B00A4RKXn6014vJmM; Fri, 09 Feb 2024 17:55:18 +0100
Received: from rox.of.borg ([192.168.97.57])
	by ramsan.of.borg with esmtp (Exim 4.95)
	(envelope-from <geert@linux-m68k.org>)
	id 1rYU9i-0008Gw-0U;
	Fri, 09 Feb 2024 17:55:18 +0100
Received: from geert by rox.of.borg with local (Exim 4.95)
	(envelope-from <geert@linux-m68k.org>)
	id 1rYU9m-0061H2-81;
	Fri, 09 Feb 2024 17:55:18 +0100
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>
Cc: linux-clk@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [GIT PULL] clk: renesas: Updates for v6.9
Date: Fri,  9 Feb 2024 17:55:15 +0100
Message-Id: <cover.1707496335.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

	Hi Mike, Stephen,

The following changes since commit 6613476e225e090cc9aad49be7fa504e290dd33d:

  Linux 6.8-rc1 (2024-01-21 14:11:32 -0800)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-drivers.git tags/renesas-clk-for-v6.9-tag1

for you to fetch changes up to 5aaa139b9a03e1a43484a73248c6353a9c4d95c6:

  clk: renesas: r8a779h0: Add I2C clocks (2024-02-06 11:20:12 +0100)

----------------------------------------------------------------
clk: renesas: Updates for v6.9

  - Ignore all clocks which are assigned to a non-Linux system,
  - Add watchdog clock on RZ/G3S,
  - Add camera (CRU) clock and reset on RZ/G2UL,
  - Add support for the R-Car V4M (R8A779H0) SoC,
  - Miscellaneous fixes and improvements.

Thanks for pulling!

----------------------------------------------------------------
Biju Das (1):
      clk: renesas: r9a07g043: Add clock and reset entries for CRU

Claudiu Beznea (1):
      clk: renesas: r9a08g045: Add clock and reset support for watchdog

Cong Dang (4):
      clk: renesas: cpg-mssr: Add support for R-Car V4M
      clk: renesas: r8a779h0: Add PFC/GPIO clocks
      clk: renesas: r8a779h0: Add watchdog clock
      clk: renesas: r8a779h0: Add I2C clocks

Duy Nguyen (3):
      dt-bindings: power: renesas,rcar-sysc: Document R-Car V4M support
      dt-bindings: power: Add r8a779h0 SYSC power domain definitions
      dt-bindings: clock: Add R8A779H0 V4M CPG Core Clock Definitions

Geert Uytterhoeven (5):
      clk: renesas: mstp: Remove obsolete clkdev registration
      dt-bindings: clock: renesas,cpg-mssr: Document R-Car V4M support
      Merge tag 'renesas-r8a779h0-dt-binding-defs-tag' into renesas-clk-for-v6.9
      clk: renesas: rcar-gen4: Add support for FRQCRC1
      clk: renesas: r8a779g0: Fix PCIe clock name

Kuninori Morimoto (4):
      of: Add __of_device_is_status() and makes more generic status check
      of: Add of_get_next_status_child() and makes more generic of_get_next
      of: Add for_each_reserved_child_of_node()
      clk: renesas: cpg-mssr: Ignore all clocks assigned to non-Linux system

 .../bindings/clock/renesas,cpg-mssr.yaml           |   1 +
 .../bindings/power/renesas,rcar-sysc.yaml          |   1 +
 drivers/clk/renesas/Kconfig                        |   5 +
 drivers/clk/renesas/Makefile                       |   1 +
 drivers/clk/renesas/clk-mstp.c                     |  16 +-
 drivers/clk/renesas/r8a779g0-cpg-mssr.c            |   2 +-
 drivers/clk/renesas/r8a779h0-cpg-mssr.c            | 249 +++++++++++++++++++++
 drivers/clk/renesas/r9a07g043-cpg.c                |  31 +++
 drivers/clk/renesas/r9a08g045-cpg.c                |   3 +
 drivers/clk/renesas/rcar-gen4-cpg.c                |  10 +-
 drivers/clk/renesas/renesas-cpg-mssr.c             | 117 +++++++++-
 drivers/clk/renesas/renesas-cpg-mssr.h             |   1 +
 drivers/of/base.c                                  | 111 ++++++---
 .../dt-bindings/clock/renesas,r8a779h0-cpg-mssr.h  |  96 ++++++++
 include/dt-bindings/power/renesas,r8a779h0-sysc.h  |  49 ++++
 include/linux/of.h                                 |  11 +
 16 files changed, 651 insertions(+), 53 deletions(-)
 create mode 100644 drivers/clk/renesas/r8a779h0-cpg-mssr.c
 create mode 100644 include/dt-bindings/clock/renesas,r8a779h0-cpg-mssr.h
 create mode 100644 include/dt-bindings/power/renesas,r8a779h0-sysc.h

Gr{oetje,eeting}s,

						Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
							    -- Linus Torvalds

