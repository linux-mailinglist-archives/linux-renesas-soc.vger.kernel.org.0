Return-Path: <linux-renesas-soc+bounces-7309-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 8EB3092FC80
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 12 Jul 2024 16:26:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 3B8151F22833
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 12 Jul 2024 14:26:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BE7C1171671;
	Fri, 12 Jul 2024 14:26:56 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from albert.telenet-ops.be (albert.telenet-ops.be [195.130.137.90])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E2A41171678
	for <linux-renesas-soc@vger.kernel.org>; Fri, 12 Jul 2024 14:26:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.130.137.90
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720794416; cv=none; b=WrlDFRD5iqIuJgwkGM4ob9UAXG4ra+n5IFz1qEVQBnieDK2oeYm0mp0YWl5K+dv3qlQPXRHDSyJyujBaCDs/wOXVxDvEUE6M5ooSfOHM/mcadyzbJlKBkuO61tWJbLU71Q9BglzAy/TaXU2Kgzh1HVWkNSoBuEJdqlt9m8qdhRE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720794416; c=relaxed/simple;
	bh=REkr3/yN87QKBJpm42EiGbnGL8UNIlL7O/zy/7ekFfw=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=YCpJn5L0IUEJf17A3hVAVlDOkzTGYYfS0Jx/2RCOUQFrr5xcO0lFhq5dI4nhezYdFC154UBWQZpOx834e493KcPoZ2xca0BkECTRQOoFrCxicmrJYMSamUFOh4hPiC/Ew6uBkYTF1GfxPaRpyptjPcjZ1LSiK4eQF2zX9XEpfDY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=glider.be; spf=none smtp.mailfrom=linux-m68k.org; arc=none smtp.client-ip=195.130.137.90
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=glider.be
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux-m68k.org
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed80:9b6b:6da0:997b:7165])
	by albert.telenet-ops.be with bizsmtp
	id meSn2C00646XLxg06eSnNF; Fri, 12 Jul 2024 16:26:47 +0200
Received: from rox.of.borg ([192.168.97.57])
	by ramsan.of.borg with esmtp (Exim 4.95)
	(envelope-from <geert@linux-m68k.org>)
	id 1sSHEG-001qJ2-7I;
	Fri, 12 Jul 2024 16:26:46 +0200
Received: from geert by rox.of.borg with local (Exim 4.95)
	(envelope-from <geert@linux-m68k.org>)
	id 1sSHEU-000W9U-QN;
	Fri, 12 Jul 2024 16:26:46 +0200
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
	=?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>,
	Cong Dang <cong.dang.xn@renesas.com>
Cc: linux-renesas-soc@vger.kernel.org,
	linux-clk@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH 0/4] clk: renesas: rcar-gen4: Initial clock descriptions should be __initconst
Date: Fri, 12 Jul 2024 16:26:42 +0200
Message-Id: <cover.1720794214.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

	Hi all,

The various R-Car Gen4 clock drivers missed a few opportunities to put
constant clock description data in the __init section.  Fix this to
reduce memory consumption.

To be queued in renesas-clk-for-v6.12 (unless I get to doing a fixes
branch for v6.11).

Thanks for your comments!

Geert Uytterhoeven (4):
  clk: renesas: r8a779a0: cpg_pll_configs should be __initconst
  clk: renesas: r8a779f0: cpg_pll_configs should be __initconst
  clk: renesas: r8a779g0: cpg_pll_configs should be __initconst
  clk: renesas: r8a779h0: Initial clock descriptions should be
    __initconst

 drivers/clk/renesas/r8a779a0-cpg-mssr.c | 2 +-
 drivers/clk/renesas/r8a779f0-cpg-mssr.c | 2 +-
 drivers/clk/renesas/r8a779g0-cpg-mssr.c | 2 +-
 drivers/clk/renesas/r8a779h0-cpg-mssr.c | 6 +++---
 4 files changed, 6 insertions(+), 6 deletions(-)

-- 
2.34.1

Gr{oetje,eeting}s,

						Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
							    -- Linus Torvalds

