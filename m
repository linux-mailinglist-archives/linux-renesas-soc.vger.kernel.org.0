Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7D98665BFEA
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  3 Jan 2023 13:32:14 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237507AbjACMcK (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 3 Jan 2023 07:32:10 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34536 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230337AbjACMcH (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 3 Jan 2023 07:32:07 -0500
Received: from mx1.tq-group.com (mx1.tq-group.com [93.104.207.81])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BC94FFD39;
        Tue,  3 Jan 2023 04:32:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1672749126; x=1704285126;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=WfeauZQQ6shWtDpquveDvTrFGQ3JaGn25Hjtpe3ufdY=;
  b=gglGkWYB85DE8/bKTCKN07UdEBAU0R6C2Grl2D2hzf6QD5ouNo5JPjHf
   j3Toy1ybQeWOmRieUy1QKUSdCyZrmxEZ4ZGUQI0zZ2DQUCNsus7r4/43J
   tFHy75GINOXMDjGHUajYRHPjRwTR4HJa4DoKoXeOojUsJm74N+0HtnEVf
   rpveizImGdCfq9xST/RBy05xxjp56oOzg1KaFBwdQhy+6xHcrD+w0UQPg
   zuPWKbbM8ehWyVWAqOmRVDVLACdiiZ9lqyiw81Wo+MDf8FONKrNkbeGFZ
   Wbpj+ZrmDrdPONg21qP0nvXIUkmjSmS8BcCod/x4p7H5tfDL0cCfgoxQ1
   w==;
X-IronPort-AV: E=Sophos;i="5.96,296,1665439200"; 
   d="scan'208";a="28221135"
Received: from unknown (HELO tq-pgp-pr1.tq-net.de) ([192.168.6.15])
  by mx1-pgp.tq-group.com with ESMTP; 03 Jan 2023 13:31:59 +0100
Received: from mx1.tq-group.com ([192.168.6.7])
  by tq-pgp-pr1.tq-net.de (PGP Universal service);
  Tue, 03 Jan 2023 13:31:59 +0100
X-PGP-Universal: processed;
        by tq-pgp-pr1.tq-net.de on Tue, 03 Jan 2023 13:31:59 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1672749119; x=1704285119;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=WfeauZQQ6shWtDpquveDvTrFGQ3JaGn25Hjtpe3ufdY=;
  b=JnAMuLOLFKODOnp9GYUJJcuZ7Ec5+GYAy4aF3g2xhhlGp3sJoduNQjCs
   lE5TspTiRtcwLmmmb+FHPIUW0fliAT9cJV88F/+1MiDHoJayvedCJMQvi
   duascdZteIDFY4OfHBm0ufuy1dZDocs5lAwtaF5wcWXozG8z0VctqSFH4
   1dPfVPCsNw9cZeHG29+51KstIXvqVvNhuUQjeRaHGyXgAxyqn3RhPPerh
   9iEIgET740uWcb6UkVIPsnTnhQsel5rAb1OYZmZ0ItXiaAcJo1IlpgHUX
   FUMQjO59uiKgl/RKh7PO0pjpb0zUixI4Bb+7Xy3UeVaWDhEEbvtx4g3l7
   Q==;
X-IronPort-AV: E=Sophos;i="5.96,296,1665439200"; 
   d="scan'208";a="28221134"
Received: from vtuxmail01.tq-net.de ([10.115.0.20])
  by mx1.tq-group.com with ESMTP; 03 Jan 2023 13:31:59 +0100
Received: from steina-w.tq-net.de (unknown [10.123.53.21])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (No client certificate requested)
        by vtuxmail01.tq-net.de (Postfix) with ESMTPSA id 6EC86280072;
        Tue,  3 Jan 2023 13:31:59 +0100 (CET)
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
Subject: [PATCH 4/4] clk: rs9: Add support for 9FGV0441
Date:   Tue,  3 Jan 2023 13:31:54 +0100
Message-Id: <20230103123154.3424817-4-alexander.stein@ew.tq-group.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230103123154.3424817-1-alexander.stein@ew.tq-group.com>
References: <20230103123154.3424817-1-alexander.stein@ew.tq-group.com>
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
 drivers/clk/clk-renesas-pcie.c | 18 +++++++++++++++++-
 1 file changed, 17 insertions(+), 1 deletion(-)

diff --git a/drivers/clk/clk-renesas-pcie.c b/drivers/clk/clk-renesas-pcie.c
index d19b8e759eea..6095eacd4f8a 100644
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
@@ -66,7 +68,7 @@ struct rs9_driver_data {
 	struct regmap		*regmap;
 	const struct rs9_chip_info *chip_info;
 	struct clk		*pin_xin;
-	struct clk_hw		*clk_dif[2];
+	struct clk_hw		*clk_dif[4];
 	u8			pll_amplitude;
 	u8			pll_ssc;
 	u8			clk_dif_sr;
@@ -162,6 +164,11 @@ static u8 rs9fgv0241_calc_dif(int idx)
 	return BIT(idx) + 1;
 }
 
+static u8 rs9fgv0441_calc_dif(int idx)
+{
+	return BIT(idx);
+}
+
 static int rs9_get_output_config(struct rs9_driver_data *rs9, int idx)
 {
 	u8 dif = rs9->chip_info->calc_dif(idx);
@@ -378,14 +385,23 @@ static const struct rs9_chip_info renesas_9fgv0241_info = {
 	.calc_dif	= rs9fgv0241_calc_dif,
 };
 
+static const struct rs9_chip_info renesas_9fgv0441_info = {
+	.model		= RENESAS_9FGV0441,
+	.num_clks	= 4,
+	.did		= RS9_REG_DID_TYPE_FGV | 0x04,
+	.calc_dif	= rs9fgv0441_calc_dif,
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

