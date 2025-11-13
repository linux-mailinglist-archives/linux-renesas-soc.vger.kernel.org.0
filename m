Return-Path: <linux-renesas-soc+bounces-24528-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [213.196.21.55])
	by mail.lfdr.de (Postfix) with ESMTPS id 76E60C553D9
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 13 Nov 2025 02:22:06 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id DC954346D59
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 13 Nov 2025 01:22:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E00562638BC;
	Thu, 13 Nov 2025 01:21:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=hugovil.com header.i=@hugovil.com header.b="W332q62A"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail.hugovil.com (mail.hugovil.com [162.243.120.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C35B22C181;
	Thu, 13 Nov 2025 01:21:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=162.243.120.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762996914; cv=none; b=fbQyRIeGtZNJMOd8IwtxUETlm1N2HfOAB16virDDfTEEDaZ6aP4Jc6FTEaCMnWKKychcltQUmHOa0zPvgNhPg16a6BuVikBP5LjXF1ln7u7je9z8EgyCOg3n0Lt4KsDEKBdaVuGoe8yB2g96WEmIjOvdA/ny7PKz7Bu7YLf3Ob0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762996914; c=relaxed/simple;
	bh=XLFNfueYNt+z/iZgpkK/QcLi+OgBgDN/yNLhzjt4vWU=;
	h=Date:From:To:Cc:Message-Id:In-Reply-To:References:Mime-Version:
	 Content-Type:Subject; b=MRj03Avl/AP1K4J67ToKxlHnTnYtDBesNjNAafo5wnFWodlWBQmrDmNTxadgWubHwFl8bMYfOzEnVFgCF5wNp+lm5wZR/O6Oz3aB+rUEOrWBP+J0eJ2/lj43z8IzxMBcHQLmbzXhZsVN9E7Ui0dgaphoi0gQ2R6q/TyVGBMHmMo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=hugovil.com; spf=pass smtp.mailfrom=hugovil.com; dkim=pass (1024-bit key) header.d=hugovil.com header.i=@hugovil.com header.b=W332q62A; arc=none smtp.client-ip=162.243.120.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=hugovil.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=hugovil.com
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=hugovil.com
	; s=x; h=Subject:Content-Transfer-Encoding:Mime-Version:Message-Id:Cc:To:From
	:Date:subject:date:message-id:reply-to;
	bh=hUXyvrqhQtyLwClHbmlnUsvRRtqFNZ/pNPCH03T/U04=; b=W332q62AciNmpdwEmb+vSv3+2w
	25fh2ZHZqI+/fJ5/f1MZhzkoVARLY0+ISUPFQIrBWxYZ8rUNN9F0GUoNAdudYmLnJe3kR2Fi8Rclm
	Y90B4JpgjhBYwayebq4hVQ2hf+02QvPyeWuR721yO/kNDuBu5LXydrBpzDHx9sBf80Lc=;
Received: from modemcable168.174-80-70.mc.videotron.ca ([70.80.174.168]:52266 helo=pettiford)
	by mail.hugovil.com with esmtpa (Exim 4.92)
	(envelope-from <hugo@hugovil.com>)
	id 1vJM1r-00061g-3a; Wed, 12 Nov 2025 20:21:39 -0500
Date: Wed, 12 Nov 2025 20:21:38 -0500
From: Hugo Villeneuve <hugo@hugovil.com>
To: Chris Brandt <Chris.Brandt@renesas.com>
Cc: Geert Uytterhoeven <geert+renesas@glider.be>, Michael Turquette
 <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, Biju Das
 <biju.das.jz@bp.renesas.com>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Hien Huynh <hien.huynh.px@renesas.com>,
 Nghia Vo <nghia.vo.zn@renesas.com>, "linux-renesas-soc@vger.kernel.org"
 <linux-renesas-soc@vger.kernel.org>, "linux-clk@vger.kernel.org"
 <linux-clk@vger.kernel.org>, "dri-devel@lists.freedesktop.org"
 <dri-devel@lists.freedesktop.org>
Message-Id: <20251112202138.1fa192b4ab6d15b404bf825d@hugovil.com>
In-Reply-To: <OS3PR01MB83195D658E18C009B4FDF2BB8ACDA@OS3PR01MB8319.jpnprd01.prod.outlook.com>
References: <20251105222530.979537-1-chris.brandt@renesas.com>
	<20251105222530.979537-2-chris.brandt@renesas.com>
	<20251111234122.5542a64223c6e286ca89dbd8@hugovil.com>
	<OS3PR01MB83195D658E18C009B4FDF2BB8ACDA@OS3PR01MB8319.jpnprd01.prod.outlook.com>
X-Mailer: Sylpheed 3.8.0beta1 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-SA-Exim-Connect-IP: 70.80.174.168
X-SA-Exim-Mail-From: hugo@hugovil.com
X-Spam-Level: 
X-Spam-Report: 
	* -1.0 ALL_TRUSTED Passed through trusted hosts only via SMTP
	* -0.7 NICE_REPLY_A Looks like a legit reply (A)
Subject: Re: [PATCH v4 1/2] clk: renesas: rzg2l: Remove DSI clock rate
 restrictions
X-SA-Exim-Version: 4.2.1 (built Wed, 08 May 2019 21:11:16 +0000)
X-SA-Exim-Scanned: Yes (on mail.hugovil.com)

Hi Chris,

On Thu, 13 Nov 2025 00:39:59 +0000
Chris Brandt <Chris.Brandt@renesas.com> wrote:

> Hi Hugo,
> 
> Thank you for your review.
> 
> On Tue, Nov 11, 2025 11:41 PM, Hugo Villeneuve wrote:
> > > +/* Required division ratio for MIPI D-PHY clock depending on number of lanes and bpp. */
> > >+static unsigned int dsi_div_ab_desired;
> >
> > giving a maximum of 24 * 2 / 1 = 48
> >
> > So change type to u8?
> 
> Done.
> 
> I also changed the API function:

Good idea.

> 
> -void rzg2l_cpg_dsi_div_set_divider(unsigned int divider, int target);
> +void rzg2l_cpg_dsi_div_set_divider(u8 divider, int target);
> 
> But, I kept "target" as int because it is an enum.
> Any comment on changing that to "u8" as well???

No, int is good for that enum.

> 
> 
> > > +rzg2l_cpg_get_foutpostdiv_rate(struct rzg2l_cpg_priv *priv,
> > > +			       struct rzg2l_pll5_param *params,
> > >  			       unsigned long rate)
> > >  {
> > >  	unsigned long foutpostdiv_rate, foutvco_rate;
> > > +	unsigned long hsclk;
> > > +	unsigned int a, b, odd;
> > > +	unsigned int dsi_div_ab_calc;
> > > +
> >
> > Based on my tests, it seems we can arrive at this point with a non-initialized dsi_div_ab_desired (0). Since valid
> > values are from 1 to 128, add a check for this before using it.
> 
> I think at first, we need to understand how that is happening and fix that code path.
> If this function is being called before the dsi_div_ab_desired is set to a valid value, then the code might make bad calculations and decisions.

Agreed.

> 
> 
> > > +		/* Determine the correct clock source based on even/odd of the divider */
> > > +		odd = dsi_div_ab_desired & 1;
> > > +		if (odd) {
> > > +			/* divider is odd */
> >
> > You can drop this comment, as your "odd" variable is self-explanatory.
> >
> > > +			priv->mux_dsi_div_params.clksrc = 0;	/* FOUTPOSTDIV */
> > > +			dsi_div_ab_calc = dsi_div_ab_desired;
> > > +		} else {
> > > +			/* divider is even */
> >
> > ditto.
> 
> Done.
> 
> 
> > > +
> > > +			/* FOUTPOSTDIV: DIV_DSI_A must always be 1/1 */
> > > +			if (odd && a != 0)
> > > +				continue;
> >
> > Use break instead of continue?
> 
> Done.
> Changed to break;
> 
> > > +
> > > +			for (b = 0; b < 16; b++) {
> > > +				/* FOUTPOSTDIV: DIV_DSI_B must always be odd divider 1/(b+1) */
> > > +				if (odd && b & 1)
> > > +					continue;
> > > +
> > > +				if ((b + 1) << a == dsi_div_ab_calc) {
> >
> >
> > It took me a while to decipher this :)
> >
> > Use an inline function to compute div_ab to improve readability, and you can reuse this function elsewhere instead of hardcoding the div_ab value (to for example):
> >
> > static inline u8 rzg2l_cpg_div_ab(u8 a, u8 b) {
> >	return (b + 1) << a;
> > }
> >
> > and then:
> >
> >     ...
> >     if (rzg2l_cpg_div_ab(a, b) == dsi_div_ab_calc) {
> >     ...
> >
> 
> OK. I can live with that.
> 
> During the reviews, the code kept getting more and more optimized and trimmed down, which then became harder to follow.
> 
> 
> > > +	if (dsi_div_target == PLL5_TARGET_DPI) {
> > > +		/* Fixed settings for DPI */
> > > +		priv->mux_dsi_div_params.clksrc = 0;
> > > +		priv->mux_dsi_div_params.dsi_div_a = 3; /* Divided by 8 */
> > > +		priv->mux_dsi_div_params.dsi_div_b = 0; /* Divided by 1 */
> > > +		dsi_div_ab_desired = 8;			/* (1 << a) * (b + 1) */
> > > +	}
> >
> > Here this block could be combined as an if/else-if:
> >
> >     if (dsi_div_target == PLL5_TARGET_DPI) {
> >         ...
> >     } else if (dsi_div_target == PLL5_TARGET_DSI) {
> >         ...
> 
> Done.
> 
> 
> > > +				if (params->pl5_intin < PLL5_INTIN_MIN ||
> > > +				    params->pl5_intin > PLL5_INTIN_MAX)
> > > +					continue;
> >
> > Insert line for readability
> 
> Done.
> 
> 
> 
> 
> > > -	foutpostdiv_rate = DIV_ROUND_CLOSEST_ULL(foutvco_rate,
> > > -						 params->pl5_postdiv1 * params->pl5_postdiv2);
> > > +
> > > +	foutpostdiv_rate = DIV_ROUND_CLOSEST(foutvco_rate,
> > > +					     params->pl5_postdiv1 * params->pl5_postdiv2);
> > >  
> > >  	return foutpostdiv_rate;
> >
> > You can drop foutpostdiv_rate intermediate variable and return directly, all on one line:
> >
> >     return DIV_ROUND_CLOSEST(foutvco_rate, params->pl5_postdiv1 * params->pl5_postdiv2);
> 
> Done.
> 
> 
> > >  	vclk_rate = rzg2l_cpg_get_vclk_rate(hw, rate);
> > >  	sipll5->foutpostdiv_rate =
> > > -		rzg2l_cpg_get_foutpostdiv_rate(&params, vclk_rate);
> > > +		rzg2l_cpg_get_foutpostdiv_rate(priv, &params, vclk_rate);
> >
> > Before this patch, rzg2l_cpg_get_foutpostdiv_rate() seemed to always return a valid rate. Therefore, no validation was done of the computed rate.
> >
> > Now with your patch it may return "0" if the rate is invalid. Therefore you need to check for this here and return a corresponding error code.
> 
> I saw for some clock drivers, if they could not get the correct rate, they just return '0' as the rate.
> 
> But, I do see in some other drivers, they return -EINVAL, so I can do that as well.

I think -EINVAL is good, as there is already, a few lines above, a
check for:

    if (!rate)
        return -EINVAL;

So it will be consistent.

> 
>  
> > > -	priv->mux_dsi_div_params.clksrc = 1; /* Use clk src 1 for DSI */
> > > -	priv->mux_dsi_div_params.dsi_div_a = 1; /* Divided by 2 */
> > > -	priv->mux_dsi_div_params.dsi_div_b = 2; /* Divided by 3 */
> > > +	/* Default settings for DPI */
> > > +	priv->mux_dsi_div_params.clksrc = 0;
> > > +	priv->mux_dsi_div_params.dsi_div_a = 3; /* Divided by 8 */
> > > +	priv->mux_dsi_div_params.dsi_div_b = 0; /* Divided by 1 */
> > > +	dsi_div_ab_desired = 8;			/* (1 << a) * (b + 1) */
> >
> > Use inline function rzg2l_cpg_div_ab() previously suggested.
> 
> I plan on getting rid of this code block anyway.
> It's not needed.

Ok.

Hugo.

