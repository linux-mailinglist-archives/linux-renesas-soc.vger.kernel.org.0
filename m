Return-Path: <linux-renesas-soc+bounces-28216-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id kKGmNutOkmlvswEAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-28216-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Sun, 15 Feb 2026 23:55:39 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 893FA13FF96
	for <lists+linux-renesas-soc@lfdr.de>; Sun, 15 Feb 2026 23:55:39 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id DD0DC3037D6E
	for <lists+linux-renesas-soc@lfdr.de>; Sun, 15 Feb 2026 22:55:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 89C5E30BF69;
	Sun, 15 Feb 2026 22:55:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="jrpVXEP2"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E7A3E309EF2
	for <linux-renesas-soc@vger.kernel.org>; Sun, 15 Feb 2026 22:55:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771196122; cv=none; b=XCgbxRTfUSIDYNY3r8p/9PgMZ6MkA3WLFFQR0hgQl3ioBn6xjcw9h2j0ydCA1I0J9HpsToo7rWW4Rxb9z+KtQ1juL9JyCw+J68wh39odKMyKj5/9YhUXKl/5zg7X58dBwPl3DVQ+OB7FuDlw2AuqVBzBWjj6nfj+L/rL41rqM9M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771196122; c=relaxed/simple;
	bh=ddU4wbNylHvxROfmh7fidExmdePi/u1yhM+HBZZ+Yrc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=H6l4RwPYJr8B8JQkoQJxYIjedO8GR1UWYjYFZCggvQRYvNpsX3kCRHUBS6ccCS6zhhhaN3879ogjN/xvadFhMmBKi2eiWQBIIB6zRPzqurTRfODdTnX9se5okXQ3PneKoYCTjzOGXgfTBbWD12/SKynOaaHsSq9WFoWLisqm0hw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=jrpVXEP2; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=from:to:cc:subject:date:message-id
	:in-reply-to:references:mime-version:content-transfer-encoding;
	 s=k1; bh=0dol+NHPLVxGBr7EwvvNg45Z62kDSE3DsrG/8LSLc64=; b=jrpVXE
	P2V4+0gOuzeaBVEVegS/MACha0j3v0mfLtRZFfOHftDT6MPGlnFmHZn24f2Xue2c
	Iie7NZkDxmzzP96pPRqHNDQBEaiEGjeeeK1+tv4XDeOnnm7p4CPVRHEwVPLuTtm4
	LXpMlGAyZOUmwjZ9ZJycTrzowCtoFawe2o+XmFkX35RDcVtum1Ikou17zWWh+m91
	Pxls5i64DncEY0+oqyMT0zrors+iuwsYMId+FEmOGEtFCRfrJykZbUTt10z8AvAw
	WoiG/AQRqwVQZ3vltK4IytxwG1NcB8/BC2SWyaR27Zioz/kNDuD+FMN/nLaGG6JS
	4hKe6CnZ1oUTQtnA==
Received: (qmail 3011387 invoked from network); 15 Feb 2026 23:55:07 +0100
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 15 Feb 2026 23:55:07 +0100
X-UD-Smtp-Session: l3s3148p1@6tnRuuRKeIQujns5
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: linux-renesas-soc@vger.kernel.org
Cc: Andy Shevchenko <andriy.shevchenko@intel.com>,
	linux-arm-kernel@lists.infradead.org,
	Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Bjorn Andersson <andersson@kernel.org>,
	Baolin Wang <baolin.wang@linux.alibaba.com>,
	linux-omap@vger.kernel.org,
	linux-remoteproc@vger.kernel.org
Subject: [RFC PATCH v2 03/13] hwspinlock: omap: use new callback to initialize hwspinlock priv
Date: Sun, 15 Feb 2026 23:54:43 +0100
Message-ID: <20260215225501.6365-4-wsa+renesas@sang-engineering.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260215225501.6365-1-wsa+renesas@sang-engineering.com>
References: <20260215225501.6365-1-wsa+renesas@sang-engineering.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.34 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[sang-engineering.com:s=k1];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[4];
	RCVD_TLS_LAST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	DMARC_NA(0.00)[sang-engineering.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-28216-lists,linux-renesas-soc=lfdr.de,renesas];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[wsa@sang-engineering.com,linux-renesas-soc@vger.kernel.org];
	RCPT_COUNT_SEVEN(0.00)[8];
	MID_RHS_MATCH_FROM(0.00)[];
	DKIM_TRACE(0.00)[sang-engineering.com:+];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,sang-engineering.com:mid,sang-engineering.com:dkim,sang-engineering.com:email]
X-Rspamd-Queue-Id: 893FA13FF96
X-Rspamd-Action: no action

Apply the new helper to avoid using internal structures from the core.

Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
---
 drivers/hwspinlock/omap_hwspinlock.c | 13 +++++++++----
 1 file changed, 9 insertions(+), 4 deletions(-)

diff --git a/drivers/hwspinlock/omap_hwspinlock.c b/drivers/hwspinlock/omap_hwspinlock.c
index 5bf0061d3fd6..9a9cb3692348 100644
--- a/drivers/hwspinlock/omap_hwspinlock.c
+++ b/drivers/hwspinlock/omap_hwspinlock.c
@@ -66,10 +66,18 @@ static void omap_hwspinlock_relax(struct hwspinlock *lock)
 	ndelay(50);
 }
 
+static void *omap_hwspinlock_init_priv(int local_id, void *init_data)
+{
+	void __iomem *io_base_ofs = init_data;
+
+	return io_base_ofs + sizeof(u32) * local_id;
+}
+
 static const struct hwspinlock_ops omap_hwspinlock_ops = {
 	.trylock = omap_hwspinlock_trylock,
 	.unlock = omap_hwspinlock_unlock,
 	.relax = omap_hwspinlock_relax,
+	.init_priv = omap_hwspinlock_init_priv,
 };
 
 static int omap_hwspinlock_probe(struct platform_device *pdev)
@@ -116,11 +124,8 @@ static int omap_hwspinlock_probe(struct platform_device *pdev)
 	if (!bank)
 		return -ENOMEM;
 
-	for (i = 0; i < num_locks; i++)
-		bank->lock[i].priv = io_base + LOCK_BASE_OFFSET + sizeof(u32) * i;
-
 	return devm_hwspin_lock_register(&pdev->dev, bank, &omap_hwspinlock_ops,
-						base_id, num_locks);
+					 base_id, num_locks, io_base + LOCK_BASE_OFFSET);
 }
 
 static const struct of_device_id omap_hwspinlock_of_match[] = {
-- 
2.51.0


