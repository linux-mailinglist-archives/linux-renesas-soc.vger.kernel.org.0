Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5DFD93E0731
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  4 Aug 2021 20:08:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238580AbhHDSIY (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 4 Aug 2021 14:08:24 -0400
Received: from relmlor2.renesas.com ([210.160.252.172]:43174 "EHLO
        relmlie6.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S238289AbhHDSIY (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 4 Aug 2021 14:08:24 -0400
X-IronPort-AV: E=Sophos;i="5.84,295,1620658800"; 
   d="scan'208";a="89818616"
Received: from unknown (HELO relmlir6.idc.renesas.com) ([10.200.68.152])
  by relmlie6.idc.renesas.com with ESMTP; 05 Aug 2021 03:08:09 +0900
Received: from localhost.localdomain (unknown [10.226.92.21])
        by relmlir6.idc.renesas.com (Postfix) with ESMTP id 9E69F40BF1F2;
        Thu,  5 Aug 2021 03:08:07 +0900 (JST)
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
Subject: [PATCH  0/2] Add SDHI clock and reset entries in cpg driver
Date:   Wed,  4 Aug 2021 19:08:01 +0100
Message-Id: <20210804180803.29087-1-biju.das.jz@bp.renesas.com>
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

This patch series is based on renesas-clk-for-v5.15 [1] 
[1] https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-drivers.git/?h=renesas-clk-for-v5.15

This patch series depend upon [2]
[2] https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=522063

Biju Das (2):
  drivers: clk: renesas: rzg2l-cpg: Add SDHI clk mux support
  drivers: clk: renesas: r9a07g044-cpg: Add SDHI clock and reset entries

 drivers/clk/renesas/r9a07g044-cpg.c |  37 ++++++++++
 drivers/clk/renesas/rzg2l-cpg.c     | 106 ++++++++++++++++++++++++++++
 drivers/clk/renesas/rzg2l-cpg.h     |  12 ++++
 3 files changed, 155 insertions(+)

-- 
2.17.1

