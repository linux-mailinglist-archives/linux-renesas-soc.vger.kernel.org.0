Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5BF7E979D0
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 21 Aug 2019 14:46:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726693AbfHUMqK (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 21 Aug 2019 08:46:10 -0400
Received: from michel.telenet-ops.be ([195.130.137.88]:44558 "EHLO
        michel.telenet-ops.be" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726372AbfHUMqJ (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 21 Aug 2019 08:46:09 -0400
Received: from ramsan ([84.194.98.4])
        by michel.telenet-ops.be with bizsmtp
        id rom32000i05gfCL06om3cp; Wed, 21 Aug 2019 14:46:07 +0200
Received: from rox.of.borg ([192.168.97.57])
        by ramsan with esmtp (Exim 4.90_1)
        (envelope-from <geert@linux-m68k.org>)
        id 1i0Q03-0003e4-Mg; Wed, 21 Aug 2019 14:46:03 +0200
Received: from geert by rox.of.borg with local (Exim 4.90_1)
        (envelope-from <geert@linux-m68k.org>)
        id 1i0Q03-0007dl-Lf; Wed, 21 Aug 2019 14:46:03 +0200
From:   Geert Uytterhoeven <geert+renesas@glider.be>
To:     Simon Horman <horms@verge.net.au>,
        Magnus Damm <magnus.damm@gmail.com>
Cc:     linux-renesas-soc@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH 3/3] [RFC] ARM: shmobile: defconfig: Disable PL310_ERRATA_588369
Date:   Wed, 21 Aug 2019 14:46:02 +0200
Message-Id: <20190821124602.29317-4-geert+renesas@glider.be>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190821124602.29317-1-geert+renesas@glider.be>
References: <20190821124602.29317-1-geert+renesas@glider.be>
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

PL310 Erratum 588369 affects PL310 cache controller revisions older than
r2p0.

As Renesas ARM SoCs contain the following revisions:
  - SH-Mobile AG5: r3p1,
  - R-Mobile A1: r3p1-50rel0,
  - R-Car H1: r3p2,
  - RZ/A1: r3p2,
  - RZ/A2: r3p3,
none of them are affected, and support for the errata can be disabled
safely.

The EMMA Mobile EV2 documentation doesn't mention the revision of its
PL310 cache controller, so this SoC might be affected.  However, the L2
cache controller is not enabled by Linux.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
 arch/arm/configs/shmobile_defconfig | 1 -
 1 file changed, 1 deletion(-)

diff --git a/arch/arm/configs/shmobile_defconfig b/arch/arm/configs/shmobile_defconfig
index 123821e63873dafa..95a127cbe8e6fcd7 100644
--- a/arch/arm/configs/shmobile_defconfig
+++ b/arch/arm/configs/shmobile_defconfig
@@ -8,7 +8,6 @@ CONFIG_CC_OPTIMIZE_FOR_SIZE=y
 CONFIG_PERF_EVENTS=y
 CONFIG_SLAB=y
 CONFIG_ARCH_RENESAS=y
-CONFIG_PL310_ERRATA_588369=y
 CONFIG_SMP=y
 CONFIG_SCHED_MC=y
 CONFIG_NR_CPUS=8
-- 
2.17.1

