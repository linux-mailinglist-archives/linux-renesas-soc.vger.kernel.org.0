Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D331F7F666
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  2 Aug 2019 14:04:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388535AbfHBMEO (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 2 Aug 2019 08:04:14 -0400
Received: from laurent.telenet-ops.be ([195.130.137.89]:49038 "EHLO
        laurent.telenet-ops.be" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726667AbfHBMEN (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 2 Aug 2019 08:04:13 -0400
Received: from ramsan ([84.194.98.4])
        by laurent.telenet-ops.be with bizsmtp
        id kC4B2000505gfCL01C4BNB; Fri, 02 Aug 2019 14:04:11 +0200
Received: from rox.of.borg ([192.168.97.57])
        by ramsan with esmtp (Exim 4.90_1)
        (envelope-from <geert@linux-m68k.org>)
        id 1htWI7-0002hR-4B; Fri, 02 Aug 2019 14:04:11 +0200
Received: from geert by rox.of.borg with local (Exim 4.90_1)
        (envelope-from <geert@linux-m68k.org>)
        id 1htWI7-0000PA-1i; Fri, 02 Aug 2019 14:04:11 +0200
From:   Geert Uytterhoeven <geert+renesas@glider.be>
To:     arm-soc <arm@kernel.org>, arm-soc <soc@kernel.org>
Cc:     Simon Horman <horms@verge.net.au>,
        Magnus Damm <magnus.damm@gmail.com>,
        linux-arm-kernel@lists.infradead.org,
        linux-renesas-soc@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PULL 1/3] Renesas ARM64 DT updates for v5.4
Date:   Fri,  2 Aug 2019 14:03:53 +0200
Message-Id: <20190802120355.1430-2-geert+renesas@glider.be>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190802120355.1430-1-geert+renesas@glider.be>
References: <20190802120355.1430-1-geert+renesas@glider.be>
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

The following changes since commit 5f9e832c137075045d15cd6899ab0505cfb2ca4b:

  Linus 5.3-rc1 (2019-07-21 14:05:38 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-devel.git tags/renesas-arm64-dt-for-v5.4-tag1

for you to fetch changes up to 0a05b3d7fee511de8a1c9dffc3d86f1df55e1737:

  arm64: dts: renesas: ulcb: Sort nodes (2019-07-30 11:25:35 +0200)

----------------------------------------------------------------
Renesas ARM64 DT updates for v5.4

  - CAN support for the HiHope RZ/G2E board,
  - BT and WLAN support for the HiHope RZ/G2[MN] boards,
  - Sound support for RZ/G2M,
  - Sort nodes in various SoC and board DTSes,
  - Small fixes and improvements.

----------------------------------------------------------------
Biju Das (3):
      arm64: dts: renesas: hihope-common: Add PCA9654 I/O expander
      arm64: dts: renesas: hihope-common: Add BT support
      arm64: dts: renesas: hihope-common: Add WLAN support

Fabrizio Castro (6):
      arm64: dts: renesas: r8a774c0: Add missing assigned-clocks for CAN[01]
      arm64: dts: renesas: r8a774a1: Add missing assigned-clocks for CAN[01]
      arm64: dts: renesas: r8a774a1: Add CANFD support
      arm64: dts: renesas: hihope-rzg2-ex: Enable CAN interfaces
      arm64: dts: renesas: r8a774a1: Use extended audio dmac registers
      arm64: dts: renesas: r8a774a1: Add SSIU support for sound

Takeshi Kihara (1):
      arm64: dts: renesas: r8a77990: Add cpg reset for DU

Yoshihiro Kaneko (13):
      arm64: dts: renesas: r8a77995: Add cpg reset for DU
      arm64: dts: renesas: r8a77995: Fix register range of display node
      arm64: dts: renesas: r8a7795: Sort nodes
      arm64: dts: renesas: r8a7795-es1: Sort nodes
      arm64: dts: renesas: r8a77965: Sort nodes
      arm64: dts: renesas: r8a7795-es1: salvator-x: Sort nodes
      arm64: dts: renesas: r8a7795: salvator-x: Sort nodes
      arm64: dts: renesas: r8a7795: salvator-xs: Sort nodes
      arm64: dts: renesas: r8a7796: salvator-x: Sort nodes
      arm64: dts: renesas: r8a7796: salvator-xs: Sort nodes
      arm64: dts: renesas: salvator-common: Sort nodes
      arm64: dts: renesas: ulcb-kf: Sort nodes
      arm64: dts: renesas: ulcb: Sort nodes

 arch/arm64/boot/dts/renesas/hihope-common.dtsi     |  78 ++++++
 arch/arm64/boot/dts/renesas/hihope-rzg2-ex.dtsi    |  22 ++
 arch/arm64/boot/dts/renesas/r8a774a1.dtsi          | 282 +++++++++++++++++++--
 arch/arm64/boot/dts/renesas/r8a774c0.dtsi          |   4 +
 .../boot/dts/renesas/r8a7795-es1-salvator-x.dts    |  26 +-
 arch/arm64/boot/dts/renesas/r8a7795-es1.dtsi       | 223 ++++++++--------
 arch/arm64/boot/dts/renesas/r8a7795-salvator-x.dts |  26 +-
 .../arm64/boot/dts/renesas/r8a7795-salvator-xs.dts |  82 +++---
 arch/arm64/boot/dts/renesas/r8a7795.dtsi           | 154 +++++------
 arch/arm64/boot/dts/renesas/r8a7796-salvator-x.dts |  10 +-
 .../arm64/boot/dts/renesas/r8a7796-salvator-xs.dts |  10 +-
 arch/arm64/boot/dts/renesas/r8a77965.dtsi          |  48 ++--
 arch/arm64/boot/dts/renesas/r8a77990.dtsi          |   2 +
 arch/arm64/boot/dts/renesas/r8a77995.dtsi          |   4 +-
 arch/arm64/boot/dts/renesas/salvator-common.dtsi   |  72 +++---
 arch/arm64/boot/dts/renesas/ulcb-kf.dtsi           | 226 ++++++++---------
 arch/arm64/boot/dts/renesas/ulcb.dtsi              |  10 +-
 17 files changed, 814 insertions(+), 465 deletions(-)
