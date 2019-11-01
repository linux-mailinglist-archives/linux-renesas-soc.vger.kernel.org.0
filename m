Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 410F2EC63B
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  1 Nov 2019 16:58:58 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726841AbfKAP65 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 1 Nov 2019 11:58:57 -0400
Received: from xavier.telenet-ops.be ([195.130.132.52]:45778 "EHLO
        xavier.telenet-ops.be" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726824AbfKAP65 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 1 Nov 2019 11:58:57 -0400
Received: from ramsan ([84.195.182.253])
        by xavier.telenet-ops.be with bizsmtp
        id Lfyu210105USYZQ01fyuaM; Fri, 01 Nov 2019 16:58:56 +0100
Received: from rox.of.borg ([192.168.97.57])
        by ramsan with esmtp (Exim 4.90_1)
        (envelope-from <geert@linux-m68k.org>)
        id 1iQZKA-0002rc-A0; Fri, 01 Nov 2019 16:58:54 +0100
Received: from geert by rox.of.borg with local (Exim 4.90_1)
        (envelope-from <geert@linux-m68k.org>)
        id 1iQZKA-0008Cc-9C; Fri, 01 Nov 2019 16:58:54 +0100
From:   Geert Uytterhoeven <geert+renesas@glider.be>
To:     arm-soc <arm@kernel.org>, arm-soc <soc@kernel.org>
Cc:     Magnus Damm <magnus.damm@gmail.com>,
        linux-arm-kernel@lists.infradead.org,
        linux-renesas-soc@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [GIT PULL 4/6] Renesas ARM64 DT updates for v5.5 (take two)
Date:   Fri,  1 Nov 2019 16:58:40 +0100
Message-Id: <20191101155842.31467-5-geert+renesas@glider.be>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20191101155842.31467-1-geert+renesas@glider.be>
References: <20191101155842.31467-1-geert+renesas@glider.be>
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

The following changes since commit 3fa08cbb0662acc6cbd1a481956570a52dba8875:

  arm64: dts: renesas: r8a774b1: Add CAN and CAN FD support (2019-10-14 12:04:59 +0200)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-devel.git tags/renesas-arm64-dt-for-v5.5-tag2

for you to fetch changes up to 92980759c1699a3c10beb00f411270197ac89544:

  arm64: dts: renesas: Add support for Salvator-XS with R-Car M3-W+ (2019-11-01 14:03:41 +0100)

----------------------------------------------------------------
Renesas ARM64 DT updates for v5.5 (take two)

  - Video-Input and Serial-ATA support on RZ/G2N,
  - Color Management Module support on various R-Car Gen3 SoCs,
  - Initial support for the R-Car M3-W+ (r8a77961) SoC on the
    Salvator-XS board.

----------------------------------------------------------------
Biju Das (1):
      arm64: dts: renesas: r8a774b1: Add VIN and CSI-2 support

Fabrizio Castro (1):
      arm64: dts: renesas: r8a774b1: Add SATA controller node

Geert Uytterhoeven (6):
      dt-bindings: power: Add r8a77961 SYSC power domain definitions
      dt-bindings: clock: Add r8a77961 CPG Core Clock Definitions
      Merge tag 'renesas-r8a77961-dt-binding-defs-tag' into renesas-arm64-dt-for-v5.5
      arm64: dts: renesas: Prepare for rename of ARCH_R8A7796 to ARCH_R8A77960
      arm64: dts: renesas: Add Renesas R8A77961 SoC support
      arm64: dts: renesas: Add support for Salvator-XS with R-Car M3-W+

Jacopo Mondi (1):
      arm64: dts: renesas: rcar-gen3: Add CMM units

 arch/arm64/boot/dts/renesas/Makefile               |   4 +
 arch/arm64/boot/dts/renesas/r8a774b1.dtsi          | 377 +++++++++++
 arch/arm64/boot/dts/renesas/r8a7795.dtsi           |  39 ++
 arch/arm64/boot/dts/renesas/r8a7796.dtsi           |  31 +-
 .../boot/dts/renesas/r8a77961-salvator-xs.dts      |  31 +
 arch/arm64/boot/dts/renesas/r8a77961.dtsi          | 723 +++++++++++++++++++++
 arch/arm64/boot/dts/renesas/r8a77965.dtsi          |  31 +-
 arch/arm64/boot/dts/renesas/r8a77990.dtsi          |  21 +
 arch/arm64/boot/dts/renesas/r8a77995.dtsi          |  21 +
 include/dt-bindings/clock/r8a77961-cpg-mssr.h      |  65 ++
 include/dt-bindings/power/r8a77961-sysc.h          |  32 +
 11 files changed, 1373 insertions(+), 2 deletions(-)
 create mode 100644 arch/arm64/boot/dts/renesas/r8a77961-salvator-xs.dts
 create mode 100644 arch/arm64/boot/dts/renesas/r8a77961.dtsi
 create mode 100644 include/dt-bindings/clock/r8a77961-cpg-mssr.h
 create mode 100644 include/dt-bindings/power/r8a77961-sysc.h
