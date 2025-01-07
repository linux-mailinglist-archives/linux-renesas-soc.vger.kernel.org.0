Return-Path: <linux-renesas-soc+bounces-11933-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A738A04637
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  7 Jan 2025 17:29:18 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 0490F3A124F
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  7 Jan 2025 16:28:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6FA861F5425;
	Tue,  7 Jan 2025 16:25:44 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from xavier.telenet-ops.be (xavier.telenet-ops.be [195.130.132.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD08B1F5406
	for <linux-renesas-soc@vger.kernel.org>; Tue,  7 Jan 2025 16:25:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.130.132.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736267144; cv=none; b=QkYV/BgxrDnG37UyXT8YyCwEcKDHoWJqAn91AaNOxqICN+h0417ewLoapsxth3vedKodp0VWwN2eiW6YkemCdlgLO0YWxSpzV6PKIz6ilsDOwQge4W14joYtdWFayZKPl5JxOwGqYSQWhTaInoLcppDz+EKvkUW6NuJ2vgWLzGk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736267144; c=relaxed/simple;
	bh=2J9DaAteZvIWWXt7a/ykJRC8fNykgIzQwMyXhBwgXGw=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=IUwA8hsNMJuMzXp/Lh7YT5ryqBfZ2c2QVYJEQo9EmPuhtOZkMiZTbxTJnTCOX2OLBkUH0ff0sQM9ir82Lc9jEQ80AlIwd3R4ZcMqjSwh6PpchlUre0461aCGzLKXosCDfqSWQhl+0GUJ1Ka95cauFFdE6+HIPvUkizoh0XrOhWw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=glider.be; spf=none smtp.mailfrom=linux-m68k.org; arc=none smtp.client-ip=195.130.132.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=glider.be
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux-m68k.org
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed80:39d4:dc4e:b4ce:1377])
	by xavier.telenet-ops.be with cmsmtp
	id yGRX2D00H3AZZFy01GRX3c; Tue, 07 Jan 2025 17:25:31 +0100
Received: from rox.of.borg ([192.168.97.57])
	by ramsan.of.borg with esmtp (Exim 4.97)
	(envelope-from <geert@linux-m68k.org>)
	id 1tVCOV-00000008lAV-3bg9;
	Tue, 07 Jan 2025 17:25:31 +0100
Received: from geert by rox.of.borg with local (Exim 4.97)
	(envelope-from <geert@linux-m68k.org>)
	id 1tVCOZ-00000006Ebh-1XF3;
	Tue, 07 Jan 2025 17:25:31 +0100
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>
Cc: linux-clk@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [GIT PULL] clk: renesas: Updates for v6.14 (take two)
Date: Tue,  7 Jan 2025 17:25:28 +0100
Message-ID: <cover.1736266782.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

	Hi Mike, Stephen,

The following changes since commit f962745289958e89bf520407728e384e52ea8e27:

  clk: renesas: r9a08g045: Add clocks, resets and power domain support for the ADC IP (2024-12-10 12:02:24 +0100)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-drivers.git tags/renesas-clk-for-v6.14-tag2

for you to fetch changes up to e91609f1c3b0ce06d80b1b3bd0e6b942782be016:

  dt-bindings: clock: renesas,r9a08g045-vbattb: Fix include guard (2025-01-07 17:03:01 +0100)

----------------------------------------------------------------
clk: renesas: Updates for v6.14 (take two)

  - Add support for the RZ/G3E (R9A09G047) SoC,
  - Add Module Stop (MSTOP) support on RZ/V2H,
  - Add Image Signal Processor helper block (FCPVX and VSPX) clocks on
    R-Car V4H SoC,
  - Add System Controller (SYS) reset and Generic Interrupt Controller
    (GIC) clock and reset entries on RZ/V2H,
  - Miscellaneous fixes and improvements.

Note that this includes DT binding and binding definitions for the
RZ/G3E SoC, which are shared by DT source files and drivers.

Thanks for pulling!

----------------------------------------------------------------
Biju Das (7):
      dt-bindings: soc: renesas: Document Renesas RZ/G3E SoC variants
      dt-bindings: soc: renesas: Document RZ/G3E SMARC SoM and Carrier-II EVK
      dt-bindings: clock: renesas: Document RZ/G3E SoC CPG
      clk: renesas: rzv2h: Add MSTOP support
      clk: renesas: rzv2h: Add support for RZ/G3E SoC
      clk: renesas: r9a09g047: Add CA55 core clocks
      clk: renesas: r9a09g047: Add I2C clocks/resets

Geert Uytterhoeven (2):
      Merge tag 'renesas-r9a09g047-dt-binding-defs-tag1' into renesas-clk-for-v6.14
      dt-bindings: clock: renesas,r9a08g045-vbattb: Fix include guard

Jacopo Mondi (2):
      clk: renesas: r8a779g0: Add FCPVX clocks
      clk: renesas: r8a779g0: Add VSPX clocks

Lad Prabhakar (2):
      clk: renesas: r9a09g057: Add reset entry for SYS
      clk: renesas: r9a09g057: Add clock and reset entries for GIC

 .../bindings/clock/renesas,rzv2h-cpg.yaml          |  15 +-
 .../devicetree/bindings/soc/renesas/renesas.yaml   |  17 +++
 drivers/clk/renesas/Kconfig                        |   7 +-
 drivers/clk/renesas/Makefile                       |   1 +
 drivers/clk/renesas/r8a779g0-cpg-mssr.c            |   4 +
 drivers/clk/renesas/r9a09g047-cpg.c                | 150 +++++++++++++++++++
 drivers/clk/renesas/r9a09g057-cpg.c                | 160 ++++++++++++++-------
 drivers/clk/renesas/rzv2h-cpg.c                    | 152 +++++++++++++++++---
 drivers/clk/renesas/rzv2h-cpg.h                    |  31 +++-
 .../dt-bindings/clock/renesas,r9a08g045-vbattb.h   |   6 +-
 include/dt-bindings/clock/renesas,r9a09g047-cpg.h  |  21 +++
 11 files changed, 475 insertions(+), 89 deletions(-)
 create mode 100644 drivers/clk/renesas/r9a09g047-cpg.c
 create mode 100644 include/dt-bindings/clock/renesas,r9a09g047-cpg.h

Gr{oetje,eeting}s,

						Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
							    -- Linus Torvalds

