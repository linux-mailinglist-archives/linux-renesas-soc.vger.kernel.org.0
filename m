Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3994E754F76
	for <lists+linux-renesas-soc@lfdr.de>; Sun, 16 Jul 2023 17:44:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229871AbjGPPoy (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Sun, 16 Jul 2023 11:44:54 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48150 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229451AbjGPPox (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Sun, 16 Jul 2023 11:44:53 -0400
Received: from relmlie6.idc.renesas.com (relmlor2.renesas.com [210.160.252.172])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 86462E5D;
        Sun, 16 Jul 2023 08:44:52 -0700 (PDT)
X-IronPort-AV: E=Sophos;i="6.01,210,1684767600"; 
   d="scan'208";a="172935291"
Received: from unknown (HELO relmlir5.idc.renesas.com) ([10.200.68.151])
  by relmlie6.idc.renesas.com with ESMTP; 17 Jul 2023 00:44:52 +0900
Received: from localhost.localdomain (unknown [10.226.92.32])
        by relmlir5.idc.renesas.com (Postfix) with ESMTP id 404E440062C4;
        Mon, 17 Jul 2023 00:44:48 +0900 (JST)
From:   Biju Das <biju.das.jz@bp.renesas.com>
To:     Luca Ceresoli <luca.ceresoli@bootlin.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>
Cc:     Biju Das <biju.das.jz@bp.renesas.com>, linux-clk@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Marek Vasut <marex@denx.de>,
        Alex Helms <alexander.helms.jy@renesas.com>,
        Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        linux-renesas-soc@vger.kernel.org
Subject: [PATCH 1/2] clk: vc5: Use i2c_get_match_data() instead of device_get_match_data()
Date:   Sun, 16 Jul 2023 16:44:41 +0100
Message-Id: <20230716154442.93908-2-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230716154442.93908-1-biju.das.jz@bp.renesas.com>
References: <20230716154442.93908-1-biju.das.jz@bp.renesas.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,SPF_HELO_NONE,
        SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

The device_get_match_data(), is to get match data for firmware interfaces
such as just OF/ACPI. This driver has I2C matching table as well. Use
i2c_get_match_data() to get match data for I2C, ACPI and DT-based
matching.

Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
Note:
This patch is based on the work done for rtc-isl1208 and is compile
tested.
---
 drivers/clk/clk-versaclock5.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/clk/clk-versaclock5.c b/drivers/clk/clk-versaclock5.c
index 8bc54176f325..4197991803ba 100644
--- a/drivers/clk/clk-versaclock5.c
+++ b/drivers/clk/clk-versaclock5.c
@@ -956,7 +956,9 @@ static int vc5_probe(struct i2c_client *client)
 
 	i2c_set_clientdata(client, vc5);
 	vc5->client = client;
-	vc5->chip_info = device_get_match_data(&client->dev);
+	vc5->chip_info = i2c_get_match_data(client);
+	if (!vc5->chip_info)
+		return -ENODEV;
 
 	vc5->pin_xin = devm_clk_get(&client->dev, "xin");
 	if (PTR_ERR(vc5->pin_xin) == -EPROBE_DEFER)
-- 
2.25.1

