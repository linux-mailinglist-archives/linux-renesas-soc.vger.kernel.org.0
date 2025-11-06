Return-Path: <linux-renesas-soc+bounces-24284-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id A78C9C3D77F
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 06 Nov 2025 22:16:53 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 33B8A188A688
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  6 Nov 2025 21:17:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 065F3305E0D;
	Thu,  6 Nov 2025 21:16:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b="iHyKnylI";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="GR2KmtKF"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from fout-a6-smtp.messagingengine.com (fout-a6-smtp.messagingengine.com [103.168.172.149])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 15F13305E14;
	Thu,  6 Nov 2025 21:16:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.149
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762463799; cv=none; b=onsDrcbtUys/9x9a9Wqy7QnFN1JM7UeOPqxcnHFzltSxvZVrjujTMvPYwBhi75UhBfrzwB2gZMb3QeFfg/izVlKtz0+UYP5ovLdoT5E0DV4AEJm1nQ8Gv4WCkdqWK35RZr/i0G0B1FHSg+O3YVtXJ0KIVS9Y9pDnW0fGRYqgV+k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762463799; c=relaxed/simple;
	bh=BlSxIirO4zDvXFWYC3m6/RIRcm/xACsYQFpjsk/idT4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=TAUDp5/OXcU4XBsg4g7ZEwkH9RSNZDTtKLo5MXbv2OHss3tXTRTfwSs0N2r/PqOcSTiYLJN5LlDvI0/XQflxghaydJ+cE1lbihbeqZp4hWnulv5b9y+8hYq8PQ5ZIAN3yxvdggmztsb/QLjt5V8m4icsXW+g1GFKV1oSPEMEa5c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se; spf=pass smtp.mailfrom=ragnatech.se; dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b=iHyKnylI; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=GR2KmtKF; arc=none smtp.client-ip=103.168.172.149
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ragnatech.se
Received: from phl-compute-04.internal (phl-compute-04.internal [10.202.2.44])
	by mailfout.phl.internal (Postfix) with ESMTP id 340FDEC0469;
	Thu,  6 Nov 2025 16:16:37 -0500 (EST)
Received: from phl-mailfrontend-02 ([10.202.2.163])
  by phl-compute-04.internal (MEProxy); Thu, 06 Nov 2025 16:16:37 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ragnatech.se; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm2; t=1762463797;
	 x=1762550197; bh=Y9vi6J6j750jY9e/Tmw5Y+tUuRKgbDW0VAmefap5Hfg=; b=
	iHyKnylIABLiSd3dhgHv5IAoBXdi2PAi2gIqKcyFPoOX9zWaFax0ZSSOPCQ5BMHD
	zQPqWQ8bwEV/Mo7Bcxr/UBbhCKSpTO7i/EBWVh2aBxGqoX4azRIs7pTdovALDCY8
	JZAPQVocPVu9Buc0jgk0UZEnKAU+trZvmz/fIjlaOqrwfpUgWSSBVDaFoVheT1F9
	fhNFRVPY3Pq9DeITL//rosuOSovluVwNFy+x3I5hhBICNi2OP1zzroSUqXbKkSEa
	sDcEP17gLBF7r1UmPyeWYzWUfn514+1vBIuSuGbdYYq96/6+GPbvJSw3DNmoE4Zg
	V83WKFcCzLytSRSfl8XMmA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1762463797; x=
	1762550197; bh=Y9vi6J6j750jY9e/Tmw5Y+tUuRKgbDW0VAmefap5Hfg=; b=G
	R2KmtKFzTgjXdeNZWe1bXLL3hYIOwLNrwH8Effge6B9GAxuuonxF4OcxB2eGwkjs
	ignnKTltw0HjDFl2m7Uu03VTaBhSqUTBpnRP5xahll5rgRKJP9uCyWNOKbzYrUjS
	RLAC8+XQ/HiusubdDGkmJxFbAHokf00ZYGMp1eHR/zJU7Y6jznyTaJIGZfkCLaQo
	gmjhG3YKj+AfVLkJbKLRZHypQwHdP3DMA2vGGmvk2KH4VOAB3fpZbSZ3G4nk2Uun
	pHnJkNoKwCyPiRwbqacJL4Jf6KcfGQahx+3okeFHoKb+vhsML69rC3MBD3A5Q4MQ
	DksC3xjkI1qqBIgT5+UMQ==
X-ME-Sender: <xms:NBANaRop0wofu4EISdnH0gh2QdYG08RXAI-02VOeTumtby87qxV7wQ>
    <xme:NBANaZpT0JvbXDVa-9laCHz2PJrmwMevY9_nyjFUdc1QRG9ZjWlUk7wFjkiKNyyVF
    QnVAQqxZcY-UFZGItSTrEvd31cyot9xO7PgQ5qhGh71Asz6Us97yR8>
X-ME-Received: <xmr:NBANaZBdiLTCrLICEhomYGBfCfVVIPkL5vWG6jz278rlMcn2v7-oy0qTmNSJ3mXHQlGTEsdpPm2JC6JnNJ9hzwRc>
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
X-ME-Proxy: <xmx:NBANaftGUUVhrsu2BpAL3xMWO46Qtb5tcZ_7NbxbU_hZ_WOESuJjeQ>
    <xmx:NBANaQJ9PyxLxrZ-ArMpFPGKXwY9kyNnhRzazCH_buWONtElfMd4gg>
    <xmx:NBANaeaLqD2O97sy3-IrynOXYRo1yr19KcI-Q8GogBj7wc927mf71Q>
    <xmx:NBANaaB4yhFxoZsfGGwFMWEyFKNDI6BmTnbtXY6BzDAzLKB8KT-5Uw>
    <xmx:NRANaTGVmcdpBz_ynJ5tOIFm88qDtqR2ntuAqm00T4238-_NL0dFbejn>
Feedback-ID: i80c9496c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 6 Nov 2025 16:16:36 -0500 (EST)
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
Subject: [PATCH v2 3/4] clk: renesas: r8a779a0: Add ZG Core clock
Date: Thu,  6 Nov 2025 22:16:03 +0100
Message-ID: <20251106211604.2766465-4-niklas.soderlund+renesas@ragnatech.se>
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

Describe the ZG Core clock needed to operate the PowerVR GPU.

Signed-off-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
---
* Changes since v1
- Change sort order of new entry in enum clk_ids.
- Rework the clock to use CLK_TYPE_GEN4_Z.
- Split addition of clock id to r8a779a0-cpg-mssr.h into separate patch.
---
 drivers/clk/renesas/r8a779a0-cpg-mssr.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/drivers/clk/renesas/r8a779a0-cpg-mssr.c b/drivers/clk/renesas/r8a779a0-cpg-mssr.c
index 1be7b9592aa6..449611432059 100644
--- a/drivers/clk/renesas/r8a779a0-cpg-mssr.c
+++ b/drivers/clk/renesas/r8a779a0-cpg-mssr.c
@@ -26,7 +26,7 @@
 
 enum clk_ids {
 	/* Core Clock Outputs exported to DT */
-	LAST_DT_CORE_CLK = R8A779A0_CLK_OSC,
+	LAST_DT_CORE_CLK = R8A779A0_CLK_ZG,
 
 	/* External Input Clocks */
 	CLK_EXTAL,
@@ -39,6 +39,7 @@ enum clk_ids {
 	CLK_PLL21,
 	CLK_PLL30,
 	CLK_PLL31,
+	CLK_PLL4,
 	CLK_PLL5,
 	CLK_PLL1_DIV2,
 	CLK_PLL20_DIV2,
@@ -65,6 +66,7 @@ enum clk_ids {
 #define CPG_PLL21CR	0x0838	/* PLL21 Control Register */
 #define CPG_PLL30CR	0x083c	/* PLL30 Control Register */
 #define CPG_PLL31CR	0x0840	/* PLL31 Control Register */
+#define CPG_PLL4CR	0x0844	/* PLL4 Control Register */
 
 static const struct cpg_core_clk r8a779a0_core_clks[] __initconst = {
 	/* External Clock Inputs */
@@ -79,6 +81,7 @@ static const struct cpg_core_clk r8a779a0_core_clks[] __initconst = {
 	DEF_PLL(".pll21", CLK_PLL21,	CPG_PLL21CR),
 	DEF_PLL(".pll30", CLK_PLL30,	CPG_PLL30CR),
 	DEF_PLL(".pll31", CLK_PLL31,	CPG_PLL31CR),
+	DEF_PLL(".pll4",  CLK_PLL4,	CPG_PLL4CR),
 
 	DEF_FIXED(".pll1_div2",		CLK_PLL1_DIV2,	CLK_PLL1,	2, 1),
 	DEF_FIXED(".pll20_div2",	CLK_PLL20_DIV2,	CLK_PLL20,	2, 1),
@@ -98,6 +101,7 @@ static const struct cpg_core_clk r8a779a0_core_clks[] __initconst = {
 	/* Core Clock Outputs */
 	DEF_GEN4_Z("z0",	R8A779A0_CLK_Z0,	CLK_TYPE_GEN4_Z,	CLK_PLL20,	2, 0),
 	DEF_GEN4_Z("z1",	R8A779A0_CLK_Z1,	CLK_TYPE_GEN4_Z,	CLK_PLL21,	2, 8),
+	DEF_GEN4_Z("zg",	R8A779A0_CLK_ZG,	CLK_TYPE_GEN4_Z,	CLK_PLL4,	2, 88),
 	DEF_FIXED("zx",		R8A779A0_CLK_ZX,	CLK_PLL20_DIV2,	2, 1),
 	DEF_FIXED("s1d1",	R8A779A0_CLK_S1D1,	CLK_S1,		1, 1),
 	DEF_FIXED("s1d2",	R8A779A0_CLK_S1D2,	CLK_S1,		2, 1),
-- 
2.51.1


