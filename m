Return-Path: <linux-renesas-soc+bounces-29876-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id iAaUAH3Xu2k4owIAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-29876-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 19 Mar 2026 12:01:17 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 8DD472C9E59
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 19 Mar 2026 12:01:16 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 7760B302C28B
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 19 Mar 2026 11:00:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E64483C6A33;
	Thu, 19 Mar 2026 11:00:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="AMU8FuT3"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DEB6F3C7DE2
	for <linux-renesas-soc@vger.kernel.org>; Thu, 19 Mar 2026 11:00:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773918023; cv=none; b=AKIy9HCamCm8UxdMBWlIKBUCeucfmzLQksqSZPQGR9ocSBBA7ECamCEtuEC6FUI9IMhPscRLmLOGi3j4dG8B+nKku6f2dmcT2oZUTQkFXe0tJ1aL1AtHVRd+hbbPv4SqyEvKT2sUY9rsKoeX0zCTWToC79Al7ouye8CR9CDtEc0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773918023; c=relaxed/simple;
	bh=gKBddV9sinIqdmJCyXboDE9z9F21uQ+JueRqg5Hobo8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=M3gqFW7rkiQNIANeB3ikJSKXSqlylRHdBt9FMduWTKK+zHknzYEX/O9Oc2zxK1oGn+cLV50/ZO+PH1FsaVxRlS9QKsxAbO5Xe1EpMwBTxgNHJ3L7dcQjYZBcXFGPEorHmp6EtkMvdHnkQkvOLKEDCjAK//a6u8ihRCJvyDBnKLg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=AMU8FuT3; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=from:to:cc:subject:date:message-id
	:in-reply-to:references:mime-version:content-transfer-encoding;
	 s=k1; bh=w7ycEgeDr6Fe7llcfOqItjza7eOV0SfPJPxdSW1Pnro=; b=AMU8Fu
	T3bj6XGrPazpi52hVvnhjurfuvXSHk3c2ppTlcd+1CBNQwf0u9bhj/jPvMnDsKaZ
	CwKUJ2UX44jeM17ALXkvlxB4vAur1Q/waj6eUGfIhd+Y/q5uHloeDd6R9o5Y0tBY
	5oLcSI98Bc27vOukMDyuk6TdWdli/Hv8bLk9Lj9LBuAgnOWUyMwT7RuTzi8iDTnP
	Xgc25GRi57l7EuJTM6K/GG5JC0fq9ibNNlFdJq2cNtJweNrSfYVlRBFELv6Xdx1t
	jD7O6bsT2+EYHn5R+F4NlXuZPySl9GYpee3vLJAnlILu/KdfkOOYqIGW+svFKbve
	xJiqnTdywbm0XG6Q==
Received: (qmail 1099588 invoked from network); 19 Mar 2026 11:59:59 +0100
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 19 Mar 2026 11:59:59 +0100
X-UD-Smtp-Session: l3s3148p1@XMUueF5NapsgAwDPXzF+ANZpdrMKUeLI
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: linux-renesas-soc@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
	Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Bjorn Andersson <andersson@kernel.org>,
	Baolin Wang <baolin.wang@linux.alibaba.com>,
	Orson Zhai <orsonzhai@gmail.com>,
	Chunyan Zhang <zhang.lyra@gmail.com>,
	linux-remoteproc@vger.kernel.org
Subject: [PATCH v5 07/15] hwspinlock: sprd: use new callback to initialize hwspinlock priv
Date: Thu, 19 Mar 2026 11:59:29 +0100
Message-ID: <20260319105947.6237-8-wsa+renesas@sang-engineering.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260319105947.6237-1-wsa+renesas@sang-engineering.com>
References: <20260319105947.6237-1-wsa+renesas@sang-engineering.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [0.34 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[sang-engineering.com:s=k1];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-29876-lists,linux-renesas-soc=lfdr.de,renesas];
	PRECEDENCE_BULK(0.00)[];
	DMARC_NA(0.00)[sang-engineering.com];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[vger.kernel.org,sang-engineering.com,kernel.org,linux.alibaba.com,gmail.com];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[wsa@sang-engineering.com,linux-renesas-soc@vger.kernel.org];
	RCPT_COUNT_SEVEN(0.00)[8];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-0.974];
	DKIM_TRACE(0.00)[sang-engineering.com:+];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sang-engineering.com:dkim,sang-engineering.com:email,sang-engineering.com:mid,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 8DD472C9E59
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Apply the new helper to avoid using internal structures from the core.

Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
---
 drivers/hwspinlock/sprd_hwspinlock.c | 16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

diff --git a/drivers/hwspinlock/sprd_hwspinlock.c b/drivers/hwspinlock/sprd_hwspinlock.c
index 0b91bdd4303d..f906f5fa74ef 100644
--- a/drivers/hwspinlock/sprd_hwspinlock.c
+++ b/drivers/hwspinlock/sprd_hwspinlock.c
@@ -70,10 +70,16 @@ static void sprd_hwspinlock_relax(struct hwspinlock *lock)
 	ndelay(10);
 }
 
+static void *sprd_hwspinlock_init_priv(int local_id, void *init_data)
+{
+	return init_data + HWSPINLOCK_TOKEN(local_id);
+}
+
 static const struct hwspinlock_ops sprd_hwspinlock_ops = {
 	.trylock = sprd_hwspinlock_trylock,
 	.unlock = sprd_hwspinlock_unlock,
 	.relax = sprd_hwspinlock_relax,
+	.init_priv = sprd_hwspinlock_init_priv,
 };
 
 static void sprd_hwspinlock_disable(void *data)
@@ -86,8 +92,7 @@ static void sprd_hwspinlock_disable(void *data)
 static int sprd_hwspinlock_probe(struct platform_device *pdev)
 {
 	struct sprd_hwspinlock_dev *sprd_hwlock;
-	struct hwspinlock *lock;
-	int i, ret;
+	int ret;
 
 	if (!pdev->dev.of_node)
 		return -ENODEV;
@@ -123,16 +128,11 @@ static int sprd_hwspinlock_probe(struct platform_device *pdev)
 	/* set the hwspinlock to record user id to identify subsystems */
 	writel(HWSPINLOCK_USER_BITS, sprd_hwlock->base + HWSPINLOCK_RECCTRL);
 
-	for (i = 0; i < SPRD_HWLOCKS_NUM; i++) {
-		lock = &sprd_hwlock->bank.lock[i];
-		lock->priv = sprd_hwlock->base + HWSPINLOCK_TOKEN(i);
-	}
-
 	platform_set_drvdata(pdev, sprd_hwlock);
 
 	return devm_hwspin_lock_register(&pdev->dev, &sprd_hwlock->bank,
 					 &sprd_hwspinlock_ops, 0,
-					 SPRD_HWLOCKS_NUM, NULL);
+					 SPRD_HWLOCKS_NUM, sprd_hwlock->base);
 }
 
 static const struct of_device_id sprd_hwspinlock_of_match[] = {
-- 
2.51.0


