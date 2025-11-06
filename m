Return-Path: <linux-renesas-soc+bounces-24281-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 85A5FC3D75A
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 06 Nov 2025 22:16:39 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 05A531884774
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  6 Nov 2025 21:17:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 06CB22E7BC2;
	Thu,  6 Nov 2025 21:16:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b="cnrdhx6/";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="wnDYRAIT"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from fhigh-a1-smtp.messagingengine.com (fhigh-a1-smtp.messagingengine.com [103.168.172.152])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 23AE6BA3F;
	Thu,  6 Nov 2025 21:16:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.152
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762463793; cv=none; b=DfnGbw2gGWsctAG21vTgN7FvoOdEgkXrskikVmrXDgQlifvojqRg65VcI+0LNGDHUun7IV7qa4g1YMQcWkXijK+8d07p3gXtvMtcMLEMggeCvuO4SYC6BgODxoyWrpaubsLOLQEktGwfL5pkXlNuuE3J45qmRpCkwNgYuW1RD9o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762463793; c=relaxed/simple;
	bh=pD7zixxOaQisBmcpJPLdLq646Y3FKks9l0Dg9rBE4UA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=Ymj3HbkVR0QdeahVGRDXzGVjmeV08THqTT96mJSE3CWm5omQ+m3vymw6j5fDpU5a1oC+9ESlLODyykrxD8Np8ufD4ebKSkW/CrUCiIQCklxaKv2YI4qvtyP6tc67fLmy7Y2Q09iOg32bJq/LlxCUNJN1tLEcBJdPeNZGb9pJ25s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se; spf=pass smtp.mailfrom=ragnatech.se; dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b=cnrdhx6/; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=wnDYRAIT; arc=none smtp.client-ip=103.168.172.152
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ragnatech.se
Received: from phl-compute-03.internal (phl-compute-03.internal [10.202.2.43])
	by mailfhigh.phl.internal (Postfix) with ESMTP id 04CAC140015F;
	Thu,  6 Nov 2025 16:16:30 -0500 (EST)
Received: from phl-mailfrontend-02 ([10.202.2.163])
  by phl-compute-03.internal (MEProxy); Thu, 06 Nov 2025 16:16:30 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ragnatech.se; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:message-id:mime-version:reply-to
	:subject:subject:to:to; s=fm2; t=1762463790; x=1762550190; bh=2z
	1keW3T+Q8BNwuQODT36eGaSqAnI0JeLU7azFOAqWs=; b=cnrdhx6/P+s6yXmJUy
	Bwp319WmCNLT6BpVIe93ybRNA0iaivbYkGzPYw9ODVH+qrTk6NDNiua+e3UUoV1u
	bdq3D+CuQ9mzi2vAVnPZo2D3d8IvRkD6YfUckURV3mRfdbevPds61rEWdi8ici37
	3wO1u64/8aYWhZDHVnmQN3iI9gK2TqSvMHHQoVnl3e0AwwBXhcGLv4+gWJi2QqXn
	d9NyvXZsdohPb4kRZafEnViZetJqRROSXU9wXRrFFiQLeH9irlB32aovRxXLFDLO
	CTv4rCIkg9AH0ghryJYkTaxQSX0K7OmcPzuz/xN2o9QV1cd3TCXYNIEmse64x1up
	xkkw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:message-id:mime-version:reply-to:subject
	:subject:to:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm3; t=1762463790; x=1762550190; bh=2z1keW3T+Q8BNwuQODT36eGaSqAn
	I0JeLU7azFOAqWs=; b=wnDYRAITsJNY3zvQqV4y/rWazwMDmfMzXc/4zualzn1h
	lFgB7lb2M4ONEI0ECgkhBhlwbB2mWF6I00GtcN0zeltktuOqBNGtI4+AvMaSXd6X
	wtXbd1lpVZsaN8OH2u4r1islJE3eeyqBWsubt0mBapm5v0oRDSUj0xG0H7xfrkpi
	3tUZFHYXrFehf6OF/b/DLU0M1VzUvaCpR/sSoV0qlJzSFtEwPJ6hUZ8kEnGAVV6T
	YhG/1J5ok0LyGO87er8zMClPdDrjtIrq5k2lbPvzQLRutIJMQs7aeyqD/Ji2Mcyz
	3brWvA69jdwQAMnY34AtHRYyIZ5h5TwpKXHSCWFFRA==
X-ME-Sender: <xms:LRANabhszhCwL6rc1jzSJaHyNZp4GSguenREa_tJY02NAixK7Pezbw>
    <xme:LRANaeARNECPdTc-ISWFMSEqGAGUWlhjHI_5l4mrvtAPM4sNSL4V1TLlyy_p_TVdH
    38ZrcUUNOUcxTfHuEixkdjkUcXvBCVitRnIyg2JWE8C1G00GXHKj-Eu>
X-ME-Received: <xmr:LRANaV5Fe2xcRacEaA9wxpJhi40RtqAWgrZhv9tx2ZjYvrOpvhW4p-2nC0nR72OhIPIXM5AFb9IfmGCzL5WB2Wbc>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdeggddukeejkeegucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceu
    rghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujf
    gurhephffvvefufffkofggtgfgsehtkeertdertdejnecuhfhrohhmpefpihhklhgrshcu
    ufpnuggvrhhluhhnugcuoehnihhklhgrshdrshhouggvrhhluhhnugdorhgvnhgvshgrsh
    esrhgrghhnrghtvggthhdrshgvqeenucggtffrrghtthgvrhhnpeehudelteetkefgffef
    udefuedvjeeivdekhfevieefgeffheeltddvvefhfeetgeenucevlhhushhtvghrufhiii
    gvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehnihhklhgrshdrshhouggvrhhluhhn
    ugesrhgrghhnrghtvggthhdrshgvpdhnsggprhgtphhtthhopedutddpmhhouggvpehsmh
    htphhouhhtpdhrtghpthhtohepghgvvghrthdorhgvnhgvshgrshesghhlihguvghrrdgs
    vgdprhgtphhtthhopehmthhurhhquhgvthhtvgessggrhihlihgsrhgvrdgtohhmpdhrtg
    hpthhtohepshgsohihugeskhgvrhhnvghlrdhorhhgpdhrtghpthhtoheprhhosghhsehk
    vghrnhgvlhdrohhrghdprhgtphhtthhopehkrhiikhdoughtsehkvghrnhgvlhdrohhrgh
    dprhgtphhtthhopegtohhnohhrodgutheskhgvrhhnvghlrdhorhhgpdhrtghpthhtohep
    lhhinhhugidqrhgvnhgvshgrshdqshhotgesvhhgvghrrdhkvghrnhgvlhdrohhrghdprh
    gtphhtthhopehlihhnuhigqdgtlhhksehvghgvrhdrkhgvrhhnvghlrdhorhhgpdhrtghp
    thhtohepuggvvhhitggvthhrvggvsehvghgvrhdrkhgvrhhnvghlrdhorhhg
X-ME-Proxy: <xmx:LRANabEN6SlV4IDtS4gX42a0buxgzFytVzHzHFnHcL-J4IpV5Dm95Q>
    <xmx:LRANaYCcLuGqgbO313C53tJ1L18uscMpBe3VWjmf82wzDyAITjFlzA>
    <xmx:LRANaYwo7Gkk3jbBigVk8XyKpvWEti6wNkYsP4zVOSa2e4cgrfvA4Q>
    <xmx:LRANaU5PWQbB2U9HCrtSuv4HHMMQA_JULXuNpsWdWojJtYhAiMqpDw>
    <xmx:LRANaX_J2_5Re_fvef4RyoO9MZ2_ZLOnLXQoJ7IPil9vX_Mm91w4LQHa>
Feedback-ID: i80c9496c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 6 Nov 2025 16:16:28 -0500 (EST)
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
Subject: [PATCH v2 0/4] clk: renesas: r8a779a0: Add clocks needed for GPU
Date: Thu,  6 Nov 2025 22:16:00 +0100
Message-ID: <20251106211604.2766465-1-niklas.soderlund+renesas@ragnatech.se>
X-Mailer: git-send-email 2.51.1
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi Geert,

This small series adds the clocks needed to use the GPU on V3U. Patch 
1/4 adds the core clock ID so it can be used by both driver and 
bindings. Patch 2/4 extends the Gen4 CPG driver to allow the ZG clock to 
be described. And finally patch 3/4 and 4/4 adds the clocks needed to 
operate the GPU.

With this and the corresponding DT patches I can operate the GPU on V3U.

    powervr fd000000.gsx: [drm] loaded firmware powervr/rogue_15.5.1.64_v1.fw
    powervr fd000000.gsx: [drm] FW version v1.0 (build 6889268 OS)
    powervr fd000000.gsx: [drm] Unsupported quirks in firmware image
    [drm] Initialized powervr 1.0.0 for fd000000.gsx on minor 1

And run test applications such as gears.

See individual patches for changelog.

Niklas Söderlund (4):
  dt-bindings: clock: r8a779a0: Add ZG core clock
  clk: renesas: rcar-gen4: Add support for clocks dividers in FRQCRB
  clk: renesas: r8a779a0: Add ZG Core clock
  clk: renesas: r8a779a0: Add 3dge module clock

 drivers/clk/renesas/r8a779a0-cpg-mssr.c       | 7 ++++++-
 drivers/clk/renesas/rcar-gen4-cpg.c           | 9 +++++++--
 include/dt-bindings/clock/r8a779a0-cpg-mssr.h | 1 +
 3 files changed, 14 insertions(+), 3 deletions(-)

-- 
2.51.1


