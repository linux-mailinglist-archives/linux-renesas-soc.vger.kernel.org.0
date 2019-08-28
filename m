Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 152B0A011F
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 28 Aug 2019 13:58:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726253AbfH1L6q (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 28 Aug 2019 07:58:46 -0400
Received: from albert.telenet-ops.be ([195.130.137.90]:60102 "EHLO
        albert.telenet-ops.be" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725991AbfH1L6q (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 28 Aug 2019 07:58:46 -0400
Received: from ramsan ([84.194.98.4])
        by albert.telenet-ops.be with bizsmtp
        id ubyi2000505gfCL06byiqE; Wed, 28 Aug 2019 13:58:44 +0200
Received: from rox.of.borg ([192.168.97.57])
        by ramsan with esmtp (Exim 4.90_1)
        (envelope-from <geert@linux-m68k.org>)
        id 1i2wb4-0008As-3X; Wed, 28 Aug 2019 13:58:42 +0200
Received: from geert by rox.of.borg with local (Exim 4.90_1)
        (envelope-from <geert@linux-m68k.org>)
        id 1i2wFQ-0001kT-69; Wed, 28 Aug 2019 13:36:20 +0200
From:   Geert Uytterhoeven <geert+renesas@glider.be>
To:     Magnus Damm <magnus.damm@gmail.com>
Cc:     Simon Horman <horms@verge.net.au>,
        linux-renesas-soc@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH v2 0/7] soc: renesas: rcar-gen3-sysc: Fix power request conflicts
Date:   Wed, 28 Aug 2019 13:36:11 +0200
Message-Id: <20190828113618.6672-1-geert+renesas@glider.be>
X-Mailer: git-send-email 2.17.1
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

	Hi all,

Recent R-Car Gen3 SoCs added an External Request Mask Register to the
System Controller (SYSC).  This register allows to mask external power
requests for CPU or 3DG domains, to prevent conflicts between powering
off CPU cores or the 3D Graphics Engine, and changing the state of
another power domain through SYSC, which could lead to CPG state machine
lock-ups.

This patch series starts making use of this register.  Note that the
register is optional, and that its location and contents are
SoC-specific.

This was inspired by a patch in the BSP by Dien Pham
<dien.pham.ry@renesas.com>.

Note that the issue fixed cannot happen in the upstream kernel, as
upstream has no support for graphics acceleration yet.  SoCs lacking the
External Request Mask Register may need a different mitigation in the
future.

Changes compared to v1[1]:
  - Improve description of cover letter and first patch.

Changes compared to RFC[2]:
  - Rebased.

This has been boot-tested on R-Car H3 ES1.0, H3 ES2.0, M3-W ES1.0, M3-N,
V3M, and E3 (only the last 3 have this register!), and regression-tested
on R-Car Gen2.

This has not been tested on R-Car H3 ES3.0, M3-W ES2.0, and V3H.

For your convenience, this series is available in the
topic/rcar3-sysc-extmask-v2 branch of my renesas-drivers git repository at
git://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-drivers.git.

Thanks for your comments!

[1] Not posted, but included in yesterday's renesas-drivers-2019-08-27-v5.3-rc6
[2] "[RFC PATCH 0/7] soc: renesas: rcar-gen3-sysc: Fix power request conflicts"
    (https://lore.kernel.org/linux-renesas-soc/20181205155028.14335-1-geert+renesas@glider.be/)
 
Geert Uytterhoeven (7):
  soc: renesas: rcar-sysc: Prepare for fixing power request conflicts
  soc: renesas: r8a7795-sysc: Fix power request conflicts
  soc: renesas: r8a7796-sysc: Fix power request conflicts
  soc: renesas: r8a77965-sysc: Fix power request conflicts
  soc: renesas: r8a77970-sysc: Fix power request conflicts
  soc: renesas: r8a77980-sysc: Fix power request conflicts
  soc: renesas: r8a77990-sysc: Fix power request conflicts

 drivers/soc/renesas/r8a7795-sysc.c  | 32 ++++++++++++++++++++++++-----
 drivers/soc/renesas/r8a7796-sysc.c  | 22 +++++++++++++++++++-
 drivers/soc/renesas/r8a77965-sysc.c |  3 +++
 drivers/soc/renesas/r8a77970-sysc.c |  3 +++
 drivers/soc/renesas/r8a77980-sysc.c |  3 +++
 drivers/soc/renesas/r8a77990-sysc.c |  3 +++
 drivers/soc/renesas/rcar-sysc.c     | 16 +++++++++++++++
 drivers/soc/renesas/rcar-sysc.h     |  7 +++++--
 8 files changed, 81 insertions(+), 8 deletions(-)

-- 
2.17.1

Gr{oetje,eeting}s,

						Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
							    -- Linus Torvalds
