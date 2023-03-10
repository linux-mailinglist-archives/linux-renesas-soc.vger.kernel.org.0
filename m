Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5B3C76B37E1
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 10 Mar 2023 08:55:59 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230034AbjCJHz6 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 10 Mar 2023 02:55:58 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35778 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229751AbjCJHz5 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 10 Mar 2023 02:55:57 -0500
Received: from mx1.tq-group.com (mx1.tq-group.com [93.104.207.81])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 65F80E0624;
        Thu,  9 Mar 2023 23:55:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1678434956; x=1709970956;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=x6fWEKzRp4EyH7sl18efFBbE9f9nwdcsdY/tosLvcNQ=;
  b=VgOc33o2t4wPfgufSDMMxKjVk35gurlH59aTMufiHZXgBxvmSrenPhSL
   wQhjr6Y0KNVOMRxSUIdNn+t7HlpsnzswKVpDhGb+aPLz8G9AdKc+oRPKM
   SGMshzE72QdZxGd/KryaSPc6Csboj2/OXDbRKFfDqecGAb4Zhf029ymqr
   mlcDV1aUrfGeRyfvg+3La1joVmsX+HCb8OqelRu+2M9QdOTwlyzSTCOo0
   IwiMLf30fIpmittwl0Gn+t9suIb40ppUkHgAc0MqQCREZI4+KI933ctrf
   o8I1iTZK32lQEPIKTbnW3zN0jL2A85shAlXt4Eh618h284YuqmF53LIRV
   g==;
X-IronPort-AV: E=Sophos;i="5.98,249,1673910000"; 
   d="scan'208";a="29597128"
Received: from unknown (HELO tq-pgp-pr1.tq-net.de) ([192.168.6.15])
  by mx1-pgp.tq-group.com with ESMTP; 10 Mar 2023 08:55:44 +0100
Received: from mx1.tq-group.com ([192.168.6.7])
  by tq-pgp-pr1.tq-net.de (PGP Universal service);
  Fri, 10 Mar 2023 08:55:44 +0100
X-PGP-Universal: processed;
        by tq-pgp-pr1.tq-net.de on Fri, 10 Mar 2023 08:55:44 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1678434944; x=1709970944;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=x6fWEKzRp4EyH7sl18efFBbE9f9nwdcsdY/tosLvcNQ=;
  b=h3av136E+ombsMsAEuE5/KMoV++uuVftswP9tZCtPCPIVqxh53qKvCXX
   BF9gdWkb7Fu8oTjcaWa3nWUc808+P+IRKjNKdENKgDDr0bnaDqQMZeCMK
   7XBvqAbw2h9ubXkHDvw+sfTBN2vzORNvgzv9kWAAtSyuM0ocYgmFvyMC/
   uQ+flr729KnfrDxXjmei1fZKokd0nGp0gyZEGBz7wPdWO1YH4szb3yKVY
   NPH52jnzKbQRSCO/jFwSJekKrg4i9xGs4COzWyMT6G1TyabtconaqRNGh
   BSOhWBU5gUCVnEM1bPi8WxsrZp0tuvYDGKsiKwyQwZDGz2u8InmNg+y20
   w==;
X-IronPort-AV: E=Sophos;i="5.98,249,1673910000"; 
   d="scan'208";a="29597127"
Received: from vtuxmail01.tq-net.de ([10.115.0.20])
  by mx1.tq-group.com with ESMTP; 10 Mar 2023 08:55:44 +0100
Received: from steina-w.tq-net.de (unknown [10.123.53.21])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (No client certificate requested)
        by vtuxmail01.tq-net.de (Postfix) with ESMTPSA id 15273280072;
        Fri, 10 Mar 2023 08:55:44 +0100 (CET)
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
Subject: [PATCH v3 4/4] clk: rs9: Add support for 9FGV0441
Date:   Fri, 10 Mar 2023 08:55:35 +0100
Message-Id: <20230310075535.3476580-4-alexander.stein@ew.tq-group.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230310075535.3476580-1-alexander.stein@ew.tq-group.com>
References: <20230310075535.3476580-1-alexander.stein@ew.tq-group.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

This model is similar to 9FGV0241, but the DIFx bits start at bit 0.

Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>
Reviewed-by: Marek Vasut <marex@denx.de>
---
Changes in v3:
* Rebased to current next branch
* Added Marek's R-b

 drivers/clk/clk-renesas-pcie.c | 14 +++++++++++++-
 1 file changed, 13 insertions(+), 1 deletion(-)

diff --git a/drivers/clk/clk-renesas-pcie.c b/drivers/clk/clk-renesas-pcie.c
index 0036bd18c559..6799fb0fa2d3 100644
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
@@ -64,7 +66,7 @@ struct rs9_driver_data {
 	struct i2c_client	*client;
 	struct regmap		*regmap;
 	const struct rs9_chip_info *chip_info;
-	struct clk_hw		*clk_dif[2];
+	struct clk_hw		*clk_dif[4];
 	u8			pll_amplitude;
 	u8			pll_ssc;
 	u8			clk_dif_sr;
@@ -161,6 +163,8 @@ static u8 rs9_calc_dif(const struct rs9_driver_data *rs9, int idx)
 
 	if (model == RENESAS_9FGV0241)
 		return BIT(idx) + 1;
+	else if (model == RENESAS_9FGV0441)
+		return BIT(idx);
 
 	return 0;
 }
@@ -380,14 +384,22 @@ static const struct rs9_chip_info renesas_9fgv0241_info = {
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

