Return-Path: <linux-renesas-soc+bounces-31350-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id SNkXHHnl4WmKzgAAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-31350-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 17 Apr 2026 09:47:05 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 773CD41822A
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 17 Apr 2026 09:47:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 675223047FCA
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 17 Apr 2026 07:42:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ED24137AA78;
	Fri, 17 Apr 2026 07:42:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="FhGZsAw8"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 839D437A4AF
	for <linux-renesas-soc@vger.kernel.org>; Fri, 17 Apr 2026 07:42:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776411766; cv=none; b=VCW3AmOzBjAPnmrsApNycg0pmGfU+3uhYUrPqdgz5KdbLGMFn491seeZUWNewJocmXN0T36K8P8/KayKToVgWLVYCZCkXHtaoQX4ZBTiNxJekkamRK4cfxjgVySET/n8zndlzAC+K/TW9X8eAQKCcw57IMkv7+z4rVDj7BUVrwg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776411766; c=relaxed/simple;
	bh=+vgEkieG5Z9Qf+OlzIt61SgEsO/ihWEqCLPih5uvYOk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=uV2BWpcPU8CAr+PG9Wwhg+Ay2+a6or2ywCXq3C4XBVBdz46z/WLXvlwpuuGzNUiuSWKWuigd6vVLPvo4KDizCY/MlMMEq27kuhWmLyd4u9vDJsYCvfgGVDBJeWIWPoeVj+veguCWtCLVL/BjucAMOtbIdKjiiQxI8MVHjCnzGls=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=FhGZsAw8; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=from:to:cc:subject:date:message-id
	:in-reply-to:references:mime-version:content-transfer-encoding;
	 s=k1; bh=23AIyKmewb4aRL/ytqe4GU7fSGbIP3y9jZWV3lvCF1o=; b=FhGZsA
	w8RADcwFHnzFmn2ZA5wZZkwI47UtlkP4L6rfwUS2hD38nULyaCVIm3L6vhQ6EW38
	b+GZKjnvEB5v/HhDqMgcEflrOgrk7CegJgxdb/WvTCwUVOaPGk8FBn9QvXLtamlY
	3VG/4Rrxon106cpSmkGryeIAWrlfReocEDleoLm4HdllhSjW7Ayb4JYbY3aeCT9M
	W1IgPrMXUMCp8GRjRbEn0TCgcVLFaDkvY7Liz7MokZ8wUrupaaQI3EtYGiywDOfc
	B6fz1q+yDWYi2v6mB1sASR3jI5HjGrBk10/Cp7k4NTUkduqS7ocxdGdk+fokglYG
	6n08ZPDnwmV3tthQ==
Received: (qmail 3855937 invoked from network); 17 Apr 2026 09:42:40 +0200
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 17 Apr 2026 09:42:40 +0200
X-UD-Smtp-Session: l3s3148p1@fcrzF6NPD1NtKXL4
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: linux-renesas-soc@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
	Sudeep Holla <sudeep.holla@kernel.org>,
	Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Jassi Brar <jassisinghbrar@gmail.com>,
	Lee Jones <lee@kernel.org>,
	Minjie Du <duminjie@vivo.com>
Subject: [PATCH v2 1/4] mailbox: mailbox-test: handle channel errors consistently
Date: Fri, 17 Apr 2026 09:42:33 +0200
Message-ID: <20260417074237.16053-2-wsa+renesas@sang-engineering.com>
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
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	R_DKIM_ALLOW(-0.20)[sang-engineering.com:s=k1];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-31350-lists,linux-renesas-soc=lfdr.de,renesas];
	PRECEDENCE_BULK(0.00)[];
	DMARC_NA(0.00)[sang-engineering.com];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[vger.kernel.org,kernel.org,sang-engineering.com,glider.be,gmail.com,vivo.com];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[wsa@sang-engineering.com,linux-renesas-soc@vger.kernel.org];
	RCPT_COUNT_SEVEN(0.00)[8];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	DKIM_TRACE(0.00)[sang-engineering.com:+];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sang-engineering.com:email,sang-engineering.com:dkim,sang-engineering.com:mid,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 773CD41822A
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
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
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


