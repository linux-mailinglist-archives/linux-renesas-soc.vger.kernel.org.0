Return-Path: <linux-renesas-soc+bounces-18831-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 30DE5AEB61C
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 27 Jun 2025 13:18:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 9B5973BA213
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 27 Jun 2025 11:17:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 21FE81A841C;
	Fri, 27 Jun 2025 11:18:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="djK5APLB"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E96C21DE2AD
	for <linux-renesas-soc@vger.kernel.org>; Fri, 27 Jun 2025 11:18:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751023098; cv=none; b=Db8/vi2k8qbQsajHc1nYT/YQTjlUm/kF0+OiozQln7ZkZIUfuFTO//sVPqNynftniLL4vlxQLTt3PvFE7TP7lQFhLT5Nt84hUG4BU1tAxP2o9Dm2/seZa2BVPRCxOyAx8KBR7K+gZ0R0IVR02/sFcwd8fsifp7a6AqFnOeb8jWs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751023098; c=relaxed/simple;
	bh=u4ecj8oK/dM3MZw6IqpKhDY0upZGggfvDSDczJzti7s=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=kmeaO2cVkhU2iMEeOKZjfTisR5tun6CS2eBwmPfw/yYMHNU7gPP16sihRkjutGhee4/M/GymNiDYNO2d84GPnHPT65PT1lG6hC/wNsFn9zoTfjVn7u+yDpW7OIamtPd56I7lmTGD8L7FI2YO/+/KAaPpEHxYBosMHJxjjRi/0Wo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=djK5APLB; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=from:to:cc:subject:date:message-id
	:in-reply-to:references:mime-version:content-transfer-encoding;
	 s=k1; bh=xT0iy3mXmITl75fYvOD0W/SWNIX0fZU7TXLrhInH0is=; b=djK5AP
	LBGVCUgDydeUvI9HIZHRmzzQVkz2/HeDgyN/uWWr/er16Yo2MlEuG9PJM2i+wbAw
	2erqh4NoeTx845vgpssNCbJOmslzTKhtI79hJYhuCdLjq76BZ247tif1VlL/TUnV
	f+HXCPJ6NtJ11PSdC0G4eetMw9wz0A81DVA9iqKawfCoQZSUSMBGaa1FX62PACrl
	xjQH5mjbV7RCUNpoCa/MTx/XdGOT3qQDLPoJbHarTUyN9DVIkgQXqlTWSZvcpL36
	AyS6Q6DJLdPWpjMk27/K+au2UIti+RQxMvJKggAiaEKK9b9Pci+rjEVXloFCxP4V
	jjdXr/umYW6Nuo2g==
Received: (qmail 1443586 invoked from network); 27 Jun 2025 13:18:12 +0200
Received: by mail.zeus03.de with UTF8SMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 27 Jun 2025 13:18:12 +0200
X-UD-Smtp-Session: l3s3148p1@rFFj1Ys4lIMgAwDPXzuUAOCQSK0rM+sw
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: linux-renesas-soc@vger.kernel.org
Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Frank Li <Frank.Li@nxp.com>,
	linux-i3c@lists.infradead.org
Subject: [PATCH v2 2/3] i3c: dw: replace ENOTSUPP with SUSV4-compliant EOPNOTSUPP
Date: Fri, 27 Jun 2025 13:17:57 +0200
Message-ID: <20250627111755.16535-7-wsa+renesas@sang-engineering.com>
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


