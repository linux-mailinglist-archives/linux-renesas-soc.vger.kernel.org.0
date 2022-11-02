Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 778C9616321
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  2 Nov 2022 13:54:43 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230525AbiKBMym (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 2 Nov 2022 08:54:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36384 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231176AbiKBMyl (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 2 Nov 2022 08:54:41 -0400
Received: from mail.zeus03.de (www.zeus03.de [194.117.254.33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 95F932791B
        for <linux-renesas-soc@vger.kernel.org>; Wed,  2 Nov 2022 05:54:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple; d=sang-engineering.com; h=
        from:to:cc:subject:date:message-id:in-reply-to:references
        :mime-version:content-transfer-encoding; s=k1; bh=os+A9NNngw6jP9
        qZvJvwY8/B1IJkA4/6BCbSA+VGSLI=; b=u3I4JazxXRK1JjEalonTrMqmpHLlVD
        aUbXPZyL2kSVfez07Ql7savZY2/xRhhQA7cFRtL++UDrew4tM7PRzHW3qODalkQJ
        dTWuHiQFmgjIFbSuTSHjqcU2XIg1KUN4ObBdj6cADSJe3HP+EhVKABdDIBoE7GES
        AbxnP4wCywGOY=
Received: (qmail 2206717 invoked from network); 2 Nov 2022 13:54:38 +0100
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 2 Nov 2022 13:54:38 +0100
X-UD-Smtp-Session: l3s3148p1@zdbeV3zsd50ucrSg
From:   Wolfram Sang <wsa+renesas@sang-engineering.com>
To:     linux-mmc@vger.kernel.org
Cc:     linux-renesas-soc@vger.kernel.org,
        Wolfram Sang <wsa+renesas@sang-engineering.com>
Subject: [RFC PATCH 2/2] mmc: tmio: remove 'alignment_shift' from platform data
Date:   Wed,  2 Nov 2022 13:54:30 +0100
Message-Id: <20221102125430.28466-3-wsa+renesas@sang-engineering.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20221102125430.28466-1-wsa+renesas@sang-engineering.com>
References: <20221102125430.28466-1-wsa+renesas@sang-engineering.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-1.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FORGED_SPF_HELO,
        RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_PASS,SPF_NONE
        autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

There is only one alignment shift for one type of Renesas SDHI. Encode
it directly in its DMA driver to reduce complexity and ease further
simplifications.

Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
---
 drivers/mmc/host/renesas_sdhi_core.c     | 1 -
 drivers/mmc/host/renesas_sdhi_sys_dmac.c | 4 ++--
 include/linux/mfd/tmio.h                 | 1 -
 3 files changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/mmc/host/renesas_sdhi_core.c b/drivers/mmc/host/renesas_sdhi_core.c
index b970699743e0..1bc2c2997ead 100644
--- a/drivers/mmc/host/renesas_sdhi_core.c
+++ b/drivers/mmc/host/renesas_sdhi_core.c
@@ -1018,7 +1018,6 @@ int renesas_sdhi_probe(struct platform_device *pdev,
 	dma_priv->filter = shdma_chan_filter;
 	dma_priv->enable = renesas_sdhi_enable_dma;
 
-	mmc_data->alignment_shift = 1; /* 2-byte alignment */
 	mmc_data->capabilities |= MMC_CAP_MMC_HIGHSPEED;
 
 	/*
diff --git a/drivers/mmc/host/renesas_sdhi_sys_dmac.c b/drivers/mmc/host/renesas_sdhi_sys_dmac.c
index c4545cb143dd..b559ad38b667 100644
--- a/drivers/mmc/host/renesas_sdhi_sys_dmac.c
+++ b/drivers/mmc/host/renesas_sdhi_sys_dmac.c
@@ -160,7 +160,7 @@ static void renesas_sdhi_sys_dmac_start_dma_rx(struct tmio_mmc_host *host)
 	dma_cookie_t cookie;
 	int ret, i;
 	bool aligned = true, multiple = true;
-	unsigned int align = (1 << host->pdata->alignment_shift) - 1;
+	unsigned int align = 1;	/* 2-byte alignment */
 
 	for_each_sg(sg, sg_tmp, host->sg_len, i) {
 		if (sg_tmp->offset & align)
@@ -232,7 +232,7 @@ static void renesas_sdhi_sys_dmac_start_dma_tx(struct tmio_mmc_host *host)
 	dma_cookie_t cookie;
 	int ret, i;
 	bool aligned = true, multiple = true;
-	unsigned int align = (1 << host->pdata->alignment_shift) - 1;
+	unsigned int align = 1;	/* 2-byte alignment */
 
 	for_each_sg(sg, sg_tmp, host->sg_len, i) {
 		if (sg_tmp->offset & align)
diff --git a/include/linux/mfd/tmio.h b/include/linux/mfd/tmio.h
index 27264fe4b3b9..e8bf90281ba0 100644
--- a/include/linux/mfd/tmio.h
+++ b/include/linux/mfd/tmio.h
@@ -102,7 +102,6 @@ struct tmio_mmc_data {
 	unsigned long			capabilities2;
 	unsigned long			flags;
 	u32				ocr_mask;	/* available voltages */
-	int				alignment_shift;
 	dma_addr_t			dma_rx_offset;
 	unsigned int			max_blk_count;
 	unsigned short			max_segs;
-- 
2.35.1

