Return-Path: <linux-renesas-soc+bounces-33704-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 3MjEDsokJ2pQsgIAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-33704-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 08 Jun 2026 22:23:38 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 8528565A675
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 08 Jun 2026 22:23:37 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=YD0hq1WL;
	spf=pass (mail.lfdr.de: domain of "linux-renesas-soc+bounces-33704-lists+linux-renesas-soc=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-renesas-soc+bounces-33704-lists+linux-renesas-soc=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 1A44D30A6E12
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  8 Jun 2026 20:16:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BC9E93E8352;
	Mon,  8 Jun 2026 20:16:30 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C2943E1D1B;
	Mon,  8 Jun 2026 20:16:29 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780949790; cv=none; b=hDJYQWl0NBMcTXD+KnHLx2JECTBgAOx5GykEMQ15zzB3k0VRux7QM81DHWwJKaETar1jkXIA1fZyLcyjgdiXnyMQL/fTMYvifsEFo6RcEOOPheFY2z8rwJoodmLZ4JDxxOqz+ohHW7LpcTtOU6ULlh4ryEooABYghTrkrN/0bEU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780949790; c=relaxed/simple;
	bh=JM3qyHEbJ3ARbM4lDApZJXOiGq97s9PugOa1blKeVR4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=USIbWa4dRkVyDHj4ZNgjkLzi/3n9xYm/87a3aNuHTif0MRlsT+eMF0WCgFsbtgW6m/lweDpipyjyugehqetD+UYLCF6RqRqFFFCcan/Sdun6p0wXoN4Qao7V8Mpv3c8Fw1itcQUtnKfXRtPG/FgJT/aXJDiNKw1+rmH0HfmYJR8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=YD0hq1WL; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B891F1F00893;
	Mon,  8 Jun 2026 20:16:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780949789;
	bh=7IliUUkRt8PSvyKG237cNGfEJgi46uZHPdCs04Y0B90=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=YD0hq1WLI2Vpo65ogL8UokmhD0rd12hy6mh7syS292+QoF8D0Gz3CA51JC3UA6eKj
	 3mwFQE/Cctz3K2EExFVFxU5mEwM8meN31orXRYBCLTas44cBk7FqYsw4/ZMLi5MCU4
	 Nr89wGiF+btH9BMLVA6hp5JFHdyfFb5fQ9i3SWDGyYMat0Ik/BlTdpEXBNWjNeKTKn
	 oY2bA2CR0T6vAntPXqVHItSm9AcDVZsGyvM6TcLo5MOfHmiz6SbErcMfT92I8rDroQ
	 yGmY6d+uvQnH7LQFsAEsQWUepNh5JezdlSFxGof7TEZ6+meJuPoIapvl7FMFJdBlNc
	 MKDcmvaGt7VpA==
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
Subject: [PATCH v3 12/17] i3c: renesas: Drop the explicit memset() call
Date: Mon,  8 Jun 2026 23:15:38 +0300
Message-ID: <20260608201543.804902-13-claudiu.beznea@kernel.org>
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
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	RCVD_COUNT_THREE(0.00)[4];
	TAGGED_FROM(0.00)[bounces-33704-lists,linux-renesas-soc=lfdr.de];
	FORGED_SENDER(0.00)[claudiu.beznea@kernel.org,linux-renesas-soc@vger.kernel.org];
	FORGED_RECIPIENTS(0.00)[m:wsa+renesas@sang-engineering.com,m:tommaso.merciai.xr@bp.renesas.com,m:alexandre.belloni@bootlin.com,m:Frank.Li@nxp.com,m:p.zabel@pengutronix.de,m:claudiu.beznea@kernel.org,m:claudiu.beznea@tuxon.dev,m:linux-i3c@lists.infradead.org,m:linux-kernel@vger.kernel.org,m:linux-renesas-soc@vger.kernel.org,m:claudiu.beznea.uj@bp.renesas.com,m:wsa@sang-engineering.com,s:lists@lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,vger.kernel.org:from_smtp,renesas.com:email,nxp.com:email]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 8528565A675

From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>

Drop the explicit memset() call on struct i3c_device_info object, as it is
already initialized at declaration through compiler initialization.

Reviewed-by: Frank Li <Frank.Li@nxp.com>
Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
---

Changes in v3:
- none

Changes in v2:
- collected tags

 drivers/i3c/master/renesas-i3c.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/i3c/master/renesas-i3c.c b/drivers/i3c/master/renesas-i3c.c
index 4504c6e6db31..dab643cd8859 100644
--- a/drivers/i3c/master/renesas-i3c.c
+++ b/drivers/i3c/master/renesas-i3c.c
@@ -634,7 +634,6 @@ static int renesas_i3c_bus_init(struct i3c_master_controller *m)
 	i3c->dyn_addr = ret;
 	renesas_writel(i3c->regs, MSDVAD, MSDVAD_MDYAD(ret) | MSDVAD_MDYADV);
 
-	memset(&info, 0, sizeof(info));
 	info.dyn_addr = ret;
 	return i3c_master_set_info(&i3c->base, &info);
 }
-- 
2.43.0


