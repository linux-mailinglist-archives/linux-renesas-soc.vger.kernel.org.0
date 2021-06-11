Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D61C23A3F74
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 11 Jun 2021 11:47:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231361AbhFKJtd (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 11 Jun 2021 05:49:33 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48126 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231210AbhFKJtd (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 11 Jun 2021 05:49:33 -0400
Received: from xavier.telenet-ops.be (xavier.telenet-ops.be [IPv6:2a02:1800:120:4::f00:14])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BE533C061574
        for <linux-renesas-soc@vger.kernel.org>; Fri, 11 Jun 2021 02:47:35 -0700 (PDT)
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed20:2411:a261:8fe2:b47f])
        by xavier.telenet-ops.be with bizsmtp
        id Flnb2500925eH3q01lnbP0; Fri, 11 Jun 2021 11:47:35 +0200
Received: from rox.of.borg ([192.168.97.57])
        by ramsan.of.borg with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
        (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1lrdlG-00FcRQ-VV; Fri, 11 Jun 2021 11:47:34 +0200
Received: from geert by rox.of.borg with local (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1lrdlF-00CZtd-QK; Fri, 11 Jun 2021 11:47:33 +0200
From:   Geert Uytterhoeven <geert+renesas@glider.be>
To:     Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>
Cc:     linux-clk@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [GIT PULL] clk: renesas: Updates for v5.14 (take two)
Date:   Fri, 11 Jun 2021 11:47:32 +0200
Message-Id: <cover.1623404713.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

	Hi Mike, Stephen,

The following changes since commit 790c06cc5df263cdaff748670cc65958c81b0951:

  clk: renesas: r8a77995: Add ZA2 clock (2021-05-27 15:27:28 +0200)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-drivers.git tags/renesas-clk-for-v5.14-tag2

for you to fetch changes up to 17f0ff3d49ff1a9d4027f9c2bef4725ab41aa9a5:

  clk: renesas: Add support for R9A07G044 SoC (2021-06-10 15:46:46 +0200)

----------------------------------------------------------------
clk: renesas: Updates for v5.14 (take two)

  - Add support for the new RZ/G2L SoC.

Note that the new Renesas RZ/G2L DT Binding Definitions are shared by
driver and DT source files, and thus included in multiple pull requests:
  - "[GIT PULL 2/4] Renesas ARM DT updates for v5.14 (take two)" (for
    soc),
  - "[GIT PULL] clk: renesas: Updates for v5.14 (take two)" (for clk).

Thanks for pulling!

----------------------------------------------------------------
Geert Uytterhoeven (1):
      Merge tag 'renesas-r9a07g044-dt-binding-defs-tag' into renesas-clk-for-v5.14

Lad Prabhakar (4):
      dt-bindings: clock: Add r9a07g044 CPG Clock Definitions
      dt-bindings: clock: renesas: Document RZ/G2L SoC CPG driver
      clk: renesas: Add CPG core wrapper for RZ/G2L SoC
      clk: renesas: Add support for R9A07G044 SoC

 .../bindings/clock/renesas,rzg2l-cpg.yaml          |  83 +++
 drivers/clk/renesas/Kconfig                        |   9 +
 drivers/clk/renesas/Makefile                       |   2 +
 drivers/clk/renesas/r9a07g044-cpg.c                | 127 ++++
 drivers/clk/renesas/renesas-rzg2l-cpg.c            | 750 +++++++++++++++++++++
 drivers/clk/renesas/renesas-rzg2l-cpg.h            | 136 ++++
 include/dt-bindings/clock/r9a07g044-cpg.h          |  89 +++
 7 files changed, 1196 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/clock/renesas,rzg2l-cpg.yaml
 create mode 100644 drivers/clk/renesas/r9a07g044-cpg.c
 create mode 100644 drivers/clk/renesas/renesas-rzg2l-cpg.c
 create mode 100644 drivers/clk/renesas/renesas-rzg2l-cpg.h
 create mode 100644 include/dt-bindings/clock/r9a07g044-cpg.h

Gr{oetje,eeting}s,

						Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
							    -- Linus Torvalds
