Return-Path: <linux-renesas-soc+bounces-12126-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A5CFA1101D
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 14 Jan 2025 19:30:34 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 88BDE160BCA
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 14 Jan 2025 18:30:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 458891FBE9A;
	Tue, 14 Jan 2025 18:30:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b="RQsgTB/o";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="uYoQupY1"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from fout-b4-smtp.messagingengine.com (fout-b4-smtp.messagingengine.com [202.12.124.147])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5FCE51FC0EA;
	Tue, 14 Jan 2025 18:30:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.12.124.147
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736879431; cv=none; b=Y/fryuPHIKaj01oxUOq0rXwIjfVK8GBuzBjZNUSl2Sz/dkk2xrZ2xm282zw3LYABRTZO1F2WbaG1dqfIzwA5olM0Bj+kIHOu2FKs7HdHOt7U8NdJUcwStBwemGhQlLou0/ml10SFdC06sbOz9qP+5oF8Tz3LA0qlhEiweArya/g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736879431; c=relaxed/simple;
	bh=04k7p6ArpA4aPipQsodfZKsYoNw01cEduI+YXLZWbjc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=dsWogFrbPc0QiVlF29JN2Tk7oA9DVI1ZaO3BhoIkNZFiwXaIiY1eUerLzaHgPvEZZ0e0DTPrT/4bBfIabhGJnhjFRS7cHpIsyOftbGHEJMjYq6cYDTENfwsWJ1SKGMxI/4+jB7lMkLh/j84amDAgqKzTKDkm06lxc8/Icib2Doo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se; spf=pass smtp.mailfrom=ragnatech.se; dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b=RQsgTB/o; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=uYoQupY1; arc=none smtp.client-ip=202.12.124.147
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ragnatech.se
Received: from phl-compute-09.internal (phl-compute-09.phl.internal [10.202.2.49])
	by mailfout.stl.internal (Postfix) with ESMTP id 711AE11401AA;
	Tue, 14 Jan 2025 13:30:28 -0500 (EST)
Received: from phl-mailfrontend-01 ([10.202.2.162])
  by phl-compute-09.internal (MEProxy); Tue, 14 Jan 2025 13:30:28 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ragnatech.se; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm1; t=1736879428;
	 x=1736965828; bh=sbqUlPMVectARxMnAFUgLN59ZtV+ixhLMtVYqaS9jP0=; b=
	RQsgTB/oA2Se0yFXryswuOpDcaJFLroyz2PuvB4VWbmOlSl+JXAVsqlIdMhqxzT2
	nsvwS2IWdQuNm2lDouJlC6iKS7VkBYLycI2NziXrkIxrlRmliQ+mp9KrwZuGZ+F6
	hQmKHuV5z7uvi9eyXmVd+n40Znx6dmDUdm7c75sMpqbXVPyFkrfmpSdcDDQstO0D
	yRBXb2xkawjC2RWwDl6lerxwVjFxInceMf/an9xt8iXhSAgzKWm3zfYbJeVqbB8u
	YsmYXHCX5CIb6kUOVHJWmtEqfKRJp7Z0Mn2j+hLxWmiOp8bD4VT8aJiNgBfJzUu7
	zHp4674Jb44kd7SZ902oww==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1736879428; x=
	1736965828; bh=sbqUlPMVectARxMnAFUgLN59ZtV+ixhLMtVYqaS9jP0=; b=u
	YoQupY1wDlUQ0VKx9kUrdRn0OVWwEzrgf8wOuX2lLfKJBHaeV7mJWupghIZjFdl3
	xf6k1MqcI3qlY49FCuHzw2grOgiqwwNCYkJD3aEuFeBQpiMKz58Q5gU7ivjctKFO
	WZqXeGyqBWe2dIUcaMihhtRwB3Q0xuA/Fgq+jBN10EvwvK3zg01uwenyd6QW/L65
	GW3sMUj5SLalKiM297peXmcv260HevvJcJimJzfRQzAbeZxxgGR494lRT/9r+dXd
	xBuwWetyPBWreTvqm31yzreB8xetGUz2RvJzEMleBEjp3iMxwuG/n7OCxgOrn+k3
	s/AyhtEYvZJcSz2z0DMFA==
X-ME-Sender: <xms:Q62GZ2G1T5BXulorfRONE6TiDiIXQMq4-iEsWaVxnTZAi1LgFBbj3w>
    <xme:Q62GZ3V8R6rsXLzpcjHB2BH4uLU25Nj9BfvT_szufL_rhNC28N4uiQHbrDXtX2VxE
    1z3w8Ch3CXzkRyQpNU>
X-ME-Received: <xmr:Q62GZwJ0feMlrXHo3UEr1PTo_lzJK_jHW2odYJvO3__AyhTk_uzC8hoXvn1X4BHFqzQ4IKkoK9jCktMMQJVve1P5wQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefuddrudehiedguddufecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpggftfghnshhusghstghrihgsvgdp
    uffrtefokffrpgfnqfghnecuuegrihhlohhuthemuceftddtnecunecujfgurhephffvve
    fufffkofgjfhggtgfgsehtkeertdertdejnecuhfhrohhmpefpihhklhgrshcuufpnuggv
    rhhluhhnugcuoehnihhklhgrshdrshhouggvrhhluhhnugdorhgvnhgvshgrshesrhgrgh
    hnrghtvggthhdrshgvqeenucggtffrrghtthgvrhhnpeehiefgueevuedtfefhheegkeev
    tdelueeukeevfeduhefhhfejfffggeffleefgeenucevlhhushhtvghrufhiiigvpedtne
    curfgrrhgrmhepmhgrihhlfhhrohhmpehnihhklhgrshdrshhouggvrhhluhhnugesrhgr
    ghhnrghtvggthhdrshgvpdhnsggprhgtphhtthhopeegpdhmohguvgepshhmthhpohhuth
    dprhgtphhtthhopehgvggvrhhtodhrvghnvghsrghssehglhhiuggvrhdrsggvpdhrtghp
    thhtoheplhhinhhugidqrhgvnhgvshgrshdqshhotgesvhhgvghrrdhkvghrnhgvlhdroh
    hrghdprhgtphhtthhopehlihhnuhigqdgtlhhksehvghgvrhdrkhgvrhhnvghlrdhorhhg
    pdhrtghpthhtohepnhhikhhlrghsrdhsohguvghrlhhunhguodhrvghnvghsrghssehrrg
    hgnhgrthgvtghhrdhsvg
X-ME-Proxy: <xmx:Q62GZwGdX4V2ezsHzbp36nKfhSX3ATChSSPyK6bmx9CUNj4sb6NW2g>
    <xmx:Q62GZ8WD9IfBJ2x3cCcvbnPTZbHbuWmw0lhlW9Z_l2paOVDWQAQ96A>
    <xmx:Q62GZzO1AWJB-20aT0gQ3ocmf1RoUURg--E0haf6tQBSMoaljU1zCA>
    <xmx:Q62GZz2KJ_urlHfHCungvRqr9FEdhw-30A9DBZMVVXp0zsNrYGUlTQ>
    <xmx:RK2GZ6xDtyG0y8KSP4FmplMGfuxvAcdV9r7NsUKg4J0AlxuoPB8Q-jqW>
Feedback-ID: i80c9496c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 14 Jan 2025 13:30:27 -0500 (EST)
From: =?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>
To: Geert Uytterhoeven <geert+renesas@glider.be>,
	linux-renesas-soc@vger.kernel.org,
	linux-clk@vger.kernel.org
Cc: =?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>
Subject: [PATCH 2/3] clk: renesas: r8a779g0: Add ISP core clocks
Date: Tue, 14 Jan 2025 19:30:04 +0100
Message-ID: <20250114183005.2761213-3-niklas.soderlund+renesas@ragnatech.se>
X-Mailer: git-send-email 2.48.0
In-Reply-To: <20250114183005.2761213-1-niklas.soderlund+renesas@ragnatech.se>
References: <20250114183005.2761213-1-niklas.soderlund+renesas@ragnatech.se>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Add the ISP core modules clock for Renesas R-Car V4H.

Signed-off-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
---
 drivers/clk/renesas/r8a779g0-cpg-mssr.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/clk/renesas/r8a779g0-cpg-mssr.c b/drivers/clk/renesas/r8a779g0-cpg-mssr.c
index d45571096b96..015b9773cc55 100644
--- a/drivers/clk/renesas/r8a779g0-cpg-mssr.c
+++ b/drivers/clk/renesas/r8a779g0-cpg-mssr.c
@@ -163,6 +163,8 @@ static const struct cpg_core_clk r8a779g0_core_clks[] __initconst = {
 };
 
 static const struct mssr_mod_clk r8a779g0_mod_clks[] __initconst = {
+	DEF_MOD("isp0",		 16,	R8A779G0_CLK_S0D2_VIO),
+	DEF_MOD("isp1",		 17,	R8A779G0_CLK_S0D2_VIO),
 	DEF_MOD("avb0",		211,	R8A779G0_CLK_S0D4_HSC),
 	DEF_MOD("avb1",		212,	R8A779G0_CLK_S0D4_HSC),
 	DEF_MOD("avb2",		213,	R8A779G0_CLK_S0D4_HSC),
-- 
2.48.0


