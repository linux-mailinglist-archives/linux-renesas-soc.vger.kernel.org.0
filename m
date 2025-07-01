Return-Path: <linux-renesas-soc+bounces-18986-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id DAC6BAEFABA
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  1 Jul 2025 15:34:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 4B181188FAD6
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  1 Jul 2025 13:31:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3690227585F;
	Tue,  1 Jul 2025 13:28:28 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-vs1-f41.google.com (mail-vs1-f41.google.com [209.85.217.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D099275854
	for <linux-renesas-soc@vger.kernel.org>; Tue,  1 Jul 2025 13:28:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751376508; cv=none; b=QmFrk8TQP9jX8bIanIL/Bt/fqhfKyV05Z3hjuAERWq9YmiMkwFjMLeRNFwv+GiyXRIGG/fjEukhUoK2K3OLL4P3YfkR24xz0kDPRJZd+ZHJ6pTxwgpW20X4LgVpgBjNQZz5XDKHsNMXQNr6nmZ/oUfFLu0jihcFNi5XFV/yPyh0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751376508; c=relaxed/simple;
	bh=6UtohBIXusBrMsGBITNWTnTAbMDhXk4NAKjMAFZ9veg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=qkwNJBMrhe6QZ3KPN5Vx6XsOEc13ReEyC0zDOlTBNxLKBMJTr/m54APjy1o9L4eLZKrrKNkHC0dOc8Bg+Zf/ugQ/3STOf91FM9Nuby4EAReq8wabejqjOBENrXFtasnraStUsR0vnVmlwanGPFOFCY6cv5FdCuJxFpM35jCdyYs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.217.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vs1-f41.google.com with SMTP id ada2fe7eead31-4dfa2aeec86so899611137.1
        for <linux-renesas-soc@vger.kernel.org>; Tue, 01 Jul 2025 06:28:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751376505; x=1751981305;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=J+ASRBvnDMBmcoE3JhGsoiqW9xNpEvxLSNjDfSGesqk=;
        b=j1uvE+3P9CU80VVsPYNdsDZDaPQvLDTQ4sZmXodBKfueDoCB/rPswwGNjGEBaRC5RO
         pOf7x0H1+Xj9JzvqMe+25MfAxV4/dHFKMTcEQgGEelAKG3iIVLq7GrOQknDWf1mvc7Fd
         BLgF1QjNKWgMq6WFkrqGur/gTU5X+nl2jCpjjJ7uq3wDxmX6MAjMme6M4Q1urprW5+B5
         NNWE1sNbJ65WiidO6O/ts0OtiMQ9YgDULLdp5GwJcKI2QpmRyA25z+NMMOx+XV7niA8F
         5PUydpVUIdww5XqCz+90uMh11rySPwTYIaSjd2t+E31Z/b33hb786E3qpocETLQOiGG5
         9s7g==
X-Forwarded-Encrypted: i=1; AJvYcCX/ri63vzk/Fq584qyzWFITFQEanzukmWBtz4BJm5Ej5PaqLfHnL2B05dpjtRYA8g1wlyrTeosQ7Qn/LQcJ7CORtA==@vger.kernel.org
X-Gm-Message-State: AOJu0YyrjRwCtqlIfOSawU14zgQzebYNBlFlLlW9Inq81VJjAW54t0Ko
	Up6sjw89TcCt6i1yqLM+SCiNTLuGvVP8iEW+5O5fETrm5s9Sd1YgVcVwZIOVpNLc
X-Gm-Gg: ASbGnctMQ5hHLnd1UlUMIcUiSs+Tp50RcPuncTzsSZI/csT6YV3L7CLYC50WF7XMNvg
	m/2GT0M2gbL4iP6m0Yx6Jq7jD8gXqV8deijsQUndMmX12RfVx4Nhi/orCv1Zjw/j9GvuAQlEqwg
	gQGF0pvalg2ePC8JHAU4oXLdUn+VYOKf5DGUOdPYrQjdJJn7WKeaHfk3srowclbJLJs53iSfwiE
	aG/uNRSJY0WDy7bn3qEQypkote1G6+yPAUDNzXhHgI745E2YxpuGPqjVAcJ/YA4oR9IFrIl5gKM
	Jnz9N1mSkCzJiJdZT/HJatpbLMQpKFd4eJycu+tauIdwEYeQnktf7QW3CK8MpL+qHO5GtAIAjkz
	dQlOtnjkOpdBe2h8z+E0FblVGFkY4/yE+UjU=
X-Google-Smtp-Source: AGHT+IFjC3EOCl6A2ngVDjO5EaWlO4DVqSsD3X9kMORC8CeO15fNO7OjA/vJf/6GIJk7KcaxxFtZlA==
X-Received: by 2002:a05:6102:4413:b0:4e9:b8bf:17f8 with SMTP id ada2fe7eead31-4ee4f8276afmr10283981137.21.1751376504675;
        Tue, 01 Jul 2025 06:28:24 -0700 (PDT)
Received: from mail-vs1-f48.google.com (mail-vs1-f48.google.com. [209.85.217.48])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-4ee4cb724ecsm1539094137.16.2025.07.01.06.28.24
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 01 Jul 2025 06:28:24 -0700 (PDT)
Received: by mail-vs1-f48.google.com with SMTP id ada2fe7eead31-4dfa2aeec86so899601137.1
        for <linux-renesas-soc@vger.kernel.org>; Tue, 01 Jul 2025 06:28:24 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCWvLIvLv1NnwnVdsX9knrAMItrb7nO7XtgaUO/TdrPediKjgFXXdsvIDvNSoK5thIPOmYtBbQR+fSib0qOHUdF4wg==@vger.kernel.org
X-Received: by 2002:a05:6102:b0f:b0:4ec:b2cc:de60 with SMTP id
 ada2fe7eead31-4ee4f5318f0mr11217274137.11.1751376503809; Tue, 01 Jul 2025
 06:28:23 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250701105923.52151-1-biju.das.jz@bp.renesas.com>
 <CAMuHMdVfusCsJawffmo1AUS4yPoC_MFyetcPCufuFEiGtvjuuQ@mail.gmail.com> <TY3PR01MB11346482B233A523CC80A23298641A@TY3PR01MB11346.jpnprd01.prod.outlook.com>
In-Reply-To: <TY3PR01MB11346482B233A523CC80A23298641A@TY3PR01MB11346.jpnprd01.prod.outlook.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 1 Jul 2025 15:28:11 +0200
X-Gmail-Original-Message-ID: <CAMuHMdV5A6mnq+Tq+FBYkhW32wOnt_Ru1ZcNZt0223BeDLhkRQ@mail.gmail.com>
X-Gm-Features: Ac12FXwHV-CGxHAbBFTQpY4WKrp-DL-KErDo1HUIGNZZkxuLRu7btEtMsBJ5jK8
Message-ID: <CAMuHMdV5A6mnq+Tq+FBYkhW32wOnt_Ru1ZcNZt0223BeDLhkRQ@mail.gmail.com>
Subject: Re: [PATCH] irqchip/renesas-rzv2h: Enable SKIP_SET_WAKE and MASK_ON_SUSPEND
To: Biju Das <biju.das.jz@bp.renesas.com>
Cc: Thomas Gleixner <tglx@linutronix.de>, 
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>, 
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>, "biju.das.au" <biju.das.au@gmail.com>, 
	"linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"

Hi Biju,

On Tue, 1 Jul 2025 at 15:21, Biju Das <biju.das.jz@bp.renesas.com> wrote:
> > From: Geert Uytterhoeven <geert@linux-m68k.org>
> > On Tue, 1 Jul 2025 at 12:59, Biju Das <biju.das.jz@bp.renesas.com> wrote:
> > > The interrupt controller found on RZ/G3E doesn't provide any facility
> > > to configure the wakeup sources. That's the reason why the driver
> > > lacks the
> > > irq_set_wake() callback for the interrupt chip.
> > >
> > > But this prevent to properly enter power management states like
> > > "suspend to idle".
> > >
> > > Enable the flags IRQCHIP_SKIP_SET_WAKE and IRQCHIP_MASK_ON_SUSPEND so
> > > the interrupt suspend logic can handle the chip correctly.
> > >
> > > Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
> >
> > Thanks for your patch!
> >
> > > --- a/drivers/irqchip/irq-renesas-rzv2h.c
> > > +++ b/drivers/irqchip/irq-renesas-rzv2h.c
> > > @@ -427,7 +427,9 @@ static const struct irq_chip rzv2h_icu_chip = {
> > >         .irq_retrigger          = irq_chip_retrigger_hierarchy,
> > >         .irq_set_type           = rzv2h_icu_set_type,
> > >         .irq_set_affinity       = irq_chip_set_affinity_parent,
> > > -       .flags                  = IRQCHIP_SET_TYPE_MASKED,
> > > +       .flags                  = IRQCHIP_MASK_ON_SUSPEND |
> > > +                                 IRQCHIP_SET_TYPE_MASKED |
> > > +                                 IRQCHIP_SKIP_SET_WAKE,
> >
> > This driver uses Runtime PM (but does not use a platform driver[1]).
> > So don't you need to implement .irq_set_wake() instead of setting IRQCHIP_SKIP_SET_WAKE(), so the ICU
> > is kept running when it is part of the wake-up path (cfr.[2])?
> > Does wake-up from an ICU interrupt work?
>
> For STR state, there is no wakeup source. Wake up is only through the Power button.
>
> For Suspend to idle state, ICU interrupt works. I have tested with USER_SW buttons
> by adding wakeup-source in board dts.

OK, in that case probably the ICU does not need its clock running to
handle interrupts.

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

