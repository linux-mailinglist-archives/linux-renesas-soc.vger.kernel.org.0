Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 47FE56941AF
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 13 Feb 2023 10:45:13 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230108AbjBMJpL (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 13 Feb 2023 04:45:11 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53450 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231210AbjBMJo6 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 13 Feb 2023 04:44:58 -0500
Received: from baptiste.telenet-ops.be (baptiste.telenet-ops.be [IPv6:2a02:1800:120:4::f00:13])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7524946AA
        for <linux-renesas-soc@vger.kernel.org>; Mon, 13 Feb 2023 01:44:51 -0800 (PST)
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed50:5d34:d0af:a884:130e])
        by baptiste.telenet-ops.be with bizsmtp
        id LZko290083vMoCy01Zko0o; Mon, 13 Feb 2023 10:44:48 +0100
Received: from rox.of.borg ([192.168.97.57])
        by ramsan.of.borg with esmtp (Exim 4.95)
        (envelope-from <geert@linux-m68k.org>)
        id 1pRVNs-008twm-FD;
        Mon, 13 Feb 2023 10:44:48 +0100
Received: from geert by rox.of.borg with local (Exim 4.95)
        (envelope-from <geert@linux-m68k.org>)
        id 1pRVOC-0002hG-6Z;
        Mon, 13 Feb 2023 10:44:48 +0100
From:   Geert Uytterhoeven <geert+renesas@glider.be>
To:     Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>
Cc:     linux-clk@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [GIT PULL] clk: renesas: Updates for v6.3 (take three)
Date:   Mon, 13 Feb 2023 10:44:47 +0100
Message-Id: <cover.1676278827.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.3 required=5.0 tests=BAYES_00,
        HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_LOW,SPF_HELO_NONE,SPF_NONE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

	Hi Mike, Stephen,

The following changes since commit bd176e46e9c23f669b28630cc8f3fb1b89fd610e:

  clk: renesas: r8a779g0: Add CAN-FD clocks (2023-01-26 15:13:53 +0100)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-drivers.git tags/renesas-clk-for-v6.3-tag3

for you to fetch changes up to b1dec4e78599a2ce5bf8557056cd6dd72e1096b0:

  clk: renesas: rcar-gen3: Disable R-Car H3 ES1.* (2023-02-10 10:35:16 +0100)

----------------------------------------------------------------
clk: renesas: Updates for v6.3 (take three)

  - Disable R-Car H3 ES1.*, as it was only available to an internal
    development group and needed a lot of quirks and workarounds.

This serves as the main gatekeeper for preventing booting on R-Car H3
ES1.*.  Hence it should go upstream before any of the other R-Car H3
ES1.* quirk handling is removed (in v6.4).

Thanks for pulling!
----------------------------------------------------------------
Wolfram Sang (1):
      clk: renesas: rcar-gen3: Disable R-Car H3 ES1.*

 drivers/clk/renesas/Kconfig            |   2 +-
 drivers/clk/renesas/r8a7795-cpg-mssr.c | 126 +++------------------------------
 drivers/clk/renesas/rcar-gen3-cpg.c    |  17 +----
 drivers/clk/renesas/renesas-cpg-mssr.c |  27 -------
 drivers/clk/renesas/renesas-cpg-mssr.h |  14 ----
 5 files changed, 13 insertions(+), 173 deletions(-)

Gr{oetje,eeting}s,

						Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
							    -- Linus Torvalds
