Return-Path: <linux-renesas-soc+bounces-28391-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id EJAgF21InGmODAQAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-28391-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 23 Feb 2026 13:30:37 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id E8BB91761C3
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 23 Feb 2026 13:30:36 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 56D6D302B4EB
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 23 Feb 2026 12:30:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1E3C61DFF0;
	Mon, 23 Feb 2026 12:30:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="g05gBGUQ"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 26D823EBF38
	for <linux-renesas-soc@vger.kernel.org>; Mon, 23 Feb 2026 12:30:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771849834; cv=none; b=DedRF5/sU2AYI3gr7t8ena7mDiPEKidoPOk7mC31l8mYcB+slyaWc74nE10ebkrfUS7UjBYigHBomXf/15aU86nrRz6VnsATpZj6NV2S67SvLM8K5vavTgaXv0Mn7Er13Oe1I7JwwScD//0WybIYLTkxyW2xlvRtXcFZYjSOTPQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771849834; c=relaxed/simple;
	bh=923c3NqET0vxWLpiprjGMj8pd9vcKQT6DVGRruyY0g8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=DLzD+f/ukkCV4ohC6EPCfv+maqVbsj8D+XqbJXtfmbROnyFoSSJCxUjLRjYNrZWD4xw4DnTnLwGtgewK2HKGRmWJRuQJnOCKeZU6QF7buRN0RUfsW1MfvohMS+eyC9uLLbfKddfGRiy4KCFJjM2AtublhyxCNqR2vzEoY3Q4VkI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=g05gBGUQ; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=from:to:cc:subject:date:message-id
	:mime-version:content-transfer-encoding; s=k1; bh=2vQfjcTzhHNIl6
	+bGGQ3YxN3ez/JoP7MMD8Hva79Q2w=; b=g05gBGUQu5e6q97sB5RX3QUNYy5Qrn
	Tdxc6FdGFrf/a5+EyYsRfMhx3LelXPqe+hsVNQmbE4YYYKA8ro0MQhqC4Ow4kQrm
	YiAhgT1HGiRSO64ODrN3fQfg0RKvy6qO4okO/DvRIl7OaJeN+TKtyra9tW3wBamL
	r6iuVxE8GS3c96yTztjglzAjVFYzGm2bSeLFQwZrUWkQiJvEVCUzx/zuWwrd96Na
	xUJ4AKBymezIT8AcFCKUCNKOzCFT/Q4GERjrtTFMsFRrPIqQksAAziQJagJsQyhz
	yoXbyQpEpDpS5PaqSymz2QrOdSgI7W6077dGfr5miA+6e0uI32AiG7LA==
Received: (qmail 2306731 invoked from network); 23 Feb 2026 13:30:30 +0100
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 23 Feb 2026 13:30:30 +0100
X-UD-Smtp-Session: l3s3148p1@ztK273xLqL0gAwDPXzF+ANZpdrMKUeLI
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: linux-renesas-soc@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
	Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Jassi Brar <jassisinghbrar@gmail.com>
Subject: [PATCH v2] mailbox: test: really ignore optional memory resources
Date: Mon, 23 Feb 2026 13:27:31 +0100
Message-ID: <20260223123022.7657-2-wsa+renesas@sang-engineering.com>
X-Mailer: git-send-email 2.51.0
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[sang-engineering.com:s=k1];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-28391-lists,linux-renesas-soc=lfdr.de,renesas];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	DMARC_NA(0.00)[sang-engineering.com];
	FREEMAIL_CC(0.00)[vger.kernel.org,sang-engineering.com,gmail.com];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[sang-engineering.com:+];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[wsa@sang-engineering.com,linux-renesas-soc@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_THREE(0.00)[4];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sang-engineering.com:mid,sang-engineering.com:dkim,sang-engineering.com:email,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: E8BB91761C3
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

Change since v1:
* don't fail if second region is empty but use the first region instead
* refactor into separate function for consistent handling of both
  regions and to make the logic in probe() more obvious

 drivers/mailbox/mailbox-test.c | 40 ++++++++++++++++++++--------------
 1 file changed, 24 insertions(+), 16 deletions(-)

diff --git a/drivers/mailbox/mailbox-test.c b/drivers/mailbox/mailbox-test.c
index 3a28ab5c42e5..309610ba43a1 100644
--- a/drivers/mailbox/mailbox-test.c
+++ b/drivers/mailbox/mailbox-test.c
@@ -355,11 +355,30 @@ mbox_test_request_channel(struct platform_device *pdev, const char *name)
 	return channel;
 }
 
-static int mbox_test_probe(struct platform_device *pdev)
+static void *mbox_test_ioremap(struct platform_device *pdev, unsigned int res_num)
 {
-	struct mbox_test_device *tdev;
 	struct resource *res;
 	resource_size_t size;
+	void *mmio = NULL;
+
+	res = platform_get_resource(pdev, IORESOURCE_MEM, res_num);
+	if (res) {
+		mmio = devm_ioremap_resource(&pdev->dev, res);
+		if (PTR_ERR(mmio) == -EBUSY) {
+			dev_info(&pdev->dev, "trying workaround with plain ioremap\n");
+			size = resource_size(res);
+			mmio = devm_ioremap(&pdev->dev, res->start, size);
+		} else if (IS_ERR(mmio)) {
+			mmio = NULL;
+		}
+	}
+
+	return mmio;
+}
+
+static int mbox_test_probe(struct platform_device *pdev)
+{
+	struct mbox_test_device *tdev;
 	int ret;
 
 	tdev = devm_kzalloc(&pdev->dev, sizeof(*tdev), GFP_KERNEL);
@@ -367,23 +386,12 @@ static int mbox_test_probe(struct platform_device *pdev)
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
2.51.0


