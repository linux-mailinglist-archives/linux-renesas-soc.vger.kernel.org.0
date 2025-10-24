Return-Path: <linux-renesas-soc+bounces-23569-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 724A9C04B9F
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 24 Oct 2025 09:31:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 5CCA24E31FC
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 24 Oct 2025 07:31:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4E9FF2E22BF;
	Fri, 24 Oct 2025 07:31:52 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-qt1-f181.google.com (mail-qt1-f181.google.com [209.85.160.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 74DAD2C3251
	for <linux-renesas-soc@vger.kernel.org>; Fri, 24 Oct 2025 07:31:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761291112; cv=none; b=t6QmWk9rQAfJO8l4rrMw10GurjrvDYh9WCgJvphsPGH1bE8rg7I718n44fxuidC4WJZkCw5Ld2RaTJ03zWbxDissEAI8duNKVew4qaemSSWdoizmv1yJ7hL2H8/hrKPq6kUShGL0xJ3AfVwspjfgHTtxrLMbWjM1yfqRhh9GMHQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761291112; c=relaxed/simple;
	bh=TYYDo+7DxkUKjmm+P+3sxJh+gjqzjUwg71o/dX7xBWQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=W8VQW1xpcS8GiDh2wXS6/hLXN6sqnHI5+flZ2+CkeqEpcT9x3KGZW8Hcd44NSUC/WdnO5vm+4blmTNnP2tGQ3wT3EG1D76j2cAlmPT3+6aq4PJ4ERjaxkxBkn9vJmbdhnczqr0xNdTIGmCK1xWlefWAnFj5PMGkYWceDb9xhEjc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.160.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qt1-f181.google.com with SMTP id d75a77b69052e-4e89d4f0e8bso16263601cf.1
        for <linux-renesas-soc@vger.kernel.org>; Fri, 24 Oct 2025 00:31:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761291109; x=1761895909;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=O3WV+VoszRFKObS+2w1jR5z8x4F6hvRxXouyKsJGXVw=;
        b=A808AeVL8uBtmaqV65LyJJo/NbFnzd6tve3pROREp4IoIvvnTiYpgYZIhGTIh5OhsW
         SSLhSaYtJIJiUgSOZZwG+RKbIhiTj85Eyx6Gbaf3qJ9y4ULVqMCfcFMpk5/bZj3pKP7f
         08Mqcpu9WkRTcEBWHIZX9YMk/wV2RkCgbPjMPyBerqXSC5TuQdChVFD0r0H3vaOF/KbJ
         XidOzSxgMaZzGAyIOr/MiKAyGI4SmEm5f2SBWs5NNsYutosMQaA5OWabXKGxxx29QTJi
         291D3xouPzy3KajfjTFghHNiQP7cD8c/KqFKApYo6upZWKPNYRcgef04no6bjBE8YIuo
         Z0Ww==
X-Forwarded-Encrypted: i=1; AJvYcCWSy5Y9f6Y2grWN12X0lfNZrgjFslabus/iXq0Gcas1xoI9augON4Q9DlVAclKRshO/UAy9+8f589e3uEABZomM2w==@vger.kernel.org
X-Gm-Message-State: AOJu0YzIrgtMtBiDI9miIqO3XKxBUxvllJVTWlPIrYgpfVLIAu3ZkPMR
	lhVMY9y330pUBQkHdnyoOnhmhXxrNa3q92gUHTmZvJczF7KueiMqej1/gXAzvxyl
X-Gm-Gg: ASbGnctZNU8XlopWlP2d0kUCZPnJbwKEExaS8XHHrt+2vbndN1xFv6oBUjRUVU8XakY
	lCeSDXbnZSv5GhL0JWdRezoNtHs8MFYXPwylxuAUbLgc3cicizwwfkyV8BnSDisf0QGmu5YCMO3
	7arGYSbkMrcuwBBH+EoSDGKepU4ecG0knVNiyjsNWrj8XarWyXbRFjwiEJrgvL7oW5+GSQqyCaj
	ycJ0C37/W+lEOGb9YnkYzob5hahzjbTwYeQLPk4PttloIqpbVe6CZR4vYP5ib7IkFFp7Whx23yw
	9wp+Fvw4XrNMmiJMcgfp74KlWcQ5NXxoEoXRfQn/vO4JGOUDIp4pCUN92va7nVXagIpcx6BTwds
	59rr9mHu19/UKNMdxMqzR8s8fXEk9t3KqUXpV8S1ARnTuTuiOaUK7YUnAhq8H4OVgF2QnfzAaHe
	BQ/vE4xmHe/nqiJjTynl+mEXYCs0FravcsCiBOoC1C6A==
X-Google-Smtp-Source: AGHT+IGkXnNHKZ+Tk0f607Rbul/drTlrIGZ+qs3ENZpRQ1gxGfzegducY/ydWO92D3jyfOwq22WHwA==
X-Received: by 2002:a05:622a:392:b0:4b0:6205:d22b with SMTP id d75a77b69052e-4eb9436029bmr14691301cf.52.1761291109147;
        Fri, 24 Oct 2025 00:31:49 -0700 (PDT)
Received: from mail-qt1-f175.google.com (mail-qt1-f175.google.com. [209.85.160.175])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-89c0e688d64sm331605885a.21.2025.10.24.00.31.48
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 24 Oct 2025 00:31:48 -0700 (PDT)
Received: by mail-qt1-f175.google.com with SMTP id d75a77b69052e-4e89d4f0e8bso16263481cf.1
        for <linux-renesas-soc@vger.kernel.org>; Fri, 24 Oct 2025 00:31:48 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCXSK7FclyGpUFa91iUtCIhhqyK6Kt9/kZ4EQTyYTPKOZGuONmvGAbyuQyWbKqyX3meGhZocH5Moe62f+nXhrvcb9A==@vger.kernel.org
X-Received: by 2002:a05:6102:3581:b0:5d7:dec5:a464 with SMTP id
 ada2fe7eead31-5db3f8bbd6dmr232329137.10.1761290676888; Fri, 24 Oct 2025
 00:24:36 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251020080648.13452-1-herve.codina@bootlin.com>
 <20251020080648.13452-8-herve.codina@bootlin.com> <CAMuHMdV03D_3b_JA2vzW4tE_QbkkT1bN1dm+zLLLX24oDHMj0Q@mail.gmail.com>
 <20251022150339.4c48649e@bootlin.com> <CAMuHMdWY=FbO6YG1jrd0OWfrpPpBzrqmBVcWnw7TnnsKPGgr8A@mail.gmail.com>
 <20251023152048.0e70a362@bootlin.com>
In-Reply-To: <20251023152048.0e70a362@bootlin.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 24 Oct 2025 09:24:25 +0200
X-Gmail-Original-Message-ID: <CAMuHMdX=_6MGgti2NEL6FaChBhefFLBdjeam5Zts3+Yf-Ps3Gg@mail.gmail.com>
X-Gm-Features: AWmQ_bkc6C0U89yGzgj449WFrjiYqIBguZky57fXbpHAfhiWelGeFgRG-a9YogQ
Message-ID: <CAMuHMdX=_6MGgti2NEL6FaChBhefFLBdjeam5Zts3+Yf-Ps3Gg@mail.gmail.com>
Subject: Re: [PATCH v5 7/8] soc: renesas: Add support for Renesas RZ/N1 GPIO
 Interrupt Multiplexer
To: Herve Codina <herve.codina@bootlin.com>
Cc: Thomas Gleixner <tglx@linutronix.de>, Wolfram Sang <wsa+renesas@sang-engineering.com>, 
	Hoan Tran <hoan@os.amperecomputing.com>, Linus Walleij <linus.walleij@linaro.org>, 
	Bartosz Golaszewski <brgl@bgdev.pl>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Magnus Damm <magnus.damm@gmail.com>, Saravana Kannan <saravanak@google.com>, 
	Serge Semin <fancer.lancer@gmail.com>, Phil Edworthy <phil.edworthy@renesas.com>, 
	linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
	Pascal Eberhard <pascal.eberhard@se.com>, Miquel Raynal <miquel.raynal@bootlin.com>, 
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Herv=C3=A9,

On Thu, 23 Oct 2025 at 15:21, Herve Codina <herve.codina@bootlin.com> wrote=
:
> On Thu, 23 Oct 2025 13:30:53 +0200
> Geert Uytterhoeven <geert@linux-m68k.org> wrote:
> > > I have in mind a use case that can lead to a non-contiguous mapping.
> > >
> > > The RZ/N1 SoC embeds a Cortex-M3 CPU. This CPU can use GPIOs and
> > > some of them for interrupt purpose. In that case, those GPIOs have
> > > to be routed to the interrupt line expected by the Cortex-M3.
> > >
> > > And so, we have some interrupts reserved for CPUs running Linux and
> > > some others for the Cortex-M3.
> > >
> > > Among those reserved interrupts may some are not used.
> > >
> > > for instance:
> > >   Interrupt 103, 102: Reserved and used by Linux
> > >   Interrupt 103: Reserved for Linux but not used -> Hole in the mappi=
ng
> > >   Interrupt 104: Reserved and used my Cortex-M3 (need to be routed by=
 Linux)
> >
> > 102 does not seem to  be correct?
>
> My bad, my example was wrong.
>    Interrupt 103, 104: Reserved and used by Linux
>    Interrupt 105: Reserved for Linux but not used -> Hole in the mapping
>    Interrupt 106: Reserved and used my Cortex-M3 (need to be routed by Li=
nux)

OK, much better!

> > > I don't know if this use case is relevant but I think we should be to=
o restrictive
> > > on the mapping and so accept holes.
> > >
> > > With that in mind, I let you confirm that you still prefer to have a =
mapping
> > > without any holes. A future patch to support that is always possible.
> >
> > While that would indeed be a non-discontiguous mapping, I do not see ho=
w
> > it is related to rzn1_irqmux_output_lines[] in the driver.  That array
> > would still contain the same contiguous values 103..110, right?
>
> The array rzn1_irqmux_output_lines is still contiguous yes but the mappin=
g
> defined in irq-map property no.
>
> Looking back again at your proposal, indeed I can remove the following lo=
op:
>         for (i =3D 0; i < output_lines_count; i++) {
>                if (parent_args->args[1] =3D=3D output_lines[i])
>                        return i;
>         }
>
> With just
>         if (parent_args->args[1] >=3D RZN1_IRQMUX_SPI_BASE &&
>             parent_args->args[1] < RZN1_IRQMUX_SPI_BASE + RZN1_IRQMUX_NUM=
_IRQS) {
>                 return parent_args->args[1] - RZN1_IRQMUX_SPI_BASE;
>
>         dev_err(dev, "Invalid GIC interrupt %u\n", parent_args->args[1]);
>         return -EINVAL;

Good. I like simpler code ;-)

BTW, please invert the logic, i.e. bail out early in case of error.

> > Sorry, I haven't been following the development of this driver that
> > closely (RZ/N1 is completely different from e.g. R-Car, and I never
> > had access to an RZ/N1 platform), so perhaps I am missing something.
> > Why does the user have to specify an interrupt-map in DT? Can't the
> > driver create the mapping dynamically, based actual usage of the
> > GPIOs? I.e. the first 8 GPIOs that ask for interrupt functionality
> > receive it, and are mapped to an available GIC interrupt?
> > I believe this is how rzg2l-irqc works, mapping up to 32 GPIO interrupt=
s
> > to 32 GIC (TINT) interrupts.
>
> I think the main difference with rzg2l-irqc is that the RZ/N1 irq mux is
> clearly not an interrupt controller.
>
> It is just a mux with 96 inputs (GPIO lines coming from several GPIO
> controller) and 8 outputs (connected to the GIC).
>
> It is represented as an interrupt nexus node and has an interrupt-map pro=
perty.
> to describe the routing.
>
> The interrupt-map property cannot be dynamically created.
>
> Also, the routing is necessary even if the related GPIO is not used by Li=
nux.
> This GPIO can be used as a GPIO input interrupt line by the Cortex M3.
>
> If the irq mux driver performs the routing only on Linux GPIO usage, it w=
ill
> not route GPIOs depending on Cortex M3 internal usage.

Thanks, makes sense!

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

