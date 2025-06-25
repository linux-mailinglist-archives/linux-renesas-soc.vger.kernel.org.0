Return-Path: <linux-renesas-soc+bounces-18729-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C23E8AE83CA
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 25 Jun 2025 15:09:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 72216175BE5
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 25 Jun 2025 13:09:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D8B0325FA07;
	Wed, 25 Jun 2025 13:09:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="fpTQB+X4"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F5E425E803
	for <linux-renesas-soc@vger.kernel.org>; Wed, 25 Jun 2025 13:09:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750856986; cv=none; b=G2z3PyUSYfrQwhRzs4JWhaAzHgv32LBfYu0RYCwCDb/sO7OXlkzK2F2HOxhfYufMS476EzQ9JBHN0LR3VDHEjCjJMzn54eqdNddiGK0Uwyk9ZWGE5pPnVK8PtdXhnoqShgpMOL/uuMVWkR1eAF9XanhKDqJz9Zbi954pGqm+/s4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750856986; c=relaxed/simple;
	bh=Lv64KdXxqpKdnqGxjKdF49vM+s0VC9X2s0q1ZkMckwU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Mgwkx/hmGmuRgiYzldZQlTaXA6HjlPDbwcWLP0u7sQlq/VJZCstYdXBf6WMcIwrzW2EK/LohWgp0nZ2fuFiG5UlyliCV8vYpVaU1bpZAN3Z2KH+zCVKBGp5PbheNYAKdQkNCyPR7Aid+6nbpUu7+AtOvKC5TLBopdwFNevoHrN8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=fpTQB+X4; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=from:to:cc:subject:date:message-id
	:in-reply-to:references:mime-version:content-transfer-encoding;
	 s=k1; bh=dzna/XsontEgN7I82CZjapfkRA2NWPYiVq+jFArEruA=; b=fpTQB+
	X4pGM+hafE35IbU+g3OLA5cMu4VqMGt55Alkc3ocqgSp4t+sxlAdnswpMRw3jUi7
	5qslby0Rzb+JzAMZNZynX8uP7BBz99pWSyxqjNm9E77cISE9gJ3biQn3cHrwy5aI
	CeFmhN3lI8CKWD9IwtRZPVAf3ZWCKWuYyXpYT292YLEXYoOXP2vSNwDqoHdx9wjB
	jRKHnUzPLjT0lcgaQsEs1REOy9aHHKUrxAeWHtFX4SrV90Lx1L5aeECZ+7DOu0vk
	yXdyXIm/zqSK7LxdA9HznZoKCSv5n4HsgtCDQYydCxl552PX48o/xbewg9mcpFk5
	kSckQBeHF0pWQttQ==
Received: (qmail 659096 invoked from network); 25 Jun 2025 15:09:40 +0200
Received: by mail.zeus03.de with UTF8SMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 25 Jun 2025 15:09:40 +0200
X-UD-Smtp-Session: l3s3148p1@YTdLKGU4XNdtKDAs
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: linux-renesas-soc@vger.kernel.org
Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	=?UTF-8?q?Przemys=C5=82aw=20Gaj?= <pgaj@cadence.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Frank Li <Frank.Li@nxp.com>,
	linux-i3c@lists.infradead.org
Subject: [PATCH 3/3] i3c: cdns: switch to use SUSV4 error codes
Date: Wed, 25 Jun 2025 15:09:21 +0200
Message-ID: <20250625130918.14507-8-wsa+renesas@sang-engineering.com>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250625130918.14507-5-wsa+renesas@sang-engineering.com>
References: <20250625130918.14507-5-wsa+renesas@sang-engineering.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This checkpatch warning makes sense here: "ENOTSUPP is not a SUSV4 error
code, prefer EOPNOTSUPP" We don't have a userspace interface yet, but we
probably will get one. So, let's convert these error codes now, before
it will be forgotten in the future, and they could slip through to
applications.

Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
---
 drivers/i3c/master/i3c-master-cdns.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/i3c/master/i3c-master-cdns.c b/drivers/i3c/master/i3c-master-cdns.c
index fd3752cea654..e24d93a82e1c 100644
--- a/drivers/i3c/master/i3c-master-cdns.c
+++ b/drivers/i3c/master/i3c-master-cdns.c
@@ -742,7 +742,7 @@ static int cdns_i3c_master_priv_xfers(struct i3c_dev_desc *dev,
 
 	for (i = 0; i < nxfers; i++) {
 		if (xfers[i].len > CMD0_FIFO_PL_LEN_MAX)
-			return -ENOTSUPP;
+			return -EOPNOTSUPP;
 	}
 
 	if (!nxfers)
@@ -750,7 +750,7 @@ static int cdns_i3c_master_priv_xfers(struct i3c_dev_desc *dev,
 
 	if (nxfers > master->caps.cmdfifodepth ||
 	    nxfers > master->caps.cmdrfifodepth)
-		return -ENOTSUPP;
+		return -EOPNOTSUPP;
 
 	/*
 	 * First make sure that all transactions (block of transfers separated
@@ -765,7 +765,7 @@ static int cdns_i3c_master_priv_xfers(struct i3c_dev_desc *dev,
 
 	if (rxslots > master->caps.rxfifodepth ||
 	    txslots > master->caps.txfifodepth)
-		return -ENOTSUPP;
+		return -EOPNOTSUPP;
 
 	cdns_xfer = cdns_i3c_master_alloc_xfer(master, nxfers);
 	if (!cdns_xfer)
@@ -822,11 +822,11 @@ static int cdns_i3c_master_i2c_xfers(struct i2c_dev_desc *dev,
 	int i, ret = 0;
 
 	if (nxfers > master->caps.cmdfifodepth)
-		return -ENOTSUPP;
+		return -EOPNOTSUPP;
 
 	for (i = 0; i < nxfers; i++) {
 		if (xfers[i].len > CMD0_FIFO_PL_LEN_MAX)
-			return -ENOTSUPP;
+			return -EOPNOTSUPP;
 
 		if (xfers[i].flags & I2C_M_RD)
 			nrxwords += DIV_ROUND_UP(xfers[i].len, 4);
@@ -836,7 +836,7 @@ static int cdns_i3c_master_i2c_xfers(struct i2c_dev_desc *dev,
 
 	if (ntxwords > master->caps.txfifodepth ||
 	    nrxwords > master->caps.rxfifodepth)
-		return -ENOTSUPP;
+		return -EOPNOTSUPP;
 
 	xfer = cdns_i3c_master_alloc_xfer(master, nxfers);
 	if (!xfer)
-- 
2.47.2


