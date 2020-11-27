Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F0B8A2C6713
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 27 Nov 2020 14:44:51 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729662AbgK0NnB (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 27 Nov 2020 08:43:01 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54300 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729592AbgK0NnB (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 27 Nov 2020 08:43:01 -0500
Received: from laurent.telenet-ops.be (laurent.telenet-ops.be [IPv6:2a02:1800:110:4::f00:19])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0802DC0613D2
        for <linux-renesas-soc@vger.kernel.org>; Fri, 27 Nov 2020 05:43:00 -0800 (PST)
Received: from ramsan.of.borg ([84.195.186.194])
        by laurent.telenet-ops.be with bizsmtp
        id xRiy2300f4C55Sk01Riy5t; Fri, 27 Nov 2020 14:42:59 +0100
Received: from rox.of.borg ([192.168.97.57])
        by ramsan.of.borg with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
        (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1kie1a-0065Xi-Em; Fri, 27 Nov 2020 14:42:58 +0100
Received: from geert by rox.of.borg with local (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1kie1Z-000Kbx-Uv; Fri, 27 Nov 2020 14:42:57 +0100
From:   Geert Uytterhoeven <geert@linux-m68k.org>
To:     Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>
Cc:     linux-clk@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        Geert Uytterhoeven <geert@linux-m68k.org>
Subject: [GIT PULL] clk: renesas: Updates for v5.11 (take two)
Date:   Fri, 27 Nov 2020 14:42:56 +0100
Message-Id: <20201127134256.79186-1-geert@linux-m68k.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

	Hi Mike, Stephen,

The following changes since commit cf5577a1cfc104c71f011738ab753bf2ac2f91ed:

  clk: renesas: r8a779a0: Fix R and OSC clocks (2020-11-10 09:25:46 +0100)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-drivers.git tags/renesas-clk-for-v5.11-tag2

for you to fetch changes up to acaece1de58901a7f56cc0d4e5149897a903ad23:

  dt-bindings: clock: renesas: rcar-usb2-clock-sel: Convert bindings to json-schema (2020-11-27 09:01:25 +0100)

----------------------------------------------------------------
clk: renesas: Updates for v5.11 (take two)

  - Add RPC (QSPI/HyperFLASH) clocks on RZ/G2E,
  - Stop using __raw_*() I/O accessors,
  - One more conversion of DT bindings to json-schema.

Thanks for pulling!
----------------------------------------------------------------
Geert Uytterhoeven (1):
      clk: renesas: sh73a0: Stop using __raw_*() I/O accessors

Lad Prabhakar (1):
      clk: renesas: r8a774c0: Add RPC clocks

Yoshihiro Shimoda (1):
      dt-bindings: clock: renesas: rcar-usb2-clock-sel: Convert bindings to json-schema

 .../bindings/clock/renesas,rcar-usb2-clock-sel.txt |  68 --------------
 .../clock/renesas,rcar-usb2-clock-sel.yaml         | 100 +++++++++++++++++++++
 drivers/clk/renesas/clk-sh73a0.c                   |   2 +-
 drivers/clk/renesas/r8a774c0-cpg-mssr.c            |   9 ++
 drivers/clk/renesas/rcar-gen3-cpg.c                |  28 ++++++
 drivers/clk/renesas/rcar-gen3-cpg.h                |   5 ++
 6 files changed, 143 insertions(+), 69 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/clock/renesas,rcar-usb2-clock-sel.txt
 create mode 100644 Documentation/devicetree/bindings/clock/renesas,rcar-usb2-clock-sel.yaml

Gr{oetje,eeting}s,

						Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
							    -- Linus Torvalds
