Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5485C7E1636
	for <lists+linux-renesas-soc@lfdr.de>; Sun,  5 Nov 2023 21:08:37 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229594AbjKEUIg (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Sun, 5 Nov 2023 15:08:36 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55802 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229639AbjKEUIg (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Sun, 5 Nov 2023 15:08:36 -0500
Received: from mout-p-202.mailbox.org (mout-p-202.mailbox.org [80.241.56.172])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 175D4D8;
        Sun,  5 Nov 2023 12:08:33 -0800 (PST)
Received: from smtp102.mailbox.org (smtp102.mailbox.org [10.196.197.102])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mout-p-202.mailbox.org (Postfix) with ESMTPS id 4SNlsq3t15z9sb4;
        Sun,  5 Nov 2023 21:08:31 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
        t=1699214911;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=FaYe2BQGomcplxNjBFyGekzoFMPfvJlEGkyI54jKyaY=;
        b=fIYfw5t3sZqihyxi2dm5Vg90xFc9URm1l1LGOQxn3KkiccmVcuVaLoHesXzJugnpD7x1p7
        mjWGX9xuLGf3pUM4L1fcQ+jVGWxJe8D4thc88+vo1y9vtTIBQhb77N0Ie+Uv156bw92rP4
        Wq3jhSYLLkZiq0vkbY9L/rlJrsw21BLOuoqHAWH/ylZ17VPfScvcPMwQCTqxvBMOWY9c5p
        2Bg/zdT0lUBLshrvzat3PAWIEeRf8VAXA+Vrl5Ktisi4K0qUEsnhXLCjMRsWKuw/GoK5vz
        5FQUtK9c7PyGzLkz+NdLSL8AIivj+YSjJ9ThslKS6rY1wC94lodThsPNg8lF9w==
From:   Marek Vasut <marek.vasut+renesas@mailbox.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
        t=1699214909;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=FaYe2BQGomcplxNjBFyGekzoFMPfvJlEGkyI54jKyaY=;
        b=tSqBPwhh4E4TTL6wT2XEcx/3qknQe70bOCrPPmczpK/HIXpeMJVOe+H1MbXvGXZNbT7QCt
        jSiQYbvQTrOlsxNreWFm2KS9Py4clYOvoNng2+z/6u73/npJgPUZZ2NnliZw8D6I4jYZ0U
        QPDJD6OmQVla/vJ4dj4Is7DoDBBxwN9q3uMvmOPX1s3GXg8xUY6Wkb8Ylh6PLzCX9mk7Y0
        maXm1LX3IYuCA9crbOiqsWxPjYfm+QyolnqIHugnN0gsHOgBvo9SxlRg5ZV9Hh3R+nmR6s
        pK9TIccSbcs/8NPn4Nm0CK35CC6Biyrf0az1bLWJnsToOGyOi8Zebi0lEgNDqQ==
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
Subject: [PATCH 2/2] clk: rs9: Add support for 9FGV0841
Date:   Sun,  5 Nov 2023 21:07:59 +0100
Message-ID: <20231105200812.62849-2-marek.vasut+renesas@mailbox.org>
In-Reply-To: <20231105200812.62849-1-marek.vasut+renesas@mailbox.org>
References: <20231105200812.62849-1-marek.vasut+renesas@mailbox.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-MBO-RS-ID: 0bae51595360370d286
X-MBO-RS-META: eh1uzp5o46bwi7fojhwp9fxzg1c57xnh
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

This model is similar to 9FGV0441, the DIFx bits start at bit 0 again,
except this chip has 8 outputs. Adjust rs9_calc_dif() to special-case
the 9FGV0241 where DIFx bits start at 1. Extract only vendor ID from
VID register, the top 4 bits are revision ID which are not useful for
the vendor ID check.

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
 drivers/clk/clk-renesas-pcie.c | 23 +++++++++++++++++++----
 1 file changed, 19 insertions(+), 4 deletions(-)

diff --git a/drivers/clk/clk-renesas-pcie.c b/drivers/clk/clk-renesas-pcie.c
index 6606aba253c5..f8dd79b18d5a 100644
--- a/drivers/clk/clk-renesas-pcie.c
+++ b/drivers/clk/clk-renesas-pcie.c
@@ -7,6 +7,7 @@
  * Currently supported:
  *   - 9FGV0241
  *   - 9FGV0441
+ *   - 9FGV0841
  *
  * Copyright (C) 2022 Marek Vasut <marex@denx.de>
  */
@@ -42,6 +43,7 @@
 #define RS9_REG_DID				0x6
 #define RS9_REG_BCP				0x7
 
+#define RS9_REG_VID_MASK			GENMASK(3, 0)
 #define RS9_REG_VID_IDT				0x01
 
 #define RS9_REG_DID_TYPE_FGV			(0x0 << RS9_REG_DID_TYPE_SHIFT)
@@ -53,6 +55,7 @@
 enum rs9_model {
 	RENESAS_9FGV0241,
 	RENESAS_9FGV0441,
+	RENESAS_9FGV0841,
 };
 
 /* Structure to describe features of a particular 9-series model */
@@ -162,12 +165,15 @@ static u8 rs9_calc_dif(const struct rs9_driver_data *rs9, int idx)
 {
 	enum rs9_model model = rs9->chip_info->model;
 
+	/*
+	 * On 9FGV0241, the DIF OE0 is BIT(1) and DIF OE(1) is BIT(2),
+	 * on 9FGV0441 and 9FGV0841 the DIF OE0 is BIT(0) and so on.
+	 * Increment the index in the 9FGV0241 special case here.
+	 */
 	if (model == RENESAS_9FGV0241)
-		return BIT(idx + 1);
-	else if (model == RENESAS_9FGV0441)
-		return BIT(idx);
+		idx++;
 
-	return 0;
+	return BIT(idx);
 }
 
 static int rs9_get_output_config(struct rs9_driver_data *rs9, int idx)
@@ -333,6 +339,7 @@ static int rs9_probe(struct i2c_client *client)
 	if (ret < 0)
 		return ret;
 
+	vid &= RS9_REG_VID_MASK;
 	if (vid != RS9_REG_VID_IDT || did != rs9->chip_info->did)
 		return dev_err_probe(&client->dev, -ENODEV,
 				     "Incorrect VID/DID: %#02x, %#02x. Expected %#02x, %#02x\n",
@@ -391,9 +398,16 @@ static const struct rs9_chip_info renesas_9fgv0441_info = {
 	.did		= RS9_REG_DID_TYPE_FGV | 0x04,
 };
 
+static const struct rs9_chip_info renesas_9fgv0841_info = {
+	.model		= RENESAS_9FGV0841,
+	.num_clks	= 8,
+	.did		= RS9_REG_DID_TYPE_FGV | 0x08,
+};
+
 static const struct i2c_device_id rs9_id[] = {
 	{ "9fgv0241", .driver_data = (kernel_ulong_t)&renesas_9fgv0241_info },
 	{ "9fgv0441", .driver_data = (kernel_ulong_t)&renesas_9fgv0441_info },
+	{ "9fgv0841", .driver_data = (kernel_ulong_t)&renesas_9fgv0841_info },
 	{ }
 };
 MODULE_DEVICE_TABLE(i2c, rs9_id);
@@ -401,6 +415,7 @@ MODULE_DEVICE_TABLE(i2c, rs9_id);
 static const struct of_device_id clk_rs9_of_match[] = {
 	{ .compatible = "renesas,9fgv0241", .data = &renesas_9fgv0241_info },
 	{ .compatible = "renesas,9fgv0441", .data = &renesas_9fgv0441_info },
+	{ .compatible = "renesas,9fgv0841", .data = &renesas_9fgv0841_info },
 	{ }
 };
 MODULE_DEVICE_TABLE(of, clk_rs9_of_match);
-- 
2.42.0

