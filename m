Return-Path: <linux-renesas-soc+bounces-4562-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 377B58A3CF8
	for <lists+linux-renesas-soc@lfdr.de>; Sat, 13 Apr 2024 16:19:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id BD1F4B213B5
	for <lists+linux-renesas-soc@lfdr.de>; Sat, 13 Apr 2024 14:19:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3B42F41A85;
	Sat, 13 Apr 2024 14:19:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b="LFwKFJa+";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="NQ4b3oKg"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from wflow3-smtp.messagingengine.com (wflow3-smtp.messagingengine.com [64.147.123.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B84B1446A2;
	Sat, 13 Apr 2024 14:19:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=64.147.123.138
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713017989; cv=none; b=byFmTRmmh/9pJJpWucj+xIpmY/N1+EhDkP8jylVZiiZa/uvnn6cpUnkKZf/+2VmNcg+zGnjIuoBNM+CUmpUg+WwzTOH1vVxERDoFkWUv0Plr9ETb53N2VkIgi96eYbVgMNmI2vl/viVm/qpS5YkKAbZW+5JIsPEifwObUf+0LMY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713017989; c=relaxed/simple;
	bh=lqYi4IX+pGC7g17St3wKh78YYVzchlWWepLvcxug754=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=ueJs3mxa+2vw86DX/I3qegD0XqsABAWaEyMfKRIIi/CU7rqGvnMZzjeTdBJovwrgJkWUbUdVdR+uCG8/LtaTEyri5IhEsZCQ6i5WoMMBbwXebN6ZNm1kgwGDkLn8gAxspo27e8zL2iKyjSwKAdKBkeBzvE40hAzT0sIAWrL5lBY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se; spf=pass smtp.mailfrom=ragnatech.se; dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b=LFwKFJa+; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=NQ4b3oKg; arc=none smtp.client-ip=64.147.123.138
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ragnatech.se
Received: from compute2.internal (compute2.nyi.internal [10.202.2.46])
	by mailflow.west.internal (Postfix) with ESMTP id 29F282CC053B;
	Sat, 13 Apr 2024 10:19:43 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute2.internal (MEProxy); Sat, 13 Apr 2024 10:19:43 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ragnatech.se; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:message-id:mime-version:reply-to
	:subject:subject:to:to; s=fm1; t=1713017982; x=1713021582; bh=Ks
	OhJ5K2u+qHkcOjq56ae5rr6YpPqB2tbm2c0/PLSJs=; b=LFwKFJa+4xxGg17yA6
	L6+ky2QBMkytTj2mUVuabd/IsNf6DU/Rt04HqPEy2G1JvDWpQagrJw+7P4N9eJTQ
	AtLN34MTU63sUBB+7NvfYqPADxS3qynDP0WBPOpegduVaCOvdKSX0pwWac6Bf+pK
	3WHfZr+Kzokj0mIqP4c6LLJ1VkhxhDaqiw7Ss6YSfJc3MMubVi3hXrpmlQGdcUmM
	HVKOe0O/B+FBJ4vlBqctkU1ip1F/pzTRtlVQEwsNVEHnahAN6YBhMHNn6ZcDsgA8
	O/bSEr+QIn1WuvEkU66SZyzqzRlK8F4CnX9bJFn9xVX+AVzOnQotSuffjGh7Zm4T
	iUYA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:message-id:mime-version:reply-to:subject
	:subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
	:x-sasl-enc; s=fm2; t=1713017982; x=1713021582; bh=KsOhJ5K2u+qHk
	cOjq56ae5rr6YpPqB2tbm2c0/PLSJs=; b=NQ4b3oKgCo5Pj7q0y8kqGyPUXpTXy
	eMijymelKVrbWWXVk4HVbqdDNe/owOnQItiJIgWYnw8F0lc3dOwDaRyNRNggcjTc
	R8zqagUJDlivucgRzK0cCQZDcRQwmm1HXo8rJBrx3BaBhIefuau2ROLVmPxOZK5T
	Vux3QQbaPrvSmjoQ3n4XxGv/0aAdM7L94ATonRnA6+bAZpqK4jx2mcqvi8gADTlA
	0VvDItJBgHe8SCDy8utDVuRntGwjn1+l9bw84GaPYeEPts63RgHpHNxpC1loO+g3
	cZ6wQBrtoXRS53UVax9MDyaF6EAPa53NZi1jaSXjhZAsCDY8M2AY7mP0w==
X-ME-Sender: <xms:fpQaZoYobilQgKXFxkQWYbtHHdbpUA6UlIOpu7mrXikUR_FEVMPmAw>
    <xme:fpQaZjbBzXNNpAZ5KGo-pq3IlFlJWGYeJmHqqmk7375w1oUhWweFu5Mx3CiiA0AG8
    WImEt1qYVwTXgWW8aY>
X-ME-Received: <xmr:fpQaZi8gWhMxBo7xsEaH6d5E7Cp0a5ArRJkxfkyBjBRgUoP6BLynv8qxdiGBvrPEIjaEhez2wp03eMEO3IG6rr7HdrvBt1W3ynUz>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvledrudeiiedgjeeiucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucenucfjughrpefhvfevufffkffogggtgfesthekre
    dtredtjeenucfhrhhomheppfhikhhlrghsucfunpguvghrlhhunhguuceonhhikhhlrghs
    rdhsohguvghrlhhunhguodhrvghnvghsrghssehrrghgnhgrthgvtghhrdhsvgeqnecugg
    ftrfgrthhtvghrnhepheduleetteekgffffedufeeuvdejiedvkefhveeifeegffehledt
    vdevhfefteegnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrh
    homhepnhhikhhlrghsrdhsohguvghrlhhunhguodhrvghnvghsrghssehrrghgnhgrthgv
    tghhrdhsvg
X-ME-Proxy: <xmx:fpQaZipagehsBrjGKlqrYI3TtOp_d8EVQq-I898kcc63wvfnInPtBw>
    <xmx:fpQaZjrkEP2ln7McLWKRNfSr9Pk1Nir2OuRUWpS4WzFht9Gl4w1hnw>
    <xmx:fpQaZgTlmx_J2x7vjUu__cIzjFTblALkm3fELfQnaGfTGrKp3_LQ_Q>
    <xmx:fpQaZjqsb49jbR5yJwKboHkX02UsdizC80A85GjCbAN_34EUjC6uug>
    <xmx:fpQaZknIsBj9K9uVLf0hJPwqIKqOBDYGx6e_AzXaCpD3DDev5t5t4-wL>
Feedback-ID: i80c9496c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sat,
 13 Apr 2024 10:19:41 -0400 (EDT)
From: =?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>
To: Geert Uytterhoeven <geert+renesas@glider.be>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-renesas-soc@vger.kernel.org,
	devicetree@vger.kernel.org
Cc: =?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>
Subject: [PATCH v3 0/2] arm64: dts: renesas: white-hawk: Add AVB1 and AVB2
Date: Sat, 13 Apr 2024 16:18:04 +0200
Message-ID: <20240413141806.300989-1-niklas.soderlund+renesas@ragnatech.se>
X-Mailer: git-send-email 2.44.0
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hello Geert,

This small series describes the AVB1 and AVB2 found on White-Hawk.

Patch 1/2 prepares the AVB base nodes for r8a779g0 to use a dedicated 
MDIO node and switches to use this for AVB0, which is the only node who 
currently describes a PHY. The driver and binding change needed to use a 
MDIO node are merged in net-next already.

Patch 2/2 add the description for AVB1 and AVB2 found on the Ethernet 
sub-board.

See individual patch for change log.

Niklas Söderlund (2):
  arm64: dts: renesas: r8a779g0: Use MDIO node for all AVB devices
  arm64: dts: renesas: white-hawk: ethernet: Describe AVB1 and AVB2

 arch/arm64/boot/dts/renesas/r8a779g0.dtsi     |   6 -
 .../dts/renesas/white-hawk-cpu-common.dtsi    |  23 ++--
 .../boot/dts/renesas/white-hawk-ethernet.dtsi | 103 ++++++++++++++++++
 3 files changed, 117 insertions(+), 15 deletions(-)

-- 
2.44.0


