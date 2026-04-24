Return-Path: <linux-renesas-soc+bounces-31612-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id GJM8GNgX62niIQAAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-31612-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 24 Apr 2026 09:12:24 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 80A8245A92B
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 24 Apr 2026 09:12:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id A420D3002521
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 24 Apr 2026 07:12:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2E12D364055;
	Fri, 24 Apr 2026 07:12:18 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-vk1-f179.google.com (mail-vk1-f179.google.com [209.85.221.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BCE52361DA9
	for <linux-renesas-soc@vger.kernel.org>; Fri, 24 Apr 2026 07:12:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777014737; cv=none; b=K52jNlNDTKWmaITxafn/eesVzTbxDAcrM1uV5W88UNd8tMCb5/tZIX2Z6WoDsFyV1gm13O8fL0EwJ0IHpwaDIYP7rgAWmOTo7I5jD0UXIEbKRQW23hXW0CRUEr9yHfGp7JUUSXl5pRUlormObJS5Tmg+/WwU8qSe18b2FOXA3DM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777014737; c=relaxed/simple;
	bh=lSGAKaU7dLaHDMsb0z3MFEKF4bRnqGKcSkr3JOxtmVE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ob+/ab+naNsbAt6lioNb2ot0z60knO30eSj2L4p1us5I9KTYeP5EYfNjEozgGYc7VVH8cXgn2V+4AJNjZIDZYkb2qLQXxcv/nKFTMWflFPd+tmcoxmaAegjuD+mDZ/STbRMaOvDemXftY8JRQoBC9+pALzsTu1jXpAhUNkyegw4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f179.google.com with SMTP id 71dfb90a1353d-56f6afbd205so3668901e0c.0
        for <linux-renesas-soc@vger.kernel.org>; Fri, 24 Apr 2026 00:12:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777014733; x=1777619533;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=n6+i5A73RZ2qhxuAxeEZqEE/dhPNDUVEKhpkvB0Nw1g=;
        b=VBW2wDSKMjmA/QZS962W+tAT453Dk7hoX4cvqLY+8H1A/Z2IYVFSLvDnXy3+b6nVGw
         a1bEmp2qx4Xqzasq6ZqsplrfLBS71ymAjbq/mh47svAuQ82G51+yO8MnguCGJdFWJ5T0
         P74jlq9VtgdBElM11MD3npdUfZkP0zwWb1/ebBo/OA22jcXzYYvYY3MnTQ8TqEvDstKl
         AHYhpjlha4Z+cd1CICoaVTckHRXBV/uIFiSqq4S8b/61Jg35CNDtWUZr/h9UMgIole0Z
         mSoQ9sEbAgXPqfJjlECkyvk5WMITuDYiFAun8lRuT3k2+kNG27CdXhdJJBTFEUcuJLHQ
         33sw==
X-Forwarded-Encrypted: i=1; AFNElJ/IBdhTZRa0EDapjgHGW/VHuP03YFzSsw5jBePAtMcRZXgx7mu7Bk7G7SQYQXHwUNaaxt6lzUxGcmMpXu2iHk7lmQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YxU+yaJNguUMuJFF9IAkS4WOe/dbMxvAj0r8wx1ZxKbVz8jdCQi
	OSEv0xGd3eLUozDxb1sYEAaLc77C0Eui+E0ydmbeiW3CcVsMsLoMNgpkxBBIIYc4uEk=
X-Gm-Gg: AeBDietqok2YaTUeN8slgcYxL6hlBBoVfXd47aCkUSLHM2ds349YX4yw17rrzFE2NDf
	p3mmJ8zud0IPibNqUGJD1tDPPMDfpK4fEd0P4B8O+OubalUTw+sl8EObT3Yn+uSaADikElPLAAq
	9zvmYaKdPFgxEcmUaOa8sW/6EnAAb3m+lgBZPgYNUrjo8kaGwAu7da6xzRYo+DSkbYaP8gA6m+B
	NeEvKauQdE/UcIBV7D3IfVpBdUIZyguU5fxXCoAR6xF++LBR5mX2T7BqyTBplma220ZGN6fJ1fZ
	+TpoHfRzHKE3q1x/ThZANPhbVrh4AWM3GKpWSHORIyzeOZ0SOY7lPqENiXHnjjwCGDybtrhFpfp
	ICbd5ujLA6ieI2ITsRpD8v7tD/vc9feR0ISyCrzjNXUnhWzOip/4bTxvPV5XNPpLa5NyaWNGUTa
	qZ7Zu87zGzOWBxWKEpfe4ZW7vmkCtVSB+0n8KJf9Xg6MJYnb08T2ztYOomNlKNHuSmnjNmpO8=
X-Received: by 2002:a05:6122:130c:b0:56f:a0c1:2517 with SMTP id 71dfb90a1353d-56fa67104e9mr10513082e0c.8.1777014733238;
        Fri, 24 Apr 2026 00:12:13 -0700 (PDT)
Received: from mail-vs1-f42.google.com (mail-vs1-f42.google.com. [209.85.217.42])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-56fa91bf90fsm12919752e0c.1.2026.04.24.00.12.11
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 24 Apr 2026 00:12:12 -0700 (PDT)
Received: by mail-vs1-f42.google.com with SMTP id ada2fe7eead31-6058a955e04so4770296137.0
        for <linux-renesas-soc@vger.kernel.org>; Fri, 24 Apr 2026 00:12:11 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ+dvLOE+mDaboY7Z9ugiRjZsZuYXQXP5mdM+r+v1+fQjhXsuytonW/a6N4uqcjv+j9YGDIOtT+/fYaktP4cKLCGkQ==@vger.kernel.org
X-Received: by 2002:a05:6102:6a85:b0:607:ccde:5c00 with SMTP id
 ada2fe7eead31-616feb7be9cmr11083342137.21.1777014731492; Fri, 24 Apr 2026
 00:12:11 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260326110648.29389-1-biju.das.jz@bp.renesas.com>
 <20260326110648.29389-3-biju.das.jz@bp.renesas.com> <CAMuHMdUAdDAzRVkn6yOnTuN8nMWHwQsmfSncYu-0g=0KzUXbhA@mail.gmail.com>
In-Reply-To: <CAMuHMdUAdDAzRVkn6yOnTuN8nMWHwQsmfSncYu-0g=0KzUXbhA@mail.gmail.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 24 Apr 2026 09:12:00 +0200
X-Gmail-Original-Message-ID: <CAMuHMdW6rNkAw_00-y9YpPbNXFqj_WwBJ6uRyhZ_8pN+Qi3-5A@mail.gmail.com>
X-Gm-Features: AQROBzD65BVtIboRiBum4VXZdf2VNpeEWLRBzAMwGtHsfEBCf7CLYD3n0C1TddA
Message-ID: <CAMuHMdW6rNkAw_00-y9YpPbNXFqj_WwBJ6uRyhZ_8pN+Qi3-5A@mail.gmail.com>
Subject: Re: [PATCH v5 2/4] clk: renesas: rzg2l: Add support for enabling PLLs
To: Biju <biju.das.au@gmail.com>
Cc: Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Biju Das <biju.das.jz@bp.renesas.com>, linux-renesas-soc@vger.kernel.org, 
	linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
X-Rspamd-Queue-Id: 80A8245A92B
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.04 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-31612-lists,linux-renesas-soc=lfdr.de];
	DMARC_NA(0.00)[linux-m68k.org];
	FREEMAIL_TO(0.00)[gmail.com];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[geert@linux-m68k.org,linux-renesas-soc@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	NEURAL_HAM(-0.00)[-0.998];
	RCPT_COUNT_SEVEN(0.00)[8];
	R_DKIM_NA(0.00)[];
	TAGGED_RCPT(0.00)[linux-renesas-soc];
	DBL_BLOCKED_OPENRESOLVER(0.00)[glider.be:email,linux-m68k.org:email,renesas.com:email,mail.gmail.com:mid,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns]

On Thu, 23 Apr 2026 at 11:37, Geert Uytterhoeven <geert@linux-m68k.org> wrote:
> On Thu, 26 Mar 2026 at 12:06, Biju <biju.das.au@gmail.com> wrote:
> > From: Biju Das <biju.das.jz@bp.renesas.com>
> >
> > Add support for enabling PLL clocks in the RZ/G3L CPG driver to turn off
> > some PLLs, if they are not in use(eg: PLL6, PLL7)
> >
> > Introduce `is_enabled` and `enable` callbacks to handle PLL state
> > transitions. With the `enable` callback, PLL will be turned ON only when
> > the PLL consumer device is enabled; otherwise, it will remain off. Define
> > new macros for PLL standby and monitor registers to facilitate this
> > process.
> >
> > Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>

> > --- a/drivers/clk/renesas/rzg2l-cpg.c
> > +++ b/drivers/clk/renesas/rzg2l-cpg.c

> > +static int rzg3l_cpg_pll_clk_endisable(struct clk_hw *hw, bool enable)
> > +{
> > +       struct pll_clk *pll_clk = to_pll(hw);
> > +       struct rzg2l_cpg_priv *priv = pll_clk->priv;
> > +       u32 stby_offset, mon_offset;
> > +       u32 val, mon_val;
> > +       int ret;
> > +
> > +       stby_offset = RZG3L_PLL_STBY_OFFSET(pll_clk->conf);
> > +       mon_offset = RZG3L_PLL_MON_OFFSET(pll_clk->conf);
> > +
> > +       if (enable) {
> > +               val = RZG3L_PLL_STBY_RESETB_WEN | RZG3L_PLL_STBY_RESETB;
> > +               mon_val = RZG3L_PLL_MON_RESETB | RZG3L_PLL_MON_LOCK;
> > +       } else {
> > +               val = RZG3L_PLL_STBY_RESETB_WEN;
> > +               mon_val = 0;
> > +       }
> > +
> > +       writel(val, priv->base + stby_offset);
> > +
> > +       /* ensure PLL is in normal/stanby mode */
>
> standby.
>
> > +       ret = readl_poll_timeout_atomic(priv->base + mon_offset, val, mon_val ==
> > +                                       (val & (RZG3L_PLL_MON_RESETB | RZG3L_PLL_MON_LOCK)),
> > +                                       10, 100);
> > +       if (ret)
> > +               dev_err(priv->dev, "Failed to %s PLL 0x%x/%pC\n", enable ?
> > +                       "enable" : "disable", stby_offset, hw->clk);
> > +
> > +       return ret;
> > +}
>
> With the typo fixed:
> Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Thanks, will queue in renesas-clk for v7.2.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

