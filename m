Return-Path: <linux-renesas-soc+bounces-18832-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 809F4AEB61D
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 27 Jun 2025 13:18:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id B13DF16D5AF
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 27 Jun 2025 11:18:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4A28F294A1A;
	Fri, 27 Jun 2025 11:18:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="emaVXsZz"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3FC4126B77D
	for <linux-renesas-soc@vger.kernel.org>; Fri, 27 Jun 2025 11:18:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751023099; cv=none; b=llo7fgtaBRuH5L3rDqEnu+lEawCG4nwgS3JHIWZlIrXTvtOOTnDdjYi0vyXrpus/YkHDsbhbewKVdiKsA7VHqGufhR2g44+HkR8h5PKoymMfgMfQ+enWHQKVx3WEM/mNeqJg6T/xEoXik2b8VGswcldepIZaCc1JhYXWTBp1gJc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751023099; c=relaxed/simple;
	bh=l1lUlUrWC5oCsLKMOHxHYmurA+O6S4hjNOHdj3q3o74=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=gA4KRW5QRmstH3ft/227djy9CABes8i1hJFNCvp8i0kBj088byLoiUrFqHhAD6RaZzPK+NUgRjiPZ362lBM4yiMDF9bOChapELn7fYGMr8VWBoOr4mHTXANhCsKzUw1dGtz/Ta1Vd1jgFSoZVjW0AVVUjF/GRpujriO5NCF/7aI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=emaVXsZz; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=from:to:cc:subject:date:message-id
	:in-reply-to:references:mime-version:content-transfer-encoding;
	 s=k1; bh=FXoy94CZdy9k0JBwseNRvk0IuIqcq4HsS7A08y7ovVQ=; b=emaVXs
	ZzPnV9L8lgFzIsgK1OJdnDg5ITlPOG9gHK3MNAMVN7KZeswYBxaLXy8TMb5pP0rK
	zALgrhZj44JrtPB00bouHVNJqQKeA6GsV1rmvhOQv79bDDArcCrOxxKH0z+q87E4
	RPUhDDspAz5kF8es07cWLktwQMBXdSMgNWR7Wa7rCOFDR1J8JL5BnVYKKLnE90o0
	YbkXElmj9Y39+OUVYRIGOuCj6WntBJTrtM8UOCQvJ2E85C05dcBCl3obZWeyc1W2
	2+70+jHpAcbNlSW2Dx90F/AnHSJ/aGem5fpA07Yu/wC/dNDbk/Z/R2MtpWrGW89L
	b+bjX6OAQzPFSenw==
Received: (qmail 1443555 invoked from network); 27 Jun 2025 13:18:11 +0200
Received: by mail.zeus03.de with UTF8SMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 27 Jun 2025 13:18:11 +0200
X-UD-Smtp-Session: l3s3148p1@Sr1X1Ys4iIMgAwDPXzuUAOCQSK0rM+sw
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: linux-renesas-soc@vger.kernel.org
Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Frank Li <Frank.Li@nxp.com>,
	linux-i3c@lists.infradead.org
Subject: [PATCH v2 1/3] i3c: master: replace ENOTSUPP with SUSV4-compliant EOPNOTSUPP
Date: Fri, 27 Jun 2025 13:17:56 +0200
Message-ID: <20250627111755.16535-6-wsa+renesas@sang-engineering.com>
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
 drivers/i3c/master.c | 20 ++++++++++----------
 1 file changed, 10 insertions(+), 10 deletions(-)

diff --git a/drivers/i3c/master.c b/drivers/i3c/master.c
index e53c69d24873..354fef4a033c 100644
--- a/drivers/i3c/master.c
+++ b/drivers/i3c/master.c
@@ -837,14 +837,14 @@ static int i3c_master_send_ccc_cmd_locked(struct i3c_master_controller *master,
 		return -EINVAL;
 
 	if (!master->ops->send_ccc_cmd)
-		return -ENOTSUPP;
+		return -EOPNOTSUPP;
 
 	if ((cmd->id & I3C_CCC_DIRECT) && (!cmd->dests || !cmd->ndests))
 		return -EINVAL;
 
 	if (master->ops->supports_ccc_cmd &&
 	    !master->ops->supports_ccc_cmd(master, cmd))
-		return -ENOTSUPP;
+		return -EOPNOTSUPP;
 
 	ret = master->ops->send_ccc_cmd(master, cmd);
 	if (ret) {
@@ -1439,7 +1439,7 @@ static int i3c_master_retrieve_dev_info(struct i3c_dev_desc *dev)
 
 	if (dev->info.bcr & I3C_BCR_HDR_CAP) {
 		ret = i3c_master_gethdrcap_locked(master, &dev->info);
-		if (ret && ret != -ENOTSUPP)
+		if (ret && ret != -EOPNOTSUPP)
 			return ret;
 	}
 
@@ -2210,7 +2210,7 @@ of_i3c_master_add_i2c_boardinfo(struct i3c_master_controller *master,
 	 */
 	if (boardinfo->base.flags & I2C_CLIENT_TEN) {
 		dev_err(dev, "I2C device with 10 bit address not supported.");
-		return -ENOTSUPP;
+		return -EOPNOTSUPP;
 	}
 
 	/* LVR is encoded in reg[2]. */
@@ -2340,13 +2340,13 @@ static int i3c_master_i2c_adapter_xfer(struct i2c_adapter *adap,
 		return -EINVAL;
 
 	if (!master->ops->i2c_xfers)
-		return -ENOTSUPP;
+		return -EOPNOTSUPP;
 
 	/* Doing transfers to different devices is not supported. */
 	addr = xfers[0].addr;
 	for (i = 1; i < nxfers; i++) {
 		if (addr != xfers[i].addr)
-			return -ENOTSUPP;
+			return -EOPNOTSUPP;
 	}
 
 	i3c_bus_normaluse_lock(&master->bus);
@@ -2766,7 +2766,7 @@ static int i3c_master_check_ops(const struct i3c_master_controller_ops *ops)
  *	    controller)
  * @ops: the master controller operations
  * @secondary: true if you are registering a secondary master. Will return
- *	       -ENOTSUPP if set to true since secondary masters are not yet
+ *	       -EOPNOTSUPP if set to true since secondary masters are not yet
  *	       supported
  *
  * This function takes care of everything for you:
@@ -2793,7 +2793,7 @@ int i3c_master_register(struct i3c_master_controller *master,
 
 	/* We do not support secondary masters yet. */
 	if (secondary)
-		return -ENOTSUPP;
+		return -EOPNOTSUPP;
 
 	ret = i3c_master_check_ops(ops);
 	if (ret)
@@ -2954,7 +2954,7 @@ int i3c_dev_do_priv_xfers_locked(struct i3c_dev_desc *dev,
 		return -EINVAL;
 
 	if (!master->ops->priv_xfers)
-		return -ENOTSUPP;
+		return -EOPNOTSUPP;
 
 	return master->ops->priv_xfers(dev, xfers, nxfers);
 }
@@ -3004,7 +3004,7 @@ int i3c_dev_request_ibi_locked(struct i3c_dev_desc *dev,
 	int ret;
 
 	if (!master->ops->request_ibi)
-		return -ENOTSUPP;
+		return -EOPNOTSUPP;
 
 	if (dev->ibi)
 		return -EBUSY;
-- 
2.47.2


