Return-Path: <linux-renesas-soc+bounces-28030-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id ENhCOQaIh2lEZQQAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-28030-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Sat, 07 Feb 2026 19:44:22 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F998106E6A
	for <lists+linux-renesas-soc@lfdr.de>; Sat, 07 Feb 2026 19:44:22 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id DDF2F301D323
	for <lists+linux-renesas-soc@lfdr.de>; Sat,  7 Feb 2026 18:44:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 158C933B6E1;
	Sat,  7 Feb 2026 18:44:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b="NvTzWzAJ";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="gJdGqezU"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from fout-b4-smtp.messagingengine.com (fout-b4-smtp.messagingengine.com [202.12.124.147])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A25EA5FDA7;
	Sat,  7 Feb 2026 18:44:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.12.124.147
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770489844; cv=none; b=t77XYw/LtCJ2ZhNcBILEw5A9e9CxqPQC/cDaktjkjw588k4SyyR1MFlhz9EFHLQqmxFqacV5IwL3mMYPggU6BdrNzo7hCzKDaM1n2PKfyp+PZE8Qz2zo0+5J/n0azai2dWUBjxHd95L9QDiAyKb8LxIztbf1A8gF5XM5htTwkVU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770489844; c=relaxed/simple;
	bh=WFvKf39DNga0t2yUxjABuGRvNafww1scxKilpXFCtgQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=oQULzV+qCJAEwlfy+Z8Gy8gDRho2R04XX2QWReySbqRw6uLTcS0KlEMz0ruVzhLO8X+dlTSrGMYvcTiWGPfVA8kFEeVNlprICumJJktLr2xEDoZCZpKMbJeTrkunFSmSYchWcXk9xniKBnJ2XA0RXUqGN4wVCYUJdHTUCQ4pBtM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se; spf=pass smtp.mailfrom=ragnatech.se; dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b=NvTzWzAJ; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=gJdGqezU; arc=none smtp.client-ip=202.12.124.147
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ragnatech.se
Received: from phl-compute-01.internal (phl-compute-01.internal [10.202.2.41])
	by mailfout.stl.internal (Postfix) with ESMTP id 3A4CC1D000A7;
	Sat,  7 Feb 2026 13:44:02 -0500 (EST)
Received: from phl-frontend-04 ([10.202.2.163])
  by phl-compute-01.internal (MEProxy); Sat, 07 Feb 2026 13:44:03 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ragnatech.se; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:message-id:mime-version:reply-to
	:subject:subject:to:to; s=fm2; t=1770489842; x=1770576242; bh=6E
	2PvIz6cEFL6euP0z+38KTbuOnimhD8xDjIx3rD+PU=; b=NvTzWzAJiNlOsJBvvZ
	WlXuzdYKg3DkSSDNo+UFSHt/foai7gwts4xfjzSOcwQp92ujVBdaQA16ECRC3k58
	KaSBzNqM9Otz36x87RbTnRB6vc2wxvULesumARRdJPKNcTcOoqfK4rHHqqo1fTGp
	4biYi6i5cxuQdvHX/ocxeEF6H5GDTvlntH+IXUoPGvgCG5Na9jI8dzqf3Yi7ijN3
	GGsyjqRmQ1uL00bKUgrk1HiYVZHzJ/Dd9feIpbPPjiXUyTGm3lXryVrjPA3pIoFF
	uy2w5r4kxur+hSUUu6ZWuo10/rULpBf/B4QTiVF4joR+sEsC32Gmhn5mzXm2msnj
	8RdQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:message-id:mime-version:reply-to:subject
	:subject:to:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm3; t=1770489842; x=1770576242; bh=6E2PvIz6cEFL6euP0z+38KTbuOni
	mhD8xDjIx3rD+PU=; b=gJdGqezUcz8N2dWRNGIROxT/Qq5flsQmRH4jT4avkkoH
	uvn202WAqysU+vgJK3Gy7EvSolFFXwJYi92K8ypENVSTHTqyFoK014OMYRJbZ9Jg
	Cg/xFE8ehypkU9g/3jC8KRqyUmXJNxVayvDJPP0Br+9JYaqTqGXq5+u4w2GUObvZ
	hH4b6lQXm9w6fF6Lw9Ir6P/o676483vbp+5DOcJwb1XWfTkKwA1Fyq1gUThiK8TH
	uDP1/ulGO8Dv5S5joP2r5EEwvfISVgE2OxxtLBIvqoEg8Ri7T+K61z4OPWq+V27m
	dhTnQAp4tG7vjQdHfl9RgGaYc8B1gIYV7sf3arovWw==
X-ME-Sender: <xms:8IeHaYYOPXW0x38RIbQ1BBxah8ZGqyrgd6e4Nd601tAYx4C4rttoKA>
    <xme:8IeHaWeUCI59JUFoX8m0BO2PFOxtgUZUThbELLQHZcBnzYi_7YQonquYkqF2WvpI-
    WaBAv9xRz5g_fZLg8DZUHHk7QCkNznMj6PZyrdzdc3XId884DoOwVEv>
X-ME-Received: <xmr:8IeHadmRDazrOW-ElaoL6LACy2JMbT5Hb3hZRcXhEr3UZT7nvQbu36LYyeoDjInUMHy1oWnqsh7W0HL-1VSNEDtn>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefgedrtddtgdduledukedtucetufdoteggodetrf
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
X-ME-Proxy: <xmx:8IeHae2G3u0JglXjexgP593bpCJKNgSCyTOLmu0DHzZKWm0sGmC1Xw>
    <xmx:8YeHaefJNLHMXD9RumCzfbskBo8d_TJ8BWQ9T_2w8BoeFA4fJM231g>
    <xmx:8YeHaQaSRRYQkaU2si5igjwWQfpJ9KJ5acGsTZLTsJ4fDG1ED9zPlQ>
    <xmx:8YeHabFS01c58FVn6WLPKvCwz_2M5A3qcevyYwlaRgXH10f_ay00Ng>
    <xmx:8oeHabofWSNTdmguUyw9B87hJpGqFp_y_xvyTDqigoBBrhIBUj_WO_Jy>
Feedback-ID: i80c9496c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sat,
 7 Feb 2026 13:44:00 -0500 (EST)
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
Subject: [net-next] net: ethernet: ravb: Disable interrupts when closing device
Date: Sat,  7 Feb 2026 19:43:28 +0100
Message-ID: <20260207184328.2427679-1-niklas.soderlund+renesas@ragnatech.se>
X-Mailer: git-send-email 2.52.0
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
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_TRACE(0.00)[ragnatech.se:+,messagingengine.com:+];
	FROM_HAS_DN(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-28030-lists,linux-renesas-soc=lfdr.de,renesas];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[niklas.soderlund@ragnatech.se,linux-renesas-soc@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	NEURAL_HAM(-0.00)[-0.982];
	RCPT_COUNT_SEVEN(0.00)[10];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-renesas-soc,netdev,renesas];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,messagingengine.com:dkim,ragnatech.se:email,ragnatech.se:dkim,ragnatech.se:mid,renesas.com:email]
X-Rspamd-Queue-Id: 9F998106E6A
X-Rspamd-Action: no action

From: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>

Disable interrupts when closing the device.

Signed-off-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
[Niklas: Rebase from BSP and reword commit message]
Signed-off-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
---
 drivers/net/ethernet/renesas/ravb_main.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/net/ethernet/renesas/ravb_main.c b/drivers/net/ethernet/renesas/ravb_main.c
index 57b0db314fb5..d56b71003585 100644
--- a/drivers/net/ethernet/renesas/ravb_main.c
+++ b/drivers/net/ethernet/renesas/ravb_main.c
@@ -2368,6 +2368,7 @@ static int ravb_close(struct net_device *ndev)
 	ravb_write(ndev, 0, RIC0);
 	ravb_write(ndev, 0, RIC2);
 	ravb_write(ndev, 0, TIC);
+	ravb_write(ndev, 0, ECSIPR);
 
 	/* PHY disconnect */
 	if (ndev->phydev) {
-- 
2.52.0


