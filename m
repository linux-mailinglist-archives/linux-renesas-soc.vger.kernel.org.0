Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C71EF5BCBA4
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 19 Sep 2022 14:18:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229586AbiISMSl (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 19 Sep 2022 08:18:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49996 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229943AbiISMSg (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 19 Sep 2022 08:18:36 -0400
Received: from andre.telenet-ops.be (andre.telenet-ops.be [IPv6:2a02:1800:120:4::f00:15])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EF1CAE007
        for <linux-renesas-soc@vger.kernel.org>; Mon, 19 Sep 2022 05:18:34 -0700 (PDT)
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed50:ed67:3be8:ebe5:696d])
        by andre.telenet-ops.be with bizsmtp
        id MoJZ280020GZoLL01oJZZg; Mon, 19 Sep 2022 14:18:33 +0200
Received: from rox.of.borg ([192.168.97.57])
        by ramsan.of.borg with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
        (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1oaFjM-005cMa-S6; Mon, 19 Sep 2022 14:18:32 +0200
Received: from geert by rox.of.borg with local (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1oaFjL-00GCxa-VQ; Mon, 19 Sep 2022 14:18:31 +0200
From:   Geert Uytterhoeven <geert+renesas@glider.be>
To:     Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>
Cc:     linux-clk@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [GIT PULL] clk: renesas: Updates for v6.1 (take two)
Date:   Mon, 19 Sep 2022 14:18:30 +0200
Message-Id: <cover.1663589800.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.25.1
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

The following changes since commit e312ae92077f90d6ccdca05fb6d640bd9624c37c:

  dt-bindings: clock: renesas,rzg2l: Document RZ/Five SoC (2022-09-02 10:47:30 +0200)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-drivers.git tags/renesas-clk-for-v6.1-tag2

for you to fetch changes up to e46a1a9943c0e84f439b971d6ce03f87e3d67441:

  clk: renesas: r8a779g0: Add EtherAVB clocks (2022-09-18 14:43:51 +0200)

----------------------------------------------------------------
clk: renesas: Updates for v6.1 (take two)

  - Add watchdog, I2C, pin control/GPIO, and Ethernet clocks on R-Car
    V4H.

Thanks for pulling!

----------------------------------------------------------------
Geert Uytterhoeven (4):
      clk: renesas: r8a779g0: Add watchdog clock
      clk: renesas: r8a779g0: Add I2C clocks
      clk: renesas: r8a779g0: Add PFC/GPIO clocks
      clk: renesas: r8a779g0: Add EtherAVB clocks

 drivers/clk/renesas/r8a779g0-cpg-mssr.c | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

Gr{oetje,eeting}s,

						Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
							    -- Linus Torvalds
