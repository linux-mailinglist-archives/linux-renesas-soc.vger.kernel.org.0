Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BD73A352A4D
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  2 Apr 2021 13:43:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235207AbhDBLnX (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 2 Apr 2021 07:43:23 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38384 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235200AbhDBLnW (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 2 Apr 2021 07:43:22 -0400
Received: from albert.telenet-ops.be (albert.telenet-ops.be [IPv6:2a02:1800:110:4::f00:1a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5539EC061788
        for <linux-renesas-soc@vger.kernel.org>; Fri,  2 Apr 2021 04:43:20 -0700 (PDT)
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed20:7c3c:adbc:7a1a:b85f])
        by albert.telenet-ops.be with bizsmtp
        id nnjJ2400c4A7w6i06njJcG; Fri, 02 Apr 2021 13:43:18 +0200
Received: from rox.of.borg ([192.168.97.57])
        by ramsan.of.borg with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
        (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1lSICs-00CRWr-AY; Fri, 02 Apr 2021 13:43:18 +0200
Received: from geert by rox.of.borg with local (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1lSICr-004CaP-Oc; Fri, 02 Apr 2021 13:43:17 +0200
From:   Geert Uytterhoeven <geert+renesas@glider.be>
To:     Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>
Cc:     linux-clk@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [GIT PULL] clk: renesas: Updates for v5.13 (take two)
Date:   Fri,  2 Apr 2021 13:43:06 +0200
Message-Id: <cover.1617363608.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

	Hi Mike, Stephen,

The following changes since commit 0eedab655ec1817d450085dcb12219726cb415ff:

  clk: renesas: r8a779a0: Add CMT clocks (2021-03-12 09:23:24 +0100)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-drivers.git tags/renesas-clk-for-v5.13-tag2

for you to fetch changes up to f2fb4fe62390b293bc6edc04cc7002940c441359:

  clk: renesas: Zero init clk_init_data (2021-03-30 09:58:27 +0200)

----------------------------------------------------------------
clk: renesas: Updates for v5.13 (take two)

  - Spelling fixes,
  - Zero init clk_init_data.

Thanks for pulling!

----------------------------------------------------------------
Bhaskar Chowdhury (1):
      clk: renesas: Couple of spelling fixes

Geert Uytterhoeven (1):
      clk: renesas: Zero init clk_init_data

 drivers/clk/renesas/clk-div6.c            |  3 +--
 drivers/clk/renesas/clk-mstp.c            |  2 +-
 drivers/clk/renesas/r9a06g032-clocks.c    | 12 ++++++------
 drivers/clk/renesas/rcar-cpg-lib.c        |  2 +-
 drivers/clk/renesas/rcar-gen2-cpg.c       |  3 +--
 drivers/clk/renesas/rcar-gen3-cpg.c       |  2 +-
 drivers/clk/renesas/rcar-usb2-clock-sel.c |  5 +----
 drivers/clk/renesas/renesas-cpg-mssr.c    |  2 +-
 8 files changed, 13 insertions(+), 18 deletions(-)

Gr{oetje,eeting}s,

						Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
							    -- Linus Torvalds
