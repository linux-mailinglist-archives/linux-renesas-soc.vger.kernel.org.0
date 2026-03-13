Return-Path: <linux-renesas-soc+bounces-29325-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 0Hg3DEHZs2mzbgAAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-29325-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 13 Mar 2026 10:30:41 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 8ACBA280812
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 13 Mar 2026 10:30:40 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 99BEE31CEA8D
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 13 Mar 2026 09:24:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4C258359A90;
	Fri, 13 Mar 2026 09:24:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="NE7nEJJu"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A3EF377021
	for <linux-renesas-soc@vger.kernel.org>; Fri, 13 Mar 2026 09:24:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.171.202.116
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773393884; cv=none; b=u48JS7rxcE+MdZtgNRTs8Ns/mYocN4VYWwZ8C5cVZCpehBuz5oMyKUwaPIiOxS3kKJ3WQrl86OSJiZWoVIIkOVVfiDo2qvME+FAtxWgUMKJdNiiCVBZkn6i8UZKqBSePDv3FCtV/MCTKZo4WrtlqcO/KU09A7YOwi7VW9JUZcPM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773393884; c=relaxed/simple;
	bh=qkCssjwQ6xHfILIG/0YeecVw+n9kEcmrQqoPICmcohU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=aN83KWkXeMmO5ArsdPH/xgKn4QRi7CSAp1f17JqXDez4UceZOEP1SHJ9FO+WEby3kBWJphKNk3NQhSK/GW7Figjnecq5gyNTBTlMwwZQassqRzjeYCeAjWluE0IbWKJfvAmU/I2Yyl7Lz2bOwGpIWySLEfcLMm/05yPHmDfq9ps=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=NE7nEJJu; arc=none smtp.client-ip=185.171.202.116
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id E5ACAC40435
	for <linux-renesas-soc@vger.kernel.org>; Fri, 13 Mar 2026 09:25:03 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id CB87A60027;
	Fri, 13 Mar 2026 09:24:41 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id C560910369DD1;
	Fri, 13 Mar 2026 10:24:39 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1773393881; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding:in-reply-to:references;
	bh=HeFNpkruOmIcHovjLW+aFCk9gvji8MHWFyaMG1utC/c=;
	b=NE7nEJJuD2qHF1ZHgOaxOemSVCA+tqOhHLJlECdWKUe1DY1Sl6BZo9/UjP7VblAgGBCh+X
	szluIutldeoIhmwdo14noIxQgE0GURUIWftMI1Eq2ngcQxPNeGGE0koijlVfHp2b8DkE5K
	RbUqM4Q0yl21SwGQ8CIznjhkXUdry4Z//LRGb3IQMwkHpbHTyAiTN5OzxmbQZ+ubIQN4dm
	VNOP8ZktWcvLCTZchjJj5N/rMFVOtPnGmIbbVcYcBv0eJig9oqel9XrN0nlXMJMZl6WzS+
	HnXsd9/vZkTEGncQw+IhsZGkdSp2APjkKsyW2GUhyYSUJ3na2FH3jCYNcvg9VQ==
From: "Herve Codina (Schneider Electric)" <herve.codina@bootlin.com>
To: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Wim Van Sebroeck <wim@linux-watchdog.org>,
	Guenter Roeck <linux@roeck-us.net>
Cc: linux-renesas-soc@vger.kernel.org,
	linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-watchdog@vger.kernel.org,
	Pascal Eberhard <pascal.eberhard@se.com>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	"Herve Codina (Schneider Electric)" <herve.codina@bootlin.com>
Subject: [PATCH v2 1/3] watchdog: rzn1: Fix reverse xmas tree declaration
Date: Fri, 13 Mar 2026 10:24:14 +0100
Message-ID: <20260313092417.294356-2-herve.codina@bootlin.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260313092417.294356-1-herve.codina@bootlin.com>
References: <20260313092417.294356-1-herve.codina@bootlin.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[bootlin.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[bootlin.com:s=dkim];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[14];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-29325-lists,linux-renesas-soc=lfdr.de];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[herve.codina@bootlin.com,linux-renesas-soc@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[bootlin.com:+];
	RCVD_COUNT_FIVE(0.00)[6];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas];
	NEURAL_HAM(-0.00)[-1.000];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,bootlin.com:dkim,bootlin.com:email,bootlin.com:mid]
X-Rspamd-Queue-Id: 8ACBA280812
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Variables declared in probe() don't follow the reverse xmas
tree convention.

Fix the declaration in order to follow the convention.

Signed-off-by: Herve Codina (Schneider Electric) <herve.codina@bootlin.com>
---
 drivers/watchdog/rzn1_wdt.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/watchdog/rzn1_wdt.c b/drivers/watchdog/rzn1_wdt.c
index 96fd04fbc2a2..b7034eac91d0 100644
--- a/drivers/watchdog/rzn1_wdt.c
+++ b/drivers/watchdog/rzn1_wdt.c
@@ -101,10 +101,10 @@ static const struct watchdog_ops rzn1_wdt_ops = {
 static int rzn1_wdt_probe(struct platform_device *pdev)
 {
 	struct device *dev = &pdev->dev;
-	struct rzn1_watchdog *wdt;
 	struct device_node *np = dev->of_node;
-	struct clk *clk;
+	struct rzn1_watchdog *wdt;
 	unsigned long clk_rate;
+	struct clk *clk;
 	int ret;
 	int irq;
 
-- 
2.53.0


