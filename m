Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B859B66AB82
	for <lists+linux-renesas-soc@lfdr.de>; Sat, 14 Jan 2023 14:23:19 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229519AbjANNXR (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Sat, 14 Jan 2023 08:23:17 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43214 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229546AbjANNXQ (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Sat, 14 Jan 2023 08:23:16 -0500
Received: from andre.telenet-ops.be (andre.telenet-ops.be [IPv6:2a02:1800:120:4::f00:15])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 10ADB59ED
        for <linux-renesas-soc@vger.kernel.org>; Sat, 14 Jan 2023 05:23:13 -0800 (PST)
Received: from ramsan.of.borg ([84.195.186.194])
        by andre.telenet-ops.be with bizsmtp
        id 8dP92900V4C55Sk01dP9ej; Sat, 14 Jan 2023 14:23:11 +0100
Received: from rox.of.borg ([192.168.97.57])
        by ramsan.of.borg with esmtp (Exim 4.95)
        (envelope-from <geert@linux-m68k.org>)
        id 1pGgV0-003z7H-0e;
        Sat, 14 Jan 2023 14:23:09 +0100
Received: from geert by rox.of.borg with local (Exim 4.95)
        (envelope-from <geert@linux-m68k.org>)
        id 1pGgV3-006HuS-OG;
        Sat, 14 Jan 2023 14:23:09 +0100
From:   Geert Uytterhoeven <geert+renesas@glider.be>
To:     arm-soc <arm@kernel.org>, soc <soc@kernel.org>
Cc:     Magnus Damm <magnus.damm@gmail.com>,
        linux-arm-kernel@lists.infradead.org,
        linux-renesas-soc@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [GIT PULL 3/3] Renesas DT updates for v6.3
Date:   Sat, 14 Jan 2023 14:22:59 +0100
Message-Id: <cover.1673702293.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1673702287.git.geert+renesas@glider.be>
References: <cover.1673702287.git.geert+renesas@glider.be>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.3 required=5.0 tests=BAYES_00,
        HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_LOW,SPF_HELO_NONE,SPF_NONE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

The following changes since commit 1b929c02afd37871d5afb9d498426f83432e71c2:

  Linux 6.2-rc1 (2022-12-25 13:41:39 -0800)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-devel.git tags/renesas-dts-for-v6.3-tag1

for you to fetch changes up to 2ef9e3ef3b8d9a59455a79f02ce9aff8544bd02d:

  arm64: dts: renesas: condor-i: add HS400 support for eMMC (2023-01-12 17:22:22 +0100)

----------------------------------------------------------------
Renesas DT updates for v6.3

  - Enable watchdog and timer (OSTM) support for the RZ/Five SMARC EVK
    development board,
  - Add operating points for the Cortex-A55 CPU cores on the R-Car S4-8
    SoC,
  - Add display support for the R-Car V4H SoC and the White-Hawk
    development board,
  - Add eMMC and SDHI support for the RZ/V2M SoC,
  - Miscellaneous fixes and improvements.

----------------------------------------------------------------
Adam Ford (1):
      arm64: boot: dts: r8a774[a/b/e]1-beacon: Consolidate sound clocks

Fabrizio Castro (1):
      arm64: dts: renesas: r9a09g011: Add eMMC and SDHI support

Geert Uytterhoeven (2):
      arm64: dts: renesas: r8a779f0: Add CA55 operating points
      arm64: dts: renesas: ulcb-kf: Fix pca9548 i2c-mux node names

Lad Prabhakar (2):
      riscv: dts: renesas: rzfive-smarc-som: Enable WDT
      riscv: dts: renesas: rzfive-smarc-som: Enable OSTM nodes

Tomi Valkeinen (2):
      arm64: dts: renesas: r8a779g0: Add display related nodes
      arm64: dts: renesas: white-hawk-cpu: Add DP output support

Wolfram Sang (1):
      arm64: dts: renesas: condor-i: add HS400 support for eMMC

 .../boot/dts/renesas/beacon-renesom-baseboard.dtsi |  19 +++
 .../boot/dts/renesas/r8a774a1-beacon-rzg2m-kit.dts |  21 ----
 .../boot/dts/renesas/r8a774b1-beacon-rzg2n-kit.dts |  21 ----
 .../boot/dts/renesas/r8a774e1-beacon-rzg2h-kit.dts |  21 ----
 arch/arm64/boot/dts/renesas/r8a77980a-condor-i.dts |   4 +
 arch/arm64/boot/dts/renesas/r8a779f0.dtsi          |  62 ++++++++++
 .../boot/dts/renesas/r8a779g0-white-hawk-cpu.dtsi  |  94 +++++++++++++++
 arch/arm64/boot/dts/renesas/r8a779g0.dtsi          | 130 +++++++++++++++++++++
 arch/arm64/boot/dts/renesas/r9a09g011.dtsi         |  48 ++++++++
 arch/arm64/boot/dts/renesas/ulcb-kf.dtsi           |   4 +-
 arch/riscv/boot/dts/renesas/rzfive-smarc-som.dtsi  |  12 --
 11 files changed, 359 insertions(+), 77 deletions(-)
