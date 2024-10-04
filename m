Return-Path: <linux-renesas-soc+bounces-9463-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id E83A599102D
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  4 Oct 2024 22:19:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A8058281ED7
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  4 Oct 2024 20:19:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F365A1ADFE5;
	Fri,  4 Oct 2024 20:03:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="XTrM7T73"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E6101DD89D
	for <linux-renesas-soc@vger.kernel.org>; Fri,  4 Oct 2024 20:03:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728072213; cv=none; b=RWzKcL9h+KWi9qy+z+LTgKtizHQ02si0eJDD5MppedfNxzqqrFbKA7GVoz0rtAvFbE06QD42QtupMqDg5KUE2VeiY5/k5pGqPoyBFw6T4ptf85VcV3IeeO4nzR4KpBuoUUwRi//WzIeOCkxDGmJ4HJ/P7s0wShDTxf6xfN09pVM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728072213; c=relaxed/simple;
	bh=CJj1on5dHU/Cnn9BRe9vNc8ialwCOZPXU8zqwRmJgO0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=NrNLhAiIRiEhEvvuOblEvDLlYbFEMbLRU3aDvoUfxYSMkmsDV25G9b1wxHneHhVsJwhsJpvMYJB/sV8S/8KJsy8ASpO1P1gEt1dc4VNOkXaQmAY1M0uxxWvcJpwOYl0ZZOEjWrpcBt8OvW11Zdtzd7MUqd44K5eolUg9QXAento=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=XTrM7T73; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=from:to:cc:subject:date:message-id
	:in-reply-to:references:mime-version:content-transfer-encoding;
	 s=k1; bh=m+CVovgccu/Vsyu6hyJJY2uIKsvQGgdbownhHRDgcTE=; b=XTrM7T
	736PodLQzA2Yctw0L3S+GRARFpZlBxRX7pZAkUMyl9vifvIe5CprqP2As4CsqPrQ
	Fe983Zq6EKIhwqs2thph7Ek2sXFshnHEiKPdGoSc3XUgtsuEuSgn7lu6045yTdnk
	oCsQeKPMRn9N7b1gt3MMekCuxIrF6BboM7d9zFxrB0h7+vVUTlVsjzGsHgE7+p23
	GLsmNNiE8N0JES613lcQgRX5KJacjH9lHJaf1zyoG2uOPqC7tT2Vn61IeYIFZ6Oh
	3Ile76zG1OB7eeFZ+sluU9Pl3m/r4oBhIqYMlSwhldmP0IeKZuLWYsg5zNNV7/fd
	skq7q+gJHvuwfgew==
Received: (qmail 3546579 invoked from network); 4 Oct 2024 22:03:30 +0200
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 4 Oct 2024 22:03:30 +0200
X-UD-Smtp-Session: l3s3148p1@whM3KqwjaNdQvCeD
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: linux-renesas-soc@vger.kernel.org
Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Support Opensource <support.opensource@diasemi.com>,
	Wim Van Sebroeck <wim@linux-watchdog.org>,
	Guenter Roeck <linux@roeck-us.net>,
	linux-watchdog@vger.kernel.org
Subject: [RFC PATCH 2/9] watchdog: da9055_wdt: don't print out if registering watchdog fails
Date: Fri,  4 Oct 2024 22:03:05 +0200
Message-ID: <20241004200314.5459-3-wsa+renesas@sang-engineering.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20241004200314.5459-1-wsa+renesas@sang-engineering.com>
References: <20241004200314.5459-1-wsa+renesas@sang-engineering.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The core will do this already.

Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
---
 drivers/watchdog/da9055_wdt.c | 7 +------
 1 file changed, 1 insertion(+), 6 deletions(-)

diff --git a/drivers/watchdog/da9055_wdt.c b/drivers/watchdog/da9055_wdt.c
index 389a4bdd208c..9d5a2009466f 100644
--- a/drivers/watchdog/da9055_wdt.c
+++ b/drivers/watchdog/da9055_wdt.c
@@ -146,12 +146,7 @@ static int da9055_wdt_probe(struct platform_device *pdev)
 		return ret;
 	}
 
-	ret = devm_watchdog_register_device(dev, &driver_data->wdt);
-	if (ret != 0)
-		dev_err(da9055->dev, "watchdog_register_device() failed: %d\n",
-			ret);
-
-	return ret;
+	return devm_watchdog_register_device(dev, &driver_data->wdt);
 }
 
 static struct platform_driver da9055_wdt_driver = {
-- 
2.45.2


