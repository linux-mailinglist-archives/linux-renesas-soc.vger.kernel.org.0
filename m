Return-Path: <linux-renesas-soc+bounces-28586-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 0IeEHkfkoWmUwwQAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-28586-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 27 Feb 2026 19:36:55 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id CFE7B1BC0AD
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 27 Feb 2026 19:36:54 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 3474B3061E32
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 27 Feb 2026 18:36:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 94FAF392C28;
	Fri, 27 Feb 2026 18:36:52 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-vk1-f178.google.com (mail-vk1-f178.google.com [209.85.221.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4ECA935A382
	for <linux-renesas-soc@vger.kernel.org>; Fri, 27 Feb 2026 18:36:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772217412; cv=none; b=ftVJQ1mc+nPBpsCYv1TA1oMeCmwduzlW7Z+gxvNY3cQUNwZme/+DbKCnxoSC2xg8ZpouKNCo/mIdwDyrva816dzOo6pSVhkNqljiF5n1P4hDrTCQXKu6Lf7+2mVakrnIKg5x1JiUhyQO1/Z4ObAo84i829K1QG8Je9vEIuUjlUY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772217412; c=relaxed/simple;
	bh=8ZyYUZqdYO9RtAGZXJ34dn6k/pDj0jGAodzQsrEhkvY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=HK4zxDFrdd6qljTgbRPyNJOJ2xNx+ldXg9XekWsdORDXYKw0PEOTfeBYPBLnkWTBs8qw0K+qNhKqK3WbmvlMKqlKQEV2OSU2Lsx0HqPcMYNs58vXpOVcQ7sO8+rTx1283tHr3aoeAx8W5Vcs40neEzFSG8WT+r+422YTBEcpRSs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f178.google.com with SMTP id 71dfb90a1353d-56a88bfd4e3so1731609e0c.3
        for <linux-renesas-soc@vger.kernel.org>; Fri, 27 Feb 2026 10:36:51 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772217410; x=1772822210;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Qcd8Oic1Sc8ZJu2YAJkZaSOQYT6Z1q9h1yoGvFgoj60=;
        b=AQHDyxN9FYJ1o60M6ujbhGz9cQ0JUF8qmFi1MUOsRB9BoPqPVkJk6od3EbtsBdS93t
         Gcl0TxVqnDJTF/ie5Bv9Qbk8qAqv8VRU3Pvmw57G4CuGrR/UyZD4iLAXUs7sGGssq54T
         QEJtTlAmshdkQaaF+TyzdvjdWH8SCXmgJ+B+3S21ghu+t0hC4a6nQv1E1aiNuvjlV4uM
         GhNdDToYjqpf+wzI4oQLM3G0+PCNTayIh7Mk30fr+psR86f7FRIfjqiGy+r5XO0l/sJp
         7GRuQzg4VMT2lomAHmZl4QKERbLAjhRDn9Q1gvm73J3P6DAui1mtSiWQwh5MThAwmWEm
         wDOA==
X-Forwarded-Encrypted: i=1; AJvYcCUWn9seBty2cBGzq6YcxMhbL9tFrF+7ONa5b6N63nro6c4zeVFOrBfx98MSKPk02V6sYfIqtEQYhjOkcmE4zXcL9A==@vger.kernel.org
X-Gm-Message-State: AOJu0YwhPj1c/WVLmsUYa69O+qVKhlMKlKA4F2wyKHCVwmwv4bXsk+l7
	MGxWPS79ZrLGJa3z5tydwEptWkKykab+S/C20fyWgzoSHIoD9vmE9mYXK8GaEBqZEqI=
X-Gm-Gg: ATEYQzyY+ooV9HQwbwldQQE+ipD3FpWQ/g4mY+v5y22Vsz38GzvE6Ir8JH+D6FBmno7
	oBG9db4EmaRgAkqYVoFdH2AqFVl0vStg3gaom1ODrU9SkupP4PBH1K/QxMFFp51cWCzPnPKh12Z
	ygyU44xtArAosR6n0wNlBn3evZJCQPlcvyk+tNc7m9rhXG1+UaHSVhxq+A9XYtU5/qCLx0qkmrG
	Hov533ypby+pWw5l5rSSXms+9YbO6yvASkkoAfshgom6+Eu93VA/TeWdXhYdqSZNx7KeNoVRyKo
	T2R7zvXNAu0NVOa/Hbr1P2gpNlzWSBbRLmQZsWDL1RCplD0bHTg09kBuNNUTkbq2axIIVF8pB8I
	tP6uXJQdQ8CPKf54VPDZo+OwIG4UDFjLC9NkGneTKkZdRiBlvJnyJz4wCOQrbCDEL0qWBAl5oyF
	sw/6TutvVu7Ij7FnQFO6TczO5NJCp7Ldp6pN/NsBJ4XuMRBIgybuEWlSUZnBrwkyu8
X-Received: by 2002:a05:6122:3116:b0:563:667f:9f98 with SMTP id 71dfb90a1353d-56aa0a8f49emr2110145e0c.9.1772217410180;
        Fri, 27 Feb 2026 10:36:50 -0800 (PST)
Received: from mail-vk1-f174.google.com (mail-vk1-f174.google.com. [209.85.221.174])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-56a91b8c96fsm7461567e0c.2.2026.02.27.10.36.49
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 27 Feb 2026 10:36:49 -0800 (PST)
Received: by mail-vk1-f174.google.com with SMTP id 71dfb90a1353d-5675d609621so2207345e0c.2
        for <linux-renesas-soc@vger.kernel.org>; Fri, 27 Feb 2026 10:36:49 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCWoh1s3kSuS0BFpk9vbhA57RAFOFnD7ucAh7pRBqizVM00yIBZJ4dawEe82/fihi9JVnYi1TDZij9n+OllXeNHK0A==@vger.kernel.org
X-Received: by 2002:a05:6102:3ed6:b0:5f8:e2eb:43d with SMTP id
 ada2fe7eead31-5ff32331547mr2540585137.10.1772216995065; Fri, 27 Feb 2026
 10:29:55 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <cover.1770996493.git.tommaso.merciai.xr@bp.renesas.com>
 <53c8d9e7fde7b176e05503a72af81e74c7a8a1c1.1770996493.git.tommaso.merciai.xr@bp.renesas.com>
 <CAMuHMdVAf=GyDR95BFD0Q3Wbjo5n5vnqSsfue=7fRWxs6=Hdgg@mail.gmail.com> <aaHTMGQHZwutlBIv@tom-desktop>
In-Reply-To: <aaHTMGQHZwutlBIv@tom-desktop>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 27 Feb 2026 19:29:44 +0100
X-Gmail-Original-Message-ID: <CAMuHMdVs1L-eRLDkGWx58WbwzjD-+yFxxNLLbrQ=kzQ7_P9y0w@mail.gmail.com>
X-Gm-Features: AaiRm50fiYKFClgCr0aKEdOOuTixihvNu690WG65tXaKE8BtTScAymOURaJQ5yg
Message-ID: <CAMuHMdVs1L-eRLDkGWx58WbwzjD-+yFxxNLLbrQ=kzQ7_P9y0w@mail.gmail.com>
Subject: Re: [PATCH v5 01/20] clk: renesas: rzv2h: Add PLLDSI clk mux support
To: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
Cc: tomm.merciai@gmail.com, laurent.pinchart@ideasonboard.com, 
	linux-renesas-soc@vger.kernel.org, biju.das.jz@bp.renesas.com, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, Michael Turquette <mturquette@baylibre.com>, 
	Stephen Boyd <sboyd@kernel.org>, Magnus Damm <magnus.damm@gmail.com>, 
	Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>, dri-devel@lists.freedesktop.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-clk@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.04 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[gmail.com,ideasonboard.com,vger.kernel.org,bp.renesas.com,ffwll.ch,linux.intel.com,kernel.org,suse.de,glider.be,baylibre.com,lists.freedesktop.org];
	TAGGED_FROM(0.00)[bounces-28586-lists,linux-renesas-soc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DMARC_NA(0.00)[linux-m68k.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[22];
	MIME_TRACE(0.00)[0:+];
	MISSING_XM_UA(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[geert@linux-m68k.org,linux-renesas-soc@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	NEURAL_HAM(-0.00)[-0.946];
	TAGGED_RCPT(0.00)[linux-renesas-soc,dt,renesas];
	R_DKIM_NA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,mail.gmail.com:mid,renesas.com:email,linux-m68k.org:email,init.name:url]
X-Rspamd-Queue-Id: CFE7B1BC0AD
X-Rspamd-Action: no action

Hi Tommaso,

On Fri, 27 Feb 2026 at 18:24, Tommaso Merciai
<tommaso.merciai.xr@bp.renesas.com> wrote:
> On Fri, Feb 27, 2026 at 11:47:58AM +0100, Geert Uytterhoeven wrote:
> > On Fri, 13 Feb 2026 at 17:28, Tommaso Merciai
> > <tommaso.merciai.xr@bp.renesas.com> wrote:
> > > Add PLLDSI clk mux support to select PLLDSI clock from different clock
> > > sources.
> > >
> > > Introduce the DEF_PLLDSI_SMUX() macro to define these muxes and register
> > > them in the clock driver.
> > >
> > > Extend the determine_rate callback to calculate and propagate PLL
> > > parameters via rzv2h_get_pll_dtable_pars() when LVDS output is selected,
> > > using a new helper function rzv2h_cpg_plldsi_smux_lvds_determine_rate().
> > >
> > > The CLK_SMUX2_DSI{0,1}_CLK clock multiplexers select between two paths
> > > with different duty cycles:
> > >
> > > - CDIV7_DSIx_CLK (LVDS path, parent index 0): asymmetric H/L=4/3 duty (4/7)
> > > - CSDIV_DSIx (DSI/RGB path, parent index 1): symmetric 50% duty (1/2)
> > >
> > > Implement rzv2h_cpg_plldsi_smux_{get,set}_duty_cycle clock operations to
> > > allow the DRM driver to query and configure the appropriate clock path
> > > based on the required output duty cycle.
> > >
> > > Signed-off-by: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
> >
> > Thanks for your patch!
> >
> > > --- a/drivers/clk/renesas/rzv2h-cpg.c
> > > +++ b/drivers/clk/renesas/rzv2h-cpg.c

> > > +       clk_hw_data = devm_kzalloc(priv->dev, sizeof(*clk_hw_data), GFP_KERNEL);
> > > +       if (!clk_hw_data)
> > > +               return ERR_PTR(-ENOMEM);
> > > +
> > > +       clk_hw_data->priv = priv;
> > > +
> > > +       init.name = core->name;
> > > +       init.ops = &rzv2h_cpg_plldsi_smux_ops;
> > > +       init.flags = core->flag;
> > > +       init.parent_names = core->parent_names;
> > > +       init.num_parents = core->num_parents;
> > > +
> > > +       clk_hw_data->mux.reg = priv->base + smux.offset;
> > > +
> > > +       clk_hw_data->mux.shift = smux.shift;
> > > +       clk_hw_data->mux.mask = smux.width;
> >
> > Again, smux.width is not a mask.
> > Perhaps GENMASK_U16(smux.shift - 1, 0)?
>
> Or maybe we can use:
>
>         clk_hw_data->mux.mask = clk_div_mask(smux.width);
> ?

Thanks, I forgot about clk_div_mask(), which is definitely a better
choice here.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

