Return-Path: <linux-renesas-soc+bounces-24192-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 91202C385E3
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 06 Nov 2025 00:30:43 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 5030F3B2FF8
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  5 Nov 2025 23:28:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B5E0D2D3728;
	Wed,  5 Nov 2025 23:28:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b="GhhawuCM";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="zzHlfmaU"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from fhigh-a3-smtp.messagingengine.com (fhigh-a3-smtp.messagingengine.com [103.168.172.154])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 02F752F5A12;
	Wed,  5 Nov 2025 23:28:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.154
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762385296; cv=none; b=scFePl3cGRQrAL6YGu08evvgLPWwxqjcKbNvfJs8eaiSpFWnBLvI11DB/YwnRwodBvLZ3RqWQc0mz5HPSS18s3ze4sX7vTDYdq6IeLZbOZ1uxGIzTVq9KiAsyz3S16Fz0YwjdpRr/vPvOxmEXeCRMISe6NYV5mLoHDzXqiobZas=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762385296; c=relaxed/simple;
	bh=x4IdkbZKPTudvVQ9l3u0cmDNSVc64xKKIGC6Pv/R1yU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=VZdtPYkQIBCUGkuKVn6sjpj9UOWehSkPqgy/zDPqk+ZTg9wm+9r3d1Uk8MeqDL/4WoSMxguj7uVUS3kP3JRyzWXs4mhmmdzS3Gh7qlY8Kxe67not8XYs72Z1JAZvQBk0LSdwXJVnQUJfsPxsQVU2Br8nVEV1MnBgjk4cwaQesEY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se; spf=pass smtp.mailfrom=ragnatech.se; dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b=GhhawuCM; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=zzHlfmaU; arc=none smtp.client-ip=103.168.172.154
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ragnatech.se
Received: from phl-compute-01.internal (phl-compute-01.internal [10.202.2.41])
	by mailfhigh.phl.internal (Postfix) with ESMTP id 20183140017C;
	Wed,  5 Nov 2025 18:28:14 -0500 (EST)
Received: from phl-mailfrontend-02 ([10.202.2.163])
  by phl-compute-01.internal (MEProxy); Wed, 05 Nov 2025 18:28:14 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ragnatech.se; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm2; t=1762385294;
	 x=1762471694; bh=oLpSACM42kKGdY/za8vwcdVsmh3G8zwjlfQ5ciPS7+8=; b=
	GhhawuCMg8pDIshHE1UEn/VIMct4ODFpulNTBWlWKZgot24bQ/N6kTfiRj/A+Z0u
	bvo9RjwZ73v5gdN7XgMvu9i82iiXUEiB5tlFqb/Mjw0gaPxJbNbqy/yB8cm0XyMI
	AyVOp25ewlY0qJjEyiewiwArfThv6JwxlukGU8bAiXtKgpDk6PGwlISZs2mSeiNK
	7ewwBYFjuMVSyoP+Qk5XbNIpNqy/BpXPIgOqrFyy0DY3XczguD5oQb2VZGzME7c8
	DxyxnPDRPOxP4fBbFvm4ozv82a19xGBfr4tWT0goYC4Rpx/RAjAMp5SSMrh4+M1q
	7C8ctC7HTlHtjYRFwADmTg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1762385294; x=
	1762471694; bh=oLpSACM42kKGdY/za8vwcdVsmh3G8zwjlfQ5ciPS7+8=; b=z
	zHlfmaUhQWtV9xbhAStdEzcZkdXP7E8WJlqoNeI/RwIXG+n29k5jqAqp4t7oqE3D
	eTjF4D42M/IQVm0G60Mt2q68x4n9PVkrwoSs9A16akhR8/GIWelUDXhPpRojoMDM
	UsCgLyHy/+BC9CeYDNIIUyoCaisQF0EcahBuoOIrJpoJXDoSuuu+K5YJmjRzhVU6
	HV9nXg+/5Oixa0cjWFQz15VtpvQTcDIn9sW9bz4dprlt17PtB1DtBZrlO1cgVdCj
	RqycKEvafyjblwhwiIdlBnYAtdOrMgv3Cq/o223tN8qKk34vPnEPSChMBsNgY3Ou
	4hd7WobkOtdJO4BJkqYsw==
X-ME-Sender: <xms:jd0LaWP4Hs33h8ZCsMzvwQrVUI0A7o1gP1RqJcq-7UFiMnwICXAuDQ>
    <xme:jd0LaRR-HqxfiF0IaNAVk-WxAM_tTNFlTVkGtpkawVmQzI4P1KjoA-AeqgBDvUzdl
    z6Y1aON0BZAJgPrE0WBYt8UWkKKqx245Ta0OYkWq6kXK0MxVsm2vQE>
X-ME-Received: <xmr:jd0Lae5Ip_puYiS1dF37mu5WP0Ftwz-zlPncE3ZIR-LQPY58WUblIoY_Dhi58ikDvFG6Obmm5JFUgaxxvo8yClmE>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdeggddukeehvddvucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceu
    rghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujf
    gurhephffvvefufffkofgjfhggtgfgsehtkeertdertdejnecuhfhrohhmpefpihhklhgr
    shcuufpnuggvrhhluhhnugcuoehnihhklhgrshdrshhouggvrhhluhhnugdorhgvnhgvsh
    grshesrhgrghhnrghtvggthhdrshgvqeenucggtffrrghtthgvrhhnpeehiefgueevuedt
    fefhheegkeevtdelueeukeevfeduhefhhfejfffggeffleefgeenucevlhhushhtvghruf
    hiiigvpedunecurfgrrhgrmhepmhgrihhlfhhrohhmpehnihhklhgrshdrshhouggvrhhl
    uhhnugesrhgrghhnrghtvggthhdrshgvpdhnsggprhgtphhtthhopedujedpmhhouggvpe
    hsmhhtphhouhhtpdhrtghpthhtohepmhgrrhgvkhdrvhgrshhuthdorhgvnhgvshgrshes
    mhgrihhlsghogidrohhrghdprhgtphhtthhopehgvggvrhhtodhrvghnvghsrghssehglh
    hiuggvrhdrsggvpdhrtghpthhtoheptghonhhorhdoughtsehkvghrnhgvlhdrohhrghdp
    rhgtphhtthhopegrihhrlhhivggusehgmhgrihhlrdgtohhmpdhrtghpthhtohepfhhrrg
    hnkhdrsghinhhnshesihhmghhtvggtrdgtohhmpdhrtghpthhtohepkhhriihkodguthes
    khgvrhhnvghlrdhorhhgpdhrtghpthhtohepmhgrrghrthgvnhdrlhgrnhhkhhhorhhsth
    eslhhinhhugidrihhnthgvlhdrtghomhdprhgtphhtthhopehmrghgnhhushdruggrmhhm
    sehgmhgrihhlrdgtohhmpdhrtghpthhtohepmhgrthhtrdgtohhsthgvrhesihhmghhtvg
    gtrdgtohhm
X-ME-Proxy: <xmx:jd0LaT2gbO0o_tlmLGfIp2KjbisJzE-OEXmNFKTYjFYZBxwi-kwwMA>
    <xmx:jd0LaTmkVBA6lCCPwtcZvsg2vOetFA7oh_FOl9wTUGnzYmD3Hc64Kw>
    <xmx:jd0LaRj7xvSvBtS8Qxh1kvkhxGu01sdGeH2Nnq9FJ1f8JX2SGWPr1A>
    <xmx:jd0LaQQsMFWIqaWZiyLXbHU41H1FUfAIrcSOPlEIKLLDJWmAveQ-eQ>
    <xmx:jt0LaQQ88JB3UPcMPAElGrnGxawl_6xhjkXMZTNrDgI_r8nQzU1sdnFr>
Feedback-ID: i80c9496c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 5 Nov 2025 18:28:13 -0500 (EST)
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
Subject: [PATCH 2/2] arm64: dts: renesas: r8a779a0: Add GE7800 GPU node
Date: Thu,  6 Nov 2025 00:27:37 +0100
Message-ID: <20251105232737.1933437-3-niklas.soderlund+renesas@ragnatech.se>
X-Mailer: git-send-email 2.51.1
In-Reply-To: <20251105232737.1933437-1-niklas.soderlund+renesas@ragnatech.se>
References: <20251105232737.1933437-1-niklas.soderlund+renesas@ragnatech.se>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Describe Imagination Technologies PowerVR Rogue GE7800 BNVC 15.5.1.64
present in Renesas R-Car R8A779A0 V3U SoC.

Signed-off-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
---
 arch/arm64/boot/dts/renesas/r8a779a0.dtsi | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)

diff --git a/arch/arm64/boot/dts/renesas/r8a779a0.dtsi b/arch/arm64/boot/dts/renesas/r8a779a0.dtsi
index b08865841476..aa347b699340 100644
--- a/arch/arm64/boot/dts/renesas/r8a779a0.dtsi
+++ b/arch/arm64/boot/dts/renesas/r8a779a0.dtsi
@@ -338,6 +338,23 @@ cmt3: timer@e6148000 {
 			status = "disabled";
 		};
 
+		gsx: gsx@fd000000 {
+			compatible = "renesas,r8a779a0-gpu",
+				     "img,img-ge7800",
+				     "img,img-rogue";
+			reg = <0 0xfd000000 0 0x40000>;
+			interrupts = <GIC_SPI 223 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&cpg CPG_CORE R8A779A0_CLK_ZG>,
+				 <&cpg CPG_CORE R8A779A0_CLK_S3D1>,
+				 <&cpg CPG_MOD 0>;
+			clock-names = "core", "mem", "sys";
+			power-domains = <&sysc R8A779A0_PD_3DG_A>,
+					<&sysc R8A779A0_PD_3DG_B>;
+			power-domain-names = "a", "b";
+			resets = <&cpg 0>;
+			status = "disabled";
+		};
+
 		cpg: clock-controller@e6150000 {
 			compatible = "renesas,r8a779a0-cpg-mssr";
 			reg = <0 0xe6150000 0 0x4000>;
-- 
2.51.1


