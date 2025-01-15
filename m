Return-Path: <linux-renesas-soc+bounces-12180-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E93BA12A61
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 15 Jan 2025 19:00:01 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id B9B831619CE
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 15 Jan 2025 17:59:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EBC4A1D5AB8;
	Wed, 15 Jan 2025 17:59:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b="nQuUUCBi";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="CnmnWb0R"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from fhigh-a3-smtp.messagingengine.com (fhigh-a3-smtp.messagingengine.com [103.168.172.154])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E4971D5AB7;
	Wed, 15 Jan 2025 17:59:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.154
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736963995; cv=none; b=a5qgdn6x2nx4lKlXan85EZeceDV1NXpwJ0KRnrAVkKWAFFLO603se19vUivYY8GgcxTqI/KtrKhbvum25eTSnUzlpR1GLHrbgeEsRX8sMXVyrEDLUjVovtfFaGAOOf+oRFWeSaVH3TX3JC+hocKl8/7R85yWVKHGfZ2pzfcLRxM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736963995; c=relaxed/simple;
	bh=PDWjfSxvWW/wkcUxuLabQsKqUHXe4/SQ5zqO59i+awk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=G1sbsLmlXMzZ/6PhMjKJlHh1+mcxx3H2+Vq1i0q3aAHM3hWslZ3wISNKL2v//wlLjOyhlX2xDZxg0UqM/b7L0TnPRqFAtDizBW6UZeIavPHipdVX+VrCz6dkJwm89rgtYDuExGxPLircmOEK00lZjN2YI+i12mcnNFtqIZ4NlKk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se; spf=pass smtp.mailfrom=ragnatech.se; dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b=nQuUUCBi; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=CnmnWb0R; arc=none smtp.client-ip=103.168.172.154
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ragnatech.se
Received: from phl-compute-04.internal (phl-compute-04.phl.internal [10.202.2.44])
	by mailfhigh.phl.internal (Postfix) with ESMTP id 1880F114013B;
	Wed, 15 Jan 2025 12:59:53 -0500 (EST)
Received: from phl-mailfrontend-02 ([10.202.2.163])
  by phl-compute-04.internal (MEProxy); Wed, 15 Jan 2025 12:59:53 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ragnatech.se; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm1; t=1736963993;
	 x=1737050393; bh=uZDGMx0nT1BtEJJYhtGuDmr3s2QzCHBksTi5YAv7Nrg=; b=
	nQuUUCBi4xQzqRe3g4VrkfPc2fAQBIlcv4fMf7ye4GgwKC6DBpxlcxwVmD3DJwTB
	7322gb7lo4LnVk4wtno7nUYrfb864KK3P3io7mUjEO71qgoOho5hrtz3zhvMM4K8
	kanUtKLZ/jT0NqNN6rau3VaonXFwl2MZR+FaUTQu/KBR8aD5nyiN6pusvJVlXASf
	//pAyaiJ/QdFKkWc213TFgTlv44VNq/mv/m+Ys43u+62bkDmyOT+zAeOBBE7zLqY
	jTaYE36pLjWfz56G5cHxSSNYpfdhrr75zlAq1wAHqSEns0oP82lfyOhP5+ee7oVj
	S49N7/+6We4dUEQ6275fJg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1736963993; x=
	1737050393; bh=uZDGMx0nT1BtEJJYhtGuDmr3s2QzCHBksTi5YAv7Nrg=; b=C
	nmnWb0RztVlZG66CIYEGmQT1an6J2YlAtzi9MMrnWtjw1NyIzsXGZd8TGhkd6W3g
	CZv+UEfJ1Xrgikt0d0F6k2rnJlGXh0SBoH22Iifgfnu3o5WUlUULbfVuDXq+P2QT
	4JgtJSvrWg/no+a1ZQCVJgPXfRMgoHTK37Oo8zuaZq6Fmw2Vlp0s7ZjEsg+MJi3Y
	iw3mQ2k+z+nxZriG1pOL9yxsxBGFBX6TKGd8+SLRA2kQz0IcqWwmpkkaXKalxGyy
	++SWHzcMmJmYjhAmFja1hZfO5NpnGI/DRpAzV0K/ItpJSi4BlYpWlrhdo2olUU7r
	Cd6FH+BGmCH+idKG0p6/Q==
X-ME-Sender: <xms:mPeHZ6eOeyrzjVfP_hgsEgngv49gYcWRWVFvQeI9eUicYRyv6NUXGg>
    <xme:mPeHZ0Pjr7T7EqcIppPgXQeXLnDxTldIAtZcY-1j0L08WXKDbar2slt6JJvBUz4ie
    VQcfsaKdRGHar2tS9A>
X-ME-Received: <xmr:mPeHZ7hNNojaIdU26bst8huxNJHBIeQupSu3Ye8liU7yWmAx6jH3qSmykQ6oIpqMsxz7yCWUPYG6Pt7Tx02OGSXtfw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefuddrudehledgkedtucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdggtfgfnhhsuhgsshgtrhhisggvpdfu
    rfetoffkrfgpnffqhgenuceurghilhhouhhtmecufedttdenucenucfjughrpefhvfevuf
    ffkffojghfgggtgfesthekredtredtjeenucfhrhhomheppfhikhhlrghsucfunpguvghr
    lhhunhguuceonhhikhhlrghsrdhsohguvghrlhhunhguodhrvghnvghsrghssehrrghgnh
    grthgvtghhrdhsvgeqnecuggftrfgrthhtvghrnhepheeigfeuveeutdefhfehgeekvedt
    leeuueekveefudehhffhjeffgfegffelfeegnecuvehluhhsthgvrhfuihiivgeptdenuc
    frrghrrghmpehmrghilhhfrhhomhepnhhikhhlrghsrdhsohguvghrlhhunhgusehrrghg
    nhgrthgvtghhrdhsvgdpnhgspghrtghpthhtohepgedpmhhouggvpehsmhhtphhouhhtpd
    hrtghpthhtohepghgvvghrthdorhgvnhgvshgrshesghhlihguvghrrdgsvgdprhgtphht
    thhopehlihhnuhigqdhrvghnvghsrghsqdhsohgtsehvghgvrhdrkhgvrhhnvghlrdhorh
    hgpdhrtghpthhtoheplhhinhhugidqtghlkhesvhhgvghrrdhkvghrnhgvlhdrohhrghdp
    rhgtphhtthhopehnihhklhgrshdrshhouggvrhhluhhnugdorhgvnhgvshgrshesrhgrgh
    hnrghtvggthhdrshgv
X-ME-Proxy: <xmx:mPeHZ3_TdUOVQ-JPZ85yfo6i4nY0X-jxyZwnYblOnEWPuvJYjEYM5A>
    <xmx:mPeHZ2vrhuzwfqyUZg5oDwCjpRmPE9kpzeeCR_Hk_aQ86qWNWfI36g>
    <xmx:mPeHZ-H6fj6RnegeMjMygDJDFYgioeCmdnwFSF4deETo2nEFhb032g>
    <xmx:mPeHZ1OJgIlrBckWh7s89Las5U26xKMRiwPMK5PpWynBDEGgXi10HQ>
    <xmx:mfeHZ4LPzEkoHhlY2-qadDyz3MbJVwKq_BcPSwNa5_0P-eSdkNEE3TUj>
Feedback-ID: i80c9496c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 15 Jan 2025 12:59:52 -0500 (EST)
From: =?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>
To: Geert Uytterhoeven <geert+renesas@glider.be>,
	linux-renesas-soc@vger.kernel.org,
	linux-clk@vger.kernel.org
Cc: =?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>
Subject: [PATCH 2/2] clk: renesas: r8a779h0: Add VSPX clock
Date: Wed, 15 Jan 2025 18:59:27 +0100
Message-ID: <20250115175927.3714357-3-niklas.soderlund+renesas@ragnatech.se>
X-Mailer: git-send-email 2.48.0
In-Reply-To: <20250115175927.3714357-1-niklas.soderlund+renesas@ragnatech.se>
References: <20250115175927.3714357-1-niklas.soderlund+renesas@ragnatech.se>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Add the VSPX modules clock for Renesas R-Car V4M.

Signed-off-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
---
 drivers/clk/renesas/r8a779h0-cpg-mssr.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/clk/renesas/r8a779h0-cpg-mssr.c b/drivers/clk/renesas/r8a779h0-cpg-mssr.c
index b92990f5ec44..22b0af0dbb27 100644
--- a/drivers/clk/renesas/r8a779h0-cpg-mssr.c
+++ b/drivers/clk/renesas/r8a779h0-cpg-mssr.c
@@ -239,6 +239,7 @@ static const struct mssr_mod_clk r8a779h0_mod_clks[] __initconst = {
 	DEF_MOD("pfc1",		916,	R8A779H0_CLK_CP),
 	DEF_MOD("pfc2",		917,	R8A779H0_CLK_CP),
 	DEF_MOD("tsc2:tsc1",	919,	R8A779H0_CLK_CL16M),
+	DEF_MOD("vspx0",	1028,	R8A779H0_CLK_S0D4_VIO),
 	DEF_MOD("fcpvx0",	1100,	R8A779H0_CLK_S0D4_VIO),
 	DEF_MOD("ssiu",		2926,	R8A779H0_CLK_S0D6_PER),
 	DEF_MOD("ssi",		2927,	R8A779H0_CLK_S0D6_PER),
-- 
2.48.0


