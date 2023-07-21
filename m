Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B02A975BF34
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 21 Jul 2023 09:00:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230112AbjGUHAf (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 21 Jul 2023 03:00:35 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44138 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230074AbjGUHAc (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 21 Jul 2023 03:00:32 -0400
Received: from relmlie5.idc.renesas.com (relmlor1.renesas.com [210.160.252.171])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 1EAD0270B;
        Fri, 21 Jul 2023 00:00:31 -0700 (PDT)
X-IronPort-AV: E=Sophos;i="6.01,220,1684767600"; 
   d="scan'208";a="170340947"
Received: from unknown (HELO relmlir5.idc.renesas.com) ([10.200.68.151])
  by relmlie5.idc.renesas.com with ESMTP; 21 Jul 2023 16:00:30 +0900
Received: from localhost.localdomain (unknown [10.226.92.55])
        by relmlir5.idc.renesas.com (Postfix) with ESMTP id 083904006190;
        Fri, 21 Jul 2023 16:00:27 +0900 (JST)
From:   Biju Das <biju.das.jz@bp.renesas.com>
To:     Alex Helms <alexander.helms.jy@renesas.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>
Cc:     Biju Das <biju.das.jz@bp.renesas.com>, linux-clk@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        linux-renesas-soc@vger.kernel.org,
        Marek Vasut <marek.vasut+renesas@mailbox.org>
Subject: [PATCH v2 2/2] clk: vc7: Use i2c_get_match_data() instead of device_get_match_data()
Date:   Fri, 21 Jul 2023 08:00:19 +0100
Message-Id: <20230721070019.96627-3-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230721070019.96627-1-biju.das.jz@bp.renesas.com>
References: <20230721070019.96627-1-biju.das.jz@bp.renesas.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
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
Reviewed-by: Marek Vasut <marek.vasut+renesas@mailbox.org>
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
v1->v2:
 * Added Rb tags from Geert and Marek.
 * Removed error check as all tables have data pointers.
 * Retained Rb tag as the change is trivial.
---
 drivers/clk/clk-versaclock7.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/clk/clk-versaclock7.c b/drivers/clk/clk-versaclock7.c
index 7f4361084882..9ab35c1af0ff 100644
--- a/drivers/clk/clk-versaclock7.c
+++ b/drivers/clk/clk-versaclock7.c
@@ -1108,7 +1108,7 @@ static int vc7_probe(struct i2c_client *client)
 
 	i2c_set_clientdata(client, vc7);
 	vc7->client = client;
-	vc7->chip_info = device_get_match_data(&client->dev);
+	vc7->chip_info = i2c_get_match_data(client);
 
 	vc7->pin_xin = devm_clk_get(&client->dev, "xin");
 	if (PTR_ERR(vc7->pin_xin) == -EPROBE_DEFER) {
-- 
2.25.1

