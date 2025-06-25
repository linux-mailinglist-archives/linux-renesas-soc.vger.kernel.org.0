Return-Path: <linux-renesas-soc+bounces-18689-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id AE284AE78C6
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 25 Jun 2025 09:38:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E435D3AE85C
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 25 Jun 2025 07:37:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 941482222B6;
	Wed, 25 Jun 2025 07:35:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="CXNTs4Vl"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CAAE220E01E
	for <linux-renesas-soc@vger.kernel.org>; Wed, 25 Jun 2025 07:35:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750836922; cv=none; b=gkcd4epxIbkS+ck1BobBGP3A59E5fDpSWYREY/CUCeqHEdvLfA/2eUm0QjCnx0IlTuq7/jiHK5182/VEcTL//w069cs2lVLddhh5kCPuAeYVcIZe7ZtxsCIHpLHqakHceWu0YXlslKIYcGxgKwg1uxZN1u7gGyHEa6gVcYJaGwQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750836922; c=relaxed/simple;
	bh=sflBVlr+9IVLEnUxucjZ+G7JH1O0rBqA/jK6INqPOSg=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=by4ZZp12OXK3ko+dxjht0rf1Khzeg2yx2XfeO5d5k25i76vPcAo4/7lIGCE7T8nrPZ6Nq4OauqBkiMY1/fMRjWZkrBZqVsr5rTY1Y+wU48NyCLqKvOunjscPZzGI3tHUuqksLL8q5IT1jAvvghahhjd2knwSbq9x5PvyTz9e6ek=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=CXNTs4Vl; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=from:to:cc:subject:date:message-id
	:mime-version:content-transfer-encoding; s=k1; bh=/tne3i1Y/FG1s6
	gAGfKy1Rgq6xzDr4FFhCufsZsqXjo=; b=CXNTs4VlNyY2Hty7PaaWp+cH8TZbdA
	ghN38IidE4J9qDqxuPppr0UThOB0akM2kQrovcHG4A+RYx4CW2RzrTlmxrPCZHbu
	Q8R2ydLFWH4ZMnaAPasUyzEdR4BrYfeMqMc44haB8Mxzlyx/6fsJ1t6fNMHkKx6g
	s+ZtIznrdoFsLtAvGCP6zng6Y+/DamfpCh/xYQ9dam4Ey3kMIHUPLcgXY1/7bgAr
	/Qn0WQLsxI3yFsPE9AMT8SyUTtb+1UZ7nhPgtvou2adghu0mDzu29BxcJHhet63y
	NgIEWY3GF+LbcVRzElSqX3Lkjoxxq6JzgkiVGem4AeRtBb7T8ngAWQ/g==
Received: (qmail 550592 invoked from network); 25 Jun 2025 09:35:16 +0200
Received: by mail.zeus03.de with UTF8SMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 25 Jun 2025 09:35:16 +0200
X-UD-Smtp-Session: l3s3148p1@PYpufGA4eNRtKLNf
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: linux-renesas-soc@vger.kernel.org
Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Frank Li <Frank.Li@nxp.com>,
	linux-i3c@lists.infradead.org
Subject: [PATCH] i3c: don't fail if GETHDRCAP is unsupported
Date: Wed, 25 Jun 2025 09:34:52 +0200
Message-ID: <20250625073505.7949-1-wsa+renesas@sang-engineering.com>
X-Mailer: git-send-email 2.47.2
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

If a target has the HDR_CAP bit set in BCR, the core wants to get
additional information using the CCC 'GETHDRCAP'. Not all controllers
support this CCC, though. This is not fatal. We can just skip it. The
information is not needed if the controller won't support HDR anyhow.

Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
---

Found during the I3C plugfest in Warsaw.

 drivers/i3c/master.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/i3c/master.c b/drivers/i3c/master.c
index 204b96e6be1e..b6b96cf9e4e0 100644
--- a/drivers/i3c/master.c
+++ b/drivers/i3c/master.c
@@ -1440,7 +1440,7 @@ static int i3c_master_retrieve_dev_info(struct i3c_dev_desc *dev)
 
 	if (dev->info.bcr & I3C_BCR_HDR_CAP) {
 		ret = i3c_master_gethdrcap_locked(master, &dev->info);
-		if (ret)
+		if (ret && ret != -ENOTSUPP)
 			return ret;
 	}
 
-- 
2.47.2


