Return-Path: <linux-renesas-soc+bounces-16288-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D30D7A9A0CF
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 24 Apr 2025 08:04:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 70C363B7432
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 24 Apr 2025 06:04:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0FDCD10F9;
	Thu, 24 Apr 2025 06:04:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=arndb.de header.i=@arndb.de header.b="gwxlHovp";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="Uao+/955"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from fout-a6-smtp.messagingengine.com (fout-a6-smtp.messagingengine.com [103.168.172.149])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7EDC4188CCA
	for <linux-renesas-soc@vger.kernel.org>; Thu, 24 Apr 2025 06:04:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.149
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745474691; cv=none; b=rvGZaUR5nu/6JNXrRWM8ZyENKbMmq5dvO0yA9oLnsT0bDLeNAkaMOmgGUmuKyYqZ3QQVk+NUgROkfnVJM2yWpFrShNGEpoES/hXiWUMmPU2Fgy62t0F9rZ7J5DwsGBF0PgXdCPDb1iaZaQaPu7ltR766Vl6fk7Y7EBcjI7zO5f4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745474691; c=relaxed/simple;
	bh=yBh4ID6MkKCq/M6hhKiaGHyKoqoAherEyA+UpyvaMSg=;
	h=MIME-Version:Date:From:To:Cc:Message-Id:In-Reply-To:References:
	 Subject:Content-Type; b=f9GIlXDzYm8E+zwGWFo3CHI1J/zAFzKpwj/t2I9CLrE9F/khtGTNkqHz2gSXyqY9L7i6F7sAuswHb8WbcSmGrXT1292nEjfSWU050Q/zjQv2QRn+Sa+E1GUVtk7yD4KS91dmr3NuOx7m3ExB4Pb5BQDgJFhRrus0yQieAPePxK4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arndb.de; spf=pass smtp.mailfrom=arndb.de; dkim=pass (2048-bit key) header.d=arndb.de header.i=@arndb.de header.b=gwxlHovp; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=Uao+/955; arc=none smtp.client-ip=103.168.172.149
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arndb.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arndb.de
Received: from phl-compute-05.internal (phl-compute-05.phl.internal [10.202.2.45])
	by mailfout.phl.internal (Postfix) with ESMTP id 45BBD1380516;
	Thu, 24 Apr 2025 02:04:46 -0400 (EDT)
Received: from phl-imap-11 ([10.202.2.101])
  by phl-compute-05.internal (MEProxy); Thu, 24 Apr 2025 02:04:46 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm2; t=1745474686;
	 x=1745561086; bh=yBh4ID6MkKCq/M6hhKiaGHyKoqoAherEyA+UpyvaMSg=; b=
	gwxlHovpSTKyDeFIppa5bCcrVGSsJB/+f2mcAFPhs1/pQgcIhTfuzOKsTjrrp1T9
	VSOojdY8cs7dDI8GLbIMH+SoJ7K+fMq+axomhVQ6F6Ds0FzwAPhQlg0rF18xK4Vp
	Z3Gs1s5vyjE2Mo0rcM+mdcPE9vy62Cvhl0XsWyYot89vOrJTACl1veVhmwCEBvnn
	8jTeUehIJo1GD1e5upX2Uq8u7Zbus2WhIPK068ZSfuNSWhQ0vbd9Bh6daNucWuY/
	OVd7OY7KZa4Qja1rhU1R9pDL+58o5kFO4zmMtTCVm3nffaFkp6md4Nu/ImBcsM+E
	Y5jtq/2xCldlsuV1Sj0bDg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1745474686; x=
	1745561086; bh=yBh4ID6MkKCq/M6hhKiaGHyKoqoAherEyA+UpyvaMSg=; b=U
	ao+/955wa/Bozix8BLdU9hQC7uYDp3vGE8STUU78n9rqIXPiL2gEIy7bT0Pz/VPX
	K/vIu3jMSPDu9lwgMxDaVFkubO8w1RGGoIJDbuqkasHUPiP9al4shvyU8edq0R7T
	T1f+lF/9B7H5JMcJ9AqKcQw5lpZLMTKV4CA1IX9ac8rAxzQ8THtcCIUzmt7VpVpm
	7Wute6P92tusFJqlfczwwXV3PYPg7E1+dd0OzkhE3frvznx21zAb4mE+GUaf+XiQ
	kGlaFWHKj94KW1d1oX/+IbOr1opR2RAk9abZpEwQso1SK5uNC/mN5GcnbulTzqMb
	biOccq4oBbe3yjV2yEv6A==
X-ME-Sender: <xms:fdQJaIn7xa72vY7lUr7PCGvUwauTir5mXw6AlnO8G3jZN2abRqaCrA>
    <xme:fdQJaH1Li0L8QDzDQ17VjNj2rSpipZ-p7eVigQQrc-CofargJSJjIJliZq68JNxq6
    U64JuQ8XneIwJVvGbA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddvgeekjedtucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdggtfgfnhhsuhgsshgtrhhisggv
    pdfurfetoffkrfgpnffqhgenuceurghilhhouhhtmecufedttdenucesvcftvggtihhpih
    gvnhhtshculddquddttddmnecujfgurhepofggfffhvfevkfgjfhfutgfgsehtjeertder
    tddtnecuhfhrohhmpedftehrnhguuceuvghrghhmrghnnhdfuceorghrnhgusegrrhhnug
    gsrdguvgeqnecuggftrfgrthhtvghrnhephfdthfdvtdefhedukeetgefggffhjeeggeet
    fefggfevudegudevledvkefhvdeinecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrg
    hmpehmrghilhhfrhhomheprghrnhgusegrrhhnuggsrdguvgdpnhgspghrtghpthhtohep
    udefpdhmohguvgepshhmthhpohhuthdprhgtphhtthhopegtrghtrghlihhnrdhmrghrih
    hnrghssegrrhhmrdgtohhmpdhrtghpthhtohepsghijhhurdgurghsrdhjiiessghprdhr
    vghnvghsrghsrdgtohhmpdhrtghpthhtohepphhrrggshhgrkhgrrhdrmhgrhhgruggvvh
    dqlhgrugdrrhhjsegsphdrrhgvnhgvshgrshdrtghomhdprhgtphhtthhopehnfhhrrghp
    rhgrughosegtohhllhgrsghorhgrrdgtohhmpdhrtghpthhtohepghgvvghrthdorhgvnh
    gvshgrshesghhlihguvghrrdgsvgdprhgtphhtthhopegsihhjuhdruggrshdrrghusehg
    mhgrihhlrdgtohhmpdhrtghpthhtoheplhhumhgrgheskhgvrhhnvghlrdhorhhgpdhrtg
    hpthhtohepfihilhhlsehkvghrnhgvlhdrohhrghdprhgtphhtthhopehkrhiihihsiiht
    ohhfrdhkohiilhhofihskhhisehlihhnrghrohdrohhrgh
X-ME-Proxy: <xmx:fdQJaGrKvW9RFZhk7RudXGzsxEG1Q9E-Aq-awWO7knlTOGHY4v7NSA>
    <xmx:fdQJaEnXReKKywGOEAMBqbrkLrWpnUfpqmwxyqJEaDu0w8ZjwEFc0A>
    <xmx:fdQJaG0EuBhMbuY6PCvY5E_PVj_z8Q1SiYttWtHz0vv_uOUUc4oipg>
    <xmx:fdQJaLtstvXdjPwaAHuyJbLGjWruj7XMs4NVj808VxW5H0f4NgivGw>
    <xmx:ftQJaM7VYztCNU_C38sF2Ld24pyAaT1mbvWPpSqIiSRIaQMOIAwRqjyZ>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id 1E06C2220073; Thu, 24 Apr 2025 02:04:45 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-ThreadId: T706ac2956bd1c4f2
Date: Thu, 24 Apr 2025 08:04:11 +0200
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Biju Das" <biju.das.jz@bp.renesas.com>,
 "Catalin Marinas" <catalin.marinas@arm.com>, "Will Deacon" <will@kernel.org>
Cc: "Bjorn Andersson" <bjorn.andersson@oss.qualcomm.com>,
 "Krzysztof Kozlowski" <krzysztof.kozlowski@linaro.org>,
 "Geert Uytterhoeven" <geert+renesas@glider.be>,
 "Dmitry Baryshkov" <lumag@kernel.org>, "Taniya Das" <quic_tdas@quicinc.com>,
 =?UTF-8?Q?N=C3=ADcolas_F=2E_R=2E_A=2E_Prado?= <nfraprado@collabora.com>,
 "Lad, Prabhakar" <prabhakar.mahadev-lad.rj@bp.renesas.com>,
 linux-arm-kernel@lists.infradead.org, "Biju Das" <biju.das.au@gmail.com>,
 Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Message-Id: <6d3fe783-05c5-4742-a8f9-37a41e1caedc@app.fastmail.com>
In-Reply-To: <20250424054050.28310-5-biju.das.jz@bp.renesas.com>
References: <20250424054050.28310-1-biju.das.jz@bp.renesas.com>
 <20250424054050.28310-5-biju.das.jz@bp.renesas.com>
Subject: Re: [PATCH 4/4] arm64: defconfig: Enable Renesas RZ/G2L GPT config
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Thu, Apr 24, 2025, at 07:40, Biju Das wrote:
> Enable PWM config for Renesas RZ/G2L GPT as it is populated on
> the RZ/G2L and RZ/V2L SMARC EVKs.
>
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>

Acked-by: Arnd Bergmann <arnd@arndb.de>

I assume Geert will pick this up through the Renesas tree
and forward it to soc@lists.linux.dev.


