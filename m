Return-Path: <linux-renesas-soc+bounces-7335-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 85F0B931208
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 15 Jul 2024 12:12:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id AF0061C21AFA
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 15 Jul 2024 10:12:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0806E18733D;
	Mon, 15 Jul 2024 10:12:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="db8BJ6EA"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-qt1-f177.google.com (mail-qt1-f177.google.com [209.85.160.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 67A84172BA6;
	Mon, 15 Jul 2024 10:12:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721038350; cv=none; b=euKQhABS1Q2tpGndqU7HZfmEig4n8yP2XKCm35HBFiHbZG12svLDLbC8CBgOR4d27V8sR61jjl0OSIqbZNAcQhZ8ofzfxuFBywvDGd3g0l5h6QDCaJVPnosUmwu5p2w6wp4pibdbXnC7YgW+sWnLyf+EPJxR+3jtaBuSmiOAAyc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721038350; c=relaxed/simple;
	bh=0f6cEROmT1emVtV8ZMI/B4BlRTL4LJhiHSVAx0+Sw8E=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ZxYknScqR3iJ9d3C6EilmHcB9EkJWM+THTgsenBnTZx0WjKb+DHN2pjSbGNLPHxENQFW1ZvctX5p6PJ6UXadZHmnf+f1PMruVfDxJ+CiXb3CILalVcqfSdazw6BwrwIyXdAH/uFsICakNqzdnkl1Uwm/lpFcdj4IxVwRQ1c5B4g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=db8BJ6EA; arc=none smtp.client-ip=209.85.160.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qt1-f177.google.com with SMTP id d75a77b69052e-44931d9eda6so32892811cf.1;
        Mon, 15 Jul 2024 03:12:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1721038348; x=1721643148; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CDCoijj8kwySHqrFNdt8AGZ1d9iFth6FIUd56///NCk=;
        b=db8BJ6EAgCV5+4/CKa69FALA8DT8TtJXVMT62rtGJMw+7HIuTChOR1tgsAl9DQIqP3
         /ayMzv3QZ3phk/ZpSHpUn7uwP5+eOqZRv5jWecPp2uIF/SZmqLq4Uzm7c7XvEopcNFR6
         J4pAOyiMhDB8IJc6JYMzcodWu39px5EiY3pBVD4mGA/JNaUeUmUvCHkpZwTeGw7LOC+/
         2xpgAnjEhAeZ7GKyCIB7++pbiu2X/S/YyDY3AU9IXv5Mt3wID5V3ccRxpo5sURBROLBf
         Km75kWYVOQBFDCO0/HnV6MKFcCyInySJkx2oh2FuekIhM+/XJijTAbCQtjv8WK8XVge6
         Sd7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721038348; x=1721643148;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=CDCoijj8kwySHqrFNdt8AGZ1d9iFth6FIUd56///NCk=;
        b=CAmOlP4LKl3L+akhS+4hLxs19uBSi/7hu5r+zp3ljqnfCsrBCow+L6H71IRgHUJD+c
         KdfyFKfcdSoOYj0Xxu7KPD6chqq7E2Kl2MmO7+TDHK3Sw/COGPXQHsoU1MBuQe4Sl140
         heNXPOmntYRNWOFZ3YUzsvyWxpOKSKUgn8GjSB68Kazm2cbmiXM8uILnHfC1xaIYQXFo
         sZB6GH+Fif8NlFAYQdgh6EXrvcKpqydQCGevjnGLo76+HZ7Pwn7kMkJ7hT9AoUVw7uRl
         kDcWn6zxILZeekvL1k/YWoLyXvlvkwL/lCSM838FD78a9UDm6Q2kkoMSIO45vXUmIc7s
         E92g==
X-Forwarded-Encrypted: i=1; AJvYcCWIaN26jdyrbiU07mwaTmFvVoyq2J8fOkXMETbZTusA9a7qa4Nv+Zj1NrfZPiQkCUhiQVGQNotZmMVyZm0y6iBMYO2stOGvjV1YOCOzR/TRxCqoeRpHj1q9bRTi7cpihSveLjAjrUc/V00VowCZDpd5+8WP6pb8r17WzOyyDFj5R7TzHuNsgcIg4to=
X-Gm-Message-State: AOJu0Yx78xlIIhQvYNcFi8YsOh0aPBw/69oLGreijGjYDO+Bka+TXjkN
	w3DaHBHnKakYo8Q2cYaKf8bZm/SkfJ5fGeEfYX2F57Q4vOYaWfoJFC4padrcESM/mLveHAZXwHw
	WUyvc2R1ge8N9VqNdm/NBUUdJVJI=
X-Google-Smtp-Source: AGHT+IGF6iV9jAe6fy1QrrSt/KZAD1SXI9KKYjrwSB0dVaqM/NwGhJANFO9kSLXL+RXuHX3L4ed66xJ2Lqu8tsbefY4=
X-Received: by 2002:ac8:7f91:0:b0:447:e636:9ea4 with SMTP id
 d75a77b69052e-44e5c1f3efemr163027081cf.8.1721038348292; Mon, 15 Jul 2024
 03:12:28 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240628131021.177866-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20240628131021.177866-2-prabhakar.mahadev-lad.rj@bp.renesas.com> <CAMuHMdVd2k7WsPU9htW1LmDrjOgoQ1C8J=8i7ZAs7LS5XYBCXQ@mail.gmail.com>
In-Reply-To: <CAMuHMdVd2k7WsPU9htW1LmDrjOgoQ1C8J=8i7ZAs7LS5XYBCXQ@mail.gmail.com>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Mon, 15 Jul 2024 11:10:55 +0100
Message-ID: <CA+V-a8ujMhi+SCRXh0WgiVZqzO5CyFnoiKgqch9scfd-Eq0WwQ@mail.gmail.com>
Subject: Re: [PATCH 1/4] clk: renesas: rzg2l-cpg: Use devres API to register clocks
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, linux-clk@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
	Biju Das <biju.das.jz@bp.renesas.com>, 
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Geert,

Thank you for the review.

On Fri, Jul 12, 2024 at 2:55=E2=80=AFPM Geert Uytterhoeven <geert@linux-m68=
k.org> wrote:
>
> Hi Prabhakar,
>
> On Fri, Jun 28, 2024 at 3:11=E2=80=AFPM Prabhakar <prabhakar.csengg@gmail=
.com> wrote:
> > From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> >
> > We are using devres APIs for divider, mux and pll5 clocks so for
> > consistency use the devres APIs for module and PLL clocks.
> >
> > While at it switched to clk_hw_register() instead of clk_register()
> > as this has been marked as deprecated interface.
> >
> > Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
>
> Thanks for your patch!
>
> > --- a/drivers/clk/renesas/rzg2l-cpg.c
> > +++ b/drivers/clk/renesas/rzg2l-cpg.c
> > @@ -1023,6 +1023,7 @@ rzg2l_cpg_pll_clk_register(const struct cpg_core_=
clk *core,
> >         struct clk_init_data init;
> >         const char *parent_name;
> >         struct pll_clk *pll_clk;
> > +       int ret;
> >
> >         parent =3D clks[core->parent & 0xffff];
> >         if (IS_ERR(parent))
> > @@ -1045,7 +1046,11 @@ rzg2l_cpg_pll_clk_register(const struct cpg_core=
_clk *core,
> >         pll_clk->priv =3D priv;
> >         pll_clk->type =3D core->type;
> >
> > -       return clk_register(NULL, &pll_clk->hw);
> > +       ret =3D devm_clk_hw_register(dev, &pll_clk->hw);
> > +       if (ret)
> > +               return NULL;
>
> rzg2l_cpg_pll_clk_register() can return an ERR_PTR, so please
> propagate the error code.
>
Ok, I'll propagate the error.

Cheers,
Prabhakar

