Return-Path: <linux-renesas-soc+bounces-16893-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 7BA61AB1749
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  9 May 2025 16:23:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id ED54D164204
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  9 May 2025 14:23:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D74A120F07B;
	Fri,  9 May 2025 14:23:05 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from baptiste.telenet-ops.be (baptiste.telenet-ops.be [195.130.132.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF0F47462
	for <linux-renesas-soc@vger.kernel.org>; Fri,  9 May 2025 14:23:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.130.132.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746800585; cv=none; b=M3Zlz7HxouBTAGAmw3hFHzWD95v0V98C9EuMop7ePVpDNuqHaX7Pz+dwsW+hwXiTz7OvwDLzjSzSYR1kPol38Kz1Oojq0VW23hV+IepEQfM/NBpW1dZDmjAbqZt7gLvuJxm53pI1X3Q9pfDPitf+a9Pypw4/zmSVF8YDJ04dQCg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746800585; c=relaxed/simple;
	bh=wwBPgYgJpsysDOOHAceqds6SrtJITj352XK9iGFMfwk=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=FJEgmoZTzJftsJ/eyqyk+DhJIA4/yvsFyTBDRQyub47ZbCqFyU5L/MkkbsaYHJNZRpChOtZP7DbOnTxZnAi1mN2xQQZqv7h0YOsBhq7FAJrC21ZUenieruLSqwQUqogUcm2Uh1HLrIYTXRdSsPH18l93ddbkXHeJ99VflyY7WsA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=glider.be; spf=none smtp.mailfrom=linux-m68k.org; arc=none smtp.client-ip=195.130.132.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=glider.be
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux-m68k.org
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed80:805c:3876:152c:485c])
	by baptiste.telenet-ops.be with cmsmtp
	id n2P12E00T3X0DE5012P1Dm; Fri, 09 May 2025 16:23:01 +0200
Received: from rox.of.borg ([192.168.97.57])
	by ramsan.of.borg with esmtp (Exim 4.97)
	(envelope-from <geert@linux-m68k.org>)
	id 1uDOcn-000000012O0-3xC9;
	Fri, 09 May 2025 16:23:01 +0200
Received: from geert by rox.of.borg with local (Exim 4.97)
	(envelope-from <geert@linux-m68k.org>)
	id 1uDOcv-00000003AED-29br;
	Fri, 09 May 2025 16:23:01 +0200
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>
Cc: linux-clk@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [GIT PULL] clk: renesas: Updates for v6.16 (take two)
Date: Fri,  9 May 2025 16:22:59 +0200
Message-ID: <cover.1746798912.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

	Hi Mike, Stephen,

The following changes since commit 93f2878136262e6efcc6320bc31ada62fb0afd20:

  clk: renesas: r9a09g057: Add clock and reset entries for USB2 (2025-04-22 11:38:28 +0200)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-drivers.git tags/renesas-clk-for-v6.16-tag2

for you to fetch changes up to 28548f3f7994dd214ad4f4ba5763cd06333404a0:

  clk: renesas: r9a09g047: Add XSPI clock/reset (2025-05-08 20:17:55 +0200)

----------------------------------------------------------------
clk: renesas: Updates for v6.16 (take two)

  - Add Expanded Serial Peripheral Interface (xSPI) clocks and resets on
    RZ/G3E,
  - Miscellaneous improvements.

Note that this includes a DT binding definition update for the RZ/G3E
SoC, which are shared by the clock driver and DT source files.

Thanks for pulling!

----------------------------------------------------------------
Biju Das (3):
      dt-bindings: clock: renesas,r9a09g047-cpg: Add XSPI and GBETH PTP core clocks
      clk: renesas: r9a09g047: Add support for xspi mux and divider
      clk: renesas: r9a09g047: Add XSPI clock/reset

Geert Uytterhoeven (2):
      clk: renesas: Use str_on_off() helper
      Merge tag 'renesas-r9a09g047-dt-binding-defs-tag3' into renesas-clk-for-v6.16

 drivers/clk/renesas/r9a09g047-cpg.c               | 39 ++++++++++++++++++++++-
 drivers/clk/renesas/renesas-cpg-mssr.c            |  3 +-
 drivers/clk/renesas/rzg2l-cpg.c                   |  3 +-
 drivers/clk/renesas/rzv2h-cpg.h                   |  7 ++++
 include/dt-bindings/clock/renesas,r9a09g047-cpg.h |  3 ++
 5 files changed, 52 insertions(+), 3 deletions(-)

Gr{oetje,eeting}s,

						Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
							    -- Linus Torvalds

