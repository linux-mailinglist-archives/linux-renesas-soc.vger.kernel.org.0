Return-Path: <linux-renesas-soc+bounces-22665-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C2AEBB97BB
	for <lists+linux-renesas-soc@lfdr.de>; Sun, 05 Oct 2025 15:42:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 0255518910DD
	for <lists+linux-renesas-soc@lfdr.de>; Sun,  5 Oct 2025 13:42:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D69A42882DF;
	Sun,  5 Oct 2025 13:42:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b="H6rjWoTw";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="XrDpGRt2"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from fhigh-a6-smtp.messagingengine.com (fhigh-a6-smtp.messagingengine.com [103.168.172.157])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E4D4028727C;
	Sun,  5 Oct 2025 13:42:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.157
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759671746; cv=none; b=BRU4AnkSJ1PslQO962uWDWJScFfdYrqcKEZjWcNPIcY2c4AMTOj3SZy/KFRhWSzphodcBDOsaR3pRukSTIWqhp0afXQPfkHAA3B0F971RXaRxGDtLssBAZ3UwMXUL0HgITsgfPfT0lLKpMpW9Lc117yXfs2+pSoAhcshcrAXp0s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759671746; c=relaxed/simple;
	bh=LnxsJaQq2me+x0JVBfDhnlhS6b4pDG0yblUKvk3X7pk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=B6qCHRMpC2u8BpIs1KWXpmNOZKCNEWfADDDZzqpsSMwKqff4QkzKeZjpqrU1jy1VEZ1v6VMeuUEb5FSn+HFSckWq21N7PYnygDm9UdZceBYx8ACqdK69PR8k40FI66uDdykFIlz8EGBBaAUCw/R7QagKcV61YGpOkBnVfX42gy8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se; spf=pass smtp.mailfrom=ragnatech.se; dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b=H6rjWoTw; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=XrDpGRt2; arc=none smtp.client-ip=103.168.172.157
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ragnatech.se
Received: from phl-compute-02.internal (phl-compute-02.internal [10.202.2.42])
	by mailfhigh.phl.internal (Postfix) with ESMTP id D2D311400107;
	Sun,  5 Oct 2025 09:42:22 -0400 (EDT)
Received: from phl-mailfrontend-02 ([10.202.2.163])
  by phl-compute-02.internal (MEProxy); Sun, 05 Oct 2025 09:42:22 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ragnatech.se; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm1; t=1759671742;
	 x=1759758142; bh=XgUViYRHRiWLdLhh3UB9aHQyJxKIphjwPutawnm3bFw=; b=
	H6rjWoTwhgWpv+8idNKyOwg4BRw48w/Pi7UVl+xQNvX4znewRDqL1gNJ+7/6s3Ty
	YIt+eRQI28MYDzNOAS7oVkmpkHKVLQgmTgS0hfDbJCl0ggCdrV8m/aELWpu47GGC
	NuT6G2vGq/KHsPEfWCCIe8T5cp9CP/BuGYEc4QAK8a5XW779qNsC6DwydC5QySZ6
	TG+GuRne6c9iByP+GxMMlHvQ8gnMJAZPORWEkgSfOy+UA/WvMPHRu85/pmS9EvMQ
	U5yTp21lxa7clJlTHrDPGlqgC1Vp7K2mhx9jcsHk/tAmlkzRPM8KsyBO2rhjE4fr
	ugKV8G1TEhBzbu0zqn+14Q==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1759671742; x=
	1759758142; bh=XgUViYRHRiWLdLhh3UB9aHQyJxKIphjwPutawnm3bFw=; b=X
	rDpGRt2ZcE4En4yOPC0RD2O+BFJlcyl4s4OS5K02GMqJDHOx2WOQV7JhZ0jUgKAT
	1ZvBRNfvn92QFL2k6cXaXhFnbDzoDVJaEMx/lz4uTosSVZjJrfMWVc2BQldJWTu9
	dHcDecUBdbiJ9aSSUnEKahPU5RQ9q8H/j4KSREt9AuMCrRk5V2YhJ5eMv6jMswtP
	C2BFE6xE4vfFG6cVOCTaAOv3smfSs7g7iMQtsFv5kx+CKM/CP51ernaLfJOERyzJ
	BmQVv6gch/H5TCV8K/GA9cWSHKofIF7ZvPwqw9+MuWGcL/PBwXNwFrC8Hxi0pq0V
	PSztzwxigjhyOWdFJ2B2w==
X-ME-Sender: <xms:vnXiaC01BpCq9ZNecl7O2c2mSXNmVvwf2MfUjeQGp6Iv6riThMllnA>
    <xme:vnXiaFyAloAot7d6Ditp25QsZQ6ykUhyro4xKYTqs_Pi6rOzVO0E7o0IxHF-Zo4ER
    ZJ5li8d-MzinzyFGil1RTP60jB2LKIHl2dGDJ9qWxatXVFIXV1xYz6H>
X-ME-Received: <xmr:vnXiaJEj7Fvz7WpUPKqZ_xLSge_8StGhJ1cuVmWtBd0L_2Zg-UfCcltxvVTd6Ba_b5obeYW7d_zoEoJQ6EnphIfwtbY6nng>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdeggdelgeekudcutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpuffrtefokffrpgfnqfghnecuuegr
    ihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjug
    hrpeffhffvvefukfhfgggtugfgjgesthekredttddtjeenucfhrhhomheppfhikhhlrghs
    ucfunpguvghrlhhunhguuceonhhikhhlrghsrdhsohguvghrlhhunhgusehrrghgnhgrth
    gvtghhrdhsvgeqnecuggftrfgrthhtvghrnhepveetgedtvddvhfdtkeeghfeffeehteeh
    keekgeefjeduieduueelgedtheekkeetnecuvehluhhsthgvrhfuihiivgeptdenucfrrg
    hrrghmpehmrghilhhfrhhomhepnhhikhhlrghsrdhsohguvghrlhhunhgusehrrghgnhgr
    thgvtghhrdhsvgdpnhgspghrtghpthhtohepjedpmhhouggvpehsmhhtphhouhhtpdhrtg
    hpthhtohepmhgrrhgvkhdrvhgrshhuthesmhgrihhlsghogidrohhrghdprhgtphhtthho
    pehmrghrvghkrdhvrghsuhhtodhrvghnvghsrghssehmrghilhgsohigrdhorhhgpdhrtg
    hpthhtoheplhhinhhugidqtghlkhesvhhgvghrrdhkvghrnhgvlhdrohhrghdprhgtphht
    thhopehgvggvrhhtodhrvghnvghsrghssehglhhiuggvrhdrsggvpdhrtghpthhtohepmh
    htuhhrqhhuvghtthgvsegsrgihlhhisghrvgdrtghomhdprhgtphhtthhopehssghohigu
    sehkvghrnhgvlhdrohhrghdprhgtphhtthhopehlihhnuhigqdhrvghnvghsrghsqdhsoh
    gtsehvghgvrhdrkhgvrhhnvghlrdhorhhg
X-ME-Proxy: <xmx:vnXiaIbKeCURGy8WaCU-HQ8Kbkwg9D_W8-grY-MuiJNKqr4a0tKkXg>
    <xmx:vnXiaLD6xNU_fYKow_L14092UiCTS4hHh5o3whWZfTQO0h51hV8c7w>
    <xmx:vnXiaAnYwUb_ryF3cLX_8OuOieLuxC2HW5kO1c2khGJKnOBPjot-TQ>
    <xmx:vnXiaMzPedJC3Y7jBGUhmUgVg3jRBZ0eD1g2ImSj6J4wyNMJDb-d6w>
    <xmx:vnXiaMY636ZEvTnSmJiN74qB8dMePPPshPyiHCCjzsueSJseONTphqHy>
Feedback-ID: i80c9496c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sun,
 5 Oct 2025 09:42:22 -0400 (EDT)
Date: Sun, 5 Oct 2025 15:42:20 +0200
From: Niklas =?utf-8?Q?S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>
To: Marek Vasut <marek.vasut@mailbox.org>
Cc: Marek Vasut <marek.vasut+renesas@mailbox.org>,
	linux-clk@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>, linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH] clk: renesas: cpg-mssr: Add missing 1ms delay into reset
 toggle callback
Message-ID: <20251005134220.GA1015803@ragnatech.se>
References: <20250918030552.331389-1-marek.vasut+renesas@mailbox.org>
 <20251003150819.GC344149@ragnatech.se>
 <a59212ef-3555-4003-9c71-4ac80eac5cc8@mailbox.org>
 <20251005071219.GD399701@ragnatech.se>
 <d3d7a87c-889a-4e63-8a38-8cbea7383ee0@mailbox.org>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <d3d7a87c-889a-4e63-8a38-8cbea7383ee0@mailbox.org>

Hello Marek,

On 2025-10-05 15:17:02 +0200, Marek Vasut wrote:
> On 10/5/25 9:12 AM, Niklas Söderlund wrote:
> 
> Hello Niklas,
> 
> > On 2025-10-05 06:00:15 +0200, Marek Vasut wrote:
> > > On 10/3/25 5:08 PM, Niklas Söderlund wrote:
> > > 
> > > Hello Niklas,
> > > 
> > > > On 2025-09-18 05:04:43 +0200, Marek Vasut wrote:
> > > > > R-Car V4H Reference Manual R19UH0186EJ0130 Rev.1.30 Apr. 21, 2025 page 583
> > > > > Figure 9.3.1(a) Software Reset flow (A) as well as flow (B) / (C) indicate
> > > > > after reset has been asserted by writing a matching reset bit into register
> > > > > SRCR, it is mandatory to wait 1ms.
> > > > > 
> > > > > This 1ms delay is documented on R-Car V4H and V4M, it is currently unclear
> > > > > whether S4 is affected as well. This patch does apply the extra delay on
> > > > > R-Car S4 as well.
> > > > > 
> > > > > Fix the reset driver to respect the additional delay when toggling resets.
> > > > > Drivers which use separate reset_control_(de)assert() must assure matching
> > > > > delay in their driver code.
> > > > > 
> > > > > Fixes: 0ab55cf18341 ("clk: renesas: cpg-mssr: Add support for R-Car V4H")
> > > > > Signed-off-by: Marek Vasut <marek.vasut+renesas@mailbox.org>
> > > > > ---
> > > > > Cc: Geert Uytterhoeven <geert+renesas@glider.be>
> > > > > Cc: Michael Turquette <mturquette@baylibre.com>
> > > > > Cc: Stephen Boyd <sboyd@kernel.org>
> > > > > Cc: linux-clk@vger.kernel.org
> > > > > Cc: linux-renesas-soc@vger.kernel.org
> > > > > ---
> > > > >    drivers/clk/renesas/renesas-cpg-mssr.c | 11 +++++++++--
> > > > >    1 file changed, 9 insertions(+), 2 deletions(-)
> > > > > 
> > > > > diff --git a/drivers/clk/renesas/renesas-cpg-mssr.c b/drivers/clk/renesas/renesas-cpg-mssr.c
> > > > > index be9f59e6975d..65dfaceea71f 100644
> > > > > --- a/drivers/clk/renesas/renesas-cpg-mssr.c
> > > > > +++ b/drivers/clk/renesas/renesas-cpg-mssr.c
> > > > > @@ -689,8 +689,15 @@ static int cpg_mssr_reset(struct reset_controller_dev *rcdev,
> > > > >    	/* Reset module */
> > > > >    	writel(bitmask, priv->pub.base0 + priv->reset_regs[reg]);
> > > > > -	/* Wait for at least one cycle of the RCLK clock (@ ca. 32 kHz) */
> > > > > -	udelay(35);
> > > > > +	/*
> > > > > +	 * On R-Car Gen4, delay after SRCR has been written is 1ms.
> > > > > +	 * On older SoCs, delay after SRCR has been written is 35us
> > > > > +	 * (one cycle of the RCLK clock @ cca. 32 kHz).
> > > > > +	 */
> > > > > +	if (priv->reg_layout == CLK_REG_LAYOUT_RCAR_GEN4)
> > > > > +		usleep_range(1000, 2000);
> > > > > +	else
> > > > > +		usleep_range(35, 1000);
> > > > 
> > > > I rebased the R-Car ISP work to renesas-drivers today and it included
> > > > this change, and I seem to have hit an issue with the switch form
> > > > udelay() to usleep_range() I'm afraid. I can't find any other good
> > > > reproducer of the issue however.
> > > > 
> > > > THe core of the issue seems to be that if a reset is issued from an
> > > > atomic context bad things happen if you try to sleep. I get this splat
> > > > and the board is completer dead after it, needing a power cycle to
> > > > recover.
> > > > 
> > > > If I revert this patch things work as expected.
> > > Thank you for testing. Does it work well if you replace those
> > > usleep_range()s with plain udelay() ?
> > 
> > With this change it do work. I'm testing on V4H so I assume it's the
> > Gen4 branch that is taken here?
> Yes it is.
> 
> I sent a V2 of this with udelay(), thank you for testing.

Thanks!

> 
> I do wonder, would it be better if risp used reset_assert()/reset_deassert()
> when performing reset in atomic context ? Also, why is it even performing
> reset in atomic context ?

The ISP driver needs to serialize a set of buffer queues when it want to 
consume from them. This happens at two locations, start and interrupt 
context.

As this was not an issue before a spinlock have been used to marshal 
this. However at start time, as the spinlock is taken anyhow, it have 
also been used to protect against multiple starts that would call reset.

-- 
Kind Regards,
Niklas Söderlund

