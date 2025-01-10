Return-Path: <linux-renesas-soc+bounces-12037-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id DF229A08EB6
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 10 Jan 2025 11:58:47 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 94A84188B61F
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 10 Jan 2025 10:58:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0C30920B216;
	Fri, 10 Jan 2025 10:58:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b="g8aJHxBG";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="Ogk5Wcav"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from fhigh-a4-smtp.messagingengine.com (fhigh-a4-smtp.messagingengine.com [103.168.172.155])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C06820B1FB;
	Fri, 10 Jan 2025 10:58:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.155
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736506718; cv=none; b=ZsfAnPPlMBniwtOsY78m7snQzVJ6dhA7l5th4yOA8kdSeGxjvkLV+sy+SRsfkvhnoJ1Brh82UwuNcdUvb0HtdIvJgAs7IjFMyDnVlDrhVRelFF6fAqMVvrypNHhdXIRobHyGiv4LHrdkkhnpcZc0yqag2XTWen81EFW4W6Fbsm4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736506718; c=relaxed/simple;
	bh=bsb7nGnIMHG782pJr7xs4qULS0u8F1JK2QkTYU8aCDc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=t32lh2RULde2RmniO1v4JW/usWxKDS7NlvRStjTC/y2tIkaqBpP29hTRqxpJSOkaapxPjOHKScIQy+8yPJqrZARTPq3plyRgKr5U6YKQWAwAjlTZGh5rQlot2mO+MB7I76dncMyQnCAliGNLdJDKKrCEFTlrNWkxxb+6/HdDdIU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se; spf=pass smtp.mailfrom=ragnatech.se; dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b=g8aJHxBG; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=Ogk5Wcav; arc=none smtp.client-ip=103.168.172.155
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ragnatech.se
Received: from phl-compute-01.internal (phl-compute-01.phl.internal [10.202.2.41])
	by mailfhigh.phl.internal (Postfix) with ESMTP id 2C25A1140196;
	Fri, 10 Jan 2025 05:58:35 -0500 (EST)
Received: from phl-mailfrontend-01 ([10.202.2.162])
  by phl-compute-01.internal (MEProxy); Fri, 10 Jan 2025 05:58:35 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ragnatech.se; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm1; t=1736506715;
	 x=1736593115; bh=t0SWmKsw6nOR/LlUb0Oe1pm8yGxwNK1s6lacmIwvK4Q=; b=
	g8aJHxBGf/JRKchTSDkuJm2fYPzCZs93jvqkz0pDWvcpAX+dvEhST3lgWXlX85AE
	vuxUz28leYrfL3yZSH4h1NCaqbPPwuelPtbFDk56rtapCc7kY1IovAWEOOx0c1oA
	bQP/gHsyDfA80WCKFZg5UMgfPIZPJDUk8/apWx91uEAIeE2LI8KNEA2z6qevLuGB
	nekeUShrLVigZ/5cy4wWgGVCWH5uZJKB6P9W3pdnisT5QCWlgVD/cbWoVdr9tXr8
	hE5zbTPwUvjeIFrhDriEvZS7L/J7cxm8g+epuT+7IyF8T3jBO/2hGOrmlw2LvkXr
	CyHvJpVgO7yg5PpU8ZEmBg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1736506715; x=
	1736593115; bh=t0SWmKsw6nOR/LlUb0Oe1pm8yGxwNK1s6lacmIwvK4Q=; b=O
	gk5WcavAVQWLwiA4fso+RSz7RlPVZJF/vDStAHF+ZYK6J3E0om3+bTmKZEmuHhzU
	fc0EfNVG/rPZaDMoc8IxNyUwV6kbZ8nuFjM5RNqZWbucesFGODt1dttTAWY96N1y
	Jts9Gw967fIKn8t+YpdjZCoYGUDUz1B78TFEc40azDZPx2g4+KzE5DIcmgbaNuVu
	Ujz39xhpzbn1st1fB7A0YwbKzZ9r8YkQulLzRLIAEm/tv3BB4nir9bQ5HWGf5Ll0
	ir8AmG+/KvPotaWKKiu5E6yVA56NIhAjCTXwF4w6Fwns8jgW5ZNwuMH0sxhxQqoK
	jVo5Xgu0u5zuZdE54IoJw==
X-ME-Sender: <xms:Wv2AZ8JLaI7Qw_f18D4SxeKIBA2RlEvOoC5mvVtSoh3qAaqXhXxs4g>
    <xme:Wv2AZ8KpRrFZGAYm20AAiNGDu8gBpu6044hlXg-efdVvx0lXk3lBPeCQuTwRVOl3i
    OmaoV9vEt_K-dv_E7s>
X-ME-Received: <xmr:Wv2AZ8vr0qkRIIJEl_RgEUuoF3sPQ7h4-SYrehokZ_0P4bsB8D-mhA9Y-bxG9slKNL-wZmO2gvbEqEiDHbHfIOszKCK7ZSW-yA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefuddrudegkedgvddvucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdggtfgfnhhsuhgsshgtrhhisggvpdfu
    rfetoffkrfgpnffqhgenuceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnh
    htshculddquddttddmnecujfgurhepfffhvfevuffkfhggtggugfgjsehtkeertddttdej
    necuhfhrohhmpefpihhklhgrshcuufpnuggvrhhluhhnugcuoehnihhklhgrshdrshhoug
    gvrhhluhhnugdorhgvnhgvshgrshesrhgrghhnrghtvggthhdrshgvqeenucggtffrrght
    thgvrhhnpeefhfellefhffejgfefudfggeejlefhveehieekhfeulefgtdefueehffdtvd
    elieenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehn
    ihhklhgrshdrshhouggvrhhluhhnugdorhgvnhgvshgrshesrhgrghhnrghtvggthhdrsh
    gvpdhnsggprhgtphhtthhopeegpdhmohguvgepshhmthhpohhuthdprhgtphhtthhopehg
    vggvrhhtsehlihhnuhigqdhmieekkhdrohhrghdprhgtphhtthhopehjrggtohhpohdrmh
    honhguihdorhgvnhgvshgrshesihguvggrshhonhgsohgrrhgurdgtohhmpdhrtghpthht
    oheplhhinhhugidqrhgvnhgvshgrshdqshhotgesvhhgvghrrdhkvghrnhgvlhdrohhrgh
    dprhgtphhtthhopeguvghvihgtvghtrhgvvgesvhhgvghrrdhkvghrnhgvlhdrohhrgh
X-ME-Proxy: <xmx:Wv2AZ5YzrnyryOo8iJgAHkYbHCZmL310OEbuk120xRA-vjMDyMbTQw>
    <xmx:Wv2AZzZ_EHdFmeI8E4_DRc-TOz5gw6vP7uUIzZ98xMDOVX9qI_yMHA>
    <xmx:Wv2AZ1BK_x4FQlLrep5DNSmTRLFqKencfSrFSqpBGMpGfKeJPh4bFg>
    <xmx:Wv2AZ5YV1OMIVO9wrgiBc8gsSxOpO4KjUeHwIrCKBqryJJqImDKhfQ>
    <xmx:W_2AZyWBXrWsYRRIC5a0viLJj0AS5gTEL5S6trQBAkA6dMkeHotyDcco>
Feedback-ID: i80c9496c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 10 Jan 2025 05:58:34 -0500 (EST)
Date: Fri, 10 Jan 2025 11:58:33 +0100
From: Niklas =?utf-8?Q?S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Jacopo Mondi <jacopo.mondi+renesas@ideasonboard.com>,
	linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH 1/2] arm64: dts: renesas: r8a779a0: Add FCPVX instances
Message-ID: <20250110105833.GC308750@ragnatech.se>
References: <20250109125433.2402045-1-niklas.soderlund+renesas@ragnatech.se>
 <20250109125433.2402045-2-niklas.soderlund+renesas@ragnatech.se>
 <CAMuHMdW1D=o8aaPOAQLPEZw-Y-9MVzzCRGEykEU=39CYeuRW2A@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAMuHMdW1D=o8aaPOAQLPEZw-Y-9MVzzCRGEykEU=39CYeuRW2A@mail.gmail.com>

Hi Geert,

Thanks for your review.

On 2025-01-10 11:44:21 +0100, Geert Uytterhoeven wrote:
> Hi Niklas,
> 
> On Thu, Jan 9, 2025 at 1:55 PM Niklas Söderlund
> <niklas.soderlund+renesas@ragnatech.se> wrote:
> > Add device nodes for the FCPVX instances on R-Car V3U.
> >
> > Signed-off-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
> 
> Thanks for your patch!
> 
> Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
> i.e. will queue in renesas-devel for v6.15.
> 
> > --- a/arch/arm64/boot/dts/renesas/r8a779a0.dtsi
> > +++ b/arch/arm64/boot/dts/renesas/r8a779a0.dtsi
> > @@ -2890,6 +2890,42 @@ port@1 {
> >                         };
> >                 };
> >
> > +               fcpvx0: fcp@fedb0000 {
> 
> I think it makes sense to move these next to the existing fcp nodes.
> If you agree, I can do that while applying.

The rational here was I sorted it based on addresses, but I'm fine 
either way. If you can fix this when applying I would be grateful, 
thanks!

Same for patch 2/2.

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

