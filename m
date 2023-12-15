Return-Path: <linux-renesas-soc+bounces-1125-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C509814A5F
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 15 Dec 2023 15:20:52 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 06B731F23BF8
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 15 Dec 2023 14:20:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E63843158A;
	Fri, 15 Dec 2023 14:20:41 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from riemann.telenet-ops.be (riemann.telenet-ops.be [195.130.137.80])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CAEC930FBC
	for <linux-renesas-soc@vger.kernel.org>; Fri, 15 Dec 2023 14:20:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=glider.be
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux-m68k.org
Received: from xavier.telenet-ops.be (xavier.telenet-ops.be [IPv6:2a02:1800:120:4::f00:14])
	by riemann.telenet-ops.be (Postfix) with ESMTPS id 4SsBFv43ljz4x1Fj
	for <linux-renesas-soc@vger.kernel.org>; Fri, 15 Dec 2023 15:20:35 +0100 (CET)
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed40:28e5:a835:e0b1:5291])
	by xavier.telenet-ops.be with bizsmtp
	id NeLT2B00729mzEW01eLTf4; Fri, 15 Dec 2023 15:20:27 +0100
Received: from rox.of.borg ([192.168.97.57])
	by ramsan.of.borg with esmtp (Exim 4.95)
	(envelope-from <geert@linux-m68k.org>)
	id 1rE92o-00C71t-2t;
	Fri, 15 Dec 2023 15:20:27 +0100
Received: from geert by rox.of.borg with local (Exim 4.95)
	(envelope-from <geert@linux-m68k.org>)
	id 1rE7BO-00GsMs-84;
	Fri, 15 Dec 2023 13:20:46 +0100
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>
Cc: linux-clk@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [GIT PULL] clk: renesas: Updates for v6.8 (take two)
Date: Fri, 15 Dec 2023 13:20:44 +0100
Message-Id: <cover.1702642574.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

	Hi Mike, Stephen,

The following changes since commit 5f9e29b9159a41fcf6733c3b59fa46a90ce3ae20:

  clk: renesas: rzg2l-cpg: Reuse code in rzg2l_cpg_reset() (2023-11-27 11:09:53 +0100)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-drivers.git tags/renesas-clk-for-v6.8-tag2

for you to fetch changes up to 515f05da372aedf347a1ac99d17fb832ba371d4d:

  clk: renesas: r9a08g045: Add clock and reset support for ETH0 and ETH1 (2023-12-13 20:05:55 +0100)

----------------------------------------------------------------
clk: renesas: Updates for v6.8 (take two)

  - Add interrupt controller and Ethernet clocks and resets on RZ/G3S,
  - Check reset monitor registers on RZ/G2L-alike SoCs.

Thanks for pulling!

----------------------------------------------------------------
Claudiu Beznea (3):
      clk: renesas: r9a08g045: Add IA55 pclk and its reset
      clk: renesas: rzg2l: Check reset monitor registers
      clk: renesas: r9a08g045: Add clock and reset support for ETH0 and ETH1

 drivers/clk/renesas/r9a08g045-cpg.c | 13 ++++++++
 drivers/clk/renesas/rzg2l-cpg.c     | 59 +++++++++++++++++++++++++++----------
 2 files changed, 57 insertions(+), 15 deletions(-)

Gr{oetje,eeting}s,

						Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
							    -- Linus Torvalds

