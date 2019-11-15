Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 37E5DFDF36
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 15 Nov 2019 14:45:15 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727461AbfKONpO (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 15 Nov 2019 08:45:14 -0500
Received: from smtp1.de.adit-jv.com ([93.241.18.167]:34869 "EHLO
        smtp1.de.adit-jv.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727314AbfKONpO (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 15 Nov 2019 08:45:14 -0500
Received: from localhost (smtp1.de.adit-jv.com [127.0.0.1])
        by smtp1.de.adit-jv.com (Postfix) with ESMTP id 170023C04C0;
        Fri, 15 Nov 2019 14:45:12 +0100 (CET)
Received: from smtp1.de.adit-jv.com ([127.0.0.1])
        by localhost (smtp1.de.adit-jv.com [127.0.0.1]) (amavisd-new, port 10024)
        with ESMTP id THX1Eimu0o5R; Fri, 15 Nov 2019 14:45:06 +0100 (CET)
Received: from HI2EXCH01.adit-jv.com (hi2exch01.adit-jv.com [10.72.92.24])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
        (No client certificate requested)
        by smtp1.de.adit-jv.com (Postfix) with ESMTPS id 64DC13C009C;
        Fri, 15 Nov 2019 14:45:06 +0100 (CET)
Received: from vmlxhi-102.adit-jv.com (10.72.93.184) by HI2EXCH01.adit-jv.com
 (10.72.92.24) with Microsoft SMTP Server (TLS) id 14.3.468.0; Fri, 15 Nov
 2019 14:45:06 +0100
From:   Eugeniu Rosca <erosca@de.adit-jv.com>
To:     Ulf Hansson <ulf.hansson@linaro.org>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Masahiro Yamada <yamada.masahiro@socionext.com>
CC:     <linux-mmc@vger.kernel.org>, <linux-renesas-soc@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>,
        Eugeniu Rosca <erosca@de.adit-jv.com>,
        Eugeniu Rosca <roscaeugeniu@gmail.com>,
        Andrew Gabbasov <andrew_gabbasov@mentor.com>,
        Harish Jenny K N <harish_kandiga@mentor.com>
Subject: [PATCH v2] mmc: tmio: Add MMC_CAP_ERASE to allow erase/discard/trim requests
Date:   Fri, 15 Nov 2019 14:44:30 +0100
Message-ID: <20191115134430.12621-1-erosca@de.adit-jv.com>
X-Mailer: git-send-email 2.24.0
MIME-Version: 1.0
Content-Transfer-Encoding: 7BIT
Content-Type:   text/plain; charset=US-ASCII
X-Originating-IP: [10.72.93.184]
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Isolated initially to renesas_sdhi_internal_dmac [1], Ulf suggested
adding MMC_CAP_ERASE to the TMIO mmc core:

On Fri, Nov 15, 2019 at 10:27:25AM +0100, Ulf Hansson wrote:
 -- snip --
 This test and due to the discussions with Wolfram and you in this
 thread, I would actually suggest that you enable MMC_CAP_ERASE for all
 tmio variants, rather than just for this particular one.

 In other words, set the cap in tmio_mmc_host_probe() should be fine,
 as it seems none of the tmio variants supports HW busy detection at
 this point.
 -- snip --

Testing on R-Car H3ULCB-KF doesn't reveal any issues (v5.4-rc7):

root@rcar-gen3:~# lsblk
NAME         MAJ:MIN RM  SIZE RO TYPE MOUNTPOINT
mmcblk0      179:0    0 59.2G  0 disk  <--- eMMC
mmcblk0boot0 179:8    0    4M  1 disk
mmcblk0boot1 179:16   0    4M  1 disk
mmcblk1      179:24   0   30G  0 disk  <--- SD card

root@rcar-gen3:~# time blkdiscard /dev/mmcblk0
real    0m8.659s
user    0m0.001s
sys     0m1.920s

root@rcar-gen3:~# time blkdiscard /dev/mmcblk1
real    0m1.176s
user    0m0.001s
sys     0m0.124s

[1] https://lore.kernel.org/linux-renesas-soc/20191112134808.23546-1-erosca@de.adit-jv.com/

Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: Masahiro Yamada <yamada.masahiro@socionext.com>
Cc: Andrew Gabbasov <andrew_gabbasov@mentor.com>
Originally-by: Harish Jenny K N <harish_kandiga@mentor.com>
Suggested-by: Ulf Hansson <ulf.hansson@linaro.org>
Signed-off-by: Eugeniu Rosca <erosca@de.adit-jv.com>
---
 drivers/mmc/host/tmio_mmc_core.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/mmc/host/tmio_mmc_core.c b/drivers/mmc/host/tmio_mmc_core.c
index 9b6e1001e77c..dec5a99f52cf 100644
--- a/drivers/mmc/host/tmio_mmc_core.c
+++ b/drivers/mmc/host/tmio_mmc_core.c
@@ -1184,7 +1184,7 @@ int tmio_mmc_host_probe(struct tmio_mmc_host *_host)
 	if (ret == -EPROBE_DEFER)
 		return ret;
 
-	mmc->caps |= MMC_CAP_4_BIT_DATA | pdata->capabilities;
+	mmc->caps |= MMC_CAP_ERASE | MMC_CAP_4_BIT_DATA | pdata->capabilities;
 	mmc->caps2 |= pdata->capabilities2;
 	mmc->max_segs = pdata->max_segs ? : 32;
 	mmc->max_blk_size = TMIO_MAX_BLK_SIZE;
-- 
2.24.0

