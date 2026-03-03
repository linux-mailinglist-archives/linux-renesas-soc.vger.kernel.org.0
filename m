Return-Path: <linux-renesas-soc+bounces-28736-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id UBz1AlxSp2lsgwAAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-28736-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 03 Mar 2026 22:27:56 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C4961F7815
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 03 Mar 2026 22:27:55 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 7398D301A17F
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  3 Mar 2026 21:27:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B4B5D3AEF56;
	Tue,  3 Mar 2026 21:27:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="MFGadkgl"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E4B4D37267F
	for <linux-renesas-soc@vger.kernel.org>; Tue,  3 Mar 2026 21:27:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772573272; cv=none; b=HhAS5S+GoqPewNgW+NqUHyrVB+Phm4O7pUTj8S61AmJTmSCiArC9O4qPDYrCvoLHJ7vzl8WyK+a10gpZxZjSHExRrnrq5vc6G0krcP4vRHzecY2rKR5szlf76oELNjkDHaCE6iFovhjQJLxTHfbn3S4OQCe34BSR/iiLZ1lFP+I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772573272; c=relaxed/simple;
	bh=GtU9Dfh4VIRfVSHyhKz1FIFkVCMh0Bo6tOPnZFmo4ZI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=sOONFh7AbqF7XhmvJRTPw/cB+MZuatAB1PyGxmTsGRcteyRSi98DNtJhvzqzmBcUAW815QK8WFA/KrnsbQQk/GfYurSNZlSCoNyKnyomUFpGpOxcm5MuiylgZy0SeyklckS/hHIrVATHDGIWi74RF7jC598IvdIgkL4aG16ZpsM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=MFGadkgl; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=from:to:cc:subject:date:message-id
	:mime-version:content-transfer-encoding; s=k1; bh=SgSYSnoh1roEFX
	kDlKBYZ59+a9y24wPKXaec0bimGfI=; b=MFGadkglpzkC3Ajo16GDSzygJ2/hTo
	CTPUM5BLGWsIE7gAhW/E76c/wm9/3mvqdJr3CKjO/z5nQJ4sfvqA2U95Mt+AW5EH
	iurSizNH7fGd4/5KWAeBDZ4CUJWwYNFjaFic15U/04H9UFRiAK3UJpEn5IHEc5v7
	QFru7h7R2yYpo7rkY8/UgKjn3VWG/FSPVzhQ4WIxaUjrxe7uFEZof91IhLcbkixt
	ASBYf3IcAYO7eVDeMJRUkP3bE1xXPxRHbDOGYudtg5FKRrLTKwnE6olr2KvPaGdF
	HaIfWBb4U7N+AxBnJHmgjDacCkJN7JdqF8DPF6vODZ347omoyQhZKxEA==
Received: (qmail 461369 invoked from network); 3 Mar 2026 22:27:49 +0100
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 3 Mar 2026 22:27:49 +0100
X-UD-Smtp-Session: l3s3148p1@G4gGYCVM+Koujnu+
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: linux-renesas-soc@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
	Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Jassi Brar <jassisinghbrar@gmail.com>
Subject: [PATCH v3] mailbox: test: really ignore optional memory resources
Date: Tue,  3 Mar 2026 22:27:39 +0100
Message-ID: <20260303212738.12769-2-wsa+renesas@sang-engineering.com>
X-Mailer: git-send-email 2.51.0
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: 7C4961F7815
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[sang-engineering.com:s=k1];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-28736-lists,linux-renesas-soc=lfdr.de,renesas];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	DMARC_NA(0.00)[sang-engineering.com];
	FREEMAIL_CC(0.00)[vger.kernel.org,sang-engineering.com,gmail.com];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[sang-engineering.com:+];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[wsa@sang-engineering.com,linux-renesas-soc@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_THREE(0.00)[4];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo]
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
 drivers/mailbox/mailbox-test.c | 37 +++++++++++++++++++---------------
 1 file changed, 21 insertions(+), 16 deletions(-)

diff --git a/drivers/mailbox/mailbox-test.c b/drivers/mailbox/mailbox-test.c
index cfd5429df17e..df53d918d9fa 100644
--- a/drivers/mailbox/mailbox-test.c
+++ b/drivers/mailbox/mailbox-test.c
@@ -356,11 +356,27 @@ mbox_test_request_channel(struct platform_device *pdev, const char *name)
 	return channel;
 }
 
+static void *mbox_test_ioremap(struct platform_device *pdev, unsigned int res_num)
+{
+	struct resource *res;
+	void *mmio;
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
@@ -368,23 +384,12 @@ static int mbox_test_probe(struct platform_device *pdev)
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


