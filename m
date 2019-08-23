Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E365E9AFAB
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 23 Aug 2019 14:36:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732384AbfHWMg5 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 23 Aug 2019 08:36:57 -0400
Received: from michel.telenet-ops.be ([195.130.137.88]:57764 "EHLO
        michel.telenet-ops.be" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2387932AbfHWMg5 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 23 Aug 2019 08:36:57 -0400
Received: from ramsan ([84.194.98.4])
        by michel.telenet-ops.be with bizsmtp
        id sccr2000T05gfCL06ccrx2; Fri, 23 Aug 2019 14:36:54 +0200
Received: from rox.of.borg ([192.168.97.57])
        by ramsan with esmtp (Exim 4.90_1)
        (envelope-from <geert@linux-m68k.org>)
        id 1i18oF-0006YS-EV; Fri, 23 Aug 2019 14:36:51 +0200
Received: from geert by rox.of.borg with local (Exim 4.90_1)
        (envelope-from <geert@linux-m68k.org>)
        id 1i18oF-0004uO-DQ; Fri, 23 Aug 2019 14:36:51 +0200
From:   Geert Uytterhoeven <geert+renesas@glider.be>
To:     arm-soc <arm@kernel.org>, arm-soc <soc@kernel.org>
Cc:     Simon Horman <horms@verge.net.au>,
        Magnus Damm <magnus.damm@gmail.com>,
        linux-arm-kernel@lists.infradead.org,
        linux-renesas-soc@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PULL 3/5] Renesas ARM64 DT updates for v5.4 (take two)
Date:   Fri, 23 Aug 2019 14:36:41 +0200
Message-Id: <20190823123643.18799-4-geert+renesas@glider.be>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190823123643.18799-1-geert+renesas@glider.be>
References: <20190823123643.18799-1-geert+renesas@glider.be>
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

The following changes since commit 0a05b3d7fee511de8a1c9dffc3d86f1df55e1737:

  arm64: dts: renesas: ulcb: Sort nodes (2019-07-30 11:25:35 +0200)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-devel.git tags/renesas-arm64-dt-for-v5.4-tag2

for you to fetch changes up to 38290431d56d7d3928ac89e9f8d3d6b3c8df4c6e:

  arm64: dts: renesas: Update 'vsps' properties for readability (2019-08-21 14:18:56 +0200)

----------------------------------------------------------------
Renesas ARM64 DT updates for v5.4 (take two)

  - Sort nodes in various SoC and board DTSes,
  - HDMI sound for HiHope RZ/G2M and R-Car M3-N Salvator-X(S) boards,
  - Limit EtherAVB to 100Mbps on the Ebisu and Draak boards,
  - Small fixes and improvements.

----------------------------------------------------------------
Fabrizio Castro (3):
      arm64: dts: renesas: r8a774c0: Point LVDS0 to its companion LVDS1
      arm64: dts: renesas: r8a774c0: cat874: Add definition for 12V regulator
      arm64: dts: renesas: hihope-common: Add HDMI audio support

Geert Uytterhoeven (2):
      arm64: dts: renesas: r8a77980: Fix IPMMU-VC0 base address
      arm64: dts: renesas: r8a774c0: Fix register range of display node

Jacopo Mondi (1):
      arm64: dts: renesas: Update 'vsps' properties for readability

Kuninori Morimoto (1):
      arm64: dts: renesas: r8a77965-salvator-x(s): Enable HDMI sound

Simon Horman (1):
      arm64: dts: renesas: ebisu, draak: Limit EtherAVB to 100Mbps

Yoshihiro Kaneko (13):
      arm64: dts: renesas: r8a77970: eagle: Sort nodes
      arm64: dts: renesas: r8a77970: v3msk: Sort nodes
      arm64: dts: renesas: r8a77980: condor: Sort nodes
      arm64: dts: renesas: r8a77980: v3hsk: Sort nodes
      arm64: dts: renesas: r8a77990: ebisu: Sort nodes
      arm64: dts: renesas: r8a77990: Sort nodes
      arm64: dts: renesas: r8a77995: draak: Sort nodes
      arm64: dts: renesas: r8a77995: Sort nodes
      arm64: dts: renesas: r8a774a1: Sort nodes
      arm64: dts: renesas: r8a774c0: cat874: Sort nodes
      arm64: dts: renesas: r8a774c0: Sort nodes
      arm64: dts: renesas: r8a7796: Sort nodes
      arm64: dts: renesas: r8a77970: Sort nodes

 arch/arm64/boot/dts/renesas/hihope-common.dtsi     |  47 +++++
 arch/arm64/boot/dts/renesas/r8a774a1.dtsi          | 174 ++++++++---------
 arch/arm64/boot/dts/renesas/r8a774c0-cat874.dts    |  37 ++--
 arch/arm64/boot/dts/renesas/r8a774c0.dtsi          |  96 ++++-----
 arch/arm64/boot/dts/renesas/r8a7795.dtsi           |   2 +-
 arch/arm64/boot/dts/renesas/r8a7796.dtsi           | 152 +++++++--------
 .../arm64/boot/dts/renesas/r8a77965-salvator-x.dts |  28 +++
 .../boot/dts/renesas/r8a77965-salvator-xs.dts      |  28 +++
 arch/arm64/boot/dts/renesas/r8a77965.dtsi          |   2 +-
 arch/arm64/boot/dts/renesas/r8a77970-eagle.dts     |  58 +++---
 arch/arm64/boot/dts/renesas/r8a77970-v3msk.dts     | 116 +++++------
 arch/arm64/boot/dts/renesas/r8a77970.dtsi          |   6 +-
 arch/arm64/boot/dts/renesas/r8a77980-condor.dts    |  42 ++--
 arch/arm64/boot/dts/renesas/r8a77980-v3hsk.dts     |  12 +-
 arch/arm64/boot/dts/renesas/r8a77980.dtsi          |   4 +-
 arch/arm64/boot/dts/renesas/r8a77990-ebisu.dts     | 216 +++++++++++----------
 arch/arm64/boot/dts/renesas/r8a77990.dtsi          |  46 ++---
 arch/arm64/boot/dts/renesas/r8a77995-draak.dts     |  18 +-
 arch/arm64/boot/dts/renesas/r8a77995.dtsi          |  78 ++++----
 19 files changed, 646 insertions(+), 516 deletions(-)
