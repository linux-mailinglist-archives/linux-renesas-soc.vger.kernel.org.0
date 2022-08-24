Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E46E359F7E3
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 24 Aug 2022 12:35:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236998AbiHXKff (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 24 Aug 2022 06:35:35 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54848 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235665AbiHXKfZ (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 24 Aug 2022 06:35:25 -0400
Received: from mail.zeus03.de (www.zeus03.de [194.117.254.33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0EE0B7B2A5
        for <linux-renesas-soc@vger.kernel.org>; Wed, 24 Aug 2022 03:35:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple; d=sang-engineering.com; h=
        from:to:cc:subject:date:message-id:in-reply-to:references
        :mime-version:content-transfer-encoding; s=k1; bh=Q0Afx8LZS8EjAY
        X0y5C1Ps3FFxtSSCVNoa+2bVQRXss=; b=mnFtsnSuKFwZ5oZT0J6be9yiwDYtsf
        HInPZNBBcPUJ//pV/zyyZBZ24CyzSZ3NaWiuntKoL+1NmTMGcyUvrOG8jTDfe77d
        PkIadI+0wO63aBs66IXXZ+z7r8vNT10lE3x/EUGH9LlXGOr0dg6TyPfpREOENtgO
        RkUjhcKA7IK3I=
Received: (qmail 2180829 invoked from network); 24 Aug 2022 12:35:22 +0200
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 24 Aug 2022 12:35:22 +0200
X-UD-Smtp-Session: l3s3148p1@ljrqPPrmeLMgAwDPXxw3AFlguiwjsjwa
From:   Wolfram Sang <wsa+renesas@sang-engineering.com>
To:     linux-renesas-soc@vger.kernel.org
Cc:     Wolfram Sang <wsa+renesas@sang-engineering.com>
Subject: [PATCH 1/4] clk: renesas: r8a779f0: Add MSIOF clocks
Date:   Wed, 24 Aug 2022 12:35:12 +0200
Message-Id: <20220824103515.54931-2-wsa+renesas@sang-engineering.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220824103515.54931-1-wsa+renesas@sang-engineering.com>
References: <20220824103515.54931-1-wsa+renesas@sang-engineering.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-1.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FORGED_SPF_HELO,
        RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_PASS,SPF_NONE,
        T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=no autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
---

For V3U, we also used "msiX" as clock names, so I followed that. I
wonder, though, if we shouldn't keep using "msiofX" and rename V3U as
well?

 drivers/clk/renesas/r8a779f0-cpg-mssr.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/clk/renesas/r8a779f0-cpg-mssr.c b/drivers/clk/renesas/r8a779f0-cpg-mssr.c
index 0faf13060ce8..adaed73097d7 100644
--- a/drivers/clk/renesas/r8a779f0-cpg-mssr.c
+++ b/drivers/clk/renesas/r8a779f0-cpg-mssr.c
@@ -131,6 +131,10 @@ static const struct mssr_mod_clk r8a779f0_mod_clks[] __initconst = {
 	DEF_MOD("i2c3",		521,	R8A779F0_CLK_S0D6_PER),
 	DEF_MOD("i2c4",		522,	R8A779F0_CLK_S0D6_PER),
 	DEF_MOD("i2c5",		523,	R8A779F0_CLK_S0D6_PER),
+	DEF_MOD("msi0",		618,	R8A779F0_CLK_MSO),
+	DEF_MOD("msi1",		619,	R8A779F0_CLK_MSO),
+	DEF_MOD("msi2",		620,	R8A779F0_CLK_MSO),
+	DEF_MOD("msi3",		621,	R8A779F0_CLK_MSO),
 	DEF_MOD("pcie0",	624,	R8A779F0_CLK_S0D2),
 	DEF_MOD("pcie1",	625,	R8A779F0_CLK_S0D2),
 	DEF_MOD("scif0",	702,	R8A779F0_CLK_S0D12_PER),
-- 
2.35.1

