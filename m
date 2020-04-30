Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 327A61BF36D
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 30 Apr 2020 10:49:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726549AbgD3Isy (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 30 Apr 2020 04:48:54 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35706 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726820AbgD3Isy (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 30 Apr 2020 04:48:54 -0400
Received: from albert.telenet-ops.be (albert.telenet-ops.be [IPv6:2a02:1800:110:4::f00:1a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id ACEEEC08E934
        for <linux-renesas-soc@vger.kernel.org>; Thu, 30 Apr 2020 01:48:53 -0700 (PDT)
Received: from ramsan ([IPv6:2a02:1810:ac12:ed60:182a:142e:a95f:66c2])
        by albert.telenet-ops.be with bizsmtp
        id Ywor2200a0w8ZL606worP8; Thu, 30 Apr 2020 10:48:52 +0200
Received: from rox.of.borg ([192.168.97.57])
        by ramsan with esmtp (Exim 4.90_1)
        (envelope-from <geert@linux-m68k.org>)
        id 1jU4sF-0002lC-JY; Thu, 30 Apr 2020 10:48:51 +0200
Received: from geert by rox.of.borg with local (Exim 4.90_1)
        (envelope-from <geert@linux-m68k.org>)
        id 1jU4sF-0000OW-IA; Thu, 30 Apr 2020 10:48:51 +0200
From:   Geert Uytterhoeven <geert+renesas@glider.be>
To:     arm-soc <arm@kernel.org>, arm-soc <soc@kernel.org>
Cc:     Magnus Damm <magnus.damm@gmail.com>,
        linux-arm-kernel@lists.infradead.org,
        linux-renesas-soc@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [GIT PULL 4/5] Renesas driver updates for v5.8
Date:   Thu, 30 Apr 2020 10:48:48 +0200
Message-Id: <20200430084849.1457-5-geert+renesas@glider.be>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200430084849.1457-1-geert+renesas@glider.be>
References: <20200430084849.1457-1-geert+renesas@glider.be>
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

The following changes since commit 8f3d9f354286745c751374f5f1fcafee6b3f3136:

  Linux 5.7-rc1 (2020-04-12 12:35:55 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-devel.git tags/renesas-drivers-for-v5.8-tag1

for you to fetch changes up to 2f71832755a9422f5a62a13ea3e805df7b173837:

  soc: renesas: rcar-rst: Add support for RZ/G1H (2020-04-30 10:01:39 +0200)

----------------------------------------------------------------
Renesas driver updates for v5.8

  - Add System Controller (SYSC) and Reset (RST) support for the new
    RZ/G1H (R8A7742) SoC.

----------------------------------------------------------------
Geert Uytterhoeven (1):
      Merge tag 'renesas-r8a7742-dt-binding-defs-tag' into renesas-drivers-for-v5.8

Lad Prabhakar (4):
      dt-bindings: power: rcar-sysc: Add r8a7742 power domain index macros
      clk: renesas: Add r8a7742 CPG Core Clock Definitions
      soc: renesas: rcar-sysc: Add R8A7742 support
      soc: renesas: rcar-rst: Add support for RZ/G1H

 drivers/soc/renesas/Kconfig                  |  4 +++
 drivers/soc/renesas/Makefile                 |  1 +
 drivers/soc/renesas/r8a7742-sysc.c           | 42 ++++++++++++++++++++++++++++
 drivers/soc/renesas/rcar-rst.c               |  1 +
 drivers/soc/renesas/rcar-sysc.c              |  3 ++
 drivers/soc/renesas/rcar-sysc.h              |  1 +
 include/dt-bindings/clock/r8a7742-cpg-mssr.h | 42 ++++++++++++++++++++++++++++
 include/dt-bindings/power/r8a7742-sysc.h     | 29 +++++++++++++++++++
 8 files changed, 123 insertions(+)
 create mode 100644 drivers/soc/renesas/r8a7742-sysc.c
 create mode 100644 include/dt-bindings/clock/r8a7742-cpg-mssr.h
 create mode 100644 include/dt-bindings/power/r8a7742-sysc.h
