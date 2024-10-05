Return-Path: <linux-renesas-soc+bounces-9485-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3FDB899164D
	for <lists+linux-renesas-soc@lfdr.de>; Sat,  5 Oct 2024 13:08:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 76BB5284C53
	for <lists+linux-renesas-soc@lfdr.de>; Sat,  5 Oct 2024 11:08:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E1F62136331;
	Sat,  5 Oct 2024 11:08:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b="EqCIjNyP";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="ggSnZmA3"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from fout-a6-smtp.messagingengine.com (fout-a6-smtp.messagingengine.com [103.168.172.149])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F85236B0D;
	Sat,  5 Oct 2024 11:08:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.149
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728126524; cv=none; b=GQriW11Rt4R1iSLoXZk+o23g00ZhUjJ+b8oTqZQy/2ky831MwgB8vSKEAKvCg1PGGF2PtH+8T8Um6KrYOwPeSaW+QiHKDQWJeC6d+rk+YPdLPO+nhMEpgCr4KzjDLN2ANFxd5ZEwo7NARGISbUn9QfOI7f86aftzLzEIjAhK2cg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728126524; c=relaxed/simple;
	bh=DnQPKOqA550IXFZYjVLW6XXAmkTTjlgJ7xgC5RBmClU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=prRrLZc83yET9nrs1Yej/Q/Nczy3oIOqRWhCg1kysyTpyaNMm5vIcgsSdM+C6FIaIi1cDxJT4Cz7jatLUYQBR9sDScuCHgaFd8uf0r71fpIMEq/8kfhnFpdpZHjT4wYDzjlvqAC8kHe66xHWi2ANIy+4wHuLqhjiBK49RNXTNds=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se; spf=pass smtp.mailfrom=ragnatech.se; dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b=EqCIjNyP; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=ggSnZmA3; arc=none smtp.client-ip=103.168.172.149
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ragnatech.se
Received: from phl-compute-08.internal (phl-compute-08.phl.internal [10.202.2.48])
	by mailfout.phl.internal (Postfix) with ESMTP id EB95B1380803;
	Sat,  5 Oct 2024 07:08:38 -0400 (EDT)
Received: from phl-mailfrontend-02 ([10.202.2.163])
  by phl-compute-08.internal (MEProxy); Sat, 05 Oct 2024 07:08:38 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ragnatech.se; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm1; t=1728126518;
	 x=1728212918; bh=6dgCb4TV8VSPdfmS6KsJN9DphTSQH4Wee0LoV5DcYLo=; b=
	EqCIjNyPhsZuApvsOM0wNIBkvYFMr6uk0QhRglq2J3BTHnJjKBa5FqdbA+Bo7+Jb
	6BCq9umW6KBN1nkbTXTu9rtXadWfJGQR6D8FaBSqL5/kkxNca6NHloV83osxY3au
	8vuUw636d3XIbi2yTR2KuR042tHxHlNMOmYAvBMQs3WgMfUJLafPPiXYYfpRW3+m
	q5jdNeeTEc+W302SFNSEhP0en0AH01KtliyscPncCayQ0zrdDMavaOsgeNRdIhNO
	nWUZW5/rhWjdfYv3GigSKsghpcU64l+bBB8Z+TQ1xCFissgfB7J2aZgtyxcfTllv
	2u3xwTHbnQS+KSAtUtqgcQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1728126518; x=
	1728212918; bh=6dgCb4TV8VSPdfmS6KsJN9DphTSQH4Wee0LoV5DcYLo=; b=g
	gSnZmA3zgBXNGbDSUbt+7jpEM4JXvRkLK5J/UNCYhOpNqQuwBr+f5jUyG/dxCILs
	NFgYLp5/0+W/OlA8UI18tOfBMa+WITkCmU+qTtKV0FWf7Ix7i4nuZy4hwVXnNUdq
	61LtEXfZxSJNpGu/aickBm/ssj0go6rG6kBp7ooDbqquUY2AmKAw086cRyitv2hU
	X9VWpn+C15H2yCU3YwutHpwCOr7KB6fBuyEwFsI70d2m9Pn0HFGS7JI0SwT3Ogpf
	kzxBKQwO1hnsW2p0ceIfMviHd1KMQR4tMvIe9eBQVY7dBId7Y2XkbGhwzK1dU8M7
	0fQ57o/bXkTClYPMelNsQ==
X-ME-Sender: <xms:NR4BZzMiXr95nRQ0s6c0h2t3RPp9ksI77Kff3eaEK2yIsoQoiDlcFA>
    <xme:NR4BZ999yBYVKtPZSLdnSOdKs3R08Q2JUKC2GIztnQ9P2Rv-BQe2woCsKL_ps8lsr
    LHhwie-nyvKfB2KzCQ>
X-ME-Received: <xmr:NR4BZyRKaDfcpKicxPSpgkqzsJpfZMJbQgy3GviwjPidNhwuCaRShN4w7O7YiAw4qH6dcv9YgP_Ac1xdXETscHp3eRc6OG-V9Q>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeftddrvddvhedgfeejucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdggtfgfnhhsuhgsshgtrhhisggvpdfu
    rfetoffkrfgpnffqhgenuceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnh
    htshculddquddttddmnecujfgurhepfffhvfevuffkfhggtggugfgjsehtkeertddttdej
    necuhfhrohhmpefpihhklhgrshcuufpnuggvrhhluhhnugcuoehnihhklhgrshdrshhoug
    gvrhhluhhnugdorhgvnhgvshgrshesrhgrghhnrghtvggthhdrshgvqeenucggtffrrght
    thgvrhhnpeefhfellefhffejgfefudfggeejlefhveehieekhfeulefgtdefueehffdtvd
    elieenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehn
    ihhklhgrshdrshhouggvrhhluhhnugdorhgvnhgvshgrshesrhgrghhnrghtvggthhdrsh
    gvpdhnsggprhgtphhtthhopeduvddpmhhouggvpehsmhhtphhouhhtpdhrtghpthhtohep
    vghitghhvghsthesghhmrghilhdrtghomhdprhgtphhtthhopegrnhgurhgvfieslhhunh
    hnrdgthhdprhgtphhtthhopehhkhgrlhhlfigvihhtudesghhmrghilhdrtghomhdprhgt
    phhtthhopehlihhnuhigsegrrhhmlhhinhhugidrohhrghdruhhkpdhrtghpthhtohepug
    grvhgvmhesuggrvhgvmhhlohhfthdrnhgvthdprhgtphhtthhopegvughumhgriigvthes
    ghhoohhglhgvrdgtohhmpdhrtghpthhtohepkhhusggrsehkvghrnhgvlhdrohhrghdprh
    gtphhtthhopehprggsvghnihesrhgvughhrghtrdgtohhmpdhrtghpthhtohepughimhgr
    rdhfvggurhgruhesghhmrghilhdrtghomh
X-ME-Proxy: <xmx:NR4BZ3tVFyBzgOvSOei3vpxJdqUsZ6U7Gc0Ke2X17P5quBoahFo9fQ>
    <xmx:NR4BZ7erY1QOu3LfZosez_kBIo2QqsqNJO4drHVvJ9gw5gIl0Gj2rQ>
    <xmx:NR4BZz0jUfo4LHiJL5v27Cd39Q1GGeMqtxDVUmpTrZaroR4LHgu6YQ>
    <xmx:NR4BZ39gDk98qTVLgSqm3p8vsE3X882TTUNoW8Vlm0IIr5WL7ZN29w>
    <xmx:Nh4BZ51-ny9AqhfNFcqdO0sEnUYeaLFxJKDmelrdyAbdyqTIGZyMDCeu>
Feedback-ID: i80c9496c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sat,
 5 Oct 2024 07:08:37 -0400 (EDT)
Date: Sat, 5 Oct 2024 13:08:34 +0200
From: Niklas =?utf-8?Q?S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>
To: Stefan Eichenberger <eichest@gmail.com>
Cc: Andrew Lunn <andrew@lunn.ch>, Heiner Kallweit <hkallweit1@gmail.com>,
	Russell King <linux@armlinux.org.uk>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Dimitri Fedrau <dima.fedrau@gmail.com>,
	Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
	netdev@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Subject: Re: [net-next 3/3] net: phy: marvell-88q2xxx: Enable auto
 negotiation for mv88q2110
Message-ID: <20241005110834.GC3563898@ragnatech.se>
References: <20240906133951.3433788-1-niklas.soderlund+renesas@ragnatech.se>
 <20240906133951.3433788-4-niklas.soderlund+renesas@ragnatech.se>
 <70b86181-7bcf-42d7-b5a8-d26ac0c4c573@lunn.ch>
 <ZuWW4UOtOGI_KmSg@eichest-laptop>
 <20240914142136.GC64607@ragnatech.se>
 <ZvQKU02iGgcq5Mzp@eichest-laptop>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <ZvQKU02iGgcq5Mzp@eichest-laptop>

Hello Stefan,

On 2024-09-25 15:04:19 +0200, Stefan Eichenberger wrote:
> Hi Niklas,
> 
> On Sat, Sep 14, 2024 at 04:21:36PM +0200, Niklas Söderlund wrote:
> > Hello,
> > 
> > On 2024-09-14 16:00:01 +0200, Stefan Eichenberger wrote:
> > > Hi Niklas and Andrew,
> > > 
> > > I was able to do a first basic test on my setup. I'm using the MV88Q2110
> > > and connecting it to a Göpel media converter that I use as a reference.
> > 
> > Thanks for testing this work.
> > 
> > > However, with your patch applied, I can't get a link. When I set a fixed
> > > link speed of 1GBit/s and the media converter is configured as the
> > > master, I can normally do: 
> > > ethtool -s end1 speed 1000 master-slave forced-slave
> > > After that, the link came up. However, with the changes made, I can't do
> > > this anymore. Can you reproduce this in your setup?
> > 
> > Without this patch I can't bring up a 1GBit/s link at all, I can only 
> > setup a 100 MBit/s link with,
> > 
> >     ethtool -s eth1 speed 100 master-slave forced-slave
> > 
> > If I do the same with speed set to a 1000 I never get a link. That's why 
> > autoneg is a such a boon for me, as with that I do get a 1 Gbit/s link.
> > 
> > As you have the MV88Q2110 datasheets, can you check the register writes 
> > in mv88q2110_init_seq0 and mv88q2110_init_seq1 for sanity? Maybe 
> > something is not quiet right there, I have only been able to reveres 
> > engineer support for autoneg so it's quiet likely.
> 
> Unfortunately this registers are not documented in the datasheet.
> However, from the software initialization guide the following values
> would be correct for A1 and A2 devices (A0 does not need one write):
> static const struct mmd_val mv88q2110_init_seq1[] = {
> 	{ MDIO_MMD_PCS, 0xffde, 0x402f },
> 	{ MDIO_MMD_PCS, 0xfe2a, 0x3c3d},
> 	{ MDIO_MMD_PCS, 0xfe34, 0x4040 },
> 	{ MDIO_MMD_PCS, 0xfe4b, 0x9337},
> 	{ MDIO_MMD_PCS, 0xfe2a, 0x3c1d },
> 	{ MDIO_MMD_PCS, 0xfe34, 0x0040 },
> 	{ MDIO_MMD_AN, 0x8032, 0x0064 },
> 	{ MDIO_MMD_AN, 0x8031, 0x0a01 },
> 	{ MDIO_MMD_AN, 0x8031, 0x0c01 },
> 	{ MDIO_MMD_PCS, 0xFE0F, 0x0000 },
> 	{ MDIO_MMD_PCS, 0x800C, 0x0000 },
> 	{ MDIO_MMD_PCS, 0x801D, 0x0800 },
> 	{ MDIO_MMD_PCS, 0xfc00, 0x01c0 },
> 	{ MDIO_MMD_PCS, 0xfc17, 0x0425},
> 	{ MDIO_MMD_PCS, 0xfc94, 0x5470},
> 	{ MDIO_MMD_PCS, 0xfc95, 0x0055},
> 	{ MDIO_MMD_PCS, 0xfc19, 0x08d8},
> 	{ MDIO_MMD_PCS, 0xfc1a, 0x0110},
> 	{ MDIO_MMD_PCS, 0xfc1b, 0x0a10},
> 	{ MDIO_MMD_PCS, 0xfc3a, 0x2725},
> 	{ MDIO_MMD_PCS, 0xfc61, 0x2627},
> 	{ MDIO_MMD_PCS, 0xfc3b, 0x1612},
> 	{ MDIO_MMD_PCS, 0xfc62, 0x1c12},
> 	{ MDIO_MMD_PCS, 0xfc9d, 0x6367},
> 	{ MDIO_MMD_PCS, 0xfc9e, 0x8060},
> 	{ MDIO_MMD_PCS, 0xfc00, 0x01c8},
> 	{ MDIO_MMD_PCS, 0x8000, 0x0000},
> 	{ MDIO_MMD_PCS, 0x8016, 0x0011},
> 	{ MDIO_MMD_PCS, 0xfda3, 0x1800}, /* According to datahsheet not for Rev A0 */
> 	{ MDIO_MMD_PCS, 0xfe02, 0x00c0},
> 	{ MDIO_MMD_PCS, 0xffdb, 0x0010},
> 	{ MDIO_MMD_PCS, 0xfff3, 0x0020},
> 	{ MDIO_MMD_PCS, 0xfe40, 0x00a6},
> 	{ MDIO_MMD_PCS, 0xfe60, 0x0000},
> 	{ MDIO_MMD_PCS, 0xfe04, 0x0008},
> 	{ MDIO_MMD_PCS, 0xfe2a, 0x3c3d},
> 	{ MDIO_MMD_PCS, 0xfe4b, 0x9334},
> 	{ MDIO_MMD_PCS, 0xfc10, 0xf600},
> 	{ MDIO_MMD_PCS, 0xfc11, 0x073d},
> 	{ MDIO_MMD_PCS, 0xfc12, 0x000d},
> 	{ MDIO_MMD_PCS, 0xfc13, 0x0010},
> };
> 
> On my side, your values and the ones above are working.

Thanks for checking.

> 
> By the way, do you know why you only get between 800 and 850 Mbps? On my
> setup I see up to 930 Mbps in bidir mode. Just asking because maybe this
> is the reason why fixed speed doesn't work in your setup (would be weird
> though)?
> 
> [ ID][Role] Interval           Transfer     Bitrate         Retr
> [  5][TX-C]   0.00-10.01  sec  1.09 GBytes   935 Mbits/sec    0             sender
> [  5][TX-C]   0.00-10.01  sec  1.09 GBytes   932 Mbits/sec                  receiver
> [  7][RX-C]   0.00-10.01  sec  1.09 GBytes   933 Mbits/sec  154             sender
> [  7][RX-C]   0.00-10.01  sec  1.08 GBytes   931 Mbits/sec                  receiver

I suspect it's due to me hair pining mv88q2110 together on the same SoC.  
Unfortunately that is the only test setup I have for this device.

-- 
Kind Regards,
Niklas Söderlund

