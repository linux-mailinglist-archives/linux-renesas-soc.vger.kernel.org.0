Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 80A365FCAF2
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 12 Oct 2022 20:48:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229651AbiJLSsp (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 12 Oct 2022 14:48:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50252 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229954AbiJLSsn (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 12 Oct 2022 14:48:43 -0400
Received: from mail.zeus03.de (www.zeus03.de [194.117.254.33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4D22ECC81C
        for <linux-renesas-soc@vger.kernel.org>; Wed, 12 Oct 2022 11:48:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple; d=sang-engineering.com; h=
        from:to:cc:subject:date:message-id:mime-version
        :content-transfer-encoding; s=k1; bh=1S9a4OZ52D1XnjOv86zX6+Bp5ai
        wO/1DPM8lPklobXE=; b=NbO3HU0hLXwpvfcblKcPJ3LdsDfNLi8QjoLCSukQ6F4
        fdqcf0PRKLRyraI9VGrryQ/fS5/D0NRVrjsZC2h10zJdTNEKuHlmvOzmm8Mm2DDQ
        DWlBrL/HPRZ+PQKN+NMKSUizUk7Z5o8d7c+soRyA4WLJq6WQNhzPwL8Qf+LtUmJI
        =
Received: (qmail 812256 invoked from network); 12 Oct 2022 20:48:40 +0200
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 12 Oct 2022 20:48:40 +0200
X-UD-Smtp-Session: l3s3148p1@5e9R19rqZOAgAwDtxxN7ABspc7EPVowl
From:   Wolfram Sang <wsa+renesas@sang-engineering.com>
To:     linux-clk@vger.kernel.org
Cc:     linux-renesas-soc@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>
Subject: [PATCH] clk: renesas: r8a779a0: Fix SD0H clock name
Date:   Wed, 12 Oct 2022 20:48:30 +0200
Message-Id: <20221012184830.3199-1-wsa+renesas@sang-engineering.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-1.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FORGED_SPF_HELO,
        RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_PASS,SPF_NONE
        autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Correct the misspelled textual name of the SD0H clock.

Fixes: 470e3f0d0b15 ("clk: renesas: rcar-gen4: Introduce R-Car Gen4 CPG driver")
Reported-by: Geert Uytterhoeven <geert+renesas@glider.be>
Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
---
 drivers/clk/renesas/r8a779a0-cpg-mssr.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/clk/renesas/r8a779a0-cpg-mssr.c b/drivers/clk/renesas/r8a779a0-cpg-mssr.c
index d74d46833012..e02542ca24a0 100644
--- a/drivers/clk/renesas/r8a779a0-cpg-mssr.c
+++ b/drivers/clk/renesas/r8a779a0-cpg-mssr.c
@@ -116,7 +116,7 @@ static const struct cpg_core_clk r8a779a0_core_clks[] __initconst = {
 	DEF_FIXED("cp",		R8A779A0_CLK_CP,	CLK_EXTAL,	2, 1),
 	DEF_FIXED("cl16mck",	R8A779A0_CLK_CL16MCK,	CLK_PLL1_DIV2,	64, 1),
 
-	DEF_GEN4_SDH("sdh0",	R8A779A0_CLK_SD0H,	CLK_SDSRC,	   0x870),
+	DEF_GEN4_SDH("sd0h",	R8A779A0_CLK_SD0H,	CLK_SDSRC,	   0x870),
 	DEF_GEN4_SD("sd0",	R8A779A0_CLK_SD0,	R8A779A0_CLK_SD0H, 0x870),
 
 	DEF_BASE("rpc",		R8A779A0_CLK_RPC, CLK_TYPE_GEN4_RPC, CLK_RPCSRC),
-- 
2.35.1

