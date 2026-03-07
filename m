Return-Path: <linux-renesas-soc+bounces-29006-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id NYJxIjL2q2kNigEAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-29006-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Sat, 07 Mar 2026 10:56:02 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id B007822AEB7
	for <lists+linux-renesas-soc@lfdr.de>; Sat, 07 Mar 2026 10:56:01 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 4204B301D946
	for <lists+linux-renesas-soc@lfdr.de>; Sat,  7 Mar 2026 09:56:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F2C3E387363;
	Sat,  7 Mar 2026 09:55:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b="lgvRcWZF";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="hBz5KwyA"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from fhigh-a7-smtp.messagingengine.com (fhigh-a7-smtp.messagingengine.com [103.168.172.158])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 01EAC3815F6;
	Sat,  7 Mar 2026 09:55:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.158
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772877358; cv=none; b=UWhueEpKxwT2IC5cLx4D1iEY+bvC/MlY85zgW7W27xa7ARWItLBJco5X9Nc7fncmTXcvL22thJ8JSsF6hZs7rnk6+xNCfW6P3UmJ8EPUe4sOzxxmnDQlaic7gpLvMLbKIfRmGuPudk4m1QIY4XBDpakn2NjNvREhMsdj7+1lq0k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772877358; c=relaxed/simple;
	bh=Df9GB+6IauF0Rnhzz/Yqto6sGQOVH06v0bqc3v/uO0k=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=pXloQgVP9yrCpa7d4JqytUJGi3WR/uWQ1bhzXepBOoxbZGvgk4Zo8xA1F81D2y1F3qwh62KgWgm7xV69lot43bNAVjf2kxmKwczmWYQO8HmDUdNp+6MK0oEhcz4ZTtbs3iFA9Vx58uGo4YTL9NPy9EJBAuFp97VAkHp0HoKxyrc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se; spf=pass smtp.mailfrom=ragnatech.se; dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b=lgvRcWZF; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=hBz5KwyA; arc=none smtp.client-ip=103.168.172.158
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ragnatech.se
Received: from phl-compute-08.internal (phl-compute-08.internal [10.202.2.48])
	by mailfhigh.phl.internal (Postfix) with ESMTP id 38F3B140019C;
	Sat,  7 Mar 2026 04:55:56 -0500 (EST)
Received: from phl-frontend-04 ([10.202.2.163])
  by phl-compute-08.internal (MEProxy); Sat, 07 Mar 2026 04:55:56 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ragnatech.se; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:message-id:mime-version:reply-to
	:subject:subject:to:to; s=fm3; t=1772877356; x=1772963756; bh=hE
	nNNQ5a6evc6u740wz/gwb2DqYMzUoH08coN9IEFGU=; b=lgvRcWZFrWX8oLfDzP
	gGjPGWsGPXQasyX+/Ak62HF/tupVHygC8skE00WVA7/FGy8bPux9t1YHrfchZvy1
	+199SJzwu3bj/jBoT6HI3MENm1Gcu3p5U9pCgLcXTUNyr+drx8ZGIcch3KJW1end
	P6AGB2rlyVLPIdd04de4kaAMoZAMSBXRt2PZWT6nCIDNQa0zHJYYfGDKFnjT3+rF
	Mlv2Ikry6NTn7LPwq1qdM5TPI2W0z8Tw7pLD9OJ9IWQCFKzKFgSfAU3+eQGs9H9h
	gZ1x1MO0S9N3ubX8jixREpTQs6ziBGrpDCrVuSQfXFVULZRDcUlXjwtoJ3IZFdSC
	WX0A==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:message-id:mime-version:reply-to:subject
	:subject:to:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm1; t=1772877356; x=1772963756; bh=hEnNNQ5a6evc6u740wz/gwb2DqYM
	zUoH08coN9IEFGU=; b=hBz5KwyARnBX7Z5AbzCK8hkGEdMNxhrnrcmVoQPWINae
	Vu72OKhBMhTuLjteAL0eS1jAoGz395pWZeSpzP2jE4O5PQrCp8sbD+o+yTKG4nFR
	ieGQTTH+5M6XT/xOba5YaAlUE3QGoWc2GcPN/y02ohibDfUPqcKMBhW0WzI/Ks1z
	Hjt86DzrkAy6BNzKqsS65pFFMjWaw0Ywq6x6xgxgxF1suhucCUGXjGneopZU1bbU
	LiF+SOx3pUGV9JWG9xX8N4i3xjUWry6NS4sodiViuEREfULAEaH7bEgsby06t2Wf
	4OAu8/j/E2Mnytt3WsjYTNEPcNjr7xdejBFzY3/ZkA==
X-ME-Sender: <xms:K_araQuvAwmHCH-6ZERAwfCH7mHSlVpktQCJ8Oxf1VJcC9IFXMFugw>
    <xme:K_araQhrbj5MM3V2ClPprsk0pRUzDiGwHFoXStvYAOkGP_EjRqgvMjcEm9Xif4J7q
    Dl8YCzJ0zu5EppSFm_KLZkDOE1BgMwrbpS_BcETNPDM887WacjjeOpf>
X-ME-Received: <xmr:K_araWaaqsA9prEYFsLpFub4cAiP-H5Ut36hzpIY8isb__X69y_-mLUQdiBvE_JWpid_Piqibc_y7R74tEAWHP_4ffC9Kec>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefgedrtddtgddvjeduledvucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceu
    rghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujf
    gurhephffvvefufffkofggtgfgsehtkeertdertdejnecuhfhrohhmpefpihhklhgrshcu
    ufpnuggvrhhluhhnugcuoehnihhklhgrshdrshhouggvrhhluhhnugdorhgvnhgvshgrsh
    esrhgrghhnrghtvggthhdrshgvqeenucggtffrrghtthgvrhhnpeehudelteetkefgffef
    udefuedvjeeivdekhfevieefgeffheeltddvvefhfeetgeenucevlhhushhtvghrufhiii
    gvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehnihhklhgrshdrshhouggvrhhluhhn
    ugesrhgrghhnrghtvggthhdrshgvpdhnsggprhgtphhtthhopedutddpmhhouggvpehsmh
    htphhouhhtpdhrtghpthhtohephihoshhhihhhihhrohdrshhhihhmohgurgdruhhhsehr
    vghnvghsrghsrdgtohhmpdhrtghpthhtohepphgruhhlsehpsggrrhhkvghrrdguvghvpd
    hrtghpthhtoheprghnughrvgifodhnvghtuggvvheslhhunhhnrdgthhdprhgtphhtthho
    pegurghvvghmsegurghvvghmlhhofhhtrdhnvghtpdhrtghpthhtohepvgguuhhmrgiivg
    htsehgohhoghhlvgdrtghomhdprhgtphhtthhopehkuhgsrgeskhgvrhhnvghlrdhorhhg
    pdhrtghpthhtohepphgrsggvnhhisehrvgguhhgrthdrtghomhdprhgtphhtthhopehnvg
    htuggvvhesvhhgvghrrdhkvghrnhgvlhdrohhrghdprhgtphhtthhopehlihhnuhigqdhr
    vghnvghsrghsqdhsohgtsehvghgvrhdrkhgvrhhnvghlrdhorhhg
X-ME-Proxy: <xmx:K_arafbYZfJKLBvXQSNp4DTLsFnNSytHQLwkmD7nbIr1wx6Yfbjr-Q>
    <xmx:K_arabzN0qDMfMOKYVmotOUVuoKnqyXKWqMGRnGMd1m8-zpwk2KcMw>
    <xmx:K_arabeRWlLFjOtx-Uhr0CV090iKy2eWomAXtM2s7EC1rQeebOl78Q>
    <xmx:K_araQ43qf-rSo1rbaaFwjIMTRGEkuSIZy5rC-BWXYcEiH6Flrn-Ag>
    <xmx:LParaXIrJT0FLsUdQJBoDrJzq313BExjW0Kr2CnOoJQnxFds2xTfg0qn>
Feedback-ID: i80c9496c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sat,
 7 Mar 2026 04:55:54 -0500 (EST)
From: =?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>
To: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
	Paul Barker <paul@pbarker.dev>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	netdev@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org
Cc: =?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>
Subject: [net-next,v2] net: ethernet: ravb: Disable interrupts when closing device
Date: Sat,  7 Mar 2026 10:55:32 +0100
Message-ID: <20260307095532.2118495-1-niklas.soderlund+renesas@ragnatech.se>
X-Mailer: git-send-email 2.52.0
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: B007822AEB7
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[ragnatech.se,none];
	R_DKIM_ALLOW(-0.20)[ragnatech.se:s=fm3,messagingengine.com:s=fm1];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_TRACE(0.00)[ragnatech.se:+,messagingengine.com:+];
	FROM_HAS_DN(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-29006-lists,linux-renesas-soc=lfdr.de,renesas];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[niklas.soderlund@ragnatech.se,linux-renesas-soc@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	NEURAL_HAM(-0.00)[-0.975];
	RCPT_COUNT_SEVEN(0.00)[10];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-renesas-soc,netdev,renesas];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,messagingengine.com:dkim,renesas.com:email]
X-Rspamd-Action: no action

From: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>

Disable E-MAC interrupts when closing the device.

Signed-off-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
[Niklas: Rebase from BSP and reword commit message]
Signed-off-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
---
* Changes since v1
- Specify E-MAC interrupts in commit message.
---
 drivers/net/ethernet/renesas/ravb_main.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/net/ethernet/renesas/ravb_main.c b/drivers/net/ethernet/renesas/ravb_main.c
index 84b657fc2e15..2c725824b348 100644
--- a/drivers/net/ethernet/renesas/ravb_main.c
+++ b/drivers/net/ethernet/renesas/ravb_main.c
@@ -2367,6 +2367,7 @@ static int ravb_close(struct net_device *ndev)
 	ravb_write(ndev, 0, RIC0);
 	ravb_write(ndev, 0, RIC2);
 	ravb_write(ndev, 0, TIC);
+	ravb_write(ndev, 0, ECSIPR);
 
 	/* PHY disconnect */
 	if (ndev->phydev) {
-- 
2.52.0


