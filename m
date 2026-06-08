Return-Path: <linux-renesas-soc+bounces-33699-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id QRr0HhskJ2oosgIAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-33699-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 08 Jun 2026 22:20:43 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id B6D2765A610
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 08 Jun 2026 22:20:42 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=bWQ2Vg+G;
	spf=pass (mail.lfdr.de: domain of "linux-renesas-soc+bounces-33699-lists+linux-renesas-soc=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-renesas-soc+bounces-33699-lists+linux-renesas-soc=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id B164F301BCDF
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  8 Jun 2026 20:16:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8F248390209;
	Mon,  8 Jun 2026 20:16:15 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 841AC38B14F;
	Mon,  8 Jun 2026 20:16:14 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780949775; cv=none; b=DxTj0tNhqDjp/25XHV01okhaWfxYpP5iDPmjFmHVpSZwbs05MY15VZCEuQ+IGileZiw7IFOIn06maR0V4Ow4X71uyzCxbDa7dBeT0TwQjgVdQfQ/EBMiHKkwyNtKvnmwQDHVHorxmuGi/MYT8RRFdyvqPHT5UI5n7di+shlAGis=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780949775; c=relaxed/simple;
	bh=F7+VLOuaMWo8EvvGw83SJRc1YwDFoUylLAalUeJ204k=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=m2a62Jvbd3tNFpmgKOA3agXWe2YEAeG+aketfslRpnAaHM5HXiv/7LmpxkZSpGSTxggst0BnauL4wvGm+DOZV3BY+HhRESfjMjCT7zgdx7qCs6fuTjz6sDHvKJEHJDqWPVC5sDxAvHLJbtZhwvUt0S8R0wg6nMgVAtP2kHq06a8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=bWQ2Vg+G; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7ED711F00898;
	Mon,  8 Jun 2026 20:16:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780949774;
	bh=8DwEabUQb8wfXA2VVFyZQt03TK3VL48HZ/2mhSICwYs=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=bWQ2Vg+GQo6IGi4Ux9QGzdDfiG9aeON13wDRgcpLM+Tzo9y3eRD/mh/zroZSUz4gB
	 xit8vFr6PU+ig0GFZKebCNJhcFfNiJmm+T0k+C0OZqq+VsyuxT0hCqt5PxBwKIMYo/
	 klWM/mzsBVL6Ap3xb/rREUJcB9jFeqm3q9YrNPckdvXxRDmk2xKRcKH1ORojaOQDXT
	 u4+D11UrJL1ynY84AHkg5orqrzvwCFoLRWFm4t/1hsFsucc/girvfknoZTddZYXRk9
	 r5sTmXMuq2kHvN+rm4CGDM/r5PNOOv19rofan1dneQ1+EUqPW8PR6OmEyMevuvLq/e
	 w+zPWvuobuOKw==
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
Subject: [PATCH v3 07/17] i3c: renesas: Do not attach devices if xfer failed
Date: Mon,  8 Jun 2026 23:15:33 +0300
Message-ID: <20260608201543.804902-8-claudiu.beznea@kernel.org>
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
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[4];
	TAGGED_FROM(0.00)[bounces-33699-lists,linux-renesas-soc=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[12];
	FORWARDED(0.00)[lists@lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER(0.00)[claudiu.beznea@kernel.org,linux-renesas-soc@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:wsa+renesas@sang-engineering.com,m:tommaso.merciai.xr@bp.renesas.com,m:alexandre.belloni@bootlin.com,m:Frank.Li@nxp.com,m:p.zabel@pengutronix.de,m:claudiu.beznea@kernel.org,m:claudiu.beznea@tuxon.dev,m:linux-i3c@lists.infradead.org,m:linux-kernel@vger.kernel.org,m:linux-renesas-soc@vger.kernel.org,m:claudiu.beznea.uj@bp.renesas.com,m:stable@vger.kernel.org,m:wsa@sang-engineering.com,s:lists@lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[claudiu.beznea@kernel.org,linux-renesas-soc@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,vger.kernel.org:from_smtp,renesas.com:email]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: B6D2765A610

From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>

The controller may return an NRSPQP_ERROR_* error code while still
providing a valid cmd->rx_count. It has been observed that when the
transfer fails with NRSPQP_ERROR_ADDRESS_NACK, calling
i3c_master_add_i3c_dev_locked() may lead to crashes. Set newdevs to zero
if the transfer failed.

Fixes: e7218986319b ("i3c: renesas: Add suspend/resume support")
Cc: stable@vger.kernel.org
Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
---

Changes in v3:
- none

Changes in v2:
- none, this patch is new

 drivers/i3c/master/renesas-i3c.c | 13 +++++++++----
 1 file changed, 9 insertions(+), 4 deletions(-)

diff --git a/drivers/i3c/master/renesas-i3c.c b/drivers/i3c/master/renesas-i3c.c
index c475d30a84c7..f96848022c45 100644
--- a/drivers/i3c/master/renesas-i3c.c
+++ b/drivers/i3c/master/renesas-i3c.c
@@ -780,10 +780,15 @@ static int renesas_i3c_daa(struct i3c_master_controller *m)
 
 	renesas_i3c_wait_xfer(i3c, xfer);
 
-	newdevs = GENMASK(i3c->maxdevs - cmd->rx_count - 1, first_i3c_pos);
-	/* Re-attach all the I3C devices on resume. */
-	if (!i3c->resuming)
-		newdevs &= ~olddevs;
+	/* Skip attaching if there are failures on the xfer. */
+	if (xfer->ret) {
+		newdevs = 0;
+	} else {
+		newdevs = GENMASK(i3c->maxdevs - cmd->rx_count - 1, first_i3c_pos);
+		/* Re-attach all the I3C devices on resume. */
+		if (!i3c->resuming)
+			newdevs &= ~olddevs;
+	}
 
 	for (pos = 0; pos < i3c->maxdevs; pos++) {
 		if (!(newdevs & BIT(pos)))
-- 
2.43.0


