Return-Path: <linux-renesas-soc+bounces-32226-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id YEVCBFlo/Gn0PgAAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-32226-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 07 May 2026 12:24:25 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id A6C6C4E6B94
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 07 May 2026 12:24:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 1C9E5300E009
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  7 May 2026 10:24:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0D0C43E8681;
	Thu,  7 May 2026 10:24:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="LuCrkiyW"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 99D743B4E97
	for <linux-renesas-soc@vger.kernel.org>; Thu,  7 May 2026 10:24:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778149460; cv=none; b=HlRDfbVGqwJTS3BlYs6QIeZrMPH/w3btkTPq5ekq6Zg7ZDhT/18WmXw5tlmc/nh65H2ryi4dNxjhUOfHPkodGVlFQD2ZP0DDFJgwJ0LpgbNpXqMQ6xmZupKKZ8gsvxira+sqVej9890qhbuSGMFeJNsrD+YG5934iSiGL2ttb7Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778149460; c=relaxed/simple;
	bh=ObYEb58kxiLifHiZ0V9gBKbgoGUuBwPqQs1zWtaGuVM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=CP0yyE3/uU2S8sVa8QYWpmBsnk99vmUV/AB2dNJUhxB1dGZUNp45N6Ni7mvYhZpgTKxgkY+VvvuP833dDVgssW/oIaxRHHFthGqSv8QaKnEic94lhyfU7U337YQfGqTwCoz5EqmZuGc5r/b5dkkv2xP7GavNkIM/tfm8AcIjzmQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=LuCrkiyW; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=from:to:cc:subject:date:message-id
	:in-reply-to:references:mime-version:content-transfer-encoding;
	 s=k1; bh=R7+qOcAUn7q0TtHcnDRykT3k73VGpLbRtHz1/9BCtvA=; b=LuCrki
	yWoHdBSAaKbSyu3jBm5hooDtOdU7etVPqD7QFKQuFtInED/ctrTLjdvUevlOWYTp
	sTh0wh4mjo4X8gp1NjEGMRxsjvDxFY0jMzMd68QoKIfwP68eJOyF7Aa8Btb0HaRh
	z20JkEdfYvWBSp32E1yI8k9ltztbQ1lytLVcYWLl7zQTngH9l+Xj9+06u/iVeFvc
	3sl2tnWuYZ1SgyZhyVGQnQogUt+pMASp0bj1K28d9K29fPEulsooDmkwL4JEZFwb
	kx+fTftYjBO4TtZZAsJSoOqYqYpWHh02LHjYhE+gjC6iRBUdKwaAJzwHuhoCJJ07
	ZrS1VPDuYH9eojpQ==
Received: (qmail 1070440 invoked from network); 7 May 2026 12:24:14 +0200
Received: by mail.zeus03.de with UTF8SMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 7 May 2026 12:24:14 +0200
X-UD-Smtp-Session: l3s3148p1@HMuXrjdRwOcujnu4
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: linux-renesas-soc@vger.kernel.org
Cc: "Herve Codina (Schneider Electric)" <herve.codina@bootlin.com>,
	Guenter Roeck <linux@roeck-us.net>,
	Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Wim Van Sebroeck <wim@linux-watchdog.org>,
	linux-watchdog@vger.kernel.org
Subject: [PATCH v4 2/4] watchdog: rzn1: Use dev_err_probe()
Date: Thu,  7 May 2026 12:24:07 +0200
Message-ID: <20260507102410.43384-3-wsa+renesas@sang-engineering.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260507102410.43384-1-wsa+renesas@sang-engineering.com>
References: <20260507102410.43384-1-wsa+renesas@sang-engineering.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: A6C6C4E6B94
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.34 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	R_DKIM_ALLOW(-0.20)[sang-engineering.com:s=k1];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TO_DN_SOME(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	TAGGED_FROM(0.00)[bounces-32226-lists,linux-renesas-soc=lfdr.de,renesas];
	MIME_TRACE(0.00)[0:+];
	DMARC_NA(0.00)[sang-engineering.com];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[wsa@sang-engineering.com,linux-renesas-soc@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[sang-engineering.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas];
	MID_RHS_MATCH_FROM(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,roeck-us.net:email]
X-Rspamd-Action: no action

From: "Herve Codina (Schneider Electric)" <herve.codina@bootlin.com>

In the probe() function the following pattern is present several times:
	if (err) {
		dev_err(dev, ...);
		return err;
	}

Replace them by dev_err_probe() calls.

Signed-off-by: Herve Codina (Schneider Electric) <herve.codina@bootlin.com>
Reviewed-by: Guenter Roeck <linux@roeck-us.net>
Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
---
 drivers/watchdog/rzn1_wdt.c | 18 ++++++------------
 1 file changed, 6 insertions(+), 12 deletions(-)

diff --git a/drivers/watchdog/rzn1_wdt.c b/drivers/watchdog/rzn1_wdt.c
index b7034eac91d0..48d5afef62a5 100644
--- a/drivers/watchdog/rzn1_wdt.c
+++ b/drivers/watchdog/rzn1_wdt.c
@@ -122,22 +122,16 @@ static int rzn1_wdt_probe(struct platform_device *pdev)
 
 	ret = devm_request_irq(dev, irq, rzn1_wdt_irq, 0,
 			       np->name, wdt);
-	if (ret) {
-		dev_err(dev, "failed to request irq %d\n", irq);
-		return ret;
-	}
+	if (ret)
+		return dev_err_probe(dev, ret, "failed to request irq %d\n", irq);
 
 	clk = devm_clk_get_enabled(dev, NULL);
-	if (IS_ERR(clk)) {
-		dev_err(dev, "failed to get the clock\n");
-		return PTR_ERR(clk);
-	}
+	if (IS_ERR(clk))
+		return dev_err_probe(dev, PTR_ERR(clk), "failed to get the clock\n");
 
 	clk_rate = clk_get_rate(clk);
-	if (!clk_rate) {
-		dev_err(dev, "failed to get the clock rate\n");
-		return -EINVAL;
-	}
+	if (!clk_rate)
+		return dev_err_probe(dev, -EINVAL, "failed to get the clock rate\n");
 
 	wdt->clk_rate_khz = clk_rate / 1000;
 	wdt->wdtdev.info = &rzn1_wdt_info;
-- 
2.47.3


