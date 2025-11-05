Return-Path: <linux-renesas-soc+bounces-24188-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [213.196.21.55])
	by mail.lfdr.de (Postfix) with ESMTPS id CB983C38535
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 06 Nov 2025 00:18:33 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 51D0F344589
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  5 Nov 2025 23:18:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 35A2E2F5498;
	Wed,  5 Nov 2025 23:18:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b="ZkImkeD4";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="aHIqNlbc"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from fhigh-a3-smtp.messagingengine.com (fhigh-a3-smtp.messagingengine.com [103.168.172.154])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 131CC2F39BC;
	Wed,  5 Nov 2025 23:18:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.154
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762384706; cv=none; b=YM6+6lMTze6KmBgoobTfDywBZOcLXNOJzT+v3alDxxSAja/tk9IDAx6gENyGu/eqe8WcBU7KQgFeXxr1vSKd2ZFL60mb+50YZTVzp8FcJOY+bWzon2Rg+6CsJPSw/Q6bzoa4WSJepQ9fJz3yhSkpMsAN2cTbnAklWlUQqKlN3cI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762384706; c=relaxed/simple;
	bh=d/GQ0Bpc91eiOogmXxHG58HCJlzrHNvmS/hh+7w1lXo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=NcLREFRpYwj5SlEpraq75G0xi8dKVteJ5n61LtR3vAw5PZorVH75PqfKDShIx1Ao3y++bOSioROwkZ5gNu4kZp8H1cZaY6+cHmph+Q616CZbulgj8TV6BIG//T8COH1D43CvsQ4VqIcMhr1Yb36SpbIaXcxbF2QqI3gNdA3VQuc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se; spf=pass smtp.mailfrom=ragnatech.se; dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b=ZkImkeD4; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=aHIqNlbc; arc=none smtp.client-ip=103.168.172.154
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ragnatech.se
Received: from phl-compute-06.internal (phl-compute-06.internal [10.202.2.46])
	by mailfhigh.phl.internal (Postfix) with ESMTP id 295D31400074;
	Wed,  5 Nov 2025 18:18:22 -0500 (EST)
Received: from phl-mailfrontend-02 ([10.202.2.163])
  by phl-compute-06.internal (MEProxy); Wed, 05 Nov 2025 18:18:22 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ragnatech.se; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm2; t=1762384702;
	 x=1762471102; bh=kkURefky1H5ATvFHlskzqDknuWob6uveueJie/ktxQY=; b=
	ZkImkeD4vE9EvLGrHLuHbEygeNjo+rjmMpR16Nl/1To1YDRkpgFNBRjFJnn4zIlM
	xgPAZ2/KEh9LOvnHtCmZn1AEWKKwahjBLbXT3E+XViG8/1KzPepX97g5eAWWE4jI
	zQx+7zTr3bB8Be0oXuHfmMDVO0LNm3OSQpH7Og6SZ/sBjl+K9cwE7ULJh4WfZ2yc
	24cpCsqAGABt2PkVUA+ru1Z/oDFh4N10NZ5dES+7gX30vRqcNujNmeKslMuV9cll
	Q2Ll5rVSGxKcdUNFFW6qGfP1/KM1usasBFeuf7vSITtmoRDDl2M0MEHdfGEVVmu0
	SKfMJ1+0hDCB6k2rbhyxaw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1762384702; x=
	1762471102; bh=kkURefky1H5ATvFHlskzqDknuWob6uveueJie/ktxQY=; b=a
	HIqNlbcVxfP7ioGN1Pu61tsxGMvlxSsDzGdyt1HVF8TWEXlC9ZxsBf/vZr5euZ82
	Dqwq/eELPtCygf9Kax1SCIPdBjgUMo0ILDTnECJf6YdwvM7xBxAK9Wca8N2A3xiQ
	nk0xa4nAA8oGJ4MTqNPiwH5QmMpqwkcDhFn7F5w7PcVwdV0evMUIFASpLHWpjU8M
	mIsk2bEc4gX+by401PEIDmjLJ81RNjEvq1OlqUJNpA98Jm1uiFHKZEy2RIlqaZA9
	bSEFreb1dbGoeAkYyY//mguJ8VS/Fhs4NTYIfygpvGCGfccZLEv4g9HvsfCs95Dz
	k2s+scPp3budJQF2RBmcA==
X-ME-Sender: <xms:PdsLaQrLqPh43uLXcrih6YtaiFKkLxTzk0ggfpLc8fnN2uZ9Ankkkg>
    <xme:PdsLacrmgzhpB9vrlY_f2N-53vy3EwXZpncCDMtFhe8BoPeZ0QECY-LPSpufIqiSQ
    q1DyRDzV-xpDJt-HzWdERPbSBn9_SBMeDbqZ0fQw8ALtzO3HmMRZcI>
X-ME-Received: <xmr:PdsLaQApexPXNGBa5FOKcknXkxd6RtF4fDBICTbhDMYWcCFmo938_G3RaVD5aeDzILS8snyFTIxhLj9kgDiv_wnI>
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
X-ME-Proxy: <xmx:PdsLaauFuIBDRRCaYX2GIBAIvB-YeG4r_L_BaMXWBE8KduFIcE9amA>
    <xmx:PdsLafJNx6MlnO-m3KpuqVNl7FM6Da1Ycev0IVYzoBZNxDSJFrJizA>
    <xmx:PdsLaRYidOVnV-6HlJXstk2TqkyfaJpwMuGp9ZKE5SoEwqvco-UW-w>
    <xmx:PdsLaRCLqIAiYxBB1uiN2nGVuMrwEyWCOOUx0lMpFHAnTBtChUjrtQ>
    <xmx:PtsLaaGEA_kuhaZ7qrpEZHxiL1NepyHpWh-Fao65HPnVwBIpBN5ojZMR>
Feedback-ID: i80c9496c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 5 Nov 2025 18:18:21 -0500 (EST)
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
Subject: [PATCH 1/2] clk: renesas: r8a779a0: Add ZG Core clock
Date: Thu,  6 Nov 2025 00:18:14 +0100
Message-ID: <20251105231815.1927239-2-niklas.soderlund+renesas@ragnatech.se>
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

Describe the ZG Core clock needed to operate the PowerVR GPU.

Signed-off-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
---
 drivers/clk/renesas/r8a779a0-cpg-mssr.c       | 8 +++++++-
 include/dt-bindings/clock/r8a779a0-cpg-mssr.h | 1 +
 2 files changed, 8 insertions(+), 1 deletion(-)

diff --git a/drivers/clk/renesas/r8a779a0-cpg-mssr.c b/drivers/clk/renesas/r8a779a0-cpg-mssr.c
index 1be7b9592aa6..a35110349769 100644
--- a/drivers/clk/renesas/r8a779a0-cpg-mssr.c
+++ b/drivers/clk/renesas/r8a779a0-cpg-mssr.c
@@ -26,7 +26,7 @@
 
 enum clk_ids {
 	/* Core Clock Outputs exported to DT */
-	LAST_DT_CORE_CLK = R8A779A0_CLK_OSC,
+	LAST_DT_CORE_CLK = R8A779A0_CLK_ZG,
 
 	/* External Input Clocks */
 	CLK_EXTAL,
@@ -35,6 +35,7 @@ enum clk_ids {
 	/* Internal Core Clocks */
 	CLK_MAIN,
 	CLK_PLL1,
+	CLK_PLL4,
 	CLK_PLL20,
 	CLK_PLL21,
 	CLK_PLL30,
@@ -45,6 +46,7 @@ enum clk_ids {
 	CLK_PLL21_DIV2,
 	CLK_PLL30_DIV2,
 	CLK_PLL31_DIV2,
+	CLK_PLL4_DIV2,
 	CLK_PLL5_DIV2,
 	CLK_PLL5_DIV4,
 	CLK_S1,
@@ -65,6 +67,7 @@ enum clk_ids {
 #define CPG_PLL21CR	0x0838	/* PLL21 Control Register */
 #define CPG_PLL30CR	0x083c	/* PLL30 Control Register */
 #define CPG_PLL31CR	0x0840	/* PLL31 Control Register */
+#define CPG_PLL4CR	0x0844	/* PLL4 Control Register */
 
 static const struct cpg_core_clk r8a779a0_core_clks[] __initconst = {
 	/* External Clock Inputs */
@@ -79,12 +82,14 @@ static const struct cpg_core_clk r8a779a0_core_clks[] __initconst = {
 	DEF_PLL(".pll21", CLK_PLL21,	CPG_PLL21CR),
 	DEF_PLL(".pll30", CLK_PLL30,	CPG_PLL30CR),
 	DEF_PLL(".pll31", CLK_PLL31,	CPG_PLL31CR),
+	DEF_PLL(".pll4",  CLK_PLL4,	CPG_PLL4CR),
 
 	DEF_FIXED(".pll1_div2",		CLK_PLL1_DIV2,	CLK_PLL1,	2, 1),
 	DEF_FIXED(".pll20_div2",	CLK_PLL20_DIV2,	CLK_PLL20,	2, 1),
 	DEF_FIXED(".pll21_div2",	CLK_PLL21_DIV2,	CLK_PLL21,	2, 1),
 	DEF_FIXED(".pll30_div2",	CLK_PLL30_DIV2,	CLK_PLL30,	2, 1),
 	DEF_FIXED(".pll31_div2",	CLK_PLL31_DIV2,	CLK_PLL31,	2, 1),
+	DEF_FIXED(".pll4_div2",		CLK_PLL4_DIV2,	CLK_PLL4,	2, 1),
 	DEF_FIXED(".pll5_div2",		CLK_PLL5_DIV2,	CLK_PLL5,	2, 1),
 	DEF_FIXED(".pll5_div4",		CLK_PLL5_DIV4,	CLK_PLL5_DIV2,	2, 1),
 	DEF_FIXED(".s1",		CLK_S1,		CLK_PLL1_DIV2,	2, 1),
@@ -98,6 +103,7 @@ static const struct cpg_core_clk r8a779a0_core_clks[] __initconst = {
 	/* Core Clock Outputs */
 	DEF_GEN4_Z("z0",	R8A779A0_CLK_Z0,	CLK_TYPE_GEN4_Z,	CLK_PLL20,	2, 0),
 	DEF_GEN4_Z("z1",	R8A779A0_CLK_Z1,	CLK_TYPE_GEN4_Z,	CLK_PLL21,	2, 8),
+	DEF_FIXED("zg",		R8A779A0_CLK_ZG,	CLK_PLL4_DIV2,	2, 1),
 	DEF_FIXED("zx",		R8A779A0_CLK_ZX,	CLK_PLL20_DIV2,	2, 1),
 	DEF_FIXED("s1d1",	R8A779A0_CLK_S1D1,	CLK_S1,		1, 1),
 	DEF_FIXED("s1d2",	R8A779A0_CLK_S1D2,	CLK_S1,		2, 1),
diff --git a/include/dt-bindings/clock/r8a779a0-cpg-mssr.h b/include/dt-bindings/clock/r8a779a0-cpg-mssr.h
index f1d737ca7ca1..124a6b8856df 100644
--- a/include/dt-bindings/clock/r8a779a0-cpg-mssr.h
+++ b/include/dt-bindings/clock/r8a779a0-cpg-mssr.h
@@ -51,5 +51,6 @@
 #define R8A779A0_CLK_CBFUSA		40
 #define R8A779A0_CLK_R			41
 #define R8A779A0_CLK_OSC		42
+#define R8A779A0_CLK_ZG			43
 
 #endif /* __DT_BINDINGS_CLOCK_R8A779A0_CPG_MSSR_H__ */
-- 
2.51.1


