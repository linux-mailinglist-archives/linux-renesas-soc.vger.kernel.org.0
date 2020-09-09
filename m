Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6EC0F262F79
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  9 Sep 2020 16:06:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730337AbgIINP2 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 9 Sep 2020 09:15:28 -0400
Received: from relmlor1.renesas.com ([210.160.252.171]:58451 "EHLO
        relmlie5.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1730329AbgIINNn (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 9 Sep 2020 09:13:43 -0400
X-IronPort-AV: E=Sophos;i="5.76,409,1592838000"; 
   d="scan'208";a="56837032"
Received: from unknown (HELO relmlir6.idc.renesas.com) ([10.200.68.152])
  by relmlie5.idc.renesas.com with ESMTP; 09 Sep 2020 22:13:42 +0900
Received: from localhost.localdomain (unknown [10.166.252.89])
        by relmlir6.idc.renesas.com (Postfix) with ESMTP id 6973449DB583;
        Wed,  9 Sep 2020 22:13:42 +0900 (JST)
From:   Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
To:     geert+renesas@glider.be, magnus.damm@gmail.com
Cc:     linux-renesas-soc@vger.kernel.org,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Subject: [PATCH v2 0/4] clk: renesas: cpg-mssr: add support for V3U
Date:   Wed,  9 Sep 2020 22:13:27 +0900
Message-Id: <1599657211-17504-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
X-Mailer: git-send-email 2.7.4
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

This patch series is like incremental patches from the following
series.

 https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=344457

And, this patch series fix patch 7/14 and 12/14 of
the previous patch series. In other words, I don't include
the patch 6/14 because it already got Reviewed-by [1].
https://patchwork.kernel.org/patch/11760285/

Changes from v1:
 - Fix subject in the patch 1.
 - Remove unused/unexist definitions in the patch 1.
 - Fix the SPDX in the patch 1.
 - Use enum instead of bool flag, so I made additional new patches as
   patch 2 and 3.
 - Remove z clocks handling in the patch 4.
 - Use share PLL[23][01] clock types in the patch 4.
 - Fix alignment of r8a779a0_core_clks in the patch 4.
 - Use rcar-gen3-cpg.h in the patch 4.
 - Remove r8a779a0_crit_mod_clks in the patch 4.
 - Fix .num_hw_mod_clks in the patch 4. 

Yoshihiro Shimoda (4):
  dt-bindings: clock: Add r8a779a0 CPG Core Clock Definitions
  clk: renesas: cpg-mssr: Use enum clk_reg_layout instead of a boolean
    flag
  clk: renesas: cpg-mssr: add register pointers into struct
    cpg_mssr_priv
  clk: renesas: cpg-mssr: Add support for R-Car V3U

 drivers/clk/renesas/Kconfig                   |   5 +
 drivers/clk/renesas/Makefile                  |   1 +
 drivers/clk/renesas/r7s9210-cpg-mssr.c        |   2 +-
 drivers/clk/renesas/r8a779a0-cpg-mssr.c       | 281 ++++++++++++++++++++++++++
 drivers/clk/renesas/renesas-cpg-mssr.c        | 100 +++++----
 drivers/clk/renesas/renesas-cpg-mssr.h        |   9 +-
 include/dt-bindings/clock/r8a779a0-cpg-mssr.h |  55 +++++
 7 files changed, 413 insertions(+), 40 deletions(-)
 create mode 100644 drivers/clk/renesas/r8a779a0-cpg-mssr.c
 create mode 100644 include/dt-bindings/clock/r8a779a0-cpg-mssr.h

-- 
2.7.4

