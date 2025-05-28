Return-Path: <linux-renesas-soc+bounces-17614-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id C0E93AC6951
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 28 May 2025 14:32:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 4161C3AF477
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 28 May 2025 12:31:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 33841279789;
	Wed, 28 May 2025 12:32:01 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-ot1-f52.google.com (mail-ot1-f52.google.com [209.85.210.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EDA671E3DC8;
	Wed, 28 May 2025 12:31:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748435521; cv=none; b=GjDg2DGRUsEAvJpVuKa5n4+iv0jW9S4hv23GZ6or01ULqaV1S0ax1gJQn+0MdiuE0JrrR21qTvXQ+3XHcdcq4v94nq14kDxe5qV8A5jzaKC44EDH0zKJRraAaP3SF/Qtvx2sfZO/gppvYVV8r3O+tGaSbGNUqNEqP65FJ+HMkAI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748435521; c=relaxed/simple;
	bh=zEkV1uU//gbAAl5EyFZskc/S8PcbUkq6USUFR4LIc1U=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=D9IIfBXmY8+YNkjIFOzAx2nrRdlFr+kp7VnBZs9EXdobWrXP/j7Y4109jTkx8T8hJ/8h2ErcLss9L1AHOjt9os1lVncdRdCrR+dh8hInV1nQImXMWsMJa4K9KMkrPYk9vc5Ilq/eryByB8S2h6ijhN8PxQagacG4RVXMbjUowCY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.210.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ot1-f52.google.com with SMTP id 46e09a7af769-72ecc30903cso2124824a34.0;
        Wed, 28 May 2025 05:31:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748435517; x=1749040317;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=KUHS2p4Yrhb6D+Ze5aQXRwHv8Hsjiq07gFX0i1Aa/2E=;
        b=rFGdKjufzvxvcbZE4e10mZFZzB4ZF6XOZXY4t8tLnw/c4k0u9XirvsjgP/vcyKcjle
         ihQFFSQr1Qtjh4MxV9b/k81ccQi01tRvJXrW3ePhLf5vfSpdqHgpfWvMOzS+9AgKOzpb
         PHzEGS5ACjXLrkv2N6Y+PomrY3Ab4DlGZ3TlDbKsz1Vqh2LxqJcDSFkYjuKVBcoHzol5
         IM7eOvSp1gQ8GMVDHkx2KPSitdROFdTF7o8hAenSjKDTc0uQ1pQj8YuGuApWWa5Y7ppb
         1BWfLRP7bkkXbZmwxVr5+sQvwzpCkmL/GEnVHuTxCTEoV8UP0Ucl0ypQsrsCtWt2em2Z
         vYHg==
X-Forwarded-Encrypted: i=1; AJvYcCUB1sw/QzJ76PwJTSVflAVE9evIFOWOVNRT8laqAUcGhTObibGhZmJLFyalGScdZt4v0CwB/DnxMsIG/B9TqguB3Ns=@vger.kernel.org, AJvYcCW+9ZHIttlnxP69CmSL9jVX1FedZWjtLB42rSXTgUZsraMQMnl6n3FMaf3MX1gdupfr3ixn7t574Dd8LQoy@vger.kernel.org, AJvYcCW6Y5PM2I3ZitEY0+qRkKgUssv9uCIDcNrCqXY4fzDlEiNF1o5kdYLxFarQs9ZdMsonIvZHfsh8ENni@vger.kernel.org, AJvYcCX+bGsC/qS7BMRuFcVVQnQsXG73e1KLjPlus/uGYmxEFumvRVSgEOKh9TCe1mrR7juxfCwA1AydfV5R@vger.kernel.org
X-Gm-Message-State: AOJu0Ywb8acI3qBIYcyN4jnhoTmA0ymCwKGMHA1m3KEacrgiJcxMReBI
	DZQDQG70Ba23SeYNMiYwXvFGrn1+SrPLkHl4SWmrk4wgTF6mv7OfBOM1PWwgCP3R
X-Gm-Gg: ASbGnct4x2pylQZ9rnrnI6zU1l27NZLdRwY6NJatdw0CkWY526qhBrlAFG+puKVnw3J
	WwoPkmIc78jw7tuNya7k/M4r5VOd9HpgDPhhVrJmI5FzGPlWPz6xWT+r9GJAWwOC8v6XyuwLieb
	GMDRWR4FVFoXOYKV+M7MZnhFTw9NmfijgV2RSHF+RTg8N7L1f2M7ZyxqeyaVedHoXPj4QTM61AO
	Lc1Z3PYoKEXxhO6s7BOLnpAKUGxAyiWJBzAiiVI2FlvI3ChSeRVUw6c7XgEWRfmNnXMiBMnuc2O
	l1rH1zdjd/z+e1+SLKk8WY8bqcX1tCq8PlUxPNUOdxlxyIn5eJ0UVGgs8oW3Z0L4WIGQ6p3dLrk
	nyK3F4qS7o/fwjHzXiA==
X-Google-Smtp-Source: AGHT+IEDMZzyfOMPlNzg7lx0D57OR0NCvzKxaCAjNuHqYIaj8NmEH61YJT6F1kojh5TpFIulWeutXA==
X-Received: by 2002:a05:6830:b8b:b0:72b:9cb4:acf with SMTP id 46e09a7af769-7355d194491mr10828925a34.25.1748435517279;
        Wed, 28 May 2025 05:31:57 -0700 (PDT)
Received: from mail-oi1-f178.google.com (mail-oi1-f178.google.com. [209.85.167.178])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-735a1bb5276sm166912a34.30.2025.05.28.05.31.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 28 May 2025 05:31:56 -0700 (PDT)
Received: by mail-oi1-f178.google.com with SMTP id 5614622812f47-3feb0db95e6so2372958b6e.1;
        Wed, 28 May 2025 05:31:56 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUKF3MpTmne15d1MUF9wrASTSiKKm4iHjlByCA5sMFeQZuSHxmar6txZWH45nGzPLxpCduPopYxefl6@vger.kernel.org, AJvYcCUL+ccugzcXi963hknQTSqrIq3qFBx3gJEG1Xz5SBAe4f6iPyRigOnXgNi58AVONBeziKHtabgP4bNFIzsq@vger.kernel.org, AJvYcCUo0NRv/4rN7QbyHJMeBZnLMqgE9HjjDF9ahagpfpn8Bdi2G2HCWEU9whXhiWw+nh05EEUQtX8EAfXR@vger.kernel.org, AJvYcCXhK8dbGANfXToZjxrKIoZS9XesY56JbZXOx70E2OolkH6D8CAmstfholayG3gwu5QcA92xu3W29EhGKRyh9iKYWfM=@vger.kernel.org
X-Received: by 2002:a05:6808:680a:b0:406:692e:d678 with SMTP id
 5614622812f47-406692ed990mr412088b6e.22.1748435516651; Wed, 28 May 2025
 05:31:56 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250512184302.241417-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20250512184302.241417-5-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <CAMuHMdX5_P4R43HOPuZc3JSAOQ5O2xOBDVhVVg1SxU1ucPdbPA@mail.gmail.com> <CA+V-a8sde6Zaz3Z2uDt3OGZ52UBJfR3vQMs4-ZUusDu=oNwFhg@mail.gmail.com>
In-Reply-To: <CA+V-a8sde6Zaz3Z2uDt3OGZ52UBJfR3vQMs4-ZUusDu=oNwFhg@mail.gmail.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 28 May 2025 14:31:44 +0200
X-Gmail-Original-Message-ID: <CAMuHMdXSbEWVpMbDx7UC3Zn3YteZLCdJ=kOOakE38k1TeTxKqA@mail.gmail.com>
X-Gm-Features: AX0GCFvVYyRF-qqhinpZ-10VhZ1hJFI-N7-tDZlIlkbT7TO9C3UrFM6heC0l3I0
Message-ID: <CAMuHMdXSbEWVpMbDx7UC3Zn3YteZLCdJ=kOOakE38k1TeTxKqA@mail.gmail.com>
Subject: Re: [PATCH v5 4/4] drm: renesas: rz-du: mipi_dsi: Add support for
 RZ/V2H(P) SoC
To: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Cc: Fabrizio Castro <fabrizio.castro.jz@renesas.com>, Andrzej Hajda <andrzej.hajda@intel.com>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
	Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, Jonas Karlman <jonas@kwiboo.se>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, David Airlie <airlied@gmail.com>, 
	Simona Vetter <simona@ffwll.ch>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
	Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Biju Das <biju.das.jz@bp.renesas.com>, Magnus Damm <magnus.damm@gmail.com>, 
	dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
	linux-clk@vger.kernel.org, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Prabhakar,

On Wed, 28 May 2025 at 11:48, Lad, Prabhakar <prabhakar.csengg@gmail.com> w=
rote:
> On Fri, May 23, 2025 at 4:19=E2=80=AFPM Geert Uytterhoeven <geert@linux-m=
68k.org> wrote:
> > On Mon, 12 May 2025 at 20:43, Prabhakar <prabhakar.csengg@gmail.com> wr=
ote:
> > > From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> > >
> > > Add DSI support for Renesas RZ/V2H(P) SoC.
> > >
> > > Co-developed-by: Fabrizio Castro <fabrizio.castro.jz@renesas.com>
> > > Signed-off-by: Fabrizio Castro <fabrizio.castro.jz@renesas.com>
> > > Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com=
>
> >
> > Thanks for your patch!
> >
> > > --- a/drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c
> > > +++ b/drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c

> > > @@ -47,6 +52,11 @@ struct rzg2l_mipi_dsi_hw_info {
> > >         u8 features;
> > >  };
> > >
> > > +struct rzv2h_dsi_mode_calc {
> > > +       unsigned long mode_freq;
> > > +       u64 mode_freq_hz;
> >
> > Interesting... I guess mode_freq is not in Hz?
> >
> Actually it is int Hz, I will make it unsigned long.

I really meant the first member.
As rzv2h_dphy_mode_clk_check() does "mode_freq_hz =3D mode_freq * MILLI",
mode_freq may be in kHz?

> > > +};

> > > @@ -308,6 +479,158 @@ static int rzg2l_dphy_conf_clks(struct rzg2l_mi=
pi_dsi *dsi, unsigned long mode_f
> > >         return 0;
> > >  }
> > >
> > > +static unsigned int rzv2h_dphy_mode_clk_check(struct rzg2l_mipi_dsi =
*dsi,
> > > +                                             unsigned long mode_freq=
)
> > > +{
> > > +       struct rzv2h_plldsi_parameters *dsi_parameters =3D &dsi->dsi_=
parameters;
> > > +       u64 hsfreq_millihz, mode_freq_hz, mode_freq_millihz;
> > > +       struct rzv2h_plldsi_parameters cpg_dsi_parameters;
> > > +       unsigned int bpp, i;
> > > +
> > > +       bpp =3D mipi_dsi_pixel_format_to_bpp(dsi->format);
> > > +
> > > +       for (i =3D 0; i < 10; i +=3D 1) {
> > > +               unsigned long hsfreq;
> > > +               bool parameters_found;
> > > +
> > > +               mode_freq_hz =3D mode_freq * MILLI + i;
> >
> > KILO?
> >
> OK, as mode_freq_hz is in Hz I'll make it unsigned long.

I am not sure if "unsigned long" is OK. Is mode_freq in kHz?
What is its largest value?

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k=
.org

In personal conversations with technical people, I call myself a hacker. Bu=
t
when I'm talking to journalists I just say "programmer" or something like t=
hat.
                                -- Linus Torvalds

