Return-Path: <linux-renesas-soc+bounces-27870-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id UCirDmcdg2nWhwMAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-27870-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 04 Feb 2026 11:20:23 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 50D69E463B
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 04 Feb 2026 11:20:22 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id E34163000BBF
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  4 Feb 2026 10:20:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D912C3D6471;
	Wed,  4 Feb 2026 10:20:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Lcv5oSTn"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 60E733D412E
	for <linux-renesas-soc@vger.kernel.org>; Wed,  4 Feb 2026 10:20:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.221.51
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770200415; cv=pass; b=a9pdqPoYy0VGaX5gj2Eyc19unoQGmMoLCsT/N3hpt7FH5J99r5/qOZvpwW6a+Mv5jhEJ/StMFuuFprtEUZOuF8NP6wP75uEiNVwtbTPEhOUELRhVeYPYmyj5azNLKKuieIRB23L3VQg++RlBqMwoSOsa7lwrNGAF3OG9MwXyY4o=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770200415; c=relaxed/simple;
	bh=kEJyoDKH/UHjxXyptZe8iP6IBbkNvRh8+DOSqHLS+f4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=VotZWUVN7/UX1Ow96LFoQjA1YFsW0eGxg3PsvzX1nM+Uc1lrW4Ti8xEi5uA0Z7yhMFjiTC3uhr8oIGzZ5iqCGhB5I2OOjLtZwNJu/LkCd4TUhfYve8z5z7MRR8X8YSiIEfZcSvg2vUNbM2xBJ9JbzQ0xtmPSqhvcxwbOsgNxCgw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Lcv5oSTn; arc=pass smtp.client-ip=209.85.221.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-4359249bbacso456367f8f.0
        for <linux-renesas-soc@vger.kernel.org>; Wed, 04 Feb 2026 02:20:15 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1770200414; cv=none;
        d=google.com; s=arc-20240605;
        b=fUP7e5630lTRZh9naDNKgQ6wum9rSU2gpHvM+7GcHwyz67mFxadmWBfKoC5TNvGT+N
         SpjB7LPvJwj42/ijHDa6PzDkFn+JZTiezW7a5yEX/nWUfF7vi6ZbbD9tulIuprSZSvJJ
         W5UYidB47YUmP/v+FQp3r2GZGVXCVE3V6S4lyevf5IRHDyC23N0sP3g+RT3MjTiqO9Qc
         Op9LfM4qgAPmNJUr5U8YqkIXya2T0OlT0BNILW0Ira3UvNirkzHT2CQl/Md2FICGrH/p
         thgntBL0YQuXrZZAlb8/GEbA/FgT/iqFHfyioTQcSYWk3DihWtHnNMr3BzwDxGRbBBrE
         nLNg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=lmYeNNZYcYY/s3lZlCGPqG5fIV23Lyf+wUBXBk2RJ0s=;
        fh=80diA85hnCNNi3XHAP6dpXWTuhOdOnVlVFUvtlac9p0=;
        b=Rdzins/+mth7XbOfZqMgbDxviCTtoaXQnX373sg99+XuynG9UyozutJpmeAUp7YZBp
         fRi9Vr5kzJniBVYhu6lCvXIuHUgQQNsbtuwiqt2TX5TMkIMKlFvx8MkWPyU7SFcSz8l7
         UA01Y1mpRLI6sRCmZ/R7tGkG4fWYBSz7SVoM8+eHhqkF+HIMW0xVkYSkP9ibtqsY9Ik9
         9k/8wPWiQrPbPo/CcCMdddvdvybXuP9e4uwXPAQW75YrEpErQTfZWkBpJqr9VsWLzd/a
         zLd4pZW3YdHSn9lo3drWXMs15Mh9mCvM5Ls+8zMtk+MBtCr34DkpQ9aHOh7NDr08htgF
         yXVQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770200414; x=1770805214; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lmYeNNZYcYY/s3lZlCGPqG5fIV23Lyf+wUBXBk2RJ0s=;
        b=Lcv5oSTn1tadj/oJ3u901fclXBdWz0o7+UlKVZzH4RJv6msTPSmz0iYbf2EQXW9v5e
         kFRpcClpzWRyha6GAiO2YLLy7JRELboKyvgLgornZII7VqJZPVnnx7YXAnpwFxyyl8NW
         26auhGArIp92UTab2Ee73+8yJnKiKFpcFwpUW7bol9DWkJkWzG/bUsw6O9Y2ytRtHQCI
         JKl9nemCmDcLgFYPz1c0AQgOAviZxRZQSMUNM/k/RurVOp8Gh/DFgUCAAWEfF41ZGiQw
         rdn3Q2x7TL1Smgha/neBblFtree/tUnarOJneNgPr7K+MPBj6HBQhv4vzrlDjBnaKtRy
         hsoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770200414; x=1770805214;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=lmYeNNZYcYY/s3lZlCGPqG5fIV23Lyf+wUBXBk2RJ0s=;
        b=bQLV1jeKTY8Qbk/IIXtHw+C/kOSIPFFohdMLyJlDfQCV0TjT/krmIAuELtcUaL42cQ
         ngC5LQLLrduKbn4roJF8mrwdVLP4Uoq7uixIHM+orA1u8I6Jxwnqt9UPKR9Z1qhQQY1S
         iFHD0pzpDxv6i+5GzOF4/lRPxRWeFjxDl4JTPuhfSio5dmDmWy9F4/qJNJhouSx23t74
         /p+w4k2gJy8Zkhrz8EMbuTPaC7V2goXovjqph8jr/M96yF1sSgdIdlfkpd3gPUb5hk5+
         3uTBSRxFtB6dfacorhvz74yEVH4Ejgywycu7IF0gUscOmqposEgYW+bLzJryd1vgKg0G
         aNig==
X-Forwarded-Encrypted: i=1; AJvYcCXEuJ2kr9vo1NGvVO0iQrK7Vf8VAKkvnoc/F6bTwEHFnY0SxRhVytPh1QoCmjvVhv21/ktDWrjETwGvc9c21hf/Og==@vger.kernel.org
X-Gm-Message-State: AOJu0YyC2XFs6x8NrgG1wLbNHXPaMzX2so4tEFGnk2Yvf7Ew9mGvZ09/
	ox9QBErJEfuiAR2eH4qBWZM3+rh9zwgTGYHCaprK2QYYrq05ZRNng/Io3iYS2nfcJBHBxjvyubY
	2hkjRlmg0hvRawa8crBqp7zf7126r9Hk=
X-Gm-Gg: AZuq6aJ5g6HQ5qAG+hUaaZASSWyJ4vgQgDilFjYpEbESZ8yYUG2ys3DC0EtRQ9bU6up
	1GRCKw4vEXa9pzB2Xo/uWjNm6sQ6TSANPsz/iNMUHpoubLbVf6mA3cssPsKKz5CFOYHOCmL4hTb
	QAjXeNemjobl4qVS2UfWMYRv+CSiLGxWGuqLZR5vd6KgOIdE8ujchEgiBY3fEu04Mq6WBiQ3V8K
	OW2RBqJPLhiILq+RdhC6B8LF4ETsAOFvRuGRp2nLNcaKjGjRnNVgIecypUlnVaRGWvWoLxMuuXC
	AqrD30MDmUg94f+Es1wQki+xaQOgzyie12kr7RP21vjiuSP8dD41wKgdUeen0ZeFBbpu27t5B2n
	Y2dcM4/lUsSu0jQ==
X-Received: by 2002:a05:6000:186b:b0:435:953e:5897 with SMTP id
 ffacd0b85a97d-43611447c43mr8675347f8f.25.1770200413439; Wed, 04 Feb 2026
 02:20:13 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260203231823.208661-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20260203231823.208661-5-prabhakar.mahadev-lad.rj@bp.renesas.com> <TY3PR01MB11346474FD45870A1047FB1F98698A@TY3PR01MB11346.jpnprd01.prod.outlook.com>
In-Reply-To: <TY3PR01MB11346474FD45870A1047FB1F98698A@TY3PR01MB11346.jpnprd01.prod.outlook.com>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Wed, 4 Feb 2026 10:19:47 +0000
X-Gm-Features: AZwV_QgA2kuK8ODgFee6o8VhNpgzLblB5OI36bD45G1Ebd5NFebfT0WLO7HYhd4
Message-ID: <CA+V-a8tsUeZ6PsVxm3jHgS0X2wKRtuyuUWOfpp1r718mj_ay4w@mail.gmail.com>
Subject: Re: [PATCH v2 4/6] irqchip/renesas-rzv2h: Make IRQ type handling range-aware
To: Biju Das <biju.das.jz@bp.renesas.com>
Cc: Thomas Gleixner <tglx@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, "magnus.damm" <magnus.damm@gmail.com>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, 
	"linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>, 
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-27870-lists,linux-renesas-soc=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	FREEMAIL_CC(0.00)[kernel.org,pengutronix.de,glider.be,gmail.com,vger.kernel.org,renesas.com,bp.renesas.com];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[prabhakarcsengg@gmail.com,linux-renesas-soc@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas];
	RCPT_COUNT_SEVEN(0.00)[9];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,mail.gmail.com:mid]
X-Rspamd-Queue-Id: 50D69E463B
X-Rspamd-Action: no action

Hi Biju,

On Wed, Feb 4, 2026 at 6:52=E2=80=AFAM Biju Das <biju.das.jz@bp.renesas.com=
> wrote:
>
> Hi Prabhakar,
>
> Thanks for the patch.
>
> > -----Original Message-----
> > From: Prabhakar <prabhakar.csengg@gmail.com>
> > Sent: 03 February 2026 23:18
> > Subject: [PATCH v2 4/6] irqchip/renesas-rzv2h: Make IRQ type handling r=
ange-aware
> >
> > From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> >
> > Refine IRQ type handling to explicitly bound IRQ and TINT ranges and di=
spatch based on the hardware
> > IRQ number.
> >
> > This restructures the logic to clearly separate NMI, IRQ, and TINT hand=
ling and ensures out-of-range
> > interrupts are ignored safely. The change prepares the driver for addin=
g CA55 interrupts into the IRQ
> > hierarchy domain by making the interrupt classification explicit and ex=
tensible.
> >
> > Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> > ---
> > v1->v2:
> > - New patch.
> > ---
> >  drivers/irqchip/irq-renesas-rzv2h.c | 59 +++++++++++++++++++----------
> >  1 file changed, 40 insertions(+), 19 deletions(-)
> >
> > diff --git a/drivers/irqchip/irq-renesas-rzv2h.c b/drivers/irqchip/irq-=
renesas-rzv2h.c
> > index 4aa772ba1a1f..6c7bbb04c6e4 100644
> > --- a/drivers/irqchip/irq-renesas-rzv2h.c
> > +++ b/drivers/irqchip/irq-renesas-rzv2h.c
> > @@ -25,9 +25,11 @@
> >  /* DT "interrupts" indexes */
> >  #define ICU_IRQ_START                                1
> >  #define ICU_IRQ_COUNT                                16
> > -#define ICU_TINT_START                               (ICU_IRQ_START + =
ICU_IRQ_COUNT)
> > +#define ICU_IRQ_LAST                         (ICU_IRQ_START + ICU_IRQ_=
COUNT - 1)
> > +#define ICU_TINT_START                               (ICU_IRQ_LAST + 1=
)
> >  #define ICU_TINT_COUNT                               32
> > -#define ICU_NUM_IRQ                          (ICU_TINT_START + ICU_TIN=
T_COUNT)
> > +#define ICU_TINT_LAST                                (ICU_TINT_START +=
 ICU_TINT_COUNT - 1)
> > +#define ICU_NUM_IRQ                          (ICU_TINT_LAST + 1)
> >
> >  /* Registers */
> >  #define ICU_NSCNT                            0x00
> > @@ -175,18 +177,27 @@ static void rzv2h_icu_eoi(struct irq_data *d)
> >       u32 bit;
> >
> >       scoped_guard(raw_spinlock, &priv->lock) {
> > -             if (hw_irq >=3D ICU_TINT_START) {
> > -                     tintirq_nr =3D hw_irq - ICU_TINT_START;
> > -                     bit =3D BIT(tintirq_nr);
> > -                     if (!irqd_is_level_type(d))
> > -                             writel_relaxed(bit, priv->base + priv->in=
fo->t_offs + ICU_TSCLR);
> > -             } else if (hw_irq >=3D ICU_IRQ_START) {
> > +             switch (hw_irq) {
> > +             case 0:
> > +                     /* Clear NMI */
> > +                     writel_relaxed(ICU_NSCLR_NCLR, priv->base + ICU_N=
SCLR);
> > +                     break;
> > +             case ICU_IRQ_START ... ICU_IRQ_LAST:
> > +                     /* Clear IRQ */
> >                       tintirq_nr =3D hw_irq - ICU_IRQ_START;
> >                       bit =3D BIT(tintirq_nr);
> >                       if (!irqd_is_level_type(d))
> >                               writel_relaxed(bit, priv->base + ICU_ISCL=
R);
> > -             } else {
> > -                     writel_relaxed(ICU_NSCLR_NCLR, priv->base + ICU_N=
SCLR);
> > +                     break;
> > +             case ICU_TINT_START ... ICU_TINT_LAST:
> > +                     /* Clear TINT */
> > +                     tintirq_nr =3D hw_irq - ICU_TINT_START;
> > +                     bit =3D BIT(tintirq_nr);
> > +                     if (!irqd_is_level_type(d))
> > +                             writel_relaxed(bit, priv->base + priv->in=
fo->t_offs + ICU_TSCLR);
> > +                     break;
> > +             default:
> > +                     break;
> >               }
> >       }
> >
> > @@ -200,7 +211,7 @@ static void rzv2h_tint_irq_endisable(struct irq_dat=
a *d, bool enable)
> >       u32 tint_nr, tssel_n, k, tssr;
> >       u8 nr_tint;
> >
> > -     if (hw_irq < ICU_TINT_START)
> > +     if (hw_irq < ICU_TINT_START || hw_irq > ICU_TINT_LAST)
> >               return;
> >
> >       tint_nr =3D hw_irq - ICU_TINT_START;
> > @@ -421,12 +432,22 @@ static int rzv2h_icu_set_type(struct irq_data *d,=
 unsigned int type)
> >       unsigned int hw_irq =3D irqd_to_hwirq(d);
> >       int ret;
> >
> > -     if (hw_irq >=3D ICU_TINT_START)
> > -             ret =3D rzv2h_tint_set_type(d, type);
> > -     else if (hw_irq >=3D ICU_IRQ_START)
> > -             ret =3D rzv2h_irq_set_type(d, type);
> > -     else
> > +     switch (hw_irq) {
> > +     case 0:
> > +             /* NMI */
> >               ret =3D rzv2h_nmi_set_type(d, type);
> > +             break;
> > +     case ICU_IRQ_START ... ICU_IRQ_LAST:
> > +             /* IRQ */
> > +             ret =3D rzv2h_irq_set_type(d, type);
> > +             break;
> > +     case ICU_TINT_START ... ICU_TINT_LAST:
> > +             /* TINT */
> > +             ret =3D rzv2h_tint_set_type(d, type);
> > +             break;
> > +     default:
> > +             ret =3D -EINVAL;
> > +     }
> >
> >       if (ret)
> >               return ret;
> > @@ -507,11 +528,11 @@ static int rzv2h_icu_alloc(struct irq_domain *dom=
ain, unsigned int virq, unsigne
> >        * fwspec->param[0].
> >        * hwirq is embedded in bits 0-15.
> >        * TINT is embedded in bits 16-31.
> > +      * Check if bits 16-31 are set to identify TINT interrupts.
> >        */
> > -     if (hwirq >=3D ICU_TINT_START) {
> > -             tint =3D ICU_TINT_EXTRACT_GPIOINT(hwirq);
> > +     tint =3D ICU_TINT_EXTRACT_GPIOINT(hwirq);
> > +     if (tint) {
>
> Is tint =3D=3D 0 does not happen??  I mean GPIOint =3D=3D 0 is invalid??
>
For the P0_0 case, tint =3D 0 and hwirq =3D=3D ICU_TINT_EXTRACT_HWIRQ(hwirq=
).
In this situation, we do not need to enter the if condition.

Cheers,
Prabhakar

