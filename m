Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0ECA91EF515
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  5 Jun 2020 12:12:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726441AbgFEKMe (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 5 Jun 2020 06:12:34 -0400
Received: from www.zeus03.de ([194.117.254.33]:34704 "EHLO mail.zeus03.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726393AbgFEKMd (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 5 Jun 2020 06:12:33 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple; d=sang-engineering.com; h=
        from:to:cc:subject:date:message-id:in-reply-to:references
        :mime-version:content-transfer-encoding; s=k1; bh=geolHvEIFJdhr1
        O7xNDDaH9ERBFP97XHJhFBPhVVr8o=; b=axwqmy9zptGY5TlbHtJ6MWWJNWD1rt
        lahNPy1ILHk23hp21FWg7YHrrV2+46lTXRlYAXE7jLHrrE2US3Stj4kaThhJ8S7O
        bK3Sf8o880JJsc0QDOC97jabiG6UF+eqq8w+KmDZkdtr7eeHUXmhGEmV7QByRPfb
        pCig5+UEwsOh0=
Received: (qmail 2053870 invoked from network); 5 Jun 2020 12:12:31 +0200
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 5 Jun 2020 12:12:31 +0200
X-UD-Smtp-Session: l3s3148p1@963Hf1OnmJsgAwDPXwgPAMwULGf5QH9H
From:   Wolfram Sang <wsa+renesas@sang-engineering.com>
To:     linux-mmc@vger.kernel.org
Cc:     linux-renesas-soc@vger.kernel.org,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>
Subject: [PATCH 1/2] mmc: tmio: add generic hook to fixup after a completed request
Date:   Fri,  5 Jun 2020 12:12:21 +0200
Message-Id: <20200605101222.10783-2-wsa+renesas@sang-engineering.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200605101222.10783-1-wsa+renesas@sang-engineering.com>
References: <20200605101222.10783-1-wsa+renesas@sang-engineering.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Sadly, due to HW bugs, we need a callback to work around issues just
before completing the request.

Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
---
 drivers/mmc/host/tmio_mmc.h      | 1 +
 drivers/mmc/host/tmio_mmc_core.c | 3 +++
 2 files changed, 4 insertions(+)

diff --git a/drivers/mmc/host/tmio_mmc.h b/drivers/mmc/host/tmio_mmc.h
index b4cf10109162..766a6116a9d1 100644
--- a/drivers/mmc/host/tmio_mmc.h
+++ b/drivers/mmc/host/tmio_mmc.h
@@ -177,6 +177,7 @@ struct tmio_mmc_host {
 	void (*reset)(struct tmio_mmc_host *host);
 	void (*hw_reset)(struct tmio_mmc_host *host);
 	bool (*check_retune)(struct tmio_mmc_host *host);
+	void (*fixup_request)(struct tmio_mmc_host *host, struct mmc_request *mrq);
 
 	/*
 	 * Mandatory callback for tuning to occur which is optional for SDR50
diff --git a/drivers/mmc/host/tmio_mmc_core.c b/drivers/mmc/host/tmio_mmc_core.c
index d7fde57c78c1..1672c849f78a 100644
--- a/drivers/mmc/host/tmio_mmc_core.c
+++ b/drivers/mmc/host/tmio_mmc_core.c
@@ -827,6 +827,9 @@ static void tmio_mmc_finish_request(struct tmio_mmc_host *host)
 		return;
 	}
 
+	if (host->fixup_request)
+		host->fixup_request(host, mrq);
+
 	mmc_request_done(host->mmc, mrq);
 }
 
-- 
2.20.1

