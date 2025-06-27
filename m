Return-Path: <linux-renesas-soc+bounces-18833-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 39F07AEB61E
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 27 Jun 2025 13:18:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id B79F47ADA24
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 27 Jun 2025 11:17:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4B66A2989AD;
	Fri, 27 Jun 2025 11:18:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="ev6+LF2/"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0ADCA2951CE
	for <linux-renesas-soc@vger.kernel.org>; Fri, 27 Jun 2025 11:18:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751023099; cv=none; b=O0WY6SnMl27Xj1wvs0CWeuJ1HKdD5LMOIQSZE64alWQAq83uimfbnio2UBPax90ZZU1Axi89XY/B0GfZlXzuaQz5a4YPQo8FLyQtjGNOGOWWfqgxYvQFN7cwGDXKG5HXAsHHbeCdRdnD5g6jmAsWJ0Ui/Cuxtnlgd83pfpxWfaI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751023099; c=relaxed/simple;
	bh=MLxygP//40lJscuJlILRJgEvH51Yrjn1US64RBlHAWA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=MBpwR9XsjGjwvacBYuHYcoFrasDdteOYbzDyBD7IWcQrkRysoeI2Q7P6OZ66hTjv+4EThGhut/i5JHZF0PsfRkcFzXGEVNOUSRShHVcoUh+fdFa8dJ5eX1IhuUDwBDuzA6XpjJwlqf35If4V/1/IsWvkx8kr8DQQ3xfvcvaIypY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=ev6+LF2/; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=from:to:cc:subject:date:message-id
	:in-reply-to:references:mime-version:content-transfer-encoding;
	 s=k1; bh=bhnf6fFGAjxJCoEk83hVWoUzXjQyQa0GE8GMYuYIx9s=; b=ev6+LF
	2/N2nw1uRAckoj9QplaeEIhZyHMuPDm+kHZjdGRNTBqvqGc6vy6q7gAyzhFKvS+n
	IkKPpahIprT2SPd0dUEZ4kgHhAjX2dLsilbqPkjqEWPhQ40FufBYlbQOGniwpPvl
	i0oQCFL9JR456FV67sJ/2Qn4Qea1tbtV6rP3pccki28EWHpoWfF/odexsDJr0CiJ
	7J7jHB50RpnHJM1yrW2uYMu8dt7LVrOw7eh0iSgXhbf2KA8O9LIMvtTSKfSHjhsB
	9yE/KWOl94QE3CSVMTNhmOgsAWtneoxUCOBxbyQmvSmaxuit0eMfbvARCwqH+w40
	mWKkdG1SPUxqhwiQ==
Received: (qmail 1443615 invoked from network); 27 Jun 2025 13:18:12 +0200
Received: by mail.zeus03.de with UTF8SMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 27 Jun 2025 13:18:12 +0200
X-UD-Smtp-Session: l3s3148p1@MWFu1Ys4oIMgAwDPXzuUAOCQSK0rM+sw
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: linux-renesas-soc@vger.kernel.org
Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	=?UTF-8?q?Przemys=C5=82aw=20Gaj?= <pgaj@cadence.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Frank Li <Frank.Li@nxp.com>,
	linux-i3c@lists.infradead.org
Subject: [PATCH v2 3/3] i3c: master: cdns: replace ENOTSUPP with SUSV4-compliant EOPNOTSUPP
Date: Fri, 27 Jun 2025 13:17:58 +0200
Message-ID: <20250627111755.16535-8-wsa+renesas@sang-engineering.com>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250627111755.16535-5-wsa+renesas@sang-engineering.com>
References: <20250627111755.16535-5-wsa+renesas@sang-engineering.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The checkpatch warning '"ENOTSUPP is not a SUSV4 error code, prefer
EOPNOTSUPP"' is correct. We never want this to slip to userspace.

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


