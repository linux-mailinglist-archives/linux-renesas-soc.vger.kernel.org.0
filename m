Return-Path: <linux-renesas-soc+bounces-12141-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 655C9A11B13
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 15 Jan 2025 08:39:33 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 0D8CA3A78C0
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 15 Jan 2025 07:39:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6493C18952C;
	Wed, 15 Jan 2025 07:39:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="end65Yei"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 338491E260C
	for <linux-renesas-soc@vger.kernel.org>; Wed, 15 Jan 2025 07:39:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736926770; cv=none; b=TvLQt6NW6SVKITpgcE7IFYIcGMFQ6gIH2ciHUOdLSL++mbs9c9jlrKNoxqBS+t1RzJ0IJoB9dq8D4OAzCPYpZhttoBh6kFrSCkC1ALp0rd3K21n3eYz648T88pnm2QJidZ4ExETHD8m6K1GXoZe2bLsfdvofYQpP9AMJSLn2t6U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736926770; c=relaxed/simple;
	bh=QRj5cPJhSUmbJHMcfOppAEqnHeS5/vVrsdC4lNgd0IU=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=IKixkvQHzehwOgBmcyzmNYNfcsHmEf8Fc5DlvHSlza/CMv5xD0Z3UhJpqsTo3MP0JffSWF3FJPko1pzyEsLgI2odcBjpCgET9mPBLQJoovhcL8YXUL01V/LCLp4jsuIrkYcmQ/k1QIZQGS+UbujaH1/AQSz62sFVEmOP+P9jKjM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=end65Yei; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=from:to:cc:subject:date:message-id
	:mime-version:content-transfer-encoding; s=k1; bh=wrIVOKAgyiYwTC
	96mV9s9JGPQLTzwqLND59+4MkhVfo=; b=end65YeikGCNyVLKYlV14T/qJnvGnU
	U6nN50WGsRq7egLVzl+uF4y76y9k5c0WfNfX2SlD9VzxvrGlw8DJc/Chj8czsOPB
	2Z+910nuNMmCHwQ9M5vlTY0P7bQ25vBnZOHQcNeu2VAy6lT2c1n/xpU16CFvzBmo
	gW1wL93hU4bo3Rfc48zIPWooEJ69oqBnUTdab0xYFn7ZOQzSDTthTDG+hqgBw2Na
	/K9eIrZL8z+o8RRtwRfjFYT1XHuuG0Qp5/y7CBimytbcR5HCB5wGJIjWoCFlL1Q3
	Iw1Tb4bC4V1j+1KjWdn363IsndofBs6kiVWCPj2DWcGs5Sj8kzE+nRtg==
Received: (qmail 463799 invoked from network); 15 Jan 2025 08:39:25 +0100
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 15 Jan 2025 08:39:25 +0100
X-UD-Smtp-Session: l3s3148p1@whjfxrkrXqAujnut
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: linux-renesas-soc@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
	Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Stephen Rothwell <sfr@canb.auug.org.au>,
	Guenter Roeck <linux@roeck-us.net>,
	linux-i2c@vger.kernel.org
Subject: [PATCH] i2c: add kdoc for the new debugfs entry of clients
Date: Wed, 15 Jan 2025 08:39:18 +0100
Message-Id: <20250115073918.8297-1-wsa+renesas@sang-engineering.com>
X-Mailer: git-send-email 2.39.2
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

When adding the new debugfs entry, its kdoc equivalent was forgotten.
Add it now.

Fixes: d06905d68610 ("i2c: add core-managed per-client directory in debugfs")
Reported-by: Stephen Rothwell <sfr@canb.auug.org.au>
Closes: https://lore.kernel.org/r/20250115163146.6c48f066@canb.auug.org.au
Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
---
 include/linux/i2c.h | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/include/linux/i2c.h b/include/linux/i2c.h
index 36de788dc7fe..c31fd1dba3bd 100644
--- a/include/linux/i2c.h
+++ b/include/linux/i2c.h
@@ -317,6 +317,8 @@ struct i2c_driver {
  *	calls it to pass on slave events to the slave driver.
  * @devres_group_id: id of the devres group that will be created for resources
  *	acquired when probing this device.
+ * @debugfs: pointer to the debugfs subdirectory which the I2C core created
+ *	for this client.
  *
  * An i2c_client identifies a single device (i.e. chip) connected to an
  * i2c bus. The behaviour exposed to Linux is defined by the driver
-- 
2.39.2


