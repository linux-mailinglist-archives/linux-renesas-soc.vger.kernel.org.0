Return-Path: <linux-renesas-soc+bounces-27756-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id IAg7BrKdf2lWugIAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-27756-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Sun, 01 Feb 2026 19:38:42 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 222E9C6F60
	for <lists+linux-renesas-soc@lfdr.de>; Sun, 01 Feb 2026 19:38:41 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 8CADC3001188
	for <lists+linux-renesas-soc@lfdr.de>; Sun,  1 Feb 2026 18:38:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 77B0C26ED3F;
	Sun,  1 Feb 2026 18:38:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b="N+RlDN9r";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="D0Ks3cH7"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from fhigh-b2-smtp.messagingengine.com (fhigh-b2-smtp.messagingengine.com [202.12.124.153])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0DA171DF25F;
	Sun,  1 Feb 2026 18:38:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.12.124.153
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769971114; cv=none; b=l/+UMTOACZgSOqoH7fbvWKWyLPGVZT43AqhI0Flo17i5XZw8DsrfKcuAUtjpZre22iBRMTum3/JtMRcv2jCp81BksfXXCMHgio0i9EEMhIXqWU3oVi/ouUPeubqtpFMrw33vsOfXmkx/m7oeB2q0+M+Hmzjw2kNVS3ez7Y4CFI0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769971114; c=relaxed/simple;
	bh=gvqGGW7fC6SU/Ao/CJXC0Jyge8VTYznTxgMs+Ul6I1w=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=qvKDbRjcNciY82PkxTvmbF58R+Ud1eZ/y43+XZV9uNhcplqKA0gh1kLrRrcMvM64dUzDvDz3JdMpBlP+6VXHKxxJVr9cWEdGCtu1s8VhjD0CAeSKyDRhLD3crapbnoj62pdYHic6CtjxgHeB1Si3Nu0L6ltfq9bWZSX7etqWrvA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se; spf=pass smtp.mailfrom=ragnatech.se; dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b=N+RlDN9r; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=D0Ks3cH7; arc=none smtp.client-ip=202.12.124.153
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ragnatech.se
Received: from phl-compute-01.internal (phl-compute-01.internal [10.202.2.41])
	by mailfhigh.stl.internal (Postfix) with ESMTP id 59E5F7A0103;
	Sun,  1 Feb 2026 13:38:32 -0500 (EST)
Received: from phl-frontend-04 ([10.202.2.163])
  by phl-compute-01.internal (MEProxy); Sun, 01 Feb 2026 13:38:32 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ragnatech.se; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm2; t=1769971112;
	 x=1770057512; bh=LwEyHGyNlw4yusoCghUK4ee2hZndkTf2hPUTaERABOs=; b=
	N+RlDN9rdZlmBPpCwCf8Pp7GQ8utubXDKLlPz1UqBlwqot7JMb/OwSt3rf6CvqHl
	IPbNfh/C/EPU3lbV6oXu9mDzu9Dm/O/ywY6CWOXvE1UUq6bMIN+SGNGLVjgOShoS
	dXbMUtl1qgHjZv4fesVGZAymYTw2hK5K1RfiU7bGB+x75dMdejc5/N2gy4KlTRrF
	lvNybUftaGV1qGjLofLGH84kdFGYhxIW08DkdC0+ccEsS4LBmhjYKBDAx1KOdIOh
	YucqFZTCuqeaKhsQ4tCEpJPeV+yhkvdF07kzVf17TejGrpZaIWm/r/MGCDGK+kr6
	JDT4aPdYmmadVLyi7pbPmg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1769971112; x=
	1770057512; bh=LwEyHGyNlw4yusoCghUK4ee2hZndkTf2hPUTaERABOs=; b=D
	0Ks3cH74IbPyoGHDjE2HKYW0rQCNl/0Do74X9R0WCnUFIt5N1MAxYyWIWpEsvnP9
	MdHhhqB398LmColJ4wCXWJrImmB3nXB8dlKpAAaoGGpmU92LOl5qjlMZogSkm0VS
	kLKKe9L+JbgmVGb6aQMABVpQycrrIJk3i3dqEyFBtVM/ZkS6nj55OBbg5lFpuaUe
	A2hYbjXNbWmZKizmpqiB7+qb8aiXwK/LurNkZdjVf1TbWtLxeGtDiaUBmnrtlIaA
	20XMt9xRF/NywX+Oa6Ssr2M3/sOsu3V8mARD3TigouE8ectab8VOlxIVbm7dnDge
	nYYRvelbYgMbb+letob9Q==
X-ME-Sender: <xms:p51_aVlGXVo_-1FUQ-skLVOdX_ZvSxquDS1r9QZlkXaaSyHA692bNQ>
    <xme:p51_aSYnpYEQnuAtlsI2WvQC0yws1aP_T6NNLrd-HH6cbOjRH7VQmi8qBUe68cOrd
    xa_cyHVeNhJYUu5y7CH2F6sXspeK_4_beUNtePP4SVDASmEak91wLY>
X-ME-Received: <xmr:p51_aa5lEOZiuELDlTioPnJqagfj7Y2nTnFLPkONAab9yTaxq918bwYTgZHN9ICPXFj5s5yYZ7K1EmZTMphoW81c>
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
X-ME-Proxy: <xmx:p51_acBwvHs0KH43WMzsqG8qDOxsbjcFNnzyj2TTphJJxwmDyYG7yA>
    <xmx:qJ1_aY-PITdMN8aTkRRRofP0gVJ-d96x5cW4bPEMA50ItcAgwaDNMA>
    <xmx:qJ1_aXEYg0wgFiaFVSUHfOZrLbTa-4fEakaZ8b7WY2TQMoihdT0Dyg>
    <xmx:qJ1_aaQP415irAAXJ5g6yop2i4CsskR6hex09E22DXiTlWE70q03DQ>
    <xmx:qJ1_ab5qnx8T1qtahIhBoeqqdDWRegmFOWE-FT90pJq42ZF-_J9vYNzb>
Feedback-ID: i80c9496c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sun,
 1 Feb 2026 13:38:30 -0500 (EST)
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
Subject: [net-next 2/4] net: ethernet: renesas: rcar_gen4_ptp: Add helper to get clock index
Date: Sun,  1 Feb 2026 19:37:43 +0100
Message-ID: <20260201183745.1075399-3-niklas.soderlund+renesas@ragnatech.se>
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
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-27756-lists,linux-renesas-soc=lfdr.de,renesas];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_TO(0.00)[renesas.com,lunn.ch,davemloft.net,google.com,kernel.org,redhat.com,glider.be,gmail.com,vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[12];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[ragnatech.se:+,messagingengine.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[niklas.soderlund@ragnatech.se,linux-renesas-soc@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-renesas-soc,netdev,renesas];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 222E9C6F60
X-Rspamd-Action: no action

Instead of accessing the Gen4 PTP specific structure directly in drivers
add a helper to read the clock index. This is done in preparation to
completely hide the Gen4 PTP specific structure from users.

Signed-off-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
---
 drivers/net/ethernet/renesas/rcar_gen4_ptp.c | 9 +++++++++
 drivers/net/ethernet/renesas/rcar_gen4_ptp.h | 2 ++
 drivers/net/ethernet/renesas/rswitch_main.c  | 2 +-
 drivers/net/ethernet/renesas/rtsn.c          | 2 +-
 4 files changed, 13 insertions(+), 2 deletions(-)

diff --git a/drivers/net/ethernet/renesas/rcar_gen4_ptp.c b/drivers/net/ethernet/renesas/rcar_gen4_ptp.c
index 3fd835128cc8..75bf7aac089b 100644
--- a/drivers/net/ethernet/renesas/rcar_gen4_ptp.c
+++ b/drivers/net/ethernet/renesas/rcar_gen4_ptp.c
@@ -185,6 +185,15 @@ struct rcar_gen4_ptp_private *rcar_gen4_ptp_alloc(struct platform_device *pdev,
 }
 EXPORT_SYMBOL_GPL(rcar_gen4_ptp_alloc);
 
+int rcar_gen4_ptp_clock_index(struct rcar_gen4_ptp_private *priv)
+{
+	if (!priv->initialized)
+		return -1;
+
+	return ptp_clock_index(priv->clock);
+}
+EXPORT_SYMBOL_GPL(rcar_gen4_ptp_clock_index);
+
 MODULE_AUTHOR("Yoshihiro Shimoda");
 MODULE_DESCRIPTION("Renesas R-Car Gen4 gPTP driver");
 MODULE_LICENSE("GPL");
diff --git a/drivers/net/ethernet/renesas/rcar_gen4_ptp.h b/drivers/net/ethernet/renesas/rcar_gen4_ptp.h
index b71aba873795..c141cd38a40d 100644
--- a/drivers/net/ethernet/renesas/rcar_gen4_ptp.h
+++ b/drivers/net/ethernet/renesas/rcar_gen4_ptp.h
@@ -23,4 +23,6 @@ int rcar_gen4_ptp_unregister(struct rcar_gen4_ptp_private *ptp_priv);
 struct rcar_gen4_ptp_private *rcar_gen4_ptp_alloc(struct platform_device *pdev,
 						  void __iomem *addr);
 
+int rcar_gen4_ptp_clock_index(struct rcar_gen4_ptp_private *priv);
+
 #endif	/* #ifndef __RCAR_GEN4_PTP_H__ */
diff --git a/drivers/net/ethernet/renesas/rswitch_main.c b/drivers/net/ethernet/renesas/rswitch_main.c
index ab0b40d4f4fb..433eb2b00d10 100644
--- a/drivers/net/ethernet/renesas/rswitch_main.c
+++ b/drivers/net/ethernet/renesas/rswitch_main.c
@@ -1891,7 +1891,7 @@ static int rswitch_get_ts_info(struct net_device *ndev, struct kernel_ethtool_ts
 {
 	struct rswitch_device *rdev = netdev_priv(ndev);
 
-	info->phc_index = ptp_clock_index(rdev->priv->ptp_priv->clock);
+	info->phc_index = rcar_gen4_ptp_clock_index(rdev->priv->ptp_priv);
 	info->so_timestamping = SOF_TIMESTAMPING_TX_SOFTWARE |
 				SOF_TIMESTAMPING_TX_HARDWARE |
 				SOF_TIMESTAMPING_RX_HARDWARE |
diff --git a/drivers/net/ethernet/renesas/rtsn.c b/drivers/net/ethernet/renesas/rtsn.c
index d4b955c87f1b..ce1047743970 100644
--- a/drivers/net/ethernet/renesas/rtsn.c
+++ b/drivers/net/ethernet/renesas/rtsn.c
@@ -1197,7 +1197,7 @@ static int rtsn_get_ts_info(struct net_device *ndev,
 {
 	struct rtsn_private *priv = netdev_priv(ndev);
 
-	info->phc_index = ptp_clock_index(priv->ptp_priv->clock);
+	info->phc_index = rcar_gen4_ptp_clock_index(priv->ptp_priv);
 	info->so_timestamping = SOF_TIMESTAMPING_TX_SOFTWARE |
 		SOF_TIMESTAMPING_TX_HARDWARE |
 		SOF_TIMESTAMPING_RX_HARDWARE |
-- 
2.52.0


