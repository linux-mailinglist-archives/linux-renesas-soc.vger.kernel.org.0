Return-Path: <linux-renesas-soc+bounces-14565-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 245B8A66F68
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 18 Mar 2025 10:12:42 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 440C019A2B17
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 18 Mar 2025 09:12:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 10DC9372;
	Tue, 18 Mar 2025 09:12:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="JkLM9boj"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A87F19C546
	for <linux-renesas-soc@vger.kernel.org>; Tue, 18 Mar 2025 09:12:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742289159; cv=none; b=fXlcezg8cmY5cFaKEHyiF55+3YeSPl7LsZqsDZkYi73sDWizhEvBKvjEWFkjjP8G4phz0/WBhJJXNStA7YFcD26/zjd6N0Z2UarUqjCinW0jE2OV0bJz8tk3vh+upiMo/UXRkS9irgqjUhJQRHl3QEsSc2m60zvyTxJK01tXDzw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742289159; c=relaxed/simple;
	bh=gR3VhntD3Be8yiEyoZjukOoO9HZk0QEb9RDrqKPsDlo=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=S4CW0Q/LcgtEeiaetI7tRJcknlylu4E/Hde4m3XexQaeSO2pPbB3Izk8bT+MvAn/mst3R8Yh4eVUSzwmBFp08f1t665qI7tPQw5sZZplD4r8HKXqFOrjeVI1lTIpGvEmuhsbpVsC/JL6T8InZPeWVUFmtuBWUUfE+k0zlMM4C6c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=JkLM9boj; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=from:to:cc:subject:date:message-id
	:mime-version:content-transfer-encoding; s=k1; bh=YfjwJADThJ1DmA
	kkDUgtek34iUTeM0OfU6jCvQp3l+Y=; b=JkLM9boj+QM013bjHqt4NK3pc0MgT/
	R9bnL89i7/B5hC8nJWxa5RDiGRHOn6r8kI5Cw60gDJ5YAgjUFhKfvGEZBxUCV7dn
	tQMYBqzJd7kUsW7HrzMhNdQ5gxaX5exIn9NcxhYk51TJyzhBvbZbf2mhl6kzzn+m
	bcjjPxHS2PuqtmO9sMMx4QxNHp6S56TIjB6XzSKV8CN77j5cXeSUwIvA3ZBggyPr
	ZdDnLT7i2mllDJCrkrgYXZoej6eaIOyzoQf+pKg+6US3+UYOuWeKHKSGMGsSao/e
	ADH+oere+wPE+SJL0GYsCXd7UTwf+qkFAQ+qKZdGyY/VW1W4Dc4fNlgQ==
Received: (qmail 3660858 invoked from network); 18 Mar 2025 10:12:35 +0100
Received: by mail.zeus03.de with UTF8SMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 18 Mar 2025 10:12:35 +0100
X-UD-Smtp-Session: l3s3148p1@CnoyTpowesQgAwDPXyTHAJp038nK7dx+
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: linux-renesas-soc@vger.kernel.org
Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Lee Jones <lee@kernel.org>
Subject: [PATCH RFT] mfd: tps65010: use per-client debugfs directory
Date: Tue, 18 Mar 2025 10:12:12 +0100
Message-ID: <20250318091234.22170-1-wsa+renesas@sang-engineering.com>
X-Mailer: git-send-email 2.47.2
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The I2C core now provides a debugfs entry for each client. Let this
driver use it instead of the root directory. Further improvements by
this change: automatic support of multiple instances.

Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
---

Build tested only, by me and buildbots.

 drivers/mfd/tps65010.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/mfd/tps65010.c b/drivers/mfd/tps65010.c
index 710364435b6b..3dc7e89334f5 100644
--- a/drivers/mfd/tps65010.c
+++ b/drivers/mfd/tps65010.c
@@ -511,7 +511,6 @@ static void tps65010_remove(struct i2c_client *client)
 	if (client->irq > 0)
 		free_irq(client->irq, tps);
 	cancel_delayed_work_sync(&tps->work);
-	debugfs_remove(tps->file);
 	the_tps = NULL;
 }
 
@@ -607,7 +606,7 @@ static int tps65010_probe(struct i2c_client *client)
 
 	tps65010_work(&tps->work.work);
 
-	tps->file = debugfs_create_file(DRIVER_NAME, S_IRUGO, NULL,
+	tps->file = debugfs_create_file(DRIVER_NAME, S_IRUGO, client->debugfs,
 				tps, DEBUG_FOPS);
 
 	/* optionally register GPIOs */
-- 
2.47.2


