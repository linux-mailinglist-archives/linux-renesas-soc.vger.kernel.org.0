Return-Path: <linux-renesas-soc+bounces-10281-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 238689BB60F
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  4 Nov 2024 14:28:24 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 53BC71C21C38
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  4 Nov 2024 13:28:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CDC80AD24;
	Mon,  4 Nov 2024 13:27:06 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from michel.telenet-ops.be (michel.telenet-ops.be [195.130.137.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 03FCC1CD02
	for <linux-renesas-soc@vger.kernel.org>; Mon,  4 Nov 2024 13:27:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.130.137.88
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730726826; cv=none; b=uh+yeNHy07VKB3rdTs9vKp6ygTHOPisL1wUPwSVa4bmMnktvRoVwS8sOvDfy8dbwkuJfLSSKD3TPJDL1tWmR2PfZT8O76uEQ5YdvHlbUmjYw5SDmHGCnfcYDL1lxQ03PyQWlcXBhlCqBSgC1RaCGGd62cxcqwg2jts/RyyI/5Dk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730726826; c=relaxed/simple;
	bh=DDkxjMZFE6+6sIC6I+6+uLPBbfdCRk4DyjDRJpgWxgg=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=vBbyeaW0YGNDJQdfYczbHp/14mtbQ8Q1BU5gW9NjC9pzCieu1vQg47aQEegjiH/eJg0ZEsuoPLPO5tmGDzyOCJcdoypK91EAoa1/ZycwjY75h/XJnzazrQiqAxJxBAtYi/UHyy8H4MocyR3P1R0YTK1RQQEG1hE5I5qjKVtt1Kg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=glider.be; spf=none smtp.mailfrom=linux-m68k.org; arc=none smtp.client-ip=195.130.137.88
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=glider.be
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux-m68k.org
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed80:ae0d:26ef:36dd:9be1])
	by michel.telenet-ops.be with cmsmtp
	id YdSv2D00V31l0Qj06dSvXN; Mon, 04 Nov 2024 14:26:55 +0100
Received: from rox.of.borg ([192.168.97.57])
	by ramsan.of.borg with esmtp (Exim 4.95)
	(envelope-from <geert@linux-m68k.org>)
	id 1t7x6J-006FvZ-PY;
	Mon, 04 Nov 2024 14:26:55 +0100
Received: from geert by rox.of.borg with local (Exim 4.95)
	(envelope-from <geert@linux-m68k.org>)
	id 1t7x6d-000BKp-G7;
	Mon, 04 Nov 2024 14:26:55 +0100
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>
Cc: linux-clk@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [GIT PULL] clk: renesas: Updates for v6.13 (take two)
Date: Mon,  4 Nov 2024 14:26:54 +0100
Message-Id: <cover.1730726251.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

	Hi Mike, Stephen,

The following changes since commit 92850bed9d4d334ee502a035ed5750285faccbea:

  clk: renesas: r8a779h0: Drop CLK_PLL2_DIV2 to clarify ZCn clocks (2024-10-14 10:04:31 +0200)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-drivers.git tags/renesas-clk-for-v6.13-tag2

for you to fetch changes up to be20a73e03e19005cfa5c1c4d6158af1ba02f056:

  clk: renesas: vbattb: Add VBATTB clock driver (2024-11-03 12:25:16 +0100)

----------------------------------------------------------------
clk: renesas: Updates for v6.13 (take two)

  - Add RTC power domain and Battery Backup Function (VBATTB) clock
    support for the RZ/G3S SoC,
  - Add the devm_clk_hw_register_gate_parent_hw() helper,
  - Miscellaneous fixes and improvements.

Note that this includes DT binding updates for the RZ/G3S SoC, which are
shared by the clock driver and DT source files.

Thanks for pulling!

----------------------------------------------------------------
Biju Das (1):
      clk: renesas: rzg2l: Fix FOUTPOSTDIV clk

Claudiu Beznea (8):
      dt-bindings: clock: r9a08g045-cpg: Add power domain ID for RTC
      clk: renesas: rzg2l-cpg: Move PM domain power on in rzg2l_cpg_pd_setup()
      clk: renesas: rzg2l-cpg: Use GENPD_FLAG_* flags instead of local ones
      clk: renesas: r9a08g045: Mark the watchdog and always-on PM domains as IRQ safe
      clk: renesas: r9a08g045: Add power domain for RTC
      dt-bindings: clock: renesas,r9a08g045-vbattb: Document VBATTB
      clk: linux/clk-provider.h: Add devm_clk_hw_register_gate_parent_hw()
      clk: renesas: vbattb: Add VBATTB clock driver

Geert Uytterhoeven (2):
      Merge tag 'renesas-r9a08g045-dt-binding-defs-tag2' into renesas-clk-for-v6.13
      Merge tag 'renesas-r9a08g045-dt-binding-defs-tag3' into renesas-clk-for-v6.13

 .../bindings/clock/renesas,r9a08g045-vbattb.yaml   |  84 +++++++++
 drivers/clk/renesas/Kconfig                        |   5 +
 drivers/clk/renesas/Makefile                       |   1 +
 drivers/clk/renesas/clk-vbattb.c                   | 205 +++++++++++++++++++++
 drivers/clk/renesas/r9a08g045-cpg.c                |  54 +++---
 drivers/clk/renesas/rzg2l-cpg.c                    |  52 +++---
 drivers/clk/renesas/rzg2l-cpg.h                    |  10 +-
 include/dt-bindings/clock/r9a08g045-cpg.h          |   1 +
 .../dt-bindings/clock/renesas,r9a08g045-vbattb.h   |  13 ++
 include/linux/clk-provider.h                       |  18 ++
 10 files changed, 380 insertions(+), 63 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/clock/renesas,r9a08g045-vbattb.yaml
 create mode 100644 drivers/clk/renesas/clk-vbattb.c
 create mode 100644 include/dt-bindings/clock/renesas,r9a08g045-vbattb.h

Gr{oetje,eeting}s,

						Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
							    -- Linus Torvalds

