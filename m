Return-Path: <linux-renesas-soc+bounces-32939-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id QKFfMrUwEGoaUwYAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-32939-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 22 May 2026 12:32:21 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 659C65B2285
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 22 May 2026 12:32:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 4A9CE301A53D
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 22 May 2026 10:21:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D7EEF3D9041;
	Fri, 22 May 2026 10:18:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="kL2sobK5"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A9B2C3D7D72;
	Fri, 22 May 2026 10:18:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779445129; cv=none; b=IkKm+8u0N3kwErQmttJMEZpkY+GCABW+bNsj6nK4YKzGlz00PlmkAszGrF3LKZAsWVb8MSEq32XtFHwNm6zD59I19hhHDIDylMGUaQoZoebf8oHoIfCr8bsYKTP6aA6gj4t1RhbSqR0wqf5pSGxvkTMg5cGSekutnlwoDLV5+hA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779445129; c=relaxed/simple;
	bh=2iSupFAJn6WtJHhPNlyOKraCP+YkbuT+aBwKAfdYoO4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=rqBmStDtnELNgMoxKh5SAena3/WmfV72PF+ayhZNB1FTvntjzw89Dkl8uFe1ngjDh4Z6PKHR9eGMFY3mWT1G9i6RgJbr1SdjeOM99z2o9LY3jMpjKjnYmwsuVPM5gVRYSaT9bmVrt2D2HPnOVtiGlxEgM8mqJ5iHSjRyg/DePmk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=kL2sobK5; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7AAD01F00A3F;
	Fri, 22 May 2026 10:18:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779445128;
	bh=gzq0ouywBIfZI5tPxbNKr6btyYhJQupzX9OFQUpjMEA=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=kL2sobK5lJAlo1wLEv7GhhZOjTum5UKgAf4kPF2BqNxNkVJBNNf73k5ZRQfeEKwhB
	 x48WIGgCgUJOyyDf9J8xHNVhnuzwr/LpZcItr1gso0FSw5/DVfavBsgsffYMYdo708
	 3G1y25zKZtwZXig/VtT0BPwxRJGEMslArTaPCFmTVmMkyCAH0qjJPEUMwkQjCuTHjo
	 aDNDqNRR1Uhdya6+fRYXaB2Hite02GC5JksBNTE8R0lE8tcQ7+tojEn1M+zgeP1AB3
	 uR1L2/FLa5i+X3F0qInxYRCqUeSu71m6Rj4Odrtr46auHH/OqGEPI13dn8FJ6eVah6
	 E0a/zDvzOBWzg==
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
Subject: [PATCH 08/17] i3c: renesas: Clean DATBAS register on detach
Date: Fri, 22 May 2026 13:18:06 +0300
Message-ID: <20260522101815.1722909-9-claudiu.beznea@kernel.org>
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
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCPT_COUNT_TWELVE(0.00)[12];
	TAGGED_FROM(0.00)[bounces-32939-lists,linux-renesas-soc=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	FROM_HAS_DN(0.00)[]
X-Rspamd-Queue-Id: 659C65B2285
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>

The controller uses DATBAS registers on TX/RX logic. Clean the DATBAS
register for the detached I3C device to avoid issues.

Fixes: d028219a9f14 ("i3c: master: Add basic driver for the Renesas I3C controller")
Cc: stable@vger.kernel.org
Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
---
 drivers/i3c/master/renesas-i3c.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/i3c/master/renesas-i3c.c b/drivers/i3c/master/renesas-i3c.c
index c009d0de6a2b..d32646deb69f 100644
--- a/drivers/i3c/master/renesas-i3c.c
+++ b/drivers/i3c/master/renesas-i3c.c
@@ -922,6 +922,8 @@ static void renesas_i3c_detach_i3c_dev(struct i3c_dev_desc *dev)
 	struct i3c_master_controller *m = i3c_dev_get_master(dev);
 	struct renesas_i3c *i3c = to_renesas_i3c(m);
 
+	renesas_writel(i3c->regs, DATBAS(data->index), 0);
+
 	i3c_dev_set_master_data(dev, NULL);
 	i3c->addrs[data->index] = 0;
 	i3c->free_pos |= BIT(data->index);
-- 
2.43.0


