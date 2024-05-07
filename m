Return-Path: <linux-renesas-soc+bounces-5206-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 76FFC8BE0C3
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  7 May 2024 13:14:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 9A5511C221E1
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  7 May 2024 11:14:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2FBF41514E7;
	Tue,  7 May 2024 11:14:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b="qc5stMZB";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="frcr+dyD"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from wfhigh5-smtp.messagingengine.com (wfhigh5-smtp.messagingengine.com [64.147.123.156])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5453113CFAD;
	Tue,  7 May 2024 11:14:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=64.147.123.156
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715080478; cv=none; b=i6tEvNMMBQbE4DQaQQxDBJ0h7z+ux0TKG8uirZ8V4+xJFI82fJr21i5+OIok2DMJgqLvKCtN9TbaZ1jiacUs5RTwSb6NxDcCpdpjaMP9DDYNusAiGXjPR45SPHQY8jNqF/nr2XiewJcObEcRfULF0m4IMbKc+3GyKTLC3xLv9fY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715080478; c=relaxed/simple;
	bh=eAy/F0pITkePjQeYgsqDSQBbp0ZeZXuxZitQrYHQ57w=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=pGERphaIqnDNhd3Xehg1IDljmN7JiZln9dxzZwj4ayP+0X5Qo1Y1I9KIN8F0f5VmNg3COW4F0vsZImXqJ688N0silGFxe4pvdS74SbkjWx34OufbFEvILUcQGnrYsyVfG3IAmqVh5qSoAJVMEy+JQ6dgUl6oxM6cJHn2TIsXj10=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se; spf=pass smtp.mailfrom=ragnatech.se; dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b=qc5stMZB; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=frcr+dyD; arc=none smtp.client-ip=64.147.123.156
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ragnatech.se
Received: from compute6.internal (compute6.nyi.internal [10.202.2.47])
	by mailfhigh.west.internal (Postfix) with ESMTP id B84F118000EE;
	Tue,  7 May 2024 07:14:32 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute6.internal (MEProxy); Tue, 07 May 2024 07:14:33 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ragnatech.se; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm2; t=1715080472;
	 x=1715166872; bh=ExdImNTrAEE8eTDqnYwHtkEqkw0iJOiQ4VkzpdMSP2A=; b=
	qc5stMZBQQQ9AXZvT5YVSoCgE9Madu8qHb4r/hB0jP77htm7GAvkgyG5+ZLCjqCD
	vKFRaHcbMPbdT6KoXuXGAIxMaAPLVWtd9pU6AXsWhEq1KZ6vJN5uMyOsaDKaLvz1
	FuG0zqowpkn97e6WoOvYuK4yoKMZHFXDQZyW4DSSyXeJaVs48xi4X45mmrLqg2Rp
	s2qYZLngzaT+Zf/7NVYjCqcJnEoxMlh5+LUGUPBX5tniFf6wFgUMQHnOz/gqqbIZ
	JPFMMnMLTcBIIHUq1ZjXgjF4xTt5NKJRZppAHmpQbit7/1p3/ylsgMakEE63+a05
	EDAsI8Dkr4/d8pn0ZoHRzg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1715080472; x=
	1715166872; bh=ExdImNTrAEE8eTDqnYwHtkEqkw0iJOiQ4VkzpdMSP2A=; b=f
	rcr+dyD0So2kJHCM3SMwIFb1yFgQysWCjgngCotwcXDv5G6ivAIq6ZROeNRTNaN0
	KYZ5eKBAUY8VfwaA/LwwPe0MPMuqxp0je888XSTccpLHruZzu/85YI+Wbc7bLZZT
	G8P2c93eF6swocJijEPRXXYV//TP4qf1fyTFNnq219nZ3pk5IV2cvnLlwRlKVsHh
	wwg/S9ao2Akn1s/3enIEwIL7KPd68Ustko7mPwrSRby8mrEU+r+2ZKrDANwJpIoO
	pSprHVe6iehZD4tAtDMlGwFXnHMHNXBe3/0+Q2T9MuYQE5NGf5bSzc9ruiY0AZ3E
	odKY+1k0tanU6AXLHcLuw==
X-ME-Sender: <xms:Fw06Zkt6kLIUSOvcmbJBWzT-nldLHJ55RI3zA1gBKeNrSSmIpx7m5g>
    <xme:Fw06ZheQfeT4leIPK-49oZqd-p93kU-CMmvEyV0fCVwhe5LuNpYBUf0Nh0R75w4zk
    JYUJNTPIOySdit2C6k>
X-ME-Received: <xmr:Fw06Zvxbf9faTdeog_YazCxuF2DKnA5VAKpJsb3Qjtu0C4r_Mk1zK6GVeYsO1AjR79rkYwyRcHzovtW-1j4XwyTmqJq2cRQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvledrvddvkedgfeehucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepfffhvfevuffkfhggtggugfgjsehtkeertddttdejnecuhfhrohhmpefpihhk
    lhgrshcuufpnuggvrhhluhhnugcuoehnihhklhgrshdrshhouggvrhhluhhnugdorhgvnh
    gvshgrshesrhgrghhnrghtvggthhdrshgvqeenucggtffrrghtthgvrhhnpeefhfellefh
    ffejgfefudfggeejlefhveehieekhfeulefgtdefueehffdtvdelieenucevlhhushhtvg
    hrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehnihhklhgrshdrshhouggv
    rhhluhhnugdorhgvnhgvshgrshesrhgrghhnrghtvggthhdrshgv
X-ME-Proxy: <xmx:Fw06ZnP-EceyYX6WN4Vh9xTJczdG2Bc2B26BA83M-YlozPhMqF7UmA>
    <xmx:Fw06Zk9tjHWDSNp4jdKqnJDfXDJOjyqdr8PNF4GvBYAzqOF5Ukn4wQ>
    <xmx:Fw06ZvUguv4y11ypG2z_HwfjJICF0GmybTzIacfmhHsQdnkZCieHlA>
    <xmx:Fw06Zte3VfkWNrOiG7DnIaPOWQ9mnddEHhZCvlT_Lc8vrOw88te5CA>
    <xmx:GA06ZoQ77RtQIA6pXDT1DGvVKznI8q1Mpy4qccMKG5YxxrvqtrqOkG-J>
Feedback-ID: i80c9496c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 7 May 2024 07:14:31 -0400 (EDT)
Date: Tue, 7 May 2024 13:14:28 +0200
From: Niklas =?utf-8?Q?S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>
To: Andrew Lunn <andrew@lunn.ch>
Cc: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	netdev@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Subject: Re: [net-next] net: ethernet: rtsn: Add support for Renesas
 Ethernet-TSN
Message-ID: <20240507111428.GJ720810@ragnatech.se>
References: <20240414135937.1139611-1-niklas.soderlund+renesas@ragnatech.se>
 <5fd25c58-b421-4ec0-8b4f-24f86f054a44@lunn.ch>
 <20240503102006.GI3927860@ragnatech.se>
 <e3ce12b0-fb5d-49d7-a529-9ea7392b80ca@lunn.ch>
 <20240503133033.GJ3927860@ragnatech.se>
 <d5f6f31a-6ecc-48a9-a2ca-9d22fc6acb21@lunn.ch>
 <20240506140533.GD720810@ragnatech.se>
 <0b686943-51de-49c9-afef-04db18b8fdbc@lunn.ch>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <0b686943-51de-49c9-afef-04db18b8fdbc@lunn.ch>

On 2024-05-06 21:53:58 +0200, Andrew Lunn wrote:
> On Mon, May 06, 2024 at 04:05:33PM +0200, Niklas Söderlund wrote:
> > Hi Andrew,
> > 
> > Thanks for this explanation, it helps understand what's going on.
> > 
> > On 2024-05-06 03:51:45 +0200, Andrew Lunn wrote:
> > 
> > > What PHY is this? Does it have C22 registers? Can it be identified via
> > > C22 registers 2 and 3?
> > 
> > The PHY in question is mv88q2110 (drivers/net/phy/marvell-88q2xxx.c), 
> > unfortunately I do not have a datasheet for it so I can't tell you much 
> > about it.
> 
> The mv88q2110 declares itself as 0x002b0b20.
> 
> > 
> > <snip>
> > 
> > > 
> > > So i would drop the compatible. See if C22 is sufficient to get the
> > > correct driver loaded.
> > 
> > - Remove C45 compatible; Remove C45 read/write in driver
> > 
> >   The PHY is identified as "Generic PHY", and the correct PHY driver is 
> >   not used. I can't test more than that as the generic PHY driver do not 
> >   implement some quirks I need to get the link up.
> 
> What ID does it return in registers 2 and 3? Anything like 0x002b0b20?
> If there is some usable value there, we can probably extend the driver
> to accept that ID as well.
> 
> Another option it to use a compatible conforming to:
> 
>       - pattern: "^ethernet-phy-id[a-f0-9]{4}\\.[a-f0-9]{4}$"
> 
> ethernet-phy-id002b.0b20
> 
> That will bypass reading ID registers for the ID, and just use the ID
> in the compatible. However, it would be better to read them from the
> PHY.

Thanks for these hints. Using a compatible to indicate which PHY to use 
allows the RTSN driver to not implement C45 read/write functions and 
still operate.

I will look into if I can extend the PHY driver with identification from 
register 2 and 3, but that will be a separate work item.

Unrelated note: I use the ID 0x002b0980 instead of 0x002b0b20 as I have 
a 88Q2110 and not a 88Q2220 PHY, but both are handled by the same PHY
driver.

> 
> 	Andrew
> 
> 

-- 
Kind Regards,
Niklas Söderlund

