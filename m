Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E25122AE6D7
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 11 Nov 2020 04:10:10 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725870AbgKKDKK (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 10 Nov 2020 22:10:10 -0500
Received: from szxga04-in.huawei.com ([45.249.212.190]:7204 "EHLO
        szxga04-in.huawei.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725839AbgKKDKK (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 10 Nov 2020 22:10:10 -0500
Received: from DGGEMS409-HUB.china.huawei.com (unknown [172.30.72.60])
        by szxga04-in.huawei.com (SkyGuard) with ESMTP id 4CW8q71mgFzkhpQ;
        Wed, 11 Nov 2020 11:09:55 +0800 (CST)
Received: from huawei.com (10.175.124.27) by DGGEMS409-HUB.china.huawei.com
 (10.3.19.209) with Microsoft SMTP Server id 14.3.487.0; Wed, 11 Nov 2020
 11:10:02 +0800
From:   Wang Xiaojun <wangxiaojun11@huawei.com>
To:     <laurent.pinchart@ideasonboard.com>,
        <kieran.bingham+renesas@ideasonboard.com>, <airlied@linux.ie>,
        <daniel@ffwll.ch>
CC:     <dri-devel@lists.freedesktop.org>,
        <linux-renesas-soc@vger.kernel.org>
Subject: [PATCH] drm: rcar-du: Fix the return check of of_parse_phandle and of_find_device_by_node
Date:   Wed, 11 Nov 2020 11:14:52 +0800
Message-ID: <20201111031452.3659714-1-wangxiaojun11@huawei.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 7BIT
Content-Type:   text/plain; charset=US-ASCII
X-Originating-IP: [10.175.124.27]
X-CFilter-Loop: Reflected
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

of_parse_phandle and of_find_device_by_node may return NULL
which cannot be checked by IS_ERR.

Signed-off-by: Wang Xiaojun <wangxiaojun11@huawei.com>
Reported-by: Hulk Robot <hulkci@huawei.com>
---
 drivers/gpu/drm/rcar-du/rcar_du_kms.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/rcar-du/rcar_du_kms.c b/drivers/gpu/drm/rcar-du/rcar_du_kms.c
index 72dda446355f..fcfddf7ad3f3 100644
--- a/drivers/gpu/drm/rcar-du/rcar_du_kms.c
+++ b/drivers/gpu/drm/rcar-du/rcar_du_kms.c
@@ -700,10 +700,10 @@ static int rcar_du_cmm_init(struct rcar_du_device *rcdu)
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
@@ -713,10 +713,10 @@ static int rcar_du_cmm_init(struct rcar_du_device *rcdu)
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
-- 
2.25.1

