Return-Path: <linux-renesas-soc+bounces-31324-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 2CfAEnPM4GkdmAAAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-31324-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 16 Apr 2026 13:48:03 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 1EE0340DA38
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 16 Apr 2026 13:48:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 1A38D302A352
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 16 Apr 2026 11:48:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EFCAA3845BD;
	Thu, 16 Apr 2026 11:47:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="lSgLP+zP"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 713161A01BE
	for <linux-renesas-soc@vger.kernel.org>; Thu, 16 Apr 2026 11:47:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776340077; cv=none; b=Ysd+IxJa7NI3llj2Fzj1dLhl0AIVAOt28hNRLsnqebGprr0xLwMiAcKGTPUGJ2EC+kaw8TSOZcWpVTlNBU/I+PZVdN6i7Dj7cC2eBWRJzFab9wwAJ/320ilq0oscgdaB/fYg014xaIHkUDN4zQ+dLyTwsQn2PM/OrlEn6QJOIbQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776340077; c=relaxed/simple;
	bh=IT+NlCmHLVTE6Bn99Sj8/QWHf+HwmtyMVzZ5DtwaRec=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=PdodmBSOA/na1OfZ0vOFtPgFvggau1vU8/ByDGnxYJTJcxuMC57fKbaRjCxhmNQj16WEywAdU6k67/ZNC2nzXZ3QwBm63GDVtgdU8ek0dyeZXQc3aqJw6agKgybsMypearIGjyItW75+xmGcUivZ7zVLSoBw8/VUoAsjVCEEN3M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=lSgLP+zP; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=from:to:cc:subject:date:message-id
	:in-reply-to:references:mime-version:content-transfer-encoding;
	 s=k1; bh=SZCi506zO5K3gJw2C+jH3iA+bc33710B+OJBYI7JFh4=; b=lSgLP+
	zPgW5ozqDjDIkVoGDAZvqkaXfmIbbohvJird26pkQ4sKn+2P6fgeXG/A2PDWCuI3
	+M4YB2ovMiYuNvOGzs41/ACyh2TGFduG0vIk/WifBEY1x9Qwgkvt4tgajMuGEq4q
	YCYJckGrSnWIzZb+yP3TAZIsDgBcQ/F7P0CO8wROTK1L83MpVkdLE3VkC2HFYrOf
	Mn8tkeqciUZK4R9sS9Qva6pYRKVzPEx5kExVDPYWPgJE/nnFAt8K40lDCcT4/f6h
	uC65H5/C2Gw9tmJCRsf010uG9EZqE+rOLc4fS4vhvsMyB34yu8SdAV+baXCdUjfI
	WqNQzWSvpIjOB0YQ==
Received: (qmail 3513090 invoked from network); 16 Apr 2026 13:47:46 +0200
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 16 Apr 2026 13:47:46 +0200
X-UD-Smtp-Session: l3s3148p1@23mkZpJPMoEujnvW
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: linux-renesas-soc@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
	Lee Jones <lee@kernel.org>,
	Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Jassi Brar <jassisinghbrar@gmail.com>,
	Minjie Du <duminjie@vivo.com>
Subject: [PATCH 1/3] mailbox: mailbox-test: handle channel errors consistently
Date: Thu, 16 Apr 2026 13:47:34 +0200
Message-ID: <20260416114737.36988-2-wsa+renesas@sang-engineering.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260416114737.36988-1-wsa+renesas@sang-engineering.com>
References: <20260416114737.36988-1-wsa+renesas@sang-engineering.com>
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
	TAGGED_FROM(0.00)[bounces-31324-lists,linux-renesas-soc=lfdr.de,renesas];
	DMARC_NA(0.00)[sang-engineering.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[vger.kernel.org,kernel.org,sang-engineering.com,gmail.com,vivo.com];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[wsa@sang-engineering.com,linux-renesas-soc@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[sang-engineering.com:+];
	NEURAL_HAM(-0.00)[-0.977];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas];
	MID_RHS_MATCH_FROM(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sang-engineering.com:email,sang-engineering.com:dkim,sang-engineering.com:mid,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 1EE0340DA38
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

mbox_test_request_channel() returns either an ERR_PTR or NULL. The
callers, however, mostly checked for non-NULL which allows for bogus
code paths when an ERR_PTR is treated like a valid channel. A later
commit tried to fix it in one place but missed the other ones. Because
the ERR_PTR is only used for -ENOMEM once and is converted to
-EPROBE_DEFER anyhow, convert the callee to only return NULL which
simplifies handling a lot and makes it less error prone.

Fixes: 8ea4484d0c2b ("mailbox: Add generic mechanism for testing Mailbox Controllers")
Fixes: 9b63a810c6f9 ("mailbox: mailbox-test: Fix an error check in mbox_test_probe()")
Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
---
 drivers/mailbox/mailbox-test.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/mailbox/mailbox-test.c b/drivers/mailbox/mailbox-test.c
index 5e68f708205c..daf4b6f27d11 100644
--- a/drivers/mailbox/mailbox-test.c
+++ b/drivers/mailbox/mailbox-test.c
@@ -336,7 +336,7 @@ mbox_test_request_channel(struct platform_device *pdev, const char *name)
 
 	client = devm_kzalloc(&pdev->dev, sizeof(*client), GFP_KERNEL);
 	if (!client)
-		return ERR_PTR(-ENOMEM);
+		return NULL;
 
 	client->dev		= &pdev->dev;
 	client->rx_callback	= mbox_test_receive_message;
@@ -393,7 +393,7 @@ static int mbox_test_probe(struct platform_device *pdev)
 	tdev->tx_channel = mbox_test_request_channel(pdev, "tx");
 	tdev->rx_channel = mbox_test_request_channel(pdev, "rx");
 
-	if (IS_ERR_OR_NULL(tdev->tx_channel) && IS_ERR_OR_NULL(tdev->rx_channel))
+	if (!tdev->tx_channel && !tdev->rx_channel)
 		return -EPROBE_DEFER;
 
 	/* If Rx is not specified but has Rx MMIO, then Rx = Tx */
-- 
2.51.0


