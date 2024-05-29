Return-Path: <linux-renesas-soc+bounces-5659-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 010D48D3B08
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 29 May 2024 17:31:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 6767BB28284
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 29 May 2024 15:31:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 262EC181B94;
	Wed, 29 May 2024 15:30:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b="iUKCycrW";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="KzR5CO+d"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from wfhigh8-smtp.messagingengine.com (wfhigh8-smtp.messagingengine.com [64.147.123.159])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D39B7746E;
	Wed, 29 May 2024 15:30:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=64.147.123.159
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716996635; cv=none; b=m1kNREChyIOnElHLpkSiLxJ3bRew3kuu/XmTCBX6LIMqYGsqJSbDpVescac6xgfGfWm/zsDJ2vB8Ht5Ws9LDUm+s6CChcRp4W/BJZpFlz1kxyqKdBstWPKc7Q7EgGLjs2+WiNmwDJ6SlXcA07CamUrRSFY/Fk9zWqbhKRKE+C34=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716996635; c=relaxed/simple;
	bh=OWSppGuAusg+qsW9pWmhgszyEtNV1CCMpVyougj6kow=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=LvuhDynp1c5apHdvA8WFahjy6puA8MD2qsqs5de5Y4JMm+yIFo1n9F67IQTDCi+FAWdAf108GD9Qcwqo041MsZjvxwnyVis5i1UvbuONuv9XFiXSpsZi0kKmRHR2Vz6QG7SbZdedeRko/MhYe+awHFp2Lsod8OXWfruDPXVKCn4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se; spf=pass smtp.mailfrom=ragnatech.se; dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b=iUKCycrW; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=KzR5CO+d; arc=none smtp.client-ip=64.147.123.159
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ragnatech.se
Received: from compute6.internal (compute6.nyi.internal [10.202.2.47])
	by mailfhigh.west.internal (Postfix) with ESMTP id 97F191800121;
	Wed, 29 May 2024 11:30:29 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
  by compute6.internal (MEProxy); Wed, 29 May 2024 11:30:29 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ragnatech.se; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm3; t=1716996629;
	 x=1717083029; bh=cKWf22xNcnIQoTAYqjXKNMRneArl+zX8TNfSWR4bqiQ=; b=
	iUKCycrWYJBMX3kC/048eEL/Z1ZgnO9w1Mtxzk94ZWbdhvAsoXATygxpSzQxPQD5
	2rmWhUw338WrO2zIVOIbe4EpD8Hrf+4a1qKwNp3VQpDAtZINvVqDdjabGFQnznJr
	KVKLvrxJo3eHKeQbsJQ4S9RqvSJcK6M/0TGns4iwcC9UbFu7qUKKMA96db5nt2vc
	ajD3qilw2JoQEhizg+LFwf7+VtmiekmmnKcTeU8aaEDqz/xOg9MJ7xqpS8vcRput
	yZBkSIM4nKflobowpeV6kEy8nQAm3bslLp06IB3MaqSTf+3kADrB9ZY4h0D8Sitf
	I4qx9mMSuv0hI8wrMgI1lA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1716996629; x=
	1717083029; bh=cKWf22xNcnIQoTAYqjXKNMRneArl+zX8TNfSWR4bqiQ=; b=K
	zR5CO+di8/7Tgaa06XHeIX8FN4sSJuWIJf0B8D9HwNTQgNld6VbBmXOvAOUC5/Op
	hV9FVLouVlAlcZnldguJZKVebbz9hoeg7MGi52ISs5hTit1vgHAJvJpG/3ah89Ga
	eRKdMWIt9Gca2BkLe7HsisZgzzybzIyjkyb2dlWvq1Y67lrEHby4DoB44Mz3O+th
	hgIDLMurmpbHlmVjxUEDCUoeEa8AQ2ozJxs1e9kJu0NM1PuoDE3MaeFO8NPqiFTK
	JN5piNgPWLLL7B7lCS+jwho5s2onSv4d+lUgR7vEV2SZwEzVK6FtFu17zuPAE7JT
	C2/9J7QsrMDyYv5H7sI+w==
X-ME-Sender: <xms:FUpXZsR7-yDEtiWm0Mu_RuFTC7QT4qgBS0fo351AHvJIiXN61p2vcA>
    <xme:FUpXZpzm61TQFWJeSbpyt1_RsQ8hBunVRFJAWphrxtO22CN1XCfSX4VOhxz911RC4
    EUh4uZQQ7SsJ_O9NVQ>
X-ME-Received: <xmr:FUpXZp2w0fASf8r9u85Zq5NGKD-XFmCnIkK10VyRDFAKc9Vqace9kRn7SMYAI6bXVVSOn6N7-S6ZEN0GRYrkDYmb75Vt40I>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvledrvdekuddgkeekucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepfffhvfevuffkfhggtggugfgjsehtkeertddttdejnecuhfhrohhmpefpihhk
    lhgrshcuufpnuggvrhhluhhnugcuoehnihhklhgrshdrshhouggvrhhluhhnugdorhgvnh
    gvshgrshesrhgrghhnrghtvggthhdrshgvqeenucggtffrrghtthgvrhhnpeefhfellefh
    ffejgfefudfggeejlefhveehieekhfeulefgtdefueehffdtvdelieenucevlhhushhtvg
    hrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehnihhklhgrshdrshhouggv
    rhhluhhnugdorhgvnhgvshgrshesrhgrghhnrghtvggthhdrshgv
X-ME-Proxy: <xmx:FUpXZgCtlCn2uBSsU1k3jAAMBWYG4evVaJYtbgQl539PPNd-3nFAEQ>
    <xmx:FUpXZlht__95BZFbbId5AQPR_kjBo7Iz3f2WRl0Butc38MlxIC-wnA>
    <xmx:FUpXZso6BRr8PG7nEeRLofHpC0J6lLwGHDSZzzuy-0SqkJ01XDsAFg>
    <xmx:FUpXZogV4Zdl5hLJ0xFNpzW7XfkKBCI4086o2KkMq1roiEZqWDJ3PA>
    <xmx:FUpXZqtvCnWBmzUZ--742bsFpWToNhbo1sNsxYxs7bndUuIihow2qs_F>
Feedback-ID: i80c9496c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 29 May 2024 11:30:28 -0400 (EDT)
Date: Wed, 29 May 2024 17:30:25 +0200
From: Niklas =?utf-8?Q?S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: linux-renesas-soc@vger.kernel.org, linux-clk@vger.kernel.org
Subject: Re: [PATCH 3/3] clk: renesas: r8a779h0: Add CSI-2 clocks
Message-ID: <20240529153025.GA710180@ragnatech.se>
References: <20240527131541.1676525-1-niklas.soderlund+renesas@ragnatech.se>
 <20240527131541.1676525-4-niklas.soderlund+renesas@ragnatech.se>
 <CAMuHMdVaXhLruaPWBGbpzQds0y03t9UJ-NxEtvtKma-5-WwooQ@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAMuHMdVaXhLruaPWBGbpzQds0y03t9UJ-NxEtvtKma-5-WwooQ@mail.gmail.com>

Hi Geert,

Thanks for your review.

On 2024-05-29 17:09:09 +0200, Geert Uytterhoeven wrote:
> Hi Niklas,
> 
> On Mon, May 27, 2024 at 3:16 PM Niklas Söderlund
> <niklas.soderlund+renesas@ragnatech.se> wrote:
> > Add the CSI40 and CSI41 module clocks, which are used by the CSI-2
> > interfaces on the Renesas R-Car V4M (R8A779H0) SoC.
> >
> > Signed-off-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
> 
> Thanks for your patch!
> 
> > --- a/drivers/clk/renesas/r8a779h0-cpg-mssr.c
> > +++ b/drivers/clk/renesas/r8a779h0-cpg-mssr.c
> > @@ -176,6 +176,8 @@ static const struct mssr_mod_clk r8a779h0_mod_clks[] = {
> >         DEF_MOD("avb0:rgmii0",  211,    R8A779H0_CLK_S0D8_HSC),
> >         DEF_MOD("avb1:rgmii1",  212,    R8A779H0_CLK_S0D8_HSC),
> >         DEF_MOD("avb2:rgmii2",  213,    R8A779H0_CLK_S0D8_HSC),
> > +       DEF_MOD("csi40",        331,    R8A779H0_CLK_CSI),
> > +       DEF_MOD("csi41",        400,    R8A779H0_CLK_CSI),
> 
> According to the documentation for the Module Stop Control Registers
> 3 and 4, these are called "csitop[01]".

I noticed that too, the issue is how they are named on V4H and I thought 
aligning the Gen4 board was a good idea. I don't feel strongly about 
this, but before I send a v2.

On V4H the bits are named SRT31 and SRT0, while the "Target Module for 
Software Reset" lists them as "CSI40 (CSI-2-RX0)" and "CSI40 
(CSI-2-RX1)". The later is the same for V4H and V4M, while the bit name 
differs.

Should we rename the V4H modules as well, keep the names for V4M, or do 
we not really care the same modules have different names on V4H and V4M?

> 
> >         DEF_MOD("hscif0",       514,    R8A779H0_CLK_SASYNCPERD1),
> >         DEF_MOD("hscif1",       515,    R8A779H0_CLK_SASYNCPERD1),
> >         DEF_MOD("hscif2",       516,    R8A779H0_CLK_SASYNCPERD1),
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

