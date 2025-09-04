Return-Path: <linux-renesas-soc+bounces-21352-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id D5F4AB440C1
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  4 Sep 2025 17:35:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 862DF5A5150
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  4 Sep 2025 15:35:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C76B927D77D;
	Thu,  4 Sep 2025 15:35:47 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A8943274B4A;
	Thu,  4 Sep 2025 15:35:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757000147; cv=none; b=KkOz/FVU//eo75WyeCSw/dQLOIudOzN9JcknQDLmBRT5eS4TWzKmMm/IzhEgsMQCCM4AFS022EaR5N4iPi332fd2v84VSEpsUXCa2qD5sMYCfukvYWW2a36icFKXFybqlQ9EcfWfQen1zTU10nUONiju8OSLyX01krhF+2TCbv4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757000147; c=relaxed/simple;
	bh=Ft6KnGY4c8PD7n8t21h4UKJGUFkWOKnwcy43iveeIJo=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=FVFw5TlEKvzQdjnRs2kAG9sxDfl9++LIzgo3N5gr6ZAFvppJbUtXQQhNSaHjHkB+fw9+tnk45WEwG+uCcTpmkMkL/dn7aYMua0hwy7JQe6AF/RgNQxlCL/5Lr0OlDNxfwbi1sVs7zOekZL3x0oawgm2YBqGrxQFcx63bG2gKMi0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3D526C4CEF0;
	Thu,  4 Sep 2025 15:35:46 +0000 (UTC)
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Ulf Hansson <ulf.hansson@linaro.org>,
	Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: linux-mmc@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	linux-sh@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH] mmc: sh_mmcif: Remove dummy PM resume callback
Date: Thu,  4 Sep 2025 17:35:43 +0200
Message-ID: <8b73e2071a1d87c8d09b8bb24fc35f371779c2f3.1757000061.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Unassigned system sleep callbacks were always treated the same as dummy
callbacks that just return zero.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
 drivers/mmc/host/sh_mmcif.c | 7 +------
 1 file changed, 1 insertion(+), 6 deletions(-)

diff --git a/drivers/mmc/host/sh_mmcif.c b/drivers/mmc/host/sh_mmcif.c
index 413c34585c90d57b..bf899c8e38f517d3 100644
--- a/drivers/mmc/host/sh_mmcif.c
+++ b/drivers/mmc/host/sh_mmcif.c
@@ -1579,12 +1579,7 @@ static int sh_mmcif_suspend(struct device *dev)
 	return 0;
 }
 
-static int sh_mmcif_resume(struct device *dev)
-{
-	return 0;
-}
-
-static DEFINE_SIMPLE_DEV_PM_OPS(sh_mmcif_dev_pm_ops, sh_mmcif_suspend, sh_mmcif_resume);
+static DEFINE_SIMPLE_DEV_PM_OPS(sh_mmcif_dev_pm_ops, sh_mmcif_suspend, NULL);
 
 static struct platform_driver sh_mmcif_driver = {
 	.probe		= sh_mmcif_probe,
-- 
2.43.0


