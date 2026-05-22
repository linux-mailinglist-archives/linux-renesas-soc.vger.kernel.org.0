Return-Path: <linux-renesas-soc+bounces-32940-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id uIz/BsUwEGoaUwYAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-32940-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 22 May 2026 12:32:37 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F9635B228F
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 22 May 2026 12:32:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id D750A3108FA4
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 22 May 2026 10:21:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 37D7F3CE0A2;
	Fri, 22 May 2026 10:18:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="lILRdStR"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 055003CDBDB;
	Fri, 22 May 2026 10:18:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779445133; cv=none; b=dROnGuHhaVpeqf7re70kWyd8OaYcz2Br5kPwSMEBVJojOm/yxnQpAuiiY4Vc8iHqUa4yhvPi9bSPZsggrDxH6hpgULOPxxMhoMxO8RXQBbEcSfcS+G/qUtcn/ud12k2ULqJvtM3eI0Mta0FljpLZFj3YWTKlhZ93/CSO+Ld0YMQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779445133; c=relaxed/simple;
	bh=u2aSK1ItOQKT29AOld7hmd50ZTMZASsXhwHP+pH83Pc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=c0RyNJBzuXTo3umjFKVIfzXZ7ko+AVI/CHGzDNELmOyrRC1or23Wr8qJB5tWP5lpjM1c1oY3l4oyXKm2GLp1l6WL7QXSYIyyEHx496YwhXEizgH3SDICOIjX6+Cxm+FlGWLHpFXmaBU+fJa3zln3GztXo8x63/fAuogtEuRIU6M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=lILRdStR; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D990C1F000E9;
	Fri, 22 May 2026 10:18:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779445131;
	bh=fQueYcmdwnccioyNO8aGWs1lRM/qB9ET5VtaJlLRrkA=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=lILRdStRs+CqQzCip+lPD5w3AffDPiy+rQYCSopIUO4TiF1p+/iC/3LrgphzdW70m
	 pVLwkZyK2DYGoSD53GqZ3J9UFL22l+WFep2eBkK36/LWDIMt1FQc8+9fGoGorIsKdQ
	 sAPH/EXUMBmMok6LxsES8jCQA0t8R0XOYKy0iiwSn0I8hFosjKtKaqJ17cf2NVjMU5
	 HqAvgob7QvV4H2fhFZMPAAh+o79F6T2huKiadyQa3j4/GFb4cXyDcGUoQXOcixPy8Q
	 0wgZtP1SV1urUuQuVdNhp6R7zCO6pWOLg12YCrVBVZj9LD5CCopnXTgHWP4pOkfhr1
	 CmDJ97HjulmBw==
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
Subject: [PATCH 09/17] i3c: renesas: Use reset_control_bulk_{assert, deassert}()
Date: Fri, 22 May 2026 13:18:07 +0300
Message-ID: <20260522101815.1722909-10-claudiu.beznea@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260522101815.1722909-1-claudiu.beznea@kernel.org>
References: <20260522101815.1722909-1-claudiu.beznea@kernel.org>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[4];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-32940-lists,linux-renesas-soc=lfdr.de];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.994];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[claudiu.beznea@kernel.org,linux-renesas-soc@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas];
	TO_DN_SOME(0.00)[];
	FROM_HAS_DN(0.00)[]
X-Rspamd-Queue-Id: 8F9635B228F
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>

Use reset_control_bulk_assert() and reset_control_bulk_deassert() in the
suspend and resume paths to simplify the code.

Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
---
 drivers/i3c/master/renesas-i3c.c | 30 +++++++++++++-----------------
 1 file changed, 13 insertions(+), 17 deletions(-)

diff --git a/drivers/i3c/master/renesas-i3c.c b/drivers/i3c/master/renesas-i3c.c
index d32646deb69f..e5963270d6e5 100644
--- a/drivers/i3c/master/renesas-i3c.c
+++ b/drivers/i3c/master/renesas-i3c.c
@@ -1414,24 +1414,22 @@ static void renesas_i3c_remove(struct platform_device *pdev)
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
 
@@ -1441,19 +1439,19 @@ static int renesas_i3c_suspend(struct device *dev)
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
@@ -1484,10 +1482,8 @@ static int renesas_i3c_resume(struct device *dev)
 
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


