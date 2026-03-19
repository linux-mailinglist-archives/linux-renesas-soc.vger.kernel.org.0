Return-Path: <linux-renesas-soc+bounces-29851-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id yMVNOIaqu2ngmQIAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-29851-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 19 Mar 2026 08:49:26 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A5FA2C77C3
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 19 Mar 2026 08:49:26 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 490C2300C5B0
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 19 Mar 2026 07:48:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 232213A1CE6;
	Thu, 19 Mar 2026 07:48:21 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-vk1-f169.google.com (mail-vk1-f169.google.com [209.85.221.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D32222D29B7
	for <linux-renesas-soc@vger.kernel.org>; Thu, 19 Mar 2026 07:48:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773906500; cv=none; b=YMhi2jDPq3JqFDsygjE1/mz9ChrzCxz5VGzUy61dDvwwUYlD/uyeQ5xb3qXpwSoL0PsDeWpC7yiGKxLn5nCFcBdF3+vzOFQ/YcywrD8fIsIWTrRVtC62SfGpNjMyZ0MgvLnog9TZOqPwmrqpVa7ZPXV/NMlamD3QOI3rDUbwNnM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773906500; c=relaxed/simple;
	bh=Hq04kObq93XXeS9LDB/6/XRdQpPQjLswZ5QaoZ+rGI4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=SGKS0mnwQYURuAlu0Fs3HnYHJB+OBYRwpkdNXu9M4yxvMX7pmYatTT3eun6ZKXMfC5P+yaV3TFC+iKG/dxdg/obyyPqbYy2/YEDe+TeMmsxX/n2oLNd6Iae0MEqrbJ6iweHC3WTIOhdJsis5q4T83TB9jPNdpoMz8ETV8nD4tSI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f169.google.com with SMTP id 71dfb90a1353d-56af73db66bso235703e0c.2
        for <linux-renesas-soc@vger.kernel.org>; Thu, 19 Mar 2026 00:48:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773906497; x=1774511297;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=30ZEsEZbPQ/xc3vgTCQIDJesXJzH1HlBQIStDOgSems=;
        b=XFqfo2sdpR8MXuXkeWCliod9w0DIFr2z0jmidRWzrj2RGqkVn2b1i7JPavmIBJIyBv
         Z8bI9wGpvqF8IEmFaG7qp9NFI7MUsO7wk53GkthVeB9ooqEWnpyaVOwyzf3+AhwaWViN
         Z5KAP5MK655KBZc9adXxixAZHvarNcT/Q99XP7K3pOE04/W6zfpUh104oxdkS7u0Ia5U
         /IzS/WCQazqdO9aKd8he2TefDat/mNr+fyEOjBv4UlgFoBxIzxKpupbJr9HJg1vSxDGu
         N1UX4a9tLbWyY7vd/kOtDt8OQzvhM3mLqnqWCPtijhQ9LhRyKUZb/Xu/yAxkjb8mVmr4
         bRRw==
X-Forwarded-Encrypted: i=1; AJvYcCUBw517vtMH3W9EC3TgMGqbu5t02UADXfZqlOcoBEtm8DRFvLzhAYrBKjRB4Y5l/wRmz3us0zRkGKyAT2DusuvGeg==@vger.kernel.org
X-Gm-Message-State: AOJu0YzT144aIy9Zjok7TX8JerWOop6LclzH4+Fn29ZxPu7Bblfbfjz6
	bc5JBEhvlV9QTelUZ1DgjHG6z8FLJnx0ppL14ltZxMDV287NMsF9+ueGUakyo1C4
X-Gm-Gg: ATEYQzwkLvSIoraf22jUlhHSZfeLBpeaC/d04ojGimTmMhQDXHOkLSRTXa+9412foxX
	zInLaS7x3yjU/ZVAzQsFetn/5ym9yuFFiyCAy4lYAWdcZ1XTAII2sZ67jwqUXXKVvoDLr7iZhcc
	P/Nk07vA0oE9N/gTMGD0eZ8xB3DpwwfhYNGTKgrBLsKIJs+Pf+QbcwIl8Dfj08Xwt1fk4payLZX
	OKUu2s2XLX6XlDEMpcQKZG60FHV8DMTC79zbx5oftxsK7rJTbLGP04c8j1mbVp9a42zoRSLfi6e
	tCM7BrLZwqwUaf1ZMv/QWGYGq6FflEmlB2+RuPTB3Z88L0XRhmCw6ARmBfTuCY4nM7qb9F2P5KP
	2T3GoOlEd9g76LOE95mTlW+DRFAN/6rDIIs045IUUjA27bREjIKuusSzUQ9m3pdex5NqUZRSIH4
	x6HZIBi7RZkyClUVAdOO2C9RKBWQMXF7/7ezYCLyueAqic4KQUcpnuMKVD43lnY8Gl
X-Received: by 2002:a05:6122:3105:b0:56a:e25f:fc87 with SMTP id 71dfb90a1353d-56ba7083adcmr2827437e0c.7.1773906496653;
        Thu, 19 Mar 2026 00:48:16 -0700 (PDT)
Received: from mail-vk1-f174.google.com (mail-vk1-f174.google.com. [209.85.221.174])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-56ba6fed60esm3142243e0c.12.2026.03.19.00.48.16
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 19 Mar 2026 00:48:16 -0700 (PDT)
Received: by mail-vk1-f174.google.com with SMTP id 71dfb90a1353d-56af73db66bso235695e0c.2
        for <linux-renesas-soc@vger.kernel.org>; Thu, 19 Mar 2026 00:48:16 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCWMurzIxe6keRwuyLFUoNLC7fz8Opv2ZxNe9MMhfCr2KC/pzzkMYRusj8O/y+xTs/lvnhF8n/cUb9iHJTDU1482MQ==@vger.kernel.org
X-Received: by 2002:a05:6122:133:b0:56c:c71a:e09a with SMTP id
 71dfb90a1353d-56cc71ae292mr1737576e0c.14.1773906495768; Thu, 19 Mar 2026
 00:48:15 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260318084151.122674-1-biju.das.jz@bp.renesas.com>
 <20260318084151.122674-5-biju.das.jz@bp.renesas.com> <CAMuHMdXmM-mGiuJmF9CSv5DkSDT17eJZPOP-y8SoE6OdhYdwBQ@mail.gmail.com>
 <CAMuHMdU=2i=cDYoYnWztMt2aBRHqfh_66E82LD0gR8baL4XRmQ@mail.gmail.com> <TY3PR01MB113462B4D62B13F22516EBDED864EA@TY3PR01MB11346.jpnprd01.prod.outlook.com>
In-Reply-To: <TY3PR01MB113462B4D62B13F22516EBDED864EA@TY3PR01MB11346.jpnprd01.prod.outlook.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 19 Mar 2026 08:48:04 +0100
X-Gmail-Original-Message-ID: <CAMuHMdVtsK0wZJENtF4qM2K4zh_J9EtOfds+MMBG4FSw2Y1Bqg@mail.gmail.com>
X-Gm-Features: AaiRm516m6RPC7PwV0xruJw-z5uax23l18idJqkrg-9rcrHX9hU2xMW25nLWINE
Message-ID: <CAMuHMdVtsK0wZJENtF4qM2K4zh_J9EtOfds+MMBG4FSw2Y1Bqg@mail.gmail.com>
Subject: Re: [PATCH v5 4/9] clk: renesas: rzg2l-cpg: Re-enable critical module
 clocks during resume
To: Biju Das <biju.das.jz@bp.renesas.com>
Cc: "biju.das.au" <biju.das.au@gmail.com>, Michael Turquette <mturquette@baylibre.com>, 
	Stephen Boyd <sboyd@kernel.org>, "magnus.damm" <magnus.damm@gmail.com>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, 
	"linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>, 
	"linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>, 
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
X-Spamd-Result: default: False [0.04 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_CC(0.00)[gmail.com,baylibre.com,kernel.org,vger.kernel.org,bp.renesas.com];
	TAGGED_FROM(0.00)[bounces-29851-lists,linux-renesas-soc=lfdr.de];
	DMARC_NA(0.00)[linux-m68k.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	NEURAL_SPAM(0.00)[0.393];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[geert@linux-m68k.org,linux-renesas-soc@vger.kernel.org];
	MISSING_XM_UA(0.00)[];
	R_DKIM_NA(0.00)[];
	TAGGED_RCPT(0.00)[linux-renesas-soc];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,renesas.com:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,linux-m68k.org:email]
X-Rspamd-Queue-Id: 4A5FA2C77C3
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi Biju,

On Wed, 18 Mar 2026 at 18:06, Biju Das <biju.das.jz@bp.renesas.com> wrote:
> > From: Geert Uytterhoeven <geert@linux-m68k.org>
> > On Wed, 18 Mar 2026 at 15:54, Geert Uytterhoeven <geert@linux-m68k.org> wrote:
> > > On Wed, 18 Mar 2026 at 09:42, Biju <biju.das.au@gmail.com> wrote:
> > > > From: Biju Das <biju.das.jz@bp.renesas.com>
> > > >
> > > > After a suspend/resume cycle, critical module clocks may be left
> > > > disabled as the hardware state is not automatically restored. Unlike
> > > > regular clocks which are re-enabled by their respective drivers,
> > > > critical clocks
> > > > (CLK_IS_CRITICAL) have no owning driver to restore them, so the CPG
> > > > driver must take responsibility for re-enabling them on resume.
> > > >
> > > > Introduce struct rzg2l_crit_clk_hw to track critical module clock
> > > > hardware entries in a singly-linked list anchored at
> > > > crit_clk_hw_head in rzg2l_cpg_priv. Populate the list during module
> > > > clock registration by checking for the CLK_IS_CRITICAL flag after clk_hw_register() succeeds.
> > > >
> > > > On resume, walk the list and re-enable any critical module clock
> > > > that is found to be disabled, before deasserting critical resets,
> > > > ensuring the correct clock-before-reset restore ordering.
> > > >
> > > > Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
> > >
> > > Thanks for your patch!
> > >
> > > > --- a/drivers/clk/renesas/rzg2l-cpg.c
> > > > +++ b/drivers/clk/renesas/rzg2l-cpg.c
> > > > @@ -130,6 +130,12 @@ struct div_hw_data {
> > > >         u32 width;
> > > >  };
> > > >
> > > > +/* Critical clk list  */
> > > > +struct rzg2l_crit_clk_hw {
> > > > +       struct clk_hw *hw;
> > > > +       struct rzg2l_crit_clk_hw *next; };
> > > > +
> > > >  #define to_div_hw_data(_hw)    container_of(_hw, struct div_hw_data, hw_data)
> > > >
> > > >  struct rzg2l_pll5_param {
> > > > @@ -168,6 +174,7 @@ struct rzg2l_pll5_mux_dsi_div_param {
> > > >   * @info: Pointer to platform data
> > > >   * @genpd: PM domain
> > > >   * @mux_dsi_div_params: pll5 mux and dsi div parameters
> > > > + * @crit_clk_hw_head: Head of the linked list critical clk entries
> > > >   */
> > > >  struct rzg2l_cpg_priv {
> > > >         struct reset_controller_dev rcdev; @@ -186,8 +193,26 @@
> > > > struct rzg2l_cpg_priv {
> > > >         struct generic_pm_domain genpd;
> > > >
> > > >         struct rzg2l_pll5_mux_dsi_div_param mux_dsi_div_params;
> > > > +
> > > > +       struct rzg2l_crit_clk_hw *crit_clk_hw_head;
> > > >  };
> > > >
> > > > +static int rzg2l_cpg_add_crit_clk_hw_entry(struct rzg2l_cpg_priv *priv,
> > > > +                                          struct clk_hw *hw) {
> > > > +       struct rzg2l_crit_clk_hw *node;
> > > > +
> > > > +       node = devm_kzalloc(priv->dev, sizeof(*node), GFP_KERNEL);
> > >
> > > This ends up allocating quite some memory to store just a single
> > > clk_hw pointer.   Alternatively, you could use an array and size,
> > > and grow that using devm_krealloc().
> >
> > Upon second thought, you already know how many there are upfront, thanks to
> > rzg2l_cpg_info.num_crit_mod_clks? You even already have an array (but it's __initconst).
> >
> > > Another alternative would be saving and restoring all clocks during
> > > suspend/resume, like renesas-cpg-mssr.c does.
> >
> > Another alternative: rzg2l_mod_clock_init_mstop() already iterates over all module clocks during
> > resume, so it could be modified to also force-enable all critical module clocks.
>
> Looks this is simple. I will send next version based on this
>
> diff --git a/drivers/clk/renesas/rzg2l-cpg.c b/drivers/clk/renesas/rzg2l-cpg.c
> index f9e4af7f49d0..eeafbfe3c725 100644
> --- a/drivers/clk/renesas/rzg2l-cpg.c
> +++ b/drivers/clk/renesas/rzg2l-cpg.c
> @@ -1601,8 +1601,11 @@ static void rzg2l_mod_clock_init_mstop(struct rzg2l_cpg_priv *priv)
>                  * module is in invalid HW state.
>                  */
>                 scoped_guard(spinlock_irqsave, &priv->rmw_lock) {
> -                       if (!rzg2l_mod_clock_is_enabled(&clk->hw))
> +                       if (!rzg2l_mod_clock_is_enabled(&clk->hw)) {
> +                               if (clk_hw_get_flags(&clk->hw) & CLK_IS_CRITICAL)
> +                                       rzg2l_mod_clock_endisable(&clk->hw, true);
>                                 rzg2l_mod_clock_module_set_state(clk, true);
> +                       }
>                 }
>         }
>  }

Looks good in principle, but there are a few gotyas:
  1. rzg2l_mod_clock_is_enabled() does not return the hardware state
     if there is a sibling (but that may not be an issue, I didn't check
     the actual critical clocks),
  2. rzg2l_mod_clock_endisable() takes &priv->rmw_lock, so you have
     to move it out of the scoped_guard() to avoid deadlock,
  3. You need to move this to the top of the loop anyway, else it
     doesn't work for critical clocks without mstop,
  4. Probably you want to rename the function.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

