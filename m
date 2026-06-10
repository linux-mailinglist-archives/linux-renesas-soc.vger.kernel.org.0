Return-Path: <linux-renesas-soc+bounces-33812-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 63qeAHY9KWpnSwMAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-33812-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 10 Jun 2026 12:33:26 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D175668504
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 10 Jun 2026 12:33:25 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=ragnatech.se header.s=fm3 header.b=Ko1OERML;
	dkim=pass header.d=messagingengine.com header.s=fm1 header.b="k 6h7++K";
	spf=pass (mail.lfdr.de: domain of "linux-renesas-soc+bounces-33812-lists+linux-renesas-soc=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-renesas-soc+bounces-33812-lists+linux-renesas-soc=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=ragnatech.se;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 0BE2733170F7
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 10 Jun 2026 10:26:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6B46E3F6C42;
	Wed, 10 Jun 2026 10:25:59 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from fhigh-b1-smtp.messagingengine.com (fhigh-b1-smtp.messagingengine.com [202.12.124.152])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0249C3F65E0;
	Wed, 10 Jun 2026 10:25:57 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781087159; cv=none; b=dr8GRk0WLvWScOBQ66ZlQhNT55t6TOHt6/xieYTscazm16+1kfl21Wg++dApT3Bi6pRMowT5g94Rq5/KUTENBEHNC/NSQVk0Y2UYruc85Abl6NKC0kVJDlxn5ccmRQ6RXyFOcubhccysyiDlLLnobSmu3yLV7TXTBEBk1BWWbRM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781087159; c=relaxed/simple;
	bh=9LlA6sCZfRlvnAxPRj7hVQbrf4IZFRFVKo0A9kISZNA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=FrEOAXU16Wz/5hRN8uz8GaEBIfaUyw0SXzIonu3fESqTqzpXn7/rcv5ueX16Pgx5H8GgfLRzvrlUTRvgBkqZQKSpnMxlHN2jVBzM2fVc6qfA822sMsLPvaqm4OsnrWRDfFZFt/E0wtt2P0cuzo+avXbBXBlfabzNvqEda2OZAEE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se; spf=pass smtp.mailfrom=ragnatech.se; dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b=Ko1OERML; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=k6h7++Km; arc=none smtp.client-ip=202.12.124.152
Received: from phl-compute-01.internal (phl-compute-01.internal [10.202.2.41])
	by mailfhigh.stl.internal (Postfix) with ESMTP id C713F7A012D;
	Wed, 10 Jun 2026 06:25:56 -0400 (EDT)
Received: from phl-frontend-04 ([10.202.2.163])
  by phl-compute-01.internal (MEProxy); Wed, 10 Jun 2026 06:25:57 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ragnatech.se; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm3; t=1781087156;
	 x=1781173556; bh=hZ1EYdL/dlmAAlFk8IIbz/hiwha+t7IArQc0k+SprSA=; b=
	Ko1OERMLi0jGtf90Sb/Qqq9UMfOoEfVVTr2xenj82tK0xlVejj4fFpyboe5lwA01
	ZOqdhxzC070MgW9xNMvigyQFFW9t1uMkQV6Vt4eJJzXPYeVZ9uVrqWmk9WZwWygn
	TsRWb2Y/aOfUA3mREFR8lbfaMrXq8KMYd0bxs2ePZ/ZbZUzlf+l0alcurpT0G8bx
	fylcjw8/+SWEpNLkfa5jr/B3BzyEIix+7znOkIhn5t+SdfJ45LdR57qlmxgI5lHb
	7ypWVW19YJdpU9RYAe2ALFtTOxF29WpvzDbPgszJCnmqAha7NgKHO3uTb9Z34nCp
	mvF3V0kHL/jTIXJlxio9xQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1781087156; x=
	1781173556; bh=hZ1EYdL/dlmAAlFk8IIbz/hiwha+t7IArQc0k+SprSA=; b=k
	6h7++KmA7xJeayqrUWg7vF5bWqK/zuJMjJHf+6IUsuiQI5EXo2PgztUe49PYdZkf
	JuYUIGQzjvvnKY1usBDsDrpz+3iGegzdDOPJ3KcLLW+pq46Fg9QAUxc+1BmiESwe
	nqazhwkUixs6paQilu27z77TJMMNP80/fOZQm9fbauR8zboXalnwPUZe+o1c1oUA
	wg2R/JWrsmaRMGTqbBXvRTsHihV5iNW8y2fWFEStiuiQ22KPAIszfu3Ep134pENu
	3Rqo9IdzGF7Bgd1OtNPuKTBM/K7lEZlgNd21x5vXlIT1t2tRRm6Kxe9VVtdUhdMi
	vi8fC/2txTO47P6foe/yA==
X-ME-Sender: <xms:tDspahpvYAI0_kwzNoskbSbC89-jeY8AJE_HxXH1IKlIObSVVDOgNw>
    <xme:tDspasZFATxVX-BKqbMYx5BMe2uVPbow_pYypp29F88ZREnrBmIrJzQbdFd7wqIRh
    82GRlmUrVfv1gf5WiEs2ElCKJBz9muDKLEt8_knopyIjUCvbWnrs7Q>
X-ME-Received: <xmr:tDspas64YQJgoBXdwEnqahl-OyzexAPKN3E-ETdJu-g4VYaVIXt_Pe9n0woW5zIQsl-RASsErGOFm-nf3h8M0wqo52fqol5Wc0ZL>
X-ME-Proxy-Cause: dmFkZTFXMgr/JgA4ynBJRX9iN+D9+8ugfpl4lXVo8oUqYw57cz8PIQWhnFd6TDonAKC4N8
    TSR+YZYZtNU/ONmQ88kKkXK1er0iP16La6NkBU4k7Xp/3fGVcUcaR/iscJgSRZkDHKp74L
    CdL/N/h3kFlB5P/9vgYGDiw9UAKZZ35twVH6HslwM7kWAVtzkF1bZa00l0X+Uo/D80HzCr
    X0Lz0oxEE06jjEMTlqsuQo15ymq9DQqrvaR2nEKtXAlU9BWlPWKYW8NpNp2rFVaqvFbCm4
    SvJLY6Cv49ef2tytoazAWNmGWsyofhKzj4uYWGzSE+JduKcTs6TKRxGj3sB0ZujeupROSl
    4HvPTO08Ean6cjOS+xknjHN1AJTQW3YDBs9eT+T/SbVn261K0ZVqHET193pi0d1oLaLAfl
    zDNGPLPEElW69S1blHANYf0ssfiRsc+dbeL9GKxCsW5wJL0kjzjBlW7JOMGZXK7evUKwr4
    JVR3yZPeEjl1cwgMT2fvqFKWLNdwOajDmg1yAk/3RlwUKM5JwPkg9KVrLPzqTBopHQPSVW
    I/rSz47o15e5sTqEYBfUERy8w8TtmixmIT7Zy3JwaHLQB6aPpfwsnBEQ5lRMEi+kik0iHT
    G4lWHycrFRbfGtWfAEkEnEtYinXToLaYNbdeah5FqDXwJWvMCJs5HtvAxo1Q
X-ME-Proxy: <xmx:tDspavRapzNO6WltfQkDCkp-FQDHeXeDkSpbvHHwRIho-DcxHAJ1JQ>
    <xmx:tDspakuxn2b1KGk01L5DKBiL_zVFEcINfbOXuKMCvxAnwMGnxDNAWg>
    <xmx:tDspapaVYqrrD1ARcLrz2TQaXlWiA2DqQc3GpQqsbTJ1ThZuGcvpgA>
    <xmx:tDspam9-TC6GXNjTIdoDc8M9kpsXIP17AfdGuctdUF1JSSHNE_J9GA>
    <xmx:tDspaquE1SG0fDHvP7uwR5BPH2aAn8EFxHG87mUrG7NK8H984rt5zoj2>
Feedback-ID: i80c9496c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 10 Jun 2026 06:25:56 -0400 (EDT)
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
Subject: [net-next 4/9] net: ethernet: ravb: Remove redundant argument to ravb_ptp_init()
Date: Wed, 10 Jun 2026 12:24:27 +0200
Message-ID: <20260610102432.3538432-5-niklas.soderlund+renesas@ragnatech.se>
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
	TAGGED_FROM(0.00)[bounces-33812-lists,linux-renesas-soc=lfdr.de,renesas];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,vger.kernel.org:from_smtp,messagingengine.com:dkim,ragnatech.se:dkim,ragnatech.se:email,ragnatech.se:mid,ragnatech.se:from_mime]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 4D175668504

There is no need to explicitly pass the struct platform_device pointer
to ravb_ptp_init(), it can retrieve it directly from the private data
structure.

Signed-off-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
---
 drivers/net/ethernet/renesas/ravb.h      | 2 +-
 drivers/net/ethernet/renesas/ravb_main.c | 4 ++--
 drivers/net/ethernet/renesas/ravb_ptp.c  | 4 ++--
 3 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/net/ethernet/renesas/ravb.h b/drivers/net/ethernet/renesas/ravb.h
index 5e56ec9b1013..013ced6dcf29 100644
--- a/drivers/net/ethernet/renesas/ravb.h
+++ b/drivers/net/ethernet/renesas/ravb.h
@@ -1160,7 +1160,7 @@ void ravb_modify(struct net_device *ndev, enum ravb_reg reg, u32 clear,
 int ravb_wait(struct net_device *ndev, enum ravb_reg reg, u32 mask, u32 value);
 
 void ravb_ptp_interrupt(struct net_device *ndev);
-void ravb_ptp_init(struct net_device *ndev, struct platform_device *pdev);
+void ravb_ptp_init(struct net_device *ndev);
 void ravb_ptp_stop(struct net_device *ndev);
 
 #endif	/* #ifndef __RAVB_H__ */
diff --git a/drivers/net/ethernet/renesas/ravb_main.c b/drivers/net/ethernet/renesas/ravb_main.c
index dff66a347baf..b3cc4c79b29f 100644
--- a/drivers/net/ethernet/renesas/ravb_main.c
+++ b/drivers/net/ethernet/renesas/ravb_main.c
@@ -713,7 +713,7 @@ static int ravb_dmac_init(struct net_device *ndev)
 
 	/* Initialise PTP Clock driver */
 	if (info->gptp)
-		ravb_ptp_init(ndev, priv->pdev);
+		ravb_ptp_init(ndev);
 
 	return 0;
 }
@@ -1968,7 +1968,7 @@ static int ravb_open(struct net_device *ndev)
 
 	/* Initialise PTP Clock driver */
 	if (info->ccc_gac)
-		ravb_ptp_init(ndev, priv->pdev);
+		ravb_ptp_init(ndev);
 
 	/* PHY control start */
 	error = ravb_phy_start(ndev);
diff --git a/drivers/net/ethernet/renesas/ravb_ptp.c b/drivers/net/ethernet/renesas/ravb_ptp.c
index 7c78f75cb284..1c9b33d1b8b9 100644
--- a/drivers/net/ethernet/renesas/ravb_ptp.c
+++ b/drivers/net/ethernet/renesas/ravb_ptp.c
@@ -312,7 +312,7 @@ void ravb_ptp_interrupt(struct net_device *ndev)
 	ravb_write(ndev, ~(gis | GIS_RESERVED), GIS);
 }
 
-void ravb_ptp_init(struct net_device *ndev, struct platform_device *pdev)
+void ravb_ptp_init(struct net_device *ndev)
 {
 	struct ravb_private *priv = netdev_priv(ndev);
 	unsigned long flags;
@@ -336,7 +336,7 @@ void ravb_ptp_init(struct net_device *ndev, struct platform_device *pdev)
 	ravb_modify(ndev, GCCR, GCCR_TCSS, GCCR_TCSS_ADJGPTP);
 	spin_unlock_irqrestore(&priv->lock, flags);
 
-	priv->ptp.clock = ptp_clock_register(&priv->ptp.info, &pdev->dev);
+	priv->ptp.clock = ptp_clock_register(&priv->ptp.info, &priv->pdev->dev);
 }
 
 void ravb_ptp_stop(struct net_device *ndev)
-- 
2.54.0


