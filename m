Return-Path: <linux-renesas-soc+bounces-10619-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 52A7A9D3588
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 20 Nov 2024 09:34:24 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id D46DAB231E0
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 20 Nov 2024 08:34:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3465A1487C5;
	Wed, 20 Nov 2024 08:34:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="eJ36Z6k0"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6CB0B175D3A
	for <linux-renesas-soc@vger.kernel.org>; Wed, 20 Nov 2024 08:34:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732091652; cv=none; b=OzTxcaajvQsezF53ga9kW7i+yl/EOSnpPFWTVg3E9znzjabvwQtaqxtkzuwqlIH3yNU8xJ9c0bDuMK+MKOqM0ZGUH1hW42xKhvLqR0GxMs0nqsHkmn3Vx6uHDUXRVvcId/NKUk+6+cr9CZj8V7CKIjBqxY5TeM/cuVJ10D+2D9E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732091652; c=relaxed/simple;
	bh=p5wNypndlNtZ9iYw46NAdmF91h1AuzQSfvow7/G4AlY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=NgLMObUTR3mSvMAJA4/p5LqIvykT7W84RhkLD2wG3WWN+K4pQN3PHCicXXgt9cjCmLW5frC2/NtFUnLCDK/5QEZupQp65AFk3rEM+kvYAzD2hCmO4cQwkQD511B8cIxpLZxYLTYy1VfqVphrKGWi/pacrnkVqSNDhDOfuo0qiZE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=eJ36Z6k0; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=from:to:cc:subject:date:message-id
	:in-reply-to:references:mime-version:content-type
	:content-transfer-encoding; s=k1; bh=flniR+Y5Awg7qv7rHZn0LlVf+5Q
	eXyXgrD4+/TW/z2o=; b=eJ36Z6k06n+h+aiqX/i9U/JX+b++3B9dvrDDvFxbBMb
	ehHlYj5M6X0y+kKgiOF5DxRTwRAt7x2qfpGo4r/27bHPtKHvtZ0kxjefuWYYVr+o
	Ykf38wvu/87LyUa0f1nSWGK50esfUksBnMXoTrXxv31jwzdS0+GKq/WbY9CPNCSY
	tYx4qeN7/zC96E2U9MYItWZbaUH12QkYLiQGvao/Dhhbtc6Xgv68PtZ6a0WrOZXd
	hCwpN14FQ9wx2NTspTKFMIONUp7kmXKGvxlmGaXbc7/Qg5nSdXSbj7JOfJWsHKvE
	HuQHGNbEy0X0E/dS9HtsQczaMOOOEOTe9aV/Sy2D88Q==
Received: (qmail 832337 invoked from network); 20 Nov 2024 09:34:05 +0100
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 20 Nov 2024 09:34:05 +0100
X-UD-Smtp-Session: l3s3148p1@bXw5A1QnzrIgAwDPXxznANR4Jedc6XSv
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: linux-renesas-soc@vger.kernel.org
Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	=?UTF-8?q?Carsten=20Spie=C3=9F?= <mail@carsten-spiess.de>,
	Jean Delvare <jdelvare@suse.com>,
	Guenter Roeck <linux@roeck-us.net>,
	linux-hwmon@vger.kernel.org
Subject: [PATCH 3/3] hwmon: (isl28022) apply coding style to module init/exit
Date: Wed, 20 Nov 2024 09:33:52 +0100
Message-ID: <20241120083349.22226-8-wsa+renesas@sang-engineering.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20241120083349.22226-5-wsa+renesas@sang-engineering.com>
References: <20241120083349.22226-5-wsa+renesas@sang-engineering.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Function declarations can be in one line. module_init|exit macros should
be tied to the function.

Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
---
 drivers/hwmon/isl28022.c | 9 +++------
 1 file changed, 3 insertions(+), 6 deletions(-)

diff --git a/drivers/hwmon/isl28022.c b/drivers/hwmon/isl28022.c
index f9edcfd164c2..7748f6b8a534 100644
--- a/drivers/hwmon/isl28022.c
+++ b/drivers/hwmon/isl28022.c
@@ -506,8 +506,7 @@ static struct i2c_driver isl28022_driver = {
 	.id_table	= isl28022_ids,
 };
 
-static int __init
-isl28022_init(void)
+static int __init isl28022_init(void)
 {
 	int err;
 
@@ -519,15 +518,13 @@ isl28022_init(void)
 	debugfs_remove_recursive(isl28022_debugfs_root);
 	return err;
 }
+module_init(isl28022_init);
 
-static void __exit
-isl28022_exit(void)
+static void __exit isl28022_exit(void)
 {
 	i2c_del_driver(&isl28022_driver);
 	debugfs_remove_recursive(isl28022_debugfs_root);
 }
-
-module_init(isl28022_init);
 module_exit(isl28022_exit);
 
 MODULE_AUTHOR("Carsten Spieß <mail@carsten-spiess.de>");
-- 
2.45.2


