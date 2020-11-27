Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AB36B2C66B5
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 27 Nov 2020 14:23:06 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730213AbgK0NWH (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 27 Nov 2020 08:22:07 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51062 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729402AbgK0NWH (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 27 Nov 2020 08:22:07 -0500
Received: from andre.telenet-ops.be (andre.telenet-ops.be [IPv6:2a02:1800:120:4::f00:15])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 04C6BC0617A7
        for <linux-renesas-soc@vger.kernel.org>; Fri, 27 Nov 2020 05:22:06 -0800 (PST)
Received: from ramsan.of.borg ([84.195.186.194])
        by andre.telenet-ops.be with bizsmtp
        id xRN32300Y4C55Sk01RN3ik; Fri, 27 Nov 2020 14:22:04 +0100
Received: from rox.of.borg ([192.168.97.57])
        by ramsan.of.borg with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
        (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1kidhL-0065FP-Ll; Fri, 27 Nov 2020 14:22:03 +0100
Received: from geert by rox.of.borg with local (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1kidhL-000K9p-1i; Fri, 27 Nov 2020 14:22:03 +0100
From:   Geert Uytterhoeven <geert@linux-m68k.org>
To:     arm-soc <arm@kernel.org>, arm-soc <soc@kernel.org>
Cc:     Magnus Damm <magnus.damm@gmail.com>,
        linux-arm-kernel@lists.infradead.org,
        linux-renesas-soc@vger.kernel.org,
        Geert Uytterhoeven <geert@linux-m68k.org>
Subject: [GIT PULL 2/3] Renesas ARM SoC updates for v5.11
Date:   Fri, 27 Nov 2020 14:21:54 +0100
Message-Id: <20201127132155.77418-3-geert@linux-m68k.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201127132155.77418-1-geert@linux-m68k.org>
References: <20201127132155.77418-1-geert@linux-m68k.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

The following changes since commit 3650b228f83adda7e5ee532e2b90429c03f7b9ec:

  Linux 5.10-rc1 (2020-10-25 15:14:11 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-devel.git tags/renesas-arm-soc-for-v5.11-tag1

for you to fetch changes up to d4a617c9bbef94e4a776901cf12c95eafd54504a:

  ARM: shmobile: Stop using __raw_*() I/O accessors (2020-11-23 09:54:59 +0100)

----------------------------------------------------------------
Renesas ARM SoC updates for v5.11

  - Stop using static I/O mappings and __raw_*() I/O accessors.

----------------------------------------------------------------
Geert Uytterhoeven (8):
      ARM: shmobile: r8a7778: Introduce HPBREG_BASE
      ARM: shmobile: r8a7779: Use ioremap() to map INTC2 registers
      ARM: shmobile: r8a7779: Use ioremap() to map SMP registers
      ARM: shmobile: r8a7779: Remove obsolete static mappings
      ARM: shmobile: sh73a0: Use ioremap() to map L2C registers
      ARM: shmobile: sh73a0: Use ioremap() to map SMP registers
      ARM: shmobile: sh73a0: Remove obsolete static mapping
      ARM: shmobile: Stop using __raw_*() I/O accessors

 arch/arm/mach-shmobile/platsmp-scu.c   |  2 +-
 arch/arm/mach-shmobile/setup-r8a7778.c | 12 +++++---
 arch/arm/mach-shmobile/setup-r8a7779.c | 56 ++++++++++++----------------------
 arch/arm/mach-shmobile/setup-sh73a0.c  | 21 +------------
 arch/arm/mach-shmobile/smp-r8a7779.c   | 12 ++++++--
 arch/arm/mach-shmobile/smp-sh73a0.c    | 33 +++++++++++++-------
 6 files changed, 59 insertions(+), 77 deletions(-)
