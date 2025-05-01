Return-Path: <linux-renesas-soc+bounces-16559-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id BA143AA5B17
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  1 May 2025 08:33:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 7C8939C3D81
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  1 May 2025 06:33:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E87D326C382;
	Thu,  1 May 2025 06:33:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="k1c/MKxE"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A01171E51FA
	for <linux-renesas-soc@vger.kernel.org>; Thu,  1 May 2025 06:33:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746081226; cv=none; b=iglF6bbq+vF3rwoaeTQ6h2OcQOif4bxA52JgijdkIXMKCqCi2u8d57RUX/H4FeOyY8hiaTPJMq6WK78bR0M2iGSykEteRaqY15BjC35kxEmDAWn5ciBfaH3RwgB3tV+ldk5CkShx6gQTQbyC6P3rjRz2QBfig9lhwadzO9/B2MQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746081226; c=relaxed/simple;
	bh=XfXUt4Zl6R5fpJBOyggy99HXvsMF0WIFYMom86ZOcHQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=nCAxpffkR0PxsVlsl3Gi9H4PHKmt/0mVHxGt7yABbAuqdhc5mCScIqHxpCOkdu5q67/S3uNyjy12er574Lhuait43rKjHqY7ImVYOv7wU/N7d6CwcsXKhfoFnujCIT8amRX2oh6q7V06drEiIpyKDkiaYH98e79/TZlf3EIwhr0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=k1c/MKxE; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=from:to:cc:subject:date:message-id
	:in-reply-to:references:mime-version:content-transfer-encoding;
	 s=k1; bh=1ZwejgDjHKdWmk57jMLZSxxGSA4Ke16d1wLzbg5E4nQ=; b=k1c/MK
	xEDBFutEQJOhpHD6L5zJPVq/8IRv2+XkVGbqgfkFmr7bVCAXUm1xF5TqKIK7U5aW
	zbzzEHdL56IDohOTvkNnlreIFVAZtCFxzFQ7b0nPF2AJslKAaNKRFN6GvKLw8sfe
	Yr8VjDEyRYigpODl7BzQPlgb/SrjwMn7Pt8O7RQB8BabcArWl/DdqXBhzFTlWtrM
	EImpCUpzTxYEgnWqoo4DXS5n6NGR1/zodUeiASwqxy0dW2n50w6m7F/q8zKOq7kt
	HMwg1MrqXyK5qyiIjN5dmYG1w+XpIVXtY49qf6iz5e6kQdjZfflKMf2m4lLmcSd7
	Hr67/KH34052zSHQ==
Received: (qmail 958508 invoked from network); 1 May 2025 08:33:42 +0200
Received: by mail.zeus03.de with UTF8SMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 1 May 2025 08:33:42 +0200
X-UD-Smtp-Session: l3s3148p1@Jq8CNw00YuAujnsd
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: linux-renesas-soc@vger.kernel.org
Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Ulf Hansson <ulf.hansson@linaro.org>,
	linux-mmc@vger.kernel.org
Subject: [PATCH 4/4] mmc: rename mmc_boot_partition_access() to mmc_host_can_access_boot()
Date: Thu,  1 May 2025 08:33:29 +0200
Message-ID: <20250501063325.7262-10-wsa+renesas@sang-engineering.com>
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
include '_can' like other capability helpers and reword it slightly.

Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
---
 drivers/mmc/core/host.h | 2 +-
 drivers/mmc/core/mmc.c  | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/mmc/core/host.h b/drivers/mmc/core/host.h
index c112191cad6a..5941d68ff989 100644
--- a/drivers/mmc/core/host.h
+++ b/drivers/mmc/core/host.h
@@ -49,7 +49,7 @@ static inline bool mmc_host_can_done_complete(struct mmc_host *host)
 	return host->caps & MMC_CAP_DONE_COMPLETE;
 }
 
-static inline int mmc_boot_partition_access(struct mmc_host *host)
+static inline int mmc_host_can_access_boot(struct mmc_host *host)
 {
 	return !(host->caps2 & MMC_CAP2_BOOTPART_NOACC);
 }
diff --git a/drivers/mmc/core/mmc.c b/drivers/mmc/core/mmc.c
index c2b92b508438..5be9b42d5057 100644
--- a/drivers/mmc/core/mmc.c
+++ b/drivers/mmc/core/mmc.c
@@ -459,7 +459,7 @@ static int mmc_decode_ext_csd(struct mmc_card *card, u8 *ext_csd)
 		 * There are two boot regions of equal size, defined in
 		 * multiples of 128K.
 		 */
-		if (ext_csd[EXT_CSD_BOOT_MULT] && mmc_boot_partition_access(card->host)) {
+		if (ext_csd[EXT_CSD_BOOT_MULT] && mmc_host_can_access_boot(card->host)) {
 			for (idx = 0; idx < MMC_NUM_BOOT_PARTITION; idx++) {
 				part_size = ext_csd[EXT_CSD_BOOT_MULT] << 17;
 				mmc_part_add(card, part_size,
-- 
2.47.2


