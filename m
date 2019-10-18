Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B45DDDC37E
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 18 Oct 2019 13:02:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2633627AbfJRLBK (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 18 Oct 2019 07:01:10 -0400
Received: from laurent.telenet-ops.be ([195.130.137.89]:47700 "EHLO
        laurent.telenet-ops.be" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2633623AbfJRLBH (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 18 Oct 2019 07:01:07 -0400
Received: from ramsan ([84.194.98.4])
        by laurent.telenet-ops.be with bizsmtp
        id Ez142100b05gfCL01z148F; Fri, 18 Oct 2019 13:01:05 +0200
Received: from rox.of.borg ([192.168.97.57])
        by ramsan with esmtp (Exim 4.90_1)
        (envelope-from <geert@linux-m68k.org>)
        id 1iLQ0G-0005q3-FE; Fri, 18 Oct 2019 13:01:04 +0200
Received: from geert by rox.of.borg with local (Exim 4.90_1)
        (envelope-from <geert@linux-m68k.org>)
        id 1iLPEt-0006s5-Tw; Fri, 18 Oct 2019 12:12:07 +0200
From:   Geert Uytterhoeven <geert+renesas@glider.be>
To:     arm-soc <arm@kernel.org>, arm-soc <soc@kernel.org>
Cc:     Magnus Damm <magnus.damm@gmail.com>,
        linux-arm-kernel@lists.infradead.org,
        linux-renesas-soc@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PULL 4/5] Renesas driver updates for v5.5
Date:   Fri, 18 Oct 2019 12:11:35 +0200
Message-Id: <20191018101136.26350-5-geert+renesas@glider.be>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20191018101136.26350-1-geert+renesas@glider.be>
References: <20191018101136.26350-1-geert+renesas@glider.be>
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

The following changes since commit 54ecb8f7028c5eb3d740bb82b0f1d90f2df63c5c:

  Linux 5.4-rc1 (2019-09-30 10:35:40 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-devel.git tags/renesas-drivers-for-v5.5-tag1

for you to fetch changes up to 6655c568ced0789479f00b9399603c5d6ee48640:

  soc: renesas: rcar-sysc: Add r8a774b1 support (2019-10-01 10:29:40 +0200)

----------------------------------------------------------------
Renesas driver updates for v5.5

  - Add support for the new RZ/G2N (r8a774b1) SoC,
  - Fix System Controller power request conflicts on recent R-Car Gen3
    and RZ/G2N SoC variants and revisions,
  - Minor cleanups.

----------------------------------------------------------------
Biju Das (6):
      dt-bindings: power: Add r8a774b1 SYSC power domain definitions
      dt-bindings: clk: Add r8a774b1 CPG Core Clock Definitions
      soc: renesas: Add Renesas R8A774B1 config option
      soc: renesas: Identify RZ/G2N
      soc: renesas: rcar-rst: Add support for RZ/G2N
      soc: renesas: rcar-sysc: Add r8a774b1 support

Geert Uytterhoeven (9):
      soc: renesas: rcar-sysc: Prepare for fixing power request conflicts
      soc: renesas: r8a7795-sysc: Fix power request conflicts
      soc: renesas: r8a7796-sysc: Fix power request conflicts
      soc: renesas: r8a77965-sysc: Fix power request conflicts
      soc: renesas: r8a77970-sysc: Fix power request conflicts
      soc: renesas: r8a77980-sysc: Fix power request conflicts
      soc: renesas: r8a77990-sysc: Fix power request conflicts
      soc: renesas: r8a774c0-sysc: Fix power request conflicts
      soc: renesas: rcar-sysc: Remove unneeded inclusion of <linux/bug.h>

 drivers/soc/renesas/Kconfig                   | 11 ++++++
 drivers/soc/renesas/Makefile                  |  1 +
 drivers/soc/renesas/r8a7743-sysc.c            |  1 -
 drivers/soc/renesas/r8a7745-sysc.c            |  1 -
 drivers/soc/renesas/r8a77470-sysc.c           |  1 -
 drivers/soc/renesas/r8a774a1-sysc.c           |  1 -
 drivers/soc/renesas/r8a774b1-sysc.c           | 37 +++++++++++++++++
 drivers/soc/renesas/r8a774c0-sysc.c           |  4 +-
 drivers/soc/renesas/r8a7779-sysc.c            |  1 -
 drivers/soc/renesas/r8a7790-sysc.c            |  1 -
 drivers/soc/renesas/r8a7791-sysc.c            |  1 -
 drivers/soc/renesas/r8a7792-sysc.c            |  1 -
 drivers/soc/renesas/r8a7794-sysc.c            |  1 -
 drivers/soc/renesas/r8a7795-sysc.c            | 33 +++++++++++++---
 drivers/soc/renesas/r8a7796-sysc.c            | 23 ++++++++++-
 drivers/soc/renesas/r8a77965-sysc.c           |  4 +-
 drivers/soc/renesas/r8a77970-sysc.c           |  4 +-
 drivers/soc/renesas/r8a77980-sysc.c           |  4 +-
 drivers/soc/renesas/r8a77990-sysc.c           |  4 +-
 drivers/soc/renesas/r8a77995-sysc.c           |  1 -
 drivers/soc/renesas/rcar-rst.c                |  1 +
 drivers/soc/renesas/rcar-sysc.c               | 19 +++++++++
 drivers/soc/renesas/rcar-sysc.h               |  8 +++-
 drivers/soc/renesas/renesas-soc.c             |  8 ++++
 include/dt-bindings/clock/r8a774b1-cpg-mssr.h | 57 +++++++++++++++++++++++++++
 include/dt-bindings/power/r8a774b1-sysc.h     | 26 ++++++++++++
 26 files changed, 229 insertions(+), 25 deletions(-)
 create mode 100644 drivers/soc/renesas/r8a774b1-sysc.c
 create mode 100644 include/dt-bindings/clock/r8a774b1-cpg-mssr.h
 create mode 100644 include/dt-bindings/power/r8a774b1-sysc.h
