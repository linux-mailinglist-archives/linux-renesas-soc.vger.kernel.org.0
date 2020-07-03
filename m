Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 282E32139DC
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  3 Jul 2020 14:17:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726245AbgGCMRh (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 3 Jul 2020 08:17:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51110 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726183AbgGCMRh (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 3 Jul 2020 08:17:37 -0400
Received: from michel.telenet-ops.be (michel.telenet-ops.be [IPv6:2a02:1800:110:4::f00:18])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DF9EAC08C5C1
        for <linux-renesas-soc@vger.kernel.org>; Fri,  3 Jul 2020 05:17:36 -0700 (PDT)
Received: from ramsan ([IPv6:2a02:1810:ac12:ed20:e8cd:dde5:943b:dfd3])
        by michel.telenet-ops.be with bizsmtp
        id ycHZ220061UkkT806cHZg5; Fri, 03 Jul 2020 14:17:35 +0200
Received: from rox.of.borg ([192.168.97.57])
        by ramsan with esmtp (Exim 4.90_1)
        (envelope-from <geert@linux-m68k.org>)
        id 1jrKdJ-0004hZ-0t; Fri, 03 Jul 2020 14:17:33 +0200
Received: from geert by rox.of.borg with local (Exim 4.90_1)
        (envelope-from <geert@linux-m68k.org>)
        id 1jrKdI-0001kT-U4; Fri, 03 Jul 2020 14:17:32 +0200
From:   Geert Uytterhoeven <geert+renesas@glider.be>
To:     Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>
Cc:     linux-clk@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [GIT PULL] clk: renesas: Updates for v5.9
Date:   Fri,  3 Jul 2020 14:17:29 +0200
Message-Id: <20200703121729.6678-1-geert+renesas@glider.be>
X-Mailer: git-send-email 2.17.1
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

	Hi Mike, Stephen,

The following changes since commit b3a9e3b9622ae10064826dccb4f7a52bd88c7407:

  Linux 5.8-rc1 (2020-06-14 12:45:04 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-drivers.git tags/clk-renesas-for-v5.9-tag1

for you to fetch changes up to 52bc5ea6edde35bc65ed6ecd7639534e78002c74:

  clk: renesas: rzg2: Mark RWDT clocks as critical (2020-06-22 16:54:32 +0200)

----------------------------------------------------------------
clk: renesas: Updates for v5.9

  - One more conversion of DT bindings to json-schema,
  - Enhance critical clock handling to only consider clocks that were
    enabled at boot time, and use it for watchdog clock handling on
    R-Car Gen3 and RZ/G2 SoCs.

Thanks for pulling!
----------------------------------------------------------------
Geert Uytterhoeven (1):
      dt-bindings: clock: renesas: cpg: Convert to json-schema

Ulrich Hecht (3):
      clk: renesas: cpg-mssr: Mark clocks as critical only if on at boot
      clk: renesas: rcar-gen3: Mark RWDT clocks as critical
      clk: renesas: rzg2: Mark RWDT clocks as critical

 .../bindings/clock/renesas,cpg-clocks.yaml         | 241 +++++++++++++++++++++
 .../bindings/clock/renesas,r8a73a4-cpg-clocks.txt  |  33 ---
 .../bindings/clock/renesas,r8a7740-cpg-clocks.txt  |  41 ----
 .../bindings/clock/renesas,r8a7778-cpg-clocks.txt  |  47 ----
 .../bindings/clock/renesas,r8a7779-cpg-clocks.txt  |  49 -----
 .../bindings/clock/renesas,rz-cpg-clocks.txt       |  53 -----
 .../bindings/clock/renesas,sh73a0-cpg-clocks.txt   |  35 ---
 drivers/clk/renesas/r8a774a1-cpg-mssr.c            |   1 +
 drivers/clk/renesas/r8a774b1-cpg-mssr.c            |   1 +
 drivers/clk/renesas/r8a774c0-cpg-mssr.c            |   1 +
 drivers/clk/renesas/r8a7795-cpg-mssr.c             |   2 +-
 drivers/clk/renesas/r8a7796-cpg-mssr.c             |   2 +-
 drivers/clk/renesas/r8a77965-cpg-mssr.c            |   1 +
 drivers/clk/renesas/r8a77970-cpg-mssr.c            |   2 +-
 drivers/clk/renesas/r8a77980-cpg-mssr.c            |   2 +-
 drivers/clk/renesas/r8a77990-cpg-mssr.c            |   1 +
 drivers/clk/renesas/r8a77995-cpg-mssr.c            |   2 +-
 drivers/clk/renesas/renesas-cpg-mssr.c             |  17 +-
 18 files changed, 260 insertions(+), 271 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/clock/renesas,cpg-clocks.yaml
 delete mode 100644 Documentation/devicetree/bindings/clock/renesas,r8a73a4-cpg-clocks.txt
 delete mode 100644 Documentation/devicetree/bindings/clock/renesas,r8a7740-cpg-clocks.txt
 delete mode 100644 Documentation/devicetree/bindings/clock/renesas,r8a7778-cpg-clocks.txt
 delete mode 100644 Documentation/devicetree/bindings/clock/renesas,r8a7779-cpg-clocks.txt
 delete mode 100644 Documentation/devicetree/bindings/clock/renesas,rz-cpg-clocks.txt
 delete mode 100644 Documentation/devicetree/bindings/clock/renesas,sh73a0-cpg-clocks.txt

Gr{oetje,eeting}s,

						Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
							    -- Linus Torvalds
