Return-Path: <linux-renesas-soc+bounces-29877-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id uBjEGrPYu2k6pAIAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-29877-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 19 Mar 2026 12:06:27 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 10F022CA08A
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 19 Mar 2026 12:06:26 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id AF94A30AB5E1
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 19 Mar 2026 11:00:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CE9D53A9616;
	Thu, 19 Mar 2026 11:00:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="Vef3M3MZ"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 997733C661A
	for <linux-renesas-soc@vger.kernel.org>; Thu, 19 Mar 2026 11:00:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773918024; cv=none; b=TVkTLDNMK/n6bpmC9oOUWoMnJtx0Qtwk3UcvGQR0CwfrY9rN+yexQMxA9dGN+Cd0R8IxJM2ktAXTObqwElrcfgmK8MEQY58eeSmwf0q5qUOFSKr7wkcU0pfO8rUhk2W9UcDkAbgLvVAoQcvWqoogjowOusXINC0SYdiKLMX8H9o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773918024; c=relaxed/simple;
	bh=lPUlWLDZEIHKetKHHdMSN3sOG8dRuYx7PE4oGAgK69o=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=NG+2UQ6wzMlWTQuaDksnnCy3fJHDFJgjdthfUTBihdCfWj8eyfwroZwvAesxS5aMJ/7sZ8WAOlMJPzbHey8R9Ck065k1EfBpA83Ziyrp3KeyULqCrJkiOnXyYep+/nzRbbd1mKiTVH7iVoyIIA8zHZ2Vs9oH0dGsaCisK2AcENQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=Vef3M3MZ; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=from:to:cc:subject:date:message-id
	:in-reply-to:references:mime-version:content-transfer-encoding;
	 s=k1; bh=zC6Y1AkSSP6gBbG0k4SbZrnCH1NvYvCklVNqT+RHEM0=; b=Vef3M3
	MZMMYT8RPLvd1Eq3WmfHKWQqATDW/hmqBvASwumh4Xnf6rfnsqDsKQ1HKRxN3h6L
	LU6FLsKYCdaNhYJgjiK7rMbRKWjRVTxHt/WTrf5VVe0MDCFQr/V6i6FZfKnXLgVs
	AAsiZodPtcmrySpT31FfDHmqNx0F1k658iF49PvAoam5g68okZpRZ73E/D5cRLGv
	Dmbm4q4P/d9lza9egT98n0pl/H4o1blkUhORZ659TK3DnaBYPwEQi9ivbVTx3TjB
	wFoK9R9Q5SdYeY7k8Zr1YuFHMslXdvD1JTWPZCAWaWtGIwO2fpEhEmmdG0MZTCWL
	/Ss4U0a0ZWgnyXvg==
Received: (qmail 1099649 invoked from network); 19 Mar 2026 12:00:00 +0100
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 19 Mar 2026 12:00:00 +0100
X-UD-Smtp-Session: l3s3148p1@d9dHeF5NcpsgAwDPXzF+ANZpdrMKUeLI
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: linux-renesas-soc@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
	Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Chen-Yu Tsai <wens@kernel.org>,
	Wilken Gottwalt <wilken.gottwalt@posteo.net>,
	Bjorn Andersson <andersson@kernel.org>,
	Baolin Wang <baolin.wang@linux.alibaba.com>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	linux-remoteproc@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev
Subject: [PATCH v5 09/15] hwspinlock: sun6i: use new callback to initialize hwspinlock priv
Date: Thu, 19 Mar 2026 11:59:31 +0100
Message-ID: <20260319105947.6237-10-wsa+renesas@sang-engineering.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260319105947.6237-1-wsa+renesas@sang-engineering.com>
References: <20260319105947.6237-1-wsa+renesas@sang-engineering.com>
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
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-29877-lists,linux-renesas-soc=lfdr.de,renesas];
	DMARC_NA(0.00)[sang-engineering.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	RCPT_COUNT_TWELVE(0.00)[12];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[vger.kernel.org,sang-engineering.com,kernel.org,posteo.net,linux.alibaba.com,gmail.com,sholland.org,lists.infradead.org,lists.linux.dev];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[wsa@sang-engineering.com,linux-renesas-soc@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[sang-engineering.com:+];
	NEURAL_HAM(-0.00)[-0.972];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas];
	MID_RHS_MATCH_FROM(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sang-engineering.com:dkim,sang-engineering.com:email,sang-engineering.com:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 10F022CA08A
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Apply the new helper to avoid using internal structures from the core.
Remove superfluous setting of drvdata while here.

Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
Reviewed-by: Chen-Yu Tsai <wens@kernel.org>
---
 drivers/hwspinlock/sun6i_hwspinlock.c | 18 ++++++++----------
 1 file changed, 8 insertions(+), 10 deletions(-)

diff --git a/drivers/hwspinlock/sun6i_hwspinlock.c b/drivers/hwspinlock/sun6i_hwspinlock.c
index a0c76bba3f05..c3db81cb1793 100644
--- a/drivers/hwspinlock/sun6i_hwspinlock.c
+++ b/drivers/hwspinlock/sun6i_hwspinlock.c
@@ -74,9 +74,15 @@ static void sun6i_hwspinlock_unlock(struct hwspinlock *lock)
 	writel(SPINLOCK_NOTTAKEN, lock_addr);
 }
 
+static void *sun6i_hwspinlock_init_priv(int local_id, void *init_data)
+{
+	return init_data + sizeof(u32) * local_id;
+}
+
 static const struct hwspinlock_ops sun6i_hwspinlock_ops = {
 	.trylock	= sun6i_hwspinlock_trylock,
 	.unlock		= sun6i_hwspinlock_unlock,
+	.init_priv	= sun6i_hwspinlock_init_priv,
 };
 
 static void sun6i_hwspinlock_disable(void *data)
@@ -91,10 +97,9 @@ static void sun6i_hwspinlock_disable(void *data)
 static int sun6i_hwspinlock_probe(struct platform_device *pdev)
 {
 	struct sun6i_hwspinlock_data *priv;
-	struct hwspinlock *hwlock;
 	void __iomem *io_base;
 	u32 num_banks;
-	int err, i;
+	int err;
 
 	io_base = devm_platform_ioremap_resource(pdev, SPINLOCK_BASE_ID);
 	if (IS_ERR(io_base))
@@ -161,11 +166,6 @@ static int sun6i_hwspinlock_probe(struct platform_device *pdev)
 		goto bank_fail;
 	}
 
-	for (i = 0; i < priv->nlocks; ++i) {
-		hwlock = &priv->bank->lock[i];
-		hwlock->priv = io_base + SPINLOCK_LOCK_REGN + sizeof(u32) * i;
-	}
-
 	/* failure of debugfs is considered non-fatal */
 	sun6i_hwspinlock_debugfs_init(priv);
 	if (IS_ERR(priv->debugfs))
@@ -177,10 +177,8 @@ static int sun6i_hwspinlock_probe(struct platform_device *pdev)
 		goto bank_fail;
 	}
 
-	platform_set_drvdata(pdev, priv);
-
 	return devm_hwspin_lock_register(&pdev->dev, priv->bank, &sun6i_hwspinlock_ops,
-					 SPINLOCK_BASE_ID, priv->nlocks, NULL);
+					 SPINLOCK_BASE_ID, priv->nlocks, io_base + SPINLOCK_LOCK_REGN);
 
 bank_fail:
 	clk_disable_unprepare(priv->ahb_clk);
-- 
2.51.0


