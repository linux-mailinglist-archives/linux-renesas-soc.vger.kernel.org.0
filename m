Return-Path: <linux-renesas-soc+bounces-12179-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 791C7A12A5D
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 15 Jan 2025 19:00:00 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 9A0AC161D4D
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 15 Jan 2025 17:59:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 28CC71D5AA0;
	Wed, 15 Jan 2025 17:59:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b="gbQtCG53";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="OYzFLffP"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from fout-a7-smtp.messagingengine.com (fout-a7-smtp.messagingengine.com [103.168.172.150])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B1F301D5162;
	Wed, 15 Jan 2025 17:59:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.150
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736963994; cv=none; b=hz7ZnYvY0WKnWNwZj1nIKTXv34nOddD/smuFV0ID5igFofFOQxkYRsqFvXlimSOrp9aL/syUD1EyDIzol+AXfJxuqjXme5STx+F5onCL5BKpzYIIn0E9KewnWRPL85NAkEsCdi6V+lqeAAXxEyZgf8s/m86KSJl+RVsVe83/hoA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736963994; c=relaxed/simple;
	bh=l9vsd1MTJ6tR9dAkbL3Ay0RD6rK5vYWF3fxBaWuY14g=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=jpYCiFqnLdHd8S+nLOyw+TBWdJ2ESjH+VZMMBVgNm4Fb5q+G0G9OWqgn/XxdJtjaUVYJAe9YqD8moT5bTQNAci6RR8FO1RjRg+Tx8zWxWoQy38+F8p0h0GW9yI+BztiEF2hpr3tLq998F0cqxhAqfIckP17c8Mis9qZfkqXFdKc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se; spf=pass smtp.mailfrom=ragnatech.se; dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b=gbQtCG53; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=OYzFLffP; arc=none smtp.client-ip=103.168.172.150
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ragnatech.se
Received: from phl-compute-12.internal (phl-compute-12.phl.internal [10.202.2.52])
	by mailfout.phl.internal (Postfix) with ESMTP id A7FA51380264;
	Wed, 15 Jan 2025 12:59:50 -0500 (EST)
Received: from phl-mailfrontend-01 ([10.202.2.162])
  by phl-compute-12.internal (MEProxy); Wed, 15 Jan 2025 12:59:50 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ragnatech.se; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm1; t=1736963990;
	 x=1737050390; bh=lV5Kd4JvRvHJJPm8FgrXgennB0Wn0yskDthjofu3/54=; b=
	gbQtCG53EblCKN8isX2a8A4HQ0Nfx/k+CjuZkH0IV/sS+pwDTOMROtr1BrAEZVtb
	idAFJwsPi0NoZk2JKoSxaeL11nloBKRs1WOBAkj0yeLJyJgzlfk2khzWbhdZtth1
	rUt8JxU68yoxJICgALT1t0/UObtGWKJC+eF4JXrb4bbKiwkAX2dWBiWV70HmPArN
	qpIcNrVmeg62SgPVCms88KMO7qkyALi+ePLDcxazbsQXCxIKVsYbVwdI11K1eczV
	DZFP2qDhudPSpkwH5NCjpvX1MTXo2sPDnfzC8AoP5tYK+4tuwUbBE1d0sB4BSaEw
	GEZMPygKMG/myDRLXPDWCg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1736963990; x=
	1737050390; bh=lV5Kd4JvRvHJJPm8FgrXgennB0Wn0yskDthjofu3/54=; b=O
	YzFLffPtkwlROEDU/EQYkHH/iYXkCBC1pPd0LlFJ0J1gtYHbxNb51JnWsNR3NQrs
	Pc1H+eMXgbzGOyon/IOT1RPESgAe0Tjkr3p3f/d+Tt8/meRvl8xSbLH58cof8cjG
	DMVQpdGCgg7KEqkcxn4rt1Zqf8mlwH3WvFtg3btgxu9dDqgKByf65mQ8iN1+h6/a
	5WH5k4bNq64VyGe63dqYk/UZiWKt/xwdr9jjKmxKyHBrssvZ0aSR6p8Sd36UB9S5
	cNZdZHwVy3XpzT4PLIL+tbFOCe7V1S7pFs0BW7MlE52T8ah4+VrIsasbvKr+ibAS
	gwvWeprsWdv/Z8IG4jTUQ==
X-ME-Sender: <xms:lveHZ3dL0ATQsRxbrU0K595J9RJZfTLFTHQu9vMjz4OAyE2qk2kFfA>
    <xme:lveHZ9MnJzxUtGDkHixdfG0bpOdZwwFrhmo5iyOtUfGaO3Y3NFqMEODyCPScWIwX-
    QnTisT3fL2rpACMLjA>
X-ME-Received: <xmr:lveHZwjfV3Ld4nN_sjweqqzeG0KR32KAekCxoFSwD5UauaTqMgfCX7t5lxS6Jf6_xSUYDAx4ZnDHtFDypGD2BCKiEw>
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
X-ME-Proxy: <xmx:lveHZ4-SDnLSWlMa4sHmXYoZw9mnO3VYf_oWMPcdhfqXLjuZsSf8vQ>
    <xmx:lveHZzul-AGJC3GW9ZJPYezjFrDbRZje76PegCUXC2hTc7Sf6LhFIg>
    <xmx:lveHZ3H4mziU_-h4xDKk7Ft3YFKEeyahqP123yGdhrwAbinmIsK6mg>
    <xmx:lveHZ6PfZ7SvMWYF5zu9b9e-PRX0BRxDWMWUE-Xfvs3LamjRSnSdvg>
    <xmx:lveHZ9KfyqmLhH14wORmddBTY_VNbu9IvKnlwJrXt-Y3XeTVtPjIMuQb>
Feedback-ID: i80c9496c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 15 Jan 2025 12:59:49 -0500 (EST)
From: =?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>
To: Geert Uytterhoeven <geert+renesas@glider.be>,
	linux-renesas-soc@vger.kernel.org,
	linux-clk@vger.kernel.org
Cc: =?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>
Subject: [PATCH 1/2] clk: renesas: r8a779h0: Add FCPVX clock
Date: Wed, 15 Jan 2025 18:59:26 +0100
Message-ID: <20250115175927.3714357-2-niklas.soderlund+renesas@ragnatech.se>
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

Add the FCPVX modules clock for Renesas R-Car V4M.

Signed-off-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
---
 drivers/clk/renesas/r8a779h0-cpg-mssr.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/clk/renesas/r8a779h0-cpg-mssr.c b/drivers/clk/renesas/r8a779h0-cpg-mssr.c
index 4c8052ac32df..b92990f5ec44 100644
--- a/drivers/clk/renesas/r8a779h0-cpg-mssr.c
+++ b/drivers/clk/renesas/r8a779h0-cpg-mssr.c
@@ -239,6 +239,7 @@ static const struct mssr_mod_clk r8a779h0_mod_clks[] __initconst = {
 	DEF_MOD("pfc1",		916,	R8A779H0_CLK_CP),
 	DEF_MOD("pfc2",		917,	R8A779H0_CLK_CP),
 	DEF_MOD("tsc2:tsc1",	919,	R8A779H0_CLK_CL16M),
+	DEF_MOD("fcpvx0",	1100,	R8A779H0_CLK_S0D4_VIO),
 	DEF_MOD("ssiu",		2926,	R8A779H0_CLK_S0D6_PER),
 	DEF_MOD("ssi",		2927,	R8A779H0_CLK_S0D6_PER),
 };
-- 
2.48.0


