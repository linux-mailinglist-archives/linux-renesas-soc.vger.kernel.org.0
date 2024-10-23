Return-Path: <linux-renesas-soc+bounces-10004-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B2139ACF4D
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 23 Oct 2024 17:49:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id A4BA71F2554D
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 23 Oct 2024 15:49:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BCBE11CBE8B;
	Wed, 23 Oct 2024 15:47:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b="lrtE3D5b";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="FLE/IO3F"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from fout-b8-smtp.messagingengine.com (fout-b8-smtp.messagingengine.com [202.12.124.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1629876034;
	Wed, 23 Oct 2024 15:47:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.12.124.151
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729698424; cv=none; b=B5wc+1tgFKAOxSrYuYyoPx5VT3Rpm+H6K9n9H9PsHdFg/CSncHwTsRFPBTSTLIBDpe9D3DxFO31gzOWrViBILOdhKjqwSdOwltZ0UyAKuzKNCYNN2NVy8T1JLmNO1UxXu+8kkVj/qMzb0E8x7en96W7ER52ckFoiPufh7IUacXI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729698424; c=relaxed/simple;
	bh=2FodRWZGCETmaQUpK+d1GhrWy3k2AnmUSs91pizIT8M=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Eezs4Tsm4U3YhZAFcjRPr3PrLXU0O9P08z6rfYS56qCcSjpzxyg/q9llasUiyfWMTx+wmwvDSIjHKsAIIPQcDeDQXfeTo901d/DTA4eJAVSubrAw3XLDgox+GrFWiXzMH96fb7nE7UTblh3xe1FYvh+r5l6OkOJwrEeuGPKodH8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se; spf=pass smtp.mailfrom=ragnatech.se; dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b=lrtE3D5b; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=FLE/IO3F; arc=none smtp.client-ip=202.12.124.151
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ragnatech.se
Received: from phl-compute-01.internal (phl-compute-01.phl.internal [10.202.2.41])
	by mailfout.stl.internal (Postfix) with ESMTP id E844E11400E9;
	Wed, 23 Oct 2024 11:47:00 -0400 (EDT)
Received: from phl-mailfrontend-02 ([10.202.2.163])
  by phl-compute-01.internal (MEProxy); Wed, 23 Oct 2024 11:47:01 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ragnatech.se; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm2; t=1729698420;
	 x=1729784820; bh=aZY/YI9ZC9vMzH8Y/uHW2mlUaONrkgq6SgSZz+J7X7g=; b=
	lrtE3D5b2yyXGWy8XZ3Doi6NPFxj7g/sXZuCQixn6AMdZOR1JNoC2/ZwMH5Vy4ZZ
	Nv+WCDYeKB3HPZb4f1539awS53WuVD8IuebZj1NUxGRrWi32KzHHpMvOEACvzG/f
	FQ3lh33PdvAG5ZeFbA4o4tnIHQ9akw9cmPWoH25/gb25CifhIXcWYOvAL8k3FPLK
	AY7stp9aLGajmuBBzzXK+AQZo03sh96VHTzcwZgb5VD/o+GcAxos7me9ODUhL88P
	5UZw9HOYThbC0GiokAIapJ2omUXYHxhgMC5GZpYejaBHatsP+sGjvipk9NVt3Tnd
	z1xCD7TNA4qUTPs1dEEw1g==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1729698420; x=
	1729784820; bh=aZY/YI9ZC9vMzH8Y/uHW2mlUaONrkgq6SgSZz+J7X7g=; b=F
	LE/IO3F9f3R7CKo5S6Hg00U1vx5wKbf67PEtydpGfZtTYwsp9dQRcEs/D7+yJEXe
	ykpfjKeVRvY3xU1zybeJdAWCcg4kra4KueNSMwKD5DFSLICy1ZAU4sJ+WrEr0jKq
	aPm3WQccQrUlT7rd89lAHEHES+oa8DgUlZcJTC0scwPsNzBkUfCbkNEQ4EG0ckDX
	hlM91XLXGhFlZ/3xa5KVVZtOTVnomdSKwoAlfdttsYaDIl7FeoA+tbsEj1tvrg/o
	EIGfgVgHIqnjst6bnmLPbDTRL2OAA6xwHxUnn4IKx1iUEAEdrMspLCk/UnkqkkzW
	JDk2e4XZir9xFnEOpo1sw==
X-ME-Sender: <xms:dBoZZ5-rr20QJcMTa3e08xyATv8ymLJn_yjKCFUF_13UwVgzBukBfQ>
    <xme:dBoZZ9sIh-iHrRkWmBeIvwJTpepTXz6EZAabtFrNGUdURRmpe05kUxM4aLFfzp-4F
    zIMBb5CfS9MWiPQ6wg>
X-ME-Received: <xmr:dBoZZ3Dft14cCrCvjMcj5V2_lGxOtztHSAEafnmOVKbeRpsJerQtAdpgSJIBPOx3FLk8TNKuJaEY_yu8TYer_hXWCw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeftddrvdeijedgleduucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdggtfgfnhhsuhgsshgtrhhisggvpdfu
    rfetoffkrfgpnffqhgenuceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnh
    htshculddquddttddmnecujfgurhephffvvefufffkofgjfhggtgfgsehtkeertdertdej
    necuhfhrohhmpefpihhklhgrshcuufpnuggvrhhluhhnugcuoehnihhklhgrshdrshhoug
    gvrhhluhhnugdorhgvnhgvshgrshesrhgrghhnrghtvggthhdrshgvqeenucggtffrrght
    thgvrhhnpeehiefgueevuedtfefhheegkeevtdelueeukeevfeduhefhhfejfffggeffle
    efgeenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehn
    ihhklhgrshdrshhouggvrhhluhhnugesrhgrghhnrghtvggthhdrshgvpdhnsggprhgtph
    htthhopeejpdhmohguvgepshhmthhpohhuthdprhgtphhtthhopehgvggvrhhtodhrvghn
    vghsrghssehglhhiuggvrhdrsggvpdhrtghpthhtoheprhhosghhsehkvghrnhgvlhdroh
    hrghdprhgtphhtthhopehkrhiikhdoughtsehkvghrnhgvlhdrohhrghdprhgtphhtthho
    pegtohhnohhrodgutheskhgvrhhnvghlrdhorhhgpdhrtghpthhtoheplhhinhhugidqrh
    gvnhgvshgrshdqshhotgesvhhgvghrrdhkvghrnhgvlhdrohhrghdprhgtphhtthhopegu
    vghvihgtvghtrhgvvgesvhhgvghrrdhkvghrnhgvlhdrohhrghdprhgtphhtthhopehnih
    hklhgrshdrshhouggvrhhluhhnugdorhgvnhgvshgrshesrhgrghhnrghtvggthhdrshgv
X-ME-Proxy: <xmx:dBoZZ9cuLOdPwVeJhUzLzdUndRc4jM-7IX-Gz5AUIH21Lb1viEAUPw>
    <xmx:dBoZZ-PfXPxmZzLGwZx1IW83zlpgfFifb_XKd6VGCbIFH9_FY4_gUA>
    <xmx:dBoZZ_nh26R9HDkZrCZkykcDkmgjzb2LJwUHSNMongGnit0FsQBXkw>
    <xmx:dBoZZ4t-znCzezBu6567Mm4402-Ex5qtyyRBGvIl1YbKwWeN1kvSBQ>
    <xmx:dBoZZ9d_AC5oLtZuGurJ1Mc_sdoJR4oVqn0WD9aMmfGg6webxJpfNoAo>
Feedback-ID: i80c9496c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 23 Oct 2024 11:47:00 -0400 (EDT)
From: =?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>
To: Geert Uytterhoeven <geert+renesas@glider.be>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-renesas-soc@vger.kernel.org,
	devicetree@vger.kernel.org
Cc: =?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>
Subject: [PATCH v2 1/2] arm64: dts: renesas: r8a779a0: Remove address- and size-cells from AVB[1-5]
Date: Wed, 23 Oct 2024 17:46:42 +0200
Message-ID: <20241023154643.4025941-2-niklas.soderlund+renesas@ragnatech.se>
X-Mailer: git-send-email 2.46.2
In-Reply-To: <20241023154643.4025941-1-niklas.soderlund+renesas@ragnatech.se>
References: <20241023154643.4025941-1-niklas.soderlund+renesas@ragnatech.se>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

When describing the PHYs on the Falcon Ethernet breakout board mdio
nodes will be needed to describe the connections, and each mdio node
will need to contain these two properties instead. This will make the
address-cells and size-cells described in the base SoC include file
redundant and they will produce warnings, remove them.

Signed-off-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
---
 arch/arm64/boot/dts/renesas/r8a779a0.dtsi | 10 ----------
 1 file changed, 10 deletions(-)

diff --git a/arch/arm64/boot/dts/renesas/r8a779a0.dtsi b/arch/arm64/boot/dts/renesas/r8a779a0.dtsi
index 7156b1a542e8..fe6d97859e4a 100644
--- a/arch/arm64/boot/dts/renesas/r8a779a0.dtsi
+++ b/arch/arm64/boot/dts/renesas/r8a779a0.dtsi
@@ -765,8 +765,6 @@ avb1: ethernet@e6810000 {
 			rx-internal-delay-ps = <0>;
 			tx-internal-delay-ps = <0>;
 			iommus = <&ipmmu_ds1 1>;
-			#address-cells = <1>;
-			#size-cells = <0>;
 			status = "disabled";
 		};
 
@@ -814,8 +812,6 @@ avb2: ethernet@e6820000 {
 			rx-internal-delay-ps = <0>;
 			tx-internal-delay-ps = <0>;
 			iommus = <&ipmmu_ds1 2>;
-			#address-cells = <1>;
-			#size-cells = <0>;
 			status = "disabled";
 		};
 
@@ -863,8 +859,6 @@ avb3: ethernet@e6830000 {
 			rx-internal-delay-ps = <0>;
 			tx-internal-delay-ps = <0>;
 			iommus = <&ipmmu_ds1 3>;
-			#address-cells = <1>;
-			#size-cells = <0>;
 			status = "disabled";
 		};
 
@@ -912,8 +906,6 @@ avb4: ethernet@e6840000 {
 			rx-internal-delay-ps = <0>;
 			tx-internal-delay-ps = <0>;
 			iommus = <&ipmmu_ds1 4>;
-			#address-cells = <1>;
-			#size-cells = <0>;
 			status = "disabled";
 		};
 
@@ -961,8 +953,6 @@ avb5: ethernet@e6850000 {
 			rx-internal-delay-ps = <0>;
 			tx-internal-delay-ps = <0>;
 			iommus = <&ipmmu_ds1 11>;
-			#address-cells = <1>;
-			#size-cells = <0>;
 			status = "disabled";
 		};
 
-- 
2.46.2


