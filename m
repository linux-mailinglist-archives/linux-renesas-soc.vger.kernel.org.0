Return-Path: <linux-renesas-soc+bounces-31136-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id ME4sGVz02GlJkAgAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-31136-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 10 Apr 2026 15:00:12 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id BA0803D7CE6
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 10 Apr 2026 15:00:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 79207300575E
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 10 Apr 2026 12:56:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9ABC639020C;
	Fri, 10 Apr 2026 12:56:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="F8M3zEmj"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B30111FA272
	for <linux-renesas-soc@vger.kernel.org>; Fri, 10 Apr 2026 12:56:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775825771; cv=none; b=WiKXbQTyvdsU/IquUI6tytiHVMaOMy7NtLfwGjdui4LnVTRa605p3srxfMnxQOtWeJe5wCBndnDd0uys8hfWmPHDNN+cGdwtZHOdBeDgKgAcfzHQ+FozXzH/DlsC6EiIIJE+L13HFuiYVJ41BCaxVEzBmTApiaJJL5qUyPj/j9U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775825771; c=relaxed/simple;
	bh=ASvA0MzLAf4giWBeySo3pYdmoKnzekjPbanJa7BiOrM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=CeLPYPskxVo0oFofMvZeTeWF5cvbkpwVPiaFMku1yJBRG3HC7/ZfOlnNggDqk+244Z36ywEyN29em67GVBfKLngwxi1c/zAG8gf+h/ozCXX4j3+2wPnN+wG8SY0cfcmq4n5ZsFzAHY98vnsFTCMdVgh0eKKgJK1p5+N0771q8NU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=F8M3zEmj; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=from:to:cc:subject:date:message-id
	:mime-version:content-transfer-encoding; s=k1; bh=MhQPhKSrSAqyGb
	GjM+7BiW7ihhrBkowUXtRl0rdMaSg=; b=F8M3zEmjDJ8kB/sTpK7jZAps0vYycj
	b9yTLi6JYIa0u2k83GC4NenBpxCMIsHVzf67Y3wlZ7Yq+3ZuKagGN3pNo+UGSwJb
	TOlGycnb8UaXdpwf2PEz7h2q5LWRxYRx+mg/0TXMh32C7ig1dLapJvOmCkPlAe0J
	0E9NlbSpLbde57Keh1M/xUvUVN3EJsOGHNGFWsOkKlEz5hlucnef6UyR1dkzou5+
	17Wc/y7IPg3SF1f96wEF0TAeR4EiHlb0fgnFM5ahze/WDzGUh76KC9zKtQjbuo59
	dDZHeXX9uJZyyCUPxkQM8N8ZihyAgmrYscnJzlgF5Z9+XdQiLwDlYivA==
Received: (qmail 1251265 invoked from network); 10 Apr 2026 14:56:04 +0200
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 10 Apr 2026 14:56:04 +0200
X-UD-Smtp-Session: l3s3148p1@m9PbpxpPl5VUszZ9
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: linux-renesas-soc@vger.kernel.org,
	Jassi Brar <jassisinghbrar@gmail.com>
Cc: linux-kernel@vger.kernel.org,
	Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Lee Jones <lee@kernel.org>
Subject: [PATCH] mailbox: mailbox-test: free channels on probe error
Date: Fri, 10 Apr 2026 14:53:00 +0200
Message-ID: <20260410125556.39607-2-wsa+renesas@sang-engineering.com>
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
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[sang-engineering.com:s=k1];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TO_DN_SOME(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	DMARC_NA(0.00)[sang-engineering.com];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-31136-lists,linux-renesas-soc=lfdr.de,renesas];
	FREEMAIL_TO(0.00)[vger.kernel.org,gmail.com];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[sashiko.dev:url,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,sang-engineering.com:dkim,sang-engineering.com:email,sang-engineering.com:mid]
X-Rspamd-Queue-Id: BA0803D7CE6
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On probe error, free the previously obtained channels. This not only
prevents a leak, but also UAF scenarios because the client structure
will be removed nonetheless because it was allocated with devm.

Link: https://sashiko.dev/#/patchset/20260327151217.5327-2-wsa%2Brenesas%40sang-engineering.com
Fixes: 8ea4484d0c2b ("mailbox: Add generic mechanism for testing Mailbox Controllers")
Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
---

This fixes an issue spotted by Sashiko while reviewing a previous patch.
I confirmed the UAF by hacking some error injection to the drivers.

 drivers/mailbox/mailbox-test.c | 15 ++++++++++++---
 1 file changed, 12 insertions(+), 3 deletions(-)

diff --git a/drivers/mailbox/mailbox-test.c b/drivers/mailbox/mailbox-test.c
index 058c0fe4b9c2..e7cae11780c3 100644
--- a/drivers/mailbox/mailbox-test.c
+++ b/drivers/mailbox/mailbox-test.c
@@ -409,18 +409,27 @@ static int mbox_test_probe(struct platform_device *pdev)
 	if (tdev->rx_channel) {
 		tdev->rx_buffer = devm_kzalloc(&pdev->dev,
 					       MBOX_MAX_MSG_LEN, GFP_KERNEL);
-		if (!tdev->rx_buffer)
-			return -ENOMEM;
+		if (!tdev->rx_buffer) {
+			ret = -ENOMEM;
+			goto err_unreg_chan;
+		}
 	}
 
 	ret = mbox_test_add_debugfs(pdev, tdev);
 	if (ret)
-		return ret;
+		goto err_unreg_chan;
 
 	init_waitqueue_head(&tdev->waitq);
 	dev_info(&pdev->dev, "Successfully registered\n");
 
 	return 0;
+
+ err_unreg_chan:
+	if (tdev->tx_channel)
+		mbox_free_channel(tdev->tx_channel);
+	if (tdev->rx_channel)
+		mbox_free_channel(tdev->rx_channel);
+	return ret;
 }
 
 static void mbox_test_remove(struct platform_device *pdev)
-- 
2.51.0


