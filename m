Return-Path: <linux-renesas-soc+bounces-7134-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D2A0E929324
	for <lists+linux-renesas-soc@lfdr.de>; Sat,  6 Jul 2024 13:29:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 107C11C20429
	for <lists+linux-renesas-soc@lfdr.de>; Sat,  6 Jul 2024 11:29:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6FE82166305;
	Sat,  6 Jul 2024 11:22:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="dGnexEob"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F9A016078E
	for <linux-renesas-soc@vger.kernel.org>; Sat,  6 Jul 2024 11:22:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720264931; cv=none; b=rWYgf7nGnJLEeQMRhonDZd530lRwaP9YHvXqWt7IOsGqdIfhaCsc3QqUwFMugbrJuDuM2PrAW1aJHvNlR3psJ9yF8SM11Kd7ptLmZC4t7sHR13VwtKzVmEFr4Z+BFucvb1xmpJeA8tVzeNJElZ6INf7vuzOQDm4iegvOkCNYvwQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720264931; c=relaxed/simple;
	bh=/0mbUXQOssGvOZp9PXUiF3M123C187KgRjX28VAN3ck=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=KgwVC/og1eAJgGP7l76m7aEbNCxgZHI4WRTdgZllEIYrf0YuFxiPL6zAh/4V9UaaDZYXnx8GaFvs1vD3z5V6dkcN0vOq7l6KxHX8JTwLcN/SUUhD6KQT7ZkIjq3gmknAaUsVugtikpRzc75qjbUrmNmET4FObi5HSMT4BPuiJsc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=dGnexEob; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=from:to:cc:subject:date:message-id
	:in-reply-to:references:mime-version:content-transfer-encoding;
	 s=k1; bh=KGGekxitNI5E5Pu69wof1oXEJUTdt9X6qQPqXga/kPo=; b=dGnexE
	ob6B6EH3+zjS4abBHZ9KJThmGIC6FwNrDonw8DotATWe8VCpFmNxWbbzBEmr+nYo
	QSLnVEfYZRdECNJvtzT2FqommW4/biiX6VLHIUl618ZxplRrQ7gijNdzjNu4mvqk
	iEqKgAUEMKcq8MIcZ7Gg3Eey4DiI1lOhIYa95ORJYlNZeuTQ/ydbzSsvHwVT3O9P
	lJ+xTorsDY+THLzPVqyhe0maPJZxvgsXmp7FKncWzky8S8lpXgSg3Qh9pGl3XRiF
	CNO7/04g7ZQyFtxC0HeB4vTokM7s+BFqNUxqN5su7Am4ZUPzFRjish5ejMa1jCzG
	MFOmgkf2x28CIjXw==
Received: (qmail 3810695 invoked from network); 6 Jul 2024 13:21:51 +0200
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 6 Jul 2024 13:21:51 +0200
X-UD-Smtp-Session: l3s3148p1@zqfyYpIcRMJQT+F6
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: linux-i2c@vger.kernel.org
Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Chris Brandt <chris.brandt@renesas.com>,
	Andi Shyti <andi.shyti@kernel.org>,
	linux-renesas-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 41/60] i2c: riic: reword according to newest specification
Date: Sat,  6 Jul 2024 13:20:41 +0200
Message-ID: <20240706112116.24543-42-wsa+renesas@sang-engineering.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240706112116.24543-1-wsa+renesas@sang-engineering.com>
References: <20240706112116.24543-1-wsa+renesas@sang-engineering.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Change the wording of this driver wrt. the newest I2C v7 and SMBus 3.2
specifications and replace "master/slave" with more appropriate terms.

Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
---
 drivers/i2c/busses/i2c-riic.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/i2c/busses/i2c-riic.c b/drivers/i2c/busses/i2c-riic.c
index f608b1838cad..d6f585cdb7e5 100644
--- a/drivers/i2c/busses/i2c-riic.c
+++ b/drivers/i2c/busses/i2c-riic.c
@@ -12,9 +12,9 @@
  *
  * 1) The main xfer routine kicks off a transmission by putting the start bit
  * (or repeated start) on the bus and enabling the transmit interrupt (TIE)
- * since we need to send the slave address + RW bit in every case.
+ * since we need to send the target address + RW bit in every case.
  *
- * 2) TIE sends slave address + RW bit and selects how to continue.
+ * 2) TIE sends target address + RW bit and selects how to continue.
  *
  * 3a) Write case: We keep utilizing TIE as long as we have data to send. If we
  * are done, we switch over to the transmission done interrupt (TEIE) and mark
@@ -294,8 +294,8 @@ static u32 riic_func(struct i2c_adapter *adap)
 }
 
 static const struct i2c_algorithm riic_algo = {
-	.master_xfer	= riic_xfer,
-	.functionality	= riic_func,
+	.xfer = riic_xfer,
+	.functionality = riic_func,
 };
 
 static int riic_init_hw(struct riic_dev *riic, struct i2c_timings *t)
-- 
2.43.0


