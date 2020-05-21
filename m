Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2A5171DC742
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 21 May 2020 09:01:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728250AbgEUHBV (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 21 May 2020 03:01:21 -0400
Received: from relmlor1.renesas.com ([210.160.252.171]:15628 "EHLO
        relmlie5.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726938AbgEUHBV (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 21 May 2020 03:01:21 -0400
X-IronPort-AV: E=Sophos;i="5.73,416,1583161200"; 
   d="scan'208";a="47651283"
Received: from unknown (HELO relmlir5.idc.renesas.com) ([10.200.68.151])
  by relmlie5.idc.renesas.com with ESMTP; 21 May 2020 16:01:19 +0900
Received: from localhost.localdomain (unknown [10.166.252.89])
        by relmlir5.idc.renesas.com (Postfix) with ESMTP id 77F3F400C755;
        Thu, 21 May 2020 16:01:19 +0900 (JST)
From:   Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
To:     ulf.hansson@linaro.org, wsa+renesas@sang-engineering.com
Cc:     linux-mmc@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Subject: [PATCH 1/3] mmc: tmio: core: Add end operation into tmio_mmc_dma_ops
Date:   Thu, 21 May 2020 16:01:04 +0900
Message-Id: <1590044466-28372-2-git-send-email-yoshihiro.shimoda.uh@renesas.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1590044466-28372-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
References: <1590044466-28372-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Related drivers like renesas_sdhi_internal_dmac are possible
to lack dma unmaping in error cases (for example response timeout).

Since tmio_mmc_finish_request() will be always called in any case,
to fix the issue, add end operation into struct tmio_mmc_dma_ops and
call the operation in tmio_mmc_finish_request() to call dma_ummap API
by the related drivers correctly.

Signed-off-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
---
 drivers/mmc/host/tmio_mmc.h      | 3 +++
 drivers/mmc/host/tmio_mmc_core.c | 8 ++++++++
 2 files changed, 11 insertions(+)

diff --git a/drivers/mmc/host/tmio_mmc.h b/drivers/mmc/host/tmio_mmc.h
index b4cf101..0a4f365 100644
--- a/drivers/mmc/host/tmio_mmc.h
+++ b/drivers/mmc/host/tmio_mmc.h
@@ -118,6 +118,9 @@ struct tmio_mmc_dma_ops {
 	void (*release)(struct tmio_mmc_host *host);
 	void (*abort)(struct tmio_mmc_host *host);
 	void (*dataend)(struct tmio_mmc_host *host);
+
+	/* optional */
+	void (*end)(struct tmio_mmc_host *host);	/* held host->lock */
 };
 
 struct tmio_mmc_host {
diff --git a/drivers/mmc/host/tmio_mmc_core.c b/drivers/mmc/host/tmio_mmc_core.c
index d7fde57..946fb01 100644
--- a/drivers/mmc/host/tmio_mmc_core.c
+++ b/drivers/mmc/host/tmio_mmc_core.c
@@ -57,6 +57,12 @@ static inline void tmio_mmc_start_dma(struct tmio_mmc_host *host,
 		host->dma_ops->start(host, data);
 }
 
+static inline void tmio_mmc_end_dma(struct tmio_mmc_host *host)
+{
+	if (host->dma_ops && host->dma_ops->end)
+		host->dma_ops->end(host);
+}
+
 static inline void tmio_mmc_enable_dma(struct tmio_mmc_host *host, bool enable)
 {
 	if (host->dma_ops)
@@ -797,6 +803,8 @@ static void tmio_mmc_finish_request(struct tmio_mmc_host *host)
 
 	spin_lock_irqsave(&host->lock, flags);
 
+	tmio_mmc_end_dma(host);
+
 	mrq = host->mrq;
 	if (IS_ERR_OR_NULL(mrq)) {
 		spin_unlock_irqrestore(&host->lock, flags);
-- 
2.7.4

