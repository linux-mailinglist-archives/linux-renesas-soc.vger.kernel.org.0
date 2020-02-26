Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C1C3816FCD7
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 26 Feb 2020 12:02:33 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728056AbgBZLCb (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 26 Feb 2020 06:02:31 -0500
Received: from michel.telenet-ops.be ([195.130.137.88]:60884 "EHLO
        michel.telenet-ops.be" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728047AbgBZLCb (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 26 Feb 2020 06:02:31 -0500
Received: from ramsan ([84.195.182.253])
        by michel.telenet-ops.be with bizsmtp
        id 7P2V2200Q5USYZQ06P2V8s; Wed, 26 Feb 2020 12:02:29 +0100
Received: from rox.of.borg ([192.168.97.57])
        by ramsan with esmtp (Exim 4.90_1)
        (envelope-from <geert@linux-m68k.org>)
        id 1j6uST-0002Ty-7l; Wed, 26 Feb 2020 12:02:29 +0100
Received: from geert by rox.of.borg with local (Exim 4.90_1)
        (envelope-from <geert@linux-m68k.org>)
        id 1j6uST-000520-6d; Wed, 26 Feb 2020 12:02:29 +0100
From:   Geert Uytterhoeven <geert+renesas@glider.be>
To:     arm-soc <arm@kernel.org>, arm-soc <soc@kernel.org>
Cc:     Magnus Damm <magnus.damm@gmail.com>,
        linux-arm-kernel@lists.infradead.org,
        linux-renesas-soc@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [GIT PULL 1/5] Renesas ARM DT updates for v5.7
Date:   Wed, 26 Feb 2020 12:02:17 +0100
Message-Id: <20200226110221.19288-2-geert+renesas@glider.be>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200226110221.19288-1-geert+renesas@glider.be>
References: <20200226110221.19288-1-geert+renesas@glider.be>
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

The following changes since commit bb6d3fb354c5ee8d6bde2d576eb7220ea09862b9:

  Linux 5.6-rc1 (2020-02-09 16:08:48 -0800)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-devel.git tags/renesas-arm-dt-for-v5.7-tag1

for you to fetch changes up to 9e1232631d4e8e30096fa758a0e1fb9e08f219f9:

  ARM: dts: rzg1: Add reset control properties for display (2020-02-24 14:03:33 +0100)

----------------------------------------------------------------
Renesas ARM DT updates for v5.7

  - Miscellaneous fixes and improvements.

----------------------------------------------------------------
Chris Brandt (1):
      ARM: dts: r7s72100: Add SPIBSC clocks

Geert Uytterhoeven (4):
      ARM: dts: renesas: Group tuples in operating-points properties
      ARM: dts: r8a7745: Convert to new DU DT bindings
      ARM: dts: rcar-gen2: Add reset control properties for display
      ARM: dts: rzg1: Add reset control properties for display

Marek Vasut (1):
      ARM: dts: renesas: Add missing ethernet PHY reset GPIO on Gen2 reference boards

 arch/arm/boot/dts/r7s72100-gr-peach.dts | 3 +++
 arch/arm/boot/dts/r7s72100.dtsi         | 5 +++--
 arch/arm/boot/dts/r8a73a4-ape6evm.dts   | 7 ++-----
 arch/arm/boot/dts/r8a7743.dtsi          | 5 +++--
 arch/arm/boot/dts/r8a7744.dtsi          | 5 +++--
 arch/arm/boot/dts/r8a7745.dtsi          | 3 ++-
 arch/arm/boot/dts/r8a77470.dtsi         | 5 +++--
 arch/arm/boot/dts/r8a7790-lager.dts     | 1 +
 arch/arm/boot/dts/r8a7790-stout.dts     | 1 +
 arch/arm/boot/dts/r8a7790.dtsi          | 2 ++
 arch/arm/boot/dts/r8a7791-koelsch.dts   | 1 +
 arch/arm/boot/dts/r8a7791-porter.dts    | 1 +
 arch/arm/boot/dts/r8a7791.dtsi          | 5 +++--
 arch/arm/boot/dts/r8a7792.dtsi          | 5 +++--
 arch/arm/boot/dts/r8a7793-gose.dts      | 1 +
 arch/arm/boot/dts/r8a7793.dtsi          | 5 +++--
 arch/arm/boot/dts/r8a7794-alt.dts       | 1 +
 arch/arm/boot/dts/r8a7794-silk.dts      | 1 +
 arch/arm/boot/dts/r8a7794.dtsi          | 2 ++
 arch/arm/boot/dts/sh73a0-kzm9g.dts      | 9 +++------
 20 files changed, 42 insertions(+), 26 deletions(-)
