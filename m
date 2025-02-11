Return-Path: <linux-renesas-soc+bounces-13055-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6AA3EA31112
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 11 Feb 2025 17:18:37 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E296C3AA232
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 11 Feb 2025 16:17:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 36402253F35;
	Tue, 11 Feb 2025 16:16:41 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-qv1-f44.google.com (mail-qv1-f44.google.com [209.85.219.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 791D0255E34;
	Tue, 11 Feb 2025 16:16:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739290601; cv=none; b=qHbMzm4o8VmJdBn+kEoSWXIHCZDmFcJg0RS0GzmthK4CYwJlM4idg/5/Z4+G+9Jk5twFQiCme3L4XOZ0oNEt4AESeCN0K/wD783a990ERM4l+z+KWT+CZYyds7Yn+wpqpKQMd5A6jLqPwg2MseKpPry/LIN++oI69OLAbEO9S/4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739290601; c=relaxed/simple;
	bh=8/EU+brzdQekYGKHLTWjfcXsNGf5cAuhaSkvj4HJZu4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=upQAbcMECjYsqMug6OBgwcXFOxOE31UZWMrM7KrLhcboNGTzwgj0Y+nvnjD3i2zN2EQay5yN0Ik2jVIy9wWZEWMMhdi9JzUmK5Bo3R7as/xZzY8N9QQWo9j0pzk9p613rva+cQ7q/yQLmu1/3VpdCYlX0EbWSj8qqEGs5wT2Yq0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.219.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qv1-f44.google.com with SMTP id 6a1803df08f44-6d8e8445219so45950276d6.0;
        Tue, 11 Feb 2025 08:16:39 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739290598; x=1739895398;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=GSrn4BFBKiNaDlc/+eWZmaHOtn4P6CwgbesXN1qmuFE=;
        b=b/njLvC73WPwnA0HRCvnyc6c6yaF+a6XyRz7JoPRuoB9onPJ2NSm1Wse8eUyY3wZbI
         P5MbnbcjFc+gncS9oOMYMr4opqVFhgBtl2lS3cUKKdFkBnEtbDtt8mNxLupGeYfPOdjW
         TD2vaD0ze0wXGuFwLwBfnfXRbfPgEaSTVVveF+bHulLcGlzG7KPIDKu7Ms4Svo/hifO7
         WzQmS0SC31UrUTP9usl9zCIDXdg7vOLhtIv+0WbRFLl7SaxTtblmHmPBhzOK0xHajLsG
         0zhwb43RU+JBlquuXe3F2eGq+lyLw2GkxGfUuW4khxtdDEhy/5b+MiAuzPPTz+ITbLE4
         PLVA==
X-Forwarded-Encrypted: i=1; AJvYcCWxSj2uZq2rCbzLUZwTLcaINAOT0JFJAay0IwSF66XsNRXuAp1LDtHTiiPhaS8zqwC3oIEALctPm2YxiNU=@vger.kernel.org, AJvYcCXvtg0HK/HtPbO29ecRPrh4ixsaCCaJqC3tGwio988SiabbLDczOJL6bi5h+osjEIZkAFgOwhrzghxbCs8ZJDbZmok=@vger.kernel.org
X-Gm-Message-State: AOJu0YzAyASve8W5KsLu6UXJ4pIx5G9t6Or+zZkHADWlaV8xJuUp0l+d
	oZltCf/bmAOPkkd7mKnKOPxiPnEgfmy207l0pYfMrIHHmUFLUvAAmATrYUwqYsk=
X-Gm-Gg: ASbGncup0B3LNhfSc7ROhLr+uocG2i4Ny0anRIFOHl1zr4YBOssIA5xhUD68B724BFX
	b0CA+qkV/H8cJAo8ahkkmTeyiWQmFOTizlFAICwciZZH5Ng6CJoUPnpvKw/PVdUpcmhYSRi2Q/4
	7eVW2hFwEYgMzrBguTXb5Nf8iB31Hn3S700KChAYdglS0uD3sloaJXpaIMWDOf2jETK+viyvnoe
	QO9OdNhhTAAasmQgpkpX5b01rCkhkCLSFaSf8kBUJ6LeQsRnSu2MhQxNEdYkOs4NqFNCBUl8ocz
	trtzPwkRoYrY+k9vHukj+ABPhXxY35EkvzWw0i7XFjbMLAFJZi2e0yN3kQ==
X-Google-Smtp-Source: AGHT+IGSVNttvvGFL3W3B/o6gyaJdCzGXWTy8S0WaL2Xw8gfuX8muNbFl4cavlkKZAgCl19utPOfCA==
X-Received: by 2002:a05:6214:411c:b0:6e2:481c:3713 with SMTP id 6a1803df08f44-6e445705b4emr237686316d6.37.1739290597991;
        Tue, 11 Feb 2025 08:16:37 -0800 (PST)
Received: from mail-qk1-f170.google.com (mail-qk1-f170.google.com. [209.85.222.170])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6e43e6b3c32sm59699466d6.124.2025.02.11.08.16.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 11 Feb 2025 08:16:37 -0800 (PST)
Received: by mail-qk1-f170.google.com with SMTP id af79cd13be357-7c05dc87ad9so264571985a.3;
        Tue, 11 Feb 2025 08:16:37 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCX7DCXPGJzsaousH2vphq2Z9/FpqtnYqA8k7SXq1WN6MAquXXnY5PVW5jK0mckK8X5KdgX/6PSaiNxPWnYvQ2cenCQ=@vger.kernel.org, AJvYcCXaoXILREKZH9XPLv6x3FKwFTnLgubtY8Be/pSZUhO+UcZyxb9BWHf97xSEi4j0Qj+Bse/7fDcXFRP6X2A=@vger.kernel.org
X-Received: by 2002:a05:620a:288a:b0:7c0:174d:e350 with SMTP id
 af79cd13be357-7c047c9774amr3740159085a.36.1739290597503; Tue, 11 Feb 2025
 08:16:37 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241011172003.1242841-1-fabrizio.castro.jz@renesas.com>
 <CAMuHMdUrg+gqJsg2LaBkzaLPzh4nZefqVdqH2rLhCEGQDya88g@mail.gmail.com> <TY3PR01MB120897A4A7AEF860A13F87E72C2FD2@TY3PR01MB12089.jpnprd01.prod.outlook.com>
In-Reply-To: <TY3PR01MB120897A4A7AEF860A13F87E72C2FD2@TY3PR01MB12089.jpnprd01.prod.outlook.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 11 Feb 2025 17:16:25 +0100
X-Gmail-Original-Message-ID: <CAMuHMdWYZizs_3Q6mEXCfaivmSy7CYEj1uvHVrA7=9NM+9Ov1w@mail.gmail.com>
X-Gm-Features: AWEUYZkLQIU0RpCEnnqM5nXIcmSBKeSN0X0hlcQNaAx_PqrFead9E5SNkLPt0NU
Message-ID: <CAMuHMdWYZizs_3Q6mEXCfaivmSy7CYEj1uvHVrA7=9NM+9Ov1w@mail.gmail.com>
Subject: Re: [PATCH v4] irqchip/renesas-rzg2l: Fix missing put_device
To: Fabrizio Castro <fabrizio.castro.jz@renesas.com>
Cc: Thomas Gleixner <tglx@linutronix.de>, Markus Elfring <elfring@users.sourceforge.net>, 
	Markus Elfring <Markus.Elfring@web.de>, Marc Zyngier <maz@kernel.org>, 
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Chris Paterson <Chris.Paterson2@renesas.com>, 
	Biju Das <biju.das.jz@bp.renesas.com>, 
	"linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>, Dan Williams <dan.j.williams@intel.com>, 
	Peter Zijlstra <peterz@infradead.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Fabrizio,

On Tue, 11 Feb 2025 at 16:49, Fabrizio Castro
<fabrizio.castro.jz@renesas.com> wrote:
> > From: Geert Uytterhoeven <geert@linux-m68k.org>
> > Sent: 11 February 2025 15:12
> > Subject: Re: [PATCH v4] irqchip/renesas-rzg2l: Fix missing put_device
> >
> > On Fri, 11 Oct 2024 at 19:20, Fabrizio Castro
> > <fabrizio.castro.jz@renesas.com> wrote:
> > > rzg2l_irqc_common_init calls of_find_device_by_node, but the
> > > corresponding put_device call is missing.
> > > This also gets reported by make coccicheck.
> > >
> > > Make use of the cleanup interfaces from cleanup.h to call into
> > > __free_put_device (which in turn calls into put_device) when
> > > leaving function rzg2l_irqc_common_init and variable "dev" goes
> > > out of scope.
> > >
> > > Mind that we don't want to "put" "dev" when rzg2l_irqc_common_init
> > > completes successfully, therefore assign NULL to "dev" to prevent
> > > __free_put_device from calling into put_device within the successful
> > > path.
> > >
> > > "make coccicheck" will still complain about missing put_device calls,
> > > but those are false positives now.
> > >
> > > Fixes: 3fed09559cd8 ("irqchip: Add RZ/G2L IA55 Interrupt Controller d=
river")
> > > Signed-off-by: Fabrizio Castro <fabrizio.castro.jz@renesas.com>
> >
> > Revisiting commit d038109ac1c6bf61 ("irqchip/renesas-rzg2l: Fix missing
> > put_device")...
> >
> > > --- a/drivers/irqchip/irq-renesas-rzg2l.c
> > > +++ b/drivers/irqchip/irq-renesas-rzg2l.c
> > > @@ -8,6 +8,7 @@
> > >   */
> > >
> > >  #include <linux/bitfield.h>
> > > +#include <linux/cleanup.h>
> > >  #include <linux/clk.h>
> > >  #include <linux/err.h>
> > >  #include <linux/io.h>
> > > @@ -530,12 +531,12 @@ static int rzg2l_irqc_parse_interrupts(struct r=
zg2l_irqc_priv *priv,
> > >  static int rzg2l_irqc_common_init(struct device_node *node, struct d=
evice_node *parent,
> > >                                   const struct irq_chip *irq_chip)
> > >  {
> > > +       struct platform_device *pdev =3D of_find_device_by_node(node)=
;
> > > +       struct device *dev __free(put_device) =3D pdev ? &pdev->dev :=
 NULL;
> >
> > Now there is a variable holding "&pdev->dev", all below references
> > to the latter can be replaced by "dev"...
>
> Right! I will shortly send a patch for this.

Thanks in advance!

> > >         struct irq_domain *irq_domain, *parent_domain;
> > > -       struct platform_device *pdev;
> > >         struct reset_control *resetn;
> > >         int ret;
> > >
> > > -       pdev =3D of_find_device_by_node(node);
> > >         if (!pdev)
> > >                 return -ENODEV;
> > >
> > > @@ -591,6 +592,17 @@ static int rzg2l_irqc_common_init(struct device_=
node *node, struct device_node
> > *
> > >
> > >         register_syscore_ops(&rzg2l_irqc_syscore_ops);
> > >
> > > +       /*
> > > +        * Prevent the cleanup function from invoking put_device by a=
ssigning
> > > +        * NULL to dev.
> > > +        *
> > > +        * make coccicheck will complain about missing put_device cal=
ls, but
> > > +        * those are false positives, as dev will be automatically "p=
ut" via
> > > +        * __free_put_device on the failing path.
> > > +        * On the successful path we don't actually want to "put" dev=
.
> > > +        */
> > > +       dev =3D NULL;
> > > +
> > >         return 0;
> >
> > Can't the above be replaced by
> >
> >     no_free_ptr(dev);
> >
> > ? Or would Coccinelle still complain?
>
> If I use no_free_ptr the compiler complains that its return value is not =
used:
>
> In file included from ../drivers/irqchip/irq-renesas-rzg2l.c:11:
> ../drivers/irqchip/irq-renesas-rzg2l.c: In function =E2=80=98rzg2l_irqc_c=
ommon_init=E2=80=99:
> ../include/linux/cleanup.h:215:15: warning: ignoring return value of =E2=
=80=98__must_check_fn=E2=80=99 declared with attribute =E2=80=98warn_unused=
_result=E2=80=99 [-Wunused-result]
>   215 |  ((typeof(p)) __must_check_fn(__get_and_null(p, NULL)))
>       |               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> ../drivers/irqchip/irq-renesas-rzg2l.c:595:2: note: in expansion of macro=
 =E2=80=98no_free_ptr=E2=80=99
>   595 |  no_free_ptr(dev);
>       |  ^~~~~~~~~~~

I hadn't tried it myself, and thus hadn't noticed that warning.
Interestingly, the addition of __must_check_fn()[1] predates the
documentation[2] that shows the above construct...

[1] commit 85be6d842447067c ("cleanup: Make no_free_ptr() __must_check"),
[2] commit d5934e76316e84ec ("cleanup: Add usage and style documentation").

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

