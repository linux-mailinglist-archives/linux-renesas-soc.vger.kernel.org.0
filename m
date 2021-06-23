Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6A2B63B175C
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 23 Jun 2021 11:57:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230290AbhFWJ75 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 23 Jun 2021 05:59:57 -0400
Received: from www.zeus03.de ([194.117.254.33]:50016 "EHLO mail.zeus03.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230291AbhFWJ7y (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 23 Jun 2021 05:59:54 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple; d=sang-engineering.com; h=
        from:to:cc:subject:date:message-id:in-reply-to:references
        :mime-version:content-transfer-encoding; s=k1; bh=ru/haiSqwJUKlj
        7A8LzzyC+e0AChBD2VjnJ0lwJsqA8=; b=uNpdLXYWRS/XE+0ylUrhZEPq1y5o/+
        S7ppqcdSJ7ityNhlIJOsY5ikND0zyzcesxcEO5CzppSHBf6QfpjB2rN6Ex17Kh7j
        AYp0wzlpOrB8dSBzfNybNddWyr5WKKHOXawWmrBAFMRR0PWOK3fttU6RmwKVvP9o
        dTuv3JwHuvNi4=
Received: (qmail 2551028 invoked from network); 23 Jun 2021 11:57:36 +0200
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 23 Jun 2021 11:57:36 +0200
X-UD-Smtp-Session: l3s3148p1@df2d72vFBKogARa4RfhaAavnjlTTqzSz
From:   Wolfram Sang <wsa+renesas@sang-engineering.com>
To:     linux-mmc@vger.kernel.org
Cc:     linux-renesas-soc@vger.kernel.org,
        Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Ulf Hansson <ulf.hansson@linaro.org>,
        linux-kernel@vger.kernel.org
Subject: [PATCH 2/3] mmc: sh_mmcif: : use proper DMAENGINE API for termination
Date:   Wed, 23 Jun 2021 11:57:32 +0200
Message-Id: <20210623095734.3046-3-wsa+renesas@sang-engineering.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210623095734.3046-1-wsa+renesas@sang-engineering.com>
References: <20210623095734.3046-1-wsa+renesas@sang-engineering.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

dmaengine_terminate_all() is deprecated in favor of explicitly saying if
it should be sync or async. Here, we want dmaengine_terminate_sync()
because there is no other synchronization code in the driver to handle
an async case.

Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
---
 drivers/mmc/host/sh_mmcif.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/mmc/host/sh_mmcif.c b/drivers/mmc/host/sh_mmcif.c
index e5e457037235..bcc595c70a9f 100644
--- a/drivers/mmc/host/sh_mmcif.c
+++ b/drivers/mmc/host/sh_mmcif.c
@@ -1164,9 +1164,9 @@ static bool sh_mmcif_end_cmd(struct sh_mmcif_host *host)
 		data->bytes_xfered = 0;
 		/* Abort DMA */
 		if (data->flags & MMC_DATA_READ)
-			dmaengine_terminate_all(host->chan_rx);
+			dmaengine_terminate_sync(host->chan_rx);
 		else
-			dmaengine_terminate_all(host->chan_tx);
+			dmaengine_terminate_sync(host->chan_tx);
 	}
 
 	return false;
-- 
2.30.2

