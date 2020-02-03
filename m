Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5A922150204
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  3 Feb 2020 08:34:29 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727496AbgBCHe2 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 3 Feb 2020 02:34:28 -0500
Received: from de-deferred1.bosch-org.com ([139.15.180.216]:57432 "EHLO
        de-deferred1.bosch-org.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1727492AbgBCHe2 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 3 Feb 2020 02:34:28 -0500
Received: from de-out1.bosch-org.com (unknown [139.15.180.215])
        by si0vms0224.rbdmz01.com (Postfix) with ESMTPS id 489zwL2Tnyz3vf
        for <linux-renesas-soc@vger.kernel.org>; Mon,  3 Feb 2020 08:29:06 +0100 (CET)
Received: from si0vm1948.rbesz01.com (unknown [139.15.230.188])
        by fe0vms0186.rbdmz01.com (Postfix) with ESMTPS id 489zwJ6yLdz1XLFjn;
        Mon,  3 Feb 2020 08:29:04 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=de.bosch.com;
        s=key2-intmail; t=1580714945;
        bh=ul0SMSAiBsaiip7BfJdjyKRVdHBdnUWr88kZGQWxL1E=; l=10;
        h=From:Subject:From:Reply-To:Sender;
        b=J5wp65RJKSAZKZobGtAx8g5dJ6Qc8CRnDBwg7jrlCB/erdaXLWDTwrrsz8CO+pTfV
         eM1tMF4cJSraV4ENmz048uNTgVVb5XMjF6GEJ76jhUb699gXXx1rcM//GtWPwOgGZ9
         LBiIuWru/WR4RFJDFitC/W9eYUaXFelAFhujjhS8=
Received: from si0vm2082.rbesz01.com (unknown [10.58.172.176])
        by si0vm1948.rbesz01.com (Postfix) with ESMTPS id 489zwJ6Q8mz4R8;
        Mon,  3 Feb 2020 08:29:04 +0100 (CET)
X-AuditID: 0a3aad16-083ff70000004782-0e-5e37cbc02c65
Received: from fe0vm1652.rbesz01.com ( [10.58.173.29])
        (using TLS with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (Client did not present a certificate)
        by si0vm2082.rbesz01.com (SMG Outbound) with SMTP id 8B.8B.18306.0CBC73E5; Mon,  3 Feb 2020 08:29:04 +0100 (CET)
Received: from FE-HUB2000.de.bosch.com (unknown [10.4.103.109])
        by fe0vm1652.rbesz01.com (Postfix) with ESMTPS id 489zwJ50wkzB0v;
        Mon,  3 Feb 2020 08:29:04 +0100 (CET)
Received: from HI-Z0EVG.hi.de.bosch.com (10.34.218.219) by
 FE-HUB2000.de.bosch.com (10.4.103.109) with Microsoft SMTP Server id
 15.1.1847.3; Mon, 3 Feb 2020 08:29:04 +0100
From:   Dirk Behme <dirk.behme@de.bosch.com>
To:     <sergei.shtylyov@cogentembedded.com>, <geert+renesas@glider.be>,
        <linux-renesas-soc@vger.kernel.org>
CC:     <dirk.behme@de.bosch.com>
Subject: [PATCH 1/3] clk: renesas: r8a7795: Add RPC clocks
Date:   Mon, 3 Feb 2020 08:28:59 +0100
Message-ID: <20200203072901.31548-1-dirk.behme@de.bosch.com>
X-Mailer: git-send-email 2.20.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.34.218.219]
X-Brightmail-Tracker: H4sIAAAAAAAAA22Se1BMYRjG9ztntz6rk9NJ9VrSOGJCZaWUNA3G0NBMzTByjU3H7qqtZs+m
        ZNDUuG3MEKk2jJnUmKxr0sZQdlzSZTAu5RrDiBRRuTZyji27f/jv+Z73+73PfM98mGRKnBVY
        m2Lg9CmqZNZJLpWHn/IOqGsMjVfmFE0NO1KSj8Kq3n8kwpoqnjjPJqNeFgwQUfubA6J6zo+N
        JVfIIxK5ZO1GTj81cq1csz23D6WVu2Z+KT4qy0Y3hhsRxkAHQ15pjBHJMUMXElD6uVhqO5xE
        0Lyj0Ml2OIPgdHkPYUTDsBM9GWr27XIW9Uh6A9zNtUhFTdLeUP6m01nc6k6HQ9U5f9GW0r5Q
        +6nGSdQUHQF7q01/NdA+cOikkbD5bnC7+M3gGh/IrSohbRrg2rt3pO3+ODCbamT70AiTA2Jy
        QEwOyDFEViAPXqvcqAtShgUF6hM4Pks5LXBdqu48svXoaUFlDeutiMDIikIwwXpQtXUz4hnX
        hNTETRoVr1mjT0/meFZBbevcvZpx/2fz6Qk6Lc9rU1OsCDDJjqS2hofEM1SialMWp0+1YVY0
        GktZL0qNY1YxtFpl4JI4Lo3TD01nYcwCldEQGs+46Tk1l7lem2wYGrPeFJJIJIyn48QxlsDD
        rGg6dhGyjeIKik9T6XitehAfZcOZIdeONqBQhRf1TGRocapJT/mXqhhDta0SCvBwGNjJDvQY
        YcS6U3dE2EX4lPY8oLLFitwGTTsUVCYwdLsUjlr6EDz5biHgelcpCfuLbpBw/fIhGfS0dsvg
        xPtLGHY8L5CDufuhK/Q33veEC7dKAHp+dLFQb344EV507JoE3w8eDgRL9bkQeJDTGgGnu82R
        0NlcHQmVRTvnQevv+/PgzMCt+dB278oiqM8vi4ZX7VejYbflc6yQ8WiJcK8rDs5+q1wDj+uM
        Gmi72JwkbP6Q1CGUSQhlUkuDxTINKsN/yhx07a9TZKOZeVUtl9DC9glNWzrjxmbkrfA4YBq/
        bc5ctSzH5WPwuEavmzP7J2VaA+4O9z0VXeAX98vdpz38rV9Gy9Mtv29KF28+uycmv2z5kjEf
        Ys0Lmvx7l9V3G6a8rpS9npHVh3prf7q0fOv1iYzLq69dV+jfP6DjlV8kK4/XSL7O9Vb6be27
        0sBKeY1q2mRSz6v+AL7gv1QuBAAA
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Describe the RPCSRC internal clock and the RPC[D2] clocks derived from it,
as well as the RPC-IF module clock, in the R-Car H3 (R8A7795) CPG/MSSR
driver.

Inspired by commit 94e3935b5756 ("clk: renesas: r8a77980: Add RPC clocks").

Signed-off-by: Dirk Behme <dirk.behme@de.bosch.com>
---
Note: Patch done against today's clk-renesas in renesas-drivers.git

 drivers/clk/renesas/r8a7795-cpg-mssr.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/drivers/clk/renesas/r8a7795-cpg-mssr.c b/drivers/clk/renesas/r8a7795-cpg-mssr.c
index fbc8c75f4314..ff5b3020cb03 100644
--- a/drivers/clk/renesas/r8a7795-cpg-mssr.c
+++ b/drivers/clk/renesas/r8a7795-cpg-mssr.c
@@ -44,6 +44,7 @@ enum clk_ids {
 	CLK_S3,
 	CLK_SDSRC,
 	CLK_SSPSRC,
+	CLK_RPCSRC,
 	CLK_RINT,
 
 	/* Module Clocks */
@@ -70,6 +71,12 @@ static struct cpg_core_clk r8a7795_core_clks[] __initdata = {
 	DEF_FIXED(".s2",        CLK_S2,            CLK_PLL1_DIV2,  4, 1),
 	DEF_FIXED(".s3",        CLK_S3,            CLK_PLL1_DIV2,  6, 1),
 	DEF_FIXED(".sdsrc",     CLK_SDSRC,         CLK_PLL1_DIV2,  2, 1),
+	DEF_BASE(".rpcsrc",	CLK_RPCSRC, CLK_TYPE_GEN3_RPCSRC, CLK_PLL1),
+
+	DEF_BASE("rpc",		R8A7795_CLK_RPC, CLK_TYPE_GEN3_RPC,
+		 CLK_RPCSRC),
+	DEF_BASE("rpcd2",	R8A7795_CLK_RPCD2, CLK_TYPE_GEN3_RPCD2,
+		 R8A7795_CLK_RPC),
 
 	DEF_GEN3_OSC(".r",      CLK_RINT,          CLK_EXTAL,      32),
 
@@ -242,6 +249,7 @@ static struct mssr_mod_clk r8a7795_mod_clks[] __initdata = {
 	DEF_MOD("can-fd",		 914,	R8A7795_CLK_S3D2),
 	DEF_MOD("can-if1",		 915,	R8A7795_CLK_S3D4),
 	DEF_MOD("can-if0",		 916,	R8A7795_CLK_S3D4),
+	DEF_MOD("rpc-if",		 917,	R8A7795_CLK_RPCD2),
 	DEF_MOD("i2c6",			 918,	R8A7795_CLK_S0D6),
 	DEF_MOD("i2c5",			 919,	R8A7795_CLK_S0D6),
 	DEF_MOD("i2c-dvfs",		 926,	R8A7795_CLK_CP),
-- 
2.20.0

