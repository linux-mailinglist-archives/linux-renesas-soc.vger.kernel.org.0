Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 123442645CA
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 10 Sep 2020 14:13:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730093AbgIJMMj (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 10 Sep 2020 08:12:39 -0400
Received: from relmlor1.renesas.com ([210.160.252.171]:49725 "EHLO
        relmlie5.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1730309AbgIJMDI (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 10 Sep 2020 08:03:08 -0400
X-IronPort-AV: E=Sophos;i="5.76,412,1592838000"; 
   d="scan'208";a="56936701"
Received: from unknown (HELO relmlir6.idc.renesas.com) ([10.200.68.152])
  by relmlie5.idc.renesas.com with ESMTP; 10 Sep 2020 21:03:06 +0900
Received: from localhost.localdomain (unknown [10.166.252.89])
        by relmlir6.idc.renesas.com (Postfix) with ESMTP id 63A98425ACDC;
        Thu, 10 Sep 2020 21:03:06 +0900 (JST)
From:   Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
To:     geert+renesas@glider.be, magnus.damm@gmail.com, robh+dt@kernel.org
Cc:     linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Subject: [PATCH v2 0/4] treewide: add support for R-Car V3U
Date:   Thu, 10 Sep 2020 21:02:48 +0900
Message-Id: <1599739372-30669-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
X-Mailer: git-send-email 2.7.4
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

This patch series is like incremental patches from the v1 series [1].
And, this patch series fix patch 2, 10, 13 and 14/14 of
the v1 series. In other words, I don't include other patches because:
 - some patches (1, 3 to 6, 8, 9, 11) already got Reviewed-by [1].
 - I submitted incremental v2 patches [2] for patch 6/14 and 12/14.

[1]
https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=344457

[2]
https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=345847

Changes from v1:
 - In the patch 1:
 -- Fix renesas,falcon-breakout.
 - In the patch 2:
 -- Fix Remove #include rcar-sysc.h.
 -- Use r8a779a0_sysc_{area,info} instead of rcar_sysc_{area,info}.
 -- Use SYSCSR_BUSY instead of SYSCSR_P{ON,OFF}ENB.
 -- Remove struct rcar_sysc_ch.
 -- Replace keywords of "rcar" to "r8a779a0".
 -- Clean up r8a779a0_sysc_pwr_on_off().
 -- Use readl_poll_timeout_"atomic()" because held by spin_lock_irqsave().
 -- Remove has_cpg_mstp flag.
 -- Remove #ifdef CONFIG_SYSC_R8A779A0
 - In the patch 3:
 -- Fix the length of sysc.
 -- Add resets property into scif0.
 -- Fix GIC_CPU_MAS_SIMPLE() argument to 1.
 - In the patch 4:
 -- Add #include "r8a779a0.dtsi".
 -- Fix compatible in falcon-cpu.dtsi and r8a779a0-falcon.dts.

Yoshihiro Shimoda (4):
  dt-bindings: arm: renesas: Document Renesas Falcon boards
  soc: renesas: r8a779a0-sysc: Add r8a779a0 support
  arm64: dts: renesas: Add Renesas R8A779A0 SoC support
  arm64: dts: renesas: Add Renesas Falcon boards support

 Documentation/devicetree/bindings/arm/renesas.yaml |   8 +
 arch/arm64/boot/dts/renesas/Makefile               |   2 +
 .../boot/dts/renesas/r8a779a0-falcon-cpu.dtsi      |  46 +++
 arch/arm64/boot/dts/renesas/r8a779a0-falcon.dts    |  23 ++
 arch/arm64/boot/dts/renesas/r8a779a0.dtsi          | 133 ++++++
 drivers/soc/renesas/Kconfig                        |   4 +
 drivers/soc/renesas/Makefile                       |   1 +
 drivers/soc/renesas/r8a779a0-sysc.c                | 450 +++++++++++++++++++++
 8 files changed, 667 insertions(+)
 create mode 100644 arch/arm64/boot/dts/renesas/r8a779a0-falcon-cpu.dtsi
 create mode 100644 arch/arm64/boot/dts/renesas/r8a779a0-falcon.dts
 create mode 100644 arch/arm64/boot/dts/renesas/r8a779a0.dtsi
 create mode 100644 drivers/soc/renesas/r8a779a0-sysc.c

-- 
2.7.4

