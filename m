Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 13DB128DE1B
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 14 Oct 2020 11:58:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728211AbgJNJ6h (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 14 Oct 2020 05:58:37 -0400
Received: from mslow2.mail.gandi.net ([217.70.178.242]:37940 "EHLO
        mslow2.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728667AbgJNJ5Z (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 14 Oct 2020 05:57:25 -0400
Received: from relay5-d.mail.gandi.net (unknown [217.70.183.197])
        by mslow2.mail.gandi.net (Postfix) with ESMTP id E89DA3A0DE5
        for <linux-renesas-soc@vger.kernel.org>; Wed, 14 Oct 2020 09:41:11 +0000 (UTC)
X-Originating-IP: 93.34.118.233
Received: from uno.lan (93-34-118-233.ip49.fastwebnet.it [93.34.118.233])
        (Authenticated sender: jacopo@jmondi.org)
        by relay5-d.mail.gandi.net (Postfix) with ESMTPSA id 778D71C0005;
        Wed, 14 Oct 2020 09:40:49 +0000 (UTC)
From:   Jacopo Mondi <jacopo+renesas@jmondi.org>
To:     linux-renesas-soc@vger.kernel.org, geert+renesas@glider.be,
        laurent.pinchart@ideasonboard.com
Cc:     Jacopo Mondi <jacopo+renesas@jmondi.org>,
        linux-kernel@vger.kernel.org
Subject: [PATCH 1/6] clk: renesas: r8a779a0: Add CSI4[0-3] clocks
Date:   Wed, 14 Oct 2020 11:44:38 +0200
Message-Id: <20201014094443.11070-2-jacopo+renesas@jmondi.org>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20201014094443.11070-1-jacopo+renesas@jmondi.org>
References: <20201014094443.11070-1-jacopo+renesas@jmondi.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Add clock definitions of the CSI-2 receivers for R-Car V3U.

Signed-off-by: Jacopo Mondi <jacopo+renesas@jmondi.org>
---
 drivers/clk/renesas/r8a779a0-cpg-mssr.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/clk/renesas/r8a779a0-cpg-mssr.c b/drivers/clk/renesas/r8a779a0-cpg-mssr.c
index 7e25b3b8945b..bd54a28c50ee 100644
--- a/drivers/clk/renesas/r8a779a0-cpg-mssr.c
+++ b/drivers/clk/renesas/r8a779a0-cpg-mssr.c
@@ -141,6 +141,10 @@ static const struct cpg_core_clk r8a779a0_core_clks[] __initconst = {
 };
 
 static const struct mssr_mod_clk r8a779a0_mod_clks[] __initconst = {
+	DEF_MOD("csi40",	331,	R8A779A0_CLK_CSI0),
+	DEF_MOD("csi41",	400,	R8A779A0_CLK_CSI0),
+	DEF_MOD("csi42",	401,	R8A779A0_CLK_CSI0),
+	DEF_MOD("csi43",	402,	R8A779A0_CLK_CSI0),
 	DEF_MOD("scif0",	702,	R8A779A0_CLK_S1D8),
 	DEF_MOD("scif1",	703,	R8A779A0_CLK_S1D8),
 	DEF_MOD("scif3",	704,	R8A779A0_CLK_S1D8),
-- 
2.28.0

