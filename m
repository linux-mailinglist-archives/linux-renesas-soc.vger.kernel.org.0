Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 364E32D573F
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 10 Dec 2020 10:33:35 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726175AbgLJJc5 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 10 Dec 2020 04:32:57 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43068 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727424AbgLJJcu (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 10 Dec 2020 04:32:50 -0500
Received: from andre.telenet-ops.be (andre.telenet-ops.be [IPv6:2a02:1800:120:4::f00:15])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1BC69C061793
        for <linux-renesas-soc@vger.kernel.org>; Thu, 10 Dec 2020 01:32:09 -0800 (PST)
Received: from ramsan.of.borg ([84.195.186.194])
        by andre.telenet-ops.be with bizsmtp
        id 2ZY62400P4C55Sk01ZY6Pm; Thu, 10 Dec 2020 10:32:07 +0100
Received: from rox.of.borg ([192.168.97.57])
        by ramsan.of.borg with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
        (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1knIIw-009MGS-LZ; Thu, 10 Dec 2020 10:32:06 +0100
Received: from geert by rox.of.borg with local (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1knGiS-00A6Q8-NU; Thu, 10 Dec 2020 08:50:20 +0100
From:   Geert Uytterhoeven <geert+renesas@glider.be>
To:     Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>
Cc:     linux-clk@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [GIT PULL] clk: renesas: Updates for v5.11 (take three)
Date:   Thu, 10 Dec 2020 08:50:18 +0100
Message-Id: <20201210075018.2407915-1-geert+renesas@glider.be>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

	Hi Mike, Stephen,

The following changes since commit 3650b228f83adda7e5ee532e2b90429c03f7b9ec:

  Linux 5.10-rc1 (2020-10-25 15:14:11 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-drivers.git tags/renesas-clk-for-v5.11-tag3

for you to fetch changes up to f5c50b1fed55332beb88e81e9e17c49673b77344:

  dt-bindings: clock: renesas: rcar-usb2-clock-sel: Convert bindings to json-schema (2020-12-10 08:34:01 +0100)

----------------------------------------------------------------
clk: renesas: Updates for v5.11 (take three)

  - Update git repo branch for Renesas clock drivers,
  - Add camera (CSI) and video-in (VIN) clocks on R-Car V3U,
  - Add RPC (QSPI/HyperFLASH) clocks on RZ/G2M, RZ/G2N, and RZ/G2E,
  - Stop using __raw_*() I/O accessors,
  - One more conversion of DT bindings to json-schema,
  - Minor fixes and improvements.

This pull request supersedes my previous two pull requests for v5.11
("[GIT PULL] clk: renesas: Updates for v5.11" and "[GIT PULL] clk:
renesas: Updates for v5.11 (take two)"), to fix the incorrect Fixes tag
in commit c3f207f6d23d ("clk: renesas: r8a779a0: Make
rcar_r8a779a0_cpg_clk_register() static").

Sorry for the troubles, and thanks for pulling!
----------------------------------------------------------------
Biju Das (2):
      clk: renesas: r8a774a1: Add RPC clocks
      clk: renesas: r8a774b1: Add RPC clocks

Geert Uytterhoeven (4):
      clk: renesas: r8a779a0: Make rcar_r8a779a0_cpg_clk_register() static
      MAINTAINERS: Update git repo for Renesas clock drivers
      clk: renesas: r8a779a0: Fix R and OSC clocks
      clk: renesas: sh73a0: Stop using __raw_*() I/O accessors

Jacopo Mondi (2):
      clk: renesas: r8a779a0: Add CSI4[0-3] clocks
      clk: renesas: r8a779a0: Add VIN clocks

Krzysztof Kozlowski (1):
      clk: renesas: cpg-mssr: fix kerneldoc of cpg_mssr_priv

Lad Prabhakar (1):
      clk: renesas: r8a774c0: Add RPC clocks

Wolfram Sang (1):
      clk: renesas: rcar-gen3: Remove stp_ck handling for SDHI

Yejune Deng (1):
      clk: renesas: rcar-usb2-clock-sel: Replace devm_reset_control_array_get()

Yoshihiro Shimoda (1):
      dt-bindings: clock: renesas: rcar-usb2-clock-sel: Convert bindings to json-schema

 .../bindings/clock/renesas,rcar-usb2-clock-sel.txt |  68 --------------
 .../clock/renesas,rcar-usb2-clock-sel.yaml         | 100 +++++++++++++++++++++
 MAINTAINERS                                        |   2 +-
 drivers/clk/renesas/clk-sh73a0.c                   |   2 +-
 drivers/clk/renesas/r8a774a1-cpg-mssr.c            |   8 ++
 drivers/clk/renesas/r8a774b1-cpg-mssr.c            |   8 ++
 drivers/clk/renesas/r8a774c0-cpg-mssr.c            |   9 ++
 drivers/clk/renesas/r8a779a0-cpg-mssr.c            |  51 ++++++++++-
 drivers/clk/renesas/rcar-gen3-cpg.c                |  79 ++++++++++------
 drivers/clk/renesas/rcar-gen3-cpg.h                |   5 ++
 drivers/clk/renesas/rcar-usb2-clock-sel.c          |   2 +-
 drivers/clk/renesas/renesas-cpg-mssr.c             |   3 +-
 12 files changed, 235 insertions(+), 102 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/clock/renesas,rcar-usb2-clock-sel.txt
 create mode 100644 Documentation/devicetree/bindings/clock/renesas,rcar-usb2-clock-sel.yaml
