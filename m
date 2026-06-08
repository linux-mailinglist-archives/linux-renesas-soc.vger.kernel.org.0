Return-Path: <linux-renesas-soc+bounces-33701-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id lG5/CT8jJ2rhsQIAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-33701-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 08 Jun 2026 22:17:03 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id B694A65A584
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 08 Jun 2026 22:17:02 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b="f/drdDhK";
	spf=pass (mail.lfdr.de: domain of "linux-renesas-soc+bounces-33701-lists+linux-renesas-soc=lfdr.de@vger.kernel.org" designates 172.232.135.74 as permitted sender) smtp.mailfrom="linux-renesas-soc+bounces-33701-lists+linux-renesas-soc=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id D14C23028177
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  8 Jun 2026 20:16:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 939DB3E274E;
	Mon,  8 Jun 2026 20:16:21 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7BB9B38A73C;
	Mon,  8 Jun 2026 20:16:20 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780949781; cv=none; b=mnqxnrfF6TrhYGahdI8uBzEVshiptO/N4Z0F7NVaGf7vDeOYwBZLqpJ1oMNBUFmHBj0+X8Frd6mxTiVRQoS6ixSbHFWW+mJB595AAhHFk9cnwkoWm/4Yk2UTPsQVQMEPpfSk6WnKNxGzn9SgeHeI+9fnc+wX9FMFvGz0fYcMMLc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780949781; c=relaxed/simple;
	bh=ttva1gnbv3q4YeGCDlBaNWcun44L9AgUn8TKrtaCOAA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=O036yiktX3fZWGC/CWf++EhtTkV/vKbb2asorfXfrQBWc8jrFW2oMCfgAWj58k3bZAokyD0rJ8BkkfCTK206bS1oNCu1Z/CNUrhAB/WJ4QqohgiosTtADxkkg+8pc5hceUUk7i0NlkG+ObXwLrHnadqyibxZS1Ks93EmysI4icc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=f/drdDhK; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D16751F00898;
	Mon,  8 Jun 2026 20:16:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780949780;
	bh=SzPZOTybytX0pqhXhEEdEjH/9xZCkYgPnJNx+q6d7+Q=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=f/drdDhKVnzqt7Im2ahzEZ1l2Cysu5SKwUqZ1bigz3Cd0rT1Mwc7k0gL9eQix0Tim
	 ckwhxQoQzi40xWHRTdDBYEtcrB5ZZVo7KAzoJK0FQbdf1ubrJGNvIc8Pfu6KXcSUFT
	 J1vZ9rzLNzPqVbFtkv57l4cVvNnwKbEprfDQ397neWONCKeVsVmO3FOf117ekaJRjI
	 Vk4F0keW9gPBwBgmWqdRymfpiUFaa0RuU/aZSn2OM62XLy8oAObvGS/HsrclSApjRz
	 EF7yBRgQ36EFtwC4MgOJUUn4sQO/eMMNxwMG7eToHbOk0PNjoWZf/0w2aMYNvKo89z
	 EZ0PkqavrM0kA==
From: Claudiu Beznea <claudiu.beznea@kernel.org>
To: wsa+renesas@sang-engineering.com,
	tommaso.merciai.xr@bp.renesas.com,
	alexandre.belloni@bootlin.com,
	Frank.Li@nxp.com,
	p.zabel@pengutronix.de
Cc: claudiu.beznea@kernel.org,
	claudiu.beznea@tuxon.dev,
	linux-i3c@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
Subject: [PATCH v3 09/17] i3c: renesas: Use reset_control_bulk_{assert, deassert}()
Date: Mon,  8 Jun 2026 23:15:35 +0300
Message-ID: <20260608201543.804902-10-claudiu.beznea@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260608201543.804902-1-claudiu.beznea@kernel.org>
References: <20260608201543.804902-1-claudiu.beznea@kernel.org>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Action: no action
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	RCVD_COUNT_THREE(0.00)[4];
	TAGGED_FROM(0.00)[bounces-33701-lists,linux-renesas-soc=lfdr.de];
	FORGED_SENDER(0.00)[claudiu.beznea@kernel.org,linux-renesas-soc@vger.kernel.org];
	FORGED_RECIPIENTS(0.00)[m:wsa+renesas@sang-engineering.com,m:tommaso.merciai.xr@bp.renesas.com,m:alexandre.belloni@bootlin.com,m:Frank.Li@nxp.com,m:p.zabel@pengutronix.de,m:claudiu.beznea@kernel.org,m:claudiu.beznea@tuxon.dev,m:linux-i3c@lists.infradead.org,m:linux-kernel@vger.kernel.org,m:linux-renesas-soc@vger.kernel.org,m:claudiu.beznea.uj@bp.renesas.com,m:wsa@sang-engineering.com,s:lists@lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[claudiu.beznea@kernel.org,linux-renesas-soc@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TO_DN_SOME(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas];
	DBL_BLOCKED_OPENRESOLVER(0.00)[renesas.com:email,vger.kernel.org:from_smtp,sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: B694A65A584

From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>

Use reset_control_bulk_assert() and reset_control_bulk_deassert() in the
suspend and resume paths to simplify the code.

Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
---

Changes in v3:
- none

Changes in v2:
- none

 drivers/i3c/master/renesas-i3c.c | 30 +++++++++++++-----------------
 1 file changed, 13 insertions(+), 17 deletions(-)

diff --git a/drivers/i3c/master/renesas-i3c.c b/drivers/i3c/master/renesas-i3c.c
index 195c40956148..4a055c9f4ffe 100644
--- a/drivers/i3c/master/renesas-i3c.c
+++ b/drivers/i3c/master/renesas-i3c.c
@@ -1565,24 +1565,22 @@ static void renesas_i3c_remove(struct platform_device *pdev)
 static int renesas_i3c_suspend(struct device *dev)
 {
 	struct renesas_i3c *i3c = dev_get_drvdata(dev);
+	struct reset_control_bulk_data resets[] = {
+		{ .rstc = i3c->presetn },
+		{ .rstc = i3c->tresetn },
+	};
 	int ret;
 
 	i2c_mark_adapter_suspended(&i3c->base.i2c);
 
-	ret = reset_control_assert(i3c->presetn);
+	ret = reset_control_bulk_assert(ARRAY_SIZE(resets), resets);
 	if (ret)
 		goto err_mark_resumed;
 
-	ret = reset_control_assert(i3c->tresetn);
-	if (ret)
-		goto err_presetn;
-
 	clk_bulk_disable(i3c->num_clks, i3c->clks);
 
 	return 0;
 
-err_presetn:
-	reset_control_deassert(i3c->presetn);
 err_mark_resumed:
 	i2c_mark_adapter_resumed(&i3c->base.i2c);
 
@@ -1592,19 +1590,19 @@ static int renesas_i3c_suspend(struct device *dev)
 static int renesas_i3c_resume(struct device *dev)
 {
 	struct renesas_i3c *i3c = dev_get_drvdata(dev);
+	struct reset_control_bulk_data resets[] = {
+		{ .rstc = i3c->presetn },
+		{ .rstc = i3c->tresetn },
+	};
 	int ret;
 
-	ret = reset_control_deassert(i3c->tresetn);
+	ret = reset_control_bulk_deassert(ARRAY_SIZE(resets), resets);
 	if (ret)
 		return ret;
 
-	ret = reset_control_deassert(i3c->presetn);
-	if (ret)
-		goto err_tresetn;
-
 	ret = clk_bulk_enable(i3c->num_clks, i3c->clks);
 	if (ret)
-		goto err_presetn;
+		goto err_resets_asserted;
 
 	ret = renesas_i3c_reset(i3c);
 	if (ret)
@@ -1639,10 +1637,8 @@ static int renesas_i3c_resume(struct device *dev)
 
 err_clks_disable:
 	clk_bulk_disable(i3c->num_clks, i3c->clks);
-err_presetn:
-	reset_control_assert(i3c->presetn);
-err_tresetn:
-	reset_control_assert(i3c->tresetn);
+err_resets_asserted:
+	reset_control_bulk_assert(ARRAY_SIZE(resets), resets);
 	return ret;
 }
 
-- 
2.43.0


