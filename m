Return-Path: <linux-renesas-soc+bounces-15103-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 017C1A75EF5
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 31 Mar 2025 08:44:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id A6EDA167A7A
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 31 Mar 2025 06:44:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E15E418A6B6;
	Mon, 31 Mar 2025 06:44:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="cFr9LRJ0"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 31BA7157A5A
	for <linux-renesas-soc@vger.kernel.org>; Mon, 31 Mar 2025 06:44:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743403456; cv=none; b=OA6q4utpDq2R7H0oGgYED49/NZse8oop8zNdEc8qjvAMmVjcfb6Yhw3mTGqofcV2YPluZo3jJCeBgEegTVY92uCdqD5z1o9wV/E7M9oL21H2gYJWoIk83X6WW+EcOp03nft56JexLDtWiwNG6z+Df7+TZnnuUW0+ioVA3XtgINc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743403456; c=relaxed/simple;
	bh=L9eQS5LRGLrf6MgkurT5HPQycpxQOrmbZ5qTqgJUZuU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=TyvOkOuwZncTaTBndGUCPndrjSsKfQ94yrHVHgUvaZ41YTHq3hqI9BaSKhX2LwY+0y4WmvUpMo6z+D96hdn1iSAkEe11h22LiMOYzysvgCMFpwf8+IhVDvaP9dHJsVfQlKn0nwGDzmzQyQzCdvDrWAUn1l3oQaGLQV0Bz86+MR4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=cFr9LRJ0; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=from:to:cc:subject:date:message-id
	:mime-version:content-transfer-encoding; s=k1; bh=CWhMMHXdY7wGZN
	B48i2lMT30hIxIkaT6qwU4OIC1SBM=; b=cFr9LRJ0iF2mJu7eH46JcMemjz4H9b
	Gudo4KSk/PrFHN6IB16fi1TDoyvberpSa0QPQX1aur/MBT7eN9OeVa7Tyjywba6d
	+0gf87outXBf3FqmdB8WDwqptEzqNWRA/74v7NaKGz5O+hXVyHhtUc2miWN+4BpC
	Z/uOnacWz/G/JnI82HNA1DffkILpcmUrACLteV0Ha1IMxBugrfki/7h/wLip80NG
	uVqE58ESSdK8Okfg/ICbFPwu+266i1e7YA4T1jzPlwWJgimzFpI645OYLPkJOO/w
	RDIns3TRrJBWeX9UIOTlNvwNUFAVNBw/bskwpVsFtLhjtt8X2IGpibQg==
Received: (qmail 1123123 invoked from network); 31 Mar 2025 08:44:08 +0200
Received: by mail.zeus03.de with UTF8SMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 31 Mar 2025 08:44:08 +0200
X-UD-Smtp-Session: l3s3148p1@UVA1v50xiMBQ8qei
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: linux-renesas-soc@vger.kernel.org
Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Ulf Hansson <ulf.hansson@linaro.org>,
	linux-mmc@vger.kernel.org
Subject: [PATCH] mmc: renesas_sdhi: improve registering irqs
Date: Mon, 31 Mar 2025 08:43:17 +0200
Message-ID: <20250331064400.16677-2-wsa+renesas@sang-engineering.com>
X-Mailer: git-send-email 2.47.2
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The probe() function is convoluted enough, so merge sanity checks for
number of irqs into one place. Also, change the error code for 'no irq'
because ENXIO will not print a warning from the driver core.

Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
---

Tested on a Renesas Spider board (R-Car S4)

 drivers/mmc/host/renesas_sdhi_core.c | 11 +++--------
 1 file changed, 3 insertions(+), 8 deletions(-)

diff --git a/drivers/mmc/host/renesas_sdhi_core.c b/drivers/mmc/host/renesas_sdhi_core.c
index 8c83e203c516..4642fdb8bf65 100644
--- a/drivers/mmc/host/renesas_sdhi_core.c
+++ b/drivers/mmc/host/renesas_sdhi_core.c
@@ -1240,15 +1240,10 @@ int renesas_sdhi_probe(struct platform_device *pdev,
 
 	sd_ctrl_write32_as_16_and_16(host, CTL_IRQ_MASK, host->sdcard_irq_mask_all);
 
-	num_irqs = platform_irq_count(pdev);
-	if (num_irqs < 0) {
-		ret = num_irqs;
-		goto edisclk;
-	}
-
 	/* There must be at least one IRQ source */
-	if (!num_irqs) {
-		ret = -ENXIO;
+	num_irqs = platform_irq_count(pdev);
+	if (num_irqs <= 0) {
+		ret = num_irqs ?: -ENOENT;
 		goto edisclk;
 	}
 
-- 
2.47.2


