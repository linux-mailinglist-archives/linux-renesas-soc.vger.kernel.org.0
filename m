Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 73AA7414DA9
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 22 Sep 2021 18:03:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232357AbhIVQFY (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 22 Sep 2021 12:05:24 -0400
Received: from relmlor1.renesas.com ([210.160.252.171]:15645 "EHLO
        relmlie5.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S231712AbhIVQFY (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 22 Sep 2021 12:05:24 -0400
X-IronPort-AV: E=Sophos;i="5.85,314,1624287600"; 
   d="scan'208";a="94720416"
Received: from unknown (HELO relmlir5.idc.renesas.com) ([10.200.68.151])
  by relmlie5.idc.renesas.com with ESMTP; 23 Sep 2021 01:03:52 +0900
Received: from localhost.localdomain (unknown [10.226.92.203])
        by relmlir5.idc.renesas.com (Postfix) with ESMTP id 1704C4003EB6;
        Thu, 23 Sep 2021 01:03:48 +0900 (JST)
From:   Biju Das <biju.das.jz@bp.renesas.com>
To:     Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>
Cc:     Biju Das <biju.das.jz@bp.renesas.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Sergei Shtylyov <sergei.shtylyov@gmail.com>,
        Andrew Lunn <andrew@lunn.ch>,
        linux-renesas-soc@vger.kernel.org, linux-clk@vger.kernel.org,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Biju Das <biju.das@bp.renesas.com>,
        Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH v4 0/4] Add GbEthernet Clock support
Date:   Wed, 22 Sep 2021 16:51:41 +0100
Message-Id: <20210922155145.28156-1-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.17.1
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

This patch series aims to add GbEthernet clock support.
GbEthernet clock support involves handing mux clock support
for HP clock and coupled clock for axi/chi module clocks which
shares same bit for controlling the clock output.

This patch series depend upon [1]
[1] https://patchwork.kernel.org/project/linux-renesas-soc/patch/20210922112405.26413-2-biju.das.jz@bp.renesas.com/

v3->v4:
 * Renamed PLL5_2_DIV12 and PLL6_2_DIV2 to PLL5_250 and PLL6_250.
 * Added locking, in case both clocks are changed concurrently
 * initialized mstp_clock.enabled to match the current hardware state.
v2->v3:
 * Rebased to latest renesas-clk
 * Updated commit header for all patches
 * Replaced CLK_PLL5_2 with PLL5_FOUT3
 * Removed CLK_PLL6_2 and pll6_2 as the clk is sourced from PLL6
 * Added enabled flag to track the status of clock, if it is coupled
   with another clock
 * Introduced siblings pointer which points to the other coupled
   clock
 * coupled clock linking is done during module clk register.
 * rzg2l_mod_clock_is_enabled function returns soft state of the
   module clocks, if it is coupled with another clock
v1->v2:
 * No change. Separated clock patches from driver patch series as per [1]
 [1]
  https://www.spinics.net/lists/linux-renesas-soc/msg59067.html
v1:-
 * New patch

Biju Das (4):
  clk: renesas: rzg2l: Add support to handle MUX clocks
  clk: renesas: r9a07g044: Add ethernet clock sources
  clk: renesas: rzg2l: Add support to handle coupled clocks
  clk: renesas: r9a07g044: Add GbEthernet clock/reset

 drivers/clk/renesas/r9a07g044-cpg.c | 29 ++++++++-
 drivers/clk/renesas/rzg2l-cpg.c     | 96 +++++++++++++++++++++++++++++
 drivers/clk/renesas/rzg2l-cpg.h     | 26 +++++++-
 3 files changed, 149 insertions(+), 2 deletions(-)

-- 
2.17.1

