Return-Path: <linux-renesas-soc+bounces-32941-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 6HlhMsE0EGqqUwYAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-32941-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 22 May 2026 12:49:37 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id D35315B2751
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 22 May 2026 12:49:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 24FA1304CD40
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 22 May 2026 10:21:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 14EB93DB970;
	Fri, 22 May 2026 10:18:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="XNlWY6OP"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D86D13DCD83;
	Fri, 22 May 2026 10:18:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779445136; cv=none; b=YAlsMfsLGCUdl7M8PXIpysKDD25HnoFjppAOCDMIkpG70puJ8ZomBPKwsqXI0Lqj1taTIUpyY4xqqOEDwEs/b6n9Cd59bYFbQCDTtQplrvWTuNmBtpOEdHPTU2ipnCBZu2vRbXApSc2665Lr1Pp5cLicEiwwRV0EniSnKwp//Fw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779445136; c=relaxed/simple;
	bh=bI5bHCRByTJMdedcq3DjLgbMIjC2BqnDoVFxqNcm2EU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=cYwd2PGOMr0+L9glU+Xa6m+B29UDBB7fZ72uSGC0RLMcLWQiC8I+VwnYzERFx5gC/v85Y1kqD/ojESA2i4ZJVcFh2B0VvmSRQwQhCyR7KkJKuTKVy+R9SU7WWMwuo47D25GNLIxkpgGvcRI8XoV9Q9zXp4cUVV3rA0VzBDLjfFg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=XNlWY6OP; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 29D721F00A3D;
	Fri, 22 May 2026 10:18:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779445134;
	bh=ZjMZYfPSJO9ZQMhgvudeE6rW/MiN6FXWJF5z9WaCh7o=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=XNlWY6OPjVIBWhlFjQsA+z8YLFRh1Fle3nuYY28u9LrXGkBpfkuTMWsBRXPqrra31
	 cMAGTiIbbccR8PJncjGOkQs3IlqhDUo3d0yTPD6tm7dR0KKrLFtGVzHfjXayZ49/mF
	 VapJF0cTUwC4IbuQg+9xlSyW0HZbf4TWv3wYCxQD/cuLL2NDHDOPQK1Jj0nBCbXLnu
	 NEkTIsc7mxPJpo5631Q9arSaJrYgtrrPyXQdW7rwdVd9DT0rDH5Ee8Ur0VMrBi4j1w
	 H/dbdFOyJB5K+T/18UOuOXolBqxAZ59qyyOIvxxCMWOiuwkk3R5Ccb6n3w88OSmF2w
	 WmfT7nqlpP8iQ==
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
Subject: [PATCH 10/17] i3c: renesas: Return immediately if there is nothing to transfer
Date: Fri, 22 May 2026 13:18:08 +0300
Message-ID: <20260522101815.1722909-11-claudiu.beznea@kernel.org>
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
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-32941-lists,linux-renesas-soc=lfdr.de];
	DKIM_TRACE(0.00)[kernel.org:+];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[claudiu.beznea@kernel.org,linux-renesas-soc@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.995];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[renesas.com:email,sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo]
X-Rspamd-Queue-Id: D35315B2751
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>

There is no need to allocate a transfer structure when i2c_nxfers is zero.
Return immediately instead of unnecessarily allocating memory.

Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
---
 drivers/i3c/master/renesas-i3c.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/i3c/master/renesas-i3c.c b/drivers/i3c/master/renesas-i3c.c
index e5963270d6e5..de75125eb013 100644
--- a/drivers/i3c/master/renesas-i3c.c
+++ b/drivers/i3c/master/renesas-i3c.c
@@ -940,13 +940,13 @@ static int renesas_i3c_i2c_xfers(struct i2c_dev_desc *dev,
 	u8 start_bit = CNDCTL_STCND;
 	int i;
 
+	if (!i2c_nxfers)
+		return 0;
+
 	struct renesas_i3c_xfer *xfer __free(kfree) = renesas_i3c_alloc_xfer(i3c, 1);
 	if (!xfer)
 		return -ENOMEM;
 
-	if (!i2c_nxfers)
-		return 0;
-
 	renesas_i3c_bus_enable(m, false);
 
 	init_completion(&xfer->comp);
-- 
2.43.0


