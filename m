Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A5FA4663D6A
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 10 Jan 2023 11:00:21 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232181AbjAJKAS (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 10 Jan 2023 05:00:18 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60892 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232098AbjAJKAQ (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 10 Jan 2023 05:00:16 -0500
Received: from mx1.tq-group.com (mx1.tq-group.com [93.104.207.81])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3DAF349160;
        Tue, 10 Jan 2023 02:00:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1673344815; x=1704880815;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=OpyU2u3JwxCEt2shuTLxvexaElmrVfcsDNUb55UupXg=;
  b=C/ZKpnwuu1xbM3szl2O40pX9v+pE7hdNNvIsWdKvO2cxN8dqbaU4b2sY
   mYd0hkmzUq9MR/EteRPudBwQNp6Ge07t6so5pcGyx4LzkXWnl30/7C/d2
   VFni1zT/QBv6bFshlyD4Ilz5K5ngn4BIFYE476XSgReXJTXoskdjfYHCz
   M1QdqXeQIQdpTGsnmrYJIHTw5qCzBEmCI3l7Xqby1rrK4QImMMQUFHUOW
   d6qD1mhdAYsC4ljadJYT/kWhWmayyX3dTLMiMTgidPngFo2qZdijXnWjP
   6DfX1tfz4e20Vur27zJmYOsj+pYuTFSPu3VsXz0Qg6/hc/9zkG5v8k6JS
   A==;
X-IronPort-AV: E=Sophos;i="5.96,314,1665439200"; 
   d="scan'208";a="28324370"
Received: from unknown (HELO tq-pgp-pr1.tq-net.de) ([192.168.6.15])
  by mx1-pgp.tq-group.com with ESMTP; 10 Jan 2023 11:00:09 +0100
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
  bh=OpyU2u3JwxCEt2shuTLxvexaElmrVfcsDNUb55UupXg=;
  b=ZCaZCd/SsEXkn/9H7Qm3NnSmLxCYF9W4I/LkOQazH49/cnCjNK6Zf08c
   IFudnbSlbbXAySvGEgsj1Pc14wlouWkXiqwleaMxs7h2yp0MOz9RlN+BB
   6J3d1yp8gPAnXPl6Ws9iBQwg7q7woBULQMiWM+F7Y7SdJHsVKPYA/fLZY
   7ed1BKvfYJ261m2obne0HZHJ3SmpVo3OkrjGK/YmE1uPtgmtKKJZNNBxf
   LNdQCdva98d8VNHXv4L/epjo4tL5lVq5q3ehyFjkvIALs/lmJIkPEZeiy
   j63F0Ozoi7DQZmIVah/yZsIo6JzVDqi81C9epK3vkhiuh3jJmgcV12ID0
   w==;
X-IronPort-AV: E=Sophos;i="5.96,314,1665439200"; 
   d="scan'208";a="28324369"
Received: from vtuxmail01.tq-net.de ([10.115.0.20])
  by mx1.tq-group.com with ESMTP; 10 Jan 2023 11:00:09 +0100
Received: from steina-w.tq-net.de (unknown [10.123.53.21])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (No client certificate requested)
        by vtuxmail01.tq-net.de (Postfix) with ESMTPSA id 91CC2280073;
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
Subject: [PATCH v2 3/4] clk: rs9: Support device specific dif bit calculation
Date:   Tue, 10 Jan 2023 11:00:02 +0100
Message-Id: <20230110100003.370917-3-alexander.stein@ew.tq-group.com>
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

The calculation DIFx is BIT(n) +1 is only true for 9FGV0241. With
additional devices this is getting more complicated.
Support a base bit for the DIF calculation, currently only devices
with consecutive bits are supported, e.g. the 6-channel device needs
additional logic.

Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>
---
Changes in v2:
* Use a common function instead of callback for calculating the DIF bit

 drivers/clk/clk-renesas-pcie.c | 32 +++++++++++++++++++-------------
 1 file changed, 19 insertions(+), 13 deletions(-)

diff --git a/drivers/clk/clk-renesas-pcie.c b/drivers/clk/clk-renesas-pcie.c
index bba09a88c2ccc..6b19186228238 100644
--- a/drivers/clk/clk-renesas-pcie.c
+++ b/drivers/clk/clk-renesas-pcie.c
@@ -18,7 +18,6 @@
 #include <linux/regmap.h>
 
 #define RS9_REG_OE				0x0
-#define RS9_REG_OE_DIF_OE(n)			BIT((n) + 1)
 #define RS9_REG_SS				0x1
 #define RS9_REG_SS_AMP_0V6			0x0
 #define RS9_REG_SS_AMP_0V7			0x1
@@ -31,9 +30,6 @@
 #define RS9_REG_SS_SSC_MASK			(3 << 3)
 #define RS9_REG_SS_SSC_LOCK			BIT(5)
 #define RS9_REG_SR				0x2
-#define RS9_REG_SR_2V0_DIF(n)			0
-#define RS9_REG_SR_3V0_DIF(n)			BIT((n) + 1)
-#define RS9_REG_SR_DIF_MASK(n)		BIT((n) + 1)
 #define RS9_REG_REF				0x3
 #define RS9_REG_REF_OE				BIT(4)
 #define RS9_REG_REF_OD				BIT(5)
@@ -160,17 +156,27 @@ static const struct regmap_config rs9_regmap_config = {
 	.reg_read = rs9_regmap_i2c_read,
 };
 
+static u8 rs9_calc_dif(const struct rs9_driver_data *rs9, int idx)
+{
+	enum rs9_model model = rs9->chip_info->model;
+
+	if (model == RENESAS_9FGV0241)
+		return BIT(idx) + 1;
+
+	return 0;
+}
+
 static int rs9_get_output_config(struct rs9_driver_data *rs9, int idx)
 {
 	struct i2c_client *client = rs9->client;
+	u8 dif = rs9_calc_dif(rs9, idx);
 	unsigned char name[5] = "DIF0";
 	struct device_node *np;
 	int ret;
 	u32 sr;
 
 	/* Set defaults */
-	rs9->clk_dif_sr &= ~RS9_REG_SR_DIF_MASK(idx);
-	rs9->clk_dif_sr |= RS9_REG_SR_3V0_DIF(idx);
+	rs9->clk_dif_sr |= dif;
 
 	snprintf(name, 5, "DIF%d", idx);
 	np = of_get_child_by_name(client->dev.of_node, name);
@@ -182,11 +188,9 @@ static int rs9_get_output_config(struct rs9_driver_data *rs9, int idx)
 	of_node_put(np);
 	if (!ret) {
 		if (sr == 2000000) {		/* 2V/ns */
-			rs9->clk_dif_sr &= ~RS9_REG_SR_DIF_MASK(idx);
-			rs9->clk_dif_sr |= RS9_REG_SR_2V0_DIF(idx);
+			rs9->clk_dif_sr &= ~dif;
 		} else if (sr == 3000000) {	/* 3V/ns (default) */
-			rs9->clk_dif_sr &= ~RS9_REG_SR_DIF_MASK(idx);
-			rs9->clk_dif_sr |= RS9_REG_SR_3V0_DIF(idx);
+			rs9->clk_dif_sr |= dif;
 		} else
 			ret = dev_err_probe(&client->dev, -EINVAL,
 					    "Invalid renesas,slew-rate value\n");
@@ -257,11 +261,13 @@ static void rs9_update_config(struct rs9_driver_data *rs9)
 	}
 
 	for (i = 0; i < rs9->chip_info->num_clks; i++) {
-		if (rs9->clk_dif_sr & RS9_REG_SR_3V0_DIF(i))
+		u8 dif = rs9_calc_dif(rs9, i);
+
+		if (rs9->clk_dif_sr & dif)
 			continue;
 
-		regmap_update_bits(rs9->regmap, RS9_REG_SR, RS9_REG_SR_3V0_DIF(i),
-				   rs9->clk_dif_sr & RS9_REG_SR_3V0_DIF(i));
+		regmap_update_bits(rs9->regmap, RS9_REG_SR, dif,
+				   rs9->clk_dif_sr & dif);
 	}
 }
 
-- 
2.34.1

