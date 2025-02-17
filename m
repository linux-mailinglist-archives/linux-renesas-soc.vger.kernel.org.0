Return-Path: <linux-renesas-soc+bounces-13194-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4389EA38087
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 17 Feb 2025 11:47:35 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 1F5A13ADB24
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 17 Feb 2025 10:47:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5EFDE17E019;
	Mon, 17 Feb 2025 10:47:22 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-vs1-f46.google.com (mail-vs1-f46.google.com [209.85.217.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 46D1118DB1C
	for <linux-renesas-soc@vger.kernel.org>; Mon, 17 Feb 2025 10:47:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739789242; cv=none; b=cJ4RirrnnuHHr9Dbb3aw7V0Xkb0fcyHBhbalWz8+e/Kn2BD0gu05mncfPCxDbpag9rE3A+FqEnTb0FXWuK/neUqU6IrCRYaKtDjGlNX5cDhk0RUVEKKgKpOYEOU/k8vOnH/wYaYUgG5P3Eh47r5X0lcwoZNJYcQ/4lhOBSPt/W8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739789242; c=relaxed/simple;
	bh=z3G/N5s9PRO0SmGXytGU2yJTK3fSoSBJmZ88EEdRNcE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=sHBEXIh22nmgEeQtxtze50Tud///AmCKz8ecYgrQXfOhLcL+qoYp2OSQgPQzCjbTBA3sCSm/7xv7lUUeHQwnYwexPDZwJjio9SIPzdNF9z7yejcyDGjqgcnBK0VFRD36vDHQ8MMpHMDUErfaCUWctW9Nxk6v0xHYA/QKrqkYtc4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.217.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vs1-f46.google.com with SMTP id ada2fe7eead31-4bd35d4407aso733911137.0
        for <linux-renesas-soc@vger.kernel.org>; Mon, 17 Feb 2025 02:47:20 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739789239; x=1740394039;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=GNIrSBTo7CoUqEdD87iAh6/rkoZ2HPiUKPOq8KbToTU=;
        b=Tx8HOhBjTCRl/kqmCdTc3geKTvfYs2vNnZ7WZNyZ8oQgxswat7FEy2RwUtdm/4Hlrw
         lSgJwgZznN5LfCJT5QlZFrD7/GtROF2Y0FrV9nrx+fjQVvhkHdPT/EQkLO+rAcFb8+ca
         kNEYUWOi3lqniqGYm30L2KvE0Nl9WfYflMFGUbEI6+lAK5tZIu0ow6PsziIQC673VZx4
         WWlS3virstN1P16giWrsLCad0e5iydVp+uQdpGQ+O5EyTUu05V3S4ymIgbL9xLjL2y7J
         Gw8hw0Rpwfr4OwafLUzhaF2NKM3QhMLWh2fXieKApIpZY7BMVRX+3O+9NLP2XAjrVxTv
         gbJA==
X-Forwarded-Encrypted: i=1; AJvYcCUYt+qC0lQZdwYBoLPWh6QLeXvpfSuu5EeLZexkMhv7/TeSFUxUWPYsQ8V8i8sSNg7ZNSayFWMR5swrLmtSs1MhKA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yz4jKgcyyUEX7qeRdiZYLCQA5jRSGveELSZX1HnvKdlddkw7D3j
	xUqLGAmXeUQsiNEmIP34boIIN8ikqyK5nDrFFXupmJZFNJUUky9HaRWFlU+2
X-Gm-Gg: ASbGncvtaQiSgzTVkQTP3PIEORg3avRY9u0kVXfDr4qJanDXm+fP5jL3xDFJGZPyeOS
	mxzuHEbqew2aFzNSk7GhcVmRlE6u3E0K/MwXrkChHclp8B/8SEFK7NrrbFfocE8Q/+ela1SQmjq
	JnJSZF0jtDm3AqktPAwMMOpUYQUZPThg+YdpggEMmwgpM9MCGeicpVLOcCiCO4CJatNCLxGuUwN
	RzVsgi36yJ0TPral+U+xsuf38spR+k4dIjbsOzaN+MsML1EXHxhCt3LiOz/Lhlm+sh9FptqIcfx
	Zg73TVOmkSQDZ2h4z3DINP1rstHWTxZ4SYgATU1PYiXc0RByToiwXA==
X-Google-Smtp-Source: AGHT+IFa4cWQvyDqz9kMyNrUvUICPZz8bHeptYoWQaSx55hv6YkzEkSBwsya+fmLu/qftuT6dBXTDA==
X-Received: by 2002:a67:e70a:0:b0:4bb:e8c5:b172 with SMTP id ada2fe7eead31-4bd3fcadbe6mr4884352137.8.1739789238938;
        Mon, 17 Feb 2025 02:47:18 -0800 (PST)
Received: from mail-vs1-f47.google.com (mail-vs1-f47.google.com. [209.85.217.47])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-4be54009b3esm612530137.0.2025.02.17.02.47.18
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 17 Feb 2025 02:47:18 -0800 (PST)
Received: by mail-vs1-f47.google.com with SMTP id ada2fe7eead31-4bd35d4407aso733908137.0
        for <linux-renesas-soc@vger.kernel.org>; Mon, 17 Feb 2025 02:47:18 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCXg2UwfNMbcTwARx+85ELCqd5QA5/ik4ZwHH7jp0qGyCeuy9wnesJ0C2fC61jVwS+V6OcodabcFrX+cbGVJyKGseA==@vger.kernel.org
X-Received: by 2002:a05:6102:c89:b0:4bb:eb4a:f9f2 with SMTP id
 ada2fe7eead31-4bd3fcc5af7mr3377704137.9.1739789238572; Mon, 17 Feb 2025
 02:47:18 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250212111231.143277-1-biju.das.jz@bp.renesas.com>
 <20250212111231.143277-11-biju.das.jz@bp.renesas.com> <TY3PR01MB11346A06D40667624E88E4E1E86FB2@TY3PR01MB11346.jpnprd01.prod.outlook.com>
In-Reply-To: <TY3PR01MB11346A06D40667624E88E4E1E86FB2@TY3PR01MB11346.jpnprd01.prod.outlook.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 17 Feb 2025 11:47:06 +0100
X-Gmail-Original-Message-ID: <CAMuHMdVfORkBnP-Ygz8WFv-bpXv4mFHw33Z97AiOBRV0G8sv5A@mail.gmail.com>
X-Gm-Features: AWEUYZnzYuGkaB8WGWPj1IzWSpuzMv7Fp2sVxAFy06fRi_dIh5LtLZZ2DSsTxC0
Message-ID: <CAMuHMdVfORkBnP-Ygz8WFv-bpXv4mFHw33Z97AiOBRV0G8sv5A@mail.gmail.com>
Subject: Re: [PATCH v5 10/12] irqchip/renesas-rzv2h: Drop TSSR_TIEN macro
To: Biju Das <biju.das.jz@bp.renesas.com>
Cc: Thomas Gleixner <tglx@linutronix.de>, 
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>, 
	"biju.das.au" <biju.das.au@gmail.com>, 
	"linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"

Hi Biju,

On Mon, 17 Feb 2025 at 10:36, Biju Das <biju.das.jz@bp.renesas.com> wrote:

> > -----Original Message-----
> > From: Biju Das <biju.das.jz@bp.renesas.com>
> > Sent: 12 February 2025 11:12
> > Subject: [PATCH v5 10/12] irqchip/renesas-rzv2h: Drop TSSR_TIEN macro
> >
> > On RZ/G3E, TIEN bit position is at 15 compared to 7 on RZ/V2H. The macro
> > ICU_TSSR_TIEN(n) can be replaced with the inline logic BIT(field_width - 1) << (n * fieldwidth) for
> > supporting both SoCs.
> >
> > Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
> > ---
> > v4->v5:
> >  * Shortened tssr calculation in rzv2h_tint_irq_endisable().
> >  * Added tssr_shift_factor variable for optimizing the calculation
> >    in rzv2h_tint_set_type() as the next patch uses the same factor.
> > v4:
> >  * New patch
> > ---
> >  drivers/irqchip/irq-renesas-rzv2h.c | 9 +++++----
> >  1 file changed, 5 insertions(+), 4 deletions(-)
> >
> > diff --git a/drivers/irqchip/irq-renesas-rzv2h.c b/drivers/irqchip/irq-renesas-rzv2h.c
> > index 98a6a7cd3611..3635597ae4c1 100644
> > --- a/drivers/irqchip/irq-renesas-rzv2h.c
> > +++ b/drivers/irqchip/irq-renesas-rzv2h.c
> > @@ -66,7 +66,6 @@
> >
> >  #define ICU_TSSR_TSSEL_PREP(tssel, n)                ((tssel) << ((n) * 8))
> >  #define ICU_TSSR_TSSEL_MASK(n)                       ICU_TSSR_TSSEL_PREP(0x7F, n)
> > -#define ICU_TSSR_TIEN(n)                     (BIT(7) << ((n) * 8))
>
>
> Please let me know, instead I should retain this macro with[1] and see changes below inlined??

What does [1] refer to?

> #define ICU_TSSR_TIEN(mask, n, shift) ((mask) << ((n) * (shift)))

Isn't "mask" always "BIT(shift -1)"?

"shift" is not the shift value (that is "n * shift"), but the field width.

> >  #define ICU_TITSR_K(tint_nr)                 ((tint_nr) / 16)
> >  #define ICU_TITSR_TITSEL_N(tint_nr)          ((tint_nr) % 16)
> > @@ -153,9 +152,9 @@ static void rzv2h_tint_irq_endisable(struct irq_data *d, bool enable)
> >       guard(raw_spinlock)(&priv->lock);
> >       tssr = readl_relaxed(priv->base + priv->info->t_offs + ICU_TSSR(k));
> >       if (enable)
> > -             tssr |= ICU_TSSR_TIEN(tssel_n);
> > +             tssr |= BIT((tssel_n + 1) * priv->info->field_width - 1);
>                 tssr |= ICU_TSSR_TIEN(priv->info->field_width - 1, tssel_n, priv->info->field_width);

Missing BIT()?

> >       else
> > -             tssr &= ~ICU_TSSR_TIEN(tssel_n);
> > +             tssr &= ~(BIT((tssel_n + 1) * priv->info->field_width - 1));
>                 tssr &= ~ICU_TSSR_TIEN(priv->info->field_width - 1, tssel_n, priv->info->field_width);

Likewise?

>
> >       writel_relaxed(tssr, priv->base + priv->info->t_offs + ICU_TSSR(k));  }
> >
> > @@ -277,6 +276,7 @@ static int rzv2h_tint_set_type(struct irq_data *d, unsigned int type)
> >       u32 titsr, titsr_k, titsel_n, tien;
> >       struct rzv2h_icu_priv *priv;
> >       u32 tssr, tssr_k, tssel_n;
> > +     u32 tssr_shift_factor;
> >       unsigned int hwirq;
> >       u32 tint, sense;
> >       int tint_nr;
> > @@ -314,7 +314,8 @@ static int rzv2h_tint_set_type(struct irq_data *d, unsigned int type)
> >       nr_tint = 32 / priv->info->field_width;
> >       tssr_k = tint_nr / nr_tint;
> >       tssel_n = tint_nr % nr_tint;
> > -     tien = ICU_TSSR_TIEN(tssel_n);
>
> tien = ICU_TSSR_TIEN(priv->info->field_width - 1, tssel_n, priv->info->field_width);

Likewise?

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

