Return-Path: <linux-renesas-soc+bounces-6479-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8DF4390E4F8
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 19 Jun 2024 09:55:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id A09871C220BB
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 19 Jun 2024 07:55:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4AE20770F3;
	Wed, 19 Jun 2024 07:54:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.b="aexp/nWf"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from out30-100.freemail.mail.aliyun.com (out30-100.freemail.mail.aliyun.com [115.124.30.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 64EBF770ED;
	Wed, 19 Jun 2024 07:54:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=115.124.30.100
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718783696; cv=none; b=XGt5KT6d06IFQ4sqaZsxzN80iCb5HK5UsqVGzBLriPH89EhoCA1JvNOKsJgv0VOD+D2WYPkkFeSWBLQq3tDzQA2dyikXD7JJS902QeRDgsi+YOFN5/836EMPkyj+seMGxYH2Y3OQtc4rpeGlN408ESkxnYF962dsSVazK4CEkp0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718783696; c=relaxed/simple;
	bh=OLxeNNNbPVf41iNIEfzu7xIT7b6aiF/XEAM7WfvJUDw=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=L8tnmjPDss/p2IJHxterYeZ15XQPNQVSInlOl3gpYw0uOSypNRsUjBuSoPii5wQhF7/+P2Osp/4wwmcgGJdKP2FD2TXzhDiZ26kxDOlUYeh4ku9ciE3AwxuZN4TCuuPxszVBpGQfRai7RwePBmgld7xoQZaDcxsweoEEm22y3mk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com; spf=pass smtp.mailfrom=linux.alibaba.com; dkim=pass (1024-bit key) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.b=aexp/nWf; arc=none smtp.client-ip=115.124.30.100
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.alibaba.com
DKIM-Signature:v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux.alibaba.com; s=default;
	t=1718783685; h=From:To:Subject:Date:Message-Id:MIME-Version;
	bh=153sJGUDwz+Ma4rWOSNrBYcbULlbrmUWxTCNDx3aNXY=;
	b=aexp/nWfTB7Go0zPz7AUd0fqBnWyBiEaMKuGeHTlTHMigc3AkTVp5zfjL+HTUe+KK3eIWsHHOEO3JeKJhXistWa9IKT+++tflCHXAQG1eUCXpVtsMTGxB33nMdBY5vUM81cNypG1LwyrrZPmH0MalaewveqYtSTTJJd470kxbIw=
X-Alimail-AntiSpam:AC=PASS;BC=-1|-1;BR=01201311R511e4;CH=green;DM=||false|;DS=||;FP=0|-1|-1|-1|0|-1|-1|-1;HT=maildocker-contentspam033037067110;MF=jiapeng.chong@linux.alibaba.com;NM=1;PH=DS;RN=9;SR=0;TI=SMTPD_---0W8nMtNe_1718783676;
Received: from localhost(mailfrom:jiapeng.chong@linux.alibaba.com fp:SMTPD_---0W8nMtNe_1718783676)
          by smtp.aliyun-inc.com;
          Wed, 19 Jun 2024 15:54:44 +0800
From: Jiapeng Chong <jiapeng.chong@linux.alibaba.com>
To: laurent.pinchart@ideasonboard.com
Cc: kieran.bingham+renesas@ideasonboard.com,
	airlied@gmail.com,
	daniel@ffwll.ch,
	dri-devel@lists.freedesktop.org,
	linux-renesas-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Jiapeng Chong <jiapeng.chong@linux.alibaba.com>,
	Abaci Robot <abaci@linux.alibaba.com>
Subject: [PATCH] drm: Remove unused function rcar_cmm_write
Date: Wed, 19 Jun 2024 15:54:36 +0800
Message-Id: <20240619075436.86407-1-jiapeng.chong@linux.alibaba.com>
X-Mailer: git-send-email 2.20.1.7.g153144c
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The function are defined in the rcar_cmm.c file, but not called
elsewhere, so delete the unused function.

drivers/gpu/drm/renesas/rcar-du/rcar_cmm.c:35:19: warning: unused function 'rcar_cmm_read'.

Reported-by: Abaci Robot <abaci@linux.alibaba.com>
Closes: https://bugzilla.openanolis.cn/show_bug.cgi?id=9364
Signed-off-by: Jiapeng Chong <jiapeng.chong@linux.alibaba.com>
---
 drivers/gpu/drm/renesas/rcar-du/rcar_cmm.c | 5 -----
 1 file changed, 5 deletions(-)

diff --git a/drivers/gpu/drm/renesas/rcar-du/rcar_cmm.c b/drivers/gpu/drm/renesas/rcar-du/rcar_cmm.c
index 26a2f5ad8ee5..883b960e9acc 100644
--- a/drivers/gpu/drm/renesas/rcar-du/rcar_cmm.c
+++ b/drivers/gpu/drm/renesas/rcar-du/rcar_cmm.c
@@ -32,11 +32,6 @@ struct rcar_cmm {
 	} lut;
 };
 
-static inline int rcar_cmm_read(struct rcar_cmm *rcmm, u32 reg)
-{
-	return ioread32(rcmm->base + reg);
-}
-
 static inline void rcar_cmm_write(struct rcar_cmm *rcmm, u32 reg, u32 data)
 {
 	iowrite32(data, rcmm->base + reg);
-- 
2.20.1.7.g153144c


