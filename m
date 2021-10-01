Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6EC9441EA0E
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  1 Oct 2021 11:46:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1353104AbhJAJsg (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 1 Oct 2021 05:48:36 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44020 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1353096AbhJAJsf (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 1 Oct 2021 05:48:35 -0400
Received: from albert.telenet-ops.be (albert.telenet-ops.be [IPv6:2a02:1800:110:4::f00:1a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 72775C06177B
        for <linux-renesas-soc@vger.kernel.org>; Fri,  1 Oct 2021 02:46:51 -0700 (PDT)
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed20:5c32:c2e7:df7:3731])
        by albert.telenet-ops.be with bizsmtp
        id 0Zmp2600N1ZoSwU06ZmpS0; Fri, 01 Oct 2021 11:46:50 +0200
Received: from rox.of.borg ([192.168.97.57] helo=rox)
        by ramsan.of.borg with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
        (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1mWF7x-000zNB-Dy; Fri, 01 Oct 2021 11:46:49 +0200
Received: from geert by rox with local (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1mWF7w-00BEBv-FW; Fri, 01 Oct 2021 11:46:48 +0200
From:   Geert Uytterhoeven <geert+renesas@glider.be>
To:     Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>
Cc:     linux-clk@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [GIT PULL] clk: renesas: Updates for v5.16
Date:   Fri,  1 Oct 2021 11:46:46 +0200
Message-Id: <cover.1633081408.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

	Hi Mike, Stephen,

The following changes since commit fa2a30f8e0aa9304919750b116a9e9e322465299:

  clk: renesas: rzg2l: Fix clk status function (2021-09-24 15:11:05 +0200)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-drivers.git tags/renesas-clk-for-v5.16-tag1

for you to fetch changes up to cc3e8f97bbd370b51b3bb7fec391d65d461d7d02:

  clk: renesas: r8a779a0: Add Z0 and Z1 clock support (2021-09-28 09:28:53 +0200)

----------------------------------------------------------------
clk: renesas: Updates for v5.16

  - Add TPU (PWM), and Z (Cortex-A76) clocks on R-Car V3U,
  - Add Ethernet clocks on RZ/G2L.

Thanks for pulling!
----------------------------------------------------------------
Biju Das (4):
      clk: renesas: rzg2l: Add support to handle MUX clocks
      clk: renesas: r9a07g044: Add ethernet clock sources
      clk: renesas: rzg2l: Add support to handle coupled clocks
      clk: renesas: r9a07g044: Add GbEthernet clock/reset

Geert Uytterhoeven (1):
      clk: renesas: r8a779a0: Add Z0 and Z1 clock support

Wolfram Sang (1):
      clk: renesas: r8a779a0: Add TPU clock

 drivers/clk/renesas/r8a779a0-cpg-mssr.c | 159 ++++++++++++++++++++++++++++++++
 drivers/clk/renesas/r9a07g044-cpg.c     |  29 +++++-
 drivers/clk/renesas/rzg2l-cpg.c         |  94 +++++++++++++++++++
 drivers/clk/renesas/rzg2l-cpg.h         |  26 +++++-
 4 files changed, 306 insertions(+), 2 deletions(-)

Gr{oetje,eeting}s,

						Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
							    -- Linus Torvalds
