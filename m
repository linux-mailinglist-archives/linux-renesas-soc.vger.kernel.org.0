Return-Path: <linux-renesas-soc+bounces-11985-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A332A0761B
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  9 Jan 2025 13:50:53 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 72EEC3A18E3
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  9 Jan 2025 12:50:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D08AB217F22;
	Thu,  9 Jan 2025 12:50:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b="m7rGADkT";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="YL6uNUzY"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from fhigh-b7-smtp.messagingengine.com (fhigh-b7-smtp.messagingengine.com [202.12.124.158])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2ED8C216E37;
	Thu,  9 Jan 2025 12:50:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.12.124.158
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736427048; cv=none; b=d4eIL2K88JFFUd0OmuPN3nAr/a5k0Ln5NqeAucAjazccVNZEdOdesBQL/31SNipp2fN3ZSZvbgX35gik6R9f/aBD2H+YXDAinMbBSBAAMwaTIVB09UnoVsKvyySktwWKDOkGkmXqNJNM1Z43H6XCDw5N0lQtyWqgNl2JdpjCsjs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736427048; c=relaxed/simple;
	bh=dA/Du/goAfTTRSnTHnCzvS2oiiAAkzwjsm/N+z6MXPk=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=uswZ0guuiSsIGKMUd652zcCogJcWP7QZgFFDp45xy7B8DMJ931VKRN0Q+2bZlDKrHs/MR26hdu+RY81yrPierSqRZgto/moE0cg3ajuBy0eswEkJBfzoL+sV5h8tAFxJzklMndHY6cwqEWdL9Zwpc/BTlgNGLVCzZ3s0qHXPb+s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se; spf=pass smtp.mailfrom=ragnatech.se; dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b=m7rGADkT; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=YL6uNUzY; arc=none smtp.client-ip=202.12.124.158
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ragnatech.se
Received: from phl-compute-06.internal (phl-compute-06.phl.internal [10.202.2.46])
	by mailfhigh.stl.internal (Postfix) with ESMTP id 2ECEB25400FC;
	Thu,  9 Jan 2025 07:50:45 -0500 (EST)
Received: from phl-mailfrontend-02 ([10.202.2.163])
  by phl-compute-06.internal (MEProxy); Thu, 09 Jan 2025 07:50:45 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ragnatech.se; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:message-id:mime-version:reply-to
	:subject:subject:to:to; s=fm1; t=1736427045; x=1736513445; bh=pc
	9rjQwv//PZRbFFetAIzMgsS0ttk1Z3MflWUj08NLo=; b=m7rGADkTww1yQokPkV
	dlt4+T3dTt1+LNqfXtWXp4CbcJ4nzsqasDi6iJq8Z5SEJ39ep1Bsv4hM2EYtsDVZ
	WTlotxZt2iClDFCEzdfUUH/5mCqBwEJVEAmaBHqpgnCphaBXHQgntvPgZP3rMA9B
	8gRV8sUoQzTzg4HNjCrETk7a/M8lasr0PHh74wAg2pwENZ4lEhcq8rS8mwBUP9li
	2MZDz5KhDNDpmZ3IqlrS4WzMOdpRzkU7bdXDm2F94GiW7X4B//x5e6HnDiq+aMXc
	hCZTPBghWPlNw8e9U6yZVCC4dE+cCD7BzO4JILprQ8mdnPoNswwNoyJFjaxhyCnR
	eraA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:message-id:mime-version:reply-to:subject
	:subject:to:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm2; t=1736427045; x=1736513445; bh=pc9rjQwv//PZRbFFetAIzMgsS0tt
	k1Z3MflWUj08NLo=; b=YL6uNUzYPoqN4Tas0588HMTIQpTh/KQ/SJ7rWXni5U41
	N7gm2Pf+oYiqE0dwoNYIqPStKnjdZwfzRUiNmIbFjxCXpMXLNRNdBGn6on5BYhB4
	+PZfrprmydw0R1aAacZWvftF0MiRlMdTNcyOewaE+qCzPK2hs6FrwnCUO+zaAliq
	4AZzrNyuh8LEOZ/zQC+sgFiI/BAXI/XfeLH3lSfAPGX41A2oDMXh+R99XVxXO09q
	6+TE/lMD8doUWgzs92lD+BzNXmhuVYadvY2daRysbwqiksw5wmwdHSQm6j4xbc6w
	kPPEgEke9zuS1gXNbHRPw8PBH+TiqgvGktrUXrDMRQ==
X-ME-Sender: <xms:JMZ_Z4xACkhJp-8Kmw8FMbkxLodYbTC8Xd82nA556DZ1PH4EHB1f2A>
    <xme:JMZ_Z8RfYROpFLGz91mA8P5aZOWWBgnMzteFw7jvnMDXnCq4T_pmx6pQQexLAqlwv
    AnqYJYee4eENpEXcF4>
X-ME-Received: <xmr:JMZ_Z6U2kPRZVg6TGQuMjqayv3rq1ubdH4xrHtCGMpgad7sgF-kmaU3uYzzBuAdwPAR23F-p2JD-oC_pL7IPBEGEWw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefuddrudegiedggeefucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdggtfgfnhhsuhgsshgtrhhisggvpdfu
    rfetoffkrfgpnffqhgenuceurghilhhouhhtmecufedttdenucenucfjughrpefhvfevuf
    ffkffogggtgfesthekredtredtjeenucfhrhhomheppfhikhhlrghsucfunpguvghrlhhu
    nhguuceonhhikhhlrghsrdhsohguvghrlhhunhguodhrvghnvghsrghssehrrghgnhgrth
    gvtghhrdhsvgeqnecuggftrfgrthhtvghrnhepheduleetteekgffffedufeeuvdejiedv
    kefhveeifeegffehledtvdevhfefteegnecuvehluhhsthgvrhfuihiivgeptdenucfrrg
    hrrghmpehmrghilhhfrhhomhepnhhikhhlrghsrdhsohguvghrlhhunhgusehrrghgnhgr
    thgvtghhrdhsvgdpnhgspghrtghpthhtohephedpmhhouggvpehsmhhtphhouhhtpdhrtg
    hpthhtohepghgvvghrthdorhgvnhgvshgrshesghhlihguvghrrdgsvgdprhgtphhtthho
    pehjrggtohhpohdrmhhonhguihdorhgvnhgvshgrshesihguvggrshhonhgsohgrrhgurd
    gtohhmpdhrtghpthhtoheplhhinhhugidqrhgvnhgvshgrshdqshhotgesvhhgvghrrdhk
    vghrnhgvlhdrohhrghdprhgtphhtthhopehlihhnuhigqdgtlhhksehvghgvrhdrkhgvrh
    hnvghlrdhorhhgpdhrtghpthhtohepnhhikhhlrghsrdhsohguvghrlhhunhguodhrvghn
    vghsrghssehrrghgnhgrthgvtghhrdhsvg
X-ME-Proxy: <xmx:JMZ_Z2jufm3QkeTL5_9v5RdN9jQdlErLIRRiMRCBfhBcH_P79YYWmA>
    <xmx:JMZ_Z6C2YN2QAzz3vaaWlnG3eXbNemuMg07c2ERwKIYZRPTcOV8Zsw>
    <xmx:JMZ_Z3IeqMI0eTraVX_AcF5BjVA82cbFxyiaVbopVBJuQRdqKQWfCw>
    <xmx:JMZ_ZxD0pEwnM-55XdaVPbUGkSe-Q87CF9wntghEufOJf-dY7n3s3A>
    <xmx:JcZ_Zx6TV_fGQ3MZp6eOZB4Mtkbc4gYRyxmRT3II5cNhrAcmfS53FB8V>
Feedback-ID: i80c9496c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 9 Jan 2025 07:50:44 -0500 (EST)
From: =?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>
To: Geert Uytterhoeven <geert+renesas@glider.be>,
	Jacopo Mondi <jacopo.mondi+renesas@ideasonboard.com>,
	linux-renesas-soc@vger.kernel.org,
	linux-clk@vger.kernel.org
Cc: =?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>
Subject: [PATCH] clk: renesas: r8a779a0: Add FCPVX clocks
Date: Thu,  9 Jan 2025 13:50:36 +0100
Message-ID: <20250109125036.2399199-1-niklas.soderlund+renesas@ragnatech.se>
X-Mailer: git-send-email 2.47.1
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Add the FCPVX modules clock for Renesas R-Car V3U.

Signed-off-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
---
 drivers/clk/renesas/r8a779a0-cpg-mssr.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/clk/renesas/r8a779a0-cpg-mssr.c b/drivers/clk/renesas/r8a779a0-cpg-mssr.c
index 9c7e4094705c..4a5b4e2afa92 100644
--- a/drivers/clk/renesas/r8a779a0-cpg-mssr.c
+++ b/drivers/clk/renesas/r8a779a0-cpg-mssr.c
@@ -238,6 +238,10 @@ static const struct mssr_mod_clk r8a779a0_mod_clks[] __initconst = {
 	DEF_MOD("vspx1",	1029,	R8A779A0_CLK_S1D1),
 	DEF_MOD("vspx2",	1030,	R8A779A0_CLK_S1D1),
 	DEF_MOD("vspx3",	1031,	R8A779A0_CLK_S1D1),
+	DEF_MOD("fcpvx0",	1100,	R8A779A0_CLK_S1D1),
+	DEF_MOD("fcpvx1",	1101,	R8A779A0_CLK_S1D1),
+	DEF_MOD("fcpvx2",	1102,	R8A779A0_CLK_S1D1),
+	DEF_MOD("fcpvx3",	1103,	R8A779A0_CLK_S1D1),
 };
 
 static const unsigned int r8a779a0_crit_mod_clks[] __initconst = {
-- 
2.47.1


