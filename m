Return-Path: <linux-renesas-soc+bounces-27755-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id KKP8CrGdf2lXugIAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-27755-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Sun, 01 Feb 2026 19:38:41 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 8049DC6F5F
	for <lists+linux-renesas-soc@lfdr.de>; Sun, 01 Feb 2026 19:38:40 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id EE7493006B47
	for <lists+linux-renesas-soc@lfdr.de>; Sun,  1 Feb 2026 18:38:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3D8F92882A6;
	Sun,  1 Feb 2026 18:38:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b="gjaHoWXT";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="W4fKY8jz"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from fhigh-b2-smtp.messagingengine.com (fhigh-b2-smtp.messagingengine.com [202.12.124.153])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 979C227FB3A;
	Sun,  1 Feb 2026 18:38:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.12.124.153
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769971108; cv=none; b=Lc4FME8I56ivqELTjSOteDIeUgVbGL/fKQfPsT3VAukhxqk+Pd0lypBcNgzNMao4jMgiwyzNZhlWb7DIjL4Bj4sd/yWedvZsvSNCFfvUq/RxF/t4GLTySwv84lToVQiCbpgMsHDtKK6FrArub0CVERqhrPdI8qLHY4qejnbjqXw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769971108; c=relaxed/simple;
	bh=JfBkML2AgdDVyfkefeFvG3MHpjJITeLgfdb04D2uKRQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Mvq2xlXYgGUFVeUlTO827PlponIuqOBSke35Ht13bZ8PjvfekMcoMPJoANqeag3rqVmImugJt4BhiJuGOWVTJGoWoZxOWXHRiIAmcbS/IyGBG9+iCGfkszoU2znNlWbdQXD3m1M3xUVUkKjoVIte/OnJ8kLVzD8APYI6vAlOqho=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se; spf=pass smtp.mailfrom=ragnatech.se; dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b=gjaHoWXT; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=W4fKY8jz; arc=none smtp.client-ip=202.12.124.153
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ragnatech.se
Received: from phl-compute-02.internal (phl-compute-02.internal [10.202.2.42])
	by mailfhigh.stl.internal (Postfix) with ESMTP id A4AAC7A0011;
	Sun,  1 Feb 2026 13:38:25 -0500 (EST)
Received: from phl-frontend-03 ([10.202.2.162])
  by phl-compute-02.internal (MEProxy); Sun, 01 Feb 2026 13:38:26 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ragnatech.se; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm2; t=1769971105;
	 x=1770057505; bh=k5/GpHCV8U33PzxC24BqihY/BnFkjJqY9hu2i4fKqmU=; b=
	gjaHoWXT9X6cpL6vwLUZQ6dSO6Bs4dHbVhIGVdtQdwYQXWjadRJleSpvfbcYDv5O
	uM0FCI3YdO0w+F7a07Auy33a8JAfNRY0vALkdxEJ1d5I/Jkrrigf0baTnVa7MyN7
	tKONxobFtCbpwvjInNFcP8931rmXZrqXe2x8J6NLgjVMJMCILDsYW73FdvT7H3UQ
	XVOdfZVF289uu5+pKemyGzgOHroxUhjkEX8NWiDl8npZtkq8vShMeGWrVlODM5MN
	qs0w2THX5xcQQdlwgxKaM/SUevLgbKaqWNKK2Chz1947YVars7Wmyj9DuMvZ7Y11
	LCF0YVjMcl8IKEsMNNI5FA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1769971105; x=
	1770057505; bh=k5/GpHCV8U33PzxC24BqihY/BnFkjJqY9hu2i4fKqmU=; b=W
	4fKY8jzuph3ZZFMr2wOV7gcoiMzbR5MDRIuD8F7F/AAwqdf6RZ0Hv8LRcj9iRVsJ
	3Q6B/hwn38P3sz1voeQZXgQbQKokFVV+cWlxFXW2C8KeIcmLUbUlJkI7SBw7pTfG
	25zAV4WK3Gno3f4NQNoRsXdcyj+rePjvULIoXuvA30F+KPlVFX8w1ClJ0E8qGLiD
	I50X9hK6RkznGo9IZKoP4kPHKI7rm7FcCMxLygGSDKVdxRdjNq+SQn3+26Qvtb2C
	wIU3TJ7XLfWHl9siK8K0hCjs3AES2zEKli1tzldp4DEMckbUjqnEK02+0SX7dao8
	yi5wXD7QOJ/1LhvAPmRmQ==
X-ME-Sender: <xms:oZ1_aVOpYH_w9mgCF7GzY9TwPtadjKs18Hl_Xn5xFp_0CAPNNyZ7zg>
    <xme:oZ1_aZjnelkappJEFZG4NFJhgsDrAigbj5-ngQ1bzJHDFk6Ms5vqU4L-MTvAck6L8
    9NqxnPhCeqR0sRWU6EnLY5mK6avqgvCEYjg3_cGXrYSqhx1tE0psA>
X-ME-Received: <xmr:oZ1_aTjCERzwxaimuN3mR3hH6zlUzSiLzvjIyeACxgz0VVrg0uSoksOQnLQEe5Y4xnTfuWhAtd9cWJ46f9vTIDp7>
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
X-ME-Proxy: <xmx:oZ1_aYLTrK5jIQz9jz2ornFvh7HkLz1kgQD2NHwSETYHKhlqhbnPkA>
    <xmx:oZ1_aSnoDSdo2lCoFWrSMfCZO7put6yI-o4mNcfKg53KdZ7Oj1u3kg>
    <xmx:oZ1_aQMutwXamIFESlcTo07NpKgB8H2QE8pdEo_BwANu29ESHEmXqg>
    <xmx:oZ1_ac5qCYQ0IWVBStilDqdLKimqAf2vfOrASW20tF-o6dcvDC8Wfg>
    <xmx:oZ1_aYhv389Doz-4Hrp01ChFRh3F8QE6f-QoKv4ZGiTpDq044mG7wiCp>
Feedback-ID: i80c9496c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sun,
 1 Feb 2026 13:38:24 -0500 (EST)
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
Subject: [net-next 1/4] net: ethernet: renesas: rcar_gen4_ptp: Move address assignment
Date: Sun,  1 Feb 2026 19:37:42 +0100
Message-ID: <20260201183745.1075399-2-niklas.soderlund+renesas@ragnatech.se>
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
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-27755-lists,linux-renesas-soc=lfdr.de,renesas];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_TO(0.00)[renesas.com,lunn.ch,davemloft.net,google.com,kernel.org,redhat.com,glider.be,gmail.com,vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[12];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[ragnatech.se:+,messagingengine.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[niklas.soderlund@ragnatech.se,linux-renesas-soc@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-renesas-soc,netdev,renesas];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 8049DC6F5F
X-Rspamd-Action: no action

Instead of accessing the Gen4 PTP specific structure directly in drivers
move the device address assignment into the preparation call. This is
done in preparation to completely hide the Gen4 PTP specific structure
from users.

Signed-off-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
---
 drivers/net/ethernet/renesas/rcar_gen4_ptp.c |  5 ++++-
 drivers/net/ethernet/renesas/rcar_gen4_ptp.h |  3 ++-
 drivers/net/ethernet/renesas/rswitch_main.c  |  9 ++++-----
 drivers/net/ethernet/renesas/rtsn.c          | 19 ++++++++++---------
 4 files changed, 20 insertions(+), 16 deletions(-)

diff --git a/drivers/net/ethernet/renesas/rcar_gen4_ptp.c b/drivers/net/ethernet/renesas/rcar_gen4_ptp.c
index d0979abd36de..3fd835128cc8 100644
--- a/drivers/net/ethernet/renesas/rcar_gen4_ptp.c
+++ b/drivers/net/ethernet/renesas/rcar_gen4_ptp.c
@@ -168,7 +168,8 @@ int rcar_gen4_ptp_unregister(struct rcar_gen4_ptp_private *ptp_priv)
 }
 EXPORT_SYMBOL_GPL(rcar_gen4_ptp_unregister);
 
-struct rcar_gen4_ptp_private *rcar_gen4_ptp_alloc(struct platform_device *pdev)
+struct rcar_gen4_ptp_private *rcar_gen4_ptp_alloc(struct platform_device *pdev,
+						  void __iomem *addr)
 {
 	struct rcar_gen4_ptp_private *ptp;
 
@@ -178,6 +179,8 @@ struct rcar_gen4_ptp_private *rcar_gen4_ptp_alloc(struct platform_device *pdev)
 
 	ptp->info = rcar_gen4_ptp_info;
 
+	ptp->addr = addr;
+
 	return ptp;
 }
 EXPORT_SYMBOL_GPL(rcar_gen4_ptp_alloc);
diff --git a/drivers/net/ethernet/renesas/rcar_gen4_ptp.h b/drivers/net/ethernet/renesas/rcar_gen4_ptp.h
index 9a9c232c854e..b71aba873795 100644
--- a/drivers/net/ethernet/renesas/rcar_gen4_ptp.h
+++ b/drivers/net/ethernet/renesas/rcar_gen4_ptp.h
@@ -20,6 +20,7 @@ struct rcar_gen4_ptp_private {
 
 int rcar_gen4_ptp_register(struct rcar_gen4_ptp_private *ptp_priv, u32 rate);
 int rcar_gen4_ptp_unregister(struct rcar_gen4_ptp_private *ptp_priv);
-struct rcar_gen4_ptp_private *rcar_gen4_ptp_alloc(struct platform_device *pdev);
+struct rcar_gen4_ptp_private *rcar_gen4_ptp_alloc(struct platform_device *pdev,
+						  void __iomem *addr);
 
 #endif	/* #ifndef __RCAR_GEN4_PTP_H__ */
diff --git a/drivers/net/ethernet/renesas/rswitch_main.c b/drivers/net/ethernet/renesas/rswitch_main.c
index e14b21148f27..ab0b40d4f4fb 100644
--- a/drivers/net/ethernet/renesas/rswitch_main.c
+++ b/drivers/net/ethernet/renesas/rswitch_main.c
@@ -2150,17 +2150,16 @@ static int renesas_eth_sw_probe(struct platform_device *pdev)
 	if (attr)
 		priv->etha_no_runtime_change = true;
 
-	priv->ptp_priv = rcar_gen4_ptp_alloc(pdev);
-	if (!priv->ptp_priv)
-		return -ENOMEM;
-
 	platform_set_drvdata(pdev, priv);
 	priv->pdev = pdev;
 	priv->addr = devm_ioremap_resource(&pdev->dev, res);
 	if (IS_ERR(priv->addr))
 		return PTR_ERR(priv->addr);
 
-	priv->ptp_priv->addr = priv->addr + RSWITCH_GPTP_OFFSET_S4;
+	priv->ptp_priv =
+		rcar_gen4_ptp_alloc(pdev, priv->addr + RSWITCH_GPTP_OFFSET_S4);
+	if (!priv->ptp_priv)
+		return -ENOMEM;
 
 	ret = dma_set_mask_and_coherent(&pdev->dev, DMA_BIT_MASK(40));
 	if (ret < 0) {
diff --git a/drivers/net/ethernet/renesas/rtsn.c b/drivers/net/ethernet/renesas/rtsn.c
index fdb1e7b7fb06..d4b955c87f1b 100644
--- a/drivers/net/ethernet/renesas/rtsn.c
+++ b/drivers/net/ethernet/renesas/rtsn.c
@@ -1227,6 +1227,7 @@ static int rtsn_probe(struct platform_device *pdev)
 {
 	struct rtsn_private *priv;
 	struct net_device *ndev;
+	void __iomem *ptpaddr;
 	struct resource *res;
 	int ret;
 
@@ -1239,12 +1240,6 @@ static int rtsn_probe(struct platform_device *pdev)
 	priv->pdev = pdev;
 	priv->ndev = ndev;
 
-	priv->ptp_priv = rcar_gen4_ptp_alloc(pdev);
-	if (!priv->ptp_priv) {
-		ret = -ENOMEM;
-		goto error_free;
-	}
-
 	spin_lock_init(&priv->lock);
 	platform_set_drvdata(pdev, priv);
 
@@ -1288,9 +1283,15 @@ static int rtsn_probe(struct platform_device *pdev)
 		goto error_free;
 	}
 
-	priv->ptp_priv->addr = devm_ioremap_resource(&pdev->dev, res);
-	if (IS_ERR(priv->ptp_priv->addr)) {
-		ret = PTR_ERR(priv->ptp_priv->addr);
+	ptpaddr = devm_ioremap_resource(&pdev->dev, res);
+	if (IS_ERR(ptpaddr)) {
+		ret = PTR_ERR(ptpaddr);
+		goto error_free;
+	}
+
+	priv->ptp_priv = rcar_gen4_ptp_alloc(pdev, ptpaddr);
+	if (!priv->ptp_priv) {
+		ret = -ENOMEM;
 		goto error_free;
 	}
 
-- 
2.52.0


