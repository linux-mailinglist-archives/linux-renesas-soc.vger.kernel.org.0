Return-Path: <linux-renesas-soc+bounces-5639-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id EE1598D3321
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 29 May 2024 11:35:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 2B3A61C23EF1
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 29 May 2024 09:35:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D0D87169AE6;
	Wed, 29 May 2024 09:35:19 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from baptiste.telenet-ops.be (baptiste.telenet-ops.be [195.130.132.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0EFB0167DA9
	for <linux-renesas-soc@vger.kernel.org>; Wed, 29 May 2024 09:35:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.130.132.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716975319; cv=none; b=F2V/p3GGlELWbza4FA9k30X9tsk/f0W4WD6k2LOLLN9zF2v0iupZ3JNfyHBm5O4ZcZWrhlcRKoI5eAvDHBw8mVXKBDVZcFAqD8rGxdZkzbqniScupoC+i+2cvWn11y6IGi1zCXGfhW4MS8e+zlTdccedHLNsiHNUEUIjv5iok3w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716975319; c=relaxed/simple;
	bh=+nWyWXcxlPbba8Z80O0ITtYS6jrHn9b2UjqM7MZQtCE=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=lHqeM42PFgpQf8jLiEpqFiDQSZmqbuH2tQo38yABfo1wcw/U+4RcrlH/1ZxdJpWMR/zD5tBqP+JoJDhX1BA9EU3NJ1p+Rawo3Uz/MCZHoCaJm6xHFtTfsrFL1T9BH1QgFggttDpd4y34vQwpz28XwLdDzkxhD6gV7j1nddJLQKQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=glider.be; spf=none smtp.mailfrom=linux-m68k.org; arc=none smtp.client-ip=195.130.132.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=glider.be
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux-m68k.org
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed80:1b01:1838:131c:4de4])
	by baptiste.telenet-ops.be with bizsmtp
	id UxbE2C00X3VPV9V01xbEnH; Wed, 29 May 2024 11:35:15 +0200
Received: from rox.of.borg ([192.168.97.57])
	by ramsan.of.borg with esmtp (Exim 4.95)
	(envelope-from <geert@linux-m68k.org>)
	id 1sCFhI-00GI2V-8c;
	Wed, 29 May 2024 11:35:14 +0200
Received: from geert by rox.of.borg with local (Exim 4.95)
	(envelope-from <geert@linux-m68k.org>)
	id 1sCFiE-008wVn-Ew;
	Wed, 29 May 2024 11:35:14 +0200
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>
Cc: Ye Bin <yebin10@huawei.com>,
	linux-renesas-soc@vger.kernel.org,
	linux-clk@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH 0/3] clk: renesas: Lock initialization cleanups
Date: Wed, 29 May 2024 11:35:07 +0200
Message-Id: <cover.1716975021.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

	Hi all,

This patch series contains a few spin lock initialization cleanups for
R-Car Gen2+ clock drivers. It has been tested on a variety of R-Car Gen2+
systems.

I plan to queued these in renesas-clk for v6.11.

Thanks for your comments!

Geert Uytterhoeven (3):
  clk: renesas: r8a77970: Use common cpg_lock
  clk: renesas: cpg-lib: Use DEFINE_SPINLOCK() for global spinlock
  clk: renesas: rcar-gen2: Use DEFINE_SPINLOCK() for static spinlock

 drivers/clk/renesas/r8a77970-cpg-mssr.c | 5 +----
 drivers/clk/renesas/rcar-cpg-lib.c      | 2 +-
 drivers/clk/renesas/rcar-gen2-cpg.c     | 4 +---
 drivers/clk/renesas/rcar-gen3-cpg.c     | 2 --
 drivers/clk/renesas/rcar-gen4-cpg.c     | 2 --
 5 files changed, 3 insertions(+), 12 deletions(-)

-- 
2.34.1

Gr{oetje,eeting}s,

						Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
							    -- Linus Torvalds

