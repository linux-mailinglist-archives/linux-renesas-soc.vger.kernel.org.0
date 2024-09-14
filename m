Return-Path: <linux-renesas-soc+bounces-8956-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 8DE7A97915A
	for <lists+linux-renesas-soc@lfdr.de>; Sat, 14 Sep 2024 16:21:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id B24F01C21561
	for <lists+linux-renesas-soc@lfdr.de>; Sat, 14 Sep 2024 14:21:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 164851CFEAA;
	Sat, 14 Sep 2024 14:21:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b="UnJwWjSV";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="BBTe/4W+"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from fout1-smtp.messagingengine.com (fout1-smtp.messagingengine.com [103.168.172.144])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D4D31DFFB;
	Sat, 14 Sep 2024 14:21:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.144
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726323705; cv=none; b=l7TQa24rGSyqoaW2rXDz4xapk8RbuiGelfiwi+9RPf1iiYjEYFGEh8D8W9APED97vRvX1Lkdx6o9jru941sy7RNHs3kb0CuUa5V7dgNtxfsuh8jn8SBvwYROGKCLZX0qhc/cHoc0lC+PFCGdZDn1GPi2jsA3sP70PPwrGTgwhww=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726323705; c=relaxed/simple;
	bh=pzev4qhJuPwwODtVilK+PEmgqfN9bH1AHRvn7MZ3wno=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=LH2m9qvA0Yul9CMrvLGfzlzbV0Pn0GDqqrfQVMAItK1t4bqv3+kRcKReEqYEfCaoaJtbXB6KECmT+OV8MBVodRqxb39+6x8ritYrMVna8pS69gTry4Ph2eNzJEGyGdJPbx8VIWVMAdsjUcDQ3VBmREtDbTV+0AMrXhA81HZcpQQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se; spf=pass smtp.mailfrom=ragnatech.se; dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b=UnJwWjSV; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=BBTe/4W+; arc=none smtp.client-ip=103.168.172.144
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ragnatech.se
Received: from phl-compute-08.internal (phl-compute-08.phl.internal [10.202.2.48])
	by mailfout.phl.internal (Postfix) with ESMTP id 2E6DE1380191;
	Sat, 14 Sep 2024 10:21:40 -0400 (EDT)
Received: from phl-mailfrontend-02 ([10.202.2.163])
  by phl-compute-08.internal (MEProxy); Sat, 14 Sep 2024 10:21:40 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ragnatech.se; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm3; t=1726323700;
	 x=1726410100; bh=aiM4yLwdJHJM9+0p8KpOfm+8Vge0T2Pl9F/bse1XL4I=; b=
	UnJwWjSVCBlVQQG/Q9zoOxs/gCNM53imD4ZAjekKI48syWcJqzcs1ECH3mj9fps6
	idi0+pNga0WL6WpgqYUH+zR81YfVpdeHrBsbBJy53a66X97o7DXIbjBPB+8gIEhx
	0cKWvG47tSCbcRSqJO6J+eT4Wxt2hIfZTVfyakT904LWceUyVAULS0MnUsicB8MT
	DZ3hfkYJyRi6TuZJwA3W/9A9xBVerlJ8eisswSwhym/NwkO4VempmEhteJrrBA3r
	X9W762R1Pym4GUEDUTFnBEftdgo+xOvRMl/AA/PXDnrgX9OJFgryPy4CJHPb0+5m
	0F0fYgI8xcWm33D3a82YkA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1726323700; x=
	1726410100; bh=aiM4yLwdJHJM9+0p8KpOfm+8Vge0T2Pl9F/bse1XL4I=; b=B
	BTe/4W+kPbAo/PGgKUtlor6qLhm2m6y4TJoblVPhJ/3idEmsVeo4inQNMQ5xNx+M
	gjqIin7DwNwNcVnHkftd+j2MZ5hmkj5pvF99yqXt5XocSYuEqAQrOpnkqm6OZgUY
	D0ki+JxFHVsf+RgWLRdCKYqbfTmxjQtWpvRxPLYCT6feI/3ln7sUaOHK5tm3IX1i
	gv1HWRaI7Z4VqsNLLkFVTBfuxPQSyaLgBZHzhj3aAf1k4OuKiuT/1pNqLRL1jtjF
	zs8E2ln7DgiWu2boy5wie3NIi8SdGJBMVeAj/g8jpiUnMm3HNGr3M/3DZNyceizx
	t+cYlxqyNId7nWAhhOw7Q==
X-ME-Sender: <xms:85vlZlwspCgg1mX63rMjabZ13iukAiiZGniyQY4hd6tZ_wZm92nrww>
    <xme:85vlZlSnh8Jar0OhqfIylaj-lPhtaEappidgqCnhZDKEJYkQ_OAWU_QchXgUAgIp6
    gQHXUZZAXYAiNiYad4>
X-ME-Received: <xmr:85vlZvUO6MS113YmU0X7lpOkhvV2WvTaJEe8oaWkPNZSLahSPMcdPxLeq9G1Hof1lZM-F6rmvM19tjbkK-OTCpWdFXUVIBDDYQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeftddrudektddgjeeiucetufdoteggodetrfdotf
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
X-ME-Proxy: <xmx:85vlZnjo_dgMlCa5SNg0ar5C1FwRHn0LsYP_jmFBn_xbecEOYUft8g>
    <xmx:85vlZnCP2x2QOdtMTBBW8SEGgy03bPShuqXjo52pcWbBR_foDy7dbg>
    <xmx:85vlZgJPgdXekyVKpFGxsSDg-9MKGULE34LKKaYuHC8G7oi7qdaUww>
    <xmx:85vlZmABgBkMWGj3lIn9g8XtMvrXRTaPEUQKYYa2Og8BUpFyezEsLA>
    <xmx:9JvlZr4Zr79M9cRjEfp-f24LxwPlICpvZUmtPlnkV0YJfTQZgtyBy-A9>
Feedback-ID: i80c9496c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sat,
 14 Sep 2024 10:21:38 -0400 (EDT)
Date: Sat, 14 Sep 2024 16:21:36 +0200
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
Message-ID: <20240914142136.GC64607@ragnatech.se>
References: <20240906133951.3433788-1-niklas.soderlund+renesas@ragnatech.se>
 <20240906133951.3433788-4-niklas.soderlund+renesas@ragnatech.se>
 <70b86181-7bcf-42d7-b5a8-d26ac0c4c573@lunn.ch>
 <ZuWW4UOtOGI_KmSg@eichest-laptop>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <ZuWW4UOtOGI_KmSg@eichest-laptop>

Hello,

On 2024-09-14 16:00:01 +0200, Stefan Eichenberger wrote:
> Hi Niklas and Andrew,
> 
> I was able to do a first basic test on my setup. I'm using the MV88Q2110
> and connecting it to a Göpel media converter that I use as a reference.

Thanks for testing this work.

> However, with your patch applied, I can't get a link. When I set a fixed
> link speed of 1GBit/s and the media converter is configured as the
> master, I can normally do: 
> ethtool -s end1 speed 1000 master-slave forced-slave
> After that, the link came up. However, with the changes made, I can't do
> this anymore. Can you reproduce this in your setup?

Without this patch I can't bring up a 1GBit/s link at all, I can only 
setup a 100 MBit/s link with,

    ethtool -s eth1 speed 100 master-slave forced-slave

If I do the same with speed set to a 1000 I never get a link. That's why 
autoneg is a such a boon for me, as with that I do get a 1 Gbit/s link.

As you have the MV88Q2110 datasheets, can you check the register writes 
in mv88q2110_init_seq0 and mv88q2110_init_seq1 for sanity? Maybe 
something is not quiet right there, I have only been able to reveres 
engineer support for autoneg so it's quiet likely.

> What is your setup
> like? Are you connecting two MV88Q2110 physically to each other?

Yes, I hair-pin two MV88Q2110 together.

> out
> of office again next week, afterwards I should be able to do some more
> testing again. I think being able to set fixed link speeds is a must for
> this PHY.

I'm also at LPC next week but I will do some more testing on this and 
see if I can reproduce your finding with a 100 speed link.

-- 
Kind Regards,
Niklas Söderlund

