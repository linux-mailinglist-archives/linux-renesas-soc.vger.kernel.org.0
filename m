Return-Path: <linux-renesas-soc+bounces-31404-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id iJbtApIR5mlrrAEAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-31404-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 20 Apr 2026 13:44:18 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D97542A021
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 20 Apr 2026 13:44:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 6B88D301FD7E
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 20 Apr 2026 11:44:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3BA4839C624;
	Mon, 20 Apr 2026 11:44:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="T0M7/a+G"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE22439A818
	for <linux-renesas-soc@vger.kernel.org>; Mon, 20 Apr 2026 11:44:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776685446; cv=none; b=AYRPtLJ050exWRd4k9dOJD2U2sSyxHM4QEFDv8NZ0FF7qHNgSALEqkRvtdCcko6HVI5fShlX3hICV6u/5KIxcdHkRqsg6iGZ8H+2qwphNPujsg/cCWDLjezx+ZVCLzhD7P/7voCsiRZvkAkEklAMRw2o85Le4bHJlaFMDHG+Mcc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776685446; c=relaxed/simple;
	bh=QWB9N+rOisR9h3vE+niK3jmMTIxpifL3SdR0MGdpxfM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=laCAbemdoVFCeTWQhCI8GYwS4sfZAgMNVEqKddxQxxeePZY3SIxzDXCcwm5u+tmDEkk7haUBVgdqHuvt+vMoJOXsK42MuidFpBE0TocrYkK+7ZlNF3eZBlymsPf5hmbPlEV9wq368Jrlcwj0ndQrs/ohXcPrPwYkpZLmdCUAZB8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=T0M7/a+G; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=from:to:cc:subject:date:message-id
	:mime-version:content-transfer-encoding; s=k1; bh=3qjQXSI8a8vPs3
	OCg/SVh0I2x/RQVSWun1Ow4t00kXc=; b=T0M7/a+GCmEDTocSNO1coc77Y+3JE/
	hlXNqH+IQRQG7K+RN501YmbZuVetax8155EJ8eSKNMJXqfVjYh+vuw+xhleESi8E
	PGJr83mKBTghglXzqd22xo493a/fL18udjDt/C6p9Y0P6/fASin4RMtittrg1DB9
	ipp2F2pXibLpaGXff8dB5JHIg6qIFtFx6PvgpVnIvKBuMOJ/UBAV1MW5o0c0d1a8
	93HreLkqgjVuMajRhNdn4N8hjyBKAqRQHkxPngxAbOHtKcZiZwjszGlY7GVNrxZq
	qQgWaws5j4KNUFtDJoIWLT06d2GRyx4GQ+EjmC2hkFGEB1ISbSTUcAdQ==
Received: (qmail 845587 invoked from network); 20 Apr 2026 13:43:53 +0200
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 20 Apr 2026 13:43:53 +0200
X-UD-Smtp-Session: l3s3148p1@GoAd0OJPfBlUszZ9
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: linux-renesas-soc@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
	Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Jassi Brar <jassisinghbrar@gmail.com>,
	Mark Brown <broonie@linaro.org>
Subject: [PATCH v2] mailbox: don't free the channel if the startup callback failed
Date: Mon, 20 Apr 2026 13:41:45 +0200
Message-ID: <20260420114346.10586-2-wsa+renesas@sang-engineering.com>
X-Mailer: git-send-email 2.51.0
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
	TAGGED_FROM(0.00)[bounces-31404-lists,linux-renesas-soc=lfdr.de,renesas];
	DMARC_NA(0.00)[sang-engineering.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[vger.kernel.org,sang-engineering.com,gmail.com,linaro.org];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,sashiko.dev:url,sang-engineering.com:email,sang-engineering.com:dkim,sang-engineering.com:mid]
X-Rspamd-Queue-Id: 2D97542A021
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

If the optional startup() callbacks fails, we need to clear some states.
Currently, this is done by freeing the channel. This does, however, more
than needed which creates problems. Namely, it is calling the shutdown()
callback. This is totally not intuitive. No user expects that shutdown()
is called when startup() fails, similar to remove() not being called
when probe() fails. Currently, quite some mailbox users register the IRQ
in startup() and free them in shutdown(). These drivers will get a WARN
about freeing an already free IRQ. Other subtle issues could arise from
this unexpected behaviour.

To solve this problem, introduce a helper which does the minimal cleanup
and use it in both, in free_channel() and after startup() failed.

Link: https://sashiko.dev/#/patchset/20260402112709.13002-1-wsa%2Brenesas%40sang-engineering.com # second issue
Fixes: 2b6d83e2b8b7 ("mailbox: Introduce framework for mailbox")
Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
---

Changes since RFC v1:
* use a helper instead of open coding the cleanup
* reword commit message to explain more and drop the wrong "issue" of
  module_put imbalance

 drivers/mailbox/mailbox.c | 26 +++++++++++++++-----------
 1 file changed, 15 insertions(+), 11 deletions(-)

diff --git a/drivers/mailbox/mailbox.c b/drivers/mailbox/mailbox.c
index bbc9fd75a95f..2a83f83cf868 100644
--- a/drivers/mailbox/mailbox.c
+++ b/drivers/mailbox/mailbox.c
@@ -350,10 +350,9 @@ static int __mbox_bind_client(struct mbox_chan *chan, struct mbox_client *cl)
 
 	if (chan->mbox->ops->startup) {
 		ret = chan->mbox->ops->startup(chan);
-
 		if (ret) {
 			dev_err(dev, "Unable to startup the chan (%d)\n", ret);
-			mbox_free_channel(chan);
+			mbox_clean_and_put_channel(chan);
 			return ret;
 		}
 	}
@@ -482,6 +481,19 @@ struct mbox_chan *mbox_request_channel_byname(struct mbox_client *cl,
 }
 EXPORT_SYMBOL_GPL(mbox_request_channel_byname);
 
+void mbox_clean_and_put_channel(struct mbox_chan *chan)
+{
+	/* The queued TX requests are simply aborted, no callbacks are made */
+	scoped_guard(spinlock_irqsave, &chan->lock) {
+		chan->cl = NULL;
+		chan->active_req = MBOX_NO_MSG;
+		if (chan->txdone_method == MBOX_TXDONE_BY_ACK)
+			chan->txdone_method = MBOX_TXDONE_BY_POLL;
+	}
+
+	module_put(chan->mbox->dev->driver->owner);
+}
+
 /**
  * mbox_free_channel - The client relinquishes control of a mailbox
  *			channel by this call.
@@ -495,15 +507,7 @@ void mbox_free_channel(struct mbox_chan *chan)
 	if (chan->mbox->ops->shutdown)
 		chan->mbox->ops->shutdown(chan);
 
-	/* The queued TX requests are simply aborted, no callbacks are made */
-	scoped_guard(spinlock_irqsave, &chan->lock) {
-		chan->cl = NULL;
-		chan->active_req = MBOX_NO_MSG;
-		if (chan->txdone_method == MBOX_TXDONE_BY_ACK)
-			chan->txdone_method = MBOX_TXDONE_BY_POLL;
-	}
-
-	module_put(chan->mbox->dev->driver->owner);
+	mbox_clean_and_put_channel(chan);
 }
 EXPORT_SYMBOL_GPL(mbox_free_channel);
 
-- 
2.51.0


