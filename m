Return-Path: <linux-renesas-soc+bounces-33809-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 0eQSKE88KWoZSwMAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-33809-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 10 Jun 2026 12:28:31 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 1283E668430
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 10 Jun 2026 12:28:31 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=ragnatech.se header.s=fm3 header.b=21fhzstV;
	dkim=pass header.d=messagingengine.com header.s=fm1 header.b="F MVWnfJ";
	spf=pass (mail.lfdr.de: domain of "linux-renesas-soc+bounces-33809-lists+linux-renesas-soc=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-renesas-soc+bounces-33809-lists+linux-renesas-soc=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=ragnatech.se;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 9AAEB30E4CF8
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 10 Jun 2026 10:25:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5F2353F23A6;
	Wed, 10 Jun 2026 10:25:51 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from fout-b2-smtp.messagingengine.com (fout-b2-smtp.messagingengine.com [202.12.124.145])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E2FE12E7391;
	Wed, 10 Jun 2026 10:25:48 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781087150; cv=none; b=T8xKyaUkEiJj7kOy3trzi1BI72iZ3AlLC8lkSF/wVTNdnAZrxVmzn7f0151rrtrk1cJDKkEp5QfajvoTJ6yvE9+p6dK57KLJo4tMD7L0n/ZczVieU0wxmfzRJ4JozQbouzkpn7FXiFnguTPdXRXZk/9Yg408pNPbzqIMQ3i8gqY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781087150; c=relaxed/simple;
	bh=oX5BbV4IA5VtIuaY4V4jV1Z7lUBoCENJkyeMDCdExhY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=q+WLFENC6cpg2xOo4c81bOF9bwzUXA7VF8qfbDsoibSfQjTw6gT8zNQc9w7uKImLLByZVokVr2+sL1m1pvlLiijb/80Vu1hM1LnI06bWxUqop2NZjaiJ2qMFzcjCYePOBK3AYtLJshmQDLaAXGw0sunZWQj+/k9eRcwVuNvCQLs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se; spf=pass smtp.mailfrom=ragnatech.se; dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b=21fhzstV; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=FMVWnfJT; arc=none smtp.client-ip=202.12.124.145
Received: from phl-compute-01.internal (phl-compute-01.internal [10.202.2.41])
	by mailfout.stl.internal (Postfix) with ESMTP id D7A081D00160;
	Wed, 10 Jun 2026 06:25:47 -0400 (EDT)
Received: from phl-frontend-03 ([10.202.2.162])
  by phl-compute-01.internal (MEProxy); Wed, 10 Jun 2026 06:25:48 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ragnatech.se; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm3; t=1781087147;
	 x=1781173547; bh=ua+MsSfJ1nq7xIj6IRwVYByuyNZmqWGOfAM4XPEugRU=; b=
	21fhzstVTlOp2AL7nxGOfK1eLofFN5zUnufa7gM/libcKNE2Bg/JWMFX+/Gzz5z1
	jSUmhKdEdZfXJqwvP7LvrsKsMtlH6hjgP8Ug6Lq9xM/HZo9JKHeSBX7W2TRsi0i5
	5JBvGX46tmBiS75yGjG0bTF5AHelSacqvLgvrRazfPNsN+3265vv39GtGXhexvh6
	gGRpK07l0or7vXpf3Sgkh6O+nuR/28jbCU4sw+jIwBCKpeA9hNPY0qThdOOAA3Uc
	KwOQx6657XDa0oB8TZWtafjo8jGuSJ1wEKZttljCwsltfR0q2vh6Sa1w/+WYpsIn
	NG0JfjMWwwp9+nt5nRNIpA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1781087147; x=
	1781173547; bh=ua+MsSfJ1nq7xIj6IRwVYByuyNZmqWGOfAM4XPEugRU=; b=F
	MVWnfJTfa2jnTsBpbVgCODED3HfyMnusOkgsOlppBfiTAg0MQVlhytaCGuLWori7
	bhrVHdGXQdRwdc80JrXGDm1oAiXceudckwQqiwcw085esFCbm8VA/3c2vY1wLgRd
	6rH+mvz9EgoRAm7lhoahpdEm065VyPfxLA7cJm9b6yEBNkluf5uhI7gcQa1rNOGR
	ZmSVp4SO+oCZ6G2D4atmc0eaidJvNRDkcHuGQS5qU+j/93RYVtfEJC1x1l2ZQg6z
	mlXVnSu7OzBhdJKId/sLS4JJYoKGdmR+f/IwdmsJpPrgr9dZJi4CKal4tirW6o2u
	peRoGUdkoIZzrdw0+rEew==
X-ME-Sender: <xms:qzspaprCdepDgLpKHOHUi2AJTH3tOMGPqjr2cH8ElMLVzN_h8D35vw>
    <xme:qzspahJXkd0MHgXhfVVmUg7o9b_iuZacKcAsh2PFVUGwG9VDBCnJi3yR0lXcz1VYM
    FxoeUHrRsLCd3X2lpcEx9qOtez8HKPQ8UnMUyK-cpaoJKp8uAKWFKc>
X-ME-Received: <xmr:qzspaujVzi1v-oASCBenUvQBM-o78yzuPKoP2EC2qbkeQnoZA2eJg0aPagR-TmnFQZLiVXrl4iimUZxH-59zJqd11-cHqfSgPtGD>
X-ME-Proxy-Cause: dmFkZTFUwBTAUIylSDRD/bGl3yGNPD5wJUQnT81UZNe+JWC4FSEgQz4+ANh4fEW2zKTIoI
    KS7kHZjnKpn2CDNJXxmj8ahqhyJ2du6WpXcqG6Yq6P++8nSoW9JAJGyxHIXi6N8QSW0geK
    1OZvtGnj+h4ATXCfV2pJ2bZsJDjK6Cix0kxNFXywfE7yc0I65o7ExBMR85T8XCN47RVqSD
    LBERs5pG2HpNha3RvhFhoCbr7PP+UTxjZRZ32lcxKRHfYWjqTzQA2PjK1twkTT/x75VYM8
    gKt36IwzoDgjN6gLHKb+CCgPd3hqulw0xEPnF/pYbqrzUvQzHhb++BLhMMq5XHTNgDTqj6
    VrdyZrHUpqyTB2VzyvR0w75qZhN1EFSgNw2yNu3uEEKPn3eNjfaIyoUogbaeTxry+1GK6a
    9mSFZzrocU+6yVpsQYU+u/nXjkaVcgPdlyRKtadT5bvsiNT3oG+mOn7CoGMzSJI7KGyfpV
    EKCnWQScFkzvlD++D/4i5ZeQFybumXTyNgQOwW5EA9OpMJBExERdvFFWgdTJmx9fpNqK/P
    XPaIXzommbPf8ZGnUKvd5W5xnJTNcJPG7TKNiKQcDqvWHV8WTlqp7X1IhtNxqQ2PcGKFVU
    34apiqRuHeQG3L+mwxci5hIWtniQ8xcyk97LvXI/5I3f+JnPArTY6bcaiPNw
X-ME-Proxy: <xmx:qzspai9D1lJR2PBQBD2uyw-GkH54iPmm809WRwvEtSkZSgN9_H8V1g>
    <xmx:qzspaqqL4Xo1D-HKIfzyUCXS91J2GEOVLbc6xWvnGGY5xfT1ENTFKQ>
    <xmx:qzspavM84TcjsA_nM9WNfGTUdUfq_6BqsuP73nitZiPO09WoFkTPNA>
    <xmx:qzspag6jkCbtQOa1hvg5dNUpCdgj0ph_v4JMjQ1cDIxY1tyF2Tj7Yw>
    <xmx:qzspahsIQr0zF4P68LQc2rJKUVPSFAxXifTs-QGyqIeWFR2wa2EP1Pfc>
Feedback-ID: i80c9496c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 10 Jun 2026 06:25:46 -0400 (EDT)
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
Subject: [net-next 1/9] net: ethernet: ravb: Remove gPTP control from WoL setup and restore
Date: Wed, 10 Jun 2026 12:24:24 +0200
Message-ID: <20260610102432.3538432-2-niklas.soderlund+renesas@ragnatech.se>
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
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-33809-lists,linux-renesas-soc=lfdr.de,renesas];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[18];
	FORWARDED(0.00)[lists@lfdr.de];
	FREEMAIL_TO(0.00)[pbarker.dev,lunn.ch,davemloft.net,google.com,kernel.org,redhat.com,gmail.com,glider.be,vger.kernel.org];
	FORGED_RECIPIENTS(0.00)[m:paul@pbarker.dev,m:andrew+netdev@lunn.ch,m:davem@davemloft.net,m:edumazet@google.com,m:kuba@kernel.org,m:pabeni@redhat.com,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:richardcochran@gmail.com,m:geert+renesas@glider.be,m:magnus.damm@gmail.com,m:sergei.shtylyov@gmail.com,m:netdev@vger.kernel.org,m:linux-renesas-soc@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:niklas.soderlund+renesas@ragnatech.se,m:andrew@lunn.ch,m:krzk@kernel.org,m:conor@kernel.org,m:geert@glider.be,m:magnusdamm@gmail.com,m:sergeishtylyov@gmail.com,m:niklas.soderlund@ragnatech.se,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[niklas.soderlund@ragnatech.se,linux-renesas-soc@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,ragnatech.se:dkim,ragnatech.se:email,ragnatech.se:mid,ragnatech.se:from_mime,messagingengine.com:dkim]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 1283E668430

Since commit a6a85ba36fd0 ("net: ravb: Move PTP initialization in the
driver's ndo_open API for ccc_gac platorms") the gPTP clock (if
supported) is stopped and started by opening and closing the ndev.

This makes the special case to stop and start it when resuming from WoL
redundant. As the ndev will always be closed and re-opened when
suspending and resuming the system.

Signed-off-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
---
 drivers/net/ethernet/renesas/ravb_main.c | 6 ------
 1 file changed, 6 deletions(-)

diff --git a/drivers/net/ethernet/renesas/ravb_main.c b/drivers/net/ethernet/renesas/ravb_main.c
index 5f88733094d0..77c0645a1c4d 100644
--- a/drivers/net/ethernet/renesas/ravb_main.c
+++ b/drivers/net/ethernet/renesas/ravb_main.c
@@ -3179,9 +3179,6 @@ static int ravb_wol_setup(struct net_device *ndev)
 	/* Enable MagicPacket */
 	ravb_modify(ndev, ECMR, ECMR_MPDE, ECMR_MPDE);
 
-	if (priv->info->ccc_gac)
-		ravb_ptp_stop(ndev);
-
 	return enable_irq_wake(priv->emac_irq);
 }
 
@@ -3201,9 +3198,6 @@ static int ravb_wol_restore(struct net_device *ndev)
 	if (error)
 		return error;
 
-	if (priv->info->ccc_gac)
-		ravb_ptp_init(ndev, priv->pdev);
-
 	if (info->nc_queues)
 		napi_enable(&priv->napi[RAVB_NC]);
 	napi_enable(&priv->napi[RAVB_BE]);
-- 
2.54.0


