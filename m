Return-Path: <linux-renesas-soc+bounces-24105-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id D66D4C3334E
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 04 Nov 2025 23:25:36 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 3D1801890CBE
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  4 Nov 2025 22:25:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 877CC30BB8C;
	Tue,  4 Nov 2025 22:24:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b="nXaOWRis";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="o2RBl/UY"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from fout-a1-smtp.messagingengine.com (fout-a1-smtp.messagingengine.com [103.168.172.144])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B56992D12EF;
	Tue,  4 Nov 2025 22:24:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.144
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762295089; cv=none; b=WaPVDVEi8GZwGGedMOzBmUAeg7mTXxlUp0ghKDixcSzueEm/HU1VKXiHclMnXW6Qrj/7bIiU4V/CTVtpYEFR3qEvBZHaQkKvEdw7N+xG6ekbgN+8PV5S2tAVgS845mHt9AMHoW56t5z5sPut+BEqUdjYgJXHvL9RhF7dYlVwHCQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762295089; c=relaxed/simple;
	bh=Rzt/v0e7g3gIUPK/Yffry0HR33bX0xqQG2Olert6UcI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=AHPMjUt4PG+8UShcJUvK3T1r3/rlxhnuPM8Q/qp/mT5B+/LUNq68sHHvNY2gkIEPggoIc4y2WLaNdulvTP2mSq6J8k6MtpWkLImt331PKiBGh/3l0kqcSew1rBOA8eojNftMwrvW8Pn805KdzXeKYBGa3USNSNFe63s8rLzTxBE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se; spf=pass smtp.mailfrom=ragnatech.se; dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b=nXaOWRis; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=o2RBl/UY; arc=none smtp.client-ip=103.168.172.144
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ragnatech.se
Received: from phl-compute-04.internal (phl-compute-04.internal [10.202.2.44])
	by mailfout.phl.internal (Postfix) with ESMTP id D3848EC004E;
	Tue,  4 Nov 2025 17:24:46 -0500 (EST)
Received: from phl-mailfrontend-02 ([10.202.2.163])
  by phl-compute-04.internal (MEProxy); Tue, 04 Nov 2025 17:24:46 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ragnatech.se; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm2; t=1762295086;
	 x=1762381486; bh=zT5nYP6GIOwXFY0Oe5N6RrTDYztD5GOBod6pSadBj+I=; b=
	nXaOWRisD6aYZtHVkrUD+DFJnWARLxY/a/FPpDmDkbxll2JSLNDuEpzZ+VrjrlPM
	nqBbCMGkvnand1sog7dRkusNHfHhHNSGn8vM8vL/BveAh52ftyJsjVamR6wG1BFg
	Y5UpoBBTZ5dLk3GYx4TT/PnIQdJfiLLKxUFSyuOOC3H+OJodeHWmMOS7To9/XWvg
	e2cHKPNOLetR562/Jkzy0OWa8YTByNLSZu7pijqu3BHrkOlF24bBmULr94HEthG2
	q9tu+rxWXmCZvUqWo2os74xJ/NNQqMC1XYr/mXabA3ptIh0Wau9uSibRT+LDfskB
	LxIbG0d79XZ6BpS4acVrmg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1762295086; x=
	1762381486; bh=zT5nYP6GIOwXFY0Oe5N6RrTDYztD5GOBod6pSadBj+I=; b=o
	2RBl/UYMeti4Abb8ft8ZQ4V6zPP+RT0RZNPQ9X5/ig+4CPCX6erBSochPbKUOC8w
	jY0fkrqODOJFhM80oHnSlPchRi5U2+foXLQIA2jdLBEyQfkL8zJsLiPAKYqqnjIg
	Sfuo2smOXUX5/wlOFfaofYvgPs83H+6BtxwvD8ZZgQdy3jK4ZOQJpko2S1H5eLg/
	sV6HInkG+xwEZHsfpyZtWFAN1iy2f66EqsZ3kmBlN0kydb4+PqGOWxvTmLMsKtrN
	GpmtTJtytI628F6LS3j1EAwud1zFoMVuDIBq0PGVPVg/RcUy7lk40qCOL91hbR6d
	7HtVxunQhBv7Tr/YrhmGg==
X-ME-Sender: <xms:Ln0KaaggrMlrVgJIMIkgpHgrGPjbDSXFR9mYIPRvAtIWPsLLgOAJFQ>
    <xme:Ln0KaRh37rOQaLj9O8QmWifPmU3iBVKTN5hD_iXVF-RPW58YEZhvfEzrRSl-CkEVK
    M11ckziAws3V-4jwvoXV7pQkyNRJn785Q3mL6q8eqTVFgGU1tKHS5U>
X-ME-Received: <xmr:Ln0KaQFQkg7WEgBhdsA5Gos6qR0fFaOLL3dJRhlVMn_TW3kDoBjTjQZDLMWz-B4IE5---yFp6noM9cKcy7iun2rZ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdeggddukedvvddvucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceu
    rghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujf
    gurhephffvvefufffkofgjfhggtgfgsehtkeertdertdejnecuhfhrohhmpefpihhklhgr
    shcuufpnuggvrhhluhhnugcuoehnihhklhgrshdrshhouggvrhhluhhnugdorhgvnhgvsh
    grshesrhgrghhnrghtvggthhdrshgvqeenucggtffrrghtthgvrhhnpeehiefgueevuedt
    fefhheegkeevtdelueeukeevfeduhefhhfejfffggeffleefgeenucevlhhushhtvghruf
    hiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehnihhklhgrshdrshhouggvrhhl
    uhhnugesrhgrghhnrghtvggthhdrshgvpdhnsggprhgtphhtthhopedufedpmhhouggvpe
    hsmhhtphhouhhtpdhrtghpthhtohepphgruhhlsehpsggrrhhkvghrrdguvghvpdhrtghp
    thhtoheprghnughrvgifodhnvghtuggvvheslhhunhhnrdgthhdprhgtphhtthhopegurg
    hvvghmsegurghvvghmlhhofhhtrdhnvghtpdhrtghpthhtohepvgguuhhmrgiivghtsehg
    ohhoghhlvgdrtghomhdprhgtphhtthhopehkuhgsrgeskhgvrhhnvghlrdhorhhgpdhrtg
    hpthhtohepphgrsggvnhhisehrvgguhhgrthdrtghomhdprhgtphhtthhopeihohhshhhi
    hhhirhhordhshhhimhhouggrrdhuhhesrhgvnhgvshgrshdrtghomhdprhgtphhtthhope
    hgvggvrhhtodhrvghnvghsrghssehglhhiuggvrhdrsggvpdhrtghpthhtohepmhgrghhn
    uhhsrdgurghmmhesghhmrghilhdrtghomh
X-ME-Proxy: <xmx:Ln0KaWBCw1SWVTh5_SRHgxB41bXF60Ha4FrTK6e57XxdWbNgp8G-Bg>
    <xmx:Ln0KaeBlM2_gUSnMrG0YGlpzIjnHR6dlp-LDzIFp2vP4kDVdgprLPw>
    <xmx:Ln0KacOTr05y5iiHlXAxtPrxZGCIzDmopHEedmfOZFmCUJhFt_ExWQ>
    <xmx:Ln0KaaNpvlja8NkwUrzSHhZxJgDbky1QrRSvfi4JaAuINW7_GQxwDA>
    <xmx:Ln0KafZPa7DYe7HXdsocU-8vOkD4UlBG-XgXA-j0FYpUa4s8ZwrsGai7>
Feedback-ID: i80c9496c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 4 Nov 2025 17:24:45 -0500 (EST)
From: =?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>
To: Paul Barker <paul@pbarker.dev>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	Richard Cochran <richardcochran@gmail.com>,
	netdev@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org
Cc: =?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>
Subject: [net-next,v2 1/7] net: rswitch: Move definition of S4 gPTP offset
Date: Tue,  4 Nov 2025 23:24:14 +0100
Message-ID: <20251104222420.882731-2-niklas.soderlund+renesas@ragnatech.se>
X-Mailer: git-send-email 2.51.1
In-Reply-To: <20251104222420.882731-1-niklas.soderlund+renesas@ragnatech.se>
References: <20251104222420.882731-1-niklas.soderlund+renesas@ragnatech.se>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

The files rcar_gen4_ptp.{c,h} implements an abstraction of the gPTP
support implemented together with different other IP blocks. The first
device added which supported this was RSWITCH on R-Car S4.

While doing so the RSWITCH R-Car S4 specific offset was added to the
generic Gen4 gPTP header file. Move it to the RSWITCH driver to make it
clear it only applies to this driver.

Signed-off-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
---
* Changes since v1
- Change the prefix of the define to RSWITCH_.
---
 drivers/net/ethernet/renesas/rcar_gen4_ptp.h | 2 --
 drivers/net/ethernet/renesas/rswitch_main.c  | 4 +++-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/net/ethernet/renesas/rcar_gen4_ptp.h b/drivers/net/ethernet/renesas/rcar_gen4_ptp.h
index f77e79e47357..536badd798cc 100644
--- a/drivers/net/ethernet/renesas/rcar_gen4_ptp.h
+++ b/drivers/net/ethernet/renesas/rcar_gen4_ptp.h
@@ -9,8 +9,6 @@
 
 #include <linux/ptp_clock_kernel.h>
 
-#define RCAR_GEN4_GPTP_OFFSET_S4	0x00018000
-
 /* driver's definitions */
 #define RCAR_GEN4_RXTSTAMP_ENABLED		BIT(0)
 #define RCAR_GEN4_RXTSTAMP_TYPE_V2_L2_EVENT	BIT(1)
diff --git a/drivers/net/ethernet/renesas/rswitch_main.c b/drivers/net/ethernet/renesas/rswitch_main.c
index f21a814aa9d1..24ed33ac4bcd 100644
--- a/drivers/net/ethernet/renesas/rswitch_main.c
+++ b/drivers/net/ethernet/renesas/rswitch_main.c
@@ -30,6 +30,8 @@
 #include "rswitch.h"
 #include "rswitch_l2.h"
 
+#define RSWITCH_GPTP_OFFSET_S4 0x00018000
+
 static int rswitch_reg_wait(void __iomem *addr, u32 offs, u32 mask, u32 expected)
 {
 	u32 val;
@@ -2175,7 +2177,7 @@ static int renesas_eth_sw_probe(struct platform_device *pdev)
 	if (IS_ERR(priv->addr))
 		return PTR_ERR(priv->addr);
 
-	priv->ptp_priv->addr = priv->addr + RCAR_GEN4_GPTP_OFFSET_S4;
+	priv->ptp_priv->addr = priv->addr + RSWITCH_GPTP_OFFSET_S4;
 
 	ret = dma_set_mask_and_coherent(&pdev->dev, DMA_BIT_MASK(40));
 	if (ret < 0) {
-- 
2.51.1


