Return-Path: <linux-renesas-soc+bounces-16557-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 00B17AA5B16
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  1 May 2025 08:33:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 9E80B7A4B6D
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  1 May 2025 06:32:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BCC7F2609F1;
	Thu,  1 May 2025 06:33:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="PZOLGFkv"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 98DFB25D1E2
	for <linux-renesas-soc@vger.kernel.org>; Thu,  1 May 2025 06:33:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746081225; cv=none; b=HXsXNN0L613+Rpj8oJvvC7oBiPEM41ItmKF1sYLikvSDdsIgA649zkTQcI4XTetd9TmFWQgN0rd4sqLsNiiVp5rVZVVqG68fZJYzmRfjZnnoF4KQ9HobNpKXjgsoYk53bwW617MR8Q2eli9kRYRV/PY6KEgjkRQzghMHpSmj71o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746081225; c=relaxed/simple;
	bh=LuB8JJJYhv13Sgyr1tEG1cx9hRSs2IETfzpggh65D5o=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=rf5hJKc+ykLWg5dOlDETkqZWwDlhottDEWm89iGxvRbcsxXnacKcI+DrfeFGfto/KviivN6Vy3+e8ivB4g6haLUuYSjDle7U42F8SBOpg8sFmCc5L1xPzi//fefEbHJTM+bPoCHX4owvczWgXwiPejav3H1/AHnlg6JWi62JX9k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=PZOLGFkv; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=from:to:cc:subject:date:message-id
	:in-reply-to:references:mime-version:content-transfer-encoding;
	 s=k1; bh=+OS5yhiLM7ssv8cgCBmUWDXFs7PxiNO8czKRFFUJzcQ=; b=PZOLGF
	kvdrlGASN8EI3oIuTXIzs+ePJwxNmhOkKmo/BOQJFw+mK8LITtZQ/csCw0RiLaA8
	cXeMoCEOr39nRKSgju8WgKlGPQEhH/5/YCzdGnObEvNC12Pf0rdAW/nFM9iilEqG
	4/6M4AJRc7hZm2lJMepEsCJBp720uVewN6wC6AdykblIcyAOZf5FkHXEz/KmjNQW
	yLDBriaxZHDO6EsCiUEuFXPvZyeapX+CmQAjbCu/KOgMBp8GxZJPGfPENSqe5YZY
	J1Y+bxe+Xgl6H/SPBw2MEbeK9FwAX9hB7/6eU313fs6S6R3s7L7G8LYnk40L2r1I
	IMs2dutvvCzhbKxg==
Received: (qmail 958427 invoked from network); 1 May 2025 08:33:40 +0200
Received: by mail.zeus03.de with UTF8SMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 1 May 2025 08:33:40 +0200
X-UD-Smtp-Session: l3s3148p1@1UfcNg00PuAujnsd
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: linux-renesas-soc@vger.kernel.org
Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Ulf Hansson <ulf.hansson@linaro.org>,
	linux-mmc@vger.kernel.org
Subject: [PATCH 1/4] mmc: rename mmc_host_cmd23() to mmc_host_can_cmd23()
Date: Thu,  1 May 2025 08:33:26 +0200
Message-ID: <20250501063325.7262-7-wsa+renesas@sang-engineering.com>
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
 drivers/mmc/core/block.c    | 2 +-
 drivers/mmc/core/host.h     | 2 +-
 drivers/mmc/core/mmc.c      | 2 +-
 drivers/mmc/core/mmc_test.c | 4 ++--
 4 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/mmc/core/block.c b/drivers/mmc/core/block.c
index 63320cc441c1..f9ad45476552 100644
--- a/drivers/mmc/core/block.c
+++ b/drivers/mmc/core/block.c
@@ -2618,7 +2618,7 @@ static struct mmc_blk_data *mmc_blk_alloc_req(struct mmc_card *card,
 	 */
 	md->read_only = mmc_blk_readonly(card);
 
-	if (mmc_host_cmd23(card->host)) {
+	if (mmc_host_can_cmd23(card->host)) {
 		if ((mmc_card_mmc(card) &&
 		     card->csd.mmca_vsn >= CSD_SPEC_VER_3) ||
 		    (mmc_card_sd(card) && !mmc_card_ult_capacity(card) &&
diff --git a/drivers/mmc/core/host.h b/drivers/mmc/core/host.h
index 48c4952512a5..c8515cb86192 100644
--- a/drivers/mmc/core/host.h
+++ b/drivers/mmc/core/host.h
@@ -39,7 +39,7 @@ static inline void mmc_retune_recheck(struct mmc_host *host)
 		host->retune_now = 1;
 }
 
-static inline int mmc_host_cmd23(struct mmc_host *host)
+static inline int mmc_host_can_cmd23(struct mmc_host *host)
 {
 	return host->caps & MMC_CAP_CMD23;
 }
diff --git a/drivers/mmc/core/mmc.c b/drivers/mmc/core/mmc.c
index e499835b05a9..c2b92b508438 100644
--- a/drivers/mmc/core/mmc.c
+++ b/drivers/mmc/core/mmc.c
@@ -578,7 +578,7 @@ static int mmc_decode_ext_csd(struct mmc_card *card, u8 *ext_csd)
 		 * RPMB regions are defined in multiples of 128K.
 		 */
 		card->ext_csd.raw_rpmb_size_mult = ext_csd[EXT_CSD_RPMB_MULT];
-		if (ext_csd[EXT_CSD_RPMB_MULT] && mmc_host_cmd23(card->host)) {
+		if (ext_csd[EXT_CSD_RPMB_MULT] && mmc_host_can_cmd23(card->host)) {
 			mmc_part_add(card, ext_csd[EXT_CSD_RPMB_MULT] << 17,
 				EXT_CSD_PART_CONFIG_ACC_RPMB,
 				"rpmb", 0, false,
diff --git a/drivers/mmc/core/mmc_test.c b/drivers/mmc/core/mmc_test.c
index be2d2895b4c4..80e5d87a5e50 100644
--- a/drivers/mmc/core/mmc_test.c
+++ b/drivers/mmc/core/mmc_test.c
@@ -191,7 +191,7 @@ static void mmc_test_prepare_sbc(struct mmc_test_card *test,
 {
 	struct mmc_card *card = test->card;
 
-	if (!mrq->sbc || !mmc_host_cmd23(card->host) ||
+	if (!mrq->sbc || !mmc_host_can_cmd23(card->host) ||
 	    !mmc_test_card_cmd23(card) || !mmc_op_multi(mrq->cmd->opcode) ||
 	    (card->quirks & MMC_QUIRK_BLK_NO_CMD23)) {
 		mrq->sbc = NULL;
@@ -2390,7 +2390,7 @@ static int mmc_test_ongoing_transfer(struct mmc_test_card *test,
 			     512, write);
 
 	if (use_sbc && t->blocks > 1 && !mrq->sbc) {
-		ret =  mmc_host_cmd23(host) ?
+		ret =  mmc_host_can_cmd23(host) ?
 		       RESULT_UNSUP_CARD :
 		       RESULT_UNSUP_HOST;
 		goto out_free;
-- 
2.47.2


