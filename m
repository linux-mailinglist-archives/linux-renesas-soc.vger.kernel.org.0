Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id DB82453D3E3
	for <lists+linux-renesas-soc@lfdr.de>; Sat,  4 Jun 2022 01:34:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1348120AbiFCXeq (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 3 Jun 2022 19:34:46 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45016 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230239AbiFCXep (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 3 Jun 2022 19:34:45 -0400
Received: from mail.zeus03.de (www.zeus03.de [194.117.254.33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 87E81286F2
        for <linux-renesas-soc@vger.kernel.org>; Fri,  3 Jun 2022 16:34:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple; d=sang-engineering.com; h=
        from:to:cc:subject:date:message-id:mime-version
        :content-transfer-encoding; s=k1; bh=UFpMWJ3uLlmXGY2WT0PspbdEQyK
        4DcrRj7Xnf+HDyJ0=; b=WSBc8rAhNp43aQcL3dtTbR9qpj4t34azLHE1f1l8AQP
        euuGOIZdpHqYriQDIJEqtc5dgS5wPwAKk/12a9aC5przK0ZibFrqxicQh6Un1eDH
        Kzo0/Ng8SQMwMJpRzcB/PB53xAE/kj8x8J9uEwy/Cn07ODIWs7jTn/HOdwqyVS48
        =
Received: (qmail 1098475 invoked from network); 4 Jun 2022 01:34:42 +0200
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 4 Jun 2022 01:34:42 +0200
X-UD-Smtp-Session: l3s3148p1@dMkSkZPgimJZzIm6
From:   Wolfram Sang <wsa+renesas@sang-engineering.com>
To:     linux-clk@vger.kernel.org
Cc:     linux-renesas-soc@vger.kernel.org,
        Wolfram Sang <wsa+renesas@sang-engineering.com>
Subject: [PATCH] clk: renesas: r8a779f0: Add SDHI0 clock
Date:   Sat,  4 Jun 2022 01:34:37 +0200
Message-Id: <20220603233437.21819-1-wsa+renesas@sang-engineering.com>
X-Mailer: git-send-email 2.35.1
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

DTS patches will come soon. eMMC works fine, SD still needs to be
tested.

 drivers/clk/renesas/r8a779f0-cpg-mssr.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/clk/renesas/r8a779f0-cpg-mssr.c b/drivers/clk/renesas/r8a779f0-cpg-mssr.c
index 0aec5e8ffd96..e6f41b9f765a 100644
--- a/drivers/clk/renesas/r8a779f0-cpg-mssr.c
+++ b/drivers/clk/renesas/r8a779f0-cpg-mssr.c
@@ -128,6 +128,7 @@ static const struct mssr_mod_clk r8a779f0_mod_clks[] __initconst = {
 	DEF_MOD("scif1",	703,	R8A779F0_CLK_S0D12_PER),
 	DEF_MOD("scif3",	704,	R8A779F0_CLK_S0D12_PER),
 	DEF_MOD("scif4",	705,	R8A779F0_CLK_S0D12_PER),
+	DEF_MOD("sdhi0",        706,    R8A779F0_CLK_SD0),
 	DEF_MOD("sys-dmac0",	709,	R8A779F0_CLK_S0D3_PER),
 	DEF_MOD("sys-dmac1",	710,	R8A779F0_CLK_S0D3_PER),
 	DEF_MOD("wdt",		907,	R8A779F0_CLK_R),
-- 
2.35.1

