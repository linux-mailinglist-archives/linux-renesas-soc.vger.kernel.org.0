Return-Path: <linux-renesas-soc+bounces-11588-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id DE0F79F8772
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 19 Dec 2024 23:04:05 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id C3EA67A0397
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 19 Dec 2024 22:03:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 213E715B135;
	Thu, 19 Dec 2024 22:03:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="WVbnNipw"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8CA6A5FDA7
	for <linux-renesas-soc@vger.kernel.org>; Thu, 19 Dec 2024 22:03:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734645839; cv=none; b=Xgm5rd0WI1DI5/ETSYIWx7mspeqV+PXs+IgZ8CrYz/alAuBib/nMnbURB0rz7MPli1RLP0WdmNSah0nsZq8bYZzVnYquwuZ8ya4n079HqEFpy5O8aWM3w09kz3FL+kQpzpQg1Q3Iv8H7k1oa4o9NgI4avBhYbiggd2TEiaUzhZ0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734645839; c=relaxed/simple;
	bh=W9yFxASL8AEAI5SDdxKIXjq075hBSqK88HgarWHVoNg=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=uXwuzO6sdDYwBfz4EKCJH70sBfR1ouCIaPE4frXQk9OnxQq98WRKyqLSyElARmSyvwgmST+nrgiuyIaozBMYyYxpWa1LckueMIrO8XJD2DbOBaw2CU9RLJbrVegH5lvhtgySWLMbYkRKH6DIeus1HSoP/trCFeZJ5ky5WySPchs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=WVbnNipw; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=from:to:cc:subject:date:message-id
	:mime-version:content-transfer-encoding; s=k1; bh=uGlTtA8dfC0JBT
	3H+WliQ5pXLzrJZXTAJT9PHkh9Nqk=; b=WVbnNipwPfikfuDVlTNUUNpzkhhDK8
	PWIwVm5z3Irso3gkLN6fobFbuI8lqyCRcK0EzwNa4VA/DykrrYIaDVP7h9nTJbMk
	ZMnLjye/1RIkXnCv5mkip2hWlPGMbgGIEm+hPBzEpkxtF2d7YM9Di6qEqslBPelU
	p0WGy57TnOCK9TxkxRxldBS5Aj6ip4HjsqdbILV+seBc3Vmn6UvtCUuyzM6AUasG
	hiNrefy3hOJVljbqUUFFsRAi/9kCXpo8cUytoyfC6C5aWnsTJ/nK+ZnBt+Uhe9kr
	hI/1rzoNR97aRr9wOZ4B5Ioq90reFCB7G5jt1oXdB4iJz7WSat0ojfkQ==
Received: (qmail 817637 invoked from network); 19 Dec 2024 23:03:48 +0100
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 19 Dec 2024 23:03:48 +0100
X-UD-Smtp-Session: l3s3148p1@oRNktKYpUOYujnsY
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: linux-renesas-soc@vger.kernel.org
Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	linux-i3c@lists.infradead.org
Subject: [PATCH] i3c: fix kdoc parameter description for module_i3c_i2c_driver()
Date: Thu, 19 Dec 2024 23:03:37 +0100
Message-Id: <20241219220338.10315-1-wsa+renesas@sang-engineering.com>
X-Mailer: git-send-email 2.39.2
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

A typo mentioned I3C when it should have been I2C.

Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
---
 include/linux/i3c/device.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/include/linux/i3c/device.h b/include/linux/i3c/device.h
index 0a8a44ac2f02..b674f64d0822 100644
--- a/include/linux/i3c/device.h
+++ b/include/linux/i3c/device.h
@@ -283,7 +283,7 @@ static inline void i3c_i2c_driver_unregister(struct i3c_driver *i3cdrv,
  * module_i3c_i2c_driver() - Register a module providing an I3C and an I2C
  *			     driver
  * @__i3cdrv: the I3C driver to register
- * @__i2cdrv: the I3C driver to register
+ * @__i2cdrv: the I2C driver to register
  *
  * Provide generic init/exit functions that simply register/unregister an I3C
  * and an I2C driver.
-- 
2.39.2


