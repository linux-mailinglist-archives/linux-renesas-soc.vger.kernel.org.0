Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 097A5265AA9
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 11 Sep 2020 09:44:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725730AbgIKHoF (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 11 Sep 2020 03:44:05 -0400
Received: from relmlor2.renesas.com ([210.160.252.172]:35243 "EHLO
        relmlie6.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1725535AbgIKHoE (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 11 Sep 2020 03:44:04 -0400
X-IronPort-AV: E=Sophos;i="5.76,414,1592838000"; 
   d="scan'208";a="56799462"
Received: from unknown (HELO relmlir6.idc.renesas.com) ([10.200.68.152])
  by relmlie6.idc.renesas.com with ESMTP; 11 Sep 2020 16:44:03 +0900
Received: from localhost.localdomain (unknown [10.166.252.89])
        by relmlir6.idc.renesas.com (Postfix) with ESMTP id 7CFED41DF0A5;
        Fri, 11 Sep 2020 16:44:03 +0900 (JST)
From:   Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
To:     geert+renesas@glider.be, magnus.damm@gmail.com
Cc:     linux-renesas-soc@vger.kernel.org,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Subject: [PATCH v3 0/4] treewide: add support for R-Car V3U
Date:   Fri, 11 Sep 2020 16:43:48 +0900
Message-Id: <1599810232-29035-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
X-Mailer: git-send-email 2.7.4
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

This patch series is like incremental patches from the v2 series [1]
and based on renesas-devel-2020-09-10-v5.9-rc4 tag.

[1]
https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=345847
and
https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=346611

Changes from v2:
 - In the patch 1:
 -- Update kerneldoc of struct cpg_mssr_info.
 -- Add Reviewed-by.
 - In the patch 2:
 -- Add new fields to th struct cpg_mssr_priv kerneldoc.
 -- Add pointers of the Software Reset and Software Reset Clearing Registers.
 - In the patch 3:
 -- Use hardcodes value about PLL[23][01] register offsets.
 -- Remove PLL6 document.
 -- Add pointers to srcr and srstclr for V3U.
 - In the patch 4:
 -- Remove R8A779A0_PD_ALWAYS_ON from r8a779a0-sysc.c.
 -- Fix readl_poll_timeout_atomic() argument.
 -- Add Reviewed-by.


Yoshihiro Shimoda (4):
  clk: renesas: cpg-mssr: Use enum clk_reg_layout instead of a boolean
    flag
  clk: renesas: cpg-mssr: add register pointers into struct
    cpg_mssr_priv
  clk: renesas: cpg-mssr: Add support for R-Car V3U
  soc: renesas: r8a779a0-sysc: Add r8a779a0 support

 drivers/clk/renesas/Kconfig             |   5 +
 drivers/clk/renesas/Makefile            |   1 +
 drivers/clk/renesas/r7s9210-cpg-mssr.c  |   2 +-
 drivers/clk/renesas/r8a779a0-cpg-mssr.c | 276 ++++++++++++++++++++
 drivers/clk/renesas/renesas-cpg-mssr.c  | 136 ++++++----
 drivers/clk/renesas/renesas-cpg-mssr.h  |  14 +-
 drivers/soc/renesas/Kconfig             |   4 +
 drivers/soc/renesas/Makefile            |   1 +
 drivers/soc/renesas/r8a779a0-sysc.c     | 448 ++++++++++++++++++++++++++++++++
 9 files changed, 835 insertions(+), 52 deletions(-)
 create mode 100644 drivers/clk/renesas/r8a779a0-cpg-mssr.c
 create mode 100644 drivers/soc/renesas/r8a779a0-sysc.c

-- 
2.7.4

