Return-Path: <linux-renesas-soc+bounces-26265-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id AD2C9CF16B3
	for <lists+linux-renesas-soc@lfdr.de>; Sun, 04 Jan 2026 23:28:57 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 7403730006C6
	for <lists+linux-renesas-soc@lfdr.de>; Sun,  4 Jan 2026 22:28:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F1FFD3161A2;
	Sun,  4 Jan 2026 22:28:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b="JHDOOdMY";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="jM+r3aHC"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from fhigh-b3-smtp.messagingengine.com (fhigh-b3-smtp.messagingengine.com [202.12.124.154])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0474D23EA87;
	Sun,  4 Jan 2026 22:28:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.12.124.154
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767565730; cv=none; b=pWdWkgz1kG/4077N/8V8wjAg/CsAKfwQIndpbEXpHAUyBpwWOfgIE4fisj0O1MUZjfMnsDDrG9YZFybPP5KSrO7/RSpOfIDyevVfov4XxYPiw61ochL4vdjANXe9OiEwnBVdQnuLsZEP/7F3lBfZrKwZN5JEmthjZ+fRYeuaovs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767565730; c=relaxed/simple;
	bh=d4SEdoCEqaezb2V1dUHceR0+RfZfbVG6SMiIDMLuzxA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=oRZiWuqOPP3BwXzSSL6JhfxxWGQwRCmY7oVKniItgqTCV1VrMigclY0YWyLWRU6QkWKdEg2Tirz2oPpADkVtgX2L0YCs4eT2vEeX7XME15w/LUaVVB66vuZciixLufSVANlYljUlZg4t0jsytG2EXxUcbO1vMrBgLPfWALYJoqk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se; spf=pass smtp.mailfrom=ragnatech.se; dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b=JHDOOdMY; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=jM+r3aHC; arc=none smtp.client-ip=202.12.124.154
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ragnatech.se
Received: from phl-compute-12.internal (phl-compute-12.internal [10.202.2.52])
	by mailfhigh.stl.internal (Postfix) with ESMTP id EB3947A00CC;
	Sun,  4 Jan 2026 17:28:47 -0500 (EST)
Received: from phl-frontend-04 ([10.202.2.163])
  by phl-compute-12.internal (MEProxy); Sun, 04 Jan 2026 17:28:48 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ragnatech.se; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm1; t=1767565727;
	 x=1767652127; bh=j6H3TfDcXQ/uij6hpQbctQ5MEz+mCGeFGo2d/TwOQVs=; b=
	JHDOOdMYIXuw95udcbhNaNgWL0kpPIey8f7SqcaTPklN8RH8MeIdhExVl45UTbqZ
	LXcvriIZDBaZrd+mHTDLZc48QrJ4fwvF8cWL79P4bu9Vj5RMh2Zqu9Yczejc63Wm
	h+Wozrpv4q2Cgmzk9Zipyfjk0PwRkY8uB3PS+7wuPQ9JozitgMYeDhNp+jL/UHUQ
	xtgr0oSP321mUo/GEDj48mmOix6Lf1BK6SIf3c+VExwrT71MJh/MYNacHId7xmTy
	S0YJjKJT4m/vw2GBSx5KAe84jFIoU7UPJzmCAzQqDNVaPjmzM4gjGoogcMokzs3R
	QFmI/8pCvCFEE/Cznu0AmA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1767565727; x=
	1767652127; bh=j6H3TfDcXQ/uij6hpQbctQ5MEz+mCGeFGo2d/TwOQVs=; b=j
	M+r3aHCgh8Ir4NxNMMMuCtAhHQ9WoG2etUYdAE1JJ7jtA9zptvFNNoWc1dDReIqh
	dckxPJi4siKQVSSdXYSn8fsjYDlwUWjj92YUbjpWhlQ2YuMA/r5/UbLvJonBxBzD
	I6STlm+kglm64zLxGvA/guGiphaFkwtYj5dTtFzHYMXlMaRG30I5Rh8Oa+qjcqp7
	nseTCQ+QpdhcMfFdyPYd3q96lU5Bwn+5jQgyRo7YHsR8Xng9DGoFRKYp/FcKIsAh
	5y89y6613nqDfhnyyIk7oqkOToD5HDYRjFVEb7FC0d879skHccEq2NquTQkVKjtj
	CmQaTNfK48DHurYKHVc7A==
X-ME-Sender: <xms:n-laaf2YgwJT-J9ZXGLeNRKt0HGesbYp6qK-VFCwcT2TG_P275fkiA>
    <xme:n-laaaY7OWpLs9UNdQpxwdJPF1SOogmcO6MyjyT0y6PaJjKAHHARudDWdZ5P-20I9
    BzzWYd7QIjVoCrW8fqW6bX3SaH14x-bC1i0ads7fbsPkGH5XvXafwY>
X-ME-Received: <xmr:n-laaRgs81DcK72AR2NZx4PRJSDPDcrs2OBC003MihPUwIpG_z_wiztmG5vdIwkT_r62ZgWnC3DOqUZZlUw97Hcb>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefgedrtddtgdelheeivdcutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpuffrtefokffrpgfnqfghnecuuegr
    ihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjug
    hrpefhvfevufffkffojghfgggtgfesthekredtredtjeenucfhrhhomheppfhikhhlrghs
    ucfunpguvghrlhhunhguuceonhhikhhlrghsrdhsohguvghrlhhunhguodhrvghnvghsrg
    hssehrrghgnhgrthgvtghhrdhsvgeqnecuggftrfgrthhtvghrnhepheeigfeuveeutdef
    hfehgeekvedtleeuueekveefudehhffhjeffgfegffelfeegnecuvehluhhsthgvrhfuih
    iivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepnhhikhhlrghsrdhsohguvghrlhhu
    nhgusehrrghgnhgrthgvtghhrdhsvgdpnhgspghrtghpthhtohepudejpdhmohguvgepsh
    hmthhpohhuthdprhgtphhtthhopehmrghrvghkrdhvrghsuhhtodhrvghnvghsrghssehm
    rghilhgsohigrdhorhhgpdhrtghpthhtohepghgvvghrthdorhgvnhgvshgrshesghhlih
    guvghrrdgsvgdprhgtphhtthhopegtohhnohhrodgutheskhgvrhhnvghlrdhorhhgpdhr
    tghpthhtoheprghirhhlihgvugesghhmrghilhdrtghomhdprhgtphhtthhopehfrhgrnh
    hkrdgsihhnnhhssehimhhgthgvtgdrtghomhdprhgtphhtthhopehkrhiikhdoughtsehk
    vghrnhgvlhdrohhrghdprhgtphhtthhopehmrggrrhhtvghnrdhlrghnkhhhohhrshhtse
    hlihhnuhigrdhinhhtvghlrdgtohhmpdhrtghpthhtohepmhgrghhnuhhsrdgurghmmhes
    ghhmrghilhdrtghomhdprhgtphhtthhopehmrghtthdrtghoshhtvghrsehimhhgthgvtg
    drtghomh
X-ME-Proxy: <xmx:n-laaR8VjLDPag7_dG1GkI-4s9qlKH67COcj53wgBFRP8VJCmmA83g>
    <xmx:n-laaXN0FCR8_3AbAVkPwVUE3TZmyXNaWAIQGE9iUdthB5CoQDuXWg>
    <xmx:n-laacq__vMSF2bW38MMgnlli01DUj1Eoq6xmaA4Lxt8XNP-BASBZg>
    <xmx:n-laac7XvsohMaI2BbgCcOuiUQwCon2_WrdanTdshN9JlWXuJKffwQ>
    <xmx:n-laaQd46ljGwyBCnedLm0YZ8CkI17zabM_yCbe_3gEl0s9Qf_lYXsBo>
Feedback-ID: i80c9496c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sun,
 4 Jan 2026 17:28:46 -0500 (EST)
From: =?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>
To: Marek Vasut <marek.vasut+renesas@mailbox.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Conor Dooley <conor+dt@kernel.org>,
	David Airlie <airlied@gmail.com>,
	Frank Binns <frank.binns@imgtec.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Magnus Damm <magnus.damm@gmail.com>,
	Matt Coster <matt.coster@imgtec.com>,
	Maxime Ripard <mripard@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Simona Vetter <simona@ffwll.ch>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	devicetree@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	linux-renesas-soc@vger.kernel.org
Cc: =?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>
Subject: [PATCH 2/2] arm64: dts: renesas: r8a77995: Add GE8300 GPU node
Date: Sun,  4 Jan 2026 23:26:53 +0100
Message-ID: <20260104222653.1659382-3-niklas.soderlund+renesas@ragnatech.se>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260104222653.1659382-1-niklas.soderlund+renesas@ragnatech.se>
References: <20260104222653.1659382-1-niklas.soderlund+renesas@ragnatech.se>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Describe Imagination Technologies PowerVR Rogue GE8300 BNVC 22.67.54.30
present in Renesas R-Car R8A77995 D3 SoC.

Signed-off-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
---
 arch/arm64/boot/dts/renesas/r8a77995.dtsi | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/arch/arm64/boot/dts/renesas/r8a77995.dtsi b/arch/arm64/boot/dts/renesas/r8a77995.dtsi
index 5f3fcef7560c..790aa1cf678d 100644
--- a/arch/arm64/boot/dts/renesas/r8a77995.dtsi
+++ b/arch/arm64/boot/dts/renesas/r8a77995.dtsi
@@ -1295,6 +1295,21 @@ gic: interrupt-controller@f1010000 {
 			resets = <&cpg 408>;
 		};
 
+		gpu: gpu@fd000000 {
+			compatible = "renesas,r8a77995-gpu",
+				     "img,img-ge8300",
+				     "img,img-rogue";
+			reg = <0 0xfd000000 0 0x40000>;
+			interrupts = <GIC_SPI 223 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&cpg CPG_CORE R8A77995_CLK_ZG>,
+				 <&cpg CPG_CORE R8A77995_CLK_S3D1>,
+				 <&cpg CPG_MOD 112>;
+			clock-names = "core", "mem", "sys";
+			power-domains = <&sysc R8A77995_PD_ALWAYS_ON>;
+			resets = <&cpg 112>;
+			status = "disabled";
+		};
+
 		vspbs: vsp@fe960000 {
 			compatible = "renesas,vsp2";
 			reg = <0 0xfe960000 0 0x8000>;
-- 
2.52.0


