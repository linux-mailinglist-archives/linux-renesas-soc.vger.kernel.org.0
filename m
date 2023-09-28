Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 303CE7B1589
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 28 Sep 2023 10:03:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229605AbjI1ID3 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 28 Sep 2023 04:03:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43534 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229713AbjI1ID2 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 28 Sep 2023 04:03:28 -0400
Received: from mail.zeus03.de (www.zeus03.de [194.117.254.33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CDBF198
        for <linux-renesas-soc@vger.kernel.org>; Thu, 28 Sep 2023 01:03:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        sang-engineering.com; h=from:to:cc:subject:date:message-id
        :mime-version:content-transfer-encoding; s=k1; bh=azZ9ddT8Eg7Ybl
        QgQRfCV30N3zEJfwcbP3F8SiVvbFw=; b=IPquSaH1TkrXKB6dKG4Pmc1xcai4RK
        ErU8vG5FEzAmkAAjBhVLZ4/U071ZWzuI5fe4BTbmxQ2Xs4qzT5QsipQHtezlz6rF
        xte8t1RLfOcVTCXJHxZE+Oimo8BymmH9A/ukSQK5zddTJTOULiimtYbQPTbt3ytE
        3bqcneo2SUToifSyNHe0oLT7NjKte96CVl9SPpHzfL5Q/h3qDriQ0Jq1p6aDdE5k
        fWrFYI9775FetSUN88s/RBdpTquGpi7MI520ae7GHQI+iWFTe0CJ8qmmJRy/VE9P
        fk2XNhdHyqJ0Baiw9ibAtUTOzwzsnRlBRQLMfe+cKWOPf4TjZv0Z8s7Q==
Received: (qmail 3387089 invoked from network); 28 Sep 2023 10:03:24 +0200
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 28 Sep 2023 10:03:24 +0200
X-UD-Smtp-Session: l3s3148p1@E+f5vWYG3JwujntX
From:   Wolfram Sang <wsa+renesas@sang-engineering.com>
To:     linux-renesas-soc@vger.kernel.org
Cc:     Dirk Behme <dirk.behme@de.bosch.com>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>
Subject: [PATCH v2 RFT] clk: renesas: rcar-gen3: Extend SDnH divider table
Date:   Thu, 28 Sep 2023 10:03:17 +0200
Message-Id: <20230928080317.28224-1-wsa+renesas@sang-engineering.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_PASS,SPF_PASS
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

From: Dirk Behme <dirk.behme@de.bosch.com>

The clock dividers might be used with clock stop bit enabled or not.
Current tables only support recommended values from the datasheet. This
might result in warnings like below because no valid clock divider is
found. Resulting in a 0 divider.

There are Renesas ARM Trusted Firmware version out there which e.g.
configure 0x201 (shifted logical right by 2: 0x80) and with this match
the added { STPnHCK | 0, 1 }:

https://github.com/renesas-rcar/arm-trusted-firmware/blob/rcar_gen3_v2.3/drivers/renesas/rcar/emmc/emmc_init.c#L108

------------[ cut here ]------------
sd1h: Zero divisor and CLK_DIVIDER_ALLOW_ZERO not set
WARNING: CPU: 1 PID: 1 at drivers/clk/clk-divider.c:141 divider_recalc_rate+0x48/0x70
Modules linked in:
CPU: 1 PID: 1 Comm: swapper/0 Not tainted 6.1.52 #1
Hardware name: Custom board based on r8a7796 (DT)
pstate: 40000005 (nZcv daif -PAN -UAO -TCO -DIT -SSBS BTYPE=--)
pc : divider_recalc_rate+0x48/0x70
...
------------[ cut here ]------------

Fixes: bb6d3fa98a41 ("clk: renesas: rcar-gen3: Switch to new SD clock handling")
Signed-off-by: Dirk Behme <dirk.behme@de.bosch.com>
[wsa: extended the table to 5 entries, added comments, reword commit message a little]
Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
---

After some discussion on IRC, Geert and I concluded that Dirk's approach
is good but we wanted to extend it to all 5 possibilities. Also,
comments explaining the situation. I added these. It works on my Ebisu
board (R-Car E3). Dirk, could you kindly test on your system?

 drivers/clk/renesas/rcar-cpg-lib.c | 16 ++++++++++++++--
 1 file changed, 14 insertions(+), 2 deletions(-)

diff --git a/drivers/clk/renesas/rcar-cpg-lib.c b/drivers/clk/renesas/rcar-cpg-lib.c
index e2e0447de190..b1d9a9a55569 100644
--- a/drivers/clk/renesas/rcar-cpg-lib.c
+++ b/drivers/clk/renesas/rcar-cpg-lib.c
@@ -70,8 +70,20 @@ void cpg_simple_notifier_register(struct raw_notifier_head *notifiers,
 #define STPnHCK	BIT(9 - SDnSRCFC_SHIFT)
 
 static const struct clk_div_table cpg_sdh_div_table[] = {
-	{ 0, 1 }, { 1, 2 }, { STPnHCK | 2, 4 }, { STPnHCK | 3, 8 },
-	{ STPnHCK | 4, 16 }, { 0, 0 },
+	/*
+	 * These values are recommended by the datasheet. Because they come
+	 * first, Linux will only use these.
+	 */
+	{ 0, 1 }, { 1, 2 }, { STPnHCK | 2, 4 }, { STPnHCK | 3, 8 }, { STPnHCK | 4, 16 },
+	/*
+	 * These values are not recommended because STPnHCK is wrong. But they
+	 * have been seen because of broken firmware. So, we support reading
+	 * them but Linux will sanitize them when initializing through
+	 * recalc_rate.
+	 */
+	{ STPnHCK | 0, 1 }, { STPnHCK | 1, 2 },  { 2, 4 }, { 3, 8 }, { 4, 16 },
+	/* Sentinel */
+	{ 0, 0 }
 };
 
 struct clk * __init cpg_sdh_clk_register(const char *name,
-- 
2.30.2

