Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C651C7E8B76
	for <lists+linux-renesas-soc@lfdr.de>; Sat, 11 Nov 2023 17:08:33 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231296AbjKKQIe (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Sat, 11 Nov 2023 11:08:34 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39444 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231286AbjKKQIe (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Sat, 11 Nov 2023 11:08:34 -0500
Received: from mout-p-202.mailbox.org (mout-p-202.mailbox.org [80.241.56.172])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0C6543A9B;
        Sat, 11 Nov 2023 08:08:30 -0800 (PST)
Received: from smtp1.mailbox.org (smtp1.mailbox.org [10.196.197.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mout-p-202.mailbox.org (Postfix) with ESMTPS id 4SSLG444Q0z9sgw;
        Sat, 11 Nov 2023 17:08:28 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
        t=1699718908;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=wGeUWANFg2PrwdqglwpH1vKWTach+nB0+HajbevIFAw=;
        b=rS9mTcI0Cd/7Zk8DMua1e1mlTFcddMYpv7lWoSnwHgXTHhxGs5Ik3txV5AxnaGk/wesu8u
        0Dlpebk0E4sgrAEzCvGwto4P7/xy+mgfv+QN1V5q43DsEkkTnmKfcI8m5BvdWKr+SpEcSB
        MVdZqo9xJvJqdU69Tdl02/MgqZW5taW04o0+lN6ua4EJs58Ua290PzWzZr61i/hQNTDIs2
        nCqlTuEfOMFYja9tmRnAVuFPtHETQIdnVEquY1J4tN6JMsqlV9gTpXeATXy/zOYbRwMq3u
        5ZPWmKd7De3+CiKaOEiuz5gcLPtMwsoDRQlwAgrti3VApY5LD64C7VfoS/LWBg==
From:   Marek Vasut <marek.vasut+renesas@mailbox.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
        t=1699718906;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=wGeUWANFg2PrwdqglwpH1vKWTach+nB0+HajbevIFAw=;
        b=GhfiuGlaBHsN785lkLWbw3Mul7IAYRvmGGUd+EgXp9+wSD5RCRd9rogCy1VuYxchV/VO6L
        HITiTTaQhe3JeAMZ2SPrpYO2uDNjCaySu8R0pCc9uQfy3RlkDn0+NAY1+oAhh78GLp59b3
        cOCNer9KDHYZxJmgr9BiPeiCo9rL3k3k9dp/VFKPJxk1bKtsiAM1Mg9tcHLvzV2xA+i7Wi
        pyj8vlkJ8DAX0l1Cgk2LFd0pnQg2uk/E7vdGZzndV/zCF3FgderUlXhQ3LZuzpxaDt4PYP
        vo41dOLVGaC7/XLE03G7jfewmlqH7DaHvh5mkxav6GC1ow+N/CPoF19QvFomAQ==
To:     linux-clk@vger.kernel.org
Cc:     Marek Vasut <marek.vasut+renesas@mailbox.org>,
        Alexander Stein <alexander.stein@ew.tq-group.com>,
        Conor Dooley <conor+dt@kernel.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Rob Herring <robh+dt@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>, devicetree@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org
Subject: [PATCH v2 3/4] clk: rs9: Replace model check with bitshift from chip data
Date:   Sat, 11 Nov 2023 17:07:01 +0100
Message-ID: <20231111160806.32954-3-marek.vasut+renesas@mailbox.org>
In-Reply-To: <20231111160806.32954-1-marek.vasut+renesas@mailbox.org>
References: <20231111160806.32954-1-marek.vasut+renesas@mailbox.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-MBO-RS-META: 8k1r5crkrw5yna5am7bhr81xonb5aii1
X-MBO-RS-ID: e556039b5d406acdb65
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Adjust rs9_calc_dif() to special-case the 9FGV0241 where DIFx bits
start at 1, encode this shift into chip data and drop the model
check entirely.

Signed-off-by: Marek Vasut <marek.vasut+renesas@mailbox.org>
---
Cc: Alexander Stein <alexander.stein@ew.tq-group.com>
Cc: Conor Dooley <conor+dt@kernel.org>
Cc: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc: Michael Turquette <mturquette@baylibre.com>
Cc: Rob Herring <robh+dt@kernel.org>
Cc: Stephen Boyd <sboyd@kernel.org>
Cc: devicetree@vger.kernel.org
Cc: linux-clk@vger.kernel.org
Cc: linux-renesas-soc@vger.kernel.org
---
V2: New patch
---
 drivers/clk/clk-renesas-pcie.c | 20 +++++++++-----------
 1 file changed, 9 insertions(+), 11 deletions(-)

diff --git a/drivers/clk/clk-renesas-pcie.c b/drivers/clk/clk-renesas-pcie.c
index b5c430e4899c..5064016afbc3 100644
--- a/drivers/clk/clk-renesas-pcie.c
+++ b/drivers/clk/clk-renesas-pcie.c
@@ -58,8 +58,8 @@ enum rs9_model {
 
 /* Structure to describe features of a particular 9-series model */
 struct rs9_chip_info {
-	const enum rs9_model	model;
 	unsigned int		num_clks;
+	u8			outshift;
 	u8			did;
 };
 
@@ -161,14 +161,12 @@ static const struct regmap_config rs9_regmap_config = {
 
 static u8 rs9_calc_dif(const struct rs9_driver_data *rs9, int idx)
 {
-	enum rs9_model model = rs9->chip_info->model;
-
-	if (model == RENESAS_9FGV0241)
-		return BIT(idx + 1);
-	else if (model == RENESAS_9FGV0441)
-		return BIT(idx);
-
-	return 0;
+	/*
+	 * On 9FGV0241, the DIF OE0 is BIT(1) and DIF OE(1) is BIT(2),
+	 * on 9FGV0441 and 9FGV0841 the DIF OE0 is BIT(0) and so on.
+	 * Increment the index in the 9FGV0241 special case here.
+	 */
+	return BIT(idx + rs9->chip_info->outshift);
 }
 
 static int rs9_get_output_config(struct rs9_driver_data *rs9, int idx)
@@ -382,14 +380,14 @@ static int __maybe_unused rs9_resume(struct device *dev)
 }
 
 static const struct rs9_chip_info renesas_9fgv0241_info = {
-	.model		= RENESAS_9FGV0241,
 	.num_clks	= 2,
+	.outshift	= 1,
 	.did		= RS9_REG_DID_TYPE_FGV | 0x02,
 };
 
 static const struct rs9_chip_info renesas_9fgv0441_info = {
-	.model		= RENESAS_9FGV0441,
 	.num_clks	= 4,
+	.outshift	= 0,
 	.did		= RS9_REG_DID_TYPE_FGV | 0x04,
 };
 
-- 
2.42.0

