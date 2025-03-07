Return-Path: <linux-renesas-soc+bounces-14144-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 3FE39A56C7F
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  7 Mar 2025 16:47:56 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 9BD1A188EE37
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  7 Mar 2025 15:48:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D6E6921A43B;
	Fri,  7 Mar 2025 15:47:52 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from baptiste.telenet-ops.be (baptiste.telenet-ops.be [195.130.132.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD981194C78
	for <linux-renesas-soc@vger.kernel.org>; Fri,  7 Mar 2025 15:47:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.130.132.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741362472; cv=none; b=mmJVLRDZR6WFWpjMBhX4Qio0o2jQeBrJaFbJwwCA/mLWTQDO2hkqmzvk4Nb4ZcOjWvHx2zy5FqOfM0dtwO3izud1eVUEgWQZgqHJu5bnJgKbHj5U2YhAshLTHi4+YaQlxgdAWIUD71WboiLWR/x96Lv8tssOrhc6vCEA7ZNkyHs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741362472; c=relaxed/simple;
	bh=Y/mfJqBjqf5Nw6vf7SNq2r6eV+sL9+yy/LpBtGX1jXQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=S/Y5rA8Mv2+pbeQ7NOJiFuTCkC7IwmDLehQT3W8h3DJwvIY87laJ1Im3AltAA0LEjLjQwsFF/pZ7zEkeSGuvxTi4aB6GQ7d6wk7KuGKaU9ail5YX+FqdezPG8C2c4aIbcy06F+PPsJYaS7OfPtkHZ5B55o/SM9U3UkNRD3A3zKg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=glider.be; spf=none smtp.mailfrom=linux-m68k.org; arc=none smtp.client-ip=195.130.132.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=glider.be
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux-m68k.org
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed80:d269:b36f:7a12:a76f])
	by baptiste.telenet-ops.be with cmsmtp
	id Mrnj2E00M2m8Uyj01rnjFv; Fri, 07 Mar 2025 16:47:43 +0100
Received: from rox.of.borg ([192.168.97.57])
	by ramsan.of.borg with esmtp (Exim 4.97)
	(envelope-from <geert@linux-m68k.org>)
	id 1tqZuz-0000000DBkp-3t2h;
	Fri, 07 Mar 2025 16:47:43 +0100
Received: from geert by rox.of.borg with local (Exim 4.97)
	(envelope-from <geert@linux-m68k.org>)
	id 1tqZvL-00000009ss6-0CXC;
	Fri, 07 Mar 2025 16:47:43 +0100
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>
Cc: linux-clk@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [GIT PULL] clk: renesas: Updates for v6.15 (take two)
Date: Fri,  7 Mar 2025 16:47:40 +0100
Message-ID: <cover.1741362159.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

	Hi Mike, Stephen,

The following changes since commit 9b12504e8c8c2f1f7e5f16afdd829603dd0c9508:

  clk: renesas: r9a09g047: Add CANFD clocks and resets (2025-02-20 17:42:03 +0100)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-drivers.git tags/renesas-clk-for-v6.15-tag2

for you to fetch changes up to e1a098330ef0555ad216e549a018d99aee7752c1:

  clk: renesas: r9a09g047: Add clock and reset signals for the TSU IP (2025-03-06 16:39:31 +0100)

----------------------------------------------------------------
clk: renesas: Updates for v6.15 (take two)

  - Add DMA clocks and reset on RZ/V2H,
  - Add thermal (TSU) clock and reset on RZ/G3E,
  - Miscellaneous fixes and improvements.

Thanks for pulling!

----------------------------------------------------------------
Biju Das (1):
      clk: renesas: rzv2h: Adjust for CPG_BUS_m_MSTOP starting from m = 1

Fabrizio Castro (1):
      clk: renesas: r9a09g057: Add entries for the DMACs

Geert Uytterhoeven (3):
      clk: renesas: cpg-mssr: Remove obsolete nullify check
      clk: renesas: rzg2l: Remove unneeded nullify checks
      clk: renesas: r7s9210: Distinguish clocks by clock type

John Madieu (1):
      clk: renesas: r9a09g047: Add clock and reset signals for the TSU IP

 drivers/clk/renesas/r7s9210-cpg-mssr.c | 10 ++++------
 drivers/clk/renesas/r9a09g047-cpg.c    |  3 +++
 drivers/clk/renesas/r9a09g057-cpg.c    | 24 ++++++++++++++++++++++++
 drivers/clk/renesas/renesas-cpg-mssr.c |  5 -----
 drivers/clk/renesas/rzg2l-cpg.c        | 10 ----------
 drivers/clk/renesas/rzv2h-cpg.c        | 12 ++++++------
 drivers/clk/renesas/rzv2h-cpg.h        |  2 ++
 7 files changed, 39 insertions(+), 27 deletions(-)

Gr{oetje,eeting}s,

						Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
							    -- Linus Torvalds

