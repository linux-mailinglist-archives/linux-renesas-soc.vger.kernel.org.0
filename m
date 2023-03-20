Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id DFA486C1BDB
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 20 Mar 2023 17:36:50 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232080AbjCTQgt (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 20 Mar 2023 12:36:49 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48260 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232065AbjCTQg0 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 20 Mar 2023 12:36:26 -0400
Received: from laurent.telenet-ops.be (laurent.telenet-ops.be [IPv6:2a02:1800:110:4::f00:19])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D101DE050
        for <linux-renesas-soc@vger.kernel.org>; Mon, 20 Mar 2023 09:30:14 -0700 (PDT)
Received: from ramsan.of.borg ([84.195.187.55])
        by laurent.telenet-ops.be with bizsmtp
        id agWB2900A1C8whw01gWBZi; Mon, 20 Mar 2023 17:30:11 +0100
Received: from rox.of.borg ([192.168.97.57])
        by ramsan.of.borg with esmtp (Exim 4.95)
        (envelope-from <geert@linux-m68k.org>)
        id 1peIO2-00E2up-BF;
        Mon, 20 Mar 2023 17:30:11 +0100
Received: from geert by rox.of.borg with local (Exim 4.95)
        (envelope-from <geert@linux-m68k.org>)
        id 1peIOh-007SSj-4I;
        Mon, 20 Mar 2023 17:30:11 +0100
From:   Geert Uytterhoeven <geert+renesas@glider.be>
To:     Magnus Damm <magnus.damm@gmail.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>
Cc:     linux-clk@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH 0/2] ARM: dts: r8a7779: Add PWM support
Date:   Mon, 20 Mar 2023 17:30:04 +0100
Message-Id: <cover.1679329211.git.geert+renesas@glider.be>
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

	Hi all,

This patch series adds support for the seven PWM Timers on the Renesas
R-Car H1 SoC.

For proper operation, this depends on [1].  PWM0 (b/d), PWM2, and PWM5
have been tested with PWM sysfs and a logic analyzer on the Marzen
development board using DT overlays available from [2].

I plan to queue this series in renesas-devel-for-v6.4.

Thanks for your comments!

[1] [PATCH] pinctrl: renesas: r8a7779: Add PWM pins, groups, and functions
    https://lore.kernel.org/r/cea9723e9c3df4b1408750caa38886aac1fab5f7.1679329090.git.geert+renesas@glider.be
[2] https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-drivers.git/log/?h=topic/renesas-overlays

Geert Uytterhoeven (2):
  dt-bindings: clock: r8a7779: Add PWM module clock
  ARM: dts: r8a7779: Add PWM support

 arch/arm/boot/dts/r8a7779.dtsi            | 91 +++++++++++++++++++----
 include/dt-bindings/clock/r8a7779-clock.h |  1 +
 2 files changed, 79 insertions(+), 13 deletions(-)

-- 
2.34.1

Gr{oetje,eeting}s,

						Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
							    -- Linus Torvalds
