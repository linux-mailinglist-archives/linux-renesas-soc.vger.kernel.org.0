Return-Path: <linux-renesas-soc+bounces-10020-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 954909ADF5F
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 24 Oct 2024 10:43:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 0DD21B213EC
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 24 Oct 2024 08:43:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6E64616C6A1;
	Thu, 24 Oct 2024 08:43:39 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-yb1-f170.google.com (mail-yb1-f170.google.com [209.85.219.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8733223CB;
	Thu, 24 Oct 2024 08:43:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729759419; cv=none; b=AyEnYKxHQ991ijFw0HV41Fw4shZcaMt5Zj5DfRE5KLCgRA+YQn8jYl+eD96kLooe8BGSkrDBJ0SGCJ7ELv+tu/Sqo/aXKgFk/UK2gX3z7IYi+SvsPEu9/GjcmfsoqQfVj3OfSu4egX/bB2FNETEv6hM67CBKrFHrxVD8b/QEr3I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729759419; c=relaxed/simple;
	bh=jQ83AzUv/DC8tU0P+N4GjoXN80FxENOn+WqCZHMMxiI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=PvePStFpB7rgIPl5G8eKzwfNhiLX/3hAICbzzPPc2YIR6ovhy2g08H6DhooS7VkFlc8chdobsZwUDL4kpv00R5mZM3ggqAoMXJwLzejJgKr25B0x0TVNHuoeSBqy19LSzXoQ3zCZXLNoo0e1mNFCUTch9dc59WgzTHK70Z0IZhI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.219.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yb1-f170.google.com with SMTP id 3f1490d57ef6-e28fd83b5bbso732867276.0;
        Thu, 24 Oct 2024 01:43:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729759414; x=1730364214;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0EdHvJaPlIyM5TMupEvLhPEXXyn9Awd20txGlqEPek4=;
        b=p4rYbYJ0HppQrdoy48eabnCxis+QUcFRlte7PYLUV9XVY9nODLtNEzgUYyhiThAp71
         hWa9g3W7/AsLwrButUhDVQjHXIMOc57IA4/U9VuxefmFO6PWjGoFsmr3p4CYOqn9EFqG
         AIFWI5ywMkPwhMLwQB6IVMPAZWmjpXfVQR1pc+K6d2l0srwYiLp/m0DEqob1o7Bn2CMf
         YcBN417zFvhV/iTXzsRbslm2T7+jnkd1HQGOxQwZSYiIXcwvj60HCS5XPISvjx1ml159
         MG7CRlgGWHDN9fSTY+q5kcTU50cSxRIGKL+mxW4AtTLxx5XKQWe8vnWc05CbWGjPMEkl
         M+uQ==
X-Forwarded-Encrypted: i=1; AJvYcCV8kUFaQ+eZClcbOdjRSnfWA6hi0KzHHSPiJvz+mCuqKH6DKjiqqAhO4MXKCFrzMuKqhTYvaUFTIT6uqLA=@vger.kernel.org, AJvYcCXpFmQwWhAZO0XkbH72iTgMEAKamqCthd4m8j96hkpzMLbmm5qZoNLPn+bjb1Wo6SLDyeoR/7MoDTLvc1zE9Ou8Qlk=@vger.kernel.org
X-Gm-Message-State: AOJu0YyyBW6mFITu+U24dCC1HY4rWSB73tSmp8hpnKWVBbt9Y/l6BfOd
	25mRoJanQQAlGq4k4Qh18FDF3taa5tWzpqEg8oM5BbSyILkKEk0lnjhmkHN4
X-Google-Smtp-Source: AGHT+IHH44HVf6UumnATwUziyNnkrEDuGYM5rVTEwjkef/+ZrLRxhEOYgNuQO8l7ifjtPP56m+oQRw==
X-Received: by 2002:a05:690c:e21:b0:6e2:a129:1623 with SMTP id 00721157ae682-6e7f0fc11dfmr58907447b3.38.1729759414131;
        Thu, 24 Oct 2024 01:43:34 -0700 (PDT)
Received: from mail-yw1-f170.google.com (mail-yw1-f170.google.com. [209.85.128.170])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-6e5f5ad18adsm18807107b3.67.2024.10.24.01.43.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 24 Oct 2024 01:43:32 -0700 (PDT)
Received: by mail-yw1-f170.google.com with SMTP id 00721157ae682-6e38fc62b9fso5970047b3.2;
        Thu, 24 Oct 2024 01:43:32 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUgrSrWKpYLWEqA8W1ioal7NmYlDfMHiAZlU1a1/c5jmCpwEemcjlm+iDQsLE6upkl+P7S6PXISQ7181J0=@vger.kernel.org, AJvYcCXaZmw639uKFm8/AQPEKjxXvxZkOVivOD7CO4Vq/1d72l4YyQTcIQUzpHuZoUjW6BQ8Y1S4fwuxglBeicOneLW25Hg=@vger.kernel.org
X-Received: by 2002:a05:690c:30e:b0:6c7:a120:e0ec with SMTP id
 00721157ae682-6e7f0e445acmr58794887b3.22.1729759412579; Thu, 24 Oct 2024
 01:43:32 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241009230817.798582-1-fabrizio.castro.jz@renesas.com> <20241009230817.798582-3-fabrizio.castro.jz@renesas.com>
In-Reply-To: <20241009230817.798582-3-fabrizio.castro.jz@renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 24 Oct 2024 10:43:20 +0200
X-Gmail-Original-Message-ID: <CAMuHMdXxJhQ2Ra+PiR-UUv1HhL69Zpva2b-N9KygSMKUApHdwQ@mail.gmail.com>
Message-ID: <CAMuHMdXxJhQ2Ra+PiR-UUv1HhL69Zpva2b-N9KygSMKUApHdwQ@mail.gmail.com>
Subject: Re: [PATCH v3 2/3] irqchip: Add RZ/V2H(P) Interrupt Control Unit
 (ICU) driver
To: Fabrizio Castro <fabrizio.castro.jz@renesas.com>
Cc: Thomas Gleixner <tglx@linutronix.de>, Philipp Zabel <p.zabel@pengutronix.de>, 
	Magnus Damm <magnus.damm@gmail.com>, linux-kernel@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org, 
	Chris Paterson <Chris.Paterson2@renesas.com>, Biju Das <biju.das.jz@bp.renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Fabrizio,

On Thu, Oct 10, 2024 at 1:08=E2=80=AFAM Fabrizio Castro
<fabrizio.castro.jz@renesas.com> wrote:
> Add driver for the Renesas RZ/V2H(P) Interrupt Control Unit (ICU).
>
> This driver supports the external interrupts NMI, IRQn, and TINTn.
>
> Signed-off-by: Fabrizio Castro <fabrizio.castro.jz@renesas.com>
> ---
>
> v2->v3:
> * Reworked line breaks
> * Improved performance of rzv2h_icu_eoi
> * Replaced raw_spin_lock with guards
> * Improved the style of rzv2h_icu_domain_ops
> * Removed put_device from the successful path of rzv2h_icu_init

Thanks for the update!

> --- /dev/null
> +++ b/drivers/irqchip/irq-renesas-rzv2h.c

> +static void rzv2h_clear_irq_int(struct rzv2h_icu_priv *priv, unsigned in=
t hwirq)
> +{
> +       unsigned int irq_nr =3D hwirq - ICU_IRQ_START;
> +       u32 isctr, iitsr, iitsel;
> +       u32 bit =3D BIT(irq_nr);
> +
> +       isctr =3D readl_relaxed(priv->base + ICU_ISCTR);
> +       iitsr =3D readl_relaxed(priv->base + ICU_IITSR);
> +       iitsel =3D ICU_IITSR_IITSEL_GET(iitsr, irq_nr);
> +
> +       /*
> +        * When level sensing is used, the interrupt flag gets automatica=
lly cleared when the
> +        * interrupt signal is de-asserted by the source of the interrupt=
 request, therefore clear
> +        * the interrupt only for edge triggered interrupts.
> +        */
> +       if ((isctr & bit) && (iitsel !=3D ICU_IRQ_LEVEL_LOW))
> +               writel_relaxed(bit, priv->base + ICU_ISCLR);
> +}

Given you already manually inlined one call of this function in this v2,
I am not sure it's worthwhile to keep this helper.  Manually inlining the
single remaining call would drop some boilerplate.

> +
> +static int rzv2h_irq_set_type(struct irq_data *d, unsigned int type)
> +{
> +       struct rzv2h_icu_priv *priv =3D irq_data_to_priv(d);
> +       unsigned int hwirq =3D irqd_to_hwirq(d);
> +       u32 irq_nr =3D hwirq - ICU_IRQ_START;
> +       u32 iitsr, sense;
> +
> +       switch (type & IRQ_TYPE_SENSE_MASK) {
> +       case IRQ_TYPE_LEVEL_LOW:
> +               sense =3D ICU_IRQ_LEVEL_LOW;
> +               break;
> +
> +       case IRQ_TYPE_EDGE_FALLING:
> +               sense =3D ICU_IRQ_EDGE_FALLING;
> +               break;
> +
> +       case IRQ_TYPE_EDGE_RISING:
> +               sense =3D ICU_IRQ_EDGE_RISING;
> +               break;
> +
> +       case IRQ_TYPE_EDGE_BOTH:
> +               sense =3D ICU_IRQ_EDGE_BOTH;
> +               break;
> +
> +       default:
> +               return -EINVAL;
> +       }
> +
> +       guard(raw_spinlock)(&priv->lock);
> +       iitsr =3D readl_relaxed(priv->base + ICU_IITSR);
> +       iitsr &=3D ~ICU_IITSR_IITSEL_MASK(irq_nr);
> +       iitsr |=3D ICU_IITSR_IITSEL_PREP(sense, irq_nr);
> +       rzv2h_clear_irq_int(priv, hwirq);
> +       writel_relaxed(iitsr, priv->base + ICU_IITSR);
> +
> +       return 0;
> +}
> +
> +static void rzv2h_clear_tint_int(struct rzv2h_icu_priv *priv, unsigned i=
nt hwirq)
> +{
> +       unsigned int tint_nr =3D hwirq - ICU_TINT_START;
> +       int titsel_n =3D ICU_TITSR_TITSEL_N(tint_nr);
> +       u32 tsctr, titsr, titsel;
> +       u32 bit =3D BIT(tint_nr);
> +       int k =3D tint_nr / 16;
> +
> +       tsctr =3D readl_relaxed(priv->base + ICU_TSCTR);
> +       titsr =3D readl_relaxed(priv->base + ICU_TITSR(k));
> +       titsel =3D ICU_TITSR_TITSEL_GET(titsr, titsel_n);
> +
> +       /*
> +        * Writing 1 to the corresponding flag from register ICU_TSCTR on=
ly has effect if
> +        * TSTATn =3D 1b and if it's a rising edge or a falling edge inte=
rrupt.
> +        */
> +       if ((tsctr & bit) && ((titsel =3D=3D ICU_TINT_EDGE_RISING) ||
> +                             (titsel =3D=3D ICU_TINT_EDGE_FALLING)))
> +               writel_relaxed(bit, priv->base + ICU_TSCLR);
> +}

Likewise.

> +
> +static int rzv2h_tint_set_type(struct irq_data *d, unsigned int type)
> +{
> +       u32 titsr, titsr_k, titsel_n, tien;
> +       struct rzv2h_icu_priv *priv;
> +       u32 tssr, tssr_k, tssel_n;
> +       unsigned int hwirq;
> +       u32 tint, sense;
> +       int tint_nr;
> +
> +       switch (type & IRQ_TYPE_SENSE_MASK) {
> +       case IRQ_TYPE_LEVEL_LOW:
> +               sense =3D ICU_TINT_LEVEL_LOW;
> +               break;
> +
> +       case IRQ_TYPE_LEVEL_HIGH:
> +               sense =3D ICU_TINT_LEVEL_HIGH;
> +               break;
> +
> +       case IRQ_TYPE_EDGE_RISING:
> +               sense =3D ICU_TINT_EDGE_RISING;
> +               break;
> +
> +       case IRQ_TYPE_EDGE_FALLING:
> +               sense =3D ICU_TINT_EDGE_FALLING;
> +               break;
> +
> +       default:
> +               return -EINVAL;
> +       }
> +
> +       tint =3D (u32)(uintptr_t)irq_data_get_irq_chip_data(d);
> +       if (tint > ICU_PB5_TINT)
> +               return -EINVAL;
> +
> +       priv =3D irq_data_to_priv(d);
> +       hwirq =3D irqd_to_hwirq(d);
> +
> +       tint_nr =3D hwirq - ICU_TINT_START;
> +
> +       tssr_k =3D ICU_TSSR_K(tint_nr);
> +       tssel_n =3D ICU_TSSR_TSSEL_N(tint_nr);
> +
> +       titsr_k =3D ICU_TITSR_K(tint_nr);
> +       titsel_n =3D ICU_TITSR_TITSEL_N(tint_nr);
> +       tien =3D ICU_TSSR_TIEN(titsel_n);
> +
> +       guard(raw_spinlock)(&priv->lock);
> +
> +       tssr =3D readl_relaxed(priv->base + ICU_TSSR(tssr_k));
> +       tssr &=3D ~(ICU_TSSR_TSSEL_MASK(tssel_n) | tien);
> +       tssr |=3D ICU_TSSR_TSSEL_PREP(tint, tssel_n);
> +
> +       writel_relaxed(tssr, priv->base + ICU_TSSR(tssr_k));
> +
> +       titsr =3D readl_relaxed(priv->base + ICU_TITSR(titsr_k));
> +       titsr &=3D ~ICU_TITSR_TITSEL_MASK(titsel_n);
> +       titsr |=3D ICU_TITSR_TITSEL_PREP(sense, titsel_n);
> +
> +       writel_relaxed(titsr, priv->base + ICU_TITSR(titsr_k));
> +
> +       rzv2h_clear_tint_int(priv, hwirq);
> +
> +       writel_relaxed(tssr | tien, priv->base + ICU_TSSR(tssr_k));
> +
> +       return 0;
> +}


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

