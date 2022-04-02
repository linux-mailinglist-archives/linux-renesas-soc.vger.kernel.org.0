Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 92B104EFF73
	for <lists+linux-renesas-soc@lfdr.de>; Sat,  2 Apr 2022 09:46:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238813AbiDBHs0 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Sat, 2 Apr 2022 03:48:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51080 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229776AbiDBHsY (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Sat, 2 Apr 2022 03:48:24 -0400
Received: from relmlie5.idc.renesas.com (relmlor1.renesas.com [210.160.252.171])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 1A97118B261;
        Sat,  2 Apr 2022 00:46:31 -0700 (PDT)
X-IronPort-AV: E=Sophos;i="5.90,229,1643641200"; 
   d="scan'208";a="115483885"
Received: from unknown (HELO relmlir6.idc.renesas.com) ([10.200.68.152])
  by relmlie5.idc.renesas.com with ESMTP; 02 Apr 2022 16:46:31 +0900
Received: from localhost.localdomain (unknown [10.226.92.166])
        by relmlir6.idc.renesas.com (Postfix) with ESMTP id 91A6841E38A1;
        Sat,  2 Apr 2022 16:46:29 +0900 (JST)
From:   Biju Das <biju.das.jz@bp.renesas.com>
To:     Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>
Cc:     Biju Das <biju.das.jz@bp.renesas.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        linux-renesas-soc@vger.kernel.org, linux-clk@vger.kernel.org,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Biju Das <biju.das@bp.renesas.com>,
        Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH v2 0/4] Add GPIO,ETHERNET and SDHI Clock/Reset entries for RZ/G2UL
Date:   Sat,  2 Apr 2022 08:46:22 +0100
Message-Id: <20220402074626.25624-1-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.17.1
X-Spam-Status: No, score=1.1 required=5.0 tests=AC_FROM_MANY_DOTS,BAYES_00,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=no
        autolearn_force=no version=3.4.6
X-Spam-Level: *
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

This patch series aims to add GPIO, ETHERNET and SDHI Clock/Reset
entries to RZ/G2UL Clk driver.

This patch series depend upon [1]
[1] https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=628396

v1->v2:
 * Added Rb tag from Geert

Biju Das (4):
  clk: renesas: r9a07g043: Add GPIO clock and reset entries
  clk: renesas: r9a07g043: Add ethernet clock sources
  clk: renesas: r9a07g043: Add GbEthernet clock/reset
  clk: renesas: r9a07g043: Add SDHI clock and reset entries

 drivers/clk/renesas/r9a07g043-cpg.c | 63 +++++++++++++++++++++++++++++
 1 file changed, 63 insertions(+)

-- 
2.17.1

