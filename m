Return-Path: <linux-renesas-soc+bounces-28219-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id OFKMIPNOkmlvswEAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-28219-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Sun, 15 Feb 2026 23:55:47 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D12B13FFD7
	for <lists+linux-renesas-soc@lfdr.de>; Sun, 15 Feb 2026 23:55:47 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id B358B302D11E
	for <lists+linux-renesas-soc@lfdr.de>; Sun, 15 Feb 2026 22:55:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 88FEE3043C9;
	Sun, 15 Feb 2026 22:55:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="C7JCQ9xI"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B9CD123370F
	for <linux-renesas-soc@vger.kernel.org>; Sun, 15 Feb 2026 22:55:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771196127; cv=none; b=j/S3LY/P9vUA4f0dsqOGaHjXTMIRHZOib9vFTpLLJpZAYZMrceBbmUxwzBN8CkCPXWzfyQx52FnPrB0xd7K77RabjZd36JqQ/HIuWeLeqPSPkpSz5an0lbMvzu5AYlYfpJBZHwd+67tKF4Xoh8MHAPNlU2KezaG7+yvO1fGZUPo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771196127; c=relaxed/simple;
	bh=VukyizN5s8Xg6BMLWVsVk0nzABJr4WcCejfQG89ONY0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ZyrfbNnmvrlEYZK64MlO5elysjSm+nS6CeKz73QoBE2mdgmtAj41YZnCB3ZzDCUwLxENBsMQnPJ3A8c2uenYgzEsoCIl2VHWaWF2rudpPaQZMzIe5ICFbUGACDXliVFZ0b2AwKGmE5/qhjRCuWebMO0xay28758SAoS5ZgGCaa8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=C7JCQ9xI; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=from:to:cc:subject:date:message-id
	:in-reply-to:references:mime-version:content-transfer-encoding;
	 s=k1; bh=0Mnv5asIBgC16zhxO0+XRgGoOGoi/I6OSdCNLF9zGEg=; b=C7JCQ9
	xIFW2wc3Y10PJ5E7MEYeu4mHIB8vW5LmsPMOaLIMCjrsfZI/OKwH7H+ieKF37W+t
	ZbSxEccxuWlkuT176kNsGBtUle3s7yGihWOs+gO13w1Wcd42FeXpSf3iA0oBhz6p
	3sAvaxt0fIF2mao8thJHgokDRqbZtE+Mvy/0SRBNw513XM/7XJ3JJ/Dp4pgdFwUi
	TnP0v8EmzQiUzyqGbSRiwzEONJYkbAyz3u9CuaHiFh9T5kqbg/XjVmdE8Pou3NjL
	rEWd4cpI7Si9c59mTIhZlYwaVxBIOrvR4/zrB6SKWv9S6/SB3gzy7VdEdlP3YV1B
	H30t+FfC+OcHVuwA==
Received: (qmail 3011446 invoked from network); 15 Feb 2026 23:55:11 +0100
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 15 Feb 2026 23:55:11 +0100
X-UD-Smtp-Session: l3s3148p1@EaEGu+RK1sAujns5
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: linux-renesas-soc@vger.kernel.org
Cc: Andy Shevchenko <andriy.shevchenko@intel.com>,
	linux-arm-kernel@lists.infradead.org,
	Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Bjorn Andersson <andersson@kernel.org>,
	Baolin Wang <baolin.wang@linux.alibaba.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	linux-remoteproc@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com
Subject: [RFC PATCH v2 06/13] hwspinlock: stm32: use new callback to initialize hwspinlock priv
Date: Sun, 15 Feb 2026 23:54:46 +0100
Message-ID: <20260215225501.6365-7-wsa+renesas@sang-engineering.com>
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
	R_DKIM_ALLOW(-0.20)[sang-engineering.com:s=k1];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-28219-lists,linux-renesas-soc=lfdr.de,renesas];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	DMARC_NA(0.00)[sang-engineering.com];
	FREEMAIL_CC(0.00)[intel.com,lists.infradead.org,sang-engineering.com,kernel.org,linux.alibaba.com,gmail.com,foss.st.com,vger.kernel.org,st-md-mailman.stormreply.com];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[sang-engineering.com:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[wsa@sang-engineering.com,linux-renesas-soc@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas];
	RCPT_COUNT_SEVEN(0.00)[10];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,sang-engineering.com:mid,sang-engineering.com:dkim,sang-engineering.com:email]
X-Rspamd-Queue-Id: 2D12B13FFD7
X-Rspamd-Action: no action

Apply the new helper to avoid using internal structures from the core.

Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
---
 drivers/hwspinlock/stm32_hwspinlock.c | 15 ++++++++++-----
 1 file changed, 10 insertions(+), 5 deletions(-)

diff --git a/drivers/hwspinlock/stm32_hwspinlock.c b/drivers/hwspinlock/stm32_hwspinlock.c
index 1d75dc03f4ad..02db950c9450 100644
--- a/drivers/hwspinlock/stm32_hwspinlock.c
+++ b/drivers/hwspinlock/stm32_hwspinlock.c
@@ -48,10 +48,18 @@ static void stm32_hwspinlock_relax(struct hwspinlock *lock)
 	ndelay(50);
 }
 
+static void *stm32_hwspinlock_init_priv(int local_id, void *init_data)
+{
+	void __iomem *io_base = init_data;
+
+	return io_base + local_id * sizeof(u32);
+}
+
 static const struct hwspinlock_ops stm32_hwspinlock_ops = {
 	.trylock	= stm32_hwspinlock_trylock,
 	.unlock		= stm32_hwspinlock_unlock,
 	.relax		= stm32_hwspinlock_relax,
+	.init_priv	= stm32_hwspinlock_init_priv,
 };
 
 static void stm32_hwspinlock_disable_clk(void *data)
@@ -73,7 +81,7 @@ static int stm32_hwspinlock_probe(struct platform_device *pdev)
 	struct device *dev = &pdev->dev;
 	struct stm32_hwspinlock *hw;
 	void __iomem *io_base;
-	int i, ret;
+	int ret;
 
 	io_base = devm_platform_ioremap_resource(pdev, 0);
 	if (IS_ERR(io_base))
@@ -106,11 +114,8 @@ static int stm32_hwspinlock_probe(struct platform_device *pdev)
 		return ret;
 	}
 
-	for (i = 0; i < STM32_MUTEX_NUM_LOCKS; i++)
-		hw->bank.lock[i].priv = io_base + i * sizeof(u32);
-
 	ret = devm_hwspin_lock_register(dev, &hw->bank, &stm32_hwspinlock_ops,
-					0, STM32_MUTEX_NUM_LOCKS);
+					0, STM32_MUTEX_NUM_LOCKS, io_base);
 
 	if (ret)
 		dev_err(dev, "Failed to register hwspinlock\n");
-- 
2.51.0


