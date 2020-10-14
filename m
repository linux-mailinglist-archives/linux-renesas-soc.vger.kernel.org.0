Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DFCF928DE23
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 14 Oct 2020 11:58:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727414AbgJNJ64 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 14 Oct 2020 05:58:56 -0400
Received: from mslow2.mail.gandi.net ([217.70.178.242]:38506 "EHLO
        mslow2.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728763AbgJNJ5l (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 14 Oct 2020 05:57:41 -0400
Received: from relay5-d.mail.gandi.net (unknown [217.70.183.197])
        by mslow2.mail.gandi.net (Postfix) with ESMTP id C032F3B71AE
        for <linux-renesas-soc@vger.kernel.org>; Wed, 14 Oct 2020 09:41:23 +0000 (UTC)
X-Originating-IP: 93.34.118.233
Received: from uno.lan (93-34-118-233.ip49.fastwebnet.it [93.34.118.233])
        (Authenticated sender: jacopo@jmondi.org)
        by relay5-d.mail.gandi.net (Postfix) with ESMTPSA id F25EE1C0012;
        Wed, 14 Oct 2020 09:40:52 +0000 (UTC)
From:   Jacopo Mondi <jacopo+renesas@jmondi.org>
To:     linux-renesas-soc@vger.kernel.org, geert+renesas@glider.be,
        laurent.pinchart@ideasonboard.com
Cc:     Jacopo Mondi <jacopo+renesas@jmondi.org>,
        linux-kernel@vger.kernel.org
Subject: [PATCH 4/6] clk: renesas: r8a779a0: Add VIN[00-31] clocks
Date:   Wed, 14 Oct 2020 11:44:41 +0200
Message-Id: <20201014094443.11070-5-jacopo+renesas@jmondi.org>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20201014094443.11070-1-jacopo+renesas@jmondi.org>
References: <20201014094443.11070-1-jacopo+renesas@jmondi.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Add clock definitions of the VIN instances for R-Car V3U.

Signed-off-by: Jacopo Mondi <jacopo+renesas@jmondi.org>

---
Clocks at indexes 730 and 731 are named 'vin0' and 'vin1'.
I assumed it's a typographic error and renamed them 'vin00' and 'vin01'
---
 drivers/clk/renesas/r8a779a0-cpg-mssr.c | 32 +++++++++++++++++++++++++
 1 file changed, 32 insertions(+)

diff --git a/drivers/clk/renesas/r8a779a0-cpg-mssr.c b/drivers/clk/renesas/r8a779a0-cpg-mssr.c
index bd54a28c50ee..2a00eb82013f 100644
--- a/drivers/clk/renesas/r8a779a0-cpg-mssr.c
+++ b/drivers/clk/renesas/r8a779a0-cpg-mssr.c
@@ -149,6 +149,38 @@ static const struct mssr_mod_clk r8a779a0_mod_clks[] __initconst = {
 	DEF_MOD("scif1",	703,	R8A779A0_CLK_S1D8),
 	DEF_MOD("scif3",	704,	R8A779A0_CLK_S1D8),
 	DEF_MOD("scif4",	705,	R8A779A0_CLK_S1D8),
+	DEF_MOD("vin00",	730,	R8A779A0_CLK_S1D1),
+	DEF_MOD("vin01",	731,	R8A779A0_CLK_S1D1),
+	DEF_MOD("vin02",	800,	R8A779A0_CLK_S1D1),
+	DEF_MOD("vin03",	801,	R8A779A0_CLK_S1D1),
+	DEF_MOD("vin04",	802,	R8A779A0_CLK_S1D1),
+	DEF_MOD("vin05",	803,	R8A779A0_CLK_S1D1),
+	DEF_MOD("vin06",	804,	R8A779A0_CLK_S1D1),
+	DEF_MOD("vin07",	805,	R8A779A0_CLK_S1D1),
+	DEF_MOD("vin10",	806,	R8A779A0_CLK_S1D1),
+	DEF_MOD("vin11",	807,	R8A779A0_CLK_S1D1),
+	DEF_MOD("vin12",	808,	R8A779A0_CLK_S1D1),
+	DEF_MOD("vin13",	809,	R8A779A0_CLK_S1D1),
+	DEF_MOD("vin14",	810,	R8A779A0_CLK_S1D1),
+	DEF_MOD("vin15",	811,	R8A779A0_CLK_S1D1),
+	DEF_MOD("vin16",	812,	R8A779A0_CLK_S1D1),
+	DEF_MOD("vin17",	813,	R8A779A0_CLK_S1D1),
+	DEF_MOD("vin20",	814,	R8A779A0_CLK_S1D1),
+	DEF_MOD("vin21",	815,	R8A779A0_CLK_S1D1),
+	DEF_MOD("vin22",	816,	R8A779A0_CLK_S1D1),
+	DEF_MOD("vin23",	817,	R8A779A0_CLK_S1D1),
+	DEF_MOD("vin24",	818,	R8A779A0_CLK_S1D1),
+	DEF_MOD("vin25",	819,	R8A779A0_CLK_S1D1),
+	DEF_MOD("vin26",	820,	R8A779A0_CLK_S1D1),
+	DEF_MOD("vin27",	821,	R8A779A0_CLK_S1D1),
+	DEF_MOD("vin30",	822,	R8A779A0_CLK_S1D1),
+	DEF_MOD("vin31",	823,	R8A779A0_CLK_S1D1),
+	DEF_MOD("vin32",	824,	R8A779A0_CLK_S1D1),
+	DEF_MOD("vin33",	825,	R8A779A0_CLK_S1D1),
+	DEF_MOD("vin34",	826,	R8A779A0_CLK_S1D1),
+	DEF_MOD("vin35",	827,	R8A779A0_CLK_S1D1),
+	DEF_MOD("vin36",	828,	R8A779A0_CLK_S1D1),
+	DEF_MOD("vin37",	829,	R8A779A0_CLK_S1D1),
 };
 
 static spinlock_t cpg_lock;
-- 
2.28.0

