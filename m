Return-Path: <linux-renesas-soc+bounces-33708-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id PJ7bNLUjJ2oQsgIAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-33708-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 08 Jun 2026 22:19:01 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E90D65A5D5
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 08 Jun 2026 22:19:01 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=CYlgAbpe;
	spf=pass (mail.lfdr.de: domain of "linux-renesas-soc+bounces-33708-lists+linux-renesas-soc=lfdr.de@vger.kernel.org" designates 172.232.135.74 as permitted sender) smtp.mailfrom="linux-renesas-soc+bounces-33708-lists+linux-renesas-soc=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 6899F305BB60
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  8 Jun 2026 20:17:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B8A0A3ECBCF;
	Mon,  8 Jun 2026 20:16:44 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A0C803ED124;
	Mon,  8 Jun 2026 20:16:41 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780949804; cv=none; b=HY9/USIGgEEmWwvVKMwd3mBsBsCbSmHEA2GKCf7I1Kdo3H2R+z/apQGEMI8Et/cYvVqJJJYuioXR4yX6poO3Qnhn5mYjz1Ul+ZI7iy+ugqN7H/HMoqnk4Fr73kQXtUOo5M4/zL8Xo0UMJJ2diJ5iVrLHFVFvkKYNwjTd+iyxKG8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780949804; c=relaxed/simple;
	bh=B0eN8qck19HYNg4ngTDGX8MKsNaymMnqZpcjL8CDQW4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=kLvPEsm+HxilIvwmOFfGmboszprUAXdAZDTjQDPyKE5pJOPeut5CIUf0jBsU+lOlm2vpPUAJ1JsbWsoBgpoi9aFcdOJZksqedLYBjthROnC4GP3VxxunZQSGWbulYpX1nvLIsrAhm3/5c6Zun3dE/LkV5Il3hLzhdfYUgTHf+pA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=CYlgAbpe; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8B80C1F00893;
	Mon,  8 Jun 2026 20:16:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780949801;
	bh=V8FpqfK6BrNGzXwyagk5netU9fKT6/4/WWtxZJz6REo=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=CYlgAbpewYwlBMRSlX7tg2SrLooa/aacJJE/A67/cjnmG5ZZZaW1Tri6up6oMtYLs
	 V/qOjlIffVMoeVbfJG8R9Jp4Hx72clhGZXGL1y4Xp6yhAcFFCOBR76IYrcX5rnL3DU
	 CuK8CgJ07dqX7lO5qEuUz8uJY874Z3+phDY1EMfqW4neRWxeXCNXLGHzzCHsWjbYoI
	 ZwO3n5s78gx9qfm5zq8wvPERAIfEiIwpSeKkcv+3Pz58IdcUMmeHlz4rgk76mJxc35
	 WBiCSU+d+hjemN5l2aAZeo7CaciFZt57J5+D1pcCSM8vU5PlsbJvkHM6zexZEcetr5
	 8/trAzQRZhaeA==
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
Subject: [PATCH v3 16/17] i3c: renesas: Drop unnecessary tab
Date: Mon,  8 Jun 2026 23:15:42 +0300
Message-ID: <20260608201543.804902-17-claudiu.beznea@kernel.org>
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
	TAGGED_FROM(0.00)[bounces-33708-lists,linux-renesas-soc=lfdr.de];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo,nxp.com:email,vger.kernel.org:from_smtp,renesas.com:email]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 6E90D65A5D5

From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>

Remove an unnecessary tab to make the code cleaner.

Reviewed-by: Frank Li <Frank.Li@nxp.com>
Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
---

Changes in v3:
- none

Changes in v2:
- collected tags

 drivers/i3c/master/renesas-i3c.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/i3c/master/renesas-i3c.c b/drivers/i3c/master/renesas-i3c.c
index 6572934a1837..b6c282c53a54 100644
--- a/drivers/i3c/master/renesas-i3c.c
+++ b/drivers/i3c/master/renesas-i3c.c
@@ -109,7 +109,7 @@
 #define  NCMDQP_DATA_LENGTH(x)	FIELD_PREP(GENMASK(31, 16), x)
 
 #define NRSPQP			0x154 /* Normal Respone Queue */
-#define  NRSPQP_NO_ERROR			0
+#define  NRSPQP_NO_ERROR		0
 #define  NRSPQP_ERROR_CRC		1
 #define  NRSPQP_ERROR_PARITY		2
 #define  NRSPQP_ERROR_FRAME		3
-- 
2.43.0


