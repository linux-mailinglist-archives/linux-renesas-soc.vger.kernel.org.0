Return-Path: <linux-renesas-soc+bounces-18885-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id DA7B5AEC9EA
	for <lists+linux-renesas-soc@lfdr.de>; Sat, 28 Jun 2025 21:20:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 0E97C1BC0015
	for <lists+linux-renesas-soc@lfdr.de>; Sat, 28 Jun 2025 19:21:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C5715221700;
	Sat, 28 Jun 2025 19:20:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="IfUrJ4FV"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6BD1624418F
	for <linux-renesas-soc@vger.kernel.org>; Sat, 28 Jun 2025 19:20:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751138452; cv=none; b=TtjNwc4H0UVIlk1j/AQIYSRjj1MFDrjArBnqs7YL0NNKBDaONY1+TgHMGj6c2KtMns0P+6LYKRoi1o4kPuSlcVcw/MfoTlA2TX4kkue1Mrm2wSUcFd0bYHzKaowiTWTyGcNIDi9PfYAl1K/9HQ/TrrhaXVrJTJA02MiniKBFeo0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751138452; c=relaxed/simple;
	bh=7EwBExbHfoRGXAtdNPGzsQWLgrbm2KzeDSzggVO/dAM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=o94ztVe4aldABmiLtBRDo6i3kJrmll+/vTc9v1X7zW7pFkTvk+tTWsSr9p2cD7nxgFrZ09fEzcKnQ4UWr5YamxtTmB+6RoGXDbJISnzRSAy6Au7dlPdcYGYw+taUIRNJfOBub1i2v6jUd+O+pV3eWNArxUFXTZ5Phaxf/m83ujE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=IfUrJ4FV; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=from:to:cc:subject:date:message-id
	:in-reply-to:references:mime-version:content-transfer-encoding;
	 s=k1; bh=tAlopqS+uXPpfwDIJULj8OOtkm5TOkovt9Zs2uY71kQ=; b=IfUrJ4
	FVqTq4BrkDLTx8pyEbdxEQhLpamAQE6vxKvOfeHm0GaMD9ewOurWQIRiusdwdfLp
	imJcjxP3PVR6SBCcUjSO03lDQf36n7VMHON6fItPN2PIzjhah0htmeEec3q2P/wI
	PkgyaQFXezW+rV8gEOIUorRmG7C0zzG2wVlSFMt7DxFsIIg/2FZx6z70I8pevEtt
	2xetnd0447SsCpmsWjE7Pt8Mf89lQZ6mdvlhPAEeEXoJluock8HjhdxdbpnwHEjo
	UsZLqbtAnn4qUpvOytNsivzv1wkwkco9ZNdXYDi+zxdJjmgyNuxBITfgGtG3Usui
	P2wx/SsU5NlLJzMg==
Received: (qmail 1919028 invoked from network); 28 Jun 2025 21:20:48 +0200
Received: by mail.zeus03.de with UTF8SMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 28 Jun 2025 21:20:48 +0200
X-UD-Smtp-Session: l3s3148p1@eqgcsaY4dM0tnPBw
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: linux-renesas-soc@vger.kernel.org
Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	=?UTF-8?q?Przemys=C5=82aw=20Gaj?= <pgaj@cadence.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Frank Li <Frank.Li@nxp.com>,
	linux-i3c@lists.infradead.org
Subject: [PATCH v3 3/3] i3c: master: cdns: replace ENOTSUPP with SUSV4-compliant EOPNOTSUPP
Date: Sat, 28 Jun 2025 21:20:30 +0200
Message-ID: <20250628192027.3932-8-wsa+renesas@sang-engineering.com>
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


