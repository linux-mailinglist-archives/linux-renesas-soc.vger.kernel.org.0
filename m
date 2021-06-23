Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 552683B1758
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 23 Jun 2021 11:57:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230304AbhFWJ7y (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 23 Jun 2021 05:59:54 -0400
Received: from www.zeus03.de ([194.117.254.33]:50008 "EHLO mail.zeus03.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230103AbhFWJ7y (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 23 Jun 2021 05:59:54 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple; d=sang-engineering.com; h=
        from:to:cc:subject:date:message-id:in-reply-to:references
        :mime-version:content-transfer-encoding; s=k1; bh=MoW0KjpEss8Low
        ezwgSPse++B92AKDslAK7UfbEv+b4=; b=zvQYvGuxEjCQiJNOBZHTAAmvrS+pPw
        y5U6BqDBY55H4ZP1sNplwvbi0W1AH3agwxeihX+EEsqxwlSOkdAMkoheUwbMmgzJ
        QxbFkKHT0rvHGsSCh3eZ4WfP9gUgmuREhy5A/L7cAOkCzMvPnZhndQFuI1FvNTNI
        TEe9HG/lXJAaA=
Received: (qmail 2550992 invoked from network); 23 Jun 2021 11:57:35 +0200
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 23 Jun 2021 11:57:35 +0200
X-UD-Smtp-Session: l3s3148p1@jhCV72vFAqogARa4RfhaAavnjlTTqzSz
From:   Wolfram Sang <wsa+renesas@sang-engineering.com>
To:     linux-mmc@vger.kernel.org
Cc:     linux-renesas-soc@vger.kernel.org,
        Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Ulf Hansson <ulf.hansson@linaro.org>,
        linux-kernel@vger.kernel.org
Subject: [PATCH 1/3] mmc: renesas_sdhi_sys_dmac: : use proper DMAENGINE API for termination
Date:   Wed, 23 Jun 2021 11:57:31 +0200
Message-Id: <20210623095734.3046-2-wsa+renesas@sang-engineering.com>
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
 drivers/mmc/host/renesas_sdhi_sys_dmac.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/mmc/host/renesas_sdhi_sys_dmac.c b/drivers/mmc/host/renesas_sdhi_sys_dmac.c
index ffa64211f4de..6956b83469c8 100644
--- a/drivers/mmc/host/renesas_sdhi_sys_dmac.c
+++ b/drivers/mmc/host/renesas_sdhi_sys_dmac.c
@@ -108,9 +108,9 @@ static void renesas_sdhi_sys_dmac_abort_dma(struct tmio_mmc_host *host)
 	renesas_sdhi_sys_dmac_enable_dma(host, false);
 
 	if (host->chan_rx)
-		dmaengine_terminate_all(host->chan_rx);
+		dmaengine_terminate_sync(host->chan_rx);
 	if (host->chan_tx)
-		dmaengine_terminate_all(host->chan_tx);
+		dmaengine_terminate_sync(host->chan_tx);
 
 	renesas_sdhi_sys_dmac_enable_dma(host, true);
 }
-- 
2.30.2

