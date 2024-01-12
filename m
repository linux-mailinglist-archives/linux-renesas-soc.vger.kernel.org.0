Return-Path: <linux-renesas-soc+bounces-1535-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 65DDB82C819
	for <lists+linux-renesas-soc@lfdr.de>; Sat, 13 Jan 2024 00:44:38 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id E42361F23670
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 12 Jan 2024 23:44:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 687621A5AC;
	Fri, 12 Jan 2024 23:44:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=atishpatra.org header.i=@atishpatra.org header.b="olMGn6cm"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-lj1-f178.google.com (mail-lj1-f178.google.com [209.85.208.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9BCEF1A71B
	for <linux-renesas-soc@vger.kernel.org>; Fri, 12 Jan 2024 23:44:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=atishpatra.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=atishpatra.org
Received: by mail-lj1-f178.google.com with SMTP id 38308e7fff4ca-2ccb4adbffbso82025711fa.0
        for <linux-renesas-soc@vger.kernel.org>; Fri, 12 Jan 2024 15:44:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=atishpatra.org; s=google; t=1705103061; x=1705707861; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Ao22g8SE+SCQO5FocxYUg5Y/fOEd09Z5JYkiaEBGenk=;
        b=olMGn6cmFGwXZO0mtBxc0bhjAxIDcDw8ZrQ2ujQ5ZE7PV4fs0Ys2VvfJM3vCFpL3Ng
         fKefqD1K+Bj0jyfTz0GF44KD1i13EidLzcBy+HUqFApjbCOHpUtxMg3vVdYpBkV8ywX3
         0XEL1xL0SHbGtaQSta3tUf3HNvTd8Mvuu7VdA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705103061; x=1705707861;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Ao22g8SE+SCQO5FocxYUg5Y/fOEd09Z5JYkiaEBGenk=;
        b=QivDfEKoAOlzz0SYSDDyOnWlpG6AIgYig1ELWEAPkMRIpK/vx1lSUcZcQA2XKWHyKG
         RwG2NB4ZgnICqjeHFsMBEebQQnfl2vKcfZ5CZD4ajC/6fOOw1/5U1BQihr5onNxuS2++
         3qzHbK25ClUKTeY85MlNeI35VdoxlpS9SqciV0bXOjE4pkw3uA6uWwJTQH7tjPP8GIKK
         QK5J/OqAkpSCLi4vRDqvfPqXkMuJ0tC5pUfCwz4yZQlzah00iSz32cB8XRrVPfLezGux
         9GN1om2S/WHa3J9RXlJ4Cp6+6MsHnVLWD4Uk48efxFTW9THKHdExzfsXbMYY1JL6tzl9
         shzQ==
X-Gm-Message-State: AOJu0Ywji7NJGcPtlygtxirBOo8G4qlT6tUg/eFKrL8bdfJ+y+Xdo/PW
	VNN2DV4q81aJWF/rOGjMkqGE0FLPTs7O9I30THLLna97YqtY
X-Google-Smtp-Source: AGHT+IHI7ywsV+fD9Gr/cA4gFCTeftXlfz+IEzwto5Cqz7c12ZJRt4oUXNh36gnywJ2pR7pW+AGwuuXRMdvQtIZ4YNc=
X-Received: by 2002:a2e:8481:0:b0:2cd:7ac4:f9b5 with SMTP id
 b1-20020a2e8481000000b002cd7ac4f9b5mr1032757ljh.14.1705103059822; Fri, 12 Jan
 2024 15:44:19 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240110073917.2398826-1-peterlin@andestech.com>
 <20240110073917.2398826-3-peterlin@andestech.com> <CAAhSdy1KLSFBA_vD+NX15wuiOsz5QadQWj4ZWOK11qfL1LuHqA@mail.gmail.com>
In-Reply-To: <CAAhSdy1KLSFBA_vD+NX15wuiOsz5QadQWj4ZWOK11qfL1LuHqA@mail.gmail.com>
From: Atish Patra <atishp@atishpatra.org>
Date: Fri, 12 Jan 2024 15:44:08 -0800
Message-ID: <CAOnJCU+-GZVUUBXxm=biqLjqJwL+AR=PR7_gBAVHUqPPQ2G9og@mail.gmail.com>
Subject: Re: [PATCH v7 02/16] irqchip/riscv-intc: Allow large non-standard
 interrupt number
To: Anup Patel <anup@brainfault.org>
Cc: Yu Chien Peter Lin <peterlin@andestech.com>, acme@kernel.org, adrian.hunter@intel.com, 
	ajones@ventanamicro.com, alexander.shishkin@linux.intel.com, 
	andre.przywara@arm.com, aou@eecs.berkeley.edu, conor+dt@kernel.org, 
	conor.dooley@microchip.com, conor@kernel.org, devicetree@vger.kernel.org, 
	dminus@andestech.com, evan@rivosinc.com, geert+renesas@glider.be, 
	guoren@kernel.org, heiko@sntech.de, irogers@google.com, 
	jernej.skrabec@gmail.com, jolsa@kernel.org, jszhang@kernel.org, 
	krzysztof.kozlowski+dt@linaro.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, linux-perf-users@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org, linux-riscv@lists.infradead.org, 
	linux-sunxi@lists.linux.dev, locus84@andestech.com, magnus.damm@gmail.com, 
	mark.rutland@arm.com, mingo@redhat.com, n.shubin@yadro.com, 
	namhyung@kernel.org, palmer@dabbelt.com, paul.walmsley@sifive.com, 
	peterz@infradead.org, prabhakar.mahadev-lad.rj@bp.renesas.com, 
	rdunlap@infradead.org, robh+dt@kernel.org, samuel@sholland.org, 
	sunilvl@ventanamicro.com, tglx@linutronix.de, tim609@andestech.com, 
	uwu@icenowy.me, wens@csie.org, will@kernel.org, ycliang@andestech.com, 
	inochiama@outlook.com, chao.wei@sophgo.com, unicorn_wang@outlook.com, 
	wefu@redhat.com, Randolph <randolph@andestech.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jan 10, 2024 at 7:11=E2=80=AFAM Anup Patel <anup@brainfault.org> wr=
ote:
>
> On Wed, Jan 10, 2024 at 1:10=E2=80=AFPM Yu Chien Peter Lin
> <peterlin@andestech.com> wrote:
> >
> > Currently, the implementation of the RISC-V INTC driver uses the
> > interrupt cause as the hardware interrupt number, with a maximum of
> > 64 interrupts. However, the platform can expand the interrupt number
> > further for custom local interrupts.
> >
> > To fully utilize the available local interrupt sources, switch
> > to using irq_domain_create_tree() that creates the radix tree
> > map, add global variables (riscv_intc_nr_irqs, riscv_intc_custom_base
> > and riscv_intc_custom_nr_irqs) to determine the valid range of local
> > interrupt number (hwirq).
> >
> > Signed-off-by: Yu Chien Peter Lin <peterlin@andestech.com>
> > Reviewed-by: Randolph <randolph@andestech.com>
>
> Looks good to me.
>
> Reviewed-by: Anup Patel <anup@brainfault.org>
>
> Regards,
> Anup
>
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
> > Changes v5 -> v6: (Suggested by Anup [2])
> >   - Add riscv_intc_* global variables for checking range in riscv_intc_=
domain_alloc()
> >   - Advertise the number of interrupts allowed
> > Changes v6 -> v7:
> >   - No functional change
> >
> > [1] https://patchwork.kernel.org/project/linux-riscv/patch/202310230041=
00.2663486-3-peterlin@andestech.com/#25573085
> > [2] https://patchwork.kernel.org/project/linux-riscv/patch/202312130703=
01.1684751-3-peterlin@andestech.com/#25636589
> > ---
> >  drivers/irqchip/irq-riscv-intc.c | 30 +++++++++++++++++++++++-------
> >  1 file changed, 23 insertions(+), 7 deletions(-)
> >
> > diff --git a/drivers/irqchip/irq-riscv-intc.c b/drivers/irqchip/irq-ris=
cv-intc.c
> > index e8d01b14ccdd..b13a16b164c9 100644
> > --- a/drivers/irqchip/irq-riscv-intc.c
> > +++ b/drivers/irqchip/irq-riscv-intc.c
> > @@ -19,15 +19,17 @@
> >  #include <linux/smp.h>
> >
> >  static struct irq_domain *intc_domain;
> > +static unsigned int riscv_intc_nr_irqs __ro_after_init;
> > +static unsigned int riscv_intc_custom_base __ro_after_init;
> > +static unsigned int riscv_intc_custom_nr_irqs __ro_after_init;
> >
> >  static asmlinkage void riscv_intc_irq(struct pt_regs *regs)
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
> > @@ -93,6 +95,14 @@ static int riscv_intc_domain_alloc(struct irq_domain=
 *domain,
> >         if (ret)
> >                 return ret;
> >
> > +       /*
> > +        * Only allow hwirq for which we have corresponding standard or
> > +        * custom interrupt enable register.
> > +        */
> > +       if ((riscv_intc_nr_irqs <=3D hwirq && hwirq < riscv_intc_custom=
_base) ||
> > +           (riscv_intc_custom_base + riscv_intc_custom_nr_irqs) <=3D h=
wirq)
> > +               return -EINVAL;
> > +
> >         for (i =3D 0; i < nr_irqs; i++) {
> >                 ret =3D riscv_intc_domain_map(domain, virq + i, hwirq +=
 i);
> >                 if (ret)
> > @@ -117,8 +127,7 @@ static int __init riscv_intc_init_common(struct fwn=
ode_handle *fn)
> >  {
> >         int rc;
> >
> > -       intc_domain =3D irq_domain_create_linear(fn, BITS_PER_LONG,
> > -                                              &riscv_intc_domain_ops, =
NULL);
> > +       intc_domain =3D irq_domain_create_tree(fn, &riscv_intc_domain_o=
ps, NULL);
> >         if (!intc_domain) {
> >                 pr_err("unable to add IRQ domain\n");
> >                 return -ENXIO;
> > @@ -132,7 +141,10 @@ static int __init riscv_intc_init_common(struct fw=
node_handle *fn)
> >
> >         riscv_set_intc_hwnode_fn(riscv_intc_hwnode);
> >
> > -       pr_info("%d local interrupts mapped\n", BITS_PER_LONG);
> > +       pr_info("%d local interrupts mapped\n", riscv_intc_nr_irqs);
> > +       if (riscv_intc_custom_nr_irqs)
> > +               pr_info("%d custom local interrupts mapped\n",
> > +                       riscv_intc_custom_nr_irqs);
> >
> >         return 0;
> >  }
> > @@ -166,6 +178,10 @@ static int __init riscv_intc_init(struct device_no=
de *node,
> >                 return 0;
> >         }
> >
> > +       riscv_intc_nr_irqs =3D BITS_PER_LONG;
> > +       riscv_intc_custom_base =3D riscv_intc_nr_irqs;
> > +       riscv_intc_custom_nr_irqs =3D 0;
> > +
> >         return riscv_intc_init_common(of_node_to_fwnode(node));
> >  }
> >
> > --
> > 2.34.1
> >


Reviewed-by: Atish Patra <atishp@rivosinc.com>

--=20
Regards,
Atish

