Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7861363369C
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 22 Nov 2022 09:06:12 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232361AbiKVIGK (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 22 Nov 2022 03:06:10 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43416 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232440AbiKVIGJ (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 22 Nov 2022 03:06:09 -0500
Received: from mail.zeus03.de (www.zeus03.de [194.117.254.33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DF8473E0A3
        for <linux-renesas-soc@vger.kernel.org>; Tue, 22 Nov 2022 00:06:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple; d=sang-engineering.com; h=
        from:to:cc:subject:date:message-id:mime-version
        :content-transfer-encoding; s=k1; bh=o0fa1HEr9vZ107vfHlc1Gai8454
        sHlcyCcDHT0d5hRY=; b=1eqsbELF0c3bqiItB637rZjgU8IWUECkmy/GE5DboXr
        +FKceuS9XFOP5pebwe6vulAKOHabNaJfH4o1BLLivCDzd3Ljv5ttvHUmpbTgCOai
        +e5Fcgy6vbNb1oivMW/Zl35kc7nghg9iRGBeoOl0t2zC6Xq52dF7aNDYsxl7pyZ8
        =
Received: (qmail 162135 invoked from network); 22 Nov 2022 09:06:03 +0100
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 22 Nov 2022 09:06:03 +0100
X-UD-Smtp-Session: l3s3148p1@vKp6pAruzshehh99
From:   Wolfram Sang <wsa+renesas@sang-engineering.com>
To:     linux-mmc@vger.kernel.org
Cc:     linux-renesas-soc@vger.kernel.org,
        Wolfram Sang <wsa+renesas@sang-engineering.com>,
        kernel test robot <lkp@intel.com>,
        Dan Carpenter <error27@gmail.com>
Subject: [PATCH] mmc: renesas_sdhi: use plain numbers for end_flags
Date:   Tue, 22 Nov 2022 09:05:54 +0100
Message-Id: <20221122080554.4468-1-wsa+renesas@sang-engineering.com>
X-Mailer: git-send-email 2.30.2
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

Linux *_bit accessors take plain bit numbers, no need for BIT().

Fixes: 8d901e2ba566 ("mmc: renesas_sdhi: take DMA end interrupts into account")
Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Dan Carpenter <error27@gmail.com>
Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
---
 drivers/mmc/host/renesas_sdhi.h | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/mmc/host/renesas_sdhi.h b/drivers/mmc/host/renesas_sdhi.h
index ea2a85174a09..68da3da9e2e5 100644
--- a/drivers/mmc/host/renesas_sdhi.h
+++ b/drivers/mmc/host/renesas_sdhi.h
@@ -57,8 +57,8 @@ struct renesas_sdhi_of_data_with_quirks {
 };
 
 /* We want both end_flags to be set before we mark DMA as finished */
-#define SDHI_DMA_END_FLAG_DMA		BIT(0)
-#define SDHI_DMA_END_FLAG_ACCESS	BIT(1)
+#define SDHI_DMA_END_FLAG_DMA		0
+#define SDHI_DMA_END_FLAG_ACCESS	1
 
 struct renesas_sdhi_dma {
 	unsigned long end_flags;
-- 
2.30.2

