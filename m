Return-Path: <linux-renesas-soc+bounces-5192-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 343C68BD48D
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  6 May 2024 20:26:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id DDF352836EB
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  6 May 2024 18:26:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6064A15885E;
	Mon,  6 May 2024 18:26:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b="Obxlezvr";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="fB4KUkOS"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from fhigh3-smtp.messagingengine.com (fhigh3-smtp.messagingengine.com [103.168.172.154])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4411D197;
	Mon,  6 May 2024 18:26:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.154
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715019984; cv=none; b=TSnk0N/dnzLRMeBvrONjHhfDU72S87BFoTTVLSym0ZXx5xJUqwB5InEB26dUwbfOgpAKGP38J35KNSX1fdMoVrMsx5cAiTOYAH/W+AEhENT1qyHqwyPd05Nh59SGQiROQ/8DjCQx09AG+KW4N/ckuIz+AhkBgvsFfzeOCR+2IjA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715019984; c=relaxed/simple;
	bh=dSPDMIjfs7PBwH5l4Q/MU6erUW5h3xDdfO3CAYPjHlU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=TnWOzKnUpDmSFWilPWkh/5ovXFxHE/1NpTHyXwzYCfIgPLYEObw0cnalpcVvdn1Gj//BUVpniUnmOMnYAJLTAshrXsGVr4cQkgEijPHIYZxcLZW6enjEUaTCjpYh9pP4jb46jX2n97c1SIUl0mcoMi3W9C3AqPQLTPBHq4cfDFA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se; spf=pass smtp.mailfrom=ragnatech.se; dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b=Obxlezvr; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=fB4KUkOS; arc=none smtp.client-ip=103.168.172.154
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ragnatech.se
Received: from compute6.internal (compute6.nyi.internal [10.202.2.47])
	by mailfhigh.nyi.internal (Postfix) with ESMTP id EB4A511400C5;
	Mon,  6 May 2024 14:26:18 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
  by compute6.internal (MEProxy); Mon, 06 May 2024 14:26:18 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ragnatech.se; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm2; t=1715019978;
	 x=1715106378; bh=M4DkAxg/p3Y2n3nwhTSAwhB6/SdFRTAGY+BIy2lGU6o=; b=
	ObxlezvrCGDJtqn/1Rd7Y/CeZm6pV6ClfX85hnp5U86URoXSpfsOiCt+N98CdOjU
	J8mWfhvOK7F5YGHmPPTjXsSXK/8r/XQshzGuswKVH2PtXYt2p2EPRKyDmrOatDnx
	Z/ChFlAun2+q4G/mA68x8ob1UYBeDYVIAQPqwaV5yXqwQVU2twZ8Ki9YUNOs5JtK
	BV9477xfmjuuUcMCgATlEDaFbYIslkSpTK+DluDg3xMOAARWmwJfEAOaNDMJhKi0
	43jXuAWHNAUal6oRTO/b8DUwOMn79VgY+vLYpAvHuY/04clDHsDtDXePT5E9cHxJ
	08xEupp+BYP+TUSrYiBpdw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1715019978; x=
	1715106378; bh=M4DkAxg/p3Y2n3nwhTSAwhB6/SdFRTAGY+BIy2lGU6o=; b=f
	B4KUkOSOjg191wjDkwyP9dZy8/u/Vrov3dCbEiGzM5o0u039F27fig0SAuqY5Kpi
	F+1UcDKSSGB3SZiJCYAmwa0d0JVM0B8TEG/NS6Xg7vqhCYzBGxMad0vxywExQfs8
	j68/5CBMT6yYJMNYMEALfwTV3hKuklG6Jq8pG8evBOwkUtxUhkevk7mxyPFbynRW
	wxyiae19Kf1rZbec2c5d9BXd0GJ8Kk8lxFIQvu36RCJQnDOnDuyQEueIgOQJEBge
	we+mIr+y+6vMH9TgRgxyQMV/ifDulSEFzagNeKmSE/3nAGkRJMj6kJ/hgeEFcRPy
	mvEsld4gKqPKo/7rRBVUQ==
X-ME-Sender: <xms:yiA5ZtWfyezdBKjlMCTdqJ9ruBsZJd3F896VFZid0-fBONVHkvd67A>
    <xme:yiA5ZtmHxE3Q17QYbW_fKHG8s3axdh4Duoyv7gHxFEJl-p7cuUpjO98xG_olqggSs
    vjlUjnv1bacxi4Mpi0>
X-ME-Received: <xmr:yiA5ZpYlJxDx-_kR449cud3X0qE8lKonddJ41dOiaQ7kus6IfQO_YhXXFkUCmQLv7soIzwihLHXP523zD8ybZarKVxZc9Do>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvledrvddviedguddviecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
    necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
    enucfjughrpeffhffvvefukfhfgggtugfgjgesthekredttddtjeenucfhrhhomheppfhi
    khhlrghsucfunpguvghrlhhunhguuceonhhikhhlrghsrdhsohguvghrlhhunhguodhrvg
    hnvghsrghssehrrghgnhgrthgvtghhrdhsvgeqnecuggftrfgrthhtvghrnhepffekgfdu
    keeghffhjeetvdeitdegteeikeffieduhfegveetjeevtdffvdekffdtnecuffhomhgrih
    hnpehkvghrnhgvlhdrohhrghenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhep
    mhgrihhlfhhrohhmpehnihhklhgrshdrshhouggvrhhluhhnugdorhgvnhgvshgrshesrh
    grghhnrghtvggthhdrshgv
X-ME-Proxy: <xmx:yiA5ZgUxmwsyr_cX5AcOpiDjlsKrByTRW_xL_Mq1iZdLqRdKOM_WUg>
    <xmx:yiA5Znkh_iHDfqaXhzN4P1x0XmLJpsrgHxpobAnTeajo4NuLjwt8nQ>
    <xmx:yiA5ZteSuRX1BYtVF1YSwiq12Bm4fYJg8KcoH6hWx6dASGzY_szapQ>
    <xmx:yiA5ZhFBwjwt1_1BTD2UzVCGWVFx4ns3eFc7N7fmBtvmIZkJL7Y3IA>
    <xmx:yiA5ZgidIlxSmteqe-2AKKTNurSdoebYtXQ4C0DB1NlkD8NmJHhZbMhJ>
Feedback-ID: i80c9496c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 6 May 2024 14:26:17 -0400 (EDT)
Date: Mon, 6 May 2024 20:26:15 +0200
From: Niklas =?utf-8?Q?S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Andrew Lunn <andrew@lunn.ch>,
	Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	netdev@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Subject: Re: [net-next] net: ethernet: rtsn: Add support for Renesas
 Ethernet-TSN
Message-ID: <20240506182615.GG720810@ragnatech.se>
References: <20240414135937.1139611-1-niklas.soderlund+renesas@ragnatech.se>
 <5fd25c58-b421-4ec0-8b4f-24f86f054a44@lunn.ch>
 <20240503102006.GI3927860@ragnatech.se>
 <e3ce12b0-fb5d-49d7-a529-9ea7392b80ca@lunn.ch>
 <20240503133033.GJ3927860@ragnatech.se>
 <d5f6f31a-6ecc-48a9-a2ca-9d22fc6acb21@lunn.ch>
 <20240506140533.GD720810@ragnatech.se>
 <CAMuHMdXm1by7P3LV22v5fQyVo1dNOzjaB=1dcqwP7qM+MqOhtA@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAMuHMdXm1by7P3LV22v5fQyVo1dNOzjaB=1dcqwP7qM+MqOhtA@mail.gmail.com>

Hi Geert,

On 2024-05-06 19:43:55 +0200, Geert Uytterhoeven wrote:
> Hi Niklas,
> 
> On Mon, May 6, 2024 at 4:05 PM Niklas Söderlund
> <niklas.soderlund+renesas@ragnatech.se> wrote:
> > On 2024-05-06 03:51:45 +0200, Andrew Lunn wrote:
> > > What PHY is this? Does it have C22 registers? Can it be identified via
> > > C22 registers 2 and 3?
> >
> > The PHY in question is mv88q2110 (drivers/net/phy/marvell-88q2xxx.c),
> > unfortunately I do not have a datasheet for it so I can't tell you much
> > about it.
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
> >
> > - Remove C45 compatible; Keep C45 read/write in driver
> >
> >   The correct PHY driver is used and everything works.
> 
> Does it still work after kexec, or after device unbind/rebind?
> According to [1], the PHY node has a reset-gpios property, so you may
> need to specify the exact PHY model to identify the PHY model at any
> time, regardless of the state of the PHY reset line.

With the "ethernet-phy-ieee802.3-c45" compat in place (and C45 
read/write in the driver) I can bind/unbind the device without issue and 
then operate it as expected. My preferred way forward is to keep the 
compatible for C45 in place so I have not tested without it. However I 
see no reason why it should not work with "Remove C45 compatible; Keep 
C45 read/write in driver" mode.

Note that this driver differs a bit from RAVB for which [2] targets. The 
RAVB driver creates the MDIO bus at probe time, this drivers creates and 
destroys the MDIO bus in sync with the interface state using ndo_open 
and ndo_stop. So the reset is issued correctly no matter what happened 
before and the PHY can be probed.

> 
> Perhaps that issue does not happen when using the mdio subnode, cfr. [3]?
> 
> [1] https://lore.kernel.org/all/20240122160441.759620-3-niklas.soderlund+renesas@ragnatech.se/
> [2] 722d55f3a9bd810f ("arm64: dts: renesas: Add compatible properties
> to KSZ9031Ethernet PHYs")
> [3] 8da891720cd407ed ("dt-bindings: net: renesas,ethertsn: Create
> child-node for MDIO bus") in net-next (next-20240405 and later).
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

-- 
Kind Regards,
Niklas Söderlund

