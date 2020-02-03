Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0FECD150203
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  3 Feb 2020 08:34:29 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727492AbgBCHe2 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 3 Feb 2020 02:34:28 -0500
Received: from de-deferred1.bosch-org.com ([139.15.180.216]:57436 "EHLO
        de-deferred1.bosch-org.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1727493AbgBCHe2 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 3 Feb 2020 02:34:28 -0500
Received: from de-out1.bosch-org.com (unknown [139.15.180.215])
        by si0vms0224.rbdmz01.com (Postfix) with ESMTPS id 489zwL2kw9z3vl
        for <linux-renesas-soc@vger.kernel.org>; Mon,  3 Feb 2020 08:29:06 +0100 (CET)
Received: from si0vm1948.rbesz01.com (unknown [139.15.230.188])
        by fe0vms0186.rbdmz01.com (Postfix) with ESMTPS id 489zwK1NGHz1XLFjq;
        Mon,  3 Feb 2020 08:29:05 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=de.bosch.com;
        s=key2-intmail; t=1580714945;
        bh=ul0SMSAiBsaiip7BfJdjyKRVdHBdnUWr88kZGQWxL1E=; l=10;
        h=From:Subject:From:Reply-To:Sender;
        b=RI0J/FZJ8czlISHEQu7HpWzc/TrHpT/YhHqpZWgqQYqSUV5vG7LmfvJ2lBTZDrfvq
         10Xg/14xeA0buni+7THU54OjJNANo+cllgc4wdwbDEF8kixKbozeAb2R1HqQ4l9Ydh
         DEYJCEpG7iORFh6vBnOnWMTTPqv0RTOZXh6Hk2qQ=
Received: from fe0vm1741.rbesz01.com (unknown [10.58.172.176])
        by si0vm1948.rbesz01.com (Postfix) with ESMTPS id 489zwK0ndmz4R7;
        Mon,  3 Feb 2020 08:29:05 +0100 (CET)
X-AuditID: 0a3aad15-119ff70000004734-e5-5e37cbc02d4e
Received: from fe0vm1652.rbesz01.com ( [10.58.173.29])
        (using TLS with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (Client did not present a certificate)
        by fe0vm1741.rbesz01.com (SMG Outbound) with SMTP id 19.57.18228.0CBC73E5; Mon,  3 Feb 2020 08:29:04 +0100 (CET)
Received: from FE-HUB2000.de.bosch.com (fe-hub2000.de.bosch.com [10.4.103.109])
        by fe0vm1652.rbesz01.com (Postfix) with ESMTPS id 489zwJ6YvLzB0x;
        Mon,  3 Feb 2020 08:29:04 +0100 (CET)
Received: from HI-Z0EVG.hi.de.bosch.com (10.34.218.219) by
 FE-HUB2000.de.bosch.com (10.4.103.109) with Microsoft SMTP Server id
 15.1.1847.3; Mon, 3 Feb 2020 08:29:04 +0100
From:   Dirk Behme <dirk.behme@de.bosch.com>
To:     <sergei.shtylyov@cogentembedded.com>, <geert+renesas@glider.be>,
        <linux-renesas-soc@vger.kernel.org>
CC:     <dirk.behme@de.bosch.com>
Subject: [PATCH 2/3] clk: renesas: r8a7796: Add RPC clocks
Date:   Mon, 3 Feb 2020 08:29:00 +0100
Message-ID: <20200203072901.31548-2-dirk.behme@de.bosch.com>
X-Mailer: git-send-email 2.20.0
In-Reply-To: <20200203072901.31548-1-dirk.behme@de.bosch.com>
References: <20200203072901.31548-1-dirk.behme@de.bosch.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.34.218.219]
X-Brightmail-Tracker: H4sIAAAAAAAAA22Sf0wTdxjG+d619Np57HoIvnaicjFuc8pgAyGAqAkxJCPRRDPN5nBlHG23
        0jZ3LSIGJGL8UaOggkNwxAQkTn4qMgsdllUaXRlRY51IZM5IUFgxmMaIP6Le0UL7x/577n3e
        z/vk++QInO6SqQidwcxyBrWeCVdIFKmtMav6BpJz4h+Npaf8UnccpXSNP8VS/jo/LFuHZ/1b
        /Q7LOja4Kst3cfEm/BtFeh6r1xWy3OcZ3yu0va/tUlNrRNGN7ruyMjTwgRXJCaASoW+yR2JF
        CoKmfsbAZW/F/B92BM2eyoDTjqCtyYeJSDi1ArorD8pEPZ/6EW6W2ySixqkYaBr1zswjqVQo
        23t0RkuoZVDR0xQuapJKh95LjTJ/9BI42WyduSmn1sA5q2tmhxZ29td0YP59Jfx5ajRwfwmU
        d9Xhfg3wx5MnuP9OLLTUdksrkbI2BKkNQWpDkDMIP4+i8tn4woKE5MSEOC6X5YvjE+J+MBZc
        RP6Go2xoajzfiTACOVESgTFRpKNvdQ4dkWvM26VV89odnEXP8oyK3OM99B0dOTfmLbkFOp7X
        GQ1OBATOzCdLU5NyaDJPvauY5Yx+zIk+IiTMAlJDbNxOUxq1mf2JZU0sN+umEQQD5E53cg6t
        5FgNW5Sv05tnbSaGRGFhYXR0qBMaixFyJ/qSmCdkW8UTJG9SF/A6TQBf6Mfp2WkQdaNk1QLy
        vshQoqu1GOZSVYvIB9uFAqJCjCA5ge4hAjGR5A0Rnif8rsE8IMvEipSBYRD64qzAUJVSqLc9
        RzA8bcOgf7IBh2M1Lhz67Sel4BuaksK58R4C9o9UK6Bl6k4EvBm4HQ2XrtUB1Pe4GPC9nGTg
        esud5fDPxMFPYbrqdBzYLl9IAs/eoXRom2rJAO/g5QzorDmQCUNvb2dC+7trG+DBrd6v4Prx
        s9lQ4e7IhoePr2TDIduzTULa31uE5cmt0PGicwfc67NqJ4QyMaFM8utEsUyz2vw/ZQamwdep
        ypDlROFmLrrY/XvJIngRNnbhM3mssmpsYrenbWlaezOYHGsNGkfDb/IrKq9Pajg1qrd3Vv9X
        8Xh43+Gmjz/sN+YN/npVcmRlqbyofsSctc96uiJty3Shhx10v/x2xLPecTdyM+whG191e7Xt
        JSbvUpdrW+wnRGZ2veT+GotDb6piJLxWnbAC53j1e5u+THBIBAAA
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Describe the RPCSRC internal clock and the RPC[D2] clocks derived from it,
as well as the RPC-IF module clock, in the R-Car M3 (R8A7796) CPG/MSSR
driver.

Inspired by commit 94e3935b5756 ("clk: renesas: r8a77980: Add RPC clocks").

Signed-off-by: Dirk Behme <dirk.behme@de.bosch.com>
---
Note: Patch done against today's clk-renesas in renesas-drivers.git

 drivers/clk/renesas/r8a7796-cpg-mssr.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/drivers/clk/renesas/r8a7796-cpg-mssr.c b/drivers/clk/renesas/r8a7796-cpg-mssr.c
index e8420d3ada94..ba8e20d1ad75 100644
--- a/drivers/clk/renesas/r8a7796-cpg-mssr.c
+++ b/drivers/clk/renesas/r8a7796-cpg-mssr.c
@@ -46,6 +46,7 @@ enum clk_ids {
 	CLK_S3,
 	CLK_SDSRC,
 	CLK_SSPSRC,
+	CLK_RPCSRC,
 	CLK_RINT,
 
 	/* Module Clocks */
@@ -72,6 +73,12 @@ static const struct cpg_core_clk r8a7796_core_clks[] __initconst = {
 	DEF_FIXED(".s2",        CLK_S2,            CLK_PLL1_DIV2,  4, 1),
 	DEF_FIXED(".s3",        CLK_S3,            CLK_PLL1_DIV2,  6, 1),
 	DEF_FIXED(".sdsrc",     CLK_SDSRC,         CLK_PLL1_DIV2,  2, 1),
+	DEF_BASE(".rpcsrc",	CLK_RPCSRC, CLK_TYPE_GEN3_RPCSRC, CLK_PLL1),
+
+	DEF_BASE("rpc",		R8A7796_CLK_RPC, CLK_TYPE_GEN3_RPC,
+		 CLK_RPCSRC),
+	DEF_BASE("rpcd2",	R8A7796_CLK_RPCD2, CLK_TYPE_GEN3_RPCD2,
+		 R8A7796_CLK_RPC),
 
 	DEF_GEN3_OSC(".r",      CLK_RINT,          CLK_EXTAL,      32),
 
@@ -215,6 +222,7 @@ static struct mssr_mod_clk r8a7796_mod_clks[] __initdata = {
 	DEF_MOD("can-fd",		 914,	R8A7796_CLK_S3D2),
 	DEF_MOD("can-if1",		 915,	R8A7796_CLK_S3D4),
 	DEF_MOD("can-if0",		 916,	R8A7796_CLK_S3D4),
+	DEF_MOD("rpc-if",		 917,	R8A7796_CLK_RPCD2),
 	DEF_MOD("i2c6",			 918,	R8A7796_CLK_S0D6),
 	DEF_MOD("i2c5",			 919,	R8A7796_CLK_S0D6),
 	DEF_MOD("i2c-dvfs",		 926,	R8A7796_CLK_CP),
-- 
2.20.0

