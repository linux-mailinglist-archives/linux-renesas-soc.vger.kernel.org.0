Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5615C478979
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 17 Dec 2021 12:07:23 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235243AbhLQLHW (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 17 Dec 2021 06:07:22 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51766 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235244AbhLQLHU (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 17 Dec 2021 06:07:20 -0500
Received: from xavier.telenet-ops.be (xavier.telenet-ops.be [IPv6:2a02:1800:120:4::f00:14])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CB8F2C06173E
        for <linux-renesas-soc@vger.kernel.org>; Fri, 17 Dec 2021 03:07:19 -0800 (PST)
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed20:d13f:527c:5504:a743])
        by xavier.telenet-ops.be with bizsmtp
        id XP7H2600X250X3001P7Hcd; Fri, 17 Dec 2021 12:07:17 +0100
Received: from rox.of.borg ([192.168.97.57])
        by ramsan.of.borg with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
        (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1myB53-005Y8U-Am; Fri, 17 Dec 2021 12:07:17 +0100
Received: from geert by rox.of.borg with local (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1myB52-00AQSb-Hk; Fri, 17 Dec 2021 12:07:16 +0100
From:   Geert Uytterhoeven <geert+renesas@glider.be>
To:     arm-soc <arm@kernel.org>, soc <soc@kernel.org>
Cc:     Magnus Damm <magnus.damm@gmail.com>,
        linux-arm-kernel@lists.infradead.org,
        linux-renesas-soc@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [GIT PULL 3/4] Renesas driver updates for v5.17 (take two)
Date:   Fri, 17 Dec 2021 12:07:14 +0100
Message-Id: <cover.1639736722.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1639736716.git.geert+renesas@glider.be>
References: <cover.1639736716.git.geert+renesas@glider.be>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

The following changes since commit 05b22caa7490e4f4c94bbde33c61cf72d187b8f7:

  soc: renesas: Consolidate product register handling (2021-11-30 09:42:00 +0100)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-devel.git tags/renesas-drivers-for-v5.17-tag2

for you to fetch changes up to 363b41dd25397f553bebf87594eca9b2d6445b55:

  soc: renesas: rcar-rst: Add support for R-Car S4-8 (2021-12-07 16:50:57 +0100)

----------------------------------------------------------------
Renesas driver updates for v5.17 (take two)

  - Core support for the R-Car S4-8 (R8A779F0) SoC, including System
    Controller (SYSC) and Reset (RST) support.

----------------------------------------------------------------
Geert Uytterhoeven (1):
      Merge tag 'renesas-r8a779f0-dt-binding-defs-tag' into renesas-drivers-for-v5.17

Yoshihiro Shimoda (6):
      dt-bindings: power: Add r8a779f0 SYSC power domain definitions
      dt-bindings: clock: Add r8a779f0 CPG Core Clock Definitions
      soc: renesas: rcar-gen4-sysc: Introduce R-Car Gen4 SYSC driver
      soc: renesas: r8a779f0-sysc: Add r8a779f0 support
      soc: renesas: Identify R-Car S4-8
      soc: renesas: rcar-rst: Add support for R-Car S4-8

 drivers/soc/renesas/Kconfig                   |  15 +
 drivers/soc/renesas/Makefile                  |   2 +
 drivers/soc/renesas/r8a779a0-sysc.c           | 380 +-------------------------
 drivers/soc/renesas/r8a779f0-sysc.c           |  47 ++++
 drivers/soc/renesas/rcar-gen4-sysc.c          | 376 +++++++++++++++++++++++++
 drivers/soc/renesas/rcar-gen4-sysc.h          |  43 +++
 drivers/soc/renesas/rcar-rst.c                |   7 +-
 drivers/soc/renesas/renesas-soc.c             |  12 +
 include/dt-bindings/clock/r8a779f0-cpg-mssr.h |  64 +++++
 include/dt-bindings/power/r8a779f0-sysc.h     |  30 ++
 10 files changed, 596 insertions(+), 380 deletions(-)
 create mode 100644 drivers/soc/renesas/r8a779f0-sysc.c
 create mode 100644 drivers/soc/renesas/rcar-gen4-sysc.c
 create mode 100644 drivers/soc/renesas/rcar-gen4-sysc.h
 create mode 100644 include/dt-bindings/clock/r8a779f0-cpg-mssr.h
 create mode 100644 include/dt-bindings/power/r8a779f0-sysc.h
