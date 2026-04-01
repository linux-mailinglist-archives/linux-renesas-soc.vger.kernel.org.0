Return-Path: <linux-renesas-soc+bounces-30701-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id MFLNBdBlzWmMdAYAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-30701-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 01 Apr 2026 20:37:04 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id D9E7C37F529
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 01 Apr 2026 20:37:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id DDF23300A645
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  1 Apr 2026 18:36:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 68F413F1675;
	Wed,  1 Apr 2026 18:36:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b="UAI03UO+";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="v3cfRN8X"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from fout-b4-smtp.messagingengine.com (fout-b4-smtp.messagingengine.com [202.12.124.147])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7756E313E15;
	Wed,  1 Apr 2026 18:36:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.12.124.147
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775068618; cv=none; b=piOt69h8pkwhN01iebwa7oG7exEb79HLQ1d/ahN8cgIhHPjGDpnwv4OOur7Leigrn8TOfJ3BzTm87PCB5fxE6dYgBJb2p/839gprQJegzU/+/aULLb8ZQewv0H4v6azfVgNaforraHw/9A/slcu5YFFh9JYxDJdX7/Q3nD+ZpSE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775068618; c=relaxed/simple;
	bh=osp4I9g8lK6Y4hEMlmUAjC2isCmX3okzjkoHHw8cvHs=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=GM2cMRkf41qAGbxsAosnL8h6j9pSN3FmIhqZe4u8qpjfRGfB/DmZS3v+nINCqGGUazc+WeFAUDb8Un8mYFW0BXTLM8KDAHSeyoVV5aU4CW/0MoVMuh6XeeDW+Y1A1qgYsZGMMoI35/HlY/FSiuwxkqZ4BXrJ7/GgYbcwLuUDqtI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se; spf=pass smtp.mailfrom=ragnatech.se; dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b=UAI03UO+; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=v3cfRN8X; arc=none smtp.client-ip=202.12.124.147
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ragnatech.se
Received: from phl-compute-01.internal (phl-compute-01.internal [10.202.2.41])
	by mailfout.stl.internal (Postfix) with ESMTP id 5B1411D00071;
	Wed,  1 Apr 2026 14:36:54 -0400 (EDT)
Received: from phl-frontend-04 ([10.202.2.163])
  by phl-compute-01.internal (MEProxy); Wed, 01 Apr 2026 14:36:55 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ragnatech.se; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:message-id:mime-version:reply-to
	:subject:subject:to:to; s=fm1; t=1775068614; x=1775155014; bh=Q1
	nS1MGMr7A7Enw3NezTFBJjuueQHbHSXlJy/oiaDYY=; b=UAI03UO+DrqFGISs4b
	wtNdt44HZj1nApw5oJf/f96hEhsRaVMyu7Vb+rrpvLO0dq4bQEXrLgRxfM6Ywiw+
	ZY6nTsT7hYdyvRLs+p5PdWtjpyTEqIAOGIgrHBk40qVNQYYB6of0RhGatqSGsIM7
	XgdBu3YRg38B/dBA9IhWdkQAvz+JNhvj27CnzCPqmGEtsXbmLoPX023njbv1RCe3
	UaoLizi1sWM6SdyDgB3HNtJxrKh6fu/kbdgFh5hNuymlmlpBS246b2HA/5VggBlk
	Ww8RFX7jPs65yuKzShY2CSUt/nJVQZnnEPLZHFTEUJPusSOAkaROfSQpa5z2Wykq
	PiRg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:message-id:mime-version:reply-to:subject
	:subject:to:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm2; t=1775068614; x=1775155014; bh=Q1nS1MGMr7A7Enw3NezTFBJjuueQ
	HbHSXlJy/oiaDYY=; b=v3cfRN8XuXgeZ6j0O2jY5BekRudlOWEARZG9j03bJ5EY
	2008GJbd9zQ3dOLypeO9EbFmE2Vx092UuanrSYU4jmZkZT0We8u46mjVEuL6y14/
	p786FyBwMYWBQmKAwNTTkZLlxDxMMwH8kpo4vz6/FHtSKBnR1snsVIe3NsHTTlZM
	RJvoJVogU7CIJYcwpnXhHuwpIb3U7j/actjSurg+wlcfZ8ErpZ+cL1r3PiKtz52x
	Pn7qJ+I6aWTLvszj5fCVqayAectGEjKVusfF87gQ4+5p78K/rI0ez0PtSNrTEJNe
	ldP2eEl+28InY1mxqu0KK8nOikG2VaKLRmlF+Pi4Kw==
X-ME-Sender: <xms:xmXNaXFsrLp6r0HMUaESYvTYuxnyZA9R2yuTFrs2YFxJP9oUSY_Ewg>
    <xme:xmXNaXazeItQLzFRCA40a_2J56ESQoI98FpLVzh-clUZIEvDzg50nRu8IrFNrjMP4
    rjPd_aDq55wULXMFwV3m4QOLTrUPt2C-K55p0GpiVeL-8B8p0Nn7M8>
X-ME-Received: <xmr:xmXNaTxFhvToajowgQdnc599mmY6_YfRrW5Q2mLJYlAhjFajnkp-0p0hAHmpaRAykZp5wlHhnBTa36cfOCNKYBIQw6BjtkW66SlQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefhedrtddtgdefkeeiucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceurghi
    lhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurh
    ephffvvefufffkofggtgfgsehtkeertdertdejnecuhfhrohhmpefpihhklhgrshcuufpn
    uggvrhhluhhnugcuoehnihhklhgrshdrshhouggvrhhluhhnugdorhgvnhgvshgrshesrh
    grghhnrghtvggthhdrshgvqeenucggtffrrghtthgvrhhnpeehudelteetkefgffefudef
    uedvjeeivdekhfevieefgeffheeltddvvefhfeetgeenucevlhhushhtvghrufhiiigvpe
    dtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehnihhklhgrshdrshhouggvrhhluhhnuges
    rhgrghhnrghtvggthhdrshgvpdhnsggprhgtphhtthhopedutddpmhhouggvpehsmhhtph
    houhhtpdhrtghpthhtohepphgruhhlsehpsggrrhhkvghrrdguvghvpdhrtghpthhtohep
    rghnughrvgifodhnvghtuggvvheslhhunhhnrdgthhdprhgtphhtthhopegurghvvghmse
    gurghvvghmlhhofhhtrdhnvghtpdhrtghpthhtohepvgguuhhmrgiivghtsehgohhoghhl
    vgdrtghomhdprhgtphhtthhopehkuhgsrgeskhgvrhhnvghlrdhorhhgpdhrtghpthhtoh
    epphgrsggvnhhisehrvgguhhgrthdrtghomhdprhgtphhtthhopehnvghtuggvvhesvhhg
    vghrrdhkvghrnhgvlhdrohhrghdprhgtphhtthhopehlihhnuhigqdhrvghnvghsrghsqd
    hsohgtsehvghgvrhdrkhgvrhhnvghlrdhorhhgpdhrtghpthhtohephihoshhhihhhihhr
    ohdrshhhihhmohgurgdruhhhsehrvghnvghsrghsrdgtohhm
X-ME-Proxy: <xmx:xmXNaRTasXMzVTxgbUG7lQwr4K4I_IgxuKXRfT3k-fnt4BIHyVCV_A>
    <xmx:xmXNaYI72AKGbc5QHvThC9s4Fw1t515YIWukbgYWzcX-f17ZkjkOcQ>
    <xmx:xmXNaQUz0tW4xUNffDAL-OJuV09gZRq3kDxaYeGGavBmogeZw47JYA>
    <xmx:xmXNaUT5bMx_st937f9BdSVBjimCNi_zNFvnNZUnACoVW9LJ9yo6eA>
    <xmx:xmXNaaBgTlIqq8SR9c7u6QHt0m9jY3aIWDEHw4ZqnL6h-JsSBBrdg3tV>
Feedback-ID: i80c9496c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 1 Apr 2026 14:36:53 -0400 (EDT)
From: =?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>
To: Paul Barker <paul@pbarker.dev>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	netdev@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org
Cc: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
	=?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>
Subject: [net-next] net: ethernet: ravb: Suspend and resume the transmission flow
Date: Wed,  1 Apr 2026 20:36:08 +0200
Message-ID: <20260401183608.1852225-1-niklas.soderlund+renesas@ragnatech.se>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[ragnatech.se,none];
	R_DKIM_ALLOW(-0.20)[ragnatech.se:s=fm1,messagingengine.com:s=fm2];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_TRACE(0.00)[ragnatech.se:+,messagingengine.com:+];
	FROM_HAS_DN(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-30701-lists,linux-renesas-soc=lfdr.de,renesas];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[niklas.soderlund@ragnatech.se,linux-renesas-soc@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[10];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-renesas-soc,netdev,renesas];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,renesas.com:email,messagingengine.com:dkim,ragnatech.se:dkim,ragnatech.se:email,ragnatech.se:mid]
X-Rspamd-Queue-Id: D9E7C37F529
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

From: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>

The current driver does not follow the latest datasheet and does not
suspend the flow when stopping DMA and resume it when starting. Update
the driver to do so.

Signed-off-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
[Niklas: Rebase from BSP and reword commit message]
Signed-off-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
---
 drivers/net/ethernet/renesas/ravb_main.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/drivers/net/ethernet/renesas/ravb_main.c b/drivers/net/ethernet/renesas/ravb_main.c
index 2c725824b348..1dbfadb2a881 100644
--- a/drivers/net/ethernet/renesas/ravb_main.c
+++ b/drivers/net/ethernet/renesas/ravb_main.c
@@ -694,6 +694,9 @@ static int ravb_dmac_init(struct net_device *ndev)
 	const struct ravb_hw_info *info = priv->info;
 	int error;
 
+	/* Clear transmission suspension */
+	ravb_modify(ndev, CCC, CCC_DTSR, 0);
+
 	/* Set CONFIG mode */
 	error = ravb_set_opmode(ndev, CCC_OPC_CONFIG);
 	if (error)
@@ -1103,6 +1106,12 @@ static int ravb_stop_dma(struct net_device *ndev)
 	if (error)
 		return error;
 
+	/* Request for transmission suspension */
+	ravb_modify(ndev, CCC, CCC_DTSR, CCC_DTSR);
+	error = ravb_wait(ndev, CSR, CSR_DTS, CSR_DTS);
+	if (error)
+		netdev_err(ndev, "failed to stop AXI BUS\n");
+
 	/* Stop AVB-DMAC process */
 	return ravb_set_opmode(ndev, CCC_OPC_CONFIG);
 }
-- 
2.53.0


