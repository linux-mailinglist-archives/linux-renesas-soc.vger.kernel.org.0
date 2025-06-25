Return-Path: <linux-renesas-soc+bounces-18727-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D907AE83C9
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 25 Jun 2025 15:09:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id BAE0C16FBDA
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 25 Jun 2025 13:09:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AE9722609F7;
	Wed, 25 Jun 2025 13:09:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="SP2w9LcK"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E00FC25FA07
	for <linux-renesas-soc@vger.kernel.org>; Wed, 25 Jun 2025 13:09:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750856984; cv=none; b=EVURv9oO2u/Mdu67Vl8m7t4rj/7OT/yiMFxI/gxJO9X8BIuYyvTRp21HnQ84GcQYMUhGFgfNbWCdNDmIBk/f5lXx9Z7KDQdk0nZVG9WYX5fIYJfzEr0uAHGX3I4IxyXcJ+uCKBciaxdzLDLhiov59BdtdII6spl7iuV2hwRdqxU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750856984; c=relaxed/simple;
	bh=u6EAy/f97zTbbybJGHiMswY3V8XdpbEV2MPN8t1AFnU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=T4Aas6xpCiA98iZEiVQmXRu2X1CYVPwL2/8hZDHAGzWDleTrGVUjIqx0/nSeYnILQ93BR3fTCchpwm8yLh+xKuLyOLJmlDwDWkexKQqtL/ulUIEemX3xQhW8+gZBz+e1PWTV7uILzYpSvcz9piEZT1Syvl4sbSjLn/GStKPK7mQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=SP2w9LcK; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=from:to:cc:subject:date:message-id
	:in-reply-to:references:mime-version:content-transfer-encoding;
	 s=k1; bh=kzdEHdkkNjMHsIT0DAmMvWAjYn7mpE9WhEzzYUPowOc=; b=SP2w9L
	cKa3ns4OF8SSIrylYfI4CQOCLS2NuiUsyWMa4FgPekbStn/h9zGbTxi1n/D+dSxa
	m/eoE0dJHoEstgHPUFdr3VW/YtvJthJzisqQv6ybyNkMWD/jA8rPo1jPkmWKpZWG
	QEoBfJr8VNFojNmbt+Yq/OcvkGyGflqfQ1cmAwU/O+TgLW4eK+DO6RbWeNmvktkh
	b7ieynr6TQcA4gr6bWk2ddJJCuwfWg5xWt9v3pbUe1QSXdPSrUey+Gx+ShEiWq2p
	xu3OVjJws73qx1PjlxAe9WqE8+XoZctG9cTL/R73UIXVBz28IMhjn3Co0SXTi61C
	NCa50j5+dVr5tf4g==
Received: (qmail 659045 invoked from network); 25 Jun 2025 15:09:37 +0200
Received: by mail.zeus03.de with UTF8SMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 25 Jun 2025 15:09:37 +0200
X-UD-Smtp-Session: l3s3148p1@NE0sKGU4WtdtKDAs
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: linux-renesas-soc@vger.kernel.org
Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Frank Li <Frank.Li@nxp.com>,
	linux-i3c@lists.infradead.org
Subject: [PATCH 2/3] i3c: dw: switch to use SUSV4 error codes
Date: Wed, 25 Jun 2025 15:09:20 +0200
Message-ID: <20250625130918.14507-7-wsa+renesas@sang-engineering.com>
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


