Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 54ECB41B141
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 28 Sep 2021 15:54:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240968AbhI1Nzl (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 28 Sep 2021 09:55:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44140 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240996AbhI1Nzl (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 28 Sep 2021 09:55:41 -0400
Received: from xavier.telenet-ops.be (xavier.telenet-ops.be [IPv6:2a02:1800:120:4::f00:14])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 74A04C061746
        for <linux-renesas-soc@vger.kernel.org>; Tue, 28 Sep 2021 06:54:01 -0700 (PDT)
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed30:9d6a:ba71:99b4:9160])
        by xavier.telenet-ops.be with bizsmtp
        id zRtz2500V4bPoua01Rtzvm; Tue, 28 Sep 2021 15:53:59 +0200
Received: from rox.of.borg ([192.168.97.57])
        by ramsan.of.borg with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
        (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1mVDYV-000LJI-Cl; Tue, 28 Sep 2021 15:53:59 +0200
Received: from geert by rox.of.borg with local (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1mVDYU-00AEzr-Lz; Tue, 28 Sep 2021 15:53:58 +0200
From:   Geert Uytterhoeven <geert+renesas@glider.be>
To:     Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>
Cc:     linux-clk@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [GIT PULL] clk: renesas: Fixes for v5.15
Date:   Tue, 28 Sep 2021 15:53:52 +0200
Message-Id: <cover.1632836915.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

	Hi Mike, Stephen,

The following changes since commit 6880fa6c56601bb8ed59df6c30fd390cc5f6dd8f:

  Linux 5.15-rc1 (2021-09-12 16:28:37 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-drivers.git tags/renesas-clk-for-v5.15-tag3

for you to fetch changes up to fa2a30f8e0aa9304919750b116a9e9e322465299:

  clk: renesas: rzg2l: Fix clk status function (2021-09-24 15:11:05 +0200)

----------------------------------------------------------------
clk: renesas: Fixes for v5.15

  - Fix inverted logic in RZ/G2L .is_enabled() function.

Thanks for pulling!

----------------------------------------------------------------
Biju Das (2):
      clk: renesas: r9a07g044: Mark IA55_CLK and DMAC_ACLK critical
      clk: renesas: rzg2l: Fix clk status function

 drivers/clk/renesas/r9a07g044-cpg.c | 2 ++
 drivers/clk/renesas/rzg2l-cpg.c     | 2 +-
 2 files changed, 3 insertions(+), 1 deletion(-)

Gr{oetje,eeting}s,

						Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
							    -- Linus Torvalds
