Return-Path: <linux-renesas-soc+bounces-17751-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 641C6AC9E72
	for <lists+linux-renesas-soc@lfdr.de>; Sun,  1 Jun 2025 13:26:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id CA6FD7A94CE
	for <lists+linux-renesas-soc@lfdr.de>; Sun,  1 Jun 2025 11:25:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7418811712;
	Sun,  1 Jun 2025 11:26:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="QJ5gsBuB"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 44E3A4400
	for <linux-renesas-soc@vger.kernel.org>; Sun,  1 Jun 2025 11:26:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748777174; cv=none; b=hCzpsDOUInvQbsbujwyf2nJrjucJYMmS0yLd1ZatxOMGlwGxVe4vf8pTYEIV0jpmRWODt3TayVYoMv/NZQ97xZk/vJaYmVPdyedn5r2wOiOIk3YngtZHSCu+m37lC8RBLATvWjph/aQAj2zRZjjN72WRtOVhLAy5coEu8/zSI/s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748777174; c=relaxed/simple;
	bh=4Mx+Uz/53a23sHj1wlZ+qHlvT/i7I4Y/FAkWSqtEcTM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=sIVNaylZpsBGtNB5vbXjo6YrwNbtH2vsX+EWuCzyP1DvRnJyXVcvY8YgZs0IwxEP2KJuqIcFZl1yTUbq4izSvJuC51XKCLwW/AnAG4CD3wrg/X40SLTfUmhJjtwCOEsuo+n3cBYjDXZsDOvfVelQNuQL975ljhjfEVlsrqZgUkU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=QJ5gsBuB; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=from:to:cc:subject:date:message-id
	:mime-version:content-transfer-encoding; s=k1; bh=IzAPRc+Z+qyWQO
	YZTrZYFe1Tc4o5XpIBoRDvwMbiL/Y=; b=QJ5gsBuBwxeaWmY41IE1zxuiJyRbhZ
	TI1yrp5lA4mnakyHGf53H5mJoUwpnMXVgJuJUT550hkv5yM2lgAA9N9ItvY1DAIz
	ipIOVE2zbkZ+3h1gEGkaGDLCaRwMn/8mqyNjY7xvw1lwsulw0AQq8Ujv9PzRiYDQ
	MYCUrTOUGr7G/4DK4wZP0iV3U08lCI5gk3JTVBW3gIU7sTMTsazYIFuOOlAPAyix
	U/G7UAKxKHgesICYjzRrtqRoa2sn4MW6QpfbHn5HfB69RMxP585zQMOSdKYfNxNT
	+zG4LAcHzQQ5M6tCklZbHJ4D4MyVsDwvcfcTB9rZj411d6nW2ggtrn3Q==
Received: (qmail 2998916 invoked from network); 1 Jun 2025 13:26:04 +0200
Received: by mail.zeus03.de with UTF8SMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 1 Jun 2025 13:26:04 +0200
X-UD-Smtp-Session: l3s3148p1@iM6Y6YA2C3FtKPKQ
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: linux-renesas-soc@vger.kernel.org
Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Peter Rosin <peda@axentia.se>,
	Bartosz Golaszewski <bgolaszewski@baylibre.com>,
	Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
	Support Opensource <support.opensource@diasemi.com>,
	Lee Jones <lee@kernel.org>
Subject: [PATCH] mfd: da9063: occupy second I2C address, too
Date: Sun,  1 Jun 2025 13:22:59 +0200
Message-ID: <20250601112546.2136-2-wsa+renesas@sang-engineering.com>
X-Mailer: git-send-email 2.47.2
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Even though we don't use it yet, we should mark the second I2C address
this device is listening to as used.

Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
Reviewed-by: Peter Rosin <peda@axentia.se>
Reviewed-by: Bartosz Golaszewski <bgolaszewski@baylibre.com>
Reviewed-by: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
---

This patch could not be applied 6 years ago because of a missing
dependency. It has arrived meanwhile ;)

 drivers/mfd/da9063-i2c.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/mfd/da9063-i2c.c b/drivers/mfd/da9063-i2c.c
index c6235cd0dbdc..c74702cf8a77 100644
--- a/drivers/mfd/da9063-i2c.c
+++ b/drivers/mfd/da9063-i2c.c
@@ -454,6 +454,8 @@ static int da9063_i2c_probe(struct i2c_client *i2c)
 		}
 	}
 
+	devm_i2c_new_dummy_device(&i2c->dev, i2c->adapter, i2c->addr + 1);
+
 	return da9063_device_init(da9063, i2c->irq);
 }
 
-- 
2.47.2


