Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 170EF77F2B0
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 17 Aug 2023 11:04:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233203AbjHQJDv (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 17 Aug 2023 05:03:51 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50832 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1349255AbjHQJDT (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 17 Aug 2023 05:03:19 -0400
Received: from xavier.telenet-ops.be (xavier.telenet-ops.be [IPv6:2a02:1800:120:4::f00:14])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E582D210E
        for <linux-renesas-soc@vger.kernel.org>; Thu, 17 Aug 2023 02:03:14 -0700 (PDT)
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed40:d85a:258d:2c59:b44])
        by xavier.telenet-ops.be with bizsmtp
        id aZ3B2A00W4QHFyo01Z3BUk; Thu, 17 Aug 2023 11:03:12 +0200
Received: from rox.of.borg ([192.168.97.57])
        by ramsan.of.borg with esmtp (Exim 4.95)
        (envelope-from <geert@linux-m68k.org>)
        id 1qWYuG-000tK5-6T;
        Thu, 17 Aug 2023 11:03:11 +0200
Received: from geert by rox.of.borg with local (Exim 4.95)
        (envelope-from <geert@linux-m68k.org>)
        id 1qWYlz-006xCM-7u;
        Thu, 17 Aug 2023 10:54:31 +0200
From:   Geert Uytterhoeven <geert+renesas@glider.be>
To:     Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>
Cc:     linux-clk@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [GIT PULL] clk: renesas: Updates for v6.6 (take two)
Date:   Thu, 17 Aug 2023 10:54:29 +0200
Message-Id: <cover.1692262242.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-1.6 required=5.0 tests=BAYES_00,
        HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,
        SPF_NONE autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

	Hi Mike, Stephen,

The following changes since commit dec57795efc4585d5bbca913af6683c5cce2a647:

  clk: renesas: r8a77965: Add 3DGE and ZG support (2023-07-27 14:32:46 +0200)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-drivers.git tags/renesas-clk-for-v6.6-tag2

for you to fetch changes up to 708cb698ffa219567dd5837aefae7a99fbb28b77:

  clk: renesas: rcar-gen3: Add ADG clocks (2023-08-15 11:34:43 +0200)

----------------------------------------------------------------
clk: renesas: Updates for v6.6 (take two)

  - Add Audio Clock Generator (ADG) clocks on R-Car Gen3 and RZ/G2 SoCs.

A bit later than usual (holidays!), but it is better to apply this
rather sooner than later, as it is a hard dependency for a future DT
update.

Thanks for pulling!

----------------------------------------------------------------
Kuninori Morimoto (1):
      clk: renesas: rcar-gen3: Add ADG clocks

 drivers/clk/renesas/r8a774a1-cpg-mssr.c | 1 +
 drivers/clk/renesas/r8a774b1-cpg-mssr.c | 1 +
 drivers/clk/renesas/r8a774c0-cpg-mssr.c | 1 +
 drivers/clk/renesas/r8a774e1-cpg-mssr.c | 2 +-
 drivers/clk/renesas/r8a7795-cpg-mssr.c  | 1 +
 drivers/clk/renesas/r8a7796-cpg-mssr.c  | 1 +
 drivers/clk/renesas/r8a77965-cpg-mssr.c | 1 +
 drivers/clk/renesas/r8a77990-cpg-mssr.c | 1 +
 drivers/clk/renesas/r8a77995-cpg-mssr.c | 1 +
 9 files changed, 9 insertions(+), 1 deletion(-)

Gr{oetje,eeting}s,

						Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
							    -- Linus Torvalds
