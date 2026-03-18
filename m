Return-Path: <linux-renesas-soc+bounces-29791-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id kEtpC97EumkNbwIAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-29791-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 18 Mar 2026 16:29:34 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C3E72BE352
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 18 Mar 2026 16:29:33 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 6306B30B257C
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 18 Mar 2026 15:10:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D602D3E5598;
	Wed, 18 Mar 2026 15:07:30 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-vk1-f172.google.com (mail-vk1-f172.google.com [209.85.221.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 83CFC3E5EC6
	for <linux-renesas-soc@vger.kernel.org>; Wed, 18 Mar 2026 15:07:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773846450; cv=none; b=HND3gCwk1DyjufkRe42Qtmak0ez5c0iy1jc1UBfcPRKZDAFhBEhWVRAxeFZTur3MPJrGmYMTgNy8FgxLv7+qP3dFg3gDUAc58F7viKRsNh27mxRwqcjADu/Nr0rQSxoB6QXR9HDu246kQahFxtQ/M2mvz+sFo4iU3h21ylMU+Oo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773846450; c=relaxed/simple;
	bh=w5SynmARfyiLassiucnWkac4zh9wFX4zi6/ROoiMUbI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ouaeiG+bmP4oP/uuandE6WatceKp68+av+77quhpvVjI6vkHT0gIYMUb55ct9h4pwmsZPGZbO3HSuMTCyX4dRPmiKxSPtRZF+rCVCW7Q5vbQ5bd7mpds1FQ3Ci/50Rdx94qonI9AjPW9CAsMOWj8G9/48Eqo+S5wku7sMhP5Zxg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f172.google.com with SMTP id 71dfb90a1353d-56b49b943c1so354884e0c.2
        for <linux-renesas-soc@vger.kernel.org>; Wed, 18 Mar 2026 08:07:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773846448; x=1774451248;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=73LeJjEwTLLE4Vs26fAXvp+ddqR+qpQNawBkw/M6YWU=;
        b=ZDK5kpkcWgNAHHa/e0oqMFXPozWUN/To5pNh8ioD5jO8twkSgjuVQqWy0mdsHZrlK2
         +5AVKkkI5Lx8C5gC2Nph1/QAfqpsCZBeVH5KOWhd3vbh5kRXlc8Ba+spCFjXTGxEUJg9
         y/1UHMog2eaEH2z4+FvfR6w/EOU7RrOha5EqicdjrWBJ9m9+plAMqgDKiBRv4aqs49tQ
         qvS3OyejaLel+t3cRT26Y43BJHJ6MALXQgrIifsIxpClwDjSUl3aPWLwMpvW0SWXYRvu
         AKKuHVfzO64PFosfIDlAHF38ewAsE89xupcGlJ5xspb5D3WteUepvysWkJlbCyy2T5kk
         22vw==
X-Forwarded-Encrypted: i=1; AJvYcCVrco/sbf8U5SKFCiyreUJE0A1Yda8MNq2gxJ8NA8KhOih/4iPVFJ8x4nB6QDSS+ZIB2OQZRGXtqD/ZpMwQrdCwKg==@vger.kernel.org
X-Gm-Message-State: AOJu0Yx6hFAbvib9EvOxLxdG0v5tJu5HT4w9sKq4KUVIOZJ+hdFjTVM4
	EkUdXvWfO7bmz+NZ97QeWLBCpDVUKRsiZlwjTLhkZR89d14RebEBQcxTcYZRrXXnD+o=
X-Gm-Gg: ATEYQzzCBixTD2z7EM+UIyVAkPFaBdSnXCm9jsGr2tJKsy5ypZTKF0cBn421OiszGVt
	762Zk4hODftva2Ww1XdvEG5VCz0B+JnPMMMZCsf3Fzxpk9NGOnXIaImtu3hS8QOceOdbGr3D5TZ
	J47ysrLAV+xQ4FKFrmxBrXj6YmNOI3En50Fqq/Cb6KXCQWKFg/MD0k8gP8bt5LKp0LOLU7pI1s6
	hJjDuCxvVLUPut84TmmF4MABae5exoNpJqnHMX7XGBfZwqkHYZyl0HvjBx3xTCmecnqs2Nwacgo
	1ly+3+Bokup17mFRfrypgX+LYi178bk0PtQuJCpPk1uGFdWOEjirNbHnGdNOKqwx3skWUDhG/Qi
	7ym43n0G9sD6ICLxJ4Q+dNHurf/+o1ZNnd22Reu1iLB20L5doZZpiiJihn4A+k5SIs5z+jlIpv+
	VRcrusav7o61ofKh8h0iHbRPzwkm3gV8NPGWrtdorKEuXPAM0lKhwu7AjwlPqFzq2T
X-Received: by 2002:a05:6122:6991:b0:56a:fb7b:7528 with SMTP id 71dfb90a1353d-56ba71e45camr2215596e0c.13.1773846443502;
        Wed, 18 Mar 2026 08:07:23 -0700 (PDT)
Received: from mail-vk1-f170.google.com (mail-vk1-f170.google.com. [209.85.221.170])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-9510328f67dsm1501246241.4.2026.03.18.08.07.22
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 18 Mar 2026 08:07:23 -0700 (PDT)
Received: by mail-vk1-f170.google.com with SMTP id 71dfb90a1353d-56b49b943c1so354786e0c.2
        for <linux-renesas-soc@vger.kernel.org>; Wed, 18 Mar 2026 08:07:22 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCWNwDIEJgiHBY4FCt15tsPCOLV2f8TJY7OVj/wpp33wEL9zJi5BadLZePx/x3zOD+AjhDYGbYa6POBepFlcH+3aiA==@vger.kernel.org
X-Received: by 2002:a05:6122:134d:b0:56b:982f:1265 with SMTP id
 71dfb90a1353d-56ba7079b27mr2142947e0c.7.1773846442482; Wed, 18 Mar 2026
 08:07:22 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260318084151.122674-1-biju.das.jz@bp.renesas.com>
 <20260318084151.122674-5-biju.das.jz@bp.renesas.com> <CAMuHMdXmM-mGiuJmF9CSv5DkSDT17eJZPOP-y8SoE6OdhYdwBQ@mail.gmail.com>
In-Reply-To: <CAMuHMdXmM-mGiuJmF9CSv5DkSDT17eJZPOP-y8SoE6OdhYdwBQ@mail.gmail.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 18 Mar 2026 16:07:11 +0100
X-Gmail-Original-Message-ID: <CAMuHMdU=2i=cDYoYnWztMt2aBRHqfh_66E82LD0gR8baL4XRmQ@mail.gmail.com>
X-Gm-Features: AaiRm50hTSX-3ra7FH3b3E2dvjm1YgbyNHZb0fG6gXGXgf4WcB_o6nVGdJBlD5I
Message-ID: <CAMuHMdU=2i=cDYoYnWztMt2aBRHqfh_66E82LD0gR8baL4XRmQ@mail.gmail.com>
Subject: Re: [PATCH v5 4/9] clk: renesas: rzg2l-cpg: Re-enable critical module
 clocks during resume
To: Biju <biju.das.au@gmail.com>
Cc: Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Magnus Damm <magnus.damm@gmail.com>, Biju Das <biju.das.jz@bp.renesas.com>, 
	linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
	linux-clk@vger.kernel.org, 
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
X-Spamd-Result: default: False [0.04 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_CC(0.00)[baylibre.com,kernel.org,gmail.com,bp.renesas.com,vger.kernel.org];
	TAGGED_FROM(0.00)[bounces-29791-lists,linux-renesas-soc=lfdr.de];
	DMARC_NA(0.00)[linux-m68k.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	NEURAL_SPAM(0.00)[0.066];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[geert@linux-m68k.org,linux-renesas-soc@vger.kernel.org];
	MISSING_XM_UA(0.00)[];
	R_DKIM_NA(0.00)[];
	TAGGED_RCPT(0.00)[linux-renesas-soc];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,linux-m68k.org:email,mail.gmail.com:mid,renesas.com:email]
X-Rspamd-Queue-Id: 2C3E72BE352
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi Biju,

On Wed, 18 Mar 2026 at 15:54, Geert Uytterhoeven <geert@linux-m68k.org> wrote:
> On Wed, 18 Mar 2026 at 09:42, Biju <biju.das.au@gmail.com> wrote:
> > From: Biju Das <biju.das.jz@bp.renesas.com>
> >
> > After a suspend/resume cycle, critical module clocks may be left disabled
> > as the hardware state is not automatically restored. Unlike regular clocks
> > which are re-enabled by their respective drivers, critical clocks
> > (CLK_IS_CRITICAL) have no owning driver to restore them, so the CPG driver
> > must take responsibility for re-enabling them on resume.
> >
> > Introduce struct rzg2l_crit_clk_hw to track critical module clock hardware
> > entries in a singly-linked list anchored at crit_clk_hw_head in
> > rzg2l_cpg_priv. Populate the list during module clock registration by
> > checking for the CLK_IS_CRITICAL flag after clk_hw_register() succeeds.
> >
> > On resume, walk the list and re-enable any critical module clock that is
> > found to be disabled, before deasserting critical resets, ensuring the
> > correct clock-before-reset restore ordering.
> >
> > Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
>
> Thanks for your patch!
>
> > --- a/drivers/clk/renesas/rzg2l-cpg.c
> > +++ b/drivers/clk/renesas/rzg2l-cpg.c
> > @@ -130,6 +130,12 @@ struct div_hw_data {
> >         u32 width;
> >  };
> >
> > +/* Critical clk list  */
> > +struct rzg2l_crit_clk_hw {
> > +       struct clk_hw *hw;
> > +       struct rzg2l_crit_clk_hw *next;
> > +};
> > +
> >  #define to_div_hw_data(_hw)    container_of(_hw, struct div_hw_data, hw_data)
> >
> >  struct rzg2l_pll5_param {
> > @@ -168,6 +174,7 @@ struct rzg2l_pll5_mux_dsi_div_param {
> >   * @info: Pointer to platform data
> >   * @genpd: PM domain
> >   * @mux_dsi_div_params: pll5 mux and dsi div parameters
> > + * @crit_clk_hw_head: Head of the linked list critical clk entries
> >   */
> >  struct rzg2l_cpg_priv {
> >         struct reset_controller_dev rcdev;
> > @@ -186,8 +193,26 @@ struct rzg2l_cpg_priv {
> >         struct generic_pm_domain genpd;
> >
> >         struct rzg2l_pll5_mux_dsi_div_param mux_dsi_div_params;
> > +
> > +       struct rzg2l_crit_clk_hw *crit_clk_hw_head;
> >  };
> >
> > +static int rzg2l_cpg_add_crit_clk_hw_entry(struct rzg2l_cpg_priv *priv,
> > +                                          struct clk_hw *hw)
> > +{
> > +       struct rzg2l_crit_clk_hw *node;
> > +
> > +       node = devm_kzalloc(priv->dev, sizeof(*node), GFP_KERNEL);
>
> This ends up allocating quite some memory to store just a single
> clk_hw pointer.   Alternatively, you could use an array and size,
> and grow that using devm_krealloc().

Upon second thought, you already know how many there are upfront,
thanks to rzg2l_cpg_info.num_crit_mod_clks? You even already have an
array (but it's __initconst).

> Another alternative would be saving and restoring all clocks during
> suspend/resume, like renesas-cpg-mssr.c does.

Another alternative: rzg2l_mod_clock_init_mstop() already iterates
over all module clocks during resume, so it could be modified to also
force-enable all critical module clocks.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

