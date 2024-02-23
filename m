Return-Path: <linux-renesas-soc+bounces-3128-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id BB28486105C
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 23 Feb 2024 12:28:57 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 7468F284900
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 23 Feb 2024 11:28:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 96BF95C911;
	Fri, 23 Feb 2024 11:28:47 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from xavier.telenet-ops.be (xavier.telenet-ops.be [195.130.132.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C1A5C67E92
	for <linux-renesas-soc@vger.kernel.org>; Fri, 23 Feb 2024 11:28:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.130.132.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708687727; cv=none; b=iacpveoqPtwU1hQe5DSuSPxPcC8KEJy2qOSQ17nMBf7o1jfimmTxPxbr0Mk2zdHbR/9zwOyAXLG34taLuyq8lskL9n914ylbrD16LWvBcwYLFd46vuTlVSy/NsyW5zIpltSIuaj9xvbGctq7jP5nXPOCRwbr4qcRfZ1VYT4Wo/c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708687727; c=relaxed/simple;
	bh=iHQBtZGMPGgdTEXB9sIO8udB6zO09cjsGmfLlAaOME0=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=PpZB2i2IdnALSjXg7CbrLeRrhmPktGwkd/XnoUQJu06tYQQHnoT9NQ+Qagd5ylIr8Mch2Pg6cnEk8VW7Uz4zDaSInD7P5jtGin70lg4iaB3UQjr/fx+iLKIjalt/TYrYUy5qIx2wLh0mloMpbAgGKIqw41+1P4Ng2WPNmpUQyW4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=glider.be; spf=none smtp.mailfrom=linux-m68k.org; arc=none smtp.client-ip=195.130.132.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=glider.be
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux-m68k.org
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed40:6f61:ab26:80d6:d9d4])
	by xavier.telenet-ops.be with bizsmtp
	id qbUj2B00R2itsqh01bUjqo; Fri, 23 Feb 2024 12:28:43 +0100
Received: from rox.of.borg ([192.168.97.57])
	by ramsan.of.borg with esmtp (Exim 4.95)
	(envelope-from <geert@linux-m68k.org>)
	id 1rdTjH-001P4D-BU;
	Fri, 23 Feb 2024 12:28:43 +0100
Received: from geert by rox.of.borg with local (Exim 4.95)
	(envelope-from <geert@linux-m68k.org>)
	id 1rdTjP-00D0VP-LD;
	Fri, 23 Feb 2024 12:28:43 +0100
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>
Cc: linux-clk@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [GIT PULL] clk: renesas: Updates for v6.9 (take two)
Date: Fri, 23 Feb 2024 12:28:42 +0100
Message-Id: <cover.1708687321.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

	Hi Mike, Stephen,

The following changes since commit 5aaa139b9a03e1a43484a73248c6353a9c4d95c6:

  clk: renesas: r8a779h0: Add I2C clocks (2024-02-06 11:20:12 +0100)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-drivers.git tags/renesas-clk-for-v6.9-tag2

for you to fetch changes up to 81a7a88a98062ffcd8d7d5ac3b540a96dbff5490:

  clk: renesas: r8a779h0: Add RPC-IF clock (2024-02-20 11:37:34 +0100)

----------------------------------------------------------------
clk: renesas: Updates for v6.9 (take two)

  - Add Ethernet, SDHI, DMA, and HyperFLASH/QSPI (RPC-IF) clocks on
    R-Car V4M,
  - Miscellaneous fixes and improvements.

Thanks for pulling!

----------------------------------------------------------------
Claudiu Beznea (2):
      clk: renesas: r9a07g04[34]: Use SEL_SDHI1_STS status configuration for SD1 mux
      clk: renesas: r9a07g04[34]: Fix typo for sel_shdi variable

Cong Dang (4):
      clk: renesas: r8a779h0: Add EtherAVB clocks
      clk: renesas: r8a779h0: Add SDHI clock
      clk: renesas: r8a779h0: Add SYS-DMAC clocks
      clk: renesas: r8a779h0: Add RPC-IF clock

Geert Uytterhoeven (2):
      clk: renesas: r8a779g0: Correct PFC/GPIO parent clocks
      clk: renesas: r8a779f0: Correct PFC/GPIO parent clock

 drivers/clk/renesas/r8a779f0-cpg-mssr.c       |  2 +-
 drivers/clk/renesas/r8a779g0-cpg-mssr.c       | 11 ++++++-----
 drivers/clk/renesas/r8a779h0-cpg-mssr.c       |  7 +++++++
 drivers/clk/renesas/r9a07g043-cpg.c           |  6 +++---
 drivers/clk/renesas/r9a07g044-cpg.c           |  6 +++---
 include/dt-bindings/clock/r8a779g0-cpg-mssr.h |  1 +
 6 files changed, 21 insertions(+), 12 deletions(-)

Gr{oetje,eeting}s,

						Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
							    -- Linus Torvalds

