Return-Path: <linux-renesas-soc+bounces-18884-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id A8C4EAEC9E9
	for <lists+linux-renesas-soc@lfdr.de>; Sat, 28 Jun 2025 21:20:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id BC5FB1BC0029
	for <lists+linux-renesas-soc@lfdr.de>; Sat, 28 Jun 2025 19:21:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 823BD220F3A;
	Sat, 28 Jun 2025 19:20:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="KUknJNqY"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 14FB0221700
	for <linux-renesas-soc@vger.kernel.org>; Sat, 28 Jun 2025 19:20:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751138451; cv=none; b=lODVwi5aZhvSxrA1ffoWnsNJa5OqJYvT/559j+Pf1BiRa8YVa6HizYr7kF3rxkV3r3pD8+0bClNjtggBYeDvkGqzoB4q947Jr6yiXRw3BzrNdbzukduZ1rfTwqdxjJFfnt2NWQroYtyjI6ySt4JoMKqFnbRx7NGtBgJh+lAUlAM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751138451; c=relaxed/simple;
	bh=DFjZSOmrCspmAYuu1KRIHSXdZFbucs3zDqXuXYDDAhg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ugDQsqC0X3rfQijseWtWvf9tI5PcLHssVH2wgQ+4KMozyJD7eetZgkTXnvZ1+LsA8LyfaoWcYQtwe7LcrP+AR+QaxkQnRogpbyhkN76sFv6RbvNVPaamI7NFz8fAEpMazwtPq6vJym4WJPRG2n/19eXZPHIQ5puNlOiXEB76Ibc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=KUknJNqY; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=from:to:cc:subject:date:message-id
	:in-reply-to:references:mime-version:content-transfer-encoding;
	 s=k1; bh=RIgL47DQrsfImU7z8Kga3BKZ2DnBanRjOcV1Veh3nmU=; b=KUknJN
	qYsLs71bXKu30XzY5jGzQgwNbB3bLPan9D09aZSrWD7fbCjAfkOZAGGT9mbzmpF6
	+r09BaEJzsAwB+k/3RLQRW/hBzFs3hNNuPTKRlrldUzoPFysu9h5GP7IrnFVSNL5
	Gy85ozEXSPoNKLEzLw5A/r8W9+HWZMhBY22T/2lTFkCoXdtCfCQwQN9Sccb6Xv52
	28gf2lhdjZuKUu2xNZbhyJE5Xwn14JQMuR0DQqneRmdP/cnzbqTymnYhZcbtSN7T
	Xe4/xQr0ZZEAyRDMdVAmaluHkGXCtjDOcbSmU/BHnIBOvkRhXmPRWNdPLx874J1X
	G02fi0g1KOsMOndw==
Received: (qmail 1918999 invoked from network); 28 Jun 2025 21:20:46 +0200
Received: by mail.zeus03.de with UTF8SMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 28 Jun 2025 21:20:46 +0200
X-UD-Smtp-Session: l3s3148p1@aOQGsaY4cM0tnPBw
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: linux-renesas-soc@vger.kernel.org
Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Frank Li <Frank.Li@nxp.com>,
	linux-i3c@lists.infradead.org
Subject: [PATCH v3 2/3] i3c: dw: replace ENOTSUPP with SUSV4-compliant EOPNOTSUPP
Date: Sat, 28 Jun 2025 21:20:29 +0200
Message-ID: <20250628192027.3932-7-wsa+renesas@sang-engineering.com>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250628192027.3932-5-wsa+renesas@sang-engineering.com>
References: <20250628192027.3932-5-wsa+renesas@sang-engineering.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Replace non-standard ENOTSUPP with the SUSV4-defined error code
EOPNOTSUPP to fix below checkpatch warning:
  "ENOTSUPP is not a SUSV4 error code, prefer EOPNOTSUPP"

Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
---
 drivers/i3c/master/dw-i3c-master.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/i3c/master/dw-i3c-master.c b/drivers/i3c/master/dw-i3c-master.c
index 611c22b72c15..91429d94a866 100644
--- a/drivers/i3c/master/dw-i3c-master.c
+++ b/drivers/i3c/master/dw-i3c-master.c
@@ -932,7 +932,7 @@ static int dw_i3c_master_priv_xfers(struct i3c_dev_desc *dev,
 		return 0;
 
 	if (i3c_nxfers > master->caps.cmdfifodepth)
-		return -ENOTSUPP;
+		return -EOPNOTSUPP;
 
 	for (i = 0; i < i3c_nxfers; i++) {
 		if (i3c_xfers[i].rnw)
@@ -943,7 +943,7 @@ static int dw_i3c_master_priv_xfers(struct i3c_dev_desc *dev,
 
 	if (ntxwords > master->caps.datafifodepth ||
 	    nrxwords > master->caps.datafifodepth)
-		return -ENOTSUPP;
+		return -EOPNOTSUPP;
 
 	xfer = dw_i3c_master_alloc_xfer(master, i3c_nxfers);
 	if (!xfer)
@@ -1093,7 +1093,7 @@ static int dw_i3c_master_i2c_xfers(struct i2c_dev_desc *dev,
 		return 0;
 
 	if (i2c_nxfers > master->caps.cmdfifodepth)
-		return -ENOTSUPP;
+		return -EOPNOTSUPP;
 
 	for (i = 0; i < i2c_nxfers; i++) {
 		if (i2c_xfers[i].flags & I2C_M_RD)
@@ -1104,7 +1104,7 @@ static int dw_i3c_master_i2c_xfers(struct i2c_dev_desc *dev,
 
 	if (ntxwords > master->caps.datafifodepth ||
 	    nrxwords > master->caps.datafifodepth)
-		return -ENOTSUPP;
+		return -EOPNOTSUPP;
 
 	xfer = dw_i3c_master_alloc_xfer(master, i2c_nxfers);
 	if (!xfer)
-- 
2.47.2


