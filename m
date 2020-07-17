Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id ED863223A75
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 17 Jul 2020 13:24:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726200AbgGQLYo (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 17 Jul 2020 07:24:44 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43752 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726000AbgGQLYo (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 17 Jul 2020 07:24:44 -0400
Received: from albert.telenet-ops.be (albert.telenet-ops.be [IPv6:2a02:1800:110:4::f00:1a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 36090C061755
        for <linux-renesas-soc@vger.kernel.org>; Fri, 17 Jul 2020 04:24:44 -0700 (PDT)
Received: from ramsan ([84.195.186.194])
        by albert.telenet-ops.be with bizsmtp
        id 4BQj2300Q4C55Sk06BQj84; Fri, 17 Jul 2020 13:24:43 +0200
Received: from rox.of.borg ([192.168.97.57])
        by ramsan with esmtp (Exim 4.90_1)
        (envelope-from <geert@linux-m68k.org>)
        id 1jwOTr-00026E-Oh; Fri, 17 Jul 2020 13:24:43 +0200
Received: from geert by rox.of.borg with local (Exim 4.90_1)
        (envelope-from <geert@linux-m68k.org>)
        id 1jwOTr-0006nS-NA; Fri, 17 Jul 2020 13:24:43 +0200
From:   Geert Uytterhoeven <geert+renesas@glider.be>
To:     arm-soc <arm@kernel.org>, arm-soc <soc@kernel.org>
Cc:     Magnus Damm <magnus.damm@gmail.com>,
        linux-arm-kernel@lists.infradead.org,
        linux-renesas-soc@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [GIT PULL 2/3] Renesas driver updates for v5.9
Date:   Fri, 17 Jul 2020 13:24:26 +0200
Message-Id: <20200717112427.26032-3-geert+renesas@glider.be>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200717112427.26032-1-geert+renesas@glider.be>
References: <20200717112427.26032-1-geert+renesas@glider.be>
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

The following changes since commit b3a9e3b9622ae10064826dccb4f7a52bd88c7407:

  Linux 5.8-rc1 (2020-06-14 12:45:04 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-devel.git tags/renesas-drivers-for-v5.9-tag1

for you to fetch changes up to 7f8fa833dc739c4a28574c335eb08dbde2cb23d0:

  soc: renesas: rcar-rst: Add support for RZ/G2H (2020-07-13 10:34:41 +0200)

----------------------------------------------------------------
Renesas driver updates for v5.9

  - Add core support for the new RZ/G2H (R8A774E1) SoC, including System
    Controller (SYSC) and Reset (RST) support.

----------------------------------------------------------------
Geert Uytterhoeven (1):
      Merge tag 'renesas-r8a774e1-dt-binding-defs-tag' into renesas-drivers-for-v5.9

Marian-Cristian Rotariu (6):
      dt-bindings: power: Add r8a774e1 SYSC power domain definitions
      clk: renesas: Add r8a774e1 CPG Core Clock Definitions
      soc: renesas: rcar-sysc: Add r8a774e1 support
      soc: renesas: Add Renesas R8A774E1 config option
      soc: renesas: Identify RZ/G2H
      soc: renesas: rcar-rst: Add support for RZ/G2H

 drivers/soc/renesas/Kconfig                   | 11 +++++
 drivers/soc/renesas/Makefile                  |  1 +
 drivers/soc/renesas/r8a774e1-sysc.c           | 43 +++++++++++++++++++
 drivers/soc/renesas/rcar-rst.c                |  1 +
 drivers/soc/renesas/rcar-sysc.c               |  3 ++
 drivers/soc/renesas/rcar-sysc.h               |  1 +
 drivers/soc/renesas/renesas-soc.c             |  8 ++++
 include/dt-bindings/clock/r8a774e1-cpg-mssr.h | 59 +++++++++++++++++++++++++++
 include/dt-bindings/power/r8a774e1-sysc.h     | 36 ++++++++++++++++
 9 files changed, 163 insertions(+)
 create mode 100644 drivers/soc/renesas/r8a774e1-sysc.c
 create mode 100644 include/dt-bindings/clock/r8a774e1-cpg-mssr.h
 create mode 100644 include/dt-bindings/power/r8a774e1-sysc.h
