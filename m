Return-Path: <linux-renesas-soc+bounces-32935-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id AAgQC2ExEGoaUwYAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-32935-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 22 May 2026 12:35:13 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B3285B2384
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 22 May 2026 12:35:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 88F7F307362E
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 22 May 2026 10:20:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 82EFA3CB919;
	Fri, 22 May 2026 10:18:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="UEhvacPt"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 59D8C3D45F3;
	Fri, 22 May 2026 10:18:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779445116; cv=none; b=HegtzvDH7SWwScRwhBHkjhSJA5Iv3SOw0Aidq3SplpdGLsbTsmUjDOylVxSdzOnkEZ4Zvnvcman6WtjtY3n0gX/9KxTzxl9O98kHEotVbSw161rPBt8BXBkwv4wXceyb9ZlLme+E47zQMct9web0znugXbxwMnrOU6+mmlHzYz0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779445116; c=relaxed/simple;
	bh=uJvK9B00WcC8CRjLk5myaQMfYB/7tBx2ataIoocFi6w=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=XsrezkMLD4tOhETvafxETrRhuxel8jlkpUj4u6yUgXfDubHvWsCYdGl8Mkg6GG2rbu8lMJK7I0lM6zUTIfXYGXVqLF9Fjslv5TgJ/6AAYlG/NgnhIJfhIfMM6hKQNMghmG4NLuj6YdMDRhSPQbhwmais2iZwAFzvGbZ1NmVCfDY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=UEhvacPt; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 538E31F000E9;
	Fri, 22 May 2026 10:18:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779445115;
	bh=nlATKTBuVymR4RbCGx8EgOlGBJ0lcWHyDwOxkS9JM/c=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=UEhvacPtlFASvTveZ5wQiyCUCLIb5rPzdraj4eS39CKLa7qs+UcoayW4qr5b0NUvx
	 GY3z53b/At+rc7tFIWcneAsh+YBMfOOB5ajSrTTuIkJp8ibEN/W6zR1CD+Ncl8Yrbc
	 cYrFh9IIUNw5uEHqWqiyfgp5HSDeRCUrb6x4D8fVOunDXTvgYuKkshcEKC+Cf2a2RW
	 GCcuKatRi4YswgLLCQ6O2UyH9rnTOxeMnHx9f+upb4tP1uzPdSbulFTjTvJSatqFjW
	 rfddmAXSlKUs78l8VBIReNYQga1Nf5rf28zWKevNN9MjhQ/gKphrMFJvi/pi6hmB6a
	 pcuPBnIwclfNw==
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
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>,
	stable@vger.kernel.org
Subject: [PATCH 04/17] i3c: renesas: Follow the reset deassert order used in probe
Date: Fri, 22 May 2026 13:18:02 +0300
Message-ID: <20260522101815.1722909-5-claudiu.beznea@kernel.org>
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
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCPT_COUNT_TWELVE(0.00)[12];
	TAGGED_FROM(0.00)[bounces-32935-lists,linux-renesas-soc=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[claudiu.beznea@kernel.org,linux-renesas-soc@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	NEURAL_HAM(-0.00)[-0.995];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	FROM_HAS_DN(0.00)[]
X-Rspamd-Queue-Id: 9B3285B2384
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>

Use the same reset deassert order in the resume and probe paths to avoid
potential failures due to ordering differences.

Fixes: e7218986319b ("i3c: renesas: Add suspend/resume support")
Cc: stable@vger.kernel.org
Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
---
 drivers/i3c/master/renesas-i3c.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/i3c/master/renesas-i3c.c b/drivers/i3c/master/renesas-i3c.c
index 6c23f956ad2a..d2f29ed0b6ed 100644
--- a/drivers/i3c/master/renesas-i3c.c
+++ b/drivers/i3c/master/renesas-i3c.c
@@ -1434,17 +1434,17 @@ static int renesas_i3c_resume_noirq(struct device *dev)
 	struct renesas_i3c *i3c = dev_get_drvdata(dev);
 	int i, ret;
 
-	ret = reset_control_deassert(i3c->presetn);
+	ret = reset_control_deassert(i3c->tresetn);
 	if (ret)
 		return ret;
 
-	ret = reset_control_deassert(i3c->tresetn);
+	ret = reset_control_deassert(i3c->presetn);
 	if (ret)
-		goto err_presetn;
+		goto err_tresetn;
 
 	ret = clk_bulk_enable(i3c->num_clks, i3c->clks);
 	if (ret)
-		goto err_tresetn;
+		goto err_presetn;
 
 	/* Re-store I3C registers value. */
 	renesas_writel(i3c->regs, STDBR, i3c->i3c_STDBR);
@@ -1465,10 +1465,10 @@ static int renesas_i3c_resume_noirq(struct device *dev)
 
 	return 0;
 
-err_tresetn:
-	reset_control_assert(i3c->tresetn);
 err_presetn:
 	reset_control_assert(i3c->presetn);
+err_tresetn:
+	reset_control_assert(i3c->tresetn);
 	return ret;
 }
 
-- 
2.43.0


