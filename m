Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E4B593B4D93
	for <lists+linux-renesas-soc@lfdr.de>; Sat, 26 Jun 2021 10:13:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229635AbhFZIQN (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Sat, 26 Jun 2021 04:16:13 -0400
Received: from relmlor2.renesas.com ([210.160.252.172]:46969 "EHLO
        relmlie6.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S229518AbhFZIQM (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Sat, 26 Jun 2021 04:16:12 -0400
X-IronPort-AV: E=Sophos;i="5.83,301,1616425200"; 
   d="scan'208";a="85483250"
Received: from unknown (HELO relmlir5.idc.renesas.com) ([10.200.68.151])
  by relmlie6.idc.renesas.com with ESMTP; 26 Jun 2021 17:13:49 +0900
Received: from localhost.localdomain (unknown [10.226.92.16])
        by relmlir5.idc.renesas.com (Postfix) with ESMTP id 21F1440037CD;
        Sat, 26 Jun 2021 17:13:46 +0900 (JST)
From:   Biju Das <biju.das.jz@bp.renesas.com>
To:     Michael Turquette <mturquette@baylibre.com>,
        Rob Herring <robh+dt@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>
Cc:     Biju Das <biju.das.jz@bp.renesas.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        linux-renesas-soc@vger.kernel.org, linux-clk@vger.kernel.org,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Biju Das <biju.das@bp.renesas.com>,
        Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH v4 00/10] Update clock definitions
Date:   Sat, 26 Jun 2021 09:13:34 +0100
Message-Id: <20210626081344.5783-1-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.17.1
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

This patch series aims to update clock and reset definitions as per
RZ/G2L_clock_list_r02_02.xlsx and RZ/G2L HW(Rev.0.50) manual.

As per this, we need to separate resets from module clocks in order to
handle it efficiently.

Added support for multi clock PM support and updated clock driver enties.

This patch series is tested with USB Host, USB Device, I2C, DMAC and SSI.

This patch series is based on [1] and [2]
[1] https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-drivers.git/commit/?h=renesas-clk-for-v5.15
[2] https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-devel.git/

v3->v4:
 * Fixed the code comment onoff to bit.
v2->v3
 * Improved clk/reset code as per Geert's suggestion.
 * Added Geert's Rb tag

v1->v2
 * Updated reset entries
 * Added Geert's Rb tag for multi clock PM support.

v1:
 * https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=503135


Biju Das (10):
  drivers: clk: renesas: renesas-rzg2l-cpg: Add multi clock PM support
  drivers: clk: renesas: r9a07g044-cpg: Rename divider table
  drivers: clk: renesas: r9a07g044-cpg: Fix P1 Clock
  drivers: clk: renesas: r9a07g044-cpg: Add P2 Clock support
  dt-bindings: clk: r9a07g044-cpg: Update clock/reset definitions
  drivers: clk: renesas: r9a07g044-cpg: Update {GIC,IA55,SCIF}
    clock/reset entries
  arm64: dts: renesas: r9a07g044: Update SCIF0 clock/reset
  drivers: clk: renesas: r9a07g044-cpg: Add I2C clocks/resets
  drivers: clk: renesas: r9a07g044-cpg: Add DMAC clocks/resets
  arm64: dts: renesas: r9a07g044: Add I2C nodes

 arch/arm64/boot/dts/renesas/r9a07g044.dtsi |  84 +++++++-
 drivers/clk/renesas/r9a07g044-cpg.c        |  99 ++++++---
 drivers/clk/renesas/renesas-rzg2l-cpg.c    | 110 +++++-----
 drivers/clk/renesas/renesas-rzg2l-cpg.h    |  37 +++-
 include/dt-bindings/clock/r9a07g044-cpg.h  | 236 ++++++++++++++++-----
 5 files changed, 419 insertions(+), 147 deletions(-)

-- 
2.17.1

