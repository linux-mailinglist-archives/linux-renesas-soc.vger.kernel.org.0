Return-Path: <linux-renesas-soc+bounces-31353-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id uG4ULhnl4WmKzgAAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-31353-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 17 Apr 2026 09:45:29 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 27F8D4181F2
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 17 Apr 2026 09:45:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 9695130E450A
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 17 Apr 2026 07:42:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3BE1E37C908;
	Fri, 17 Apr 2026 07:42:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="XMeMAmLf"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D03D379EC1
	for <linux-renesas-soc@vger.kernel.org>; Fri, 17 Apr 2026 07:42:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776411770; cv=none; b=dE6ihz8w7FEieUxraSO8/gGoGeSERx3OV97WJY4n+DkvxWd6kdgCkV5cprKvg9vmqoduG4VE4AHQqH1MxtmRI4UMBXkvkaXITqEhT9ps12fFi/kc5SVRy5WGsWhQdblNcguk0djXr77Y+Mdzn4pAAy0t1idwahTbW598edrlZpw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776411770; c=relaxed/simple;
	bh=knJEA8B7QZxEh/kqQU2DgntgYWOWeRF/alFzEQG6sWY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Tp+E3HU0wgX2RabN4bQKAetyYgIXDwc12ePLdoizYBbDwqmNoK4sDD0Bxyf3o92u29TCvefnbHFSftrTr619OjykA7hMhASQTcsvobEBuznNjh+KC7SsGQjLaRa3DF/57INN7zZCwfDd7ca28Kr6M7xCN05MfWl7P+S6R90PFw4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=XMeMAmLf; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=from:to:cc:subject:date:message-id
	:in-reply-to:references:mime-version:content-transfer-encoding;
	 s=k1; bh=39c9RleYighhBE6xhQNEebfpiH1/xpyXp2eDLj7h3gU=; b=XMeMAm
	Lff8XFeLmAKF2WWE7XH5/MpmT1cDbS1wBdUEFrOrkeiO2Mu2rVLHVw8eqrTqdKvx
	xouNckrjfkQawIwKc4WLzNoVyo9tAIaAHz/j6GU1dBYQu8OhRNjkYnRXUDk9VWXE
	pT8+h4RNYcIWbF4j0d5HzNzSitdghblz7Rv8eL901UFZsTg4qAa0exK2k03Eq8qG
	SqXg11loRNM+Ki2Dl9ZCpFVohantXtaOnRuyfzGGKUYHqLaJQQwnO9VuWNRfWd0L
	5T2QZf2GnSG6TtDpDHeRrDMQRqUywGJiTSmNuOxMpdlPWfVSd25hY1vR2xzO8zJo
	OrdPYdWHHiOcxAxA==
Received: (qmail 3856049 invoked from network); 17 Apr 2026 09:42:43 +0200
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 17 Apr 2026 09:42:43 +0200
X-UD-Smtp-Session: l3s3148p1@9qIiGKNPQ2NtKXL4
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: linux-renesas-soc@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
	Sudeep Holla <sudeep.holla@kernel.org>,
	Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Jassi Brar <jassisinghbrar@gmail.com>
Subject: [PATCH v2 4/4] mailbox: mailbox-test: make data_ready a per-instance variable
Date: Fri, 17 Apr 2026 09:42:36 +0200
Message-ID: <20260417074237.16053-5-wsa+renesas@sang-engineering.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260417074237.16053-1-wsa+renesas@sang-engineering.com>
References: <20260417074237.16053-1-wsa+renesas@sang-engineering.com>
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
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[sang-engineering.com:s=k1];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-31353-lists,linux-renesas-soc=lfdr.de,renesas];
	DMARC_NA(0.00)[sang-engineering.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[vger.kernel.org,kernel.org,sang-engineering.com,gmail.com];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[wsa@sang-engineering.com,linux-renesas-soc@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[sang-engineering.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas];
	MID_RHS_MATCH_FROM(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sang-engineering.com:email,sang-engineering.com:dkim,sang-engineering.com:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 27F8D4181F2
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

While not the default case, multiple tests can be run simultaneously.
Then, data_ready being a global variable will be overwritten and the
per-instance lock will not help. Turn the global variable into a
per-instance one to avoid this problem.

Fixes: e339c80af95e ("mailbox: mailbox-test: don't rely on rx_buffer content to signal data ready")
Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
---
 drivers/mailbox/mailbox-test.c | 9 ++++-----
 1 file changed, 4 insertions(+), 5 deletions(-)

diff --git a/drivers/mailbox/mailbox-test.c b/drivers/mailbox/mailbox-test.c
index ec591616fe46..7b6ef033e77a 100644
--- a/drivers/mailbox/mailbox-test.c
+++ b/drivers/mailbox/mailbox-test.c
@@ -28,8 +28,6 @@
 #define MBOX_HEXDUMP_MAX_LEN	(MBOX_HEXDUMP_LINE_LEN *		\
 				 (MBOX_MAX_MSG_LEN / MBOX_BYTES_PER_LINE))
 
-static bool mbox_data_ready;
-
 struct mbox_test_device {
 	struct device		*dev;
 	void __iomem		*tx_mmio;
@@ -42,6 +40,7 @@ struct mbox_test_device {
 	spinlock_t		lock;
 	struct mutex		mutex;
 	wait_queue_head_t	waitq;
+	bool			data_ready;
 	struct fasync_struct	*async_queue;
 	struct dentry		*root_debugfs_dir;
 };
@@ -162,7 +161,7 @@ static bool mbox_test_message_data_ready(struct mbox_test_device *tdev)
 	unsigned long flags;
 
 	spin_lock_irqsave(&tdev->lock, flags);
-	data_ready = mbox_data_ready;
+	data_ready = tdev->data_ready;
 	spin_unlock_irqrestore(&tdev->lock, flags);
 
 	return data_ready;
@@ -227,7 +226,7 @@ static ssize_t mbox_test_message_read(struct file *filp, char __user *userbuf,
 	*(touser + l) = '\0';
 
 	memset(tdev->rx_buffer, 0, MBOX_MAX_MSG_LEN);
-	mbox_data_ready = false;
+	tdev->data_ready = false;
 
 	spin_unlock_irqrestore(&tdev->lock, flags);
 
@@ -297,7 +296,7 @@ static void mbox_test_receive_message(struct mbox_client *client, void *message)
 				     message, MBOX_MAX_MSG_LEN);
 		memcpy(tdev->rx_buffer, message, MBOX_MAX_MSG_LEN);
 	}
-	mbox_data_ready = true;
+	tdev->data_ready = true;
 	spin_unlock_irqrestore(&tdev->lock, flags);
 
 	wake_up_interruptible(&tdev->waitq);
-- 
2.51.0


