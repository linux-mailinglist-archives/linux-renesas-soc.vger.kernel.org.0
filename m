Return-Path: <linux-renesas-soc+bounces-15097-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C2096A75D32
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 31 Mar 2025 00:18:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 291EE3A9572
	for <lists+linux-renesas-soc@lfdr.de>; Sun, 30 Mar 2025 22:18:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A7CDD142E67;
	Sun, 30 Mar 2025 22:18:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="hE4ElmBI"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A34920E6
	for <linux-renesas-soc@vger.kernel.org>; Sun, 30 Mar 2025 22:18:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743373120; cv=none; b=CdPMC7UxVL1dDRN9ADnKOntFa3OJyaChdAyUYu4+flC0IF/Bk9SLSBq9la2prgw9pHYXnKX4VlS/3vMzwgsmJp6kZqIIb0OJIbH2WJu5fniTtiahwTmotfR4DgF6sKwJuPVtnTcFEoexfqyk6HqRSi6B/lEyD0DrOZdgJsYOeIM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743373120; c=relaxed/simple;
	bh=NFQR+avR1YxBoZVq7kiCZHn7yorwqli622vdzhUsYpU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=rAs1dJMriu8uFszyJeffQCR7ZXZcE1/YaDpFFF85uVA9AL03BmGbOwXDuNnGHsYR37JRNLyEgvn8BgQWXv+gtljxDayPzq8WNiqJ8AFb/AzOXtEwbbUH+QCOLHI3K69EH2u6gCa/yMbXHSSbc/DcEa0t5Jg6V+BkXjc9OczQkv0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=hE4ElmBI; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=from:to:cc:subject:date:message-id
	:mime-version:content-transfer-encoding; s=k1; bh=Q+G28VqEwdatj2
	LFpUpYFICI9fp8iff5ZBxtMOvu0RQ=; b=hE4ElmBIDZXFMIO2dMjoM+ltwAFA+j
	t7GNxqKKs+OWhrtXhEMDUsYub9+IhmeFIoSUR37Q29Dzb7dG5Z6H9DaTW9OJil8F
	vk08vXSXiwW0bFUyr2oBFcB4TLwhGyZ/HIDrmSNaQp1ax69icdi6T64CZTLtOpJ2
	aLi4AICzZvT26dS0zIJdVSfn5VYGUMsw+2YiPSnhWDxOzahWnwBjAGIHl5ztwGkl
	lB27+gYphb4z6kiTf+t1x5W4RgwBmNoLSPGKFnA5f9tPpoydELsDVt2Km7SeVsnL
	+EKu0FoVN0PHxo9zakYYSL5zwPC0QEbtKAQD0t6lA8u58PCPeKHga3+Q==
Received: (qmail 1006991 invoked from network); 31 Mar 2025 00:18:36 +0200
Received: by mail.zeus03.de with UTF8SMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 31 Mar 2025 00:18:36 +0200
X-UD-Smtp-Session: l3s3148p1@9BFGr5Yx6IlQ8qei
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: linux-renesas-soc@vger.kernel.org
Cc: Biju Das <biju.das.jz@bp.renesas.com>,
	Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Ulf Hansson <ulf.hansson@linaro.org>,
	linux-mmc@vger.kernel.org
Subject: [PATCH] mmc: renesas_sdhi: disable clocks if registering regulator failed
Date: Mon, 31 Mar 2025 00:17:32 +0200
Message-ID: <20250330221732.56072-2-wsa+renesas@sang-engineering.com>
X-Mailer: git-send-email 2.47.2
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Because the clocks were just enabled, bail out to the proper target if
there are problems with the regulator.

Fixes: fae80a99dc03 ("mmc: renesas_sdhi: Add support for RZ/G3E SoC")
Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
---
 drivers/mmc/host/renesas_sdhi_core.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/mmc/host/renesas_sdhi_core.c b/drivers/mmc/host/renesas_sdhi_core.c
index cea6af5daf99..8c83e203c516 100644
--- a/drivers/mmc/host/renesas_sdhi_core.c
+++ b/drivers/mmc/host/renesas_sdhi_core.c
@@ -1179,7 +1179,7 @@ int renesas_sdhi_probe(struct platform_device *pdev,
 		if (IS_ERR(rdev)) {
 			dev_err(dev, "regulator register failed err=%ld", PTR_ERR(rdev));
 			ret = PTR_ERR(rdev);
-			goto efree;
+			goto edisclk;
 		}
 		priv->rdev = rdev;
 	}
-- 
2.47.2


