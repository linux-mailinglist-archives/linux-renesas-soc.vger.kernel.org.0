Return-Path: <linux-renesas-soc+bounces-24887-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id CA260C750AE
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 20 Nov 2025 16:39:42 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id DFAE44EF2C7
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 20 Nov 2025 15:26:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0B74D361DC3;
	Thu, 20 Nov 2025 15:19:05 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-vk1-f178.google.com (mail-vk1-f178.google.com [209.85.221.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EECE9369210
	for <linux-renesas-soc@vger.kernel.org>; Thu, 20 Nov 2025 15:19:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763651944; cv=none; b=YYBX9PUSxxekSpRsqika8vmg351JeINyLdQ4EdwTY6ujS1OYhf30TZ78/AU0DwG0DR9zhXo9dJhpwVDq6LcMMc6ZNKaABNbdsLh5LpMwl/g3RAo9/bapEHBaIUSMOopCDlnYKeza00Z/lAiKN06vOZ0KRpYnuT/1E+8N5Av5EQk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763651944; c=relaxed/simple;
	bh=x0YfausT0dtVh0geJfG+pdQ/lVBO/GpRPd2bsgRYwxw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=MkMj5Ukvett7Cx9PaDcPlhQJpBnstDeO5l+ANL9U9NlJpYrNA6To7a9xMUddYlRJlPd+kp7SC/CJqFyZeCWiC3iFFirn6njGyO+X2lGMwuP2C7mbV1NbGe4p+rHXHns/5YCIOA/V3MJq8IdDB4U4qVVXfxQRHl+IqOiaABX80Go=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f178.google.com with SMTP id 71dfb90a1353d-55ab217bb5eso132872e0c.3
        for <linux-renesas-soc@vger.kernel.org>; Thu, 20 Nov 2025 07:19:02 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763651941; x=1764256741;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Ub9l6qBIoXlIUbnmglQ/dhIf5gsVEoXOGghpcNa1o2o=;
        b=K5CElZ0M1ZuGBItu3zqwBRJUv3p/nX+igsaHZG8A/3QWN8nd/kRB2RpYi5nD7AfP6E
         j5hedLLaw1PKL/9/PCRsJj3AwwI8vI2YYpoPZmjFq1mhIuASWep00Tn9YtP8nhWeke/i
         k78boYvOi5L142ZikWsmdf4SYxHwHgE8muw9K/wH+9dh78FmS1MTrqqjDldAifeZh/Du
         j2XPD4Z8TWuIY6fleFeNQ2CQP/PzvHGueINrAvaJRbAzmStIZj6c+quC2NVTEA5tWici
         R7nPUUtQjotpSMQ3xM6ElzFQMn/YWNE1eGvNStE6mxSx1j6cS9ZqsVcP9mpeJWoqJy0S
         uTDA==
X-Forwarded-Encrypted: i=1; AJvYcCVT7lH/H7qcN8rgiSm/tKRBZmVkaF6v3T7mY+i8NFQkQFunQ682sWiXFZ/sLq5TNz7AaTIZ0s1PzNwrRxVI6ZsXzw==@vger.kernel.org
X-Gm-Message-State: AOJu0YxiKMKGJj6L0283ZwpZw2aswjdi+IeqlFRmEhBTK3BICS1ISZWN
	C0DnS8psZNfbKs9sPub7Zi+NZXDzuHAB4UNxBCe3p+3UTyacuvf7scivfGonrf7U
X-Gm-Gg: ASbGncvG4B1JgDt7n9U/sXq2cz/S7iUg2hHf9FrEh/kKodlwlXMin98khvuUvhlWn6X
	STTLlaGggGPuvGaVybdmCRzbAtM+BUGY0+W/QIXOc6uK93PuBYjccuhTp+wvv2PyWrbDi/QgvpP
	yFqNeQoxzdNssoXVvlu3uSCG0F/3tmFuarIAYheX90LxpypYT60WaFCKw7Ao5YQldPQFLNsusj2
	/rwYkpy7NtnXSBbaFlRfVsJLnLtgcfsh/+QcFP8j70ynbfCRIk8why0WmbIcyNdHJwUIMSsLSXl
	0HMHRHBn7FWiyQAW+vN6hLqpRLGmH5D0d22QwyXbfl2lizPtXNMA8WQ+5yr2LYLQEF2kOWGaNvF
	u0NHgDgBHuAsxCkeibGsJLt02lHn5IIALd+svKRj8XPaAuiNTxGWNUxHJ433irJFxNuBhrBBLDh
	vu66QmzcZ5XaNFQ68hQh38P8KwUni80zubOdC7KtQXK9srfsO/TKZg
X-Google-Smtp-Source: AGHT+IE1FXZOVIUMYnxbaiQNm+Ig3y40XSoR4GQrq1pfl66e64DiqvDbwbV5dJj6Tr9CmpUu4mvdZA==
X-Received: by 2002:a05:6122:3c52:b0:557:16bd:4e52 with SMTP id 71dfb90a1353d-55b832a5fd7mr739381e0c.6.1763651941289;
        Thu, 20 Nov 2025 07:19:01 -0800 (PST)
Received: from mail-vs1-f50.google.com (mail-vs1-f50.google.com. [209.85.217.50])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-55b7f7749f3sm1109908e0c.11.2025.11.20.07.19.00
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 20 Nov 2025 07:19:00 -0800 (PST)
Received: by mail-vs1-f50.google.com with SMTP id ada2fe7eead31-5dd6fbe50c0so430402137.2
        for <linux-renesas-soc@vger.kernel.org>; Thu, 20 Nov 2025 07:19:00 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCUwxdfWqaQuJTGDciu6vVw4l1XscfQi8AnAIgcDz5isi6iLDu53OuCUjY2CKyjYl0H+1E6/OeqaUmW4Gc6jXde7TQ==@vger.kernel.org
X-Received: by 2002:a05:6102:50ac:b0:5df:b507:acc4 with SMTP id
 ada2fe7eead31-5e1c81dd242mr686147137.15.1763651940149; Thu, 20 Nov 2025
 07:19:00 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251119022744.1599235-1-chris.brandt@renesas.com>
 <20251119022744.1599235-2-chris.brandt@renesas.com> <20251120094743.48a0db4ead55c3968cb0cb3d@hugovil.com>
In-Reply-To: <20251120094743.48a0db4ead55c3968cb0cb3d@hugovil.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 20 Nov 2025 16:18:49 +0100
X-Gmail-Original-Message-ID: <CAMuHMdWeZsrE=pVroosOg6y-pjsE9CqyoBi5P_Ja5kZ0fgbY4w@mail.gmail.com>
X-Gm-Features: AWmQ_bk9X-7xje-hq15MNOmoQx3jV91rBDyxVCLaD3AFsFSCe_bv9qxDdxdRCY8
Message-ID: <CAMuHMdWeZsrE=pVroosOg6y-pjsE9CqyoBi5P_Ja5kZ0fgbY4w@mail.gmail.com>
Subject: Re: [PATCH v5 1/2] clk: renesas: rzg2l: Remove DSI clock rate restrictions
To: Hugo Villeneuve <hugo@hugovil.com>
Cc: Chris Brandt <chris.brandt@renesas.com>, Michael Turquette <mturquette@baylibre.com>, 
	Stephen Boyd <sboyd@kernel.org>, Biju Das <biju.das.jz@bp.renesas.com>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Hien Huynh <hien.huynh.px@renesas.com>, Nghia Vo <nghia.vo.zn@renesas.com>, 
	linux-renesas-soc@vger.kernel.org, linux-clk@vger.kernel.org, 
	dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="UTF-8"

Hi Hugo,

On Thu, 20 Nov 2025 at 15:47, Hugo Villeneuve <hugo@hugovil.com> wrote:
> On Tue, 18 Nov 2025 21:27:43 -0500
> Chris Brandt <chris.brandt@renesas.com> wrote:
> > Convert the limited MIPI clock calculations to a full range of settings
> > based on math including H/W limitation validation.
> > Since the required DSI division setting must be specified from external
> > sources before calculations, expose a new API to set it.
> >
> > Signed-off-by: Chris Brandt <chris.brandt@renesas.com>
> > Reviewed-by: Biju Das <biju.das.jz@bp.renesas.com>
> > Tested-by: Biju Das <biju.das.jz@bp.renesas.com>

> > --- a/include/linux/clk/renesas.h
> > +++ b/include/linux/clk/renesas.h
> > @@ -16,6 +16,11 @@ struct device;
> >  struct device_node;
> >  struct generic_pm_domain;
> >
> > +enum {
> > +     PLL5_TARGET_DPI,
> > +     PLL5_TARGET_DSI
> > +};
> > +
> >  void cpg_mstp_add_clk_domain(struct device_node *np);
> >  #ifdef CONFIG_CLK_RENESAS_CPG_MSTP
> >  int cpg_mstp_attach_dev(struct generic_pm_domain *unused, struct device *dev);
> > @@ -32,4 +37,11 @@ void cpg_mssr_detach_dev(struct generic_pm_domain *unused, struct device *dev);
> >  #define cpg_mssr_attach_dev  NULL
> >  #define cpg_mssr_detach_dev  NULL
> >  #endif
> > +
> > +#ifdef CONFIG_CLK_RZG2L
> > +void rzg2l_cpg_dsi_div_set_divider(u8 divider, int target);
> > +#else
> > +static inline void rzg2l_cpg_dsi_div_set_divider(u8, int target) { }
>
> Maybe use:
>
> #define rzg2l_cpg_dsi_div_set_divider(...) do { } while (0)

I assume you are saying this in the context of the kernel test robot's
report?

Static inline functions offer more safety. Just s/u8/u8 divider/ should
fix the W=1 issue.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

