Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C7DAB7563E3
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 17 Jul 2023 15:11:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230094AbjGQNL3 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 17 Jul 2023 09:11:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50942 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231381AbjGQNL2 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 17 Jul 2023 09:11:28 -0400
Received: from albert.telenet-ops.be (albert.telenet-ops.be [IPv6:2a02:1800:110:4::f00:1a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 82690DE
        for <linux-renesas-soc@vger.kernel.org>; Mon, 17 Jul 2023 06:11:26 -0700 (PDT)
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed40:5803:2d6d:5bbc:e252])
        by albert.telenet-ops.be with bizsmtp
        id NDBP2A00V0ucMBo06DBPjh; Mon, 17 Jul 2023 15:11:24 +0200
Received: from rox.of.borg ([192.168.97.57])
        by ramsan.of.borg with esmtp (Exim 4.95)
        (envelope-from <geert@linux-m68k.org>)
        id 1qLO0Q-001fnX-NF;
        Mon, 17 Jul 2023 15:11:23 +0200
Received: from geert by rox.of.borg with local (Exim 4.95)
        (envelope-from <geert@linux-m68k.org>)
        id 1qLO0Z-007Qi3-Io;
        Mon, 17 Jul 2023 15:11:23 +0200
From:   Geert Uytterhoeven <geert+renesas@glider.be>
To:     Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>
Cc:     linux-renesas-soc@vger.kernel.org, linux-clk@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH 0/3] clk: renesas: r-car-h3/m3-w/m3-n: Add 3DGE and ZG support
Date:   Mon, 17 Jul 2023 15:11:19 +0200
Message-Id: <cover.1689599217.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-1.7 required=5.0 tests=BAYES_00,
        HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,
        SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=no autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

	Hi all,

This patch series adds support for the GPU clocks on the R-Car H3,
M3-W(+), and M-N SoCs.  It is based on a similar series for RZ/G2[HMN]
by Adam Ford.  Hopefully this series will aid in bootstrapping upstream
GPU support for R-Car Gen3.

I intend to queue this in renesas-clk-for-v6.6.

Thanks for your comments!

Geert Uytterhoeven (3):
  clk: renesas: r8a7795: Add 3DGE and ZG support
  clk: renesas: r8a7796: Add 3DGE and ZG support
  clk: renesas: r8a77965: Add 3DGE and ZG support

 drivers/clk/renesas/r8a7795-cpg-mssr.c  | 2 ++
 drivers/clk/renesas/r8a7796-cpg-mssr.c  | 2 ++
 drivers/clk/renesas/r8a77965-cpg-mssr.c | 2 ++
 3 files changed, 6 insertions(+)

-- 
2.34.1

Gr{oetje,eeting}s,

						Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
							    -- Linus Torvalds
