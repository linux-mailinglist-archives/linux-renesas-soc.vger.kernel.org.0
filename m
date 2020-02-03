Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8E552150202
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  3 Feb 2020 08:34:28 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727276AbgBCHe1 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 3 Feb 2020 02:34:27 -0500
Received: from de-deferred2.bosch-org.com ([139.15.180.217]:33102 "EHLO
        de-deferred2.bosch-org.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1727480AbgBCHe1 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 3 Feb 2020 02:34:27 -0500
X-Greylist: delayed 319 seconds by postgrey-1.27 at vger.kernel.org; Mon, 03 Feb 2020 02:34:26 EST
Received: from de-out1.bosch-org.com (unknown [139.15.180.215])
        by fe0vms0193.rbdmz01.com (Postfix) with ESMTPS id 489zwL38Ldz2gH
        for <linux-renesas-soc@vger.kernel.org>; Mon,  3 Feb 2020 08:29:06 +0100 (CET)
Received: from fe0vm1650.rbesz01.com (unknown [139.15.230.188])
        by si0vms0216.rbdmz01.com (Postfix) with ESMTPS id 489zwK1hX4z1XLm4K;
        Mon,  3 Feb 2020 08:29:05 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=de.bosch.com;
        s=key2-intmail; t=1580714945;
        bh=ul0SMSAiBsaiip7BfJdjyKRVdHBdnUWr88kZGQWxL1E=; l=10;
        h=From:Subject:From:Reply-To:Sender;
        b=Qy1cs20fmR0NBoHqpDkgEbedip1fQKvVWQMt1u6bCcepjkp3bWoSh5BtulFgLE+fs
         3EYngbrW5EGWN+tUAg3Njt0Pm+6gUJA+ss/LYFg88FlppxjTnlHxAFN+5+kZpAn0aM
         I5dZEQwkiwI/Wf6xWJ7C/MF7D61mSiR7MXlVwTm8=
Received: from fe0vm02900.rbesz01.com (unknown [10.58.172.176])
        by fe0vm1650.rbesz01.com (Postfix) with ESMTPS id 489zwK1FlQz1rM;
        Mon,  3 Feb 2020 08:29:05 +0100 (CET)
X-AuditID: 0a3aad0c-75dff70000004730-5b-5e37cbc14fb3
Received: from si0vm1949.rbesz01.com ( [10.58.173.29])
        (using TLS with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (Client did not present a certificate)
        by fe0vm02900.rbesz01.com (SMG Outbound) with SMTP id 33.45.18224.1CBC73E5; Mon,  3 Feb 2020 08:29:05 +0100 (CET)
Received: from FE-HUB2000.de.bosch.com (unknown [10.4.103.109])
        by si0vm1949.rbesz01.com (Postfix) with ESMTPS id 489zwK03k7z6CjZNj;
        Mon,  3 Feb 2020 08:29:05 +0100 (CET)
Received: from HI-Z0EVG.hi.de.bosch.com (10.34.218.219) by
 FE-HUB2000.de.bosch.com (10.4.103.109) with Microsoft SMTP Server id
 15.1.1847.3; Mon, 3 Feb 2020 08:29:04 +0100
From:   Dirk Behme <dirk.behme@de.bosch.com>
To:     <sergei.shtylyov@cogentembedded.com>, <geert+renesas@glider.be>,
        <linux-renesas-soc@vger.kernel.org>
CC:     <dirk.behme@de.bosch.com>
Subject: [PATCH 3/3] clk: renesas: r8a77965: Add RPC clocks
Date:   Mon, 3 Feb 2020 08:29:01 +0100
Message-ID: <20200203072901.31548-3-dirk.behme@de.bosch.com>
X-Mailer: git-send-email 2.20.0
In-Reply-To: <20200203072901.31548-1-dirk.behme@de.bosch.com>
References: <20200203072901.31548-1-dirk.behme@de.bosch.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.34.218.219]
X-Brightmail-Tracker: H4sIAAAAAAAAA22Se0xTZxjG+c5p4aNy2OGA8K6OgWdqhEQsTIQBki1BQyJh/kEwEQRbObad
        3HJO8To2MgdiyeaVpsI0GIEZBgVRQoHppFJlFSMGL0i8LasTCRhI42Vm0Z1DwfYP/3u/53l/
        75Pz5GCS6fJTYn2xgeOL1YWsr0KmSGoLX9F/LSFP1fBYlnii/ghK7Hr2nEgcahnz+5JMf1z7
        jkg/fH1Fuqvz0w3kJkVKAVeo38HxK1O3KHT3j5vkpRWBu9p/PCirQM4FRuSPgV4Fb9rtyIgU
        mKHNBFS2/U64HxYE1pc1cvejHYGl2UVIiC8dDT2Hqv2kOYT+Bob3WWXSTNLh0OycnNWD6WRw
        tAzN7svoJdA487O4gzFFp8C4KcqdHAGm34yzK/70GjhjtPtKMyOuVJk7ZnWKDoI/jzvnzkfA
        vq560j0D9I+Pk+47i6G1rkd+CAXVeSF1XkidF9KAyBYUuo1T7ShSxX2hUsXwGk7Yo4qN2VpS
        1IncDQdYkb1Ra0MERjYUjwl2IfXHpdV5TKCmpGC3Ti3o8vmyQk5gldT3kwc2M8HvZaFMU6QX
        BH1JsQ0BJtkQ6ruk+DyGKlDv3sPxJW7MhhZhGRtGafHXuQytVRu47RxXyvHzbjLGLFA7HQl5
        TBDPabld2/SFhnmbDaeQj48PE+rteMcS2N+GPscBYrZROkEJpeoiQa+dwz9248y86kEdKEEZ
        Rt2XGFpydWXF71OVn1CPcsUCFnoZHnIC3UMYscHUDQkOEH9XTx5QFVJFQXOiB4prEhn6qBxO
        Wl8gGHttJWBg6jQJh812Egb6THJwjU7L4cyzXgxVD2oV0Dp9OxD+uzYSCuev1gOc7LWz4Pp3
        ioXB1tvL4OFEdRS8PvZLDFi7z8bDrR9GU8Ay3ZoKk9e7U+GceX8ajL4dSYP2d1fXwaObF9bD
        4JGmDDjo6MiAv55ezIAD1pkNYtqdLHF5aiN0vDqXD/cuGXUTYpmEWCaVvUoq06A2fKDMOdXz
        dcoKlMQ3mEYsGR/V7GzKuTD4KiQkdyhu6VbnomE+U+nqX63ITIuxbb61V3Exs6+xc39/3xNH
        +kbNFeONv1eav42/HKstr7Qzw3fXZpvON1d9xWf+UyNYLD+dnQFXsjnydP6plDf66rGnWctz
        Ij9rWVzeWPmrT+jLsPUaZ/2TSNtbY2e5gZUJOnVsNMkL6v8BO6c260gEAAA=
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Describe the RPCSRC internal clock and the RPC[D2] clocks derived from it,
as well as the RPC-IF module clock, in the R-Car M3N (R8A77965) CPG/MSSR
driver.

Inspired by commit 94e3935b5756 ("clk: renesas: r8a77980: Add RPC clocks").

Signed-off-by: Dirk Behme <dirk.behme@de.bosch.com>
---
Note: Patch done against today's clk-renesas in renesas-drivers.git

 drivers/clk/renesas/r8a77965-cpg-mssr.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/drivers/clk/renesas/r8a77965-cpg-mssr.c b/drivers/clk/renesas/r8a77965-cpg-mssr.c
index b3af4da2ca74..2f86b15620fb 100644
--- a/drivers/clk/renesas/r8a77965-cpg-mssr.c
+++ b/drivers/clk/renesas/r8a77965-cpg-mssr.c
@@ -43,6 +43,7 @@ enum clk_ids {
 	CLK_S3,
 	CLK_SDSRC,
 	CLK_SSPSRC,
+	CLK_RPCSRC,
 	CLK_RINT,
 
 	/* Module Clocks */
@@ -68,6 +69,12 @@ static const struct cpg_core_clk r8a77965_core_clks[] __initconst = {
 	DEF_FIXED(".s2",	CLK_S2,			CLK_PLL1_DIV2,	4, 1),
 	DEF_FIXED(".s3",	CLK_S3,			CLK_PLL1_DIV2,	6, 1),
 	DEF_FIXED(".sdsrc",	CLK_SDSRC,		CLK_PLL1_DIV2,	2, 1),
+	DEF_BASE(".rpcsrc",	CLK_RPCSRC, CLK_TYPE_GEN3_RPCSRC, CLK_PLL1),
+
+	DEF_BASE("rpc",		R8A77965_CLK_RPC, CLK_TYPE_GEN3_RPC,
+		 CLK_RPCSRC),
+	DEF_BASE("rpcd2",	R8A77965_CLK_RPCD2, CLK_TYPE_GEN3_RPCD2,
+		 R8A77965_CLK_RPC),
 
 	DEF_GEN3_OSC(".r",	CLK_RINT,		CLK_EXTAL,	32),
 
@@ -215,6 +222,7 @@ static const struct mssr_mod_clk r8a77965_mod_clks[] __initconst = {
 	DEF_MOD("can-fd",		914,	R8A77965_CLK_S3D2),
 	DEF_MOD("can-if1",		915,	R8A77965_CLK_S3D4),
 	DEF_MOD("can-if0",		916,	R8A77965_CLK_S3D4),
+	DEF_MOD("rpc-if",		917,	R8A77965_CLK_RPCD2),
 	DEF_MOD("i2c6",			918,	R8A77965_CLK_S0D6),
 	DEF_MOD("i2c5",			919,	R8A77965_CLK_S0D6),
 	DEF_MOD("i2c-dvfs",		926,	R8A77965_CLK_CP),
-- 
2.20.0

