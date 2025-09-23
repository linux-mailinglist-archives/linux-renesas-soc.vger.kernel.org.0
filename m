Return-Path: <linux-renesas-soc+bounces-22244-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 01FADB97811
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 23 Sep 2025 22:36:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id BF6E52A6B52
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 23 Sep 2025 20:36:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BFAE527F732;
	Tue, 23 Sep 2025 20:36:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="UuzD6GGN"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9797534BA3A
	for <linux-renesas-soc@vger.kernel.org>; Tue, 23 Sep 2025 20:36:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758659777; cv=none; b=d6vEv6C4k0jTvpP23fBpAeXw/KduFBf4ksfqXz09WoN6lqfB0+eg/UCHIZ8NurumceAwUGr0VKua/NOlgA3AJgJQDnMz76AJ75VXn6XTqnB3LLz03dHDY6b/Lmk6VvPWbZdHjHDs3l2Wcy/J/CxaQshrxhlBX/7nUdiUMaSxU04=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758659777; c=relaxed/simple;
	bh=ARO21j5whOysZzzfDUX38bdYo6rhB2RgP/XjFfZHEJg=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=SRw1PPE0w1L3FVAvplPjkFVaEUS/pS7WurB/zQ7yi31AK8FcgZxroc+X9wQvvSBFf5LWHdfDUN/N0xd7mNPl43ANunx3NbogYaKNsOPnZfPOJYfthtbhdmGSDeIK0nySHJycHS97OGZuvqV+wKIHxgjJagrtloXA2rvnu9WmcCw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=UuzD6GGN; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=from:to:cc:subject:date:message-id
	:mime-version:content-transfer-encoding; s=k1; bh=ZJIzr87B9EwoeX
	RAt4mdlfybQOB28UXsMsSoD9ahbt0=; b=UuzD6GGNFArc3CXzixX8yN026yZskL
	12HLoszM4pgGzQbr1J9NevX68S38JdrtXxojoqYT/6gFUtDwMsoz/nuYk8Knqm9t
	gflIJq35O0I9q5FFepRLqz7SQy+2EawBakRKLPyEjCVLVB8LgZ0fPCZmMybZ08Nj
	wnnDFN4BKerUzfcIFV+GHN4qXQaorvAuM3Hry5oCRzYzurDDC2ceb2QKBts3z14e
	PaSeUjueEqRXhzjjxjdxrbBvmxzW+Tsjv1nkui5yiBnuGEvK8q/DUCXDYlIMfqt9
	523eyngkOXVNiMAT7BSC/aK08VNG1fmITuVDWAAqYhMrirq+Ld6e/GyQ==
Received: (qmail 1234876 invoked from network); 23 Sep 2025 22:36:08 +0200
Received: by mail.zeus03.de with UTF8SMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 23 Sep 2025 22:36:08 +0200
X-UD-Smtp-Session: l3s3148p1@/afH4n0/Iukujnsp
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: linux-renesas-soc@vger.kernel.org
Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Frank Li <Frank.Li@nxp.com>,
	linux-i3c@lists.infradead.org
Subject: [PATCH] i3c: Remove superfluous FIXME
Date: Tue, 23 Sep 2025 22:35:58 +0200
Message-ID: <20250923203557.18298-2-wsa+renesas@sang-engineering.com>
X-Mailer: git-send-email 2.47.2
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

I2C adapters can already change timeout and retry parameters via IOCTL.
This allows for better tuning to workloads compared to per-adapter
defaults. So, the FIXME is not needed.

Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
---
 drivers/i3c/master.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/i3c/master.c b/drivers/i3c/master.c
index acaba4d53697..d946db75df70 100644
--- a/drivers/i3c/master.c
+++ b/drivers/i3c/master.c
@@ -2564,8 +2564,6 @@ static int i3c_master_i2c_adapter_init(struct i3c_master_controller *master)
 	adap->owner = master->dev.parent->driver->owner;
 	adap->algo = &i3c_master_i2c_algo;
 	strscpy(adap->name, dev_name(master->dev.parent), sizeof(adap->name));
-
-	/* FIXME: Should we allow i3c masters to override these values? */
 	adap->timeout = HZ;
 	adap->retries = 3;
 
-- 
2.47.2


