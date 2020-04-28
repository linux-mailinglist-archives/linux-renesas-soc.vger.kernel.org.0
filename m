Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2482C1BC0F5
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 28 Apr 2020 16:16:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727831AbgD1OQN (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 28 Apr 2020 10:16:13 -0400
Received: from szxga05-in.huawei.com ([45.249.212.191]:3328 "EHLO huawei.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1727790AbgD1OQN (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 28 Apr 2020 10:16:13 -0400
Received: from DGGEMS413-HUB.china.huawei.com (unknown [172.30.72.60])
        by Forcepoint Email with ESMTP id E70692BBD42DE853D15B;
        Tue, 28 Apr 2020 22:16:07 +0800 (CST)
Received: from localhost.localdomain.localdomain (10.175.113.25) by
 DGGEMS413-HUB.china.huawei.com (10.3.19.213) with Microsoft SMTP Server id
 14.3.487.0; Tue, 28 Apr 2020 22:16:00 +0800
From:   Wei Yongjun <weiyongjun1@huawei.com>
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        Jacopo Mondi <jacopo+renesas@jmondi.org>
CC:     Wei Yongjun <weiyongjun1@huawei.com>,
        <dri-devel@lists.freedesktop.org>,
        <linux-renesas-soc@vger.kernel.org>,
        <kernel-janitors@vger.kernel.org>
Subject: [PATCH -next] drm/rcar-du: Fix return value check in rcar_du_cmm_init()
Date:   Tue, 28 Apr 2020 14:17:16 +0000
Message-ID: <20200428141716.87958-1-weiyongjun1@huawei.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Type:   text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7BIT
X-Originating-IP: [10.175.113.25]
X-CFilter-Loop: Reflected
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

In case of error, the function of_parse_phandle()/of_find_device_by_node()
returns NULL pointer not ERR_PTR(). The IS_ERR() test in the return value
check should be replaced with NULL test

Fixes: 8de707aeb452 ("drm: rcar-du: kms: Initialize CMM instances")
Signed-off-by: Wei Yongjun <weiyongjun1@huawei.com>
---
 drivers/gpu/drm/rcar-du/rcar_du_kms.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/rcar-du/rcar_du_kms.c b/drivers/gpu/drm/rcar-du/rcar_du_kms.c
index 482329102f19..0da711d9b2f8 100644
--- a/drivers/gpu/drm/rcar-du/rcar_du_kms.c
+++ b/drivers/gpu/drm/rcar-du/rcar_du_kms.c
@@ -650,10 +650,10 @@ static int rcar_du_cmm_init(struct rcar_du_device *rcdu)
 		int ret;
 
 		cmm = of_parse_phandle(np, "renesas,cmms", i);
-		if (IS_ERR(cmm)) {
+		if (!cmm) {
 			dev_err(rcdu->dev,
 				"Failed to parse 'renesas,cmms' property\n");
-			return PTR_ERR(cmm);
+			return -ENODEV;
 		}
 
 		if (!of_device_is_available(cmm)) {
@@ -663,10 +663,10 @@ static int rcar_du_cmm_init(struct rcar_du_device *rcdu)
 		}
 
 		pdev = of_find_device_by_node(cmm);
-		if (IS_ERR(pdev)) {
+		if (!pdev) {
 			dev_err(rcdu->dev, "No device found for CMM%u\n", i);
 			of_node_put(cmm);
-			return PTR_ERR(pdev);
+			return -ENODEV;
 		}
 
 		of_node_put(cmm);



