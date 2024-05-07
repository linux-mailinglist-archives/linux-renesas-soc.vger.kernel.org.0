Return-Path: <linux-renesas-soc+bounces-5207-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 8ED2E8BE0D3
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  7 May 2024 13:18:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 2E39A1F23B8F
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  7 May 2024 11:18:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1BFC31514FA;
	Tue,  7 May 2024 11:18:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b="jzQ6kjAo";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="ebJCPK1/"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from wfout3-smtp.messagingengine.com (wfout3-smtp.messagingengine.com [64.147.123.146])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E63C51509A6;
	Tue,  7 May 2024 11:18:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=64.147.123.146
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715080727; cv=none; b=ZulKvl+2+fuly69WK6QzekLNvHoVBH3SYNcpS1GQAT5HQ529XQsr73Yi1+Ola5j+U9X/2hfx/gQryCxvGk71wOWEHDpTkc8ibAewYz40mc3FEvzzA6rfUOwGUOx1kdxnWhZlL/4bAFMOU14nAJSLQ8JwSm4eSsrJMrCeYvBHve8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715080727; c=relaxed/simple;
	bh=AEbdWPgLg3DPTwuk6Vflg4pB2hxhNRLYs0VAcXoP50k=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Ulrg1gN5zhQA00RFKbfTvmPRcxq0dWkC2v4iKw+pia66WoNdQt12D8OPoCFD/nNyRkrp+8iIAPOGmh6LYJFnfg/s10+9fZi7vK2/j4g7BoG6nsxdwu4LAct4KGFwnrUA/WwIfYSbSK2Tz31PKe2GjEFSRh/mBxVteuwq1P40aX0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se; spf=pass smtp.mailfrom=ragnatech.se; dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b=jzQ6kjAo; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=ebJCPK1/; arc=none smtp.client-ip=64.147.123.146
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ragnatech.se
Received: from compute2.internal (compute2.nyi.internal [10.202.2.46])
	by mailfout.west.internal (Postfix) with ESMTP id 8F1AF1C000B3;
	Tue,  7 May 2024 07:18:42 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute2.internal (MEProxy); Tue, 07 May 2024 07:18:43 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ragnatech.se; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm2; t=1715080722;
	 x=1715167122; bh=R3WqUd6gJVVpHIE8g+RGAoOI1RQgwYYr2gcVWiX8Ib4=; b=
	jzQ6kjAo1B0zmvuSbu3qSbOcFHc/M0udSLqhTJxqA/8HYQlRkN3ut+ns//pLS6PM
	4scYZdUiHPW6obWD5fOiCqwJbxlO5toBkasiaM3Aa3Wy4NWQ0DWm1IZFOn3kTBKc
	X8KyWTNJ2sRqFXXP4L1sHIY3IdqRpJaDO50aO+FCpLQVPU/Z6Z9p49UKsq7NJaHW
	NH7SSkwiKZTAUFPn0AJGQCtonFdPCEq3BbhuYKoUP2GbaGCdq2QYcBtwGTP+telF
	KzRWnBRnXsUfOdqaWkn7Kl1syVlT+6jPUuEP64tg+odFxg4700slpWi6Wto9jyFr
	J/a3PActXX6KcEq/v/GK0A==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1715080722; x=
	1715167122; bh=R3WqUd6gJVVpHIE8g+RGAoOI1RQgwYYr2gcVWiX8Ib4=; b=e
	bJCPK1/aATdpbWsZnXw30b+InBn2RHZeExVbJsLq4ggBdCb+gP2Q0aRAutvHRsHq
	ka47/pUWl9XDz4H08pKVoUnZgMaGNRyZuA3bygy7FQA/RoFH9R2In/oLHRtxfRmi
	LuNaFb4ZnvbngI0voY39BDVJuGB+EzR1ghcZjrIyHYTfOasbioGBVnX+AYTFAlF2
	Md/MCWSapaEv5HcWrkZ0jf7mqk/L3EuIvcg1V8r9osNdm8l1gys6IhMO4jTY2vr6
	XXH/7coUrgvwwnFXTe1chVgJUzn72705Tlki5hrTnsBE+ZWVelAO0Ms+hOCfD1i8
	LPYSVq6nF6Q2fyJiwblpw==
X-ME-Sender: <xms:EQ46ZjSRGdXAHTtFOuWNFqXpBJJTIOqDbV7cGuRdiua98ZHt4JMxPw>
    <xme:EQ46ZkynPfA7qQWezX5dP4Ro5_wu9YMUaG4NX8KtvsUibta5Wcm-PQ1mVfCHi4kyD
    3DdCNzSONkC7Q9r_nE>
X-ME-Received: <xmr:EQ46Zo3b_sclRfN3FGK3liBYppMnd9hhk4gw6Tw3EZ3fgveZO2Em9ze6h0C5_Mby4sXLIWwtPJUyCNV5h8RSB7XQuBf2lIo>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvledrvddvkedgfeeiucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepfffhvfevuffkfhggtggugfgjsehtkeertddttdejnecuhfhrohhmpefpihhk
    lhgrshcuufpnuggvrhhluhhnugcuoehnihhklhgrshdrshhouggvrhhluhhnugdorhgvnh
    gvshgrshesrhgrghhnrghtvggthhdrshgvqeenucggtffrrghtthgvrhhnpeefhfellefh
    ffejgfefudfggeejlefhveehieekhfeulefgtdefueehffdtvdelieenucevlhhushhtvg
    hrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehnihhklhgrshdrshhouggv
    rhhluhhnugdorhgvnhgvshgrshesrhgrghhnrghtvggthhdrshgv
X-ME-Proxy: <xmx:EQ46ZjCVoxFxg_bUbIqwna8VJGJhcgvyFUpqgSzVXF4R-51eAN-aIA>
    <xmx:EQ46ZshpM99fGaQ6uN6IGbEqL4PX1kvso1d0VV_rxedMjVovhU8A6w>
    <xmx:EQ46ZnpWNK9P_iF46DL7_eNuyShnG7cZ2S0XkaH_fqtI_u6B2mwXGw>
    <xmx:EQ46Znj_D5ZGmshECxmjq3U5QO5F25bD8On9P9nX7R6PXlIb0rJfBA>
    <xmx:Eg46ZvNhiHjbfrn4slsl_zfhjVYw9QeQqP1j_pTqpEES4T1iE66sq7S6>
Feedback-ID: i80c9496c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 7 May 2024 07:18:41 -0400 (EDT)
Date: Tue, 7 May 2024 13:18:40 +0200
From: Niklas =?utf-8?Q?S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>
To: Andrew Lunn <andrew@lunn.ch>
Cc: Geert Uytterhoeven <geert@linux-m68k.org>,
	Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	netdev@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Subject: Re: [net-next] net: ethernet: rtsn: Add support for Renesas
 Ethernet-TSN
Message-ID: <20240507111840.GK720810@ragnatech.se>
References: <20240414135937.1139611-1-niklas.soderlund+renesas@ragnatech.se>
 <5fd25c58-b421-4ec0-8b4f-24f86f054a44@lunn.ch>
 <20240503102006.GI3927860@ragnatech.se>
 <e3ce12b0-fb5d-49d7-a529-9ea7392b80ca@lunn.ch>
 <20240503133033.GJ3927860@ragnatech.se>
 <d5f6f31a-6ecc-48a9-a2ca-9d22fc6acb21@lunn.ch>
 <20240506140533.GD720810@ragnatech.se>
 <CAMuHMdXm1by7P3LV22v5fQyVo1dNOzjaB=1dcqwP7qM+MqOhtA@mail.gmail.com>
 <20240506182615.GG720810@ragnatech.se>
 <2fc4d494-4ec0-48a8-988c-68f31c4f691e@lunn.ch>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <2fc4d494-4ec0-48a8-988c-68f31c4f691e@lunn.ch>

HI Andrew and Geert,

On 2024-05-06 22:00:46 +0200, Andrew Lunn wrote:
> > Note that this driver differs a bit from RAVB for which [2] targets. The 
> > RAVB driver creates the MDIO bus at probe time, this drivers creates and 
> > destroys the MDIO bus in sync with the interface state using ndo_open 
> > and ndo_stop.
> 
> That is not a good idea. It is better to create the MDIO bus at probe
> time. There are a few reasons for this.
> 
> 1) It takes while for the machinary to load the PHY driver, when it is
> a module. If it does not get time to do that, you end up with the
> generic PHY driver, even though there is a specific PHY driver, which
> becomes usable a little later in time. But your network is dead
> because the generic PHY drive is not sufficient.
> 
> 2) It is possible that creating the MDIO bus fails with
> EPROBE_DEFER. If this happens at ndo_open(), there is nothing you can
> do about it, other than return the error to user space. If it happens
> during probe, the driver core will handle it, and try to probe the
> driver again sometime later.

Thanks to both of you for your feedback in this review. I now have a way 
forward for this work.

I will drop the C45 read/write functions in the RTSN driver and rework 
the it to register the MDIO bus at probe time. As Geert then suggest I 
will need to state a PHY specific compatible which will solve my initial 
issue.

After this is done I will look to see if the PHY driver can be extended 
with more identification numbers so it can be probed on C22. But this 
will be done separate from my effort to enable the RTSN device.

Thanks again for all your help.

-- 
Kind Regards,
Niklas Söderlund

