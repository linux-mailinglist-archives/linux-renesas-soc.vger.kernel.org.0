Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 10E8E26FD77
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 18 Sep 2020 14:48:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726798AbgIRMsS (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 18 Sep 2020 08:48:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40204 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726609AbgIRMsF (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 18 Sep 2020 08:48:05 -0400
Received: from laurent.telenet-ops.be (laurent.telenet-ops.be [IPv6:2a02:1800:110:4::f00:19])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D62B9C06178A
        for <linux-renesas-soc@vger.kernel.org>; Fri, 18 Sep 2020 05:48:04 -0700 (PDT)
Received: from ramsan ([84.195.186.194])
        by laurent.telenet-ops.be with bizsmtp
        id VQo22300M4C55Sk01Qo2Y7; Fri, 18 Sep 2020 14:48:02 +0200
Received: from rox.of.borg ([192.168.97.57])
        by ramsan with esmtp (Exim 4.90_1)
        (envelope-from <geert@linux-m68k.org>)
        id 1kJFo2-000255-DY; Fri, 18 Sep 2020 14:48:02 +0200
Received: from geert by rox.of.borg with local (Exim 4.90_1)
        (envelope-from <geert@linux-m68k.org>)
        id 1kJFo2-00043o-AP; Fri, 18 Sep 2020 14:48:02 +0200
From:   Geert Uytterhoeven <geert+renesas@glider.be>
To:     arm-soc <arm@kernel.org>, arm-soc <soc@kernel.org>
Cc:     Magnus Damm <magnus.damm@gmail.com>,
        linux-arm-kernel@lists.infradead.org,
        linux-renesas-soc@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [GIT PULL 1/4] Renesas ARM SoC updates for v5.10 (take two)
Date:   Fri, 18 Sep 2020 14:47:56 +0200
Message-Id: <20200918124800.15555-1-geert+renesas@glider.be>
X-Mailer: git-send-email 2.17.1
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

	Hi arm-soc folks,

This is my second pull request for the inclusion of Renesas SoC updates
for v5.10.

It consists of 4 parts:

  [GIT PULL 1/4] Renesas ARM DT updates for v5.10 (take two)

    - PCIe endpoint support for the RZ/G2H SoC,
    - SATA support for the HopeRun HiHope RZ/G2H board,
    - Increase support (CAN, LED, SPI NOR, VIN, VSP) for the RZ/G1H SoC on
      the iWave Qseven board (G21D), and its camera add-on board,
    - Initial support for the R-Car V3U SoC on the Falcon CPU and BreakOut
      boards,
    - HDMI display and sound support for the R-Car M3-W+ SoC on the
      Salvator-XS board,
    - Digital Radio Interface (DRIF) support for the R-Car E3 SoC,
    - Minor fixes and cleanups.

  [GIT PULL 2/4] Renesas ARM SoC updates for v5.10

    - Make two local functions static.

  [GIT PULL 3/4] Renesas driver updates for v5.10 (take two)

    - Add core support for the R-Car V3U (R8A779A0) SoC, including System
      Controller (SYSC) and Reset (RST) support,
    - Various Kconfig cleanups.

  [GIT PULL 4/4] Renesas DT binding updates for v5.10

    - Document core support for the R-Car V3U (R8A779A0) SoC and the
      Renesas Falcon CPU and BreakOut boards.

Note that the new Renesas R-Car V3U DT Binding Definitions are shared by
driver and DT source files, and thus included in multiple pull requests:
  - "[GIT PULL] clk: renesas: Updates for v5.10 (take two)" (for clk),
  - "[GIT PULL 1/4] Renesas ARM DT updates for v5.10 (take two)" (for
    arm-soc),
  - "[GIT PULL 3/4] Renesas driver updates for v5.10 (take two)" (for
    arm-soc).

Thanks for pulling!

Gr{oetje,eeting}s,

						Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
							    -- Linus Torvalds
