Return-Path: <linux-renesas-soc+bounces-9761-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id BBC2499F001
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 15 Oct 2024 16:48:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id F3B0BB20F73
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 15 Oct 2024 14:48:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 30CE81AF0C3;
	Tue, 15 Oct 2024 14:48:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b="OXr7ZRdT";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="Km/UIwt1"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from fout-a3-smtp.messagingengine.com (fout-a3-smtp.messagingengine.com [103.168.172.146])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 220691F61C;
	Tue, 15 Oct 2024 14:48:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.146
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729003698; cv=none; b=OFwJVoXb0TzubZddlIIC10VIuUjDaHqaBeYln4cpraoEkiWTPSH55wDdIV73kLtQjElTXu4RoJTXgQ6d4xedm7c61oYwglup6pAB2U5Gxh/rSHp3i+CrRiGfWhObjXL/capRV6U54a1Sy2pKimP28E5nEKYNYg7x2FmqZuArFGk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729003698; c=relaxed/simple;
	bh=b+yBd/Gm4RLndTqo06/y19y7EYdCdMmjHzO62vivFfI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=raq4ITxyLpMD/Z9t8+tmZG29oVMgHzm4CrLvtH7gD6gdlBZjn4+CQtVvI+BirYhJE+VySYm9U4+wN3JtOtu+hawPHpKqnDsdUqs5TqSIUNJo7j80xc3/sVhh3kTmGZmx6lairouDyYr7pfWnOsLVJdnbsjGtDUgiLoHq4a/Zg/M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se; spf=pass smtp.mailfrom=ragnatech.se; dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b=OXr7ZRdT; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=Km/UIwt1; arc=none smtp.client-ip=103.168.172.146
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ragnatech.se
Received: from phl-compute-06.internal (phl-compute-06.phl.internal [10.202.2.46])
	by mailfout.phl.internal (Postfix) with ESMTP id 0B3E31380212;
	Tue, 15 Oct 2024 10:48:13 -0400 (EDT)
Received: from phl-mailfrontend-01 ([10.202.2.162])
  by phl-compute-06.internal (MEProxy); Tue, 15 Oct 2024 10:48:13 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ragnatech.se; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm1; t=1729003693;
	 x=1729090093; bh=HZ+SKvxYRX+Zchp1+IFfZDpY/uLWvLlX3BOiR3Kn1Nw=; b=
	OXr7ZRdT+4EHrrEg9j/KNJ3vEAgHcHBt00V76i/aVKTtY4qprt3MS7z1v2p5xkSh
	wjTlot+cRh4CRcZnjHRtVEtbJK+ih6szt8ZzsvjtRO3ssR6ymBMKcVY+aB9LsMea
	vhm9xgXfiK7CgMV3sEVnvkgpZ+ScqbjGMK6w1e0wHzIDPdNPZ0c67wgQu6JjhLB/
	nhrkQdQkFnmVk5zZ2is6cqqKbn25on5tKq0xilYPGDxc4+T4X5ewqzY97OIQIyQ4
	uLtwYbprPC4DUkdIPtHaxUYvZ0vV2SGtfmqKSa84J3U9im3hoYtyp0e308Zf7/Di
	bEdVY75Lv59vqmzTYpqdeg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1729003693; x=
	1729090093; bh=HZ+SKvxYRX+Zchp1+IFfZDpY/uLWvLlX3BOiR3Kn1Nw=; b=K
	m/UIwt1k+Gqz14c4y4smcIdePpowI5K25IJbekjr4zWlyFl7/mfihlOhpIcHbJOs
	YvNigxNhsfmy0oRIHsRzm4izrSv3HzpX7A0pIrAhsIG0DvlLOog4rVeEdK6TYjL0
	6N4wVGVayNnSNLqd0PQqI5YsloMjeRSf4daYk0ON1Cg0pNjVWg+0Qdd+fBNUu0Qa
	J1HSVotyEU6IEL/DpT4yHsMLRd6Gneu5xnsEFCgS9Jwyb9N81Ruy78fH7YdOx1YI
	8/a+FKp62JMKWLKjfyIq6NWIoHODid32IUu8Rwr+zQzz2GWJYaawBlDtSaLdd4Mp
	fTFERWGgG/NmmXtP4+aUQ==
X-ME-Sender: <xms:rIAOZ0pdlDVmZLSbDIgp5MrmBPzARf1InF-y03fsSNulYy2T4h3pHw>
    <xme:rIAOZ6pQKpB1rSEP8xw0Qw-cUQRTSGycPOHofGmfTnDdI3EeygvaRZCY96aWT-0Pr
    jKYyXPuHys8iDCrgNQ>
X-ME-Received: <xmr:rIAOZ5NslSZFcsk6xY0dMUftF-_ZsdQWVA_euTuhewYPxpgCbkJPuMSUsParK77CKQ7hC1EEOiWijCs88N2RPpPEsVc8lZz6pA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeftddrvdegjedgkedtucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdggtfgfnhhsuhgsshgtrhhisggvpdfu
    rfetoffkrfgpnffqhgenuceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnh
    htshculddquddttddmnecujfgurhepfffhvfevuffkfhggtggugfgjsehtkeertddttdej
    necuhfhrohhmpefpihhklhgrshcuufpnuggvrhhluhhnugcuoehnihhklhgrshdrshhoug
    gvrhhluhhnugdorhgvnhgvshgrshesrhgrghhnrghtvggthhdrshgvqeenucggtffrrght
    thgvrhhnpeefhfellefhffejgfefudfggeejlefhveehieekhfeulefgtdefueehffdtvd
    elieenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehn
    ihhklhgrshdrshhouggvrhhluhhnugdorhgvnhgvshgrshesrhgrghhnrghtvggthhdrsh
    gvpdhnsggprhgtphhtthhopeejpdhmohguvgepshhmthhpohhuthdprhgtphhtthhopehm
    rghrvgigseguvghngidruggvpdhrtghpthhtohepghgvvghrtheslhhinhhugidqmheike
    hkrdhorhhgpdhrtghpthhtoheprhhosghhsehkvghrnhgvlhdrohhrghdprhgtphhtthho
    pehkrhiikhdoughtsehkvghrnhgvlhdrohhrghdprhgtphhtthhopegtohhnohhrodguth
    eskhgvrhhnvghlrdhorhhgpdhrtghpthhtoheplhhinhhugidqrhgvnhgvshgrshdqshho
    tgesvhhgvghrrdhkvghrnhgvlhdrohhrghdprhgtphhtthhopeguvghvihgtvghtrhgvvg
    esvhhgvghrrdhkvghrnhgvlhdrohhrgh
X-ME-Proxy: <xmx:rIAOZ764koP8suc3iDCiWrX28xoYjvSTi2papfwXmhxXnMR62GK4Mw>
    <xmx:rIAOZz4h3yaIU7RB0PcwiEkrXaO0ZiePN7OQAANH8_cJXQ1jGiHn0A>
    <xmx:rIAOZ7h37e7izzK5IZ5tJqXKy7YL21cA56kxEFZW8VT5jWL_Ye1wMA>
    <xmx:rIAOZ97a6HSvCq1k1Q5Sy7DWM6IvixyMbqRPIab72EMppiocFEvYhg>
    <xmx:rYAOZ2ZZ0S51X4q8MOPi8fzKEm6xvLL28aE_CFGFO-hXwbq47j-tmmCx>
Feedback-ID: i80c9496c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 15 Oct 2024 10:48:12 -0400 (EDT)
Date: Tue, 15 Oct 2024 16:48:10 +0200
From: Niklas =?utf-8?Q?S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>
To: Marek Vasut <marex@denx.de>
Cc: Geert Uytterhoeven <geert@linux-m68k.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH] arm64: dts: renesas: white-hawk-cpu: Move avb0 reset
 gpio to mdio node
Message-ID: <20241015144810.GD2838422@ragnatech.se>
References: <20240704152610.1345709-1-niklas.soderlund+renesas@ragnatech.se>
 <CAMuHMdUZAVAkPVus2T_O3sWT7f1PciRYjxm6ecLy0QUyh50OEw@mail.gmail.com>
 <d1b36858-da21-4e2a-bc54-175524a7d3b4@denx.de>
 <CAMuHMdXRhUr1My-w0+hoAhQKgOq9iwecjow4iZTh82ED5DEfdA@mail.gmail.com>
 <50b37c36-643c-4307-9d4e-ad49b306ba8a@denx.de>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <50b37c36-643c-4307-9d4e-ad49b306ba8a@denx.de>

Hello,

On 2024-09-06 20:09:19 +0200, Marek Vasut wrote:
> On 8/22/24 3:56 PM, Geert Uytterhoeven wrote:
> > Hi Marek,
> 
> Hi,
> 
> sorry for the delay.
> 
> > On Fri, Aug 2, 2024 at 7:16 PM Marek Vasut <marex@denx.de> wrote:
> > > On 8/2/24 10:33 AM, Geert Uytterhoeven wrote:
> > > > What is your stance on this?
> > 
> > > > On Thu, Jul 4, 2024 at 5:26 PM Niklas Söderlund
> > > > <niklas.soderlund+renesas@ragnatech.se> wrote:
> > > > > When creating a dedicated mdio node to describe the bus the gpio reset
> > > > > property was erroneously left in the phy node. The reason for adding
> > > > > mdio nodes on WhiteHawk was to ensure the PHYs where reset before they
> > > > > were probed, keeping the property in the phy node prevented this.
> > > 
> > > If the PHYs should be reset before they are probed, that is something
> > > the PHY driver should take care of, right ? The PHY driver can bind to
> > > the PHY via compatible string. Does the PHY driver not reset the PHYs ?
> > 
> > AFAIK, there is no requirement to reset the PHY before it is probed.
> 
> That would mean the PHY is in undefined state before it is probed, which is
> not good.
> 
> > However, the reset signal may be in asserted state when the PHY is
> > probed (e.g. after unbind from the Ethernet driver, or during kexec).
> > Identifying the PHY by reading the ID register requires deasserting
> > the reset first.
> That may not be the entire precondition. For example the SMSC LAN87xx PHYs
> also require PHY clock to be enabled before the reset is toggled, but such
> information is available only to the specific PHY driver.
> 
> The MDIO-level reset GPIO handling, as far as I understand it, applies in
> case there are more PHYs on the MDIO bus which share the same reset GPIO
> line.
> 
> In this case there is only one PHY on the MDIO bus, so the only bit which
> applies is the potential PHY-specific reset requirement handling. If the PHY
> driver ever gets extended with such a thing in the future, then having the
> reset-gpios in the PHY node is beneficial over having it in MDIO node.
> 
> It will always be a compromise between the above and best-effort PHY
> auto-detection though.

I agree this is not needed if the PHY is identified by the compatible 
string, but might be if it is not. In this case it works and the reason 
for this patch was just to align the style used here.

I'm happy to drop this patch, or send a rebased version that applies 
since the context changed ;-) Marek, Geert what is your view? I'm happy 
with either option.

-- 
Kind Regards,
Niklas Söderlund

