Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id BA6FE76C963
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  2 Aug 2023 11:22:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234060AbjHBJWR (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 2 Aug 2023 05:22:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39218 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234100AbjHBJWK (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 2 Aug 2023 05:22:10 -0400
Received: from szxga02-in.huawei.com (szxga02-in.huawei.com [45.249.212.188])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4FBB22D76;
        Wed,  2 Aug 2023 02:22:07 -0700 (PDT)
Received: from dggpemm500020.china.huawei.com (unknown [172.30.72.56])
        by szxga02-in.huawei.com (SkyGuard) with ESMTP id 4RG5xn2kCkzNmcH;
        Wed,  2 Aug 2023 17:18:37 +0800 (CST)
Received: from dggpemm500007.china.huawei.com (7.185.36.183) by
 dggpemm500020.china.huawei.com (7.185.36.49) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Wed, 2 Aug 2023 17:22:03 +0800
Received: from huawei.com (10.175.103.91) by dggpemm500007.china.huawei.com
 (7.185.36.183) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Wed, 2 Aug
 2023 17:22:02 +0800
From:   Yang Yingliang <yangyingliang@huawei.com>
To:     <linux-renesas-soc@vger.kernel.org>, <linux-clk@vger.kernel.org>
CC:     <geert+renesas@glider.be>, <mturquette@baylibre.com>,
        <sboyd@kernel.org>, <magnus.damm@gmail.com>,
        <yangyingliang@huawei.com>
Subject: [PATCH -next] clk: renesas: r9a06g032: use for_each_compatible_node()
Date:   Wed, 2 Aug 2023 17:19:20 +0800
Message-ID: <20230802091920.3270703-1-yangyingliang@huawei.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 7BIT
Content-Type:   text/plain; charset=US-ASCII
X-Originating-IP: [10.175.103.91]
X-ClientProxiedBy: dggems706-chm.china.huawei.com (10.3.19.183) To
 dggpemm500007.china.huawei.com (7.185.36.183)
X-CFilter-Loop: Reflected
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,
        RCVD_IN_DNSWL_BLOCKED,RCVD_IN_MSPIKE_H5,RCVD_IN_MSPIKE_WL,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Use for_each_compatible_node() instead of open-coding it.

Signed-off-by: Yang Yingliang <yangyingliang@huawei.com>
---
 drivers/clk/renesas/r9a06g032-clocks.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/drivers/clk/renesas/r9a06g032-clocks.c b/drivers/clk/renesas/r9a06g032-clocks.c
index 55db63c7041a..9a50166c02b9 100644
--- a/drivers/clk/renesas/r9a06g032-clocks.c
+++ b/drivers/clk/renesas/r9a06g032-clocks.c
@@ -1269,11 +1269,10 @@ static void r9a06g032_clocks_del_clk_provider(void *data)
 
 static void __init r9a06g032_init_h2mode(struct r9a06g032_priv *clocks)
 {
-	struct device_node *usbf_np = NULL;
+	struct device_node *usbf_np;
 	u32 usb;
 
-	while ((usbf_np = of_find_compatible_node(usbf_np, NULL,
-						  "renesas,rzn1-usbf"))) {
+	for_each_compatible_node(usbf_np, NULL, "renesas,rzn1-usbf") {
 		if (of_device_is_available(usbf_np))
 			break;
 	}
-- 
2.25.1

