Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B822326FD7D
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 18 Sep 2020 14:48:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726707AbgIRMs0 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 18 Sep 2020 08:48:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40200 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726239AbgIRMsE (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 18 Sep 2020 08:48:04 -0400
Received: from michel.telenet-ops.be (michel.telenet-ops.be [IPv6:2a02:1800:110:4::f00:18])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CAA98C061756
        for <linux-renesas-soc@vger.kernel.org>; Fri, 18 Sep 2020 05:48:04 -0700 (PDT)
Received: from ramsan ([84.195.186.194])
        by michel.telenet-ops.be with bizsmtp
        id VQo22300N4C55Sk06Qo2Xi; Fri, 18 Sep 2020 14:48:02 +0200
Received: from rox.of.borg ([192.168.97.57])
        by ramsan with esmtp (Exim 4.90_1)
        (envelope-from <geert@linux-m68k.org>)
        id 1kJFo2-00025E-Fk; Fri, 18 Sep 2020 14:48:02 +0200
Received: from geert by rox.of.borg with local (Exim 4.90_1)
        (envelope-from <geert@linux-m68k.org>)
        id 1kJFo2-00043w-EZ; Fri, 18 Sep 2020 14:48:02 +0200
From:   Geert Uytterhoeven <geert+renesas@glider.be>
To:     arm-soc <arm@kernel.org>, arm-soc <soc@kernel.org>
Cc:     Magnus Damm <magnus.damm@gmail.com>,
        linux-arm-kernel@lists.infradead.org,
        linux-renesas-soc@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [GIT PULL 3/4] Renesas driver updates for v5.10 (take two)
Date:   Fri, 18 Sep 2020 14:47:59 +0200
Message-Id: <20200918124800.15555-4-geert+renesas@glider.be>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200918124800.15555-1-geert+renesas@glider.be>
References: <20200918124800.15555-1-geert+renesas@glider.be>
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

The following changes since commit 464d9b349be634bd12978f2554b2b0198e56399d:

  soc: renesas: Align driver description titles (2020-09-01 10:22:16 +0200)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-devel.git tags/renesas-drivers-for-v5.10-tag2

for you to fetch changes up to 1b4298f000064cc20540a565d249914c60597550:

  soc: renesas: r8a779a0-sysc: Add r8a779a0 support (2020-09-16 08:57:31 +0200)

----------------------------------------------------------------
Renesas driver updates for v5.10 (take two)

  - Add core support for the R-Car V3U (R8A779A0) SoC, including System
    Controller (SYSC) and Reset (RST) support,
  - Various Kconfig cleanups.

----------------------------------------------------------------
Geert Uytterhoeven (1):
      Merge tag 'renesas-r8a779a0-dt-binding-defs-tag' into renesas-drivers-for-v5.10

Kuninori Morimoto (2):
      soc: renesas: Use ARM32/ARM64 for menu description
      soc: renesas: Sort driver description title

Yoshihiro Shimoda (5):
      dt-bindings: power: Add r8a779a0 SYSC power domain definitions
      dt-bindings: clock: Add r8a779a0 CPG Core Clock Definitions
      soc: renesas: Identify R-Car V3U
      soc: renesas: rcar-rst: Add support for R-Car V3U
      soc: renesas: r8a779a0-sysc: Add r8a779a0 support

 drivers/soc/renesas/Kconfig                   | 346 ++++++++++----------
 drivers/soc/renesas/Makefile                  |   1 +
 drivers/soc/renesas/r8a779a0-sysc.c           | 448 ++++++++++++++++++++++++++
 drivers/soc/renesas/rcar-rst.c                |   6 +
 drivers/soc/renesas/renesas-soc.c             |   8 +
 include/dt-bindings/clock/r8a779a0-cpg-mssr.h |  55 ++++
 include/dt-bindings/power/r8a779a0-sysc.h     |  59 ++++
 7 files changed, 754 insertions(+), 169 deletions(-)
 create mode 100644 drivers/soc/renesas/r8a779a0-sysc.c
 create mode 100644 include/dt-bindings/clock/r8a779a0-cpg-mssr.h
 create mode 100644 include/dt-bindings/power/r8a779a0-sysc.h
