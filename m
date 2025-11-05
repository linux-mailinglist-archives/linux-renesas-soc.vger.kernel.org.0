Return-Path: <linux-renesas-soc+bounces-24189-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id CD1C8C38547
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 06 Nov 2025 00:18:40 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 9344618C4DA0
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  5 Nov 2025 23:19:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 51E5B2F5A1D;
	Wed,  5 Nov 2025 23:18:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b="I/OLZibq";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="NINpg2lG"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from fout-a8-smtp.messagingengine.com (fout-a8-smtp.messagingengine.com [103.168.172.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C1122F533B;
	Wed,  5 Nov 2025 23:18:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.151
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762384707; cv=none; b=lbAiKWsZ6vZSiu2pTvAvJ47LbVbEeNkxurqDVnbgr/BzULb84MYrbP5Q7YGXZ6Zja6Gw9qdXqHRhG7mtMrmD+posaCpn+LFLqA+ycdTqPIDZQf9r3kAb76HjEHD0FYk8Z1oeNv3F7wnmRAC1JxoPpa/9b4vckx8+uOkxX0go1oU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762384707; c=relaxed/simple;
	bh=VBxJGzUIs0zvPeG/KIgXvl/V4XXjvzSMYuw/cRZMSjk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=qLXAZHGPideZusuU4++k64YqXvhCsxK/Hj8GqqVLFkFvarLUL1ipp1akKeirpk7ZWmUjQthek8n4HaAR4LrdowVPZmcBxZAc8h89pJ2cycZuJ0QRbnNDuT7ZjMgQfcPMs+nmWB3N7lw27JyCf9UGuDzVdgYizJUiqIrvRjiMVec=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se; spf=pass smtp.mailfrom=ragnatech.se; dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b=I/OLZibq; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=NINpg2lG; arc=none smtp.client-ip=103.168.172.151
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ragnatech.se
Received: from phl-compute-03.internal (phl-compute-03.internal [10.202.2.43])
	by mailfout.phl.internal (Postfix) with ESMTP id D3343EC0176;
	Wed,  5 Nov 2025 18:18:24 -0500 (EST)
Received: from phl-mailfrontend-01 ([10.202.2.162])
  by phl-compute-03.internal (MEProxy); Wed, 05 Nov 2025 18:18:24 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ragnatech.se; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm2; t=1762384704;
	 x=1762471104; bh=7jaQjpSsB8lMJo/M0U6io98IEjwBYyqHBM3EcAH4An4=; b=
	I/OLZibq3PkueWmzaenBo5o1xv4E1FTGgb1tytZss3AXl0mGNBZvxFUpbxgMnj2n
	nNdzditXCzk8KB2xsIevh3ZwA8+g7yqVrJYAbo/QiU0UpZ9VOmBOf/rXQauWPtHz
	DWe/GSjjn0kXwTBvJfK2wRsnAKquO+zj+9LUVfnxMSKpGfUbP0+PMAefNFY+4J6L
	VHdCg5AJpO+NFsxvCyUTY7YyCAofJKrLBQYP1oYhpUwHeu9JX7PpFza6+vbiSSKu
	d61Gk+Wy/FgifnPdkb9tnXhvJD2XjkdjCQL8M+T/S6YnLCrmJKeow4lnVpbgjdIT
	MCzoE2hNdK44CO/NGXeEMQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1762384704; x=
	1762471104; bh=7jaQjpSsB8lMJo/M0U6io98IEjwBYyqHBM3EcAH4An4=; b=N
	INpg2lG0j9veOyilmbxiA7D/4rOEBENflG1ay6bEbcQUHjt8OqixGd8Fw7D3RPUr
	Bmw6Y+4VdtG3wGr7kaqDm2B6WO95qEsyNBPQaoLTHQM2iKfD71Rcxx5psviiIyjd
	RcdXKnGQkjZ9j+Cr+fTw/oXaiQL+6ul8Se0xOWCBnUzP62rRvsGTKeT3Hc7asvF0
	AlaLHVRTc+0xCXAZgR0PsDqapdJp2PTyLBWWQLi2PW/LbDcukuG6u7sDXXikZ0kY
	2AClLkVsYrvU9AEgVBXkutatNOggCEBhBly03gMNcRBtsoGgg/VJS2iL5IPOH9U4
	IJG+DC3IA4wQFty3dZ0pQ==
X-ME-Sender: <xms:QNsLaZ1w8qO9drc5y0hzUTlFE6Q_d6mpiuqbIfchDIzk3QTMZlajAw>
    <xme:QNsLaWF4JW9TqO4IKW5qnsx23uJHBy6L9zmYCPqANyjCYwNQ6FNqrI0QubXj7nweO
    a0pILuDSZPe7mFqnED7E_fCJ6UirjPETCdajjhUhJMuhyZPFdeOqKI>
X-ME-Received: <xmr:QNsLaUvQR6jEPcfdT1hdOB3hRMpPW41OnWfS7CijFg63qDNnH3sBzcJ2SIaAA77FvqdHr6jFs2OLZuFsTikXVIp3>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdeggddukeehvddtucetufdoteggodetrf
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
X-ME-Proxy: <xmx:QNsLaZoiTf2LUU77lbNOtsGdfUNUrRpmGecuFQfyZ8vcNJnZ2SX5wA>
    <xmx:QNsLabXZYCItTGQ2IHU_8SXlZy3c4RaHFW8cDUTfAJitNhyfNRvQww>
    <xmx:QNsLaR3WKbIR4_ZUXssKNJobh4clEYuEdLj3MjA-RADazobj0s86iA>
    <xmx:QNsLaQt8OPL82ENC1UjVfnSEU3ZaJ_B7PF-yzyrXYrA1MjM62-CgAg>
    <xmx:QNsLaSx5uMdnEAWy_xCAlwTZycVS9AeQX6DO4817TG_7NDupbsx51KpD>
Feedback-ID: i80c9496c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 5 Nov 2025 18:18:24 -0500 (EST)
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
Subject: [PATCH 2/2] clk: renesas: r8a779a0: Add 3dge module clock
Date: Thu,  6 Nov 2025 00:18:15 +0100
Message-ID: <20251105231815.1927239-3-niklas.soderlund+renesas@ragnatech.se>
X-Mailer: git-send-email 2.51.1
In-Reply-To: <20251105231815.1927239-1-niklas.soderlund+renesas@ragnatech.se>
References: <20251105231815.1927239-1-niklas.soderlund+renesas@ragnatech.se>
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
---
 drivers/clk/renesas/r8a779a0-cpg-mssr.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/clk/renesas/r8a779a0-cpg-mssr.c b/drivers/clk/renesas/r8a779a0-cpg-mssr.c
index a35110349769..c77b9b6977ec 100644
--- a/drivers/clk/renesas/r8a779a0-cpg-mssr.c
+++ b/drivers/clk/renesas/r8a779a0-cpg-mssr.c
@@ -144,6 +144,7 @@ static const struct cpg_core_clk r8a779a0_core_clks[] __initconst = {
 };
 
 static const struct mssr_mod_clk r8a779a0_mod_clks[] __initconst = {
+	DEF_MOD("3dge",		  0,	R8A779A0_CLK_ZG),
 	DEF_MOD("isp0",		 16,	R8A779A0_CLK_S1D1),
 	DEF_MOD("isp1",		 17,	R8A779A0_CLK_S1D1),
 	DEF_MOD("isp2",		 18,	R8A779A0_CLK_S1D1),
-- 
2.51.1


