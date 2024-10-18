Return-Path: <linux-renesas-soc+bounces-9842-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 191C49A3DD0
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 18 Oct 2024 14:05:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 4768A1C22F72
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 18 Oct 2024 12:05:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8DBEF11CA9;
	Fri, 18 Oct 2024 12:05:36 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from albert.telenet-ops.be (albert.telenet-ops.be [195.130.137.90])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A75DE555
	for <linux-renesas-soc@vger.kernel.org>; Fri, 18 Oct 2024 12:05:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.130.137.90
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729253136; cv=none; b=VrDAyJycCNypMLePsfa11G3jR/2Op00VgAx+J4AXtNKj21ThkIPxzIl3M0J7aagpshg/GyQcM4TZwN/sRpb2r2QWT3nXbRwBW3uvWo8jdiSzgA/pTcuYaKu881L5Wx1fpHLKwSoFJMYKNPr0xmmGKVJoNqDt/tnMZBX3+NEiIZc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729253136; c=relaxed/simple;
	bh=7JjOUiCSqgJvFc6pQg2PRv1CsaHBlGgfHboNtfXau3o=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version:Content-Type; b=UI0IM0I0kpecH+LnSXWDX3i7zCTImWEF7cywtkopPt+P7own1oqrrZnf3Tjtrk/2UzdfoReeZuo9/9m/FABe8wlbvsZlfHiBLvg4mlL/wOrqMYijI+M4x4f40kmramikJvULazK2Tf2yzbQN51IbrmAGHWjMsc8gUaoMNM268OU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=glider.be; spf=none smtp.mailfrom=linux-m68k.org; arc=none smtp.client-ip=195.130.137.90
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=glider.be
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux-m68k.org
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed80:9a0:3f16:2bd7:49ca])
	by albert.telenet-ops.be with cmsmtp
	id Ro5T2D00C1MdCM206o5Tin; Fri, 18 Oct 2024 14:05:27 +0200
Received: from rox.of.borg ([192.168.97.57])
	by ramsan.of.borg with esmtp (Exim 4.95)
	(envelope-from <geert@linux-m68k.org>)
	id 1t1ljE-003zSO-8e;
	Fri, 18 Oct 2024 14:05:27 +0200
Received: from geert by rox.of.borg with local (Exim 4.95)
	(envelope-from <geert@linux-m68k.org>)
	id 1t1ljT-005st3-8C;
	Fri, 18 Oct 2024 14:05:27 +0200
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>
Cc: linux-clk@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [GIT PULL] clk: renesas: Updates for v6.13
Date: Fri, 18 Oct 2024 14:05:26 +0200
Message-Id: <cover.1729252443.git.geert+renesas@glider.be>
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

The following changes since commit 9852d85ec9d492ebef56dc5f229416c925758edc:

  Linux 6.12-rc1 (2024-09-29 15:06:19 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-drivers.git tags/renesas-clk-for-v6.13-tag1

for you to fetch changes up to 92850bed9d4d334ee502a035ed5750285faccbea:

  clk: renesas: r8a779h0: Drop CLK_PLL2_DIV2 to clarify ZCn clocks (2024-10-14 10:04:31 +0200)

----------------------------------------------------------------
clk: renesas: Updates for v6.13

  - Add Cortex-A55 core clocks and Interrupt Control Unit (ICU) clock
    and reset on RZ/V2H(P),
  - Miscellaneous fixes and improvements.

Thanks for pulling!

----------------------------------------------------------------
Fabrizio Castro (1):
      clk: renesas: r9a09g057: Add clock and reset entries for ICU

Geert Uytterhoeven (1):
      clk: renesas: r8a779h0: Drop CLK_PLL2_DIV2 to clarify ZCn clocks

Lad Prabhakar (1):
      clk: renesas: r9a09g057: Add CA55 core clocks

Marek Vasut (1):
      clk: renesas: Remove duplicate and trailing empty lines

 drivers/clk/renesas/clk-r8a73a4.c       |  1 -
 drivers/clk/renesas/clk-r8a7778.c       |  1 -
 drivers/clk/renesas/r8a779a0-cpg-mssr.c |  1 -
 drivers/clk/renesas/r8a779h0-cpg-mssr.c | 10 ++++------
 drivers/clk/renesas/r9a09g011-cpg.c     |  1 -
 drivers/clk/renesas/r9a09g057-cpg.c     | 18 ++++++++++++++++++
 drivers/clk/renesas/rcar-cpg-lib.c      |  1 -
 drivers/clk/renesas/rcar-gen3-cpg.c     |  1 -
 drivers/clk/renesas/renesas-cpg-mssr.c  |  2 --
 drivers/clk/renesas/rzv2h-cpg.h         |  5 +++++
 10 files changed, 27 insertions(+), 14 deletions(-)

Gr{oetje,eeting}s,

						Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
							    -- Linus Torvalds

