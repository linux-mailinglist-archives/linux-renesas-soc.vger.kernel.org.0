Return-Path: <linux-renesas-soc+bounces-30911-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id eAOOALbZ1GlxyAcAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-30911-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 07 Apr 2026 12:17:26 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 99CB03ACA81
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 07 Apr 2026 12:17:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id C1C163004DFD
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  7 Apr 2026 10:17:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D96D13A75A3;
	Tue,  7 Apr 2026 10:17:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="Y4wLqoo9"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 109113A75AA
	for <linux-renesas-soc@vger.kernel.org>; Tue,  7 Apr 2026 10:17:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775557043; cv=none; b=PrKeJLOaB/OAbfyqiVMfX60yEf74q7FpnDw59yAM4576bmgWjKCDWiv0OOjd3elcQ/CnzhyC90VD8bq8DU7P6GZxvf3tgtm2jlCpJJcAPyznL3W8shXiMcna8GJc81qE+h2w179BtnYTZ078o1FOzV+X87F+alN/+XYATw5caL4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775557043; c=relaxed/simple;
	bh=WzMTSA4hOrD9ewg7rAEHEJVvmQbWLf0BpIxMrdbzANQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=B/FcjBx0h4y4uEyGGavzkHiNkxO+Ejz/zuyTlPCMHL4w7Tmaz9I7an/2/4fXaxNegBp8KGmRmI4Yg7h4CJlricR9VviOvdnv4ivzmsDb6PUYkHu2YG4Q31Co5CU8k9AvacGa5sO+ExDrWHnpsgVZf6OyYGOeL+HQsz6ND6UnKwA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=Y4wLqoo9; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=from:to:cc:subject:date:message-id
	:mime-version:content-transfer-encoding; s=k1; bh=OGq+odBcPRpZvx
	ss1wi9faG05mqpWlKOElOyjMSQX6U=; b=Y4wLqoo90qoPyqK4le3/AMXzO9ykbt
	jvAeDwN2AIQ0gXl3cIezGHUBWkrilbb4iSwnjFngehnIycyGSP3Mki5Yeze4ZB50
	Nt5pBTY2THD7Q7eRk3jM8QFX6IrgdsXSaW/ElOIuPDFFAqmm37ewBVoeOFIqC90T
	4pCLpraVNbn+AULLr8nh+T7kB9ffGuUje/Z6/WDGWbwL/6AXFVE6Vb1Fu6famUTA
	0VdQmk9UARtgbo3gg2f8gcpFDdsWlrNF25KXeS1YG+JI2aliQEe/3U/WfpvS9oa3
	/gdNVjlSVWNF/tTPJM80uU4wnaKdnKP4FBad4kFCAsAPU8ZHdrKB5VXg==
Received: (qmail 4189844 invoked from network); 7 Apr 2026 12:17:17 +0200
Received: by mail.zeus03.de with UTF8SMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 7 Apr 2026 12:17:17 +0200
X-UD-Smtp-Session: l3s3148p1@pmh0FtxOhroujns2
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: linux-renesas-soc@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
	Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Jassi Brar <jassisinghbrar@gmail.com>,
	Mark Brown <broonie@linaro.org>
Subject: [RFC PATCH] mailbox: don't free the channel if the startup callback failed
Date: Tue,  7 Apr 2026 12:13:11 +0200
Message-ID: <20260407101714.39990-2-wsa+renesas@sang-engineering.com>
X-Mailer: git-send-email 2.47.3
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
	TAGGED_FROM(0.00)[bounces-30911-lists,linux-renesas-soc=lfdr.de,renesas];
	DMARC_NA(0.00)[sang-engineering.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[vger.kernel.org,sang-engineering.com,gmail.com,linaro.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[wsa@sang-engineering.com,linux-renesas-soc@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[sang-engineering.com:+];
	NEURAL_HAM(-0.00)[-0.997];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,sashiko.dev:url,sang-engineering.com:dkim,sang-engineering.com:email,sang-engineering.com:mid]
X-Rspamd-Queue-Id: 99CB03ACA81
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

If the optional startup callbacks fails, we need to clear some states.
Currently, this is done by freeing the channel. This does, however, much
more than needed which creates problems.

One thing is calling the shutdown callback. This is totally not
intuitive. No user expects that shutdown() is called when startup()
fails. E.g. quite some mailbox users register the IRQ in startup() and
free them in shutdown(). These drivers will get a WARN about freeing an
already free IRQ.

A second thing is that module_put is called. This should also not be
done when startup() fails. It breaks the expected symmetry that
request_channel() gets the module and only free_channel() puts it again.

To solve these problems, do only the required cleanups manually when
startup() fails and do not use free_channel() as a helper.

Link: https://sashiko.dev/#/patchset/20260402112709.13002-1-wsa%2Brenesas%40sang-engineering.com # second issue
Fixes: 2b6d83e2b8b7 ("mailbox: Introduce framework for mailbox")
Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
---

This patch is RFC because I am still somewhat new to the mailbox
subsystem and might miss something. However, I think the Sashiko comment
in the above Link-tag is correct. I could reproduce the WARN with the
Renesas MFIS driver and injecting an error when obtaining the irq.
Looking at other drivers, I see this problem as well.

 drivers/mailbox/mailbox.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/drivers/mailbox/mailbox.c b/drivers/mailbox/mailbox.c
index a7a690acd90d..dcde4efa5be8 100644
--- a/drivers/mailbox/mailbox.c
+++ b/drivers/mailbox/mailbox.c
@@ -353,7 +353,11 @@ static int __mbox_bind_client(struct mbox_chan *chan, struct mbox_client *cl)
 
 		if (ret) {
 			dev_err(dev, "Unable to startup the chan (%d)\n", ret);
-			mbox_free_channel(chan);
+			scoped_guard(spinlock_irqsave, &chan->lock) {
+				chan->cl = NULL;
+				if (chan->txdone_method == TXDONE_BY_ACK)
+					chan->txdone_method = TXDONE_BY_POLL;
+			}
 			return ret;
 		}
 	}
-- 
2.47.3


