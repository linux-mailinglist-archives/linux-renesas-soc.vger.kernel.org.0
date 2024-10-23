Return-Path: <linux-renesas-soc+bounces-9996-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id E3D519ACA4B
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 23 Oct 2024 14:41:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id E3A821C217D5
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 23 Oct 2024 12:41:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7F0A51AB539;
	Wed, 23 Oct 2024 12:41:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b="d/dNjEc4";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="MumQwB+Q"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from fout-b6-smtp.messagingengine.com (fout-b6-smtp.messagingengine.com [202.12.124.149])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 734AA1AA795;
	Wed, 23 Oct 2024 12:41:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.12.124.149
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729687303; cv=none; b=RltEVM9uIkRsG4xGBIgqWJeMXdRblpV76qs8A4DIfPDvcBdDQXRBYKZ6lwtkcccek9YjAjcm4DCCAsrhnnxCDRAHSQHc7i6T6lveAUAIOopcncZC3T7gQBrrgsXBy/u5cHeWDD/d9LMisnzze1Ckg5Od1IqYv/mgO+s3NVQLd1w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729687303; c=relaxed/simple;
	bh=E6FBFn0Ujc319qC0O/jBgBpQtLYrjDz4154twniKKzM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=RGx0RoJ5TGKKOWvrG745xTECCMR3kce7tCpwPnkALWNmpw5cbtYdRm4/YZJDcZfO1SACOFa9OY4TKMc5K9FOzWRiigY1T+mRHBnngAqo75K/sQV3l0QwFq0vTEfSzL7eiKGqNU9Tf2lpiJ+9RL/mHAVUrYGnF2uBOFdjfj7EBJM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se; spf=pass smtp.mailfrom=ragnatech.se; dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b=d/dNjEc4; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=MumQwB+Q; arc=none smtp.client-ip=202.12.124.149
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ragnatech.se
Received: from phl-compute-01.internal (phl-compute-01.phl.internal [10.202.2.41])
	by mailfout.stl.internal (Postfix) with ESMTP id 334D9114009E;
	Wed, 23 Oct 2024 08:41:38 -0400 (EDT)
Received: from phl-mailfrontend-02 ([10.202.2.163])
  by phl-compute-01.internal (MEProxy); Wed, 23 Oct 2024 08:41:38 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ragnatech.se; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm2; t=1729687298;
	 x=1729773698; bh=VW7MmHOKBJ2Amif5Bul+T9HBPuzh3KiWj+o/3hNtOGo=; b=
	d/dNjEc4jtF5QxMrZSBcGgJh9bB6Zwa4WbMHAGujzsw71Hf+9pro1L8fHBY2JwEU
	t4VCZ6X3s1OdTX2QoaxdZm2qa7WeuycMfcX9Na9n52CAwGTSBKe5WcdgrwZX5poN
	oNG+R+N019Q9dY4xjbkK2S7PR3AzoyUcuq6rlQuYnH1KznIkaobR8EKmQL9Z71Rp
	x/AGge8bbzNj46HiCZZdh7NsosI0PEXsetmQS+vDpsAhS1Qz8PxtX6DcJNmXBUQ3
	F4vXIVPcI0laoYkK6liH51/6dqFtkzNvN8FYu7Fiuoqa8juSGWz4/8Ll8GqKWeDF
	DRvVOCWNeFAHDKbXVmhBfg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1729687298; x=
	1729773698; bh=VW7MmHOKBJ2Amif5Bul+T9HBPuzh3KiWj+o/3hNtOGo=; b=M
	umQwB+QT2T5lZVRawC27AhOXaoY46xnQ9UluRAmOEs0PctmXV86ZBwR108Fq/EkC
	RT3cwoimnkZk06G2dQ7hxexjt9hKxPe7aAYFUXXu5tWWet0lqhpgpKetyhLqSk6M
	b48lWtLAsf3WwC1OtGXjfYUeuP55AvRS+rY7V5Hzh9ePOFJOVVf50ZXlrqC1vF2m
	YGASNJdjgwpUR5UNlHMa7Hsf0sWYTji0kHVvHi+5Myf10FOyLH5B+fy2po4mSgYj
	k0i2vL4sjUaVInG8pdv5tyG1HWw+8j9Y1szgaz+Kq+9SYT6iDLCbQc3i0PnJGI8i
	vS7gO0Cf3uponRaAAPdAA==
X-ME-Sender: <xms:Ae8YZ1PfVYUMfBAee28gg7nkevyUDcGb2oyCsIp2U68OMQIRdoLjTA>
    <xme:Ae8YZ3_Erg5EspjR475GUemLB_rYbtBYCUjqnUzI05S-JUNelFqhJKdZqznBPwdaP
    LIL4sdRpe3_Pxqk7zY>
X-ME-Received: <xmr:Ae8YZ0QcaIPsKC0U_HTfIrONPAmlk5j1-aYj2t2peVlTwd9V-4arXjuLGvv_W9Gwer13mofcYWBrGq2MEHXdt031GQS9yiJNwg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeftddrvdeijedgheegucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdggtfgfnhhsuhgsshgtrhhisggvpdfu
    rfetoffkrfgpnffqhgenuceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnh
    htshculddquddttddmnecujfgurhepfffhvfevuffkfhggtggugfgjsehtkeertddttdej
    necuhfhrohhmpefpihhklhgrshcuufpnuggvrhhluhhnugcuoehnihhklhgrshdrshhoug
    gvrhhluhhnugdorhgvnhgvshgrshesrhgrghhnrghtvggthhdrshgvqeenucggtffrrght
    thgvrhhnpeefhfellefhffejgfefudfggeejlefhveehieekhfeulefgtdefueehffdtvd
    elieenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehn
    ihhklhgrshdrshhouggvrhhluhhnugdorhgvnhgvshgrshesrhgrghhnrghtvggthhdrsh
    gvpdhnsggprhgtphhtthhopeeipdhmohguvgepshhmthhpohhuthdprhgtphhtthhopehg
    vggvrhhtsehlihhnuhigqdhmieekkhdrohhrghdprhgtphhtthhopehrohgshheskhgvrh
    hnvghlrdhorhhgpdhrtghpthhtohepkhhriihkodgutheskhgvrhhnvghlrdhorhhgpdhr
    tghpthhtoheptghonhhorhdoughtsehkvghrnhgvlhdrohhrghdprhgtphhtthhopehlih
    hnuhigqdhrvghnvghsrghsqdhsohgtsehvghgvrhdrkhgvrhhnvghlrdhorhhgpdhrtghp
    thhtohepuggvvhhitggvthhrvggvsehvghgvrhdrkhgvrhhnvghlrdhorhhg
X-ME-Proxy: <xmx:Ae8YZxuNTMgT-1XEDtVDCDM6H7a6HsWCCD73rfzBhogL-MBWW7NP_g>
    <xmx:Ae8YZ9cahsoxS_iqDxXHuatSIlWMmSHp2qxz-SyD29wRkalHaZIpSA>
    <xmx:Ae8YZ90zUWiQ1dQeXH2HUax2IXaguc6NSkx_SU9KB2bawNzZWFKuhA>
    <xmx:Ae8YZ580hUdbIPREOBgODAKN6M-mBt6IrJKzrrtaVEEcPpmjR14Q8w>
    <xmx:Au8YZ1S_lYNf3btHLyTBxGh5IB4GDyEFwMpVs1t0FdOOGp80zFhRY9Ns>
Feedback-ID: i80c9496c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 23 Oct 2024 08:41:36 -0400 (EDT)
Date: Wed, 23 Oct 2024 14:41:34 +0200
From: Niklas =?utf-8?Q?S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH 0/2] arm64: dts: renesas: falcon: Wire-up Ethernet
 breakout board
Message-ID: <20241023124134.GA1417003@ragnatech.se>
References: <20241022184727.3206180-1-niklas.soderlund+renesas@ragnatech.se>
 <CAMuHMdV+4PdxnRCzr7fnHnGYiuypem1hYMbXLac+x2db7yfpkA@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAMuHMdV+4PdxnRCzr7fnHnGYiuypem1hYMbXLac+x2db7yfpkA@mail.gmail.com>

Hi Geert,

On 2024-10-23 09:13:11 +0200, Geert Uytterhoeven wrote:
> Hi Niklas,
> 
> Thanks for your series!
> 
> On Tue, Oct 22, 2024 at 8:48 PM Niklas Söderlund
> <niklas.soderlund+renesas@ragnatech.se> wrote:
> > This small series wires up the Marvell 88Q2110 PHYs found on the Falcon
> > Ethernet breakout board. With this applied all five PHYs are probed
> > correctly.
> >
> >     mv88q2110 e6810000.ethernet-ffffffff:07: attached PHY driver (mii_bus:phy_addr=e6810000.ethernet-ffffffff:07, irq=POLL)
> >     mv88q2110 e6820000.ethernet-ffffffff:07: attached PHY driver (mii_bus:phy_addr=e6820000.ethernet-ffffffff:07, irq=POLL)
> >     mv88q2110 e6830000.ethernet-ffffffff:07: attached PHY driver (mii_bus:phy_addr=e6830000.ethernet-ffffffff:07, irq=POLL)
> >     mv88q2110 e6840000.ethernet-ffffffff:07: attached PHY driver (mii_bus:phy_addr=e6840000.ethernet-ffffffff:07, irq=POLL)
> >     mv88q2110 e6850000.ethernet-ffffffff:07: attached PHY driver (mii_bus:phy_addr=e6850000.ethernet-ffffffff:07, irq=POLL)
> >
> > They can be auto detected with just the compatible
> > "ethernet-phy-ieee802.3-c45", but to keep the style currently used I
> > have added the specific compatible for the 88Q2110 as done for other
> > SoCs.
> 
> If the specific compatible values are not needed, I prefer not to add
> them, as DT should describe only what cannot be auto-detected[1].

Ok, I will post a v2 without the specific compatible value.

> Have you tried kexec and/or unbinding/rebinding the AVB driver
> (the latter is probably easiest)?

I have tested unbinding/rebinding the driver both with and without a 
specific compatible value, both scenarios work.

> 
> > The primary issue we had with this in the past was due to an incorrect
> > PHY address. After studying the schematics (v100) I found the PHYs
> > address pins are wired differently on Falcon compared to other Gen4
> > boards. On Falcon they are pulled-down, while on other Gen4 boards they
> > are left unconnected and subjected to the PHYs internal pull-ups. This
> > gives the PHY an address where the lower 3 bits of the address is
> > inverted for Falcon.
> 
> This was changed in v102 of the schematics (REV0043c vs. REV0043b of
> the schematics for the Ethernet sub board): See "Changed Strap pin
> settings ==> PHYAD=[0,0,0], pull-down removed" on page 1, and the
> various PHY configuration notes...
> Moreover, this might be different in other board revisions, as the
> BSP uses PHY address 1 for RAVB1, address 2 for RAVB2, and so on...
> 
> As I only had remote access to Falcon, I never knew the actual board
> revision I was using.

I could not find any revision markings on the board. But to the best of 
my ability (the markings are not super clear) I have identified that the 
pull-down resistors are indeed present on the board I have.

> 
> How to handle this (yet another DTS file)?
> Are non-v100 variants widespread?

As Wolfram points out, I don't think it's widespread. I think it's OK to 
move forward with this as all the V3U boards we have seen have this 
configuration. If one pops-up later we can solve it then right? As 
solving this properly would need ether a separate DTS source or at least 
an overlay anyhow.

Is this acceptable for you? If so I will post a v2 with the change 
proposed above.
> 
> [1] In theory, we could drop all SoC- and family-specific compatible
>     values, and just look at the Product Register. I do not suggest
>     going that way ;-)
> 
> Gr{oetje,eeting}s,
> 
>                         Geert
> 
> -- 
> Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org
> 
> In personal conversations with technical people, I call myself a hacker. But
> when I'm talking to journalists I just say "programmer" or something like that.
>                                 -- Linus Torvalds
> 

-- 
Kind Regards,
Niklas Söderlund

