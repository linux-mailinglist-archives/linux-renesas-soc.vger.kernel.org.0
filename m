Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 769263417F6
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 19 Mar 2021 10:08:21 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229772AbhCSJHr (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 19 Mar 2021 05:07:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42268 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229767AbhCSJHl (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 19 Mar 2021 05:07:41 -0400
Received: from andre.telenet-ops.be (andre.telenet-ops.be [IPv6:2a02:1800:120:4::f00:15])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 60166C06174A
        for <linux-renesas-soc@vger.kernel.org>; Fri, 19 Mar 2021 02:07:41 -0700 (PDT)
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed20:207d:4b39:ec21:2531])
        by andre.telenet-ops.be with bizsmtp
        id i97f2400f3CXdgx0197geM; Fri, 19 Mar 2021 10:07:40 +0100
Received: from rox.of.borg ([192.168.97.57])
        by ramsan.of.borg with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
        (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1lNB6Z-008kqS-Iy; Fri, 19 Mar 2021 10:07:39 +0100
Received: from geert by rox.of.borg with local (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1lNB6Z-00BNFY-0u; Fri, 19 Mar 2021 10:07:39 +0100
From:   Geert Uytterhoeven <geert+renesas@glider.be>
To:     Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>
Cc:     linux-clk@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [GIT PULL] clk: renesas: Updates for v5.13
Date:   Fri, 19 Mar 2021 10:07:37 +0100
Message-Id: <20210319090737.2710936-1-geert+renesas@glider.be>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

	Hi Mike, Stephen,

The following changes since commit a38fd8748464831584a19438cbb3082b5a2dab15:

  Linux 5.12-rc2 (2021-03-05 17:33:41 -0800)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-drivers.git tags/renesas-clk-for-v5.13-tag1

for you to fetch changes up to 0eedab655ec1817d450085dcb12219726cb415ff:

  clk: renesas: r8a779a0: Add CMT clocks (2021-03-12 09:23:24 +0100)

----------------------------------------------------------------
clk: renesas: Updates for v5.13

  - Add DAB hardware accelerator clocks on R-Car E3 and M3-N,
  - Add timer (TMU) clocks on R-Car H3 ES1.0,
  - Add Timer (TMU & CMT) and thermal sensor (TSC) clocks on R-Car V3U.

Thanks for pulling!

----------------------------------------------------------------
Fabrizio Castro (2):
      clk: renesas: r8a77990: Add DAB clock
      clk: renesas: r8a77965: Add DAB clock

Niklas Söderlund (2):
      clk: renesas: r8a779a0: Add TSC clock
      clk: renesas: r8a7795: Add TMU clocks

Wolfram Sang (2):
      clk: renesas: r8a779a0: Add TMU clocks
      clk: renesas: r8a779a0: Add CMT clocks

 drivers/clk/renesas/r8a7795-cpg-mssr.c  |  6 ++++++
 drivers/clk/renesas/r8a77965-cpg-mssr.c |  1 +
 drivers/clk/renesas/r8a77990-cpg-mssr.c |  1 +
 drivers/clk/renesas/r8a779a0-cpg-mssr.c | 11 +++++++++++
 4 files changed, 19 insertions(+)

Gr{oetje,eeting}s,

						Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
							    -- Linus Torvalds
