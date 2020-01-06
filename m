Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 500EE1310C5
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  6 Jan 2020 11:49:11 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726313AbgAFKtK (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 6 Jan 2020 05:49:10 -0500
Received: from andre.telenet-ops.be ([195.130.132.53]:33772 "EHLO
        andre.telenet-ops.be" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726155AbgAFKtK (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 6 Jan 2020 05:49:10 -0500
Received: from ramsan ([84.195.182.253])
        by andre.telenet-ops.be with bizsmtp
        id myp52100V5USYZQ01yp5kX; Mon, 06 Jan 2020 11:49:07 +0100
Received: from rox.of.borg ([192.168.97.57])
        by ramsan with esmtp (Exim 4.90_1)
        (envelope-from <geert@linux-m68k.org>)
        id 1ioPwX-0001ym-Ly; Mon, 06 Jan 2020 11:49:05 +0100
Received: from geert by rox.of.borg with local (Exim 4.90_1)
        (envelope-from <geert@linux-m68k.org>)
        id 1ioPwX-0002Bx-L3; Mon, 06 Jan 2020 11:49:05 +0100
From:   Geert Uytterhoeven <geert+renesas@glider.be>
To:     arm-soc <arm@kernel.org>, arm-soc <soc@kernel.org>
Cc:     Magnus Damm <magnus.damm@gmail.com>,
        linux-arm-kernel@lists.infradead.org,
        linux-renesas-soc@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [GIT PULL 3/5] Renesas ARM64 DT updates for v5.6
Date:   Mon,  6 Jan 2020 11:48:55 +0100
Message-Id: <20200106104857.8361-4-geert+renesas@glider.be>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200106104857.8361-1-geert+renesas@glider.be>
References: <20200106104857.8361-1-geert+renesas@glider.be>
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

The following changes since commit e42617b825f8073569da76dc4510bfa019b1c35a:

  Linux 5.5-rc1 (2019-12-08 14:57:55 -0800)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-devel.git tags/renesas-arm64-dt-for-v5.6-tag1

for you to fetch changes up to 7ba33c335a5b9ef6097ae22cfafbd6e93aa8c5da:

  arm64: dts: renesas: Prepare for split of ARCH_R8A7795 into ARCH_R8A7795[01] (2019-12-31 10:28:56 +0100)

----------------------------------------------------------------
Renesas ARM64 DT updates for v5.6

  - Remove now unused ARCH_R8A7796 config symbol,
  - Rename R-Car H3 and M3-W SoC, and ULCB board DTS files to increase
    naming consistency,
  - Miscellaneous fixes for issues detected by "make dtbs_check",
  - Enhance support for R-Car M3-W+,
  - Display support for the EK874 board,
  - Prepare for split of R-Car H3 ES1.x and ES2.0+ config symbols,
  - Minor fixes and improvements.

----------------------------------------------------------------
Fabrizio Castro (1):
      arm64: dts: renesas: Add EK874 board with idk-2121wr display support

Geert Uytterhoeven (16):
      arm64: dts: renesas: Remove use of ARCH_R8A7796
      arm64: dts: renesas: Rename r8a7796* to r8a77960*
      arm64: dts: renesas: Group tuples in regulator-gpio states properties
      arm64: dts: renesas: Group tuples in interrupt properties
      arm64: dts: renesas: Group tuples in pci ranges and dma-ranges properties
      arm64: dts: renesas: r8a77970: Group tuples in thermal reg property
      arm64: dts: renesas: r8a77961: Add RWDT node
      arm64: dts: renesas: r8a77961: Add GPIO nodes
      arm64: dts: renesas: r8a77961: Add RAVB node
      arm64: dts: renesas: r8a77961: Add SYS-DMAC nodes
      arm64: dts: renesas: r8a77961: Add I2C nodes
      arm64: dts: renesas: r8a77961: Add SDHI nodes
      arm64: dts: renesas: Rename r8a7795{-es1,}* to r8a7795[01]*
      arm64: dts: renesas: Drop redundant SoC prefixes from ULCB DTS file names
      arm64: dts: renesas: Sort DTBs in Makefile
      arm64: dts: renesas: Prepare for split of ARCH_R8A7795 into ARCH_R8A7795[01]

Kuninori Morimoto (1):
      arm64: dts: renesas: r8a77990: ebisu: Remove clkout-lr-synchronous from sound

 arch/arm64/boot/dts/renesas/Makefile               |  27 +-
 arch/arm64/boot/dts/renesas/hihope-common.dtsi     |   3 +-
 arch/arm64/boot/dts/renesas/r8a774a1.dtsi          | 206 +++++------
 arch/arm64/boot/dts/renesas/r8a774b1.dtsi          | 206 +++++------
 arch/arm64/boot/dts/renesas/r8a774c0-cat874.dts    |   3 +-
 .../boot/dts/renesas/r8a774c0-ek874-idk-2121wr.dts | 116 ++++++
 arch/arm64/boot/dts/renesas/r8a774c0.dtsi          | 164 ++++-----
 ...-es1-salvator-x.dts => r8a77950-salvator-x.dts} |   4 +-
 ...{r8a7795-h3ulcb-kf.dts => r8a77950-ulcb-kf.dts} |   4 +-
 .../{r8a7795-es1-h3ulcb.dts => r8a77950-ulcb.dts}  |   4 +-
 .../renesas/{r8a7795-es1.dtsi => r8a77950.dtsi}    |   4 +-
 ...7795-salvator-x.dts => r8a77951-salvator-x.dts} |   4 +-
 ...95-salvator-xs.dts => r8a77951-salvator-xs.dts} |   8 +-
 ...7795-es1-h3ulcb-kf.dts => r8a77951-ulcb-kf.dts} |   4 +-
 .../{r8a7795-h3ulcb.dts => r8a77951-ulcb.dts}      |   4 +-
 .../dts/renesas/{r8a7795.dtsi => r8a77951.dtsi}    | 216 ++++++------
 ...7796-salvator-x.dts => r8a77960-salvator-x.dts} |   4 +-
 ...96-salvator-xs.dts => r8a77960-salvator-xs.dts} |   4 +-
 ...{r8a7796-m3ulcb-kf.dts => r8a77960-ulcb-kf.dts} |   4 +-
 .../{r8a7796-m3ulcb.dts => r8a77960-ulcb.dts}      |   4 +-
 .../dts/renesas/{r8a7796.dtsi => r8a77960.dtsi}    | 206 +++++------
 arch/arm64/boot/dts/renesas/r8a77961.dtsi          | 390 ++++++++++++++++++++-
 ...8a77965-m3nulcb-kf.dts => r8a77965-ulcb-kf.dts} |   2 +-
 .../{r8a77965-m3nulcb.dts => r8a77965-ulcb.dts}    |   0
 arch/arm64/boot/dts/renesas/r8a77965.dtsi          | 206 +++++------
 arch/arm64/boot/dts/renesas/r8a77970.dtsi          |  52 +--
 arch/arm64/boot/dts/renesas/r8a77980.dtsi          |  96 +++--
 arch/arm64/boot/dts/renesas/r8a77990-ebisu.dts     |   7 +-
 arch/arm64/boot/dts/renesas/r8a77990.dtsi          | 164 ++++-----
 arch/arm64/boot/dts/renesas/r8a77995.dtsi          |  74 ++--
 arch/arm64/boot/dts/renesas/salvator-common.dtsi   |   6 +-
 arch/arm64/boot/dts/renesas/ulcb.dtsi              |   3 +-
 32 files changed, 1333 insertions(+), 866 deletions(-)
 create mode 100644 arch/arm64/boot/dts/renesas/r8a774c0-ek874-idk-2121wr.dts
 rename arch/arm64/boot/dts/renesas/{r8a7795-es1-salvator-x.dts => r8a77950-salvator-x.dts} (96%)
 rename arch/arm64/boot/dts/renesas/{r8a7795-h3ulcb-kf.dts => r8a77950-ulcb-kf.dts} (75%)
 rename arch/arm64/boot/dts/renesas/{r8a7795-es1-h3ulcb.dts => r8a77950-ulcb.dts} (89%)
 rename arch/arm64/boot/dts/renesas/{r8a7795-es1.dtsi => r8a77950.dtsi} (98%)
 rename arch/arm64/boot/dts/renesas/{r8a7795-salvator-x.dts => r8a77951-salvator-x.dts} (96%)
 rename arch/arm64/boot/dts/renesas/{r8a7795-salvator-xs.dts => r8a77951-salvator-xs.dts} (96%)
 rename arch/arm64/boot/dts/renesas/{r8a7795-es1-h3ulcb-kf.dts => r8a77951-ulcb-kf.dts} (75%)
 rename arch/arm64/boot/dts/renesas/{r8a7795-h3ulcb.dts => r8a77951-ulcb.dts} (92%)
 rename arch/arm64/boot/dts/renesas/{r8a7795.dtsi => r8a77951.dtsi} (94%)
 rename arch/arm64/boot/dts/renesas/{r8a7796-salvator-x.dts => r8a77960-salvator-x.dts} (94%)
 rename arch/arm64/boot/dts/renesas/{r8a7796-salvator-xs.dts => r8a77960-salvator-xs.dts} (94%)
 rename arch/arm64/boot/dts/renesas/{r8a7796-m3ulcb-kf.dts => r8a77960-ulcb-kf.dts} (77%)
 rename arch/arm64/boot/dts/renesas/{r8a7796-m3ulcb.dts => r8a77960-ulcb.dts} (90%)
 rename arch/arm64/boot/dts/renesas/{r8a7796.dtsi => r8a77960.dtsi} (94%)
 rename arch/arm64/boot/dts/renesas/{r8a77965-m3nulcb-kf.dts => r8a77965-ulcb-kf.dts} (92%)
 rename arch/arm64/boot/dts/renesas/{r8a77965-m3nulcb.dts => r8a77965-ulcb.dts} (100%)
