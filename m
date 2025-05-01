Return-Path: <linux-renesas-soc+bounces-16556-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C1D23AA5B11
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  1 May 2025 08:33:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 881EE9C3F88
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  1 May 2025 06:33:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 440A72698AF;
	Thu,  1 May 2025 06:33:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="Asnybxg9"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 12988267737
	for <linux-renesas-soc@vger.kernel.org>; Thu,  1 May 2025 06:33:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746081225; cv=none; b=nzLxF1nKu3p7xMSQoBSCYL0Zlh+lD7lHZXOSU2pD/1FXmoMOFCM0H6jEgvUh+bXLJS/DHknf+KOSBgmBh9Sopzjq0pv6v4llsPQFfHqVy3vRwKMHvg3HTtcJ5XYz8dqaPAJDbiaPrl7gfGiqeeXFzX8U4mqO6F/DVaWxT4uO1l4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746081225; c=relaxed/simple;
	bh=ecbACzPy39p95R97CpSCacApIs0icmXCsDH9drxjUY8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=tP6zVqnUYtUtjkpZG8ZPuIbrNhLITEuhLSp5JoqQG0J9zpeDO7qHJkJEG73c6Eo4p/wUkLPYLcxmHjVK6EI+QGi/DPdYrEOqaFXcIQe2oWsAa/ufDfjq7Ls20SmAsQuVVlZ3WUYIFjmB09jEfY+uIpoki33wYxhIHCS1HSugSJM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=Asnybxg9; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=from:to:cc:subject:date:message-id
	:in-reply-to:references:mime-version:content-transfer-encoding;
	 s=k1; bh=2NUkxT3gMNLMshJrCeUCzjstWuAyu9X7YPevdt1nbRg=; b=Asnybx
	g9vnY/67VHlxM77nFvk++zYtmqN2Uq8fj3YTHxX3uz+LASBz4873PezOJSnY4J1v
	imxlemK/rJBrmR9XuJehoo5+SDb2R5g4QEW/w0ZzrFRu8RVlM02pIaWn+yqTASQL
	j3Q3MDcBx/iaYww5sEaod2nTB8nAElu1+IengZ7rxcB6SziBBJOtHNFzqaiVOapD
	OIJgehYDNw4iZEVrdvI4MOoIqLnZ5bHhDffjblD5pRkOBjMCVoEh3gQAcqWF2xaB
	MR6dNJVJhP99x6U0e5LOlMEPCigIMyn/YwzGQ66MCicyYP39bcAOmp+fmOy92Gq1
	Vb/ez9qm2x0BUolg==
Received: (qmail 958453 invoked from network); 1 May 2025 08:33:41 +0200
Received: by mail.zeus03.de with UTF8SMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 1 May 2025 08:33:41 +0200
X-UD-Smtp-Session: l3s3148p1@quTqNg00SuAujnsd
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: linux-renesas-soc@vger.kernel.org
Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Ulf Hansson <ulf.hansson@linaro.org>,
	linux-mmc@vger.kernel.org
Subject: [PATCH 2/4] mmc: rename mmc_host_done_complete() to mmc_host_can_done_complete()
Date: Thu,  1 May 2025 08:33:27 +0200
Message-ID: <20250501063325.7262-8-wsa+renesas@sang-engineering.com>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250501063325.7262-6-wsa+renesas@sang-engineering.com>
References: <20250501063325.7262-6-wsa+renesas@sang-engineering.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

It is not obvious that this functions checks capabilities. Rename it to
include '_can' like other capability helpers.

Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
---
 drivers/mmc/core/block.c | 6 +++---
 drivers/mmc/core/host.h  | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/mmc/core/block.c b/drivers/mmc/core/block.c
index f9ad45476552..585c2b274d98 100644
--- a/drivers/mmc/core/block.c
+++ b/drivers/mmc/core/block.c
@@ -2278,7 +2278,7 @@ void mmc_blk_mq_recovery(struct mmc_queue *mq)
 static void mmc_blk_mq_complete_prev_req(struct mmc_queue *mq,
 					 struct request **prev_req)
 {
-	if (mmc_host_done_complete(mq->card->host))
+	if (mmc_host_can_done_complete(mq->card->host))
 		return;
 
 	mutex_lock(&mq->complete_lock);
@@ -2317,7 +2317,7 @@ static void mmc_blk_mq_req_done(struct mmc_request *mrq)
 	struct mmc_host *host = mq->card->host;
 	unsigned long flags;
 
-	if (!mmc_host_done_complete(host)) {
+	if (!mmc_host_can_done_complete(host)) {
 		bool waiting;
 
 		/*
@@ -2430,7 +2430,7 @@ static int mmc_blk_mq_issue_rw_rq(struct mmc_queue *mq,
 		mq->rw_wait = false;
 
 	/* Release re-tuning here where there is no synchronization required */
-	if (err || mmc_host_done_complete(host))
+	if (err || mmc_host_can_done_complete(host))
 		mmc_retune_release(host);
 
 out_post_req:
diff --git a/drivers/mmc/core/host.h b/drivers/mmc/core/host.h
index c8515cb86192..00ca88389ef9 100644
--- a/drivers/mmc/core/host.h
+++ b/drivers/mmc/core/host.h
@@ -44,7 +44,7 @@ static inline int mmc_host_can_cmd23(struct mmc_host *host)
 	return host->caps & MMC_CAP_CMD23;
 }
 
-static inline bool mmc_host_done_complete(struct mmc_host *host)
+static inline bool mmc_host_can_done_complete(struct mmc_host *host)
 {
 	return host->caps & MMC_CAP_DONE_COMPLETE;
 }
-- 
2.47.2


