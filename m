Return-Path: <linux-renesas-soc+bounces-22349-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 13A12B9D6EA
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 25 Sep 2025 07:12:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C14124A588C
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 25 Sep 2025 05:12:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BC6CB2E764B;
	Thu, 25 Sep 2025 05:12:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b="on11+F5v";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="Z/O717V1"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from fhigh-b5-smtp.messagingengine.com (fhigh-b5-smtp.messagingengine.com [202.12.124.156])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 61B3F2749C9;
	Thu, 25 Sep 2025 05:12:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.12.124.156
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758777146; cv=none; b=mhRBTE0amyvYMnP0Ti5QExJ5CGjBOXiQg0ne+m2zQnH0wV7AXJ3KldW2sNOiB98tCZ1cROyPAbbp+Le4psfWV7l/DVB1Rh0+X3mVZSxGnBuyzMdrMFr0/Z5UiCvqWwBEdLG621d37clPctBCDC1DjSSaSoB7ml9l4x5C06UXotw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758777146; c=relaxed/simple;
	bh=AmKGP0SFQudpzE0wY/paaMqioPBUYag+fDjfFcMzHvk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=CSSi2qt+RUXrPRfcNvV4QEEOkfVQZFgfh9Hb4ONPz+5N3Hc9/WAGt1S7UwteoXNCdsYilAEBEFBzyJGhJKiitqzRpD7TIqb4FqTA0CQxS8uiBU2lRdAKB9Ksy62Cwbt08B82xzBooc+1uPv3/3m4ijCGKft9FDzJ1LZn3h4Uopo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se; spf=pass smtp.mailfrom=ragnatech.se; dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b=on11+F5v; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=Z/O717V1; arc=none smtp.client-ip=202.12.124.156
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ragnatech.se
Received: from phl-compute-05.internal (phl-compute-05.internal [10.202.2.45])
	by mailfhigh.stl.internal (Postfix) with ESMTP id 604C77A00AC;
	Thu, 25 Sep 2025 01:12:22 -0400 (EDT)
Received: from phl-mailfrontend-02 ([10.202.2.163])
  by phl-compute-05.internal (MEProxy); Thu, 25 Sep 2025 01:12:22 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ragnatech.se; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm3; t=1758777142;
	 x=1758863542; bh=F18HV6w3Twni1U/Lm2MdRg8IOu1XRnlYZ8Z35cH+x6g=; b=
	on11+F5vJR91oEA+e5tPJLQ+wd21/+BIYhMJ2S+AXHuA4GqSn8jLQKLl5nRyrKO5
	sQqh1d4mjKTLBkthknIbA7kGlkEiQTkHSD7m0ehzrITYa2RvfeTkInIrVveQ4rXj
	cSCGA98yxT76+TIcQ4BesEUsWkA/tN8nR/ReC1LOvpzOhARf6R/JTO2d5XaPH5y1
	jR2YkjhLK9T0xJ6k2VfkVoZb4Fsfr98uD0+gkTypEPv6Rn/D8rHbMQK6lepQMc6m
	6ifF42VCkOaRC9p/KQ+b/t9PerWKrPjKkGdLOak9lbZqvXCviKsSVy8/wqq6Hcnr
	7XRaXXNlAZa25XSoXEnVBQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1758777142; x=
	1758863542; bh=F18HV6w3Twni1U/Lm2MdRg8IOu1XRnlYZ8Z35cH+x6g=; b=Z
	/O717V1SprFLCUlsJKnr6VrQl3zK7J/L7Or7YC0tfGmF53ywo+r369ZnCDSGXFBT
	36EDemZrWv2shokw4lhWUW1TMnj+ETZ8lrh40zw3i4qmWYguLm7/ozdj4tQDvtji
	lFHlGi+y+l0XiSXLzdEDs/4qnDY5dD835rNYciR5NAir9gg6QQ/BDBgTQtj/YzAN
	pld+IRddyTGA8I0klZ22DWbqN0ceLK4Fqjrj7Oc9IONoQ/MOtf4Hf2yb1KvZbgCw
	tRKtvkjFxhRu8xwqPGOLenbwjKlxXoSBlofR2tOPubKOkJY5u3BfDAO45RnAONjD
	GBKVopJ4P74pJgbyREVAw==
X-ME-Sender: <xms:Nc_UaOuCyHdSWexMWmpFInypdv5YnFQAQaT1qaVDmLlgMGbv5qo2SA>
    <xme:Nc_UaE8KRCaPLY2rNJvEbZtnT9NH59nkYFC64iOyEX8-sH9t7nOx83R-h1d22R8Wt
    2zaDsrQ4M5igtiTHdRCN5iXaoyI9GS-60YcbSjEthzMHFwAwbBShgY>
X-ME-Received: <xmr:Nc_UaJ0aJaQUUySfsL4IasQeguN-rYHcLEeNs7HZpIZQzSNaNixOmuyqdH6Z_hmvETEwAoYFCTmQYqI9ABLZVn4wVkb38K4>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdeggdeiheeivdcutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpuffrtefokffrpgfnqfghnecuuegr
    ihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjug
    hrpeffhffvvefukfhfgggtugfgjgesthekredttddtjeenucfhrhhomheppfhikhhlrghs
    ucfunpguvghrlhhunhguuceonhhikhhlrghsrdhsohguvghrlhhunhguodhrvghnvghsrg
    hssehrrghgnhgrthgvtghhrdhsvgeqnecuggftrfgrthhtvghrnhepfefhleelhfffjefg
    fedugfegjeelhfevheeikefhueelgfdtfeeuhefftddvleeinecuvehluhhsthgvrhfuih
    iivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepnhhikhhlrghsrdhsohguvghrlhhu
    nhguodhrvghnvghsrghssehrrghgnhgrthgvtghhrdhsvgdpnhgspghrtghpthhtohephe
    dpmhhouggvpehsmhhtphhouhhtpdhrtghpthhtohepghgvvghrtheslhhinhhugidqmhei
    kehkrdhorhhgpdhrtghpthhtohepuggrnhhivghlrdhlvgiitggrnhhosehlihhnrghroh
    drohhrghdprhgtphhtthhopehtghhlgieslhhinhhuthhrohhnihigrdguvgdprhgtphht
    thhopehlihhnuhigqdhkvghrnhgvlhesvhhgvghrrdhkvghrnhgvlhdrohhrghdprhgtph
    htthhopehlihhnuhigqdhrvghnvghsrghsqdhsohgtsehvghgvrhdrkhgvrhhnvghlrdho
    rhhg
X-ME-Proxy: <xmx:Nc_UaJC8bewA29F6QaT79fT0cYO6jLhRwoIgVEZgN_SG_sTwZm15FA>
    <xmx:Nc_UaFfxG02h4ge_8TiD_nC-LRhyTXnBYs-FmTzjnKtYqcqzSPh-ww>
    <xmx:Nc_UaG4tX9Wll-JohR5tsg7j6Q7bZp_bYrySDdJvpvahAtBviPBqGQ>
    <xmx:Nc_UaIWGgurNL6C6QsVXwnLIDvfi-Vh-4BitkLuVDCFI8Bp54Lpfwg>
    <xmx:Ns_UaDUvli4gCAVyEJJp-yMj4GDEee6ii_B3f1A_iaJ5pHQbvnLpltOJ>
Feedback-ID: i80c9496c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 25 Sep 2025 01:12:21 -0400 (EDT)
Date: Thu, 25 Sep 2025 07:12:19 +0200
From: Niklas =?utf-8?Q?S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>
To: Geert Uytterhoeven <geert@linux-m68k.org>,
	Daniel Lezcano <daniel.lezcano@linaro.org>
Cc: Thomas Gleixner <tglx@linutronix.de>, linux-kernel@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH v2 2/2] clocksource/drivers/sh_cmt: Do not power down
 channels used for events
Message-ID: <20250925051219.GB1062104@ragnatech.se>
References: <20250910142657.1148696-1-niklas.soderlund+renesas@ragnatech.se>
 <20250910142657.1148696-3-niklas.soderlund+renesas@ragnatech.se>
 <CAMuHMdVKZn-YfBxvwA1wgjksvzZK=NPzaoTCPRur_Z=AneLA6w@mail.gmail.com>
 <8672a8c1-26b2-4b65-a30e-a4c3e0f1f32e@linaro.org>
 <20250924093132.GA1062104@ragnatech.se>
 <69f09f55-fd2f-47a9-887a-e9c2cf7c21df@linaro.org>
 <CAMuHMdWt07VP=i_5S2bm6yaRwOovzc4hgZzYaYvpqj4nronxgA@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAMuHMdWt07VP=i_5S2bm6yaRwOovzc4hgZzYaYvpqj4nronxgA@mail.gmail.com>

On 2025-09-24 15:46:45 +0200, Geert Uytterhoeven wrote:
> Hi Daniel,
> 
> On Wed, 24 Sept 2025 at 15:43, Daniel Lezcano <daniel.lezcano@linaro.org> wrote:
> > On 24/09/2025 11:31, Niklas Söderlund wrote:
> > > If it's not too late I think we should drop it. The issue this work
> > > tries to solve is a lockdep blurb which highlights a design issue in the
> > > driver. But the driver have function properly in the past. So I think
> > > it's better I work on solving the blurb without any regressions.
> >
> > Ok, dropping 2/2 but keeping 1/2 is fine, right ?
> 
> 1/2 is a refactoring without any functional impact.
> Thanks!

Thanks to the both of you! Geert for testing and finding the regression 
and Daniel for his quick action removing it from the pull request. I 
will work on a v3 which tries to solve the original issue without the 
regression.

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

