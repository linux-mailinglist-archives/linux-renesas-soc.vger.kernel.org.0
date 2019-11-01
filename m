Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 814F5EC637
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  1 Nov 2019 16:58:56 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726823AbfKAP64 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 1 Nov 2019 11:58:56 -0400
Received: from laurent.telenet-ops.be ([195.130.137.89]:58000 "EHLO
        laurent.telenet-ops.be" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726757AbfKAP64 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 1 Nov 2019 11:58:56 -0400
Received: from ramsan ([84.195.182.253])
        by laurent.telenet-ops.be with bizsmtp
        id Lfyu210075USYZQ01fyusB; Fri, 01 Nov 2019 16:58:54 +0100
Received: from rox.of.borg ([192.168.97.57])
        by ramsan with esmtp (Exim 4.90_1)
        (envelope-from <geert@linux-m68k.org>)
        id 1iQZKA-0002rg-Aq; Fri, 01 Nov 2019 16:58:54 +0100
Received: from geert by rox.of.borg with local (Exim 4.90_1)
        (envelope-from <geert@linux-m68k.org>)
        id 1iQZKA-0008Cf-9t; Fri, 01 Nov 2019 16:58:54 +0100
From:   Geert Uytterhoeven <geert+renesas@glider.be>
To:     arm-soc <arm@kernel.org>, arm-soc <soc@kernel.org>
Cc:     Magnus Damm <magnus.damm@gmail.com>,
        linux-arm-kernel@lists.infradead.org,
        linux-renesas-soc@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [GIT PULL 5/6] Renesas driver updates for v5.5 (take two)
Date:   Fri,  1 Nov 2019 16:58:41 +0100
Message-Id: <20191101155842.31467-6-geert+renesas@glider.be>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20191101155842.31467-1-geert+renesas@glider.be>
References: <20191101155842.31467-1-geert+renesas@glider.be>
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

The following changes since commit 6655c568ced0789479f00b9399603c5d6ee48640:

  soc: renesas: rcar-sysc: Add r8a774b1 support (2019-10-01 10:29:40 +0200)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-devel.git tags/renesas-drivers-for-v5.5-tag2

for you to fetch changes up to bdde3d3ec934839b3c11689ead467099f1c36c12:

  soc: renesas: rcar-sysc: Add R8A77961 support (2019-11-01 14:25:53 +0100)

----------------------------------------------------------------
Renesas driver updates for v5.5 (take two)

  - Initial support for the R-Car M3-W+ (r8a77961) SoC,
  - A minor fix.

----------------------------------------------------------------
Geert Uytterhoeven (10):
      dt-bindings: power: Add r8a77961 SYSC power domain definitions
      dt-bindings: clock: Add r8a77961 CPG Core Clock Definitions
      soc: renesas: Add missing check for non-zero product register address
      Merge tag 'renesas-r8a77961-dt-binding-defs-tag' into renesas-drivers-for-v5.5
      soc: renesas: Rename SYSC_R8A7796 to SYSC_R8A77960
      soc: renesas: Add ARCH_R8A77960 for existing R-Car M3-W
      soc: renesas: Add ARCH_R8A77961 for new R-Car M3-W+
      soc: renesas: Identify R-Car M3-W+
      soc: renesas: rcar-rst: Add R8A77961 support
      soc: renesas: rcar-sysc: Add R8A77961 support

 drivers/soc/renesas/Kconfig                   | 21 +++++++--
 drivers/soc/renesas/Makefile                  |  3 +-
 drivers/soc/renesas/r8a7796-sysc.c            | 27 ++++++-----
 drivers/soc/renesas/rcar-rst.c                |  1 +
 drivers/soc/renesas/rcar-sysc.c               |  7 ++-
 drivers/soc/renesas/rcar-sysc.h               |  3 +-
 drivers/soc/renesas/renesas-soc.c             |  7 ++-
 include/dt-bindings/clock/r8a77961-cpg-mssr.h | 65 +++++++++++++++++++++++++++
 include/dt-bindings/power/r8a77961-sysc.h     | 32 +++++++++++++
 9 files changed, 145 insertions(+), 21 deletions(-)
 create mode 100644 include/dt-bindings/clock/r8a77961-cpg-mssr.h
 create mode 100644 include/dt-bindings/power/r8a77961-sysc.h
