Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 028FB663D6E
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 10 Jan 2023 11:00:23 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237867AbjAJKAU (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 10 Jan 2023 05:00:20 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60894 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231366AbjAJKAR (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 10 Jan 2023 05:00:17 -0500
Received: from mx1.tq-group.com (mx1.tq-group.com [93.104.207.81])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A5ECE4D721;
        Tue, 10 Jan 2023 02:00:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1673344816; x=1704880816;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=JrqJJ8n6ROHrUqOqAhHFlxJllYmWeOes/o+dRRHZXnU=;
  b=mGXwUhBM7Plg/uL6e6DUDcTBLUQ9XqbZgG8jDWdthrWK3vTlsPg9VaPp
   djAK9nW54SU7+6SDA3W/4sqwir0KqgWHEDHjj8uqosiWVRrWYRtjUQZL2
   TVJDijPxQ4tMp7JZp8sbOhCWKcjs7apnXKkNL8/iiLDSx29jKeuvEBIlq
   Ebd3gAxbeWBZopVCt/U89iVhlmUewiRaUo/pNPFJJ/2M4gYFy2WPelfun
   ILDQVdzeS0uw8eF3lhp37R3tDkwO0LiY4Mi9/L/wA+TxcvLDJHClemWAL
   tkKEUZNY/zYfzn+nPQR7i5uDVngW7u/Jl/SCYYy70W4w83KXCO5hpafWw
   w==;
X-IronPort-AV: E=Sophos;i="5.96,314,1665439200"; 
   d="scan'208";a="28324375"
Received: from unknown (HELO tq-pgp-pr1.tq-net.de) ([192.168.6.15])
  by mx1-pgp.tq-group.com with ESMTP; 10 Jan 2023 11:00:10 +0100
Received: from mx1.tq-group.com ([192.168.6.7])
  by tq-pgp-pr1.tq-net.de (PGP Universal service);
  Tue, 10 Jan 2023 11:00:10 +0100
X-PGP-Universal: processed;
        by tq-pgp-pr1.tq-net.de on Tue, 10 Jan 2023 11:00:10 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1673344810; x=1704880810;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=JrqJJ8n6ROHrUqOqAhHFlxJllYmWeOes/o+dRRHZXnU=;
  b=HPT3FJDD9MhSSu1AaWPHNd6V6APg5v4l8K11nbtWiqBa6ZGYMmJeGsBd
   UfAjp/KnZjCsIGcb9dMoYkoxI3Q+uragV9zFRBkJerce733rZEP85RXhN
   +G7pFtxR8iwIWzhUrf/YPXbuegil+IX6gPncKrskOsKvAPBXBck9sctfO
   UZKWk6uvSIqy82AOC9Rsp+1qRE0SHm3yyjOoOGIvZfxuQIKUhRfX1UbJr
   H6RmvwD7UbRRIfqxQCsU6Mzh4YXgZU4ynL5PnxNOdLbUwULtvS7FPITGW
   hHtbnWKyOW11T5NJmyl9m5POAcQCLqPAzzqo2cbpw8fX4d2RfXo10z+jf
   g==;
X-IronPort-AV: E=Sophos;i="5.96,314,1665439200"; 
   d="scan'208";a="28324373"
Received: from vtuxmail01.tq-net.de ([10.115.0.20])
  by mx1.tq-group.com with ESMTP; 10 Jan 2023 11:00:10 +0100
Received: from steina-w.tq-net.de (unknown [10.123.53.21])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (No client certificate requested)
        by vtuxmail01.tq-net.de (Postfix) with ESMTPSA id D6688280056;
        Tue, 10 Jan 2023 11:00:09 +0100 (CET)
From:   Alexander Stein <alexander.stein@ew.tq-group.com>
To:     Geert Uytterhoeven <geert+renesas@glider.be>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Marek Vasut <marex@denx.de>
Cc:     Alexander Stein <alexander.stein@ew.tq-group.com>,
        linux-renesas-soc@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org
Subject: [PATCH v2 4/4] clk: rs9: Add support for 9FGV0441
Date:   Tue, 10 Jan 2023 11:00:03 +0100
Message-Id: <20230110100003.370917-4-alexander.stein@ew.tq-group.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230110100003.370917-1-alexander.stein@ew.tq-group.com>
References: <20230110100003.370917-1-alexander.stein@ew.tq-group.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

This model is similar to 9FGV0241, but the DIFx bits start at bit 0.

Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>
---
Changes in v2:
* Adjust to common DIF calculation function

 drivers/clk/clk-renesas-pcie.c | 14 +++++++++++++-
 1 file changed, 13 insertions(+), 1 deletion(-)

diff --git a/drivers/clk/clk-renesas-pcie.c b/drivers/clk/clk-renesas-pcie.c
index 6b19186228238..a4ebb224181bf 100644
--- a/drivers/clk/clk-renesas-pcie.c
+++ b/drivers/clk/clk-renesas-pcie.c
@@ -6,6 +6,7 @@
  *   - 9FGV/9DBV/9DMV/9FGL/9DML/9QXL/9SQ
  * Currently supported:
  *   - 9FGV0241
+ *   - 9FGV0441
  *
  * Copyright (C) 2022 Marek Vasut <marex@denx.de>
  */
@@ -51,6 +52,7 @@
 /* Supported Renesas 9-series models. */
 enum rs9_model {
 	RENESAS_9FGV0241,
+	RENESAS_9FGV0441,
 };
 
 /* Structure to describe features of a particular 9-series model */
@@ -65,7 +67,7 @@ struct rs9_driver_data {
 	struct regmap		*regmap;
 	const struct rs9_chip_info *chip_info;
 	struct clk		*pin_xin;
-	struct clk_hw		*clk_dif[2];
+	struct clk_hw		*clk_dif[4];
 	u8			pll_amplitude;
 	u8			pll_ssc;
 	u8			clk_dif_sr;
@@ -162,6 +164,8 @@ static u8 rs9_calc_dif(const struct rs9_driver_data *rs9, int idx)
 
 	if (model == RENESAS_9FGV0241)
 		return BIT(idx) + 1;
+	else if (model == RENESAS_9FGV0441)
+		return BIT(idx);
 
 	return 0;
 }
@@ -381,14 +385,22 @@ static const struct rs9_chip_info renesas_9fgv0241_info = {
 	.did		= RS9_REG_DID_TYPE_FGV | 0x02,
 };
 
+static const struct rs9_chip_info renesas_9fgv0441_info = {
+	.model		= RENESAS_9FGV0441,
+	.num_clks	= 4,
+	.did		= RS9_REG_DID_TYPE_FGV | 0x04,
+};
+
 static const struct i2c_device_id rs9_id[] = {
 	{ "9fgv0241", .driver_data = RENESAS_9FGV0241 },
+	{ "9fgv0441", .driver_data = RENESAS_9FGV0441 },
 	{ }
 };
 MODULE_DEVICE_TABLE(i2c, rs9_id);
 
 static const struct of_device_id clk_rs9_of_match[] = {
 	{ .compatible = "renesas,9fgv0241", .data = &renesas_9fgv0241_info },
+	{ .compatible = "renesas,9fgv0441", .data = &renesas_9fgv0441_info },
 	{ }
 };
 MODULE_DEVICE_TABLE(of, clk_rs9_of_match);
-- 
2.34.1

