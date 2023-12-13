Return-Path: <linux-renesas-soc+bounces-989-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id E4C54811603
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 13 Dec 2023 16:20:10 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 3DE461F21ACA
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 13 Dec 2023 15:20:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6FC813174E;
	Wed, 13 Dec 2023 15:19:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ventanamicro.com header.i=@ventanamicro.com header.b="c05HngJr"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-lj1-x22f.google.com (mail-lj1-x22f.google.com [IPv6:2a00:1450:4864:20::22f])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AA6A6109
	for <linux-renesas-soc@vger.kernel.org>; Wed, 13 Dec 2023 07:19:37 -0800 (PST)
Received: by mail-lj1-x22f.google.com with SMTP id 38308e7fff4ca-2c9ea37ac87so97667901fa.3
        for <linux-renesas-soc@vger.kernel.org>; Wed, 13 Dec 2023 07:19:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1702480775; x=1703085575; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZNtewRvKdkPKx/kufVZXHodSPMmaednXpW/7XMndJ0U=;
        b=c05HngJrSXOs9nZxeSDrJfluvJDmtKxclnkEnS5QHlDp8yv+or4WwYBBxUh1NalyW8
         FDMXUPhHN9tDbMGKyr8vG9X2qVB83jjynz4zR1wEw4MdhoQ/4U2ffd1HBPJklP+Oyroz
         RTHsYzleZ8DxnXQwxGjSUeUPuin1XYpXmgaIHfHBJ0HwKuFcsbUAsW7KtFF3ioYJWGdO
         gJALSsPqCjcCADXWqHLYaHS0NkEFg0lRk1LU4SJR4Qw9voRm3Vreft6hz2ywxtHSkeMQ
         Jx4CaIGTreXntZXZNtUbmaPGqrZnddgp4m3RWPA0FpV6NLyLK7CT9T5YGeXH62QK1c29
         fZtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702480775; x=1703085575;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ZNtewRvKdkPKx/kufVZXHodSPMmaednXpW/7XMndJ0U=;
        b=E2xEdlkilmAOADA1qsH7wULeKMmzcAGXkl+mcmNG6UxsVj1k3knWwps3jcIWZcMC/z
         mj3g9Pi9P/mr9lEPHUhGrLAwmeAJWXDwzdkViqDbwC2XLJHGmGSBvFx7+78zjrwluqjv
         FajxYuEowbMb/NfbXcidZVb+F4EAC6BqWDmmXOrZHQ2/UitHnk2dJCDkOXUNIP5dtdpw
         6cq5QAMxYudFlsbaGnmOIweG+F0uWA5IdhpuKwBljQrOGRuCFSpJsO6880o96peGIEDj
         cl4zYIfqyPGoFYe0vSjSOV59KIpGyrdd/tw9QxaSRgyNWHQsy0pQY0ZYHbFKiMfg/fhk
         F38g==
X-Gm-Message-State: AOJu0YxdOLb7gYKEuExS3H6fWSQ6f4SRZaKvWkBSEGmWLPI5+Rysp8n+
	EmZdfATCA0ViykWH/IEq1Awvx9JrLAcbFj7R+lV4mA==
X-Google-Smtp-Source: AGHT+IEWCau9dWkDM8W8lF/KIFyXrgUvkYmScfqjpzvs5KS7ZHA07igo81qn4oh9bMosVxgpVkuKuvBsoM9ShBq/11s=
X-Received: by 2002:a05:651c:1186:b0:2cc:321c:d8dd with SMTP id
 w6-20020a05651c118600b002cc321cd8ddmr706657ljo.82.1702480775254; Wed, 13 Dec
 2023 07:19:35 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20231213070301.1684751-1-peterlin@andestech.com>
 <20231213070301.1684751-3-peterlin@andestech.com> <CAK9=C2WuuYQD8ydrHP16hUXVk6RuKLbfvUe_GpUGw9ppe3Rd8Q@mail.gmail.com>
In-Reply-To: <CAK9=C2WuuYQD8ydrHP16hUXVk6RuKLbfvUe_GpUGw9ppe3Rd8Q@mail.gmail.com>
From: Anup Patel <apatel@ventanamicro.com>
Date: Wed, 13 Dec 2023 20:49:23 +0530
Message-ID: <CAK9=C2U+rSP8YMahPmTHLYZ+ZBfwwY5y52JeU_=R+VL1frR1Uw@mail.gmail.com>
Subject: Re: [PATCH v5 02/16] irqchip/riscv-intc: Allow large non-standard
 interrupt number
To: Yu Chien Peter Lin <peterlin@andestech.com>
Cc: acme@kernel.org, adrian.hunter@intel.com, ajones@ventanamicro.com, 
	alexander.shishkin@linux.intel.com, andre.przywara@arm.com, 
	anup@brainfault.org, aou@eecs.berkeley.edu, atishp@atishpatra.org, 
	conor+dt@kernel.org, conor.dooley@microchip.com, conor@kernel.org, 
	devicetree@vger.kernel.org, dminus@andestech.com, evan@rivosinc.com, 
	geert+renesas@glider.be, guoren@kernel.org, heiko@sntech.de, 
	irogers@google.com, jernej.skrabec@gmail.com, jolsa@kernel.org, 
	jszhang@kernel.org, krzysztof.kozlowski+dt@linaro.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-perf-users@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
	linux-riscv@lists.infradead.org, linux-sunxi@lists.linux.dev, 
	locus84@andestech.com, magnus.damm@gmail.com, mark.rutland@arm.com, 
	mingo@redhat.com, n.shubin@yadro.com, namhyung@kernel.org, palmer@dabbelt.com, 
	paul.walmsley@sifive.com, peterz@infradead.org, 
	prabhakar.mahadev-lad.rj@bp.renesas.com, rdunlap@infradead.org, 
	robh+dt@kernel.org, samuel@sholland.org, sunilvl@ventanamicro.com, 
	tglx@linutronix.de, tim609@andestech.com, uwu@icenowy.me, wens@csie.org, 
	will@kernel.org, ycliang@andestech.com, inochiama@outlook.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Dec 13, 2023 at 7:58=E2=80=AFPM Anup Patel <apatel@ventanamicro.com=
> wrote:
>
> On Wed, Dec 13, 2023 at 12:34=E2=80=AFPM Yu Chien Peter Lin
> <peterlin@andestech.com> wrote:
> >
> > Currently, the implementation of the RISC-V INTC driver uses the
> > interrupt cause as hardware interrupt number and has a limitation of
> > supporting a maximum of 64 interrupts. However, according to the
> > privileged spec, interrupt causes >=3D 16 are defined for platform use.
>
> I disagree with this patch.
>
> Even though RISC-V priv sepc allows interrupt causes >=3D 16, we
> still need CSRs to manage arbitrary local interrupts
>
> Currently, we have following standard CSRs:
> 1) [m|s]ie and [m|s]ip which are XLEN wide
> 2) With AIA, we have [m|s]ieh and [m|s]iph for RV32
>
> Clearly, we can only have a XLEN number of standard local
> interrupts without AIA and 64 local interrupts with AIA.
>
> Now for implementations with custom CSRs (such as Andes),
> we still can't assume infinite local interrupts because HW will
> have a finite number of custom CSRs.
>
> >
> > This limitation prevents to fully utilize the available local interrupt
> > sources. Additionally, the interrupt number used on RISC-V are sparse,
> > with only interrupt numbers 1, 5 and 9 (plus Sscofpmf or T-Head's PMU
> > interrupt) being currently used for supervisor mode.
> >
> > Switch to using irq_domain_create_tree() to create the radix tree
> > map, so a larger number of hardware interrupts can be handled.
> >
> > Signed-off-by: Yu Chien Peter Lin <peterlin@andestech.com>
> > Reviewed-by: Charles Ci-Jyun Wu <dminus@andestech.com>
> > Reviewed-by: Leo Yu-Chi Liang <ycliang@andestech.com>
> > ---
> > Changes v1 -> v2:
> >   - Fixed irq mapping failure checking (suggested by Cl=C3=A9ment and A=
nup)
> > Changes v2 -> v3:
> >   - No change
> > Changes v3 -> v4: (Suggested by Thomas [1])
> >   - Use pr_warn_ratelimited instead
> >   - Fix coding style and commit message
> > Changes v4 -> v5: (Suggested by Thomas)
> >   - Fix commit message
> >
> > [1] https://patchwork.kernel.org/project/linux-riscv/patch/202310230041=
00.2663486-3-peterlin@andestech.com/#25573085
> > ---
> >  drivers/irqchip/irq-riscv-intc.c | 12 ++++--------
> >  1 file changed, 4 insertions(+), 8 deletions(-)
> >
> > diff --git a/drivers/irqchip/irq-riscv-intc.c b/drivers/irqchip/irq-ris=
cv-intc.c
> > index e8d01b14ccdd..2fdd40f2a791 100644
> > --- a/drivers/irqchip/irq-riscv-intc.c
> > +++ b/drivers/irqchip/irq-riscv-intc.c
> > @@ -24,10 +24,9 @@ static asmlinkage void riscv_intc_irq(struct pt_regs=
 *regs)
> >  {
> >         unsigned long cause =3D regs->cause & ~CAUSE_IRQ_FLAG;
> >
> > -       if (unlikely(cause >=3D BITS_PER_LONG))
> > -               panic("unexpected interrupt cause");
> > -
> > -       generic_handle_domain_irq(intc_domain, cause);
> > +       if (generic_handle_domain_irq(intc_domain, cause))
> > +               pr_warn_ratelimited("Failed to handle interrupt (cause:=
 %ld)\n",
> > +                                   cause);
> >  }
> >
> >  /*
> > @@ -117,8 +116,7 @@ static int __init riscv_intc_init_common(struct fwn=
ode_handle *fn)
> >  {
> >         int rc;
> >
> > -       intc_domain =3D irq_domain_create_linear(fn, BITS_PER_LONG,
> > -                                              &riscv_intc_domain_ops, =
NULL);
> > +       intc_domain =3D irq_domain_create_tree(fn, &riscv_intc_domain_o=
ps, NULL);
>
> I disagree with this change based on the reasoning above.
>
> Instead of this, we should determine the number of local interrupts
> based on the type of RISC-V intc:
> 1) For standard INTC without AIA, we have XLEN (or BITS_PER_LONG)
>     local interrupts
> 2) For standart INTC with AIA, we have 64 local interrupts
> 3) For custom INTC (such as Andes), the number of local interrupt
>     should be custom (Andes specific) which can be determined based
>     on compatible string.
>
> Also, creating a linear domain with a fixed number of local interrupts
> ensures that drivers can't map a local interrupt beyond the availability
> of CSRs to manage it.

Thinking about this more. We do have a problem because Andes local
interrupts are really sparse which is not the case for standard local
interrupts

I have an alternate suggestion which goes as follows ...

We use irq_domain_create_tree() in-place of irq_domain_create_linear()
and enforce checks on hwirq in riscv_intc_domain_alloc() to ensure that
we only allow hwirq for which we have corresponding standard or custom
CSR.

To achieve this, riscv_intc_init_common() will have to save the following
as static global variables:
1) riscv_intc_nr_irqs: Number of standard local interrupts
2) riscv_intc_custom_base and riscv_intc_custom_nr_irqs: Base and
    number of custom local interrupts.

Using the above static global variables, the riscv_intc_domain_alloc()
can return error if one of the following conditions are met:
1) riscv_intc_nr_irqs<=3D hwirq && hwirq < riscv_intc_custom_base
2) (riscv_intc_custom_base + riscv_intc_custom_nr_irqs) <=3D hwirq

For standard INTC, we can set the static global variable as follows:
riscv_intc_nr_irqs =3D XLEN or BITS_PER_LONG
riscv_intc_custom_base =3D riscv_intc_nr_irqs
riscv_intc_custom_nr_irqs =3D 0

For Andes INTC, we can set the static global variables as follows:
riscv_intc_nr_irqs =3D XLEN or BITS_PER_LONG
riscv_intc_custom_base =3D 256
riscv_intc_custom_nr_irqs =3D XLEN or BITS_PER_LONG

Regards,
Anup

>
> >         if (!intc_domain) {
> >                 pr_err("unable to add IRQ domain\n");
> >                 return -ENXIO;
> > @@ -132,8 +130,6 @@ static int __init riscv_intc_init_common(struct fwn=
ode_handle *fn)
> >
> >         riscv_set_intc_hwnode_fn(riscv_intc_hwnode);
> >
> > -       pr_info("%d local interrupts mapped\n", BITS_PER_LONG);
> > -
>
> Same as above, we should definitely advertise the type of INTC and
> number of local interrupts mapped.
>
> Regards,
> Anup
>
> >         return 0;
> >  }
> >
> > --
> > 2.34.1
> >
> >
> > _______________________________________________
> > linux-riscv mailing list
> > linux-riscv@lists.infradead.org
> > http://lists.infradead.org/mailman/listinfo/linux-riscv

