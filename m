Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F16E347B95B
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 21 Dec 2021 06:24:51 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231808AbhLUFYv (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 21 Dec 2021 00:24:51 -0500
Received: from relmlor2.renesas.com ([210.160.252.172]:51207 "EHLO
        relmlie6.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S230055AbhLUFYu (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 21 Dec 2021 00:24:50 -0500
X-IronPort-AV: E=Sophos;i="5.88,222,1635174000"; 
   d="scan'208";a="104663931"
Received: from unknown (HELO relmlir5.idc.renesas.com) ([10.200.68.151])
  by relmlie6.idc.renesas.com with ESMTP; 21 Dec 2021 14:24:49 +0900
Received: from localhost.localdomain (unknown [10.166.15.32])
        by relmlir5.idc.renesas.com (Postfix) with ESMTP id 607FA400F2B8;
        Tue, 21 Dec 2021 14:24:49 +0900 (JST)
From:   Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
To:     geert+renesas@glider.be
Cc:     linux-clk@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Subject: [PATCH] clk: renesas: r8a779f0: add sys-dmac clocks
Date:   Tue, 21 Dec 2021 14:24:23 +0900
Message-Id: <20211221052423.597283-1-yoshihiro.shimoda.uh@renesas.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Add sys-dmac clocks on r8a779f0.

Signed-off-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
---
 drivers/clk/renesas/r8a779f0-cpg-mssr.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/clk/renesas/r8a779f0-cpg-mssr.c b/drivers/clk/renesas/r8a779f0-cpg-mssr.c
index e6ec02c2c2a8..8cc7457564db 100644
--- a/drivers/clk/renesas/r8a779f0-cpg-mssr.c
+++ b/drivers/clk/renesas/r8a779f0-cpg-mssr.c
@@ -119,6 +119,8 @@ static const struct mssr_mod_clk r8a779f0_mod_clks[] __initconst = {
 	DEF_MOD("scif1",	703,	R8A779F0_CLK_S0D12_PER),
 	DEF_MOD("scif3",	704,	R8A779F0_CLK_S0D12_PER),
 	DEF_MOD("scif4",	705,	R8A779F0_CLK_S0D12_PER),
+	DEF_MOD("sys-dmac0",	709,	R8A779F0_CLK_S0D3_PER),
+	DEF_MOD("sys-dmac1",	710,	R8A779F0_CLK_S0D3_PER),
 };
 
 /*
-- 
2.25.1

