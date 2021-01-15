Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 991D02F75F2
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 15 Jan 2021 10:54:10 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730154AbhAOJxg (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 15 Jan 2021 04:53:36 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:32890 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727754AbhAOJxg (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 15 Jan 2021 04:53:36 -0500
Received: from baptiste.telenet-ops.be (baptiste.telenet-ops.be [IPv6:2a02:1800:120:4::f00:13])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DB9C3C061757
        for <linux-renesas-soc@vger.kernel.org>; Fri, 15 Jan 2021 01:52:56 -0800 (PST)
Received: from ramsan.of.borg ([84.195.186.194])
        by baptiste.telenet-ops.be with bizsmtp
        id Gxsu2400L4C55Sk01xsuz8; Fri, 15 Jan 2021 10:52:55 +0100
Received: from rox.of.borg ([192.168.97.57])
        by ramsan.of.borg with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
        (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1l0Lmo-003j20-Bk; Fri, 15 Jan 2021 10:52:54 +0100
Received: from geert by rox.of.borg with local (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1l0Lmn-009nLa-Tf; Fri, 15 Jan 2021 10:52:53 +0100
From:   Geert Uytterhoeven <geert+renesas@glider.be>
To:     Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>
Cc:     linux-clk@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [GIT PULL] clk: renesas: Updates for v5.12
Date:   Fri, 15 Jan 2021 10:52:48 +0100
Message-Id: <20210115095248.2334597-1-geert+renesas@glider.be>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

	Hi Mike, Stephen,

The following changes since commit 5c8fe583cce542aa0b84adc939ce85293de36e5e:

  Linux 5.11-rc1 (2020-12-27 15:30:22 -0800)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-drivers.git tags/renesas-clk-for-v5.12-tag1

for you to fetch changes up to c706121386fe8414ac0a0acab37c74aac698c51d:

  dt-bindings: clock: renesas: rcar-usb2-clock-sel: Add support for RZ/G2 M/N/H (2021-01-12 12:35:13 +0100)

----------------------------------------------------------------
clk: renesas: Updates for v5.12

  - Add timer (TMU) clocks on most R-Car Gen3 SoCs,
  - Add video-related (FCPVD/VSPD/VSPX), watchdog (RWDT), serial
    (HSCIF), pincontrol/GPIO (PFC/GPIO), SPI (MSIOF), SDHI, and DMA
    (SYS-DMAC) clocks on R-Car V3U,
  - Add support for the USB 2.0 clock selector on RZ/G2 SoCs,
  - Minor fixes and improvements.

Thanks for pulling!
----------------------------------------------------------------
Adam Ford (1):
      dt-bindings: clock: renesas: rcar-usb2-clock-sel: Add support for RZ/G2 M/N/H

Geert Uytterhoeven (5):
      clk: renesas: r8a779a0: Remove non-existent S2 clock
      clk: renesas: r8a779a0: Fix parent of CBFUSA clock
      clk: renesas: r8a779a0: Add PFC/GPIO clocks
      clk: renesas: r8a779a0: Add MSIOF clocks
      clk: renesas: r8a779a0: Add SYS-DMAC clocks

Kieran Bingham (3):
      clk: renesas: r8a779a0: Add FCPVD clock support
      clk: renesas: r8a779a0: Add VSPD clock support
      clk: renesas: r8a779a0: Add VSPX clock support

Niklas Söderlund (4):
      clk: renesas: r8a7796: Add TMU clocks
      clk: renesas: r8a77965: Add TMU clocks
      clk: renesas: r8a77990: Add TMU clocks
      clk: renesas: r8a77995: Add TMU clocks

Wolfram Sang (5):
      clk: renesas: r8a779a0: Add RWDT clocks
      clk: renesas: r8a779a0: Add HSCIF support
      clk: renesas: rcar-gen3: Remove cpg_quirks access when registering SD clock
      clk: renesas: rcar-gen3: Factor out CPG library
      clk: renesas: r8a779a0: Add SDHI support

 .../clock/renesas,rcar-usb2-clock-sel.yaml         |   3 +
 drivers/clk/renesas/Kconfig                        |   5 +
 drivers/clk/renesas/Makefile                       |   1 +
 drivers/clk/renesas/r8a7796-cpg-mssr.c             |   5 +
 drivers/clk/renesas/r8a77965-cpg-mssr.c            |   5 +
 drivers/clk/renesas/r8a77990-cpg-mssr.c            |   5 +
 drivers/clk/renesas/r8a77995-cpg-mssr.c            |   5 +
 drivers/clk/renesas/r8a779a0-cpg-mssr.c            |  54 ++++-
 drivers/clk/renesas/rcar-cpg-lib.c                 | 270 +++++++++++++++++++++
 drivers/clk/renesas/rcar-cpg-lib.h                 |  33 +++
 drivers/clk/renesas/rcar-gen3-cpg.c                | 267 +-------------------
 11 files changed, 391 insertions(+), 262 deletions(-)
 create mode 100644 drivers/clk/renesas/rcar-cpg-lib.c
 create mode 100644 drivers/clk/renesas/rcar-cpg-lib.h

Gr{oetje,eeting}s,

						Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
							    -- Linus Torvalds
