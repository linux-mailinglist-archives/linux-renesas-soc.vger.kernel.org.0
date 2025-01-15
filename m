Return-Path: <linux-renesas-soc+bounces-12184-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 676EDA12B24
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 15 Jan 2025 19:46:28 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 8B3A51660CC
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 15 Jan 2025 18:46:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 09DBE15958A;
	Wed, 15 Jan 2025 18:46:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="QP98BBy6"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4273719924F
	for <linux-renesas-soc@vger.kernel.org>; Wed, 15 Jan 2025 18:46:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736966784; cv=none; b=IeVt+XSQl8WS5CxlQhtKTmhWrxeONpk50NSnoRWc3i8yvFAvvAbRI76jEfER4icfcHiQw1tJLpQOKJArh4exn3Muo1yLekI0LhzEK/vgQN1kxciCLYlYeMoRWS/LtzcRVX5kLj0N6yJ3Eg+Z5I3VG2fznKP/5vdAziz4dZkuhPo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736966784; c=relaxed/simple;
	bh=gYLvvuA5oVrndyDlJPQLhISgDod/57icq+QXziAVZH8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=M7nCOZRfomSs05X5leLn+kZUsNfpgMbbGUlP1+Rl7cDIrEMfNQE90wVqkhk7vTSzPejmI7gg4aABnX+aTVZgZp/QEUO8p8KV3B6LVfhVD6XsOLRwMTYpL78aeXlJqg/cVCt3FVSc9Waj+1e2DYbG3BfzV9x7ybWj0aE+0BFITSc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=QP98BBy6; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=from:to:cc:subject:date:message-id
	:mime-version:content-transfer-encoding; s=k1; bh=b3SEI0tmNp7NeA
	yW1wDkmdqfYGrEagMvd54KDeSGp/8=; b=QP98BBy6JrZNEGMgB3hRSUAjGDuq0m
	MAbYHH6TjLOhbsC5s3VYLPWWjA0bRKlTPOs7QwGlkDuw8AXrSoX2x/6jpkLnJ4rJ
	etch0OJAQixpp4ieAdOeP3Y5wgow5DVP54peEHvTMw+cDUyOL+gbwqJP81UCW0xn
	0T6zfsnwfcBqwgnOw7j63SvtWccW5VisnFXWV+FMukaoPYhzoZqrwzsXkUV83lZf
	QJV+pY+ib9ieuR3sl3t0FtyuHXZXVBDg5WdHEPEF27/aqPK8ryrRku0DrdPTofFv
	6AL6TQm8xoJplnFUIocFTS9cPgi+SQdugUIjwloHgbZ7yVk/JUndJfCQ==
Received: (qmail 657249 invoked from network); 15 Jan 2025 19:46:17 +0100
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 15 Jan 2025 19:46:17 +0100
X-UD-Smtp-Session: l3s3148p1@TUW5F8MrBBVtKPNf
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: linux-renesas-soc@vger.kernel.org
Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	linux-i2c@vger.kernel.org
Subject: [PATCH] i2c: testunit: on errors, repeat NACK until STOP
Date: Wed, 15 Jan 2025 19:45:52 +0100
Message-ID: <20250115184609.1844-2-wsa+renesas@sang-engineering.com>
X-Mailer: git-send-email 2.45.2
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This backend requests a NACK from the controller driver when it detects
an error. If that request gets ignored from some reason, subsequent
accesses will wrongly be handled OK. To fix this, an error now changes
the state machine, so the backend will report NACK until a STOP
condition has been detected. This make the driver more robust against
controllers which will sadly apply the NACK not to the current byte but
the next one.

Fixes: a8335c64c5f0 ("i2c: add slave testunit driver")
Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
---

Found, debugged, and tested on a Renesas Lager board (R-Car H2).

 drivers/i2c/i2c-slave-testunit.c | 19 +++++++++++++++----
 1 file changed, 15 insertions(+), 4 deletions(-)

diff --git a/drivers/i2c/i2c-slave-testunit.c b/drivers/i2c/i2c-slave-testunit.c
index 0d6fbaa48248..6de4307050dd 100644
--- a/drivers/i2c/i2c-slave-testunit.c
+++ b/drivers/i2c/i2c-slave-testunit.c
@@ -38,6 +38,7 @@ enum testunit_regs {
 
 enum testunit_flags {
 	TU_FLAG_IN_PROCESS,
+	TU_FLAG_NACK,
 };
 
 struct testunit_data {
@@ -90,8 +91,10 @@ static int i2c_slave_testunit_slave_cb(struct i2c_client *client,
 
 	switch (event) {
 	case I2C_SLAVE_WRITE_REQUESTED:
-		if (test_bit(TU_FLAG_IN_PROCESS, &tu->flags))
-			return -EBUSY;
+		if (test_bit(TU_FLAG_IN_PROCESS | TU_FLAG_NACK, &tu->flags)) {
+			ret = -EBUSY;
+			break;
+		}
 
 		memset(tu->regs, 0, TU_NUM_REGS);
 		tu->reg_idx = 0;
@@ -99,8 +102,10 @@ static int i2c_slave_testunit_slave_cb(struct i2c_client *client,
 		break;
 
 	case I2C_SLAVE_WRITE_RECEIVED:
-		if (test_bit(TU_FLAG_IN_PROCESS, &tu->flags))
-			return -EBUSY;
+		if (test_bit(TU_FLAG_IN_PROCESS | TU_FLAG_NACK, &tu->flags)) {
+			ret = -EBUSY;
+			break;
+		}
 
 		if (tu->reg_idx < TU_NUM_REGS)
 			tu->regs[tu->reg_idx] = *val;
@@ -129,6 +134,8 @@ static int i2c_slave_testunit_slave_cb(struct i2c_client *client,
 		 * here because we still need them in the workqueue!
 		 */
 		tu->reg_idx = 0;
+
+		clear_bit(TU_FLAG_NACK, &tu->flags);
 		break;
 
 	case I2C_SLAVE_READ_PROCESSED:
@@ -151,6 +158,10 @@ static int i2c_slave_testunit_slave_cb(struct i2c_client *client,
 		break;
 	}
 
+	/* If an error occurred somewhen, we NACK everything until next STOP */
+	if (ret)
+		set_bit(TU_FLAG_NACK, &tu->flags);
+
 	return ret;
 }
 
-- 
2.45.2


