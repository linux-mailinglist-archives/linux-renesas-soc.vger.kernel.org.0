Return-Path: <linux-renesas-soc+bounces-11988-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 94FB0A0762D
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  9 Jan 2025 13:55:05 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 536B5188A4EF
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  9 Jan 2025 12:55:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 64F41218591;
	Thu,  9 Jan 2025 12:55:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b="tvkDITI1";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="QnlLof5u"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from fhigh-b7-smtp.messagingengine.com (fhigh-b7-smtp.messagingengine.com [202.12.124.158])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 76429217656;
	Thu,  9 Jan 2025 12:55:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.12.124.158
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736427303; cv=none; b=eSaLc1oTD1Lg8mp3TPZ2cTy/brQyLe0GUfzRoe2v6ueGO+w9iPnqWjQCmLOyM4Ivafp7Cqf7eLuFIYNlo3dJgH3SdyRPUzl65i/dCSdLnl7s1uhez5ApT0b4iXGviA+nM/DTKk0BiB/MmCMJVAJAfRSlQS+Sw2ECD2eancE21sE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736427303; c=relaxed/simple;
	bh=qohJuZDA7XirT7vrcMPOKQjec7Jn7OveB0nrumaYYfs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=AcjqXDxpIlmg7nn4a6EZmwd5rJsr/9sLEPaK9bmlFIwaMjvt1Os+4H0U41MwzvNcL1xIhy2m6BeKH07doC4YPqeWWLxmPq01nYN9oFh1UhgZNe6kAfC1BhcAgYm9lMFnEuXpg6y2gDCDeI+Sd5nFD/bYzx1Z74CI7DzN8Me8bL8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se; spf=pass smtp.mailfrom=ragnatech.se; dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b=tvkDITI1; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=QnlLof5u; arc=none smtp.client-ip=202.12.124.158
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ragnatech.se
Received: from phl-compute-09.internal (phl-compute-09.phl.internal [10.202.2.49])
	by mailfhigh.stl.internal (Postfix) with ESMTP id 9015D25401A3;
	Thu,  9 Jan 2025 07:55:00 -0500 (EST)
Received: from phl-mailfrontend-02 ([10.202.2.163])
  by phl-compute-09.internal (MEProxy); Thu, 09 Jan 2025 07:55:00 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ragnatech.se; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm1; t=1736427300;
	 x=1736513700; bh=sc5ZIwfp862HDdRkRQNjhu4JU+TraoC9nEyj/GgKfWI=; b=
	tvkDITI1U0aevpVS6yDpynr/dR+1tdDyJsrlUjIhGxm50Q2meUdJJ4+jUm5EUK14
	yOGuabIm7JrvbujwR8KG1Aocs1yj8VEJlmzCF2DC5rgmPKVhqplC+unKB7jJQAvQ
	RxgJeXzlTF2aUZEEk13MLhQkkc3sXQdyPBCgStZGT3oohnAZ4nQXJstCpk/5ICaO
	Vf5VJuIL+hgjnB9h7r6I7dypj4UVBaCvVZtPMyq6CKrt7RfOHY9acApcikZXdR0E
	qiPCGRwt/wnGhp+C6KgvxzQsqhbI2sHBW9AT3bFgF1Oig75HLp/r1URxpG0RS1jy
	SLjPMsUAJS9AGelSw125KQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1736427300; x=
	1736513700; bh=sc5ZIwfp862HDdRkRQNjhu4JU+TraoC9nEyj/GgKfWI=; b=Q
	nlLof5uSFwIb9EYZVwb/n3/+x2z8ydd9qmFgj2ytS2J1O+BmF8celjM5/B5ddq8R
	1RUYtTOxAEbVgN56HT0cF6akKr+M8CItVl1VmAJOafKXJ2Ge4oQw28jDH4Wj7dJY
	76cO3Qu5xomWHjH4OfMn9uFabsZn2aNiqWevYnvrgxfZwztiJz8T2Xy82GXJSjWr
	MCyjoi4sZMcRRardeOr8Q97lpGlz8hTrp87DRkx5iCuglwDR1TcIoZU+2/6/gGap
	MgY+Sg5pTbpuyY3q3kQzyORxnyK9TFyplrNekBFnbN/Zg9Fkdtz+cryeMIp4PJj8
	VZbIl/KCQhJUOA2nwQfrw==
X-ME-Sender: <xms:JMd_Zyae5Cw9ozeUQtfcAgMdpNISVEYJVyW1nsxyc8WnhBWc9BHPyQ>
    <xme:JMd_Z1aWa4qo_M_JDvr8OsLqkQs56LVnT4FCxPIzZawjryXRDWJX56BUiaGgcjiHm
    O0z7cAkMvb_RWfTSAk>
X-ME-Received: <xmr:JMd_Z8-eiLupLLvsMN44UmPfJn1bzps9g1AiuxqfBs6HWs-IAxb07y3HWT2C7n2bSU6LuS4EnD6ITvrULsu47FnQqQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefuddrudegiedggeegucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdggtfgfnhhsuhgsshgtrhhisggvpdfu
    rfetoffkrfgpnffqhgenuceurghilhhouhhtmecufedttdenucenucfjughrpefhvfevuf
    ffkffojghfgggtgfesthekredtredtjeenucfhrhhomheppfhikhhlrghsucfunpguvghr
    lhhunhguuceonhhikhhlrghsrdhsohguvghrlhhunhguodhrvghnvghsrghssehrrghgnh
    grthgvtghhrdhsvgeqnecuggftrfgrthhtvghrnhepheeigfeuveeutdefhfehgeekvedt
    leeuueekveefudehhffhjeffgfegffelfeegnecuvehluhhsthgvrhfuihiivgeptdenuc
    frrghrrghmpehmrghilhhfrhhomhepnhhikhhlrghsrdhsohguvghrlhhunhgusehrrghg
    nhgrthgvtghhrdhsvgdpnhgspghrtghpthhtohephedpmhhouggvpehsmhhtphhouhhtpd
    hrtghpthhtohepghgvvghrthdorhgvnhgvshgrshesghhlihguvghrrdgsvgdprhgtphht
    thhopehjrggtohhpohdrmhhonhguihdorhgvnhgvshgrshesihguvggrshhonhgsohgrrh
    gurdgtohhmpdhrtghpthhtoheplhhinhhugidqrhgvnhgvshgrshdqshhotgesvhhgvghr
    rdhkvghrnhgvlhdrohhrghdprhgtphhtthhopeguvghvihgtvghtrhgvvgesvhhgvghrrd
    hkvghrnhgvlhdrohhrghdprhgtphhtthhopehnihhklhgrshdrshhouggvrhhluhhnugdo
    rhgvnhgvshgrshesrhgrghhnrghtvggthhdrshgv
X-ME-Proxy: <xmx:JMd_Z0oEkcVkKppVh7zg0DJouPdEBOatA-eSmTssDfVULePN_wN_Aw>
    <xmx:JMd_Z9oTFcUZ9L8xc5QMtTlH9uuq5XgXbXiuC9FTIVXruyl5FhA2RA>
    <xmx:JMd_ZyTsrbPTMkUZPv0RKHcN0v5M7gNfN5RqCEy3xif1HBK-R8_njA>
    <xmx:JMd_Z9p0Ax-et33wu5aIT4o_TBJinzV_ps8Pe0S0dLKlbuG6SYjoQA>
    <xmx:JMd_Z2BjBb58Ip12wnHhwRs8Ua1QKWv_sTeZCjCVbbb9GnAamH015ZG3>
Feedback-ID: i80c9496c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 9 Jan 2025 07:54:59 -0500 (EST)
From: =?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>
To: Geert Uytterhoeven <geert+renesas@glider.be>,
	Jacopo Mondi <jacopo.mondi+renesas@ideasonboard.com>,
	linux-renesas-soc@vger.kernel.org,
	devicetree@vger.kernel.org
Cc: =?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>
Subject: [PATCH 2/2] arm64: dts: renesas: r8a779a0: Add VSPX instances
Date: Thu,  9 Jan 2025 13:54:33 +0100
Message-ID: <20250109125433.2402045-3-niklas.soderlund+renesas@ragnatech.se>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20250109125433.2402045-1-niklas.soderlund+renesas@ragnatech.se>
References: <20250109125433.2402045-1-niklas.soderlund+renesas@ragnatech.se>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Add device nodes for the VSPX instances on R-Car V3U.

Signed-off-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
---
 arch/arm64/boot/dts/renesas/r8a779a0.dtsi | 44 +++++++++++++++++++++++
 1 file changed, 44 insertions(+)

diff --git a/arch/arm64/boot/dts/renesas/r8a779a0.dtsi b/arch/arm64/boot/dts/renesas/r8a779a0.dtsi
index 4ec14e4869e9..e0059795947f 100644
--- a/arch/arm64/boot/dts/renesas/r8a779a0.dtsi
+++ b/arch/arm64/boot/dts/renesas/r8a779a0.dtsi
@@ -2926,6 +2926,50 @@ fcpvx3: fcp@fedc8000 {
 			iommus = <&ipmmu_vi1 27>;
 		};
 
+		vspx0: vsp@fedd0000 {
+			compatible = "renesas,vsp2";
+			reg = <0 0xfedd0000 0 0x8000>;
+			interrupts = <GIC_SPI 600 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&cpg CPG_MOD 1028>;
+			power-domains = <&sysc R8A779A0_PD_A3ISP01>;
+			resets = <&cpg 1028>;
+
+			renesas,fcp = <&fcpvx0>;
+		};
+
+		vspx1: vsp@fedd8000 {
+			compatible = "renesas,vsp2";
+			reg = <0 0xfedd8000 0 0x8000>;
+			interrupts = <GIC_SPI 601 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&cpg CPG_MOD 1029>;
+			power-domains = <&sysc R8A779A0_PD_A3ISP01>;
+			resets = <&cpg 1029>;
+
+			renesas,fcp = <&fcpvx1>;
+		};
+
+		vspx2: vsp@fede0000 {
+			compatible = "renesas,vsp2";
+			reg = <0 0xfede0000 0 0x8000>;
+			interrupts = <GIC_SPI 602 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&cpg CPG_MOD 1030>;
+			power-domains = <&sysc R8A779A0_PD_A3ISP23>;
+			resets = <&cpg 1030>;
+
+			renesas,fcp = <&fcpvx2>;
+		};
+
+		vspx3: vsp@fede8000 {
+			compatible = "renesas,vsp2";
+			reg = <0 0xfede8000 0 0x8000>;
+			interrupts = <GIC_SPI 603 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&cpg CPG_MOD 1031>;
+			power-domains = <&sysc R8A779A0_PD_A3ISP23>;
+			resets = <&cpg 1031>;
+
+			renesas,fcp = <&fcpvx3>;
+		};
+
 		prr: chipid@fff00044 {
 			compatible = "renesas,prr";
 			reg = <0 0xfff00044 0 4>;
-- 
2.47.1


