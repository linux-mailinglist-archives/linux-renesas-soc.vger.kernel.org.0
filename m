Return-Path: <linux-renesas-soc+bounces-24285-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id DA736C3D76A
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 06 Nov 2025 22:16:46 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id C9F644E30AA
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  6 Nov 2025 21:16:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DEC9D30597D;
	Thu,  6 Nov 2025 21:16:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b="XeltaKq8";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="a655zFtt"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from fhigh-a1-smtp.messagingengine.com (fhigh-a1-smtp.messagingengine.com [103.168.172.152])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 24E2D3019A9;
	Thu,  6 Nov 2025 21:16:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.152
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762463801; cv=none; b=VqAd/ZsIfBp0TGdF0XpXxu9poDyOu2dtG1QD3pw7XiJW/hkbinagECMQod1KmkoQjR4ZBm5W9gKnSn8oeR6A83ZN/IvfDKtuc8EXeY6ieR4AvqMUANWotgzNz7/AfsrKDaP61OJdT8nyhyolaF7pzCGDc9jEJ48pDw6oMH713W0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762463801; c=relaxed/simple;
	bh=1+pvFbZsXWCO3prIxD+XvomMTr3ux2NETaMn4tOXkUs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=H8UluZ5oNAe542ZRnTNUWjC2+0z5KSz21u/FEwrmPMmOmhUj5fHlvWgQTcBYFLWfgh0bCMqHPz8Bi0VgMVRcoN63Yk73EQdvKg1Xm/v4kb87vmXWtWSTLfio3IN8WDcYOXQJq6c2LDIM3KiO5GYvxhNlePnlKJluPz9noxtvb1A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se; spf=pass smtp.mailfrom=ragnatech.se; dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b=XeltaKq8; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=a655zFtt; arc=none smtp.client-ip=103.168.172.152
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ragnatech.se
Received: from phl-compute-01.internal (phl-compute-01.internal [10.202.2.41])
	by mailfhigh.phl.internal (Postfix) with ESMTP id 3C47F1400055;
	Thu,  6 Nov 2025 16:16:39 -0500 (EST)
Received: from phl-mailfrontend-01 ([10.202.2.162])
  by phl-compute-01.internal (MEProxy); Thu, 06 Nov 2025 16:16:39 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ragnatech.se; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm2; t=1762463799;
	 x=1762550199; bh=+8VhVhBIM0aOLPpcUjRu9hCflXf/VQC4NfIF1MrwwSY=; b=
	XeltaKq86y/SLvAWKmdVuMw0/BaGMqHhNXXgSMIL7bn0pL31x8KcJYFzeJVqklhT
	ViuwvnMgFDs/VVZCkTxNpLP0H86wppSFExxAlNZlsLbvRsedSn1Xje/svtjLxwli
	IQq6pnXbJ27vyywzT55/eWLkbqpM5xyVpGFD7KKN8E8cEh+tlKvKTOvLc89UdccV
	HBHbSzCWj24yZwirEnrI9u+JbptD2TP3MnbjltdiOZjXu0XZY6v0aYvkSvHWhiat
	7w2kSQk2Y74LnFxxKu3vJ7gt74ZzZbbf0XFcJ6ydgUqNJ72u/Y8/V14TVQZh+Cjm
	nRPxwzGmrQ0OhMquf1DzwQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1762463799; x=
	1762550199; bh=+8VhVhBIM0aOLPpcUjRu9hCflXf/VQC4NfIF1MrwwSY=; b=a
	655zFttyUvzUqpJAsVGl6oKs7QAX7Np4RmgTKEieNgwWXts36ak3n7qYK0TssNNo
	5+fZ7tlN+yDK7MxaHAWaEMLQI1En45L1+lgf/KRnoCjSChZAbV/ciwndIvKllF68
	CCij6I62PdN2ty5eXPEoRZCZ+8/dBuZy2VV8j7uozls3fxBsK28EvlhqlgJvYBHp
	J1Z3sktaG9vcSx33lpnSui40yLq2POtJyjahSrNscYBLg5IhA1XUY17eEhRYK/kp
	9Tn2MkitV1HlOvJpCrtrJqRe5qKbtyNOfgrn1ozqBSaMpi1l9Mu+oyeNxuFi8c5U
	urWnVv+XTjIZxXpXO8r4Q==
X-ME-Sender: <xms:NhANadOu-i_CBFEZn05r6F91JnOX_kTFg4bRSpOPtJUAYbueXeY0mg>
    <xme:NhANaV95VKS7Kp_Eog2DhQHaLIVA5W70YbyQNJszoF6AKyU7THOQpFXAm4LErn9gR
    rtoCnoIrJKGU5i2rpvhwIOnAdnFFLqlV7NoeLsxNnn4Tkhbava0Mxk>
X-ME-Received: <xmr:NhANaXFwV7ZjALNBPt8GMo_IbzQcNGNzhwEHXwaOQHtBjm27QxXK3beC7l8t3D0lNHoHv31ivXNQT6BwWsLq9Aas>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdeggddukeejkeegucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceu
    rghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujf
    gurhephffvvefufffkofgjfhggtgfgsehtkeertdertdejnecuhfhrohhmpefpihhklhgr
    shcuufpnuggvrhhluhhnugcuoehnihhklhgrshdrshhouggvrhhluhhnugdorhgvnhgvsh
    grshesrhgrghhnrghtvggthhdrshgvqeenucggtffrrghtthgvrhhnpeehiefgueevuedt
    fefhheegkeevtdelueeukeevfeduhefhhfejfffggeffleefgeenucevlhhushhtvghruf
    hiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehnihhklhgrshdrshhouggvrhhl
    uhhnugesrhgrghhnrghtvggthhdrshgvpdhnsggprhgtphhtthhopedutddpmhhouggvpe
    hsmhhtphhouhhtpdhrtghpthhtohepghgvvghrthdorhgvnhgvshgrshesghhlihguvghr
    rdgsvgdprhgtphhtthhopehmthhurhhquhgvthhtvgessggrhihlihgsrhgvrdgtohhmpd
    hrtghpthhtohepshgsohihugeskhgvrhhnvghlrdhorhhgpdhrtghpthhtoheprhhosghh
    sehkvghrnhgvlhdrohhrghdprhgtphhtthhopehkrhiikhdoughtsehkvghrnhgvlhdroh
    hrghdprhgtphhtthhopegtohhnohhrodgutheskhgvrhhnvghlrdhorhhgpdhrtghpthht
    oheplhhinhhugidqrhgvnhgvshgrshdqshhotgesvhhgvghrrdhkvghrnhgvlhdrohhrgh
    dprhgtphhtthhopehlihhnuhigqdgtlhhksehvghgvrhdrkhgvrhhnvghlrdhorhhgpdhr
    tghpthhtohepuggvvhhitggvthhrvggvsehvghgvrhdrkhgvrhhnvghlrdhorhhg
X-ME-Proxy: <xmx:NhANach23pq2CEgAPw14PP8N7SGVrGGKBmem-0yIVYQ3RojFDziXxg>
    <xmx:NxANaUsFS0nCobnXIBeZqPVGEPaF7fpaW_Nigyb2s2qadf9DKps5Lg>
    <xmx:NxANafsoT-kWiYzpUpQOEK3M1QP8fTpJqh6Wgk_D0qNs6K8bUdLM4Q>
    <xmx:NxANaZE4ON7k_RKY03WPllN5CwG9lb4ptktQvYeFMbSTYlt6oGYK3w>
    <xmx:NxANadJPuoGqZAm3ZI8b6vdwal4qeqEGHgmj6B1jEBxdEYz5m8991J0r>
Feedback-ID: i80c9496c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 6 Nov 2025 16:16:38 -0500 (EST)
From: =?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>
To: Geert Uytterhoeven <geert+renesas@glider.be>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-renesas-soc@vger.kernel.org,
	linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org
Cc: =?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>
Subject: [PATCH v2 4/4] clk: renesas: r8a779a0: Add 3dge module clock
Date: Thu,  6 Nov 2025 22:16:04 +0100
Message-ID: <20251106211604.2766465-5-niklas.soderlund+renesas@ragnatech.se>
X-Mailer: git-send-email 2.51.1
In-Reply-To: <20251106211604.2766465-1-niklas.soderlund+renesas@ragnatech.se>
References: <20251106211604.2766465-1-niklas.soderlund+renesas@ragnatech.se>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Describe the 3DGE module clock needed to operate the PowerVR GPU.

Signed-off-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
 drivers/clk/renesas/r8a779a0-cpg-mssr.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/clk/renesas/r8a779a0-cpg-mssr.c b/drivers/clk/renesas/r8a779a0-cpg-mssr.c
index 449611432059..d67dff05d9f4 100644
--- a/drivers/clk/renesas/r8a779a0-cpg-mssr.c
+++ b/drivers/clk/renesas/r8a779a0-cpg-mssr.c
@@ -142,6 +142,7 @@ static const struct cpg_core_clk r8a779a0_core_clks[] __initconst = {
 };
 
 static const struct mssr_mod_clk r8a779a0_mod_clks[] __initconst = {
+	DEF_MOD("3dge",		  0,	R8A779A0_CLK_ZG),
 	DEF_MOD("isp0",		 16,	R8A779A0_CLK_S1D1),
 	DEF_MOD("isp1",		 17,	R8A779A0_CLK_S1D1),
 	DEF_MOD("isp2",		 18,	R8A779A0_CLK_S1D1),
-- 
2.51.1


