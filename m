Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AD6213C817F
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 14 Jul 2021 11:24:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238679AbhGNJ05 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 14 Jul 2021 05:26:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47558 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238311AbhGNJ05 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 14 Jul 2021 05:26:57 -0400
Received: from albert.telenet-ops.be (albert.telenet-ops.be [IPv6:2a02:1800:110:4::f00:1a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9A58EC061760
        for <linux-renesas-soc@vger.kernel.org>; Wed, 14 Jul 2021 02:24:05 -0700 (PDT)
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed10:39cc:190a:2775:cfe7])
        by albert.telenet-ops.be with bizsmtp
        id UxQ02500h1ccfby06xQ0WW; Wed, 14 Jul 2021 11:24:03 +0200
Received: from rox.of.borg ([192.168.97.57])
        by ramsan.of.borg with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
        (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1m3b7Y-0015NQ-Di; Wed, 14 Jul 2021 11:24:00 +0200
Received: from geert by rox.of.borg with local (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1m3b7X-00A35F-PB; Wed, 14 Jul 2021 11:23:59 +0200
From:   Geert Uytterhoeven <geert+renesas@glider.be>
To:     soc@kernel.org, Arnd Bergmann <arnd@arndb.de>,
        Olof Johansson <olof@lixom.net>
Cc:     Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Magnus Damm <magnus.damm@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [GIT PULL] Renesas fixes for v5.14
Date:   Wed, 14 Jul 2021 11:23:50 +0200
Message-Id: <cover.1626253929.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

	Hi soc folks,

The following changes since commit e73f0f0ee7541171d89f2e2491130c7771ba58d3:

  Linux 5.14-rc1 (2021-07-11 15:07:40 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-devel.git tags/renesas-fixes-for-v5.14-tag1

for you to fetch changes up to 432b52eea3dcf48083bafa4b2b6ef5b054ead609:

  ARM: shmobile: defconfig: Restore graphical consoles (2021-07-13 09:45:51 +0200)

----------------------------------------------------------------
Renesas fixes for v5.14

  - Fix a clock/reset handling design issue on the new RZ/G2L SoC,
    requiring an atomic change to DT binding definitions, clock driver,
    and DTS,
  - Restore graphical consoles in the shmobile_defconfig.

Background for the first part: after queuing the initial support for the
new Renesas RZ/G2{L,LC} SoCs for v5.14, we discovered an issue with the
way how clocks and resets are handled for modules more complex than
serial ports and i2c controllers.  Fixing that required a redesign of
the DT binding definitions, which are a hard dependency for both the
clock/reset driver and DTS.
As all future changes to the RZ/G2L clock driver and DTS files depend on
this, it would be good if this would make it for v5.14-rc2.

Sorry for the mess, and thanks for pulling!

----------------------------------------------------------------
Biju Das (5):
      clk: renesas: rzg2l: Add multi clock PM support
      clk: renesas: r9a07g044: Rename divider table
      clk: renesas: r9a07g044: Fix P1 Clock
      clk: renesas: r9a07g044: Add P2 Clock support
      dt-bindings: clock: r9a07g044-cpg: Update clock/reset definitions

Geert Uytterhoeven (1):
      ARM: shmobile: defconfig: Restore graphical consoles

 arch/arm/configs/shmobile_defconfig        |   1 +
 arch/arm64/boot/dts/renesas/r9a07g044.dtsi |   4 +-
 drivers/clk/renesas/r9a07g044-cpg.c        |  79 ++++++----
 drivers/clk/renesas/renesas-rzg2l-cpg.c    | 110 +++++++-------
 drivers/clk/renesas/renesas-rzg2l-cpg.h    |  37 +++--
 include/dt-bindings/clock/r9a07g044-cpg.h  | 236 ++++++++++++++++++++++-------
 6 files changed, 320 insertions(+), 147 deletions(-)

Gr{oetje,eeting}s,

						Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
							    -- Linus Torvalds
