Return-Path: <linux-renesas-soc+bounces-28276-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id gK67OAd2lGlmEAIAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-28276-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 17 Feb 2026 15:07:03 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 9371214CFCF
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 17 Feb 2026 15:07:03 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 74174301724C
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 17 Feb 2026 14:06:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 388883612C7;
	Tue, 17 Feb 2026 14:06:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="I077l4cn"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7BCBF265623
	for <linux-renesas-soc@vger.kernel.org>; Tue, 17 Feb 2026 14:06:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771337197; cv=none; b=YxkXQdwRjg9zOnHftbfJ4O6DXMO54tpPMX/978tTRIOYwXH3qzVpORJ4PkyB7C2AZkFKfkVFFdVwRXXrnwFHrKBeptR/3IpeKaPrSagogd7eeAz1M8PniQX1tqf1JRuTYkv2uBVvtji28GsIY+zNrg9iG0wT+2g3zq2cv91MZu8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771337197; c=relaxed/simple;
	bh=3s5DyvewXDbpREBqpbE6rlsvXU2+S9wRmJK1Hx0xgrM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=RyW1786+aU659DnjILsF3Ogl0PNHpVWAMIRznTVlbAxfH22g/1npQ92KW7qihDZD4auk5Finvg6jJtHSyQwXqqVlI9yryZHB7IG25lFDXTTZkvEALsvUXRQg5HhaK80egSB2TtD1x6te6OgFjmZruiRZEvworl8MBXEYZJVDBq8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=I077l4cn; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=from:to:cc:subject:date:message-id
	:mime-version:content-transfer-encoding; s=k1; bh=cz82VQHNlQ/oWV
	y6svS+KD6Kf1j1m1dEIvQuW9r3vXw=; b=I077l4cnar7aT6betj79iQ4EuiRUwN
	xFZgpsLKlqNmuoxjXO25WdGVVpAJiT0f2J6WBblE/+Q5Il8u1jECphO+LT0vZV4h
	20qkKFOqopNKun9c59MP0z3Gn1zGMXA4dJ5X+9yYOjkJkK9HiM4eC0k/HIqjfPDR
	9L1gCE32js/sFpszykx+HrD2Moqw9UqqnEaH4g9nwqWndVA11SFs9hEj04pKRKDw
	+WK4Mu+vPemqIJmTd63JxGdv4EoN6XfDglOBQ59j0UVT3dFUTRyyDWu88J1BOaSa
	o2OGa1xkZk3MCK4j/Ne95vBVLBalGaPBJzVed4CDimee5MQBe0XW8JIQ==
Received: (qmail 3707744 invoked from network); 17 Feb 2026 15:06:24 +0100
Received: by mail.zeus03.de with UTF8SMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 17 Feb 2026 15:06:24 +0100
X-UD-Smtp-Session: l3s3148p1@5tadkwVL5pgujnuy
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: linux-renesas-soc@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
	Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Jassi Brar <jassisinghbrar@gmail.com>
Subject: [PATCH] mailbox: test: really ignore optional memory resources
Date: Tue, 17 Feb 2026 15:06:15 +0100
Message-ID: <20260217140614.64581-2-wsa+renesas@sang-engineering.com>
X-Mailer: git-send-email 2.47.3
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
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[sang-engineering.com:s=k1];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-28276-lists,linux-renesas-soc=lfdr.de,renesas];
	RCVD_COUNT_THREE(0.00)[4];
	DMARC_NA(0.00)[sang-engineering.com];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[vger.kernel.org,sang-engineering.com,gmail.com];
	RCPT_COUNT_THREE(0.00)[4];
	TO_DN_SOME(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[wsa@sang-engineering.com,linux-renesas-soc@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[sang-engineering.com:+];
	PRECEDENCE_BULK(0.00)[];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sang-engineering.com:mid,sang-engineering.com:dkim,sang-engineering.com:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 9371214CFCF
X-Rspamd-Action: no action

Memory resources are optional but if the resource is empty
devm_platform_get_and_ioremap_resource() prints an error nonetheless.
Refactor the code to check the resources locally first and process them
only if they are present.

Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
---
 drivers/mailbox/mailbox-test.c | 32 +++++++++++++++++++-------------
 1 file changed, 19 insertions(+), 13 deletions(-)

diff --git a/drivers/mailbox/mailbox-test.c b/drivers/mailbox/mailbox-test.c
index 3a28ab5c42e5..98c2a2ed6dfc 100644
--- a/drivers/mailbox/mailbox-test.c
+++ b/drivers/mailbox/mailbox-test.c
@@ -367,22 +367,28 @@ static int mbox_test_probe(struct platform_device *pdev)
 		return -ENOMEM;
 
 	/* It's okay for MMIO to be NULL */
-	tdev->tx_mmio = devm_platform_get_and_ioremap_resource(pdev, 0, &res);
-	if (PTR_ERR(tdev->tx_mmio) == -EBUSY) {
-		/* if reserved area in SRAM, try just ioremap */
-		size = resource_size(res);
-		tdev->tx_mmio = devm_ioremap(&pdev->dev, res->start, size);
-	} else if (IS_ERR(tdev->tx_mmio)) {
-		tdev->tx_mmio = NULL;
+	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
+	if (res) {
+		tdev->tx_mmio = devm_ioremap_resource(&pdev->dev, res);
+		if (PTR_ERR(tdev->tx_mmio) == -EBUSY) {
+			/* if reserved area in SRAM, try just ioremap */
+			size = resource_size(res);
+			tdev->tx_mmio = devm_ioremap(&pdev->dev, res->start, size);
+		} else if (IS_ERR(tdev->tx_mmio)) {
+			tdev->tx_mmio = NULL;
+		}
 	}
 
 	/* If specified, second reg entry is Rx MMIO */
-	tdev->rx_mmio = devm_platform_get_and_ioremap_resource(pdev, 1, &res);
-	if (PTR_ERR(tdev->rx_mmio) == -EBUSY) {
-		size = resource_size(res);
-		tdev->rx_mmio = devm_ioremap(&pdev->dev, res->start, size);
-	} else if (IS_ERR(tdev->rx_mmio)) {
-		tdev->rx_mmio = tdev->tx_mmio;
+	res = platform_get_resource(pdev, IORESOURCE_MEM, 1);
+	if (res) {
+		tdev->rx_mmio = devm_ioremap_resource(&pdev->dev, res);
+		if (PTR_ERR(tdev->rx_mmio) == -EBUSY) {
+			size = resource_size(res);
+			tdev->rx_mmio = devm_ioremap(&pdev->dev, res->start, size);
+		} else if (IS_ERR(tdev->rx_mmio)) {
+			tdev->rx_mmio = tdev->tx_mmio;
+		}
 	}
 
 	tdev->tx_channel = mbox_test_request_channel(pdev, "tx");
-- 
2.47.3


