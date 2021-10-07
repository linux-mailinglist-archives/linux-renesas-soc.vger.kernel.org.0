Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9D1554251D0
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  7 Oct 2021 13:14:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232781AbhJGLQd (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 7 Oct 2021 07:16:33 -0400
Received: from relmlor1.renesas.com ([210.160.252.171]:17107 "EHLO
        relmlie5.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S232680AbhJGLQd (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 7 Oct 2021 07:16:33 -0400
X-IronPort-AV: E=Sophos;i="5.85,354,1624287600"; 
   d="scan'208";a="96262982"
Received: from unknown (HELO relmlir5.idc.renesas.com) ([10.200.68.151])
  by relmlie5.idc.renesas.com with ESMTP; 07 Oct 2021 20:14:38 +0900
Received: from localhost.localdomain (unknown [10.226.93.49])
        by relmlir5.idc.renesas.com (Postfix) with ESMTP id 6C568400F7A8;
        Thu,  7 Oct 2021 20:14:36 +0900 (JST)
From:   Biju Das <biju.das.jz@bp.renesas.com>
To:     Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>
Cc:     Biju Das <biju.das.jz@bp.renesas.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>,
        linux-renesas-soc@vger.kernel.org, linux-clk@vger.kernel.org,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Biju Das <biju.das@bp.renesas.com>,
        Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH v2 0/2] Add SDHI clock and reset entries in cpg driver
Date:   Thu,  7 Oct 2021 12:14:32 +0100
Message-Id: <20211007111434.8665-1-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.17.1
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Add SDHI clock and reset entries in cpg driver.

As per the HW manual, we should not directly switch from 533 MHz
to 400 MHz and vice versa. To change the setting from 533 MHz to 400 MHz
or vice versa, Switch to 266 MHz first,and then switch to the target
setting 533 MHz or 400 MHz. So added support in mux to handle this
condition.

This patch series depend upon [1]

[1] https://patchwork.kernel.org/project/linux-renesas-soc/patch/20210928130132.15022-1-prabhakar.mahadev-lad.rj@bp.renesas.com/

v1->v2:
 * Removed flags and mux flags from DEF_SD_MUX
 * Added readl_poll_timeout to check CPG_CLKSTATUS.SELSDHIx_STS bit
 * Added curly braces around val in rzg2l_cpg_sd_clk_mux_get_parent()
 * Renamed the clk source names as per latest HW manual
 * Changed the mult/divider values for 533MHz clock

Biju Das (2):
  drivers: clk: renesas: rzg2l-cpg: Add SDHI clk mux support
  drivers: clk: renesas: r9a07g044-cpg: Add SDHI clock and reset entries

 drivers/clk/renesas/r9a07g044-cpg.c |  36 +++++++++
 drivers/clk/renesas/rzg2l-cpg.c     | 119 ++++++++++++++++++++++++++++
 drivers/clk/renesas/rzg2l-cpg.h     |  16 ++++
 3 files changed, 171 insertions(+)

-- 
2.17.1

