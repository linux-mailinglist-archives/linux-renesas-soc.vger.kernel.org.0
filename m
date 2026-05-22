Return-Path: <linux-renesas-soc+bounces-32933-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id WHKaGEQxEGoaUwYAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-32933-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 22 May 2026 12:34:44 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 6DF545B2348
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 22 May 2026 12:34:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 7CEA23040B2D
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 22 May 2026 10:19:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 19C323D4105;
	Fri, 22 May 2026 10:18:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="HTT4z8x3"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BCEAF3D34A4;
	Fri, 22 May 2026 10:18:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779445110; cv=none; b=tPIeFdN+ZOaOd1qjGtrSCHxNLyLnev0qSXE73w57AIL8fqv2hSBIrQ5Rl40wnjWj+kzAEe4XLmY9BI5x7oQ1SDGWCxTAzEa9sQ8J+xliM11W4KpOXpTGCI8FHnFSuL39xfAj32YXXuMX2H6qLijljstSTmfADIlUVN+JX0MlydE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779445110; c=relaxed/simple;
	bh=f3rUoCjVFnFdGs3Avn7zLRZ0/fuJbOP1xsSePKAp11g=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Xd0G1hnmVngYBdt/sBj+VVJh7lP8q8Yc/g5EndN3a6SfPrx/T5hO1up0DVzobMksEo2KnR6hzeuyw/iHp6QMrxZk7XSxFCBNqFuGd3VlaRPdyc7P0PPAmksdaJqD+PLRNFNJgnrfmmjq1IMgGAgqiwxUXr51U8bI410BWqRTzc4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=HTT4z8x3; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A87531F000E9;
	Fri, 22 May 2026 10:18:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779445108;
	bh=yJQyuEWe74cl7D3825FOdpVlTkubYgooJJWbJo4v/c0=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=HTT4z8x3sSC2eolwDB1V6RrOoK19V9Uc+PgfvGd0yoxZCzFSn9/dzEl4tx1DbCcAz
	 sfD25s4VoLSVdDPxFv5mj/d8XexLzB/Zz4JWP1FA4F9N5QuKqbRXygCTNhcU+u786D
	 QbU+vVCMxTUUPItVG3AqJ/gviB6+rI8YASAWuEdK+9MxUz2SOD+cBzXmSuv17piMZH
	 D/50Bv0lM2DYSpMTYX8UUEaVXLOO2DjR/9QN1adh2E/8F67ikp9JkX/uHuUo7s7qik
	 cOKWN58ZLfy0homMy61Fg/4lFDrU+UWAMztP94FFs4LKBSvsRSdshfQ7LUM7JNEEQb
	 2JnmTE9ABf9fg==
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
Subject: [PATCH 02/17] i3c: renesas: Use the divider 128
Date: Fri, 22 May 2026 13:18:00 +0300
Message-ID: <20260522101815.1722909-3-claudiu.beznea@kernel.org>
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
	TAGGED_FROM(0.00)[bounces-32933-lists,linux-renesas-soc=lfdr.de];
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
X-Rspamd-Queue-Id: 6DF545B2348
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>

The REFCKCTL.IREFCKS field is 3 bits wide, and setting it to 7 selects a
divider of 128 for the internal reference clock. Use this divider value.

Fixes: d028219a9f14 ("i3c: master: Add basic driver for the Renesas I3C controller")
Cc: stable@vger.kernel.org
Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
---
 drivers/i3c/master/renesas-i3c.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/i3c/master/renesas-i3c.c b/drivers/i3c/master/renesas-i3c.c
index 36e3ccbe66b0..1917549cf6d5 100644
--- a/drivers/i3c/master/renesas-i3c.c
+++ b/drivers/i3c/master/renesas-i3c.c
@@ -559,7 +559,7 @@ static int renesas_i3c_bus_init(struct i3c_master_controller *m)
 
 	i2c_parse_fw_timings(&m->dev, &t, true);
 
-	for (cks = 0; cks < 7; cks++) {
+	for (cks = 0; cks <= 7; cks++) {
 		/* SCL low-period calculation in Open-drain mode */
 		od_low_ticks = ((i2c_total_ticks * 6) / 10);
 
-- 
2.43.0


