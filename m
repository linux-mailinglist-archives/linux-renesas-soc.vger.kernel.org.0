Return-Path: <linux-renesas-soc+bounces-29046-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id CIP6EOh5rmm2FAIAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-29046-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 09 Mar 2026 08:42:32 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C5F7234EBB
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 09 Mar 2026 08:42:31 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 2742D3003BE9
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  9 Mar 2026 07:42:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B7A0F368954;
	Mon,  9 Mar 2026 07:42:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="bYVfChgS"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A621368956
	for <linux-renesas-soc@vger.kernel.org>; Mon,  9 Mar 2026 07:42:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773042144; cv=none; b=GjLfAUOGlKjXPmMNCEmMBu1fW4hZTpFoEeOaljvgmYfrgHvMhCaILQIHXfi2JcecrhvcBO9y6Vjeslhh2P39qpmc42BcX25JCO0v+uVShWV3mFeQyqB8MSiphhR1iMxLIJr0hQP72/gY7qC1Po80KBZmRzLFKKjenUsf6+Yci2Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773042144; c=relaxed/simple;
	bh=wLT+P5immLGtGSbMvGWE3RVKTFujaWsLE5OCjzAKMtw=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=tcgUERC5Qx2kmEnDQAUj5e/89IFzOLLw2SaQui20pVwG59jKr2IHzw/BDQNinM2rBxivQGUFviiJZynrIQ+c0hnWmbtTJHtuwxBSztaF27nOAEEmQB3dyI/sFyB6I4PzR135OIA0qMPCqb1CmOvLYWOHtmuuch8MlfYx5zags8M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=bYVfChgS; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=from:to:cc:subject:date:message-id
	:mime-version:content-transfer-encoding; s=k1; bh=q/d+PubUJJgEQn
	QuB6s6hs0XHW992roQ6Kpop01fimU=; b=bYVfChgSsYZZkfABSlbgLaAeIVlgRg
	ThOO34tnNRD0XaJoWrBZpmsLlNWvpsnrijWABsml/Hr1bB3qkMJjimHJ3CH01+xo
	KqVdInUu0TFeEcQuLTO5qhsUCn8n228U8Z1eHzl4K4ANAEHrDyhU95PzueWUcaOh
	dVZGHfnz7Qziun11V376dXlteOH6Lhii0y3wpYJakIYDXH44oroumW1HJ/J0iF77
	mFtXoqca9oYtSmWH8HPb6zn0YUpoiwBjg1+KHF7hXUrmmHxf7yL7NAIhJpoNeH9m
	/Dhz5W1Z/tLxt557jtjOkD6emhSIQiWJSBq1DrMRCiBdoam6leGF53iQ==
Received: (qmail 2669355 invoked from network); 9 Mar 2026 08:42:21 +0100
Received: by mail.zeus03.de with UTF8SMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 9 Mar 2026 08:42:21 +0100
X-UD-Smtp-Session: l3s3148p1@K4v7ipJM+LQujnvm
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: linux-renesas-soc@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
	Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Tudor Ambarus <tudor.ambarus@linaro.org>,
	Jassi Brar <jassisinghbrar@gmail.com>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	linux-samsung-soc@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH RFT] mailbox: exynos: drop superfluous mbox setting per channel
Date: Mon,  9 Mar 2026 08:39:20 +0100
Message-ID: <20260309074210.2279-2-wsa+renesas@sang-engineering.com>
X-Mailer: git-send-email 2.47.3
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: 3C5F7234EBB
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.34 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[sang-engineering.com:s=k1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-29046-lists,linux-renesas-soc=lfdr.de,renesas];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	DMARC_NA(0.00)[sang-engineering.com];
	FREEMAIL_CC(0.00)[vger.kernel.org,sang-engineering.com,linaro.org,gmail.com,kernel.org,samsung.com,lists.infradead.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[sang-engineering.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[wsa@sang-engineering.com,linux-renesas-soc@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.997];
	RCPT_COUNT_SEVEN(0.00)[9];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sang-engineering.com:dkim,sang-engineering.com:email,sang-engineering.com:mid,sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo]
X-Rspamd-Action: no action

The core initializes the 'mbox' field exactly like this, so don't
duplicate it in the driver.

Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
---

Only build-tested. Found because I made the same mistake in my
to-be-upstreamed driver and then looked for that pattern. Testing would
be still much appreciated!

 drivers/mailbox/exynos-mailbox.c | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/drivers/mailbox/exynos-mailbox.c b/drivers/mailbox/exynos-mailbox.c
index 5f2d3b81c1db..d2355b128ba4 100644
--- a/drivers/mailbox/exynos-mailbox.c
+++ b/drivers/mailbox/exynos-mailbox.c
@@ -99,7 +99,6 @@ static int exynos_mbox_probe(struct platform_device *pdev)
 	struct mbox_controller *mbox;
 	struct mbox_chan *chans;
 	struct clk *pclk;
-	int i;
 
 	exynos_mbox = devm_kzalloc(dev, sizeof(*exynos_mbox), GFP_KERNEL);
 	if (!exynos_mbox)
@@ -129,9 +128,6 @@ static int exynos_mbox_probe(struct platform_device *pdev)
 	mbox->ops = &exynos_mbox_chan_ops;
 	mbox->of_xlate = exynos_mbox_of_xlate;
 
-	for (i = 0; i < EXYNOS_MBOX_CHAN_COUNT; i++)
-		chans[i].mbox = mbox;
-
 	exynos_mbox->mbox = mbox;
 
 	platform_set_drvdata(pdev, exynos_mbox);
-- 
2.47.3


