Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9364DDC380
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 18 Oct 2019 13:02:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2633619AbfJRLBL (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 18 Oct 2019 07:01:11 -0400
Received: from michel.telenet-ops.be ([195.130.137.88]:52578 "EHLO
        michel.telenet-ops.be" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2633626AbfJRLBK (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 18 Oct 2019 07:01:10 -0400
Received: from ramsan ([84.194.98.4])
        by michel.telenet-ops.be with bizsmtp
        id Ez142100Y05gfCL06z14Dd; Fri, 18 Oct 2019 13:01:08 +0200
Received: from rox.of.borg ([192.168.97.57])
        by ramsan with esmtp (Exim 4.90_1)
        (envelope-from <geert@linux-m68k.org>)
        id 1iLQ0G-0005q3-Pg; Fri, 18 Oct 2019 13:01:04 +0200
Received: from geert by rox.of.borg with local (Exim 4.90_1)
        (envelope-from <geert@linux-m68k.org>)
        id 1iLPEt-0006ru-Q1; Fri, 18 Oct 2019 12:12:07 +0200
From:   Geert Uytterhoeven <geert+renesas@glider.be>
To:     arm-soc <arm@kernel.org>, arm-soc <soc@kernel.org>
Cc:     Magnus Damm <magnus.damm@gmail.com>,
        linux-arm-kernel@lists.infradead.org,
        linux-renesas-soc@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [GIT PULL 0/5] Renesas SoC updates for v5.5
Date:   Fri, 18 Oct 2019 12:11:31 +0200
Message-Id: <20191018101136.26350-1-geert+renesas@glider.be>
X-Mailer: git-send-email 2.17.1
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

	Hi arm-soc folks,

This is my first pull request for the inclusion of Renesas SoC updates
for v5.5.

It consists of 5 parts:

  [GIT PULL 1/5] Renesas ARM DT updates for v5.5

    - Whitespace cleanups.

  [GIT PULL 2/5] Renesas ARM64 defconfig updates for v5.5

    - Enable support for the new RZ/G2N (r8a774b1) SoC.

  [GIT PULL 3/5] Renesas ARM64 DT updates for v5.5

    - Support for the RZ/G2N (r8a774b1) SoC and the HiHope RZ/G2N board,
    - CPU idle support for R-Car H3 and M3-W,
    - LVDS and backlight support on the HiHope RZ/G2M and RZ/G2N boards,
      with Advantech idk-1110wr LVDS panel,
    - Minor fixes and improvements.

  [GIT PULL 4/5] Renesas driver updates for v5.5

    - Add support for the new RZ/G2N (r8a774b1) SoC,
    - Fix System Controller power request conflicts on recent R-Car Gen3
      and RZ/G2N SoC variants and revisions,
    - Minor cleanups.

  [GIT PULL 5/5] Renesas DT binding updates for v5.5

    - RZ/G2M update for the Renesas Timer Unit bindings,
    - Support for the new RZ/G2N (r8a774b1) SoC and the HiHope RZ/G2N
      board.

Note that the new Renesas RZ/G2N DT Binding Definitions are shared by
driver and DT source files, and thus included in 3 pull requests:
  - "[GIT PULL 3/5] Renesas ARM64 DT updates for v5.5" (for arm-soc),
  - "[GIT PULL 4/5] Renesas driver updates for v5.5" (for arm-soc).
  - "[GIT PULL] clk: renesas: Updates for v5.5] (for clk).

If you prefer to merge this dependency explicitly, please pull tag
renesas-r8a774b1-dt-binding-defs-tag first.

Thanks for pulling!

Gr{oetje,eeting}s,

						Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
							    -- Linus Torvalds
