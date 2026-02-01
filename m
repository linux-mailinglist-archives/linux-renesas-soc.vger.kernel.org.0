Return-Path: <linux-renesas-soc+bounces-27757-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id qJwgO9Sdf2lWugIAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-27757-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Sun, 01 Feb 2026 19:39:16 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 56E67C6F84
	for <lists+linux-renesas-soc@lfdr.de>; Sun, 01 Feb 2026 19:39:16 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 334CD300678F
	for <lists+linux-renesas-soc@lfdr.de>; Sun,  1 Feb 2026 18:38:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7A8B127FB3A;
	Sun,  1 Feb 2026 18:38:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b="ddFiRLkC";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="JL+ZNWSF"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from fout-b4-smtp.messagingengine.com (fout-b4-smtp.messagingengine.com [202.12.124.147])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E33426FA6F;
	Sun,  1 Feb 2026 18:38:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.12.124.147
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769971121; cv=none; b=dm4BQ/63s8pnGiCImg73X4f2f9JhfMezaduGTonYBHHpG0wcmWBeGtKcTjkryrT3vMAb+I8CqL/KnLAu/sawUrWXHPBDm0C5avJmFtx1zWPVGJxR8+wcFCn2sErm9XoKs412ReA0zux1/0FuUe9dI8KHDMOu+pzTHSH99VDXm6Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769971121; c=relaxed/simple;
	bh=9xC4ddiaz2baQhSK35zC4D7b5YbBI/DX+B5pzEk+Htg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=SHClPix42BypK6YOBslKBg0uCyeTFvCmkoQrXXC6dCRncs06/poruZwA1VuKGxTkenI3yd4JvZjpTeLbnuBC84A+Bne1b9sgMNDUblpbclGMHh4/+lGyulMV4OrW+VQtMwRpGq5q9AHJ6g+EcKzfMbqpxb0IKRUr7ixgCGW8sbI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se; spf=pass smtp.mailfrom=ragnatech.se; dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b=ddFiRLkC; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=JL+ZNWSF; arc=none smtp.client-ip=202.12.124.147
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ragnatech.se
Received: from phl-compute-07.internal (phl-compute-07.internal [10.202.2.47])
	by mailfout.stl.internal (Postfix) with ESMTP id 2006A1D00031;
	Sun,  1 Feb 2026 13:38:39 -0500 (EST)
Received: from phl-frontend-03 ([10.202.2.162])
  by phl-compute-07.internal (MEProxy); Sun, 01 Feb 2026 13:38:39 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ragnatech.se; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm2; t=1769971118;
	 x=1770057518; bh=H5totn4SEGgoXj5RUME1Y2lEcAablf8qksBAzlHdl40=; b=
	ddFiRLkCdXWvASTKp1k9tWsrkLQ4eIKdbCheJHrmIsdOd4tdlNYDXQa9rJaU/cDH
	PQ7kECmEquVfIdC4WL3PMINHA2MWunaNWWUd+XsVyV5FozX1x3goIoFxgmeam7zh
	fpNCDnuIO0SSjv/3VlAX9IZeppGCwCwX0cQuOSVwG+3OmsbDcq1nzKXgEUKUuHDJ
	irC/dk1Qc/87tMBxGIm7QAEEbgW8/VbMcF8R6ertqTb8t35v2ZdqHxNxfMEXkUx2
	0m9uG9ogSZmt7SKgU0oE5h0JPCIemcp5bl5dMvIbqY2cg2+Gd35lI5A7dEJM21mM
	h5k6i3g3VjEurmLDaw3vLw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1769971118; x=
	1770057518; bh=H5totn4SEGgoXj5RUME1Y2lEcAablf8qksBAzlHdl40=; b=J
	L+ZNWSFIv3Xsf7nH/x2Ef0bkQeL0oo5KyeeqbZqkDBenwmJtCm0c0WPgSwqE+T7S
	Wl5ORCEX7pbQPTuQnfSSxCLexyrAMhTvxklqLcrrJULulhn/GcmXSkYZgUmZ2Nm1
	jd0jYA0X/JMuk983mWsLW6knU8KXGT/BBgPyrp8eB0tRc6lqGdUhwf6EbmGxFPxZ
	SVeRDIRvN6RAo6aA43K+KVJBJiMUn1JWb2KFjIJDsvuzDjihiiPEBRqibC4k51Qd
	jID5gHjjSf78nV0nKibX5i09KQURqUhTFVtGCyGLX/8lvICrxo+L9tu9n7yN6b6e
	QybTmfIQIkN9Fwvh++QVg==
X-ME-Sender: <xms:rp1_aZtIlF254bvyn-risV7hwKlGj3h4BfSVmi2CjSmQbXu03QQwFg>
    <xme:rp1_aUBp8JyyUuEYq-XAM8OSgSUw9n32pmYHK_l2IZvotpP2-bS1A-6L3mXbBJZtt
    NEZsf0jgFPvbsReHop7TWLOi_704NntDAzqjOTKmlcLfihjlQuy>
X-ME-Received: <xmr:rp1_acDmdp4hhTSTEZsw3MyJOwVSXdMHLULmXcpp8ETmTGGjIQhFKcs_aRkF0j94OBIZMzSdlTiYYz8yuJpipUZm>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefgedrtddtgddujeehheefucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceu
    rghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujf
    gurhephffvvefufffkofgjfhggtgfgsehtkeertdertdejnecuhfhrohhmpefpihhklhgr
    shcuufpnuggvrhhluhhnugcuoehnihhklhgrshdrshhouggvrhhluhhnugdorhgvnhgvsh
    grshesrhgrghhnrghtvggthhdrshgvqeenucggtffrrghtthgvrhhnpeehiefgueevuedt
    fefhheegkeevtdelueeukeevfeduhefhhfejfffggeffleefgeenucevlhhushhtvghruf
    hiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehnihhklhgrshdrshhouggvrhhl
    uhhnugesrhgrghhnrghtvggthhdrshgvpdhnsggprhgtphhtthhopeduvddpmhhouggvpe
    hsmhhtphhouhhtpdhrtghpthhtohephihoshhhihhhihhrohdrshhhihhmohgurgdruhhh
    sehrvghnvghsrghsrdgtohhmpdhrtghpthhtoheprghnughrvgifodhnvghtuggvvheslh
    hunhhnrdgthhdprhgtphhtthhopegurghvvghmsegurghvvghmlhhofhhtrdhnvghtpdhr
    tghpthhtohepvgguuhhmrgiivghtsehgohhoghhlvgdrtghomhdprhgtphhtthhopehkuh
    gsrgeskhgvrhhnvghlrdhorhhgpdhrtghpthhtohepphgrsggvnhhisehrvgguhhgrthdr
    tghomhdprhgtphhtthhopehgvggvrhhtodhrvghnvghsrghssehglhhiuggvrhdrsggvpd
    hrtghpthhtohepmhgrghhnuhhsrdgurghmmhesghhmrghilhdrtghomhdprhgtphhtthho
    pehrihgthhgrrhgutghotghhrhgrnhesghhmrghilhdrtghomh
X-ME-Proxy: <xmx:rp1_aWqR76_ZXSt_gUHKqQxU9ZzirH59Uw_1thCUGrYSUuD5PF9AaA>
    <xmx:rp1_afEz9-gGCTlQrHYuu2sUDkLo3VSBQyC3XJ-fKmpDCoaY29eLGw>
    <xmx:rp1_aSsignxJXiy0kPTRrI8kxPJiDAfr6Z7z5jmLi4SbKDMdBeTKXg>
    <xmx:rp1_adZPrzRK-8EYzmTwJMTLOYo-0Vi3scZtiyMuEWgNzfq-HzN7Gg>
    <xmx:rp1_aRCRGG0WT7PpSw_0caJ0Hx76weSPrP14LGMdr5cbNYk05ZJVshaW>
Feedback-ID: i80c9496c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sun,
 1 Feb 2026 13:38:37 -0500 (EST)
From: =?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>
To: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	Richard Cochran <richardcochran@gmail.com>,
	netdev@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org
Cc: =?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>
Subject: [net-next 3/4] net: ethernet: renesas: rcar_gen4_ptp: Add helper to read time
Date: Sun,  1 Feb 2026 19:37:44 +0100
Message-ID: <20260201183745.1075399-4-niklas.soderlund+renesas@ragnatech.se>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260201183745.1075399-1-niklas.soderlund+renesas@ragnatech.se>
References: <20260201183745.1075399-1-niklas.soderlund+renesas@ragnatech.se>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[ragnatech.se,none];
	R_DKIM_ALLOW(-0.20)[ragnatech.se:s=fm2,messagingengine.com:s=fm3];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-27757-lists,linux-renesas-soc=lfdr.de,renesas];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_TO(0.00)[renesas.com,lunn.ch,davemloft.net,google.com,kernel.org,redhat.com,glider.be,gmail.com,vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[12];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[ragnatech.se:+,messagingengine.com:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[niklas.soderlund@ragnatech.se,linux-renesas-soc@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-renesas-soc,netdev,renesas];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[messagingengine.com:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 56E67C6F84
X-Rspamd-Action: no action

Instead of accessing the Gen4 PTP specific structure directly in drivers
add a helper to read the time. This is done in preparation to
completely hide the Gen4 PTP specific structure from users.

Signed-off-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
---
 drivers/net/ethernet/renesas/rcar_gen4_ptp.c | 10 ++++++++++
 drivers/net/ethernet/renesas/rcar_gen4_ptp.h |  2 ++
 drivers/net/ethernet/renesas/rtsn.c          |  9 +--------
 3 files changed, 13 insertions(+), 8 deletions(-)

diff --git a/drivers/net/ethernet/renesas/rcar_gen4_ptp.c b/drivers/net/ethernet/renesas/rcar_gen4_ptp.c
index 75bf7aac089b..a14a16cf5fe6 100644
--- a/drivers/net/ethernet/renesas/rcar_gen4_ptp.c
+++ b/drivers/net/ethernet/renesas/rcar_gen4_ptp.c
@@ -194,6 +194,16 @@ int rcar_gen4_ptp_clock_index(struct rcar_gen4_ptp_private *priv)
 }
 EXPORT_SYMBOL_GPL(rcar_gen4_ptp_clock_index);
 
+void rcar_gen4_ptp_gettime64(struct rcar_gen4_ptp_private *priv,
+			     struct timespec64 *ts)
+{
+	if (!priv->initialized)
+		return;
+
+	priv->info.gettime64(&priv->info, ts);
+}
+EXPORT_SYMBOL_GPL(rcar_gen4_ptp_gettime64);
+
 MODULE_AUTHOR("Yoshihiro Shimoda");
 MODULE_DESCRIPTION("Renesas R-Car Gen4 gPTP driver");
 MODULE_LICENSE("GPL");
diff --git a/drivers/net/ethernet/renesas/rcar_gen4_ptp.h b/drivers/net/ethernet/renesas/rcar_gen4_ptp.h
index c141cd38a40d..fffccda401f5 100644
--- a/drivers/net/ethernet/renesas/rcar_gen4_ptp.h
+++ b/drivers/net/ethernet/renesas/rcar_gen4_ptp.h
@@ -24,5 +24,7 @@ struct rcar_gen4_ptp_private *rcar_gen4_ptp_alloc(struct platform_device *pdev,
 						  void __iomem *addr);
 
 int rcar_gen4_ptp_clock_index(struct rcar_gen4_ptp_private *priv);
+void rcar_gen4_ptp_gettime64(struct rcar_gen4_ptp_private *priv,
+			     struct timespec64 *ts);
 
 #endif	/* #ifndef __RCAR_GEN4_PTP_H__ */
diff --git a/drivers/net/ethernet/renesas/rtsn.c b/drivers/net/ethernet/renesas/rtsn.c
index ce1047743970..85052b47afb9 100644
--- a/drivers/net/ethernet/renesas/rtsn.c
+++ b/drivers/net/ethernet/renesas/rtsn.c
@@ -104,13 +104,6 @@ static void rtsn_ctrl_data_irq(struct rtsn_private *priv, bool enable)
 	}
 }
 
-static void rtsn_get_timestamp(struct rtsn_private *priv, struct timespec64 *ts)
-{
-	struct rcar_gen4_ptp_private *ptp_priv = priv->ptp_priv;
-
-	ptp_priv->info.gettime64(&ptp_priv->info, ts);
-}
-
 static int rtsn_tx_free(struct net_device *ndev, bool free_txed_only)
 {
 	struct rtsn_private *priv = netdev_priv(ndev);
@@ -133,7 +126,7 @@ static int rtsn_tx_free(struct net_device *ndev, bool free_txed_only)
 				struct skb_shared_hwtstamps shhwtstamps;
 				struct timespec64 ts;
 
-				rtsn_get_timestamp(priv, &ts);
+				rcar_gen4_ptp_gettime64(priv->ptp_priv, &ts);
 				memset(&shhwtstamps, 0, sizeof(shhwtstamps));
 				shhwtstamps.hwtstamp = timespec64_to_ktime(ts);
 				skb_tstamp_tx(skb, &shhwtstamps);
-- 
2.52.0


