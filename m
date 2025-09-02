Return-Path: <linux-renesas-soc+bounces-21221-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 322F5B40B6D
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  2 Sep 2025 19:00:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id B84F47B0C84
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  2 Sep 2025 16:59:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 802281FF7D7;
	Tue,  2 Sep 2025 17:00:47 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-vs1-f52.google.com (mail-vs1-f52.google.com [209.85.217.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C1ED32F764;
	Tue,  2 Sep 2025 17:00:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756832447; cv=none; b=j8elCeWhvJl+5m9CbE8M4PWblpkduLCUNmU/kyHgxVS5bvfVb9AErK444HiK1RKfbb3FwVRAgUrFDsY4d4HW3Xj3esLJqbtpaHTju4by0qFdMGPZTrerdUydw8CNpQIOkRnjkJIaB+xC9zngh/+e9HnI7h4k/kv+jMtmf9KX9SE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756832447; c=relaxed/simple;
	bh=WRsMHmhXqGsmM4kWsV4wVzY5UVDRDLLjWq4/ek/cz4Y=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=pbY8ki2JbA+os5uDZlf+l4oH4gKhq89O3pvmHIB3AkqzeIcxkM/BwRMzyuNG/OwCpZamstc41QCKgMkC7Ny3d+snUFUYZcPW3YOfcPqPabD1DR7IHKR9DX/x/jT5AwfO4bNrjZ3boUAP2oCyJFJWZi716q2IupAYG2khqi0NLdc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.217.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vs1-f52.google.com with SMTP id ada2fe7eead31-528d157a48cso53202137.0;
        Tue, 02 Sep 2025 10:00:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756832444; x=1757437244;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+IIbb4Kxr6vABBj8KflFZaHYqNvqMJQkXYgeJLB0z2Y=;
        b=eD+ftFJe2chPNHlu1OYlgMvIXTtmUevW/QO8qbfusQ3rcsRctywRtcoHrYTkH8j+8K
         CXYA/ifWdPxp0Sx+0ZozCsQK2WXGtVPQXBDF7POF/MlIUedUjTASr5LMFHLR0Ag2tE+H
         +uPi/QpxW7lJ7ywzCs/4Z2sxM7yYE3+QTF8IKBxV+qsKKZo12h4jJ8IL3Ypa+2nyXi9h
         hCIyR01hgBzKR3hbOQbrn8YHd3Oyj67LqP66DXtViwzwagtBylMP932Y9KZ9lqbLer/B
         B86H6z8N4L0NaGIr1gt3So4ryiF0jbHzFYJ2WDhGLB2sexVRBrd9DZtFH+cUOG7vrHU5
         pOcQ==
X-Forwarded-Encrypted: i=1; AJvYcCU408aS+0cv0IvI6qB5AfH0zyxLFvTkSes1PpxNH9Msafb9Y8KKjFca2R6RgxRZw6BjZlIwEE9BhWPOZNri@vger.kernel.org, AJvYcCXia7qSwqY0OZ5qFDSPZJdpO5hQepp9wKmAIKoSCTNtBZICN0CSrb9JjptdxkKPuGBsigYmL0sbuN6rw/bHgv8hy/0=@vger.kernel.org, AJvYcCXn2Yax2d16r2vxCTUY7bcwjN7g0vDTqWDVSoM+tfFaFcAVjiwwXImDQEaPqMTMG+H5NP1ErEUnhg0=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy3HYOZwMIfnpUn/vvKxNhhm8fD+7FeiZu+Tn4++C8UNZTdZSO7
	XqP5EZ1ieWK2GC8Lgv4swpluE8c88TCRxttaH2I7KDQgSGgtAm7wQE+Chea0vpOu
X-Gm-Gg: ASbGncsaEqXGGEcvK35qTUBHhIw9pmuD4FO8/ygvziuYXqOTHVRcL8OjnC3enfvCl0Q
	XAJy3H6SlLS75Ubuq27zDlynf13L71CN85pprPi7ajN20mpRrZMjQKIco+ftkKCP601V3INSAcS
	m+VqEylzXvYg2kNoa3FXpDMIQuImIbdxdJ+OGuZdJonWAgFUtyaAZEPSEvwN1eKzDpo4GveRSWU
	GheqvK8DlSKVDLGv5MuM38NkpMiPMxB+9nI9jdHdp0fPuPzE5ZN1MwXji5oG/yR/C+KiIeHPmaw
	vytRDCO8b3eY99XUadHPU0noEt0NupcZenQ6NglvYisrUXXQnjwvtT14vI+GPZhMZw2yoycoMC4
	yQhsXVmsAGd2AR3hh7ga7MCfqFTIswutrIHcPinWjEF+wExXNEdaeMyia4GxZ
X-Google-Smtp-Source: AGHT+IHj5eWkBCwN9DUhESBm0Ly+9ulbGEK4WneRLIIGFfY4mZw+laQL/d7MvhmKIDwT4HXSkI3Bbg==
X-Received: by 2002:a05:6102:3225:b0:519:534a:6c37 with SMTP id ada2fe7eead31-52aedf065d6mr3492509137.15.1756832443834;
        Tue, 02 Sep 2025 10:00:43 -0700 (PDT)
Received: from mail-ua1-f44.google.com (mail-ua1-f44.google.com. [209.85.222.44])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-894e1d08c79sm4659533241.6.2025.09.02.10.00.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 02 Sep 2025 10:00:43 -0700 (PDT)
Received: by mail-ua1-f44.google.com with SMTP id a1e0cc1a2514c-8960a3fb405so72658241.1;
        Tue, 02 Sep 2025 10:00:43 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCWSuWu2DKHYrKaOHyJUWZFpGRHRs54oaTKgE1SN7F6e+M+SQdi4B7MLOxkuRStx/YqWVwDfmVTY5eKb7Vxr00ZyLVY=@vger.kernel.org, AJvYcCX5ngGcIt7/V8+IH459m7rw9CaT/3Ty6nP7WtjyuK/4i9jqU+2/cU6mB/3f1D4Mzad/tpmvc9nUyfjSjrSu@vger.kernel.org, AJvYcCXsuHMHUO5nkpUsY0AX7M9/cLvWUKci5ejrDRfb96dLkyGXBND1QAh7Vvi6G+GRIU/vgXSR0mmkXkc=@vger.kernel.org
X-Received: by 2002:a05:6102:6213:20b0:4fb:fbdb:283c with SMTP id
 ada2fe7eead31-52aedbfdacemr4081486137.13.1756832443404; Tue, 02 Sep 2025
 10:00:43 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250820100428.233913-1-tommaso.merciai.xr@bp.renesas.com>
 <20250820100428.233913-3-tommaso.merciai.xr@bp.renesas.com>
 <CAMuHMdU_grYXJF_L77-6np9iiVGvo52Z7TXN=ft97BuPX2BGxQ@mail.gmail.com>
 <aLb2Zh3ENS6B_ik4@tom-desktop> <CAMuHMdXUm4c0RSQ=pOz9dC7cuHA2STJaQ_d4ded9-rw3orcyGA@mail.gmail.com>
 <aLb-dAiVgFk1LsXR@tom-desktop>
In-Reply-To: <aLb-dAiVgFk1LsXR@tom-desktop>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 2 Sep 2025 19:00:32 +0200
X-Gmail-Original-Message-ID: <CAMuHMdVHFh6JAB=EBBnDRnHva7nZHFm7u8eC5EYRyZ0j08bi9A@mail.gmail.com>
X-Gm-Features: Ac12FXywJ5a7TpJylnbYGlvHsgQxeormH376V7ZHaNCDAGEahugK1DxdfEa1WvM
Message-ID: <CAMuHMdVHFh6JAB=EBBnDRnHva7nZHFm7u8eC5EYRyZ0j08bi9A@mail.gmail.com>
Subject: Re: [PATCH 2/4] clk: renesas: rzg2l: Re-assert reset on deassert timeout
To: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
Cc: tomm.merciai@gmail.com, linux-renesas-soc@vger.kernel.org, 
	biju.das.jz@bp.renesas.com, Michael Turquette <mturquette@baylibre.com>, 
	Stephen Boyd <sboyd@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>, linux-clk@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Tommaso,

On Tue, 2 Sept 2025 at 16:26, Tommaso Merciai
<tommaso.merciai.xr@bp.renesas.com> wrote:
> On Tue, Sep 02, 2025 at 04:16:12PM +0200, Geert Uytterhoeven wrote:
> > On Tue, 2 Sept 2025 at 15:51, Tommaso Merciai
> > <tommaso.merciai.xr@bp.renesas.com> wrote:
> > > On Tue, Sep 02, 2025 at 02:18:17PM +0200, Geert Uytterhoeven wrote:
> > > > On Wed, 20 Aug 2025 at 12:05, Tommaso Merciai
> > > > <tommaso.merciai.xr@bp.renesas.com> wrote:
> > > > > Prevent issues during reset deassertion by re-asserting the reset=
 if a
> > > > > timeout occurs when trying to deassert. This ensures the reset li=
ne is in a
> > > > > known state and improves reliability for hardware that may not im=
mediately
> > > > > clear the reset monitor bit.
> > > > >
> > > > > Signed-off-by: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com=
>
> > > >
> > > > > --- a/drivers/clk/renesas/rzg2l-cpg.c
> > > > > +++ b/drivers/clk/renesas/rzg2l-cpg.c
> > > > > @@ -1667,9 +1667,16 @@ static int __rzg2l_cpg_assert(struct reset=
_controller_dev *rcdev,
> > > > >                 return 0;
> > > > >         }
> > > > >
> > > > > -       return readl_poll_timeout_atomic(priv->base + reg, value,
> > > > > -                                        assert ? (value & mask) =
: !(value & mask),
> > > > > -                                        10, 200);
> > > > > +       ret =3D readl_poll_timeout_atomic(priv->base + reg, value=
,
> > > > > +                                       assert ? (value & mask) :=
 !(value & mask),
> > > > > +                                       10, 200);
> > > > > +       if (ret && !assert) {
> > > > > +               dev_warn(rcdev->dev, "deassert timeout, re-assert=
ing reset id %ld\n", id);
> > > > > +               value =3D mask << 16;
> > > > > +               writel(value, priv->base + CLK_RST_R(info->resets=
[id].off));
> > > > > +       }
> > > >
> > > > Is this an issue you've seen during actual use?
> > > > Would it make sense to print warnings on assertion timeouts, too?
> > >
> > > I haven=E2=80=99t observed any assertion timeout issues during actual=
 use,
> > > so maybe printing warnings on assertion may not be necessary.
> > > What do you think?
> >
> > Have you seen deassertion timeouts?
>
> I haven=E2=80=99t seen any deassertion timeouts either.
>
> > I would rather not print a warning.  The error code would be propagated
> > up anyway.
>
> If for you is ok.
> I will drop dev_warn() on both:
>
>         - __rzg2l_cpg_assert()
>         - __rzv2h_cpg_assert()
>
> in v2.
> Please gently le me know.

Please drop dev_warn() on both. Thanks!

Gr{oetje,eeting}s,

                        Geert

--=20
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k=
.org

In personal conversations with technical people, I call myself a hacker. Bu=
t
when I'm talking to journalists I just say "programmer" or something like t=
hat.
                                -- Linus Torvalds

