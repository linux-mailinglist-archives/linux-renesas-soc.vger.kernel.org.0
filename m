Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3AA71EC636
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  1 Nov 2019 16:58:55 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726701AbfKAP6y (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 1 Nov 2019 11:58:54 -0400
Received: from andre.telenet-ops.be ([195.130.132.53]:44296 "EHLO
        andre.telenet-ops.be" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726229AbfKAP6y (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 1 Nov 2019 11:58:54 -0400
Received: from ramsan ([84.195.182.253])
        by andre.telenet-ops.be with bizsmtp
        id Lfyp210095USYZQ01fypyM; Fri, 01 Nov 2019 16:58:52 +0100
Received: from rox.of.borg ([192.168.97.57])
        by ramsan with esmtp (Exim 4.90_1)
        (envelope-from <geert@linux-m68k.org>)
        id 1iQZK5-0002rR-26; Fri, 01 Nov 2019 16:58:49 +0100
Received: from geert by rox.of.borg with local (Exim 4.90_1)
        (envelope-from <geert@linux-m68k.org>)
        id 1iQZK4-0008CQ-W0; Fri, 01 Nov 2019 16:58:49 +0100
From:   Geert Uytterhoeven <geert+renesas@glider.be>
To:     arm-soc <arm@kernel.org>, arm-soc <soc@kernel.org>
Cc:     Magnus Damm <magnus.damm@gmail.com>,
        linux-arm-kernel@lists.infradead.org,
        linux-renesas-soc@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [GIT PULL 0/6] Renesas SoC updates for v5.5 (take two)
Date:   Fri,  1 Nov 2019 16:58:36 +0100
Message-Id: <20191101155842.31467-1-geert+renesas@glider.be>
X-Mailer: git-send-email 2.17.1
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

	Hi arm-soc folks,

This is my second pull request for the inclusion of Renesas SoC updates
for v5.5.

It consists of 6 parts:

  [GIT PULL 1/6] Renesas ARM defconfig updates for v5.5

    - Refresh shmobile_defconfig for v5.4-rc1.

  [GIT PULL 2/6] Renesas ARM SoC updates for v5.5

    - Drop legacy DT clock support on R-Car Gen2.

  [GIT PULL 3/6] Renesas ARM64 defconfig updates for v5.5 (take two)

    - Enable support for the new R-Car M3-W+ (r8a77961) SoC.

  [GIT PULL 4/6] Renesas ARM64 DT updates for v5.5 (take two)

    - Video-Input and Serial-ATA support on RZ/G2N,
    - Color Management Module support on various R-Car Gen3 SoCs,
    - Initial support for the R-Car M3-W+ (r8a77961) SoC on the
      Salvator-XS board.

  [GIT PULL 5/6] Renesas driver updates for v5.5 (take two)

    - Initial support for the R-Car M3-W+ (r8a77961) SoC,
    - A minor fix.

  [GIT PULL 6/6] Renesas DT binding updates for v5.5 (take two)

    - JSON schema conversion,
    - Core support for the new R-Car M3-W+ (r8a77961) SoC,
    - Board compatible updates.

Note that the new Renesas R-Car M3-W+ DT Binding Definitions are shared
by driver and DT source files, and thus included in 3 pull requests:
  - "[GIT PULL 4/6] Renesas ARM64 DT updates for v5.5 (take two)" (for
    arm-soc),
  - "[GIT PULL 5/6] Renesas driver updates for v5.5 (take two)" (for
    arm-soc),
  - "[GIT PULL] clk: renesas: Updates for v5.5 (take two)] (for clk).

If you prefer to merge this dependency explicitly, please pull tag
renesas-r8a77961-dt-binding-defs-tag first.

Thanks for pulling!

Gr{oetje,eeting}s,

						Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
							    -- Linus Torvalds
