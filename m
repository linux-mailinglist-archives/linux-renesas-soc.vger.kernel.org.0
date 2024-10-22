Return-Path: <linux-renesas-soc+bounces-9971-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 17B859AB61E
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 22 Oct 2024 20:48:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 390241C23FC4
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 22 Oct 2024 18:48:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 656481C9EDD;
	Tue, 22 Oct 2024 18:48:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b="XpfEhzLh";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="OapGIPXW"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from fhigh-a2-smtp.messagingengine.com (fhigh-a2-smtp.messagingengine.com [103.168.172.153])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D3541C9B8A;
	Tue, 22 Oct 2024 18:48:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.153
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729622917; cv=none; b=LG4C0iUT3vTEP1+tWvMxNVh1SiIeCQZWfD9ybdVCFIPFbhHvq7YQZbdRYZ04+gr5NWGu7EKxfGvg40q2eEPyxQj+fLxgAu0JLrOIxK0+4XxbOhdF/s2NGLaTogkTmgOhycWE/aAV8abohiAsZAxrbDK1ODjk+fcxhgQYpuMJdU8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729622917; c=relaxed/simple;
	bh=2FodRWZGCETmaQUpK+d1GhrWy3k2AnmUSs91pizIT8M=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=HG2+ez9sG7tv0bv/KGQ4Oj2u4+fGCfpINOZ8sRC8k+SDYyLmRmSZd+JUeLi6w1KKgzv7ZZltERztuMkRESfnveFyCvxkzUHO0R7m8y+XuUqCpryL/UD4f+T/AG2MxWMaZWSlrgA8m/FA68L56FQNeCxKNa9ENotSeHoGzmLpZck=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se; spf=pass smtp.mailfrom=ragnatech.se; dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b=XpfEhzLh; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=OapGIPXW; arc=none smtp.client-ip=103.168.172.153
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ragnatech.se
Received: from phl-compute-01.internal (phl-compute-01.phl.internal [10.202.2.41])
	by mailfhigh.phl.internal (Postfix) with ESMTP id 9CD6211400DA;
	Tue, 22 Oct 2024 14:48:33 -0400 (EDT)
Received: from phl-mailfrontend-01 ([10.202.2.162])
  by phl-compute-01.internal (MEProxy); Tue, 22 Oct 2024 14:48:33 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ragnatech.se; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm2; t=1729622913;
	 x=1729709313; bh=aZY/YI9ZC9vMzH8Y/uHW2mlUaONrkgq6SgSZz+J7X7g=; b=
	XpfEhzLhXEIGz9Y+q/x8OjVmbZZpSDF3Hfh+bCTXmyOwjCX6ilDJ9h3pbainm3fV
	f5d/GEaxCYNJOm+hrODtOmf7PBBXgWHUWXVz0wO73Wsc9ZZLucMMycJPGPloBoot
	8mAli67fs40Ix3KYK8EyDPA32nzWxOGM25V1l3z1oahBQ4ov9kkxo7K9iaWOjRdq
	xUNKZcn19iMu4wFb4a0Puop55i+bK61vQKaSFfYEE4upkxg05tg8JdHbFMQ68R5O
	507xOs2/dKpQyWFvPNxxOqIDOf0R5CJLK6GPmNRDEvAMcHS6mN3WCTkg0sWM5Wpu
	J284oRTfKFEBCil2+OWJkw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1729622913; x=
	1729709313; bh=aZY/YI9ZC9vMzH8Y/uHW2mlUaONrkgq6SgSZz+J7X7g=; b=O
	apGIPXWDFroGPUQ1FWGixnDjvy2jDztde2Ri3sf4ticRzCooQKnvsLCiID443Acg
	8ZozW5qrksOX7xy3d1xZsQmCpn3nptyttN8LaWoMThzjAQpU0oOJdqJMjZkvOp/t
	w6TQdtQsW/mvYFhQyr711Oj+TuPyI2qBFILEM5UO0faQqcpNF71ZfYHkpt/gmNa5
	ZjvWErKl3SDEjotpob5i05d4qsBd847TMlmdWPUPAObGxlLxfA2svdxtkRghtVx5
	hwbI8zdFf4oP9lZteU0i7NG8rXVfwNUQMxrgTAhxuhpgrjJAVDfc8kwNTedvFX1J
	CNOolVli0mO4gh82+0Ffg==
X-ME-Sender: <xms:gfMXZ4VavLRTy_wF2ZKoEtelXxANxnrZzF95oD208jqxHUBb980odg>
    <xme:gfMXZ8kkGD5NM3BKthXLlKymKBsXfgInTDGNOPZude_-vTK6HLPiztqdxEF_WKDzH
    jAIDrleqWpqG0TJSQY>
X-ME-Received: <xmr:gfMXZ8aXAFAuiSuUB8FdHUzyynyrCQvHPPujaQCbeGXJN89G-S_2CnzSlEdocqpLT5oly4Ciw6x6RLeYO3yBtvtCeg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeftddrvdeihedguddvlecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpggftfghnshhusghstghrihgsvgdp
    uffrtefokffrpgfnqfghnecuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivg
    hnthhsucdlqddutddtmdenucfjughrpefhvfevufffkffojghfgggtgfesthekredtredt
    jeenucfhrhhomheppfhikhhlrghsucfunpguvghrlhhunhguuceonhhikhhlrghsrdhsoh
    guvghrlhhunhguodhrvghnvghsrghssehrrghgnhgrthgvtghhrdhsvgeqnecuggftrfgr
    thhtvghrnhepheeigfeuveeutdefhfehgeekvedtleeuueekveefudehhffhjeffgfegff
    elfeegnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhep
    nhhikhhlrghsrdhsohguvghrlhhunhgusehrrghgnhgrthgvtghhrdhsvgdpnhgspghrtg
    hpthhtohepjedpmhhouggvpehsmhhtphhouhhtpdhrtghpthhtohepghgvvghrthdorhgv
    nhgvshgrshesghhlihguvghrrdgsvgdprhgtphhtthhopehrohgshheskhgvrhhnvghlrd
    horhhgpdhrtghpthhtohepkhhriihkodgutheskhgvrhhnvghlrdhorhhgpdhrtghpthht
    oheptghonhhorhdoughtsehkvghrnhgvlhdrohhrghdprhgtphhtthhopehlihhnuhigqd
    hrvghnvghsrghsqdhsohgtsehvghgvrhdrkhgvrhhnvghlrdhorhhgpdhrtghpthhtohep
    uggvvhhitggvthhrvggvsehvghgvrhdrkhgvrhhnvghlrdhorhhgpdhrtghpthhtohepnh
    hikhhlrghsrdhsohguvghrlhhunhguodhrvghnvghsrghssehrrghgnhgrthgvtghhrdhs
    vg
X-ME-Proxy: <xmx:gfMXZ3XvB3yx0ht8QIkcEgML4sSp031ZUaHgY_DJ6E9W4QJqLqp6UA>
    <xmx:gfMXZynXo2KMZCnITmPfwx4Yk3SnzLWriW8eUo_I-CG1xREnmrbbTQ>
    <xmx:gfMXZ8cOxJtMyrw8yLIeeB5TjaOJwp-l8zasP3ymklWijqWQBIYC6w>
    <xmx:gfMXZ0Gm0hvw1zl18TG6shrLDRtGLNHtZ6XYnwkpOCWDmBGp1hRWLA>
    <xmx:gfMXZ0Vz6PFhQPqcsit44yQ481fs1kbOU2W4NibT_jQi1Bex7GsDn8lv>
Feedback-ID: i80c9496c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 22 Oct 2024 14:48:33 -0400 (EDT)
From: =?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>
To: Geert Uytterhoeven <geert+renesas@glider.be>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-renesas-soc@vger.kernel.org,
	devicetree@vger.kernel.org
Cc: =?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>
Subject: [PATCH 1/2] arm64: dts: renesas: r8a779a0: Remove address- and size-cells from AVB[1-5]
Date: Tue, 22 Oct 2024 20:47:26 +0200
Message-ID: <20241022184727.3206180-2-niklas.soderlund+renesas@ragnatech.se>
X-Mailer: git-send-email 2.46.2
In-Reply-To: <20241022184727.3206180-1-niklas.soderlund+renesas@ragnatech.se>
References: <20241022184727.3206180-1-niklas.soderlund+renesas@ragnatech.se>
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


