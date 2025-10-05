Return-Path: <linux-renesas-soc+bounces-22655-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 3608CBB946E
	for <lists+linux-renesas-soc@lfdr.de>; Sun, 05 Oct 2025 09:12:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id EBDA91898E66
	for <lists+linux-renesas-soc@lfdr.de>; Sun,  5 Oct 2025 07:12:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 95F641DED5B;
	Sun,  5 Oct 2025 07:12:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b="RWAtc0n4";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="s6wF8SPe"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from fhigh-a3-smtp.messagingengine.com (fhigh-a3-smtp.messagingengine.com [103.168.172.154])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 349D5186E40;
	Sun,  5 Oct 2025 07:12:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.154
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759648346; cv=none; b=Ccc6f4N+hh7nvLuyJYckMc+2EDP9TdWcemBIONXLI/UFpMEKfs+bd+5rAaF1/dZd+GCxxsaXsFnb04czqC7LxyV3G+yNfRzxs2XFjUru7Rf07KzMwKNq9xK585uGdgQhae/Ashh0HshhjjNZgXRY/BrYMSjkE6ef6LiYNvANE84=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759648346; c=relaxed/simple;
	bh=POyi6SJX9alPy9NVP67uOEZYpvTbm4h/VCPZv6EfuQk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=pLJYC8x74JpjZAYXhS8h1P9tkEPG6xakg1aPMee4vQtA11kWdLlZeHrECyS0g7ZoTXt3G/QRmuBpS8yEY5Yow0Dy6qX/eWKimYtUQN0eE80IP7oNX7UeLs+rQGpr1u3E87mhuEzB5raS1j39WUL57wOZETqm0P1DiQxiyDljJsU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se; spf=pass smtp.mailfrom=ragnatech.se; dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b=RWAtc0n4; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=s6wF8SPe; arc=none smtp.client-ip=103.168.172.154
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ragnatech.se
Received: from phl-compute-05.internal (phl-compute-05.internal [10.202.2.45])
	by mailfhigh.phl.internal (Postfix) with ESMTP id 251C9140007F;
	Sun,  5 Oct 2025 03:12:23 -0400 (EDT)
Received: from phl-mailfrontend-02 ([10.202.2.163])
  by phl-compute-05.internal (MEProxy); Sun, 05 Oct 2025 03:12:23 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ragnatech.se; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm1; t=1759648343;
	 x=1759734743; bh=jgStZa8HM+mf0RQ3wqnnHnq2rLqSiagOe2NDZM0ypFI=; b=
	RWAtc0n4KkN8hoNX6A1KNOpPOxYKZYm9WV+xjambbq1UcD6YvFv0igEtwily7XI0
	6QGnB/vvHtf6iklS/Nqn7CHhYO0gy1VlHdR9kXifRuuGCUetDzUU9XYa4iNw+vag
	us59MIYHPoYwFV1gS2YbfC8Ydd6VDWwGe/HYloeXnqOAXXgjUxSiDw+PJrEOLR03
	ZFbJGHJ7glnv/EyH0GwergrSR2TnlS6f4VSoaDp84u/myVjfLse/ze/9tfmg3k3d
	dNY7V8xlSbGzl3R6oWM+DmvjGnE8BFyHeoT9tPHjn6v4EHwbtni+3GlpH3dIaMcH
	iy4q57HHKX6SJMbY5ZUy+g==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1759648343; x=
	1759734743; bh=jgStZa8HM+mf0RQ3wqnnHnq2rLqSiagOe2NDZM0ypFI=; b=s
	6wF8SPeJXRSmKaT28tIRZjKiYmIC+qwyRFflAhsmimn8ou6/FuoxZlKoyevbobMD
	Giu6eXV2QUsb54RuFmxmBb+0YtfIZkEP5XBhU0+P2BaJOd6T38eIQdSIcBk33vhQ
	Ks+eedQPPIBMy7dLo5l3DTbPGvO4gsAmLkvELMxWV1BhSOufHMLmA2UcggyqS23Q
	UUOwiBZJG9JW9kCEPOliOOLkY3Oyje0MTo2admhp+E3xzVR0PqsHFDpWo27OAFji
	6+NTqjgnPzCR2fcqmZ1euINgEmbISI05FmlmTnGs28b+ZY0HDHY0DqKojepF/QG4
	ZmxOfeUfCYPIyPwGTNHtA==
X-ME-Sender: <xms:VhriaLMuks1Iul7ebgGmDNAxB53DXx-GhSuhRglJOBGQ-dagJnRzGw>
    <xme:VhriaGoi5rJnAZsIUiPR-XqR28zddQQMXTEX9DJkn_Jht-hopYjrmpGDvg9UlT2OB
    PBzLQ8KL-U_lDWy87AKCMAsElLQlgMBcblKPjNhnZFKaP9wETNFb_oz>
X-ME-Received: <xmr:VhriaIe3VNwSl1vrd6hxXTEewjSUMhgY7kUFO8jEG7cy-UqF2qhedwnYZpEIXs6Y_iD-kUr9WTYuf_u-C1lNkQG9-wFt_L8>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdeggdelgedtfecutefuodetggdotefrod
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
X-ME-Proxy: <xmx:VhriaETOtoGIhfz9XWrG8R_GZ-JWz4jnskg2aMmcUZ_Aq0bM9KNR6w>
    <xmx:VhriaJZGsQot18HU2kJork-6rPoIKidzCLRemInhk2vUf-ZuB6OJKQ>
    <xmx:VhriaPfMlocdGWitUKz0K7w3gERYHTh6AIVB1tQ_So_GSBnihXopag>
    <xmx:VhriaCLtm_BsIJSsro9JwlifHTDN6cJWBQXcgMFDMCWV7RzSyBrCow>
    <xmx:VxriaMSYUgXh9z6tTzJgZUEJnA-uKsgWUdjdpMFc4lAeSbkagq5lPVZG>
Feedback-ID: i80c9496c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sun,
 5 Oct 2025 03:12:22 -0400 (EDT)
Date: Sun, 5 Oct 2025 09:12:19 +0200
From: Niklas =?utf-8?Q?S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>
To: Marek Vasut <marek.vasut@mailbox.org>
Cc: Marek Vasut <marek.vasut+renesas@mailbox.org>,
	linux-clk@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>, linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH] clk: renesas: cpg-mssr: Add missing 1ms delay into reset
 toggle callback
Message-ID: <20251005071219.GD399701@ragnatech.se>
References: <20250918030552.331389-1-marek.vasut+renesas@mailbox.org>
 <20251003150819.GC344149@ragnatech.se>
 <a59212ef-3555-4003-9c71-4ac80eac5cc8@mailbox.org>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <a59212ef-3555-4003-9c71-4ac80eac5cc8@mailbox.org>

Hi Marek,

On 2025-10-05 06:00:15 +0200, Marek Vasut wrote:
> On 10/3/25 5:08 PM, Niklas Söderlund wrote:
> 
> Hello Niklas,
> 
> > On 2025-09-18 05:04:43 +0200, Marek Vasut wrote:
> > > R-Car V4H Reference Manual R19UH0186EJ0130 Rev.1.30 Apr. 21, 2025 page 583
> > > Figure 9.3.1(a) Software Reset flow (A) as well as flow (B) / (C) indicate
> > > after reset has been asserted by writing a matching reset bit into register
> > > SRCR, it is mandatory to wait 1ms.
> > > 
> > > This 1ms delay is documented on R-Car V4H and V4M, it is currently unclear
> > > whether S4 is affected as well. This patch does apply the extra delay on
> > > R-Car S4 as well.
> > > 
> > > Fix the reset driver to respect the additional delay when toggling resets.
> > > Drivers which use separate reset_control_(de)assert() must assure matching
> > > delay in their driver code.
> > > 
> > > Fixes: 0ab55cf18341 ("clk: renesas: cpg-mssr: Add support for R-Car V4H")
> > > Signed-off-by: Marek Vasut <marek.vasut+renesas@mailbox.org>
> > > ---
> > > Cc: Geert Uytterhoeven <geert+renesas@glider.be>
> > > Cc: Michael Turquette <mturquette@baylibre.com>
> > > Cc: Stephen Boyd <sboyd@kernel.org>
> > > Cc: linux-clk@vger.kernel.org
> > > Cc: linux-renesas-soc@vger.kernel.org
> > > ---
> > >   drivers/clk/renesas/renesas-cpg-mssr.c | 11 +++++++++--
> > >   1 file changed, 9 insertions(+), 2 deletions(-)
> > > 
> > > diff --git a/drivers/clk/renesas/renesas-cpg-mssr.c b/drivers/clk/renesas/renesas-cpg-mssr.c
> > > index be9f59e6975d..65dfaceea71f 100644
> > > --- a/drivers/clk/renesas/renesas-cpg-mssr.c
> > > +++ b/drivers/clk/renesas/renesas-cpg-mssr.c
> > > @@ -689,8 +689,15 @@ static int cpg_mssr_reset(struct reset_controller_dev *rcdev,
> > >   	/* Reset module */
> > >   	writel(bitmask, priv->pub.base0 + priv->reset_regs[reg]);
> > > -	/* Wait for at least one cycle of the RCLK clock (@ ca. 32 kHz) */
> > > -	udelay(35);
> > > +	/*
> > > +	 * On R-Car Gen4, delay after SRCR has been written is 1ms.
> > > +	 * On older SoCs, delay after SRCR has been written is 35us
> > > +	 * (one cycle of the RCLK clock @ cca. 32 kHz).
> > > +	 */
> > > +	if (priv->reg_layout == CLK_REG_LAYOUT_RCAR_GEN4)
> > > +		usleep_range(1000, 2000);
> > > +	else
> > > +		usleep_range(35, 1000);
> > 
> > I rebased the R-Car ISP work to renesas-drivers today and it included
> > this change, and I seem to have hit an issue with the switch form
> > udelay() to usleep_range() I'm afraid. I can't find any other good
> > reproducer of the issue however.
> > 
> > THe core of the issue seems to be that if a reset is issued from an
> > atomic context bad things happen if you try to sleep. I get this splat
> > and the board is completer dead after it, needing a power cycle to
> > recover.
> > 
> > If I revert this patch things work as expected.
> Thank you for testing. Does it work well if you replace those
> usleep_range()s with plain udelay() ?

With this change it do work. I'm testing on V4H so I assume it's the 
Gen4 branch that is taken here?

diff --git a/drivers/clk/renesas/renesas-cpg-mssr.c b/drivers/clk/renesas/renesas-cpg-mssr.c
index a3d171ddaab9..2b45f0aa8d97 100644
--- a/drivers/clk/renesas/renesas-cpg-mssr.c
+++ b/drivers/clk/renesas/renesas-cpg-mssr.c
@@ -709,9 +709,9 @@ static int cpg_mssr_reset(struct reset_controller_dev *rcdev,
         * (one cycle of the RCLK clock @ ca. 32 kHz).
         */
        if (priv->reg_layout == CLK_REG_LAYOUT_RCAR_GEN4)
-               usleep_range(1000, 2000);
+               udelay(1000);
        else
-               usleep_range(35, 1000);
+               udelay(35);

        /* Release module from reset state */
        return cpg_mssr_reset_operate(rcdev, NULL, false, id);

-- 
Kind Regards,
Niklas Söderlund

