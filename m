Return-Path: <linux-renesas-soc+bounces-12182-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 34CFEA12A89
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 15 Jan 2025 19:11:31 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id BEF233A4B4F
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 15 Jan 2025 18:11:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 91EFC1D5ACD;
	Wed, 15 Jan 2025 18:11:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b="ujmvYAd8";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="RCjjpvZb"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from fhigh-a3-smtp.messagingengine.com (fhigh-a3-smtp.messagingengine.com [103.168.172.154])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA83C1D5AB8;
	Wed, 15 Jan 2025 18:11:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.154
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736964689; cv=none; b=E1bsJSrmf3dIDFnLQJ48qjNleybK5+1uQTHVET50ClZgluHm4VUTYs/wPhhMc974hO38691+HsDOgDMKodwa5Au9N9+PgU95jkReU8txbPgiOD3IT3gkfRhS5KhktwuuKSoND6VO7/TvW7TGNqbEQmLry4muHH3PrDLItkAkPFs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736964689; c=relaxed/simple;
	bh=gJmZfZ2Bm2onTdHUlk7R1OaDiL8lqwPbzDJ2YQJTAQE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=OWlr/2WgYH3lkpONrfxJoWWNKj3bYLV/Mq9Gjnnzr25Vf5Oto6ZDCgxvZqtPtPb8dmBK/ayAQkFI9b2TVLIj0QLUfSe9mpjTdRwozriX5Q8IVO7fstcPSCNiXfL1QBriS5h6w7tcVokbODGxyYQzHIO4P9pNgaaq9UDoL94Bn/g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se; spf=pass smtp.mailfrom=ragnatech.se; dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b=ujmvYAd8; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=RCjjpvZb; arc=none smtp.client-ip=103.168.172.154
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ragnatech.se
Received: from phl-compute-04.internal (phl-compute-04.phl.internal [10.202.2.44])
	by mailfhigh.phl.internal (Postfix) with ESMTP id D3B2B11400FE;
	Wed, 15 Jan 2025 13:11:24 -0500 (EST)
Received: from phl-mailfrontend-01 ([10.202.2.162])
  by phl-compute-04.internal (MEProxy); Wed, 15 Jan 2025 13:11:24 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ragnatech.se; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm1; t=1736964684;
	 x=1737051084; bh=+GyvUiUkeiBvl1VtW7YYzkd8lnLRt8hqGo05u+Mvt0w=; b=
	ujmvYAd8LUjUX6B5nLMGMEMaxL8798oQ5uI+aMeoGmDNGNNrw+DvXXFs+cX8EmwT
	r3KMhPMlCBwEcQx795XV1fX/VG0bsISajJ0yhRMw+/4ZFLLZDckgeeCE12NFocO+
	0+cZhBtqUiyi5JJGms+7tT/8daHw5vvuQnsucGBJcTe4jlYcuIkZ+kErhROzjXFD
	oRnqHXGkIn95I95JJ1WqxzEcM6znMWUnBWTmc5K9+qpLUmXqjGa4goDN38CEOdnW
	JisUXLg4h8NbbjBQg0z/2ZK8/au603gmNE9TsZuHKsY24rYK6qxOfAB+kQgdpxz0
	upO/oBHIqTxIeakkcfpmPg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1736964684; x=
	1737051084; bh=+GyvUiUkeiBvl1VtW7YYzkd8lnLRt8hqGo05u+Mvt0w=; b=R
	CjjpvZbwQuoaYKgD1PUctzR9fXNKXrLoj88AXR9+gKo0ETn59foqVIzw/zvddTPP
	ZDIPJLzL1gHkZ4toLy8+GCxiFE1ArKkyRRUX+P8ldL0JZ+LrUfv9zzK4oWuSrxcl
	rk63xLzoCcwfGn3bQmoCHPuu0lzDwrzdOSHZGor46pJTfqS2mOaSiCV1mvLrTERT
	4GdJBfqehq1Hjy9rP0YTC8Bob5+BdUIY1TgZSW4/V+ECOnb/VWyk38mvOnBjJ8Aq
	1w5IoLQPL4YPCZNoJnwHX4eAGMuzTr7j2fb15hdVE4GjoAOgTCZyhb3AVRJ5nqVO
	0qj78TJGqNS7tpQe9Eoog==
X-ME-Sender: <xms:TPqHZ1elCJTuxxeM3a7awF6FtuLSPfz7x_BqRB5vOl7iM338g_Zhdg>
    <xme:TPqHZzOsZPKLhTnYIJlfjMBW1hNmQMQhSHlzzR1mbxHb15Ujwgo3bpibin2zhatzo
    uIDFvpAHtwjRTe2Kp8>
X-ME-Received: <xmr:TPqHZ-h795fgYdmiTxkn-xB9SumrPPOIrFbe_YntEj7JxxtZSjJqgxCCH6yi-U250qwnPPnaBqa8T0yaEkJTb7cvuQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefuddrudehledgkedvucetufdoteggodetrfdotf
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
    hgpdhrtghpthhtohepuggvvhhitggvthhrvggvsehvghgvrhdrkhgvrhhnvghlrdhorhhg
    pdhrtghpthhtohepnhhikhhlrghsrdhsohguvghrlhhunhguodhrvghnvghsrghssehrrg
    hgnhgrthgvtghhrdhsvg
X-ME-Proxy: <xmx:TPqHZ--ddbym91WmhsS1wyEnyfb38gLVGDX0_qXs8raCVVUV_HSQCg>
    <xmx:TPqHZxu9kADL7JGRh6rS7NdNN8cpyXnmmnHxavUifYKRuW1V1HOVrw>
    <xmx:TPqHZ9FiUYc5KS4kSvl3Bs1VrShkhb_P5atUlbJCaC_V90x7btT3og>
    <xmx:TPqHZ4NquIUAh1RwVR5eJOvtDfoDCNjExZoyfuEPHEH3fjkuXDn-Hg>
    <xmx:TPqHZ7Kmzd1eTCF2qGJKcmVPtRlYmUpSLsIuGOpISG78ta7ysPgZY5pV>
Feedback-ID: i80c9496c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 15 Jan 2025 13:11:24 -0500 (EST)
From: =?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>
To: Geert Uytterhoeven <geert+renesas@glider.be>,
	linux-renesas-soc@vger.kernel.org,
	devicetree@vger.kernel.org
Cc: =?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>
Subject: [PATCH 1/2] arm64: dts: renesas: r8a779h0: Add FCPVX instance
Date: Wed, 15 Jan 2025 19:10:49 +0100
Message-ID: <20250115181050.3728275-2-niklas.soderlund+renesas@ragnatech.se>
X-Mailer: git-send-email 2.48.0
In-Reply-To: <20250115181050.3728275-1-niklas.soderlund+renesas@ragnatech.se>
References: <20250115181050.3728275-1-niklas.soderlund+renesas@ragnatech.se>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Add device node for the FCPVX instance on R-Car V4M.

Signed-off-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
---
 arch/arm64/boot/dts/renesas/r8a779h0.dtsi | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/arch/arm64/boot/dts/renesas/r8a779h0.dtsi b/arch/arm64/boot/dts/renesas/r8a779h0.dtsi
index d0c01c0fdda2..dbd03587b8fd 100644
--- a/arch/arm64/boot/dts/renesas/r8a779h0.dtsi
+++ b/arch/arm64/boot/dts/renesas/r8a779h0.dtsi
@@ -1908,6 +1908,15 @@ fcpvd0: fcp@fea10000 {
 			resets = <&cpg 508>;
 		};
 
+		fcpvx0: fcp@fedb0000 {
+			compatible = "renesas,fcpv";
+			reg = <0 0xfedb0000 0 0x200>;
+			clocks = <&cpg CPG_MOD 1100>;
+			power-domains = <&sysc R8A779H0_PD_A3ISP0>;
+			resets = <&cpg 1100>;
+			iommus = <&ipmmu_vi1 24>;
+		};
+
 		vspd0: vsp@fea20000 {
 			compatible = "renesas,vsp2";
 			reg = <0 0xfea20000 0 0x8000>;
-- 
2.48.0


