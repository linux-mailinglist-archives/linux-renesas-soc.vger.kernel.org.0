Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7AA54223A73
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 17 Jul 2020 13:24:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726200AbgGQLYh (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 17 Jul 2020 07:24:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43734 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726000AbgGQLYh (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 17 Jul 2020 07:24:37 -0400
Received: from albert.telenet-ops.be (albert.telenet-ops.be [IPv6:2a02:1800:110:4::f00:1a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CF2BCC061755
        for <linux-renesas-soc@vger.kernel.org>; Fri, 17 Jul 2020 04:24:36 -0700 (PDT)
Received: from ramsan ([84.195.186.194])
        by albert.telenet-ops.be with bizsmtp
        id 4BQX2300M4C55Sk06BQY6R; Fri, 17 Jul 2020 13:24:35 +0200
Received: from rox.of.borg ([192.168.97.57])
        by ramsan with esmtp (Exim 4.90_1)
        (envelope-from <geert@linux-m68k.org>)
        id 1jwOTf-00025l-Pc; Fri, 17 Jul 2020 13:24:31 +0200
Received: from geert by rox.of.borg with local (Exim 4.90_1)
        (envelope-from <geert@linux-m68k.org>)
        id 1jwOTf-0006n7-Nd; Fri, 17 Jul 2020 13:24:31 +0200
From:   Geert Uytterhoeven <geert+renesas@glider.be>
To:     arm-soc <arm@kernel.org>, arm-soc <soc@kernel.org>
Cc:     Magnus Damm <magnus.damm@gmail.com>,
        linux-arm-kernel@lists.infradead.org,
        linux-renesas-soc@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [GIT PULL 0/3] Renesas ARM SoC updates for v5.9 (take two)
Date:   Fri, 17 Jul 2020 13:24:24 +0200
Message-Id: <20200717112427.26032-1-geert+renesas@glider.be>
X-Mailer: git-send-email 2.17.1
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

	Hi arm-soc folks,

This is my second pull request for the inclusion of Renesas SoC updates
for v5.9.

It consists of 3 parts:

  [GIT PULL 1/3] Renesas ARM DT updates for v5.9 (take two)

    - SPI Multi I/O Bus Controller (RPC-IF) support for R-Car V3H and V3M,
      including QSPI support for the Condor, Eagle, V3HSK, and V3MSK
      boards,
    - Initial support for the RZ/G2H SoC on the HopeRun HiHope RZ/G2H
      board,
    - Initial support for the Beacon EmbeddedWorks RZ/G2M board,
    - Minor fixes and improvements.

  [GIT PULL 2/3] Renesas driver updates for v5.9

    - Add core support for the new RZ/G2H (R8A774E1) SoC, including System
      Controller (SYSC) and Reset (RST) support.

  [GIT PULL 3/3] Renesas DT binding updates for v5.9

    - Document core support for the RZ/G2H SoC,
    - Document support for the HopeRun HiHope RZ/G2H, and Beacon
      EmbeddedWorks RZ/G2M boards.

Note that the new Renesas RZ/G2H DT Binding Definitions are shared by
driver and DT source files, and thus included in multiple pull requests:
  - "[GIT PULL] clk: renesas: Updates for v5.9 (take two)" (for clk),
  - "[GIT PULL 1/3] Renesas ARM DT updates for v5.9 (take two)" (for arm-soc),
  - "[GIT PULL 2/3] Renesas driver updates for v5.9" (for arm-soc).

Thanks for pulling!

Gr{oetje,eeting}s,

						Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
							    -- Linus Torvalds
