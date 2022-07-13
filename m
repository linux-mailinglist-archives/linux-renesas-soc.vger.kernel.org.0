Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 97B905733EB
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 13 Jul 2022 12:15:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231969AbiGMKPB (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 13 Jul 2022 06:15:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40786 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229724AbiGMKPB (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 13 Jul 2022 06:15:01 -0400
Received: from mail.zeus03.de (www.zeus03.de [194.117.254.33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CBCBBDF380
        for <linux-renesas-soc@vger.kernel.org>; Wed, 13 Jul 2022 03:14:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple; d=sang-engineering.com; h=
        from:to:cc:subject:date:message-id:in-reply-to:references
        :mime-version:content-transfer-encoding; s=k1; bh=akr+yfBSg7uFzW
        Er5D2kr6ptekFjk5V9u8vnhb+Q9UQ=; b=kli/IrP5ydWe2cPfG/HqmZiPgOS48m
        fxKKQgvYR5Asc+4G0oIMlHIyySCpGhI5KRQRMXG/RDO+EEP2pWpfSBe5m4kh8lNj
        6yhgY8snZqBvVg1Curt0mGEZ1AvR11loVCTqs68ON+vESndK6kPLmbXVzD6jFK6h
        FobscyNUdR184=
Received: (qmail 126350 invoked from network); 13 Jul 2022 12:14:58 +0200
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 13 Jul 2022 12:14:58 +0200
X-UD-Smtp-Session: l3s3148p1@HEGfDq3jGIMgAwDtxwdRAEXXn+yo/Rze
From:   Wolfram Sang <wsa+renesas@sang-engineering.com>
To:     linux-renesas-soc@vger.kernel.org
Cc:     Wolfram Sang <wsa+renesas@sang-engineering.com>
Subject: [PATCH 1/3] clk: renesas: r8a779f0: Add CMT clocks
Date:   Wed, 13 Jul 2022 12:14:45 +0200
Message-Id: <20220713101447.3804-2-wsa+renesas@sang-engineering.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220713101447.3804-1-wsa+renesas@sang-engineering.com>
References: <20220713101447.3804-1-wsa+renesas@sang-engineering.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-1.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FORGED_SPF_HELO,
        RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_PASS,SPF_NONE,
        T_SCC_BODY_TEXT_LINE autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
---
 drivers/clk/renesas/r8a779f0-cpg-mssr.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/clk/renesas/r8a779f0-cpg-mssr.c b/drivers/clk/renesas/r8a779f0-cpg-mssr.c
index 0ce1ac978efd..555f747bf18d 100644
--- a/drivers/clk/renesas/r8a779f0-cpg-mssr.c
+++ b/drivers/clk/renesas/r8a779f0-cpg-mssr.c
@@ -133,6 +133,10 @@ static const struct mssr_mod_clk r8a779f0_mod_clks[] __initconst = {
 	DEF_MOD("sys-dmac0",	709,	R8A779F0_CLK_S0D3_PER),
 	DEF_MOD("sys-dmac1",	710,	R8A779F0_CLK_S0D3_PER),
 	DEF_MOD("wdt",		907,	R8A779F0_CLK_R),
+	DEF_MOD("cmt0",		910,	R8A779F0_CLK_R),
+	DEF_MOD("cmt1",		911,	R8A779F0_CLK_R),
+	DEF_MOD("cmt2",		912,	R8A779F0_CLK_R),
+	DEF_MOD("cmt3",		913,	R8A779F0_CLK_R),
 	DEF_MOD("pfc0",		915,	R8A779F0_CLK_CL16M),
 	DEF_MOD("ufs",		1514,	R8A779F0_CLK_S0D4_HSC),
 };
-- 
2.35.1

