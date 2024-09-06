Return-Path: <linux-renesas-soc+bounces-8837-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 697A296FD82
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  6 Sep 2024 23:39:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 864291C22E10
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  6 Sep 2024 21:39:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 849BB1591E2;
	Fri,  6 Sep 2024 21:39:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b="H2LTQ0RX";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="C06A0O+W"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from fout7-smtp.messagingengine.com (fout7-smtp.messagingengine.com [103.168.172.150])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7265614883B;
	Fri,  6 Sep 2024 21:39:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.150
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725658769; cv=none; b=Be4wLLkCJZKnKnk/O/Tj8Q+1LQTp+EYQ+n5RkyKdP0RLbxT2iHCKTmNism76VONMjVMiht2BElibm3g9Qgs0G0eeXol9D/t9jS25JGwBFjU0MfVnkGq4U+Px669bB/8mZRZw2ZjS2tb0HFQCATrzKB9S2r2tAspCIcYod0Vhhls=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725658769; c=relaxed/simple;
	bh=ZoDGXuvG8qY7cVrXLrBfjvQJAlYswM6bDQw56YSwleI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=SMfIGxILgNDy+DivoA4E0KEdeP29+ylgQwFeZYOTvetgdRkZVHZxX/aL5sY3XGkp1+r5V6wCHpFYyfyNdTeN1hcNTEtcc9pXS48/ZnJxLe9E7iSlbvYHsE4j5MDKXQ1+Hdzwu7ztPLtsYgdH1AXjyK2V/NfJUHWU6TjlysYtI60=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se; spf=pass smtp.mailfrom=ragnatech.se; dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b=H2LTQ0RX; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=C06A0O+W; arc=none smtp.client-ip=103.168.172.150
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ragnatech.se
Received: from phl-compute-04.internal (phl-compute-04.phl.internal [10.202.2.44])
	by mailfout.phl.internal (Postfix) with ESMTP id 84A8413800A6;
	Fri,  6 Sep 2024 17:39:25 -0400 (EDT)
Received: from phl-mailfrontend-02 ([10.202.2.163])
  by phl-compute-04.internal (MEProxy); Fri, 06 Sep 2024 17:39:25 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ragnatech.se; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm3; t=1725658765;
	 x=1725745165; bh=hCHMbV2LPAcSBPhOHAQ4gRf4S9b9JB//sLPC4ByVY4I=; b=
	H2LTQ0RX+NVM9NzLL5c9NZ5CBEurM3JzXEWrnPHyNoECW1HtcWSFLhyf5a6Ss/2i
	lfxITrzOkabTKKIVMAIS0wqR+S1TLWvF8UTQzUH5iuYCGOrZAvfQi8JpzeyXOZ5G
	rdLp0rohseZ96Kems/OKfQlNsz503dIYvKKYeYF3SQ7xSW11Kr4/Et7P08w+/Eas
	P9uU85CvgQt5+U7Tr9pIp8QcoTE7d9CF81lPDO1EOak94lThZxuQxJ0HnO7ZMS12
	mnNJGAUrFt6Nrz7StguNgR+B5gRNtk1DI8XUMY9px37+hILntONna9BBkcPm3eVs
	1HknJaNqyh4WwymIIUUiWg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1725658765; x=
	1725745165; bh=hCHMbV2LPAcSBPhOHAQ4gRf4S9b9JB//sLPC4ByVY4I=; b=C
	06A0O+WOu+6mv421ScOOuypDXaeGTdF7YCqcUPadTDRQ+Pg0GR29fhfjwgWWefu4
	N5nh6zMAWrjPOy1JK7D2w3X/gdjDdp+xE7izsxwqdlp3e0m/egFF1NvtRI9SMVug
	fV8GO5fRIGZEDBogdTNuDdr/6YXlhL0sMBP1Kw1j45SvfNz+Lkewc1KjIU/vC1hD
	9baLCE60vbOKtbe8yy1gyOn/NHPUz6znbnzaXejucDYx/psRhJe9K9l0xq8Gi3yr
	EvrGgV1nQtawUBcEcOLWLGsgOr5GDtLcom6gQyQXsY+xm7ABbnIN2SllidFrejMh
	Tj4tpaGoPF+CYkKB2dUMg==
X-ME-Sender: <xms:jXbbZu2GDI5u_F_UJ8nJogMos8xEU3DA4jji93ZKCWK0auvGS44BcA>
    <xme:jXbbZhF9AO22X8EWFQjgUAKPhAIuL8_87iwjyZAkkD5oV0hDwDWy-zb6G5AYm_MYk
    1HWUTwlBaTBB_g6_lo>
X-ME-Received: <xmr:jXbbZm7enloVeNiwxoIciQpdk_591S7QY5U_e9WFMjImvgoTVlFNy-TF7R_nPnmeQ-cutVmqhHHDwP5y7_df6wAP3VrjaYeD7g>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeftddrudeivdcutefuodetggdotefrodftvfcurf
    hrohhfihhlvgemucfhrghsthforghilhdpggftfghnshhusghstghrihgsvgdpuffrtefo
    kffrpgfnqfghnecuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsuc
    dlqddutddtmdenucfjughrpeffhffvvefukfhfgggtugfgjgesthekredttddtjeenucfh
    rhhomheppfhikhhlrghsucfunpguvghrlhhunhguuceonhhikhhlrghsrdhsohguvghrlh
    hunhguodhrvghnvghsrghssehrrghgnhgrthgvtghhrdhsvgeqnecuggftrfgrthhtvghr
    nhepfefhleelhfffjefgfedugfegjeelhfevheeikefhueelgfdtfeeuhefftddvleeine
    cuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepnhhikhhl
    rghsrdhsohguvghrlhhunhguodhrvghnvghsrghssehrrghgnhgrthgvtghhrdhsvgdpnh
    gspghrtghpthhtohepuddvpdhmohguvgepshhmthhpohhuthdprhgtphhtthhopegrnhgu
    rhgvfieslhhunhhnrdgthhdprhgtphhtthhopehhkhgrlhhlfigvihhtudesghhmrghilh
    drtghomhdprhgtphhtthhopehlihhnuhigsegrrhhmlhhinhhugidrohhrghdruhhkpdhr
    tghpthhtohepuggrvhgvmhesuggrvhgvmhhlohhfthdrnhgvthdprhgtphhtthhopegvug
    humhgriigvthesghhoohhglhgvrdgtohhmpdhrtghpthhtohepkhhusggrsehkvghrnhgv
    lhdrohhrghdprhgtphhtthhopehprggsvghnihesrhgvughhrghtrdgtohhmpdhrtghpth
    htohepvghitghhvghsthesghhmrghilhdrtghomhdprhgtphhtthhopeguihhmrgdrfhgv
    ughrrghusehgmhgrihhlrdgtohhm
X-ME-Proxy: <xmx:jXbbZv30xgejXQcijHL8eDqmR5mEacYKkNfX3uCT-AC2afEQLUCxBA>
    <xmx:jXbbZhFiUYunCPclfq9LOBB-DCPKLf88ttgFDE30Vzg7KTgGb8mPBA>
    <xmx:jXbbZo-jVBZ1203YeD8rHtOR_lEOU8Aof62PsEypWzWL4Vu8Y35-Nw>
    <xmx:jXbbZmmvbcnPiLXSPAgyeTDlzUpsEozVD7gJuE-T51Ov_dedUhCTqg>
    <xmx:jXbbZgdceIKDCyPKj5mZORQEb8EHipDFjo0ILr0vGfpTl9tNhHltvneB>
Feedback-ID: i80c9496c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 6 Sep 2024 17:39:24 -0400 (EDT)
Date: Fri, 6 Sep 2024 23:39:23 +0200
From: Niklas =?utf-8?Q?S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>
To: Andrew Lunn <andrew@lunn.ch>
Cc: Heiner Kallweit <hkallweit1@gmail.com>,
	Russell King <linux@armlinux.org.uk>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Stefan Eichenberger <eichest@gmail.com>,
	Dimitri Fedrau <dima.fedrau@gmail.com>,
	Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
	netdev@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Subject: Re: [net-next 3/3] net: phy: marvell-88q2xxx: Enable auto
 negotiation for mv88q2110
Message-ID: <20240906213923.GZ3708622@fsdn.se>
References: <20240906133951.3433788-1-niklas.soderlund+renesas@ragnatech.se>
 <20240906133951.3433788-4-niklas.soderlund+renesas@ragnatech.se>
 <c334205e-6289-48da-b0c7-7ba82c6d2709@lunn.ch>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <c334205e-6289-48da-b0c7-7ba82c6d2709@lunn.ch>

On 2024-09-06 22:36:49 +0200, Andrew Lunn wrote:
> On Fri, Sep 06, 2024 at 03:39:51PM +0200, Niklas Söderlund wrote:
> > The initial marvell-88q2xxx driver only supported the Marvell 88Q2110
> > PHY without auto negotiation support. The reason documented states that
> > the provided initialization sequence did not to work. Now a method to
> > enable auto negotiation have been found by comparing the initialization
> > of other supported devices and an out-of-tree PHY driver.
> > 
> > Perform the minimal needed initialization of the PHY to get auto
> > negotiation working and remove the limitation that disables the auto
> > negotiation feature for the mv88q2110 device.
> > 
> > With this change a 1000Mbps full duplex link is able to be negotiated
> > between two mv88q2110 and the link works perfectly. The other side also
> > reflects the manually configure settings of the master device.
> > 
> >     # ethtool eth0
> >     Settings for eth0:
> >             Supported ports: [  ]
> >             Supported link modes:   100baseT1/Full
> >                                     1000baseT1/Full
> >             Supported pause frame use: Symmetric Receive-only
> >             Supports auto-negotiation: Yes
> 
> My understanding is that most automotive applications using T1 don't
> actually want auto-neg, because it is slow. Given the static use case,
> everything can be statically configured.
> 
> Is there a danger this change is going to cause regressions? There are
> users who are happy for it to use 100BaseT1 without negotiation, and
> the link partner is not offering any sort of negotiation. But with
> this change, autoneg is now the default, and the link fails to come
> up?

I'm not sure how the generic use-case looks like. All I can say all 
other devices supported by this driver support autoneg by default and 
the initial commit adds some of the autoneg features but disables it 
with a comment that they could not get it to work.

> 
> To me, this actually seems like a generic problem for automotive. We
> want to indicate the device does support autoneg, but we don't want it
> on by default? I don't know if we can express that at the moment?
> 
> 	Andrew

-- 
Kind Regards,
Niklas Söderlund

