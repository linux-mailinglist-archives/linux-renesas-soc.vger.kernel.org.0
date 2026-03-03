Return-Path: <linux-renesas-soc+bounces-28728-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id QIHEKcU3p2lwfwAAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-28728-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 03 Mar 2026 20:34:29 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id CC1DD1F614A
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 03 Mar 2026 20:34:28 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id EEBDD304032B
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  3 Mar 2026 19:32:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3396D3C196D;
	Tue,  3 Mar 2026 19:31:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="B/ZGnjC3"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 775E4389117
	for <linux-renesas-soc@vger.kernel.org>; Tue,  3 Mar 2026 19:31:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772566315; cv=none; b=GHXOTLsASdlqMHnJQYni9f3BK9DQqBZ1+JcB+++XMbbF4oJTcW7sGe+ih30Cqlik1PL4T9/NaU4AiPDRH3/IF4GxpFIkUbh2sW33eLQdHiu9SWFd1j5kG+Jsqk0juweFSmtjde5KFNWG5BSLiZtTMgK2+kyBgHnTAMsrXk0rvt8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772566315; c=relaxed/simple;
	bh=vQS9LYcAzje+MMpRYEd6nRDdwiMOA9YItnDfriXH1aw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=YKTOi+bvJhGxAim+YWNXtqwtXbtXrmhq5Yv5dHpCQ+c5GJ7MNWCTU2FyXyeU9xQ3N7hE3FpmavwrIJtlnEDrvAZGM5T3QflPDRyyRzSaKy72KKc3aXOm4fcGfargQNx6hxd8EHg4rFMonRBQfaYHaZMIxjgQtCqac2eVsRs+cO4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=B/ZGnjC3; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=from:to:cc:subject:date:message-id
	:in-reply-to:references:mime-version:content-transfer-encoding;
	 s=k1; bh=E+W3aoDhRerxB8MlZR6L5l3+W5MIlzwxE6xhU7iwtJA=; b=B/ZGnj
	C3l+XhjK3COy5XM3TUIW+1V7TKWUYJg0j0Q3wBPwFk3gcPOe5YCdf8IG0pZuicUA
	lLjX4jsBDeAVsRX31fza3w11z3ZShkhatmIvnpPsSXtZHLlBs/xmB6jwjdMHo3Za
	BKIOAI8e2yw8j8a0P3r8WI1D+C1zfYnJF+vufTeLceqyBGwAx3UE3wXks+2Vim2g
	CgIU7dxNZjeSCO8Rk0eXHJvI5WvAm8inrmD1AX4BkM6Qh/iT9a6zH/OoOXOcFJ13
	CHAWCkgtsuWssssgjoOAidleQMczZ/29pfpywgRZqoHOukMS9JjDovNXOMK3PnzQ
	brLl3yR5VJw54uqQ==
Received: (qmail 430645 invoked from network); 3 Mar 2026 20:31:34 +0100
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 3 Mar 2026 20:31:34 +0100
X-UD-Smtp-Session: l3s3148p1@DwhUwCNMZJEujnu+
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: linux-renesas-soc@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
	Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Wilken Gottwalt <wilken.gottwalt@posteo.net>,
	Bjorn Andersson <andersson@kernel.org>,
	Baolin Wang <baolin.wang@linux.alibaba.com>,
	Chen-Yu Tsai <wens@kernel.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	linux-remoteproc@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev
Subject: [PATCH v3 09/15] hwspinlock: sun6i: use new callback to initialize hwspinlock priv
Date: Tue,  3 Mar 2026 20:26:01 +0100
Message-ID: <20260303192600.7224-26-wsa+renesas@sang-engineering.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260303192600.7224-17-wsa+renesas@sang-engineering.com>
References: <20260303192600.7224-17-wsa+renesas@sang-engineering.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: CC1DD1F614A
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.34 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	R_DKIM_ALLOW(-0.20)[sang-engineering.com:s=k1];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-28728-lists,linux-renesas-soc=lfdr.de,renesas];
	DMARC_NA(0.00)[sang-engineering.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	RCPT_COUNT_TWELVE(0.00)[12];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[vger.kernel.org,sang-engineering.com,posteo.net,kernel.org,linux.alibaba.com,gmail.com,sholland.org,lists.infradead.org,lists.linux.dev];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[wsa@sang-engineering.com,linux-renesas-soc@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[sang-engineering.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas];
	MID_RHS_MATCH_FROM(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo,sang-engineering.com:dkim,sang-engineering.com:email,sang-engineering.com:mid]
X-Rspamd-Action: no action

Apply the new helper to avoid using internal structures from the core.
Remove superfluous setting of drvdata while here.

Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
---
 drivers/hwspinlock/sun6i_hwspinlock.c | 20 ++++++++++----------
 1 file changed, 10 insertions(+), 10 deletions(-)

diff --git a/drivers/hwspinlock/sun6i_hwspinlock.c b/drivers/hwspinlock/sun6i_hwspinlock.c
index a0c76bba3f05..7d0c639c0e82 100644
--- a/drivers/hwspinlock/sun6i_hwspinlock.c
+++ b/drivers/hwspinlock/sun6i_hwspinlock.c
@@ -74,9 +74,17 @@ static void sun6i_hwspinlock_unlock(struct hwspinlock *lock)
 	writel(SPINLOCK_NOTTAKEN, lock_addr);
 }
 
+static void *sun6i_hwspinlock_init_priv(int local_id, void *init_data)
+{
+	void __iomem *io_base_ofs = init_data;
+
+	return io_base_ofs + sizeof(u32) * local_id;
+}
+
 static const struct hwspinlock_ops sun6i_hwspinlock_ops = {
 	.trylock	= sun6i_hwspinlock_trylock,
 	.unlock		= sun6i_hwspinlock_unlock,
+	.init_priv	= sun6i_hwspinlock_init_priv,
 };
 
 static void sun6i_hwspinlock_disable(void *data)
@@ -91,10 +99,9 @@ static void sun6i_hwspinlock_disable(void *data)
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
@@ -161,11 +168,6 @@ static int sun6i_hwspinlock_probe(struct platform_device *pdev)
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
@@ -177,10 +179,8 @@ static int sun6i_hwspinlock_probe(struct platform_device *pdev)
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


