Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C4F331D4A6B
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 15 May 2020 12:06:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728228AbgEOKGD (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 15 May 2020 06:06:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49678 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728279AbgEOKGB (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 15 May 2020 06:06:01 -0400
Received: from andre.telenet-ops.be (andre.telenet-ops.be [IPv6:2a02:1800:120:4::f00:15])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8D00EC05BD0A
        for <linux-renesas-soc@vger.kernel.org>; Fri, 15 May 2020 03:06:01 -0700 (PDT)
Received: from ramsan ([IPv6:2a02:1810:ac12:ed60:ad37:48f9:900a:523e])
        by andre.telenet-ops.be with bizsmtp
        id ey5w2200D1TfvYq01y5w1Z; Fri, 15 May 2020 12:05:59 +0200
Received: from rox.of.borg ([192.168.97.57])
        by ramsan with esmtp (Exim 4.90_1)
        (envelope-from <geert@linux-m68k.org>)
        id 1jZXE4-0008Qi-D2; Fri, 15 May 2020 12:05:56 +0200
Received: from geert by rox.of.borg with local (Exim 4.90_1)
        (envelope-from <geert@linux-m68k.org>)
        id 1jZXE4-0003pY-9l; Fri, 15 May 2020 12:05:56 +0200
From:   Geert Uytterhoeven <geert+renesas@glider.be>
To:     arm-soc <arm@kernel.org>, arm-soc <soc@kernel.org>
Cc:     Magnus Damm <magnus.damm@gmail.com>,
        linux-arm-kernel@lists.infradead.org,
        linux-renesas-soc@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [GIT PULL 0/5] Renesas SoC updates for v5.8 (take two)
Date:   Fri, 15 May 2020 12:05:42 +0200
Message-Id: <20200515100547.14671-1-geert+renesas@glider.be>
X-Mailer: git-send-email 2.17.1
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

	Hi arm-soc folks,

This is my second pull request for the inclusion of Renesas SoC updates
for v5.8.

It consists of 5 parts:

  [GIT PULL 1/5] Renesas ARM defconfig updates for v5.8 (take two)

    - Enable support for the new RZ/G1H SoC in the shmobile and multi_v7
      defconfigs.

  [GIT PULL 2/5] Renesas ARM DT updates for v5.8 (take two)

    - Initial support for the Renesas RZ/G1H SoC on the iWave RainboW
      Qseven SOM (G21M) and board (G21D),
    - Support for the AISTARVISION MIPI Adapter V2.1 camera board on the
      Silicon Linux EK874 RZ/G2E evaluation kit.

  [GIT PULL 3/5] Renesas ARM SoC updates for v5.8 (take two)

    - Add debug-ll support for RZ/G1H.

  [GIT PULL 4/5] Renesas driver updates for v5.8 (take two)

    - Add the main config option for the RZ/G1H SoC.

  [GIT PULL 5/5] Renesas DT binding updates for v5.8 (take two)

    - Document support for the RZ/G1H-based iWave RainboW Qseven SOM
      (G21M) and board (G21D).

Note that the new Renesas RZ/G1H DT Binding Definitions are shared by
driver and DT source files, and thus included in multiple pull requests:
  - "[GIT PULL 2/5] Renesas ARM DT updates for v5.8 (take two)",
  - "[GIT PULL 4/5] Renesas driver updates for v5.8" (previous PR),
  - "[GIT PULL] clk: renesas: Updates for v5.8" (for clk).

Thanks for pulling!

Gr{oetje,eeting}s,

						Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
							    -- Linus Torvalds
