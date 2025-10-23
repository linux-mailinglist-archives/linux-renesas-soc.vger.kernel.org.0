Return-Path: <linux-renesas-soc+bounces-23456-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id D7414BFF6CA
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 23 Oct 2025 08:56:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 809961A01464
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 23 Oct 2025 06:57:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 70AC42C033C;
	Thu, 23 Oct 2025 06:56:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="jymTsv0p"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 33D342BEC34
	for <linux-renesas-soc@vger.kernel.org>; Thu, 23 Oct 2025 06:56:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761202586; cv=none; b=YKjHqFx/mLdFg/jO5L3EKzSTJUexs2tznZ4iWELRc5jQX0VPXgOuhJpwgs+PKWIfX769avaTfMjuNIn3s0xkkcOg+CxD9+dpr6pr9gH3jJE6hNKrEhKCXnBHkEG9Rb0eXbaXZEqC5xYb64Bwqapxy1hFoNUCAHYOdLwUqcutvSA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761202586; c=relaxed/simple;
	bh=Gjd8j2/DIwjkc0A/jP6a2ujhrsI7hHy2Hy/bJ0HdPHI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=pa2EhuIjxbYphwR79gsitP3DSzIS1+rE0UI06CazBU+nPZ6PZLYxth7uAeee4nCjjH54IlH3x5Q7BzWIeuzHrCuCRZNezWChBRuCZ5QQbhc246ljvva3R5gnJ1LCbiLPijUq3pMT9gzk5evNIsLHvV4VOzFiisRvz5qfUx6yGlA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=jymTsv0p; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=from:to:cc:subject:date:message-id
	:mime-version:content-transfer-encoding; s=k1; bh=L7woAfdKTTz32O
	hWPBwBTKEj4mFzE3FP4tRQ+CWXn44=; b=jymTsv0pb4ks33zEq/NTTmpCCxVhL5
	2io4mPNESfC2x6oGYAvOxJeeP1GF0Kr6X2xBlz3Wa1onubmv4q166jpRtjhxsy3g
	tJduXQPCob3KQqWB10TkqCdTD6v9YljaU2atCu06EVyvfpcSBgn+FqQHwdfrjW0T
	hArroO3WeIUvhIYvIhmifnB6PJukdPoj6ljxk8WoarhmVc1KXE74uLu2+vMc5p99
	nkJfkzN41uCCEkFI1l+EJa/a4UYwN8xcy0aG2gvz0Kske6KjBRjmA0jwlv+TqSdO
	rLMELp/u5jcewRrz0sjG2LZnOyrabXpYmBvFT5TYt6UeBDLeFAM8thwA==
Received: (qmail 2097683 invoked from network); 23 Oct 2025 08:56:18 +0200
Received: by mail.zeus03.de with UTF8SMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 23 Oct 2025 08:56:18 +0200
X-UD-Smtp-Session: l3s3148p1@36sI7s1B3V5tKPAY
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: linux-renesas-soc@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
	Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Peter Rosin <peda@axentia.se>,
	Bartosz Golaszewski <bgolaszewski@baylibre.com>,
	Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
	Support Opensource <support.opensource@diasemi.com>,
	Lee Jones <lee@kernel.org>
Subject: [PATCH v3] mfd: da9063: occupy second I2C address, too
Date: Thu, 23 Oct 2025 08:55:59 +0200
Message-ID: <20251023065610.2855-2-wsa+renesas@sang-engineering.com>
X-Mailer: git-send-email 2.47.2
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The second address can be used as a shortcut to access register pages
2+3. The driver does not use this feature yet. The second address should
still be marked as used, otherwise userspace could interfere with the
driver.

Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
Reviewed-by: Peter Rosin <peda@axentia.se>
Reviewed-by: Bartosz Golaszewski <bgolaszewski@baylibre.com>
Reviewed-by: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
---

Change since v2: add comment in the code as well

 drivers/mfd/da9063-i2c.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/mfd/da9063-i2c.c b/drivers/mfd/da9063-i2c.c
index 1ec9ab56442d..a803b7440f09 100644
--- a/drivers/mfd/da9063-i2c.c
+++ b/drivers/mfd/da9063-i2c.c
@@ -469,6 +469,9 @@ static int da9063_i2c_probe(struct i2c_client *i2c)
 		}
 	}
 
+	/* Reserve our unused second address so userspace won't interfere */
+	devm_i2c_new_dummy_device(&i2c->dev, i2c->adapter, i2c->addr + 1);
+
 	return da9063_device_init(da9063, i2c->irq);
 }
 
-- 
2.47.2


