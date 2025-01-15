Return-Path: <linux-renesas-soc+bounces-12183-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E311A12A8C
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 15 Jan 2025 19:11:33 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 27E193A52A1
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 15 Jan 2025 18:11:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8E0ED1D5AA8;
	Wed, 15 Jan 2025 18:11:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b="L7Q4mID+";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="H2cJsMWe"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from fhigh-a3-smtp.messagingengine.com (fhigh-a3-smtp.messagingengine.com [103.168.172.154])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ACE7524A7E8;
	Wed, 15 Jan 2025 18:11:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.154
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736964690; cv=none; b=cLtcU+GVQxEK7C1sq5VKqMGLuhMAxJE6y3w7tbYTlbhkJfhsqlyuTwnf0mDFDNRno7Eghl695cesVt+q2cBcuwY0Lg3CPjqncPqCuLCOP5ozzXQpQjOL3efo/nxWinEpa/9pazNw9lw2T0t4g1xwSDUQX6AfEl9savx7Wq1lIiY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736964690; c=relaxed/simple;
	bh=nsKO2M7NCmXHTBc4WSwoe/wzD3FbwIqQDB5+jERfXeA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Vfmn2bb9vcW8RpxGALTbZUXHtIPBLaUtDK+7tXQ/cBX/4lGIhzC8+uj9Z33sHFG+AwCNEQm3lo00RKxKjVmx1gVnNffFWN0jwnM9/SW3KEBNdBKlpIPFZTC8ZKoj+bBr/oSeAbsVkPR1crs+lH5opeDCc5k40dYF03YWUAq/PTg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se; spf=pass smtp.mailfrom=ragnatech.se; dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b=L7Q4mID+; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=H2cJsMWe; arc=none smtp.client-ip=103.168.172.154
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ragnatech.se
Received: from phl-compute-12.internal (phl-compute-12.phl.internal [10.202.2.52])
	by mailfhigh.phl.internal (Postfix) with ESMTP id C944E1140117;
	Wed, 15 Jan 2025 13:11:26 -0500 (EST)
Received: from phl-mailfrontend-02 ([10.202.2.163])
  by phl-compute-12.internal (MEProxy); Wed, 15 Jan 2025 13:11:26 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ragnatech.se; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm1; t=1736964686;
	 x=1737051086; bh=2krn7CJqVW6/Yj2wTCbVwlLTl5z1X8fuzhHIqJq/ZWQ=; b=
	L7Q4mID+lAb7UNqOnBiyyGvmDf7kCW5C355lL6JqFwUyTBT4fhLdp0T7Z6iMWwvT
	eINIbYYBo+ICAVHET/awVm1HgySm/g5SC82LecVe8lLGoAeJZICsB4sCYkf4L2rQ
	CVfN9/yUWXpY0SltulZtF39Rdt7aBDc1LbNL6afZwE+NAsNuM3hthIOYpPoCxMh5
	CbJWqouUV5ml7b0JcWSYuupmVUPYAPf/ozaoEBLS6RaPG0VI251CAbztG5yMsm/j
	bPpNWSJHwhfAj8nuhpoMABI6PsK0rfxDZAi0ytvU+94xP2R1n4nkJytQTUSBCHQh
	tt7Yk6fgcJmKjv6gKR22cw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1736964686; x=
	1737051086; bh=2krn7CJqVW6/Yj2wTCbVwlLTl5z1X8fuzhHIqJq/ZWQ=; b=H
	2cJsMWeMBpi6UehNUhyOocI4kjJIEWX/t0IJ0EZ/0oo+HJ6kiVaYs4pePCDcgVfY
	//PMMk9u6opWK7dGyXm9RvoA8SeOvz7NSQdJrxw6xyKtg+Uh7/nKCLW9hci2vqO9
	FHHUDyRGnZzeneLqaZ3C1KhUxQKfj60efLpLKLZQikn32ieep4/76ofipJ2PLo/+
	6qJyOtXhb/lekfFemcEH4b/gaPxVHYYHEyleuRKnRC8Zi0oFDEyLIxkWvrN3tHvD
	8hxy9bOB/ncTXuWofGiHJtaM3DBFx3HmwPRC27QA4whd1Ogd15PYbHJAv689/qr2
	LARdmRduHENZWlEMLpi1A==
X-ME-Sender: <xms:TvqHZ3LrVg3m6P5t_IR3VPHbMVP1tWStVxgK1jbkc3vvCa4twkH6JA>
    <xme:TvqHZ7LHmPbgEx180-0S33UO2MGce1OFfH1mEFhvP0sbi87h-GN_xQz7ODSTIZ3TI
    smthalRMm3xLllqDLM>
X-ME-Received: <xmr:TvqHZ_tK763Ds07GU7QHcQBM3oNPobjTpKYK1CWa2ZnP2s-E_TrVetPhHYN1fy_K3WfHTvfx5GxraAPMNW5ZWCrKzg>
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
X-ME-Proxy: <xmx:TvqHZwbbhxogWLwsHekfrKVCbzEmvOHhSOuZ5elIrBmUj1C94OYsaQ>
    <xmx:TvqHZ-Zpa7Tfyxsqe0Xs97UZrsrFfqh6Fx4Son2QgHe4wQD3pPC1yg>
    <xmx:TvqHZ0BXz-cvjbLcH31u86H-FB2CfdB9EcB2zCtZN7aHSIiBMGMgHw>
    <xmx:TvqHZ8Y3SV0cJJ2yjXA4NQci_0qddPgx6ta1flxtjVsCf9xRzDEMgQ>
    <xmx:TvqHZ1W5o96em8ArleXxEqJNKzd0XXbKJ0jcEToFHbaiDF54nCEEjQoS>
Feedback-ID: i80c9496c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 15 Jan 2025 13:11:26 -0500 (EST)
From: =?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>
To: Geert Uytterhoeven <geert+renesas@glider.be>,
	linux-renesas-soc@vger.kernel.org,
	devicetree@vger.kernel.org
Cc: =?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>
Subject: [PATCH 2/2] arm64: dts: renesas: r8a779h0: Add VSPX instance
Date: Wed, 15 Jan 2025 19:10:50 +0100
Message-ID: <20250115181050.3728275-3-niklas.soderlund+renesas@ragnatech.se>
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

Add device node for the VSPX instance on R-Car V4M.

Signed-off-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
---
 arch/arm64/boot/dts/renesas/r8a779h0.dtsi | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/arch/arm64/boot/dts/renesas/r8a779h0.dtsi b/arch/arm64/boot/dts/renesas/r8a779h0.dtsi
index dbd03587b8fd..c767ce0d964e 100644
--- a/arch/arm64/boot/dts/renesas/r8a779h0.dtsi
+++ b/arch/arm64/boot/dts/renesas/r8a779h0.dtsi
@@ -1927,6 +1927,17 @@ vspd0: vsp@fea20000 {
 			renesas,fcp = <&fcpvd0>;
 		};
 
+		vspx0: vsp@fedd0000 {
+			compatible = "renesas,vsp2";
+			reg = <0 0xfedd0000 0 0x8000>;
+			interrupts = <GIC_SPI 556 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&cpg CPG_MOD 1028>;
+			power-domains = <&sysc R8A779H0_PD_A3ISP0>;
+			resets = <&cpg 1028>;
+
+			renesas,fcp = <&fcpvx0>;
+		};
+
 		du: display@feb00000 {
 			compatible = "renesas,du-r8a779h0";
 			reg = <0 0xfeb00000 0 0x40000>;
-- 
2.48.0


