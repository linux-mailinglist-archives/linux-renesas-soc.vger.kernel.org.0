Return-Path: <linux-renesas-soc+bounces-12125-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id CE3E6A1101E
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 14 Jan 2025 19:30:34 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 9AF40188B110
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 14 Jan 2025 18:30:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2814A1FC7F9;
	Tue, 14 Jan 2025 18:30:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b="rLnxgPYF";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="wtFsWnUq"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from fout-b4-smtp.messagingengine.com (fout-b4-smtp.messagingengine.com [202.12.124.147])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D08E1FC0EF;
	Tue, 14 Jan 2025 18:30:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.12.124.147
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736879430; cv=none; b=qnpk1gzoAF0yl/vuBIR6gRQYRAQ7aOn6EIlOLW2/V0XHBW3Ou3kcCkmxP47aER0CUVpkTLoJyYoYXkWq+zRdaR5jU52ElFuYSxxhM3q6pGFVhnNBk/5Q5EjWHj2E7G4wqhD/2DzH0A/z/1PeX5p6BOBjNAqJHDxXWRG5wZE5XhM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736879430; c=relaxed/simple;
	bh=9rFhk3E9L8G2Z1ETEcSOPjK3RUjX1Y28NzpVYNWLP2Q=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=f/tk3XxVWqRXuFsx8GQXkg2aqEf5cmYp5ueviAfvepkscOtgxKHFMCpnB+pMpQ5qi00Yrvlbb/Bz89p6EJ/7DyLZbG0B63bEq8KpPh/bfIxxJfZL3wChG5kLYi+cQfgP+AL7nbjiP2LVZlnm/lOwrb2bxYO8uUYA5br4yjSNtAg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se; spf=pass smtp.mailfrom=ragnatech.se; dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b=rLnxgPYF; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=wtFsWnUq; arc=none smtp.client-ip=202.12.124.147
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ragnatech.se
Received: from phl-compute-06.internal (phl-compute-06.phl.internal [10.202.2.46])
	by mailfout.stl.internal (Postfix) with ESMTP id 1C235114010B;
	Tue, 14 Jan 2025 13:30:25 -0500 (EST)
Received: from phl-mailfrontend-02 ([10.202.2.163])
  by phl-compute-06.internal (MEProxy); Tue, 14 Jan 2025 13:30:25 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ragnatech.se; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm1; t=1736879424;
	 x=1736965824; bh=T4VjSMnMucOZyRg0uiXg9xlBjSK37frSjzKERTKTVek=; b=
	rLnxgPYFNMVY4sjI9WfHrkrQnxIL5qWrUVqNIMxLlgiQTI0Z4HV8Frhxpz8mUOJ6
	ip2vxiutVcW23iQaQ0eFskcC0dk2qRP6lHbNN4NtD2csBIkiblM1jPI0X2QVOZe7
	GfnuQgFiNWQofC/jQ3ee8fVDJuDmNu+6Vgwx+QStNGv5kuLNcahSHJ9rG4bPdEnZ
	0DDrFp+zYwcNuDFBFYF1CXhJIuryxaqddR3naDrKOZMOqhVLB8+US+DUIr7nzEGO
	vrAthquhXySrPKZfxAq53O/MxaCRtsUuoJDI/IndkRRWCrH0XCMQUmkcE3Xc93e8
	e2vuvOrxKnBrGYTnXS4g7w==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1736879424; x=
	1736965824; bh=T4VjSMnMucOZyRg0uiXg9xlBjSK37frSjzKERTKTVek=; b=w
	tFsWnUqzEQkAlXGLQPAR0GKftlJGb3h/IhrvUGZ94NAj/zsYY8/hKJhbdpr7d/mD
	VjYluvEw7jECtRfBCjSTPVX5iQzGNZymi5tg41FqnH9UMkZyXtuhkewXq2ffKfCK
	0TM4KINCZ7yMQCEDX5ODRulB+27o0FzjELmDsifPpbuLSdZnGIen69HNo07UDw3P
	trGJ/R4pk5ZUKpJ4PxtP2QmbLRY7KtcM3Fu8HAPZN7BDuCI504GyV1MjFgSeHeEa
	1a0mr0n0Dz//8CHrLobUX1W6PajpF4jCeKK3Ep1mtAIRyfg+sO8n8VvQnun8ZV9c
	vpwxi9LUpuRtmpTIDfNZg==
X-ME-Sender: <xms:QK2GZ3pSbNK9e5aqa9Xg45UP_Ep4tojMNudA0PaTocot7os4cxIh5Q>
    <xme:QK2GZxrWpgYKn-1UQjQ5IJCpuvSD5op9tmVLNB51Eydp9keoej18K_ut_7l8RhUz3
    RV8yrz1cLLsIjYviHQ>
X-ME-Received: <xmr:QK2GZ0PdvJxYBmq3xOK0Vpevd3LtkySXkcybIxnuISVQ4_YpnAl8MNXXo1BvM3Ymnexs3YKnNZI_E1EyK5BvB_liCg>
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
X-ME-Proxy: <xmx:QK2GZ67T28OjwGSysRnHM1u5RH_GWrN6l0kTREMO6ZBepfiQS3fGgg>
    <xmx:QK2GZ245cym9BD8CZSC-7eMmcXguuKs7xf2WcvUG38_QwPyF5oFo7g>
    <xmx:QK2GZyjk9gHAY71C5HX7WrCgJWmkwbj4VmPYdznI_504_OW_cyPPTQ>
    <xmx:QK2GZ46mmB7GbA5Lv6RGXaI-I1JMsA4Q8JzFC3En5KY8SomfuqmbHg>
    <xmx:QK2GZx05l1oweP412eY2Jd0h8B5-mqXX57-ZT1F90GcSUYfUSoGGGr33>
Feedback-ID: i80c9496c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 14 Jan 2025 13:30:24 -0500 (EST)
From: =?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>
To: Geert Uytterhoeven <geert+renesas@glider.be>,
	linux-renesas-soc@vger.kernel.org,
	linux-clk@vger.kernel.org
Cc: =?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>
Subject: [PATCH 1/3] clk: renesas: r8a779a0: Add ISP core clocks
Date: Tue, 14 Jan 2025 19:30:03 +0100
Message-ID: <20250114183005.2761213-2-niklas.soderlund+renesas@ragnatech.se>
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

Add the ISP core modules clock for Renesas R-Car V3U.

Signed-off-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
---
 drivers/clk/renesas/r8a779a0-cpg-mssr.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/clk/renesas/r8a779a0-cpg-mssr.c b/drivers/clk/renesas/r8a779a0-cpg-mssr.c
index 4a5b4e2afa92..1be7b9592aa6 100644
--- a/drivers/clk/renesas/r8a779a0-cpg-mssr.c
+++ b/drivers/clk/renesas/r8a779a0-cpg-mssr.c
@@ -138,6 +138,10 @@ static const struct cpg_core_clk r8a779a0_core_clks[] __initconst = {
 };
 
 static const struct mssr_mod_clk r8a779a0_mod_clks[] __initconst = {
+	DEF_MOD("isp0",		 16,	R8A779A0_CLK_S1D1),
+	DEF_MOD("isp1",		 17,	R8A779A0_CLK_S1D1),
+	DEF_MOD("isp2",		 18,	R8A779A0_CLK_S1D1),
+	DEF_MOD("isp3",		 19,	R8A779A0_CLK_S1D1),
 	DEF_MOD("avb0",		211,	R8A779A0_CLK_S3D2),
 	DEF_MOD("avb1",		212,	R8A779A0_CLK_S3D2),
 	DEF_MOD("avb2",		213,	R8A779A0_CLK_S3D2),
-- 
2.48.0


