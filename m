Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0E5551BF371
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 30 Apr 2020 10:49:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726531AbgD3ItE (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 30 Apr 2020 04:49:04 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35740 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726420AbgD3ItE (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 30 Apr 2020 04:49:04 -0400
Received: from laurent.telenet-ops.be (laurent.telenet-ops.be [IPv6:2a02:1800:110:4::f00:19])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0EE0CC035494
        for <linux-renesas-soc@vger.kernel.org>; Thu, 30 Apr 2020 01:49:03 -0700 (PDT)
Received: from ramsan ([IPv6:2a02:1810:ac12:ed60:182a:142e:a95f:66c2])
        by laurent.telenet-ops.be with bizsmtp
        id Ywp32200g0w8ZL601wp3Ki; Thu, 30 Apr 2020 10:49:03 +0200
Received: from rox.of.borg ([192.168.97.57])
        by ramsan with esmtp (Exim 4.90_1)
        (envelope-from <geert@linux-m68k.org>)
        id 1jU4sR-0002le-JT; Thu, 30 Apr 2020 10:49:03 +0200
Received: from geert by rox.of.borg with local (Exim 4.90_1)
        (envelope-from <geert@linux-m68k.org>)
        id 1jU4sR-0000Pb-ID; Thu, 30 Apr 2020 10:49:03 +0200
From:   Geert Uytterhoeven <geert+renesas@glider.be>
To:     Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>
Cc:     linux-clk@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [GIT PULL] clk: renesas: Updates for v5.8
Date:   Thu, 30 Apr 2020 10:49:02 +0200
Message-Id: <20200430084902.1540-1-geert+renesas@glider.be>
X-Mailer: git-send-email 2.17.1
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

	Hi Mike, Stephen,

The following changes since commit 8f3d9f354286745c751374f5f1fcafee6b3f3136:

  Linux 5.7-rc1 (2020-04-12 12:35:55 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-drivers.git tags/clk-renesas-for-v5.8-tag1

for you to fetch changes up to e2f022c10ed3b50ba1d2bb1f037b0e7a84cb1c3e:

  clk: renesas: rcar-gen2: Remove superfluous CLK_RENESAS_DIV6 selects (2020-04-30 09:39:06 +0200)

----------------------------------------------------------------
clk: renesas: Updates for v5.8

  - Add support for the USB 2.0 clock selector on R-Car M3-W+,
  - Add support for the new RZ/G1H (R8A7742) SoC,
  - Minor fixes and cleanups.

Note that the new Renesas RZ/G1H DT Binding Definitions are shared by
driver and DT source files, and thus included in multiple pull requests:
  - "[GIT PULL 4/5] Renesas driver updates for v5.8" (for arm-soc),
  - "[GIT PULL] clk: renesas: Updates for v5.8" (for clk).

Thanks for pulling!
----------------------------------------------------------------
Christophe JAILLET (1):
      clk: renesas: r9a06g032: Fix some typo in comments

Geert Uytterhoeven (3):
      MAINTAINERS: Add DT Bindings for Renesas Clock Generators
      Merge tag 'renesas-r8a7742-dt-binding-defs-tag' into clk-renesas-for-v5.8
      clk: renesas: rcar-gen2: Remove superfluous CLK_RENESAS_DIV6 selects

Lad Prabhakar (4):
      dt-bindings: power: rcar-sysc: Add r8a7742 power domain index macros
      clk: renesas: Add r8a7742 CPG Core Clock Definitions
      dt-bindings: clock: renesas: cpg-mssr: Document r8a7742 binding
      clk: renesas: cpg-mssr: Add R8A7742 support

Yoshihiro Shimoda (1):
      dt-bindings: clock: renesas: rcar-usb2-clock-sel: Add r8a77961 support

 .../bindings/clock/renesas,cpg-mssr.yaml           |   1 +
 .../bindings/clock/renesas,rcar-usb2-clock-sel.txt |   4 +-
 MAINTAINERS                                        |   1 +
 drivers/clk/renesas/Kconfig                        |   8 +-
 drivers/clk/renesas/Makefile                       |   1 +
 drivers/clk/renesas/r8a7742-cpg-mssr.c             | 275 +++++++++++++++++++++
 drivers/clk/renesas/r9a06g032-clocks.c             |   6 +-
 drivers/clk/renesas/renesas-cpg-mssr.c             |   6 +
 drivers/clk/renesas/renesas-cpg-mssr.h             |   1 +
 include/dt-bindings/clock/r8a7742-cpg-mssr.h       |  42 ++++
 include/dt-bindings/power/r8a7742-sysc.h           |  29 +++
 11 files changed, 367 insertions(+), 7 deletions(-)
 create mode 100644 drivers/clk/renesas/r8a7742-cpg-mssr.c
 create mode 100644 include/dt-bindings/clock/r8a7742-cpg-mssr.h
 create mode 100644 include/dt-bindings/power/r8a7742-sysc.h

Gr{oetje,eeting}s,

						Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
							    -- Linus Torvalds
