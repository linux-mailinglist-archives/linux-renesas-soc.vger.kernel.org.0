Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 006A776DF05
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  3 Aug 2023 05:30:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229628AbjHCDaC (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 2 Aug 2023 23:30:02 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52632 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233397AbjHCD30 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 2 Aug 2023 23:29:26 -0400
Received: from szxga03-in.huawei.com (szxga03-in.huawei.com [45.249.212.189])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8480630E5;
        Wed,  2 Aug 2023 20:29:09 -0700 (PDT)
Received: from kwepemi500012.china.huawei.com (unknown [172.30.72.55])
        by szxga03-in.huawei.com (SkyGuard) with ESMTP id 4RGZ4v6BW8zyNJ3;
        Thu,  3 Aug 2023 11:26:23 +0800 (CST)
Received: from huawei.com (10.90.53.73) by kwepemi500012.china.huawei.com
 (7.221.188.12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Thu, 3 Aug
 2023 11:29:06 +0800
From:   Li Zetao <lizetao1@huawei.com>
To:     <herve.codina@bootlin.com>, <gregkh@linuxfoundation.org>
CC:     <lizetao1@huawei.com>, <linux-renesas-soc@vger.kernel.org>,
        <linux-usb@vger.kernel.org>
Subject: [PATCH -next] usb: gadget: udc: Remove redundant initialization for udc_driver
Date:   Thu, 3 Aug 2023 11:28:38 +0800
Message-ID: <20230803032838.3045730-1-lizetao1@huawei.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 7BIT
Content-Type:   text/plain; charset=US-ASCII
X-Originating-IP: [10.90.53.73]
X-ClientProxiedBy: dggems704-chm.china.huawei.com (10.3.19.181) To
 kwepemi500012.china.huawei.com (7.221.188.12)
X-CFilter-Loop: Reflected
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,
        RCVD_IN_DNSWL_BLOCKED,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

There is a warning reported by coccinelle:

./drivers/usb/gadget/udc/renesas_usbf.c:3381:3-8:
		No need to set .owner here. The core will do it.

The module_platform_driver() will set "THIS_MODULE" to driver.owner
when register a driver for platform-level devices, so it is redundant
initialization to set driver.owner in udc_driver statement. Remove it
to silence the warning.

Signed-off-by: Li Zetao <lizetao1@huawei.com>
---
 drivers/usb/gadget/udc/renesas_usbf.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/usb/gadget/udc/renesas_usbf.c b/drivers/usb/gadget/udc/renesas_usbf.c
index 3482b41d0646..657f265ac7cc 100644
--- a/drivers/usb/gadget/udc/renesas_usbf.c
+++ b/drivers/usb/gadget/udc/renesas_usbf.c
@@ -3378,7 +3378,6 @@ MODULE_DEVICE_TABLE(of, usbf_match);
 static struct platform_driver udc_driver = {
 	.driver = {
 		.name = "usbf_renesas",
-		.owner = THIS_MODULE,
 		.of_match_table = usbf_match,
 	},
 	.probe          = usbf_probe,
-- 
2.34.1

