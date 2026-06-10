Return-Path: <linux-renesas-soc+bounces-33810-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id qYJNL109KWpeSwMAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-33810-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 10 Jun 2026 12:33:01 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 1EA496684EB
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 10 Jun 2026 12:33:01 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=ragnatech.se header.s=fm3 header.b=4sLYPGZo;
	dkim=pass header.d=messagingengine.com header.s=fm1 header.b="V Y7r8Fl";
	spf=pass (mail.lfdr.de: domain of "linux-renesas-soc+bounces-33810-lists+linux-renesas-soc=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-renesas-soc+bounces-33810-lists+linux-renesas-soc=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=ragnatech.se;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id E090C31A77C9
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 10 Jun 2026 10:26:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 19E423EDABA;
	Wed, 10 Jun 2026 10:25:56 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from fout-b2-smtp.messagingengine.com (fout-b2-smtp.messagingengine.com [202.12.124.145])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5EB5432FA14;
	Wed, 10 Jun 2026 10:25:52 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781087155; cv=none; b=D/NJvsApHEs4IwS85HUhQU21t7+GEn4iuuFktkYi8guOqfdy+We1RSpjmTqvml98IejXPRBY0L1vrURL48/wxBs5ENaKm+ylQMMAUm45Vq7Wy6DXbDAmXb7IHU3RXWfDcosd3kJnTEwfVsWvJ7VIt4hHAqi3WyYb4fef9VQDyYc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781087155; c=relaxed/simple;
	bh=dGDAacSZqmDzr3YuQ+GKDZ/YQHpHA5/Z81Cnm81nIHQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=cLkxd3fYImlP2reJmActDHdT9jaEMeOmxVrys4L9MU4A7xh+YSLJ4PBTtWhVQZpO9e7Xoh5CvxuT8hJ/0VG+KVv3jY/0TJnMaOwND9rM9JucL4U5cussErE/ylo2WNIfbgFWRcTJK11R444I5CTwkSxWoRaq4VHzzWL8xdUgHnU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se; spf=pass smtp.mailfrom=ragnatech.se; dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b=4sLYPGZo; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=VY7r8FlG; arc=none smtp.client-ip=202.12.124.145
Received: from phl-compute-04.internal (phl-compute-04.internal [10.202.2.44])
	by mailfout.stl.internal (Postfix) with ESMTP id 27A7B1D00166;
	Wed, 10 Jun 2026 06:25:51 -0400 (EDT)
Received: from phl-frontend-04 ([10.202.2.163])
  by phl-compute-04.internal (MEProxy); Wed, 10 Jun 2026 06:25:51 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ragnatech.se; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm3; t=1781087150;
	 x=1781173550; bh=HcfVgY8wyiIVOQKBn4qOeoGcsM7ocIEmk9cDhg8Fj4k=; b=
	4sLYPGZo/mySBdA+q02PliJrZvipJXSE3y90EK1Le0K2z9PdUIYKGnDA+aE+gNp6
	v2vAiAgbUyTUsGPU4wr88Irja00NmP2ZZAzjQsukk2fbV6ymHRx7IsufuS11wNo1
	myX5N38F/v+w4faNp7LGwr02fKCVZiExUlKaYx699ooLlBqSs757n6/b8SDkZYPr
	YDrhPoPCB0uIEnirTBjWf6Y/2nhzZOznaX5iWn0VVzNbrI/jZohV45/e+4PwBc1K
	61rtiOLdMtk2b8XAWRHQ67R+Z3neSASvG9SABWbgtRHRno0aEEim3KbVRxReYxgW
	EkEVXJQqGE3JXPgumsXeKA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1781087150; x=
	1781173550; bh=HcfVgY8wyiIVOQKBn4qOeoGcsM7ocIEmk9cDhg8Fj4k=; b=V
	Y7r8FlGc2pPXEUENZy2C+dk1BApVrxoD/f7HBmxvMxPDzbfRZxTgHWIgXicytEBs
	Y/CP+TalBbA/JFD0GzGJn+xUm5dQCorCyFogQd9EyJKmGIX8IOR6gGKjBo9xkaRp
	Jp5zrlqpQgXen/ujtdW6O7HeXg/GxHE/8REbmiK/HnGVsshz+QUX480O8QXThhow
	BIp7EEXzuda3Zb/PNfzQdkg+QDOwricjRyccc31Tnd3mhbh20JpClTF8FwJSs+Ap
	5JWBlLOEPzVurR2hBZHQ3VolthSU0XP7khF8V+fOe3qbd4ikR5Ak6EhiPTgbXp+2
	JXm5f79JdxdLHnvnwBwRw==
X-ME-Sender: <xms:rjspau9zBnE71eVODWde5rIY9NH9eYPIUIQw5LldZ8aSmx3MmZfnoA>
    <xme:rjspaneyZKtINT9NifF4GjAnl-oys_LvR3hoU-JkTTUBInWS618_3hj2ZxlsrtVgY
    FYA_meUcm7yl8nQxZi8Eyl9Bu8bxC76u9gxFgefk_fsmbd2d0-C90w>
X-ME-Received: <xmr:rjspaisGinTDNSXtmGSIjWuBLMjObe9RwwijT6169l75Pv3UZNPFO21oIVUwI2Q8052fApP7xv8js4AGcodrkzI2I-VQCfodjjEc>
X-ME-Proxy-Cause: dmFkZTFzW/9QC37+C6pwAAlXRd22xN1zZvcc/aAYAEwmptBJoj74pNle0sv90UFUXVEIti
    m/TXBT+b8ycbCA1jm9rERPhV+Sd31MD/WlXbDoX2JxJ6Qv3usROBzpqj+DMyB1kKqVTYhc
    ERrKwWnQn26VjQHRxqzZ5oyvFIdUu/m9ZbtCSBnC0yE5o4SheBShzr78hZy32NuJ02IClx
    2fjEQdCvSSwLCZ+LxOJyqORJx8sf3SzR5RGPDrf5gSBOpzDZG5+nsOhfU7EJdvxDaR7H5h
    t1uEJLRS6QuLEP2ODphkYB/MqLCGLB4Ov2Ubd82pulimvPp1Y+jqrHUs5VrX2+WppgMaBl
    1qnCTwj+tlimB5ejeF3LQR5cLZTv5usq+QCrEISADLc8oFXVUzPXbcVVmyhAUasqxYPVQY
    lQgzLokIkj1Gec+K+Dpn4+7jn07b8oTRi+oZ6iR2nEmM4zas1XlvO4dri6e9DfASMtLLf0
    kylR20/mrk5QgH7hwVGIQjfeyCMoXQXwYXvxaNO5GTDUONeKy/I8GKhFHs6wywoUL1uz/2
    lXLFTZW+pt++mXqiRxVoVzSzUWjd7F+IrObZ54buyHQ/DNXOQtK1FCcn6YMBXsjB9z/5oq
    IXI0gEL7pDFrpDb3LpUfBY9cusi86eL4rjWPBunux5nJJnPdQ+4D0PgFHcQg
X-ME-Proxy: <xmx:rjspao3ZDfyXJADwQEmMLDJ9nuIrWd2u-f0p6wpdceABGpKi18Vh0A>
    <xmx:rjspanAODTNK5C9sV1iv7PsgfC1aIFkLGIFXAtbphYQPxRpoG6gqrg>
    <xmx:rjspald8vuqUZO2tsWdxfk-lVBR1pTPdHtAEC4vgYVAksZA9J8MPDw>
    <xmx:rjspapwkqz6z5ar1yfZamGFuR7V9BvECMTAJoPCB6Ju8l-z4d8NQVw>
    <xmx:rjspalivAkqPYZ9mtcFIekqRWxCpBBOUbPTp0XYE1bpk8PgxdfrHZ3fc>
Feedback-ID: i80c9496c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 10 Jun 2026 06:25:50 -0400 (EDT)
From: =?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>
To: Paul Barker <paul@pbarker.dev>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Richard Cochran <richardcochran@gmail.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	Sergei Shtylyov <sergei.shtylyov@gmail.com>,
	netdev@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: =?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>
Subject: [net-next 2/9] net: ethernet: ravb: Move programming of gPTP timer interval
Date: Wed, 10 Jun 2026 12:24:25 +0200
Message-ID: <20260610102432.3538432-3-niklas.soderlund+renesas@ragnatech.se>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260610102432.3538432-1-niklas.soderlund+renesas@ragnatech.se>
References: <20260610102432.3538432-1-niklas.soderlund+renesas@ragnatech.se>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[ragnatech.se,none];
	R_DKIM_ALLOW(-0.20)[ragnatech.se:s=fm3,messagingengine.com:s=fm1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-33810-lists,linux-renesas-soc=lfdr.de,renesas];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[18];
	FORWARDED(0.00)[lists@lfdr.de];
	FREEMAIL_TO(0.00)[pbarker.dev,lunn.ch,davemloft.net,google.com,kernel.org,redhat.com,gmail.com,glider.be,vger.kernel.org];
	FORGED_RECIPIENTS(0.00)[m:paul@pbarker.dev,m:andrew+netdev@lunn.ch,m:davem@davemloft.net,m:edumazet@google.com,m:kuba@kernel.org,m:pabeni@redhat.com,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:richardcochran@gmail.com,m:geert+renesas@glider.be,m:magnus.damm@gmail.com,m:sergei.shtylyov@gmail.com,m:netdev@vger.kernel.org,m:linux-renesas-soc@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:niklas.soderlund+renesas@ragnatech.se,m:andrew@lunn.ch,m:krzk@kernel.org,m:conor@kernel.org,m:geert@glider.be,m:magnusdamm@gmail.com,m:sergeishtylyov@gmail.com,m:niklas.soderlund@ragnatech.se,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[niklas.soderlund@ragnatech.se,linux-renesas-soc@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[niklas.soderlund@ragnatech.se,linux-renesas-soc@vger.kernel.org];
	DKIM_TRACE(0.00)[ragnatech.se:+,messagingengine.com:+];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TO_DN_SOME(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-renesas-soc,netdev,dt,renesas];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,messagingengine.com:dkim,ragnatech.se:dkim,ragnatech.se:email,ragnatech.se:mid,ragnatech.se:from_mime]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 1EA496684EB

Commit f384ab481cab ("net: ravb: Split GTI computation and set
operations") broke apart the operations of computing the timer interval
and programming of it. However it kept the programming of the interval
in the RAVB main logic.

Having split the two apart this can be improved further by moving the
programming to the gPTP initialization function, as the first action of
the gPTP init function is to wait for the timer interval programming to
be acknowledge by the hardware.

As an added bonus the interaction with the gPTP registers for the
programming can then also be done while holding the gPTP registers lock.

Signed-off-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
---
 drivers/net/ethernet/renesas/ravb_main.c | 16 ----------------
 drivers/net/ethernet/renesas/ravb_ptp.c  | 11 ++++++++++-
 2 files changed, 10 insertions(+), 17 deletions(-)

diff --git a/drivers/net/ethernet/renesas/ravb_main.c b/drivers/net/ethernet/renesas/ravb_main.c
index 77c0645a1c4d..dc2fbbeff895 100644
--- a/drivers/net/ethernet/renesas/ravb_main.c
+++ b/drivers/net/ethernet/renesas/ravb_main.c
@@ -1846,20 +1846,6 @@ static int ravb_set_config_mode(struct net_device *ndev)
 	return error;
 }
 
-static void ravb_set_gti(struct net_device *ndev)
-{
-	struct ravb_private *priv = netdev_priv(ndev);
-	const struct ravb_hw_info *info = priv->info;
-
-	if (!(info->gptp || info->ccc_gac))
-		return;
-
-	ravb_write(ndev, priv->gti_tiv, GTI);
-
-	/* Request GTI loading */
-	ravb_modify(ndev, GCCR, GCCR_LTI, GCCR_LTI);
-}
-
 static int ravb_compute_gti(struct net_device *ndev)
 {
 	struct ravb_private *priv = netdev_priv(ndev);
@@ -1974,8 +1960,6 @@ static int ravb_open(struct net_device *ndev)
 
 	ravb_emac_init(ndev);
 
-	ravb_set_gti(ndev);
-
 	/* Initialise PTP Clock driver */
 	if (info->gptp || info->ccc_gac)
 		ravb_ptp_init(ndev, priv->pdev);
diff --git a/drivers/net/ethernet/renesas/ravb_ptp.c b/drivers/net/ethernet/renesas/ravb_ptp.c
index 226c6c0ab945..7c78f75cb284 100644
--- a/drivers/net/ethernet/renesas/ravb_ptp.c
+++ b/drivers/net/ethernet/renesas/ravb_ptp.c
@@ -319,11 +319,20 @@ void ravb_ptp_init(struct net_device *ndev, struct platform_device *pdev)
 
 	priv->ptp.info = ravb_ptp_info;
 
-	priv->ptp.default_addend = ravb_read(ndev, GTI);
+	priv->ptp.default_addend = priv->gti_tiv;
 	priv->ptp.current_addend = priv->ptp.default_addend;
 
 	spin_lock_irqsave(&priv->lock, flags);
+
+	/* Set gPTP Timer Increment Value. */
+	ravb_write(ndev, priv->ptp.default_addend, GTI);
+
+	/* Request GTI loading. */
+	ravb_modify(ndev, GCCR, GCCR_LTI, GCCR_LTI);
+
+	/* Wait for GIT loading to complete. */
 	ravb_wait(ndev, GCCR, GCCR_TCR, GCCR_TCR_NOREQ);
+
 	ravb_modify(ndev, GCCR, GCCR_TCSS, GCCR_TCSS_ADJGPTP);
 	spin_unlock_irqrestore(&priv->lock, flags);
 
-- 
2.54.0


