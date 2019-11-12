Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8C50EF90F5
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 12 Nov 2019 14:48:44 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726970AbfKLNso (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 12 Nov 2019 08:48:44 -0500
Received: from smtp1.de.adit-jv.com ([93.241.18.167]:40624 "EHLO
        smtp1.de.adit-jv.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725919AbfKLNso (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 12 Nov 2019 08:48:44 -0500
Received: from localhost (smtp1.de.adit-jv.com [127.0.0.1])
        by smtp1.de.adit-jv.com (Postfix) with ESMTP id 19DA53C04C0;
        Tue, 12 Nov 2019 14:48:41 +0100 (CET)
Received: from smtp1.de.adit-jv.com ([127.0.0.1])
        by localhost (smtp1.de.adit-jv.com [127.0.0.1]) (amavisd-new, port 10024)
        with ESMTP id EMTLDXMunEnY; Tue, 12 Nov 2019 14:48:32 +0100 (CET)
Received: from HI2EXCH01.adit-jv.com (hi2exch01.adit-jv.com [10.72.92.24])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
        (No client certificate requested)
        by smtp1.de.adit-jv.com (Postfix) with ESMTPS id 9C9ED3C009C;
        Tue, 12 Nov 2019 14:48:32 +0100 (CET)
Received: from vmlxhi-102.adit-jv.com (10.72.93.184) by HI2EXCH01.adit-jv.com
 (10.72.92.24) with Microsoft SMTP Server (TLS) id 14.3.468.0; Tue, 12 Nov
 2019 14:48:32 +0100
From:   Eugeniu Rosca <erosca@de.adit-jv.com>
To:     Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        =?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>,
        Ulf Hansson <ulf.hansson@linaro.org>
CC:     Geert Uytterhoeven <geert@linux-m68k.org>,
        Simon Horman <horms+renesas@verge.net.au>,
        <linux-mmc@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-renesas-soc@vger.kernel.org>,
        Eugeniu Rosca <erosca@de.adit-jv.com>,
        Eugeniu Rosca <roscaeugeniu@gmail.com>,
        Harish Jenny K N <harish_kandiga@mentor.com>,
        Andrew Gabbasov <andrew_gabbasov@mentor.com>
Subject: [PATCH] mmc: renesas_sdhi_internal_dmac: Add MMC_CAP_ERASE to Gen3 SoCs
Date:   Tue, 12 Nov 2019 14:48:08 +0100
Message-ID: <20191112134808.23546-1-erosca@de.adit-jv.com>
X-Mailer: git-send-email 2.24.0
MIME-Version: 1.0
Content-Transfer-Encoding: 7BIT
Content-Type:   text/plain; charset=US-ASCII
X-Originating-IP: [10.72.93.184]
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

From: Harish Jenny K N <harish_kandiga@mentor.com>

Enable MMC_CAP_ERASE capability in the driver to allow
erase/discard/trim requests.

Suggested-by: Andrew Gabbasov <andrew_gabbasov@mentor.com>
Signed-off-by: Harish Jenny K N <harish_kandiga@mentor.com>
[erosca: Forward-port and test on v5.4-rc7 using H3ULCB-KF:
         "blkdiscard /dev/mmcblk0" passes with this patch applied
         and complains otherwise:
	 "BLKDISCARD ioctl failed: Operation not supported"]
Signed-off-by: Eugeniu Rosca <erosca@de.adit-jv.com>
---
 drivers/mmc/host/renesas_sdhi_internal_dmac.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/mmc/host/renesas_sdhi_internal_dmac.c b/drivers/mmc/host/renesas_sdhi_internal_dmac.c
index a66f8d6d61d1..61fcbf51c947 100644
--- a/drivers/mmc/host/renesas_sdhi_internal_dmac.c
+++ b/drivers/mmc/host/renesas_sdhi_internal_dmac.c
@@ -105,7 +105,7 @@ static const struct renesas_sdhi_of_data of_rcar_gen3_compatible = {
 	.tmio_flags	= TMIO_MMC_HAS_IDLE_WAIT | TMIO_MMC_CLK_ACTUAL |
 			  TMIO_MMC_HAVE_CBSY | TMIO_MMC_MIN_RCAR2,
 	.capabilities	= MMC_CAP_SD_HIGHSPEED | MMC_CAP_SDIO_IRQ |
-			  MMC_CAP_CMD23,
+			  MMC_CAP_ERASE | MMC_CAP_CMD23,
 	.capabilities2	= MMC_CAP2_NO_WRITE_PROTECT | MMC_CAP2_MERGE_CAPABLE,
 	.bus_shift	= 2,
 	.scc_offset	= 0x1000,
-- 
2.24.0

