Return-Path: <linux-renesas-soc+bounces-29045-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id AMLXOLx5rmm2FAIAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-29045-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 09 Mar 2026 08:41:48 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D06D234E77
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 09 Mar 2026 08:41:48 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id A917D304C954
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  9 Mar 2026 07:39:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8A112366DD9;
	Mon,  9 Mar 2026 07:39:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="SDJmmdfV"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 115F5366DB7
	for <linux-renesas-soc@vger.kernel.org>; Mon,  9 Mar 2026 07:39:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773041945; cv=none; b=MXp7GJt1zAl4w0RUzwRzqEeg4pYuQGqokSUJIdwymCqfqOx0DQKBja+BhPyEA3BxDNNgpS9BY4YscNVBgdRWM1E3JyL495CqSnuMycOOKSYRYn7fQ4eLiPrZh14DIdONqdeeMb2Osj03u1k3M43qdYxbhiKxdt9jgWCUf+qvmSU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773041945; c=relaxed/simple;
	bh=yE3skMqFifN6pJ2zJQHVtLkHWCWQ0rUYIC2lLJHFEYs=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=QC4a24cROyr+7q53FC1tftzed5gSM5aOFNwy3iAaeiR6cQse8HXcgRcIfAr81ElrOD7cRW7Qlfq7g9gBbRhAXhkeag9CyAMRAE5JgY94bt39Ykim6ksfK2rnBfXzo/fOhRYY5hd8AgEBWs+BMggl0l+dz0tqu4zVy57VKP+af54=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=SDJmmdfV; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=from:to:cc:subject:date:message-id
	:mime-version:content-transfer-encoding; s=k1; bh=8Q8AJiAfw57l3F
	wfFbMcdm+a74vtF4BX1pgikU9ldik=; b=SDJmmdfVSlGFnzPHR5MBd8JE5qh6xM
	BIKsgvInTIqD31Unixn27VNcSJj3ymsyGwxNQDGdJnHmoy12lzWfOM+zhhXt1VT+
	0S9oIUxlT6bbpFX45Vaf2O53At4nuovQiRJNK97IxcEHkql9F4c4WXRDHr8FL+5h
	hCealkIqazEKnNEddJ12xKnQhdx3InyIi6qirY8SOmb2yFEMxmTvp1mftvjzxr2Q
	UHTvQaQCc/Zi3yGZh2J6Hal9AJuHEVx/zp9UYxtvPTbFfTgWJGpIsIkA6gZK8tc0
	L3z5qxxl1X7fAcNtaceGp0InA+aLcGmrELOlMGiIX9YALFkT35cUByiQ==
Received: (qmail 2668293 invoked from network); 9 Mar 2026 08:39:01 +0100
Received: by mail.zeus03.de with UTF8SMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 9 Mar 2026 08:39:01 +0100
X-UD-Smtp-Session: l3s3148p1@CaIQf5JMhp4ujnvm
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: linux-renesas-soc@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
	Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Jassi Brar <jassisinghbrar@gmail.com>
Subject: [PATCH v4] mailbox: test: really ignore optional memory resources
Date: Mon,  9 Mar 2026 08:37:50 +0100
Message-ID: <20260309073856.2209-2-wsa+renesas@sang-engineering.com>
X-Mailer: git-send-email 2.47.3
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: 5D06D234E77
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[sang-engineering.com:s=k1];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-29045-lists,linux-renesas-soc=lfdr.de,renesas];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	DMARC_NA(0.00)[sang-engineering.com];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[vger.kernel.org,sang-engineering.com,gmail.com];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCPT_COUNT_THREE(0.00)[4];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[wsa@sang-engineering.com,linux-renesas-soc@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[sang-engineering.com:+];
	NEURAL_HAM(-0.00)[-0.995];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas];
	MID_RHS_MATCH_FROM(0.00)[];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sang-engineering.com:dkim,sang-engineering.com:email,sang-engineering.com:mid,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo]
X-Rspamd-Action: no action

Memory resources are optional but if the resource is empty
devm_platform_get_and_ioremap_resource() prints an error nonetheless.
Refactor the code to check the resources locally first and process them
only if they are present. The -EBUSY error message of ioremap_resource()
is still kept because it is correct. The comment which explains that a
plain ioremap() is tried as a workaround is turned into a info message.
So, a user will be informed about it, too.

Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
---

Changes since v3:
* fixed __iomem annotations (Thanks, sparse + buildbots)
* rebased to 7.0-rc2

 drivers/mailbox/mailbox-test.c | 37 +++++++++++++++++++---------------
 1 file changed, 21 insertions(+), 16 deletions(-)

diff --git a/drivers/mailbox/mailbox-test.c b/drivers/mailbox/mailbox-test.c
index 3a28ab5c42e5..058c0fe4b9c2 100644
--- a/drivers/mailbox/mailbox-test.c
+++ b/drivers/mailbox/mailbox-test.c
@@ -355,11 +355,27 @@ mbox_test_request_channel(struct platform_device *pdev, const char *name)
 	return channel;
 }
 
+static void __iomem *mbox_test_ioremap(struct platform_device *pdev, unsigned int res_num)
+{
+	struct resource *res;
+	void __iomem *mmio;
+
+	res = platform_get_resource(pdev, IORESOURCE_MEM, res_num);
+	if (!res)
+		return NULL;
+
+	mmio = devm_ioremap_resource(&pdev->dev, res);
+	if (PTR_ERR(mmio) == -EBUSY) {
+		dev_info(&pdev->dev, "trying workaround with plain ioremap\n");
+		return devm_ioremap(&pdev->dev, res->start, resource_size(res));
+	}
+
+	return IS_ERR(mmio) ? NULL : mmio;
+}
+
 static int mbox_test_probe(struct platform_device *pdev)
 {
 	struct mbox_test_device *tdev;
-	struct resource *res;
-	resource_size_t size;
 	int ret;
 
 	tdev = devm_kzalloc(&pdev->dev, sizeof(*tdev), GFP_KERNEL);
@@ -367,23 +383,12 @@ static int mbox_test_probe(struct platform_device *pdev)
 		return -ENOMEM;
 
 	/* It's okay for MMIO to be NULL */
-	tdev->tx_mmio = devm_platform_get_and_ioremap_resource(pdev, 0, &res);
-	if (PTR_ERR(tdev->tx_mmio) == -EBUSY) {
-		/* if reserved area in SRAM, try just ioremap */
-		size = resource_size(res);
-		tdev->tx_mmio = devm_ioremap(&pdev->dev, res->start, size);
-	} else if (IS_ERR(tdev->tx_mmio)) {
-		tdev->tx_mmio = NULL;
-	}
+	tdev->tx_mmio = mbox_test_ioremap(pdev, 0);
 
 	/* If specified, second reg entry is Rx MMIO */
-	tdev->rx_mmio = devm_platform_get_and_ioremap_resource(pdev, 1, &res);
-	if (PTR_ERR(tdev->rx_mmio) == -EBUSY) {
-		size = resource_size(res);
-		tdev->rx_mmio = devm_ioremap(&pdev->dev, res->start, size);
-	} else if (IS_ERR(tdev->rx_mmio)) {
+	tdev->rx_mmio = mbox_test_ioremap(pdev, 1);
+	if (!tdev->rx_mmio)
 		tdev->rx_mmio = tdev->tx_mmio;
-	}
 
 	tdev->tx_channel = mbox_test_request_channel(pdev, "tx");
 	tdev->rx_channel = mbox_test_request_channel(pdev, "rx");
-- 
2.47.3


