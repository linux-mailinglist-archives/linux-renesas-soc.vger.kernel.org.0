Return-Path: <linux-renesas-soc+bounces-34311-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id o+faLa5FOWrPpgcAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-34311-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 22 Jun 2026 16:24:46 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 4BFDD6B04A1
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 22 Jun 2026 16:24:46 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=none;
	dmarc=none;
	spf=pass (mail.lfdr.de: domain of "linux-renesas-soc+bounces-34311-lists+linux-renesas-soc=lfdr.de@vger.kernel.org" designates 2600:3c09:e001:a7::12fc:5321 as permitted sender) smtp.mailfrom="linux-renesas-soc+bounces-34311-lists+linux-renesas-soc=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 1495C3024E7E
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 22 Jun 2026 14:23:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AC9A93988F8;
	Mon, 22 Jun 2026 14:22:23 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-vs1-f44.google.com (mail-vs1-f44.google.com [209.85.217.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 160453AC0E9
	for <linux-renesas-soc@vger.kernel.org>; Mon, 22 Jun 2026 14:22:21 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782138143; cv=none; b=k9n+cx4cSNK1DjvuOVlLUtpmEyNnTNKwkaSP7bffSMTjRwVXZlvOv9QUgIc1Ksz/8j/ku49NpAbkpLy9dfdxkXOOPYtoDMPikNd3GnTgRqmWIn/pEVI9HDq3vg9dwjSAQe4ViQvz9p4pGzEfdDi0UF3agQdqbMtH980i7ok4mO0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782138143; c=relaxed/simple;
	bh=LpYby/C3sB5tpZd2Qt85jlNF3iOGWtYp99Y8ihB1gPA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=GntgQXfUONtVf5geO9dpiBx+TnlYfzlfttYGSvp4fpXgiThUUlvUjZwNVMwgSgTF/lTgrnyrTtiw2SjMaKMaKnVeia2oanRLJIApsAk6gNuZUrlm+ATxLIXOgZ1ylkGULuU8Zws1kLnL9vw6mdSLM/5M8AlMdAsgIZ1azAn3owc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.217.44
Received: by mail-vs1-f44.google.com with SMTP id ada2fe7eead31-729d8f9238dso1060730137.0
        for <linux-renesas-soc@vger.kernel.org>; Mon, 22 Jun 2026 07:22:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782138141; x=1782742941;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=cADZZnn4gjK5Oixge29dOaGqF3MIQ1dd5O+dWVLo+Gk=;
        b=mZtYeBzRjkC+n5ZYrVPJMQSROb/wP9Sp7Z7RDzcx4kI7v171Mz68BKdeuMCba+Jwjq
         KEW0QJomq7EjPlMqOo1FfgOwYVsGI4jJfJ2DbCqiT0qgvRL29tdxEhWaJgwp/Pr8O8Mp
         Zxun9JrIHGBNRUmejbBc/4wLYbDDLLoUF6GPLOoD2UECPjkLRem4LXwhMjprNiSL4E1p
         hUSz1GpNDvRUoffzjkDNNHjDiaGvyx5+VbUkiDGk9vQfOjhwx5jJaqE/Z/0YS1PsY6tH
         rmjRAtHpDjMaT0DCkngWmd2HK/90TF/zK8MFWQy/DkQiowTvxpnePgMRbgP2qC6AlTfF
         tPKw==
X-Forwarded-Encrypted: i=1; AFNElJ9OLB/B6gr3JEUF+gQwRon1hFnbkO3KQc68Vcx4/i0jXifhpE2D5x5cgAeg34qslZtwmRrFiQHYexfkdd6kRGONtQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YxY1/07FEeDCfHI4DHN/hLYYLa17yY8jb3NSUszdYtuRtVNzp3N
	HkLwpHSpa+HxMKpDrN2rzj0sKJFSZQ0P3R7Cr4g+OFqVjvThWS9+0fl9vMRIROOz8h0=
X-Gm-Gg: AfdE7cmUV4HOB441drOo5mlOk7KzfdT7uo0epcn+5ggk395ZrthXp1a23mKGiEWK4C1
	ce0EmPb/FqA+odYJIynYV9qNCXfmEkTmjXfvvjkOueiabOdpgQj+VQheGZiy+5qiRiYubUm3IRq
	Qch0Yp0tcCGzNpVs3598IxyZ1trw4Gwdq63IOveYireoxFFQcNVcwS2lJtJSKjxuIyJLHfL/GMx
	1KT8r/OXBmh6fFn4EdAgzMfA2lG39SrZlyCVRYzPeimynuKDPk/IO63RYEy0EpM4N7TC9JQWOkL
	YsJxJ4Q51vfOUCylTJPEEa935C+NNhw2eLUolKngoOkvRtRBRg7db2MDcpc2jPwzP6ZKiTs3NGx
	Vf5VyQUhrRIevj1bovjNRPC+wLbWRPNJCwOWIHVLdx72kfYQ6+OYf5hFryUeLSk6kJuT/DTaDo0
	xNjNy9KVyeJ2jHP6aL0yLlBXTTopRyVHqJj+LpFDemrfMrWQR3Ug==
X-Received: by 2002:a05:6102:554a:b0:6ef:db57:ed3f with SMTP id ada2fe7eead31-72a047d882bmr7313890137.29.1782138140828;
        Mon, 22 Jun 2026 07:22:20 -0700 (PDT)
Received: from mail-ua1-f43.google.com (mail-ua1-f43.google.com. [209.85.222.43])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-72ba229c7fdsm5911872137.2.2026.06.22.07.22.19
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 22 Jun 2026 07:22:20 -0700 (PDT)
Received: by mail-ua1-f43.google.com with SMTP id a1e0cc1a2514c-9673385b1efso258012241.2
        for <linux-renesas-soc@vger.kernel.org>; Mon, 22 Jun 2026 07:22:19 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ+eTlha6wU8H3+b7jdPjDoMjFlyW3bR4USqP7mSVzmBItTCo/eB/aa/x6aq92S2BcG509UIa9krRp9fVMJBYWGqwQ==@vger.kernel.org
X-Received: by 2002:a05:6102:2922:b0:631:2cb0:bf8d with SMTP id
 ada2fe7eead31-72a01882303mr8022720137.6.1782138139212; Mon, 22 Jun 2026
 07:22:19 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260429115054.158160-1-herve.codina@bootlin.com> <20260429115054.158160-3-herve.codina@bootlin.com>
In-Reply-To: <20260429115054.158160-3-herve.codina@bootlin.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 22 Jun 2026 16:22:07 +0200
X-Gmail-Original-Message-ID: <CAMuHMdVwMjLFJz0NeSP+BJVYoePw6oRDdj9P2Ra5nC=4yRXd6w@mail.gmail.com>
X-Gm-Features: AVVi8CeGC9Vn8JWkJO7xDytlZEDscCIDRlTTaudbtw3_YSqPMLV4PY62I2DvSS4
Message-ID: <CAMuHMdVwMjLFJz0NeSP+BJVYoePw6oRDdj9P2Ra5nC=4yRXd6w@mail.gmail.com>
Subject: Re: [PATCH v2 2/4] clocksource/drivers: Add support for the Renesas
 RZ/N1 timers
To: "Herve Codina (Schneider Electric)" <herve.codina@bootlin.com>
Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>, 
	Daniel Lezcano <daniel.lezcano@kernel.org>, Thomas Gleixner <tglx@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Magnus Damm <magnus.damm@gmail.com>, linux-renesas-soc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
	Pascal Eberhard <pascal.eberhard@se.com>, Miquel Raynal <miquel.raynal@bootlin.com>, 
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-1.46 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[sang-engineering.com,kernel.org,gmail.com,vger.kernel.org,se.com,bootlin.com];
	TAGGED_FROM(0.00)[bounces-34311-lists,linux-renesas-soc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	DMARC_NA(0.00)[linux-m68k.org];
	FORGED_RECIPIENTS(0.00)[m:herve.codina@bootlin.com,m:wsa+renesas@sang-engineering.com,m:daniel.lezcano@kernel.org,m:tglx@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:magnus.damm@gmail.com,m:linux-renesas-soc@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:devicetree@vger.kernel.org,m:pascal.eberhard@se.com,m:miquel.raynal@bootlin.com,m:thomas.petazzoni@bootlin.com,m:wsa@sang-engineering.com,m:krzk@kernel.org,m:conor@kernel.org,m:magnusdamm@gmail.com,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER(0.00)[geert@linux-m68k.org,linux-renesas-soc@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	RCPT_COUNT_TWELVE(0.00)[14];
	FORGED_SENDER_FORWARDING(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[geert@linux-m68k.org,linux-renesas-soc@vger.kernel.org];
	MISSING_XM_UA(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	R_DKIM_NA(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas,dt];
	TO_DN_SOME(0.00)[]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 4BFDD6B04A1

Hi Herv=C3=A9,

Thanks for your patch!

Just a few generic comments, as I am not a timer expert, and have no
access to the hardware.

On Wed, 29 Apr 2026 at 13:51, Herve Codina (Schneider Electric)
<herve.codina@bootlin.com> wrote:
> The Renesas RZ/N1 timer block controller is the controller in charge of
> timers available in the Renesas RZ/N1 SoCs family.
>
> This controller handles 8 timers:
>   - 6 16-bit timers
>   - 2 32-bit timers
>
> Each timer has its own interrupt, its own prescaler that can be used to
> device the clock by 25 and all of them can work in either one-shot or

divide

> periodic mode.
>
> Signed-off-by: Herve Codina (Schneider Electric) <herve.codina@bootlin.co=
m>
> ---
>  drivers/clocksource/Kconfig      |  10 +
>  drivers/clocksource/Makefile     |   1 +
>  drivers/clocksource/timer-rzn1.c | 442 +++++++++++++++++++++++++++++++
>  3 files changed, 453 insertions(+)
>  create mode 100644 drivers/clocksource/timer-rzn1.c
>
> diff --git a/drivers/clocksource/Kconfig b/drivers/clocksource/Kconfig
> index d1a33a231a44..f8e49a4ac8f6 100644
> --- a/drivers/clocksource/Kconfig
> +++ b/drivers/clocksource/Kconfig
> @@ -152,6 +152,16 @@ config REALTEK_OTTO_TIMER
>           RT8391, RTL8392, RTL8393 and RTL8396 and chips of the RTL930x s=
eries
>           such as RTL9301, RTL9302 or RTL9303.
>
> +config RZN1_TIMER
> +       bool "Renesas RZ/N1 Timer"

So this cannot be a module.

> +       depends on HAS_IOMEM && COMMON_CLK && (ARCH_RZN1 || COMPILE_TEST)

I would split this in two lines, to make it easier to read (and
maintain, if the same timer ends up in a different SoC series).

> +       help
> +         Enables support for RZ/N1 SoC timers.
> +         A timers block in RZ/N1 SoCs is composed of 8 timers
> +           - 6 16-bit timers
> +           - 2 32-bit timers
> +         Two timers blocks are available in RZ/N1 SoCs.
> +
>  config SUN4I_TIMER
>         bool "Sun4i timer driver" if COMPILE_TEST
>         depends on HAS_IOMEM

> --- /dev/null
> +++ b/drivers/clocksource/timer-rzn1.c

> +/*
> + * 8 timers are available. Among those 8 timers, the first 6 timers are =
16-bit
> + * timers and the last two ones are 32-bit timers.
> + */
> +#define RZN1_TIMER_BASE_INDEX_16BIT_TIMERS 0
> +#define RZN1_TIMER_NB_16BIT_TIMERS 6
> +
> +#define RZN1_TIMER_BASE_INDEX_32BIT_TIMER 6
> +#define RZN1_TIMER_NB_32BIT_TIMERS 2

Align the number columns?

> +static int rzn1_timer_probe_first(struct platform_device *pdev, struct r=
zn1_timer *tab_timers,
> +                                 void __iomem *base, unsigned long clock=
_rate)
> +{
> +       struct device *dev =3D &pdev->dev;
> +       struct rzn1_timer *timer;
> +       unsigned int i;
> +       char *name;
> +       int irq;
> +       int ret;
> +
> +       /*
> +        * Probe the first instance. In that case, timers are assigned as
> +        * follow:
> +        *   - First 16-bit timer: clocksource and sched_clock
> +        *   - Other 16-bit timers: clock events for all possible CPUs
> +        *   - 32-bit timers: clock events per CPU
> +        *
> +        * First step, perform all operation that could fail without call=
ing
> +        * clockevents_config_and_register(), sched_clock_register() nor
> +        * cpuhp_setup_state(). Those operation don't have unregister nor
> +        * teardown counterparts and so, once called, we cannot remove th=
e
> +        * related resource.
> +        */
> +
> +       /*
> +        * First step for 16-bit timers except the first one and all 32-b=
it
> +        * timers.
> +        */
> +       for (i =3D RZN1_TIMER_BASE_INDEX_16BIT_TIMERS + 1; i < RZN1_TIMER=
_NB_TIMERS; i++) {
> +               timer =3D &tab_timers[i];
> +
> +               rzn1_timer_init(timer, i, base, clock_rate);
> +
> +               irq =3D platform_get_irq(pdev, i);
> +               if (irq < 0)
> +                       return irq;
> +
> +               name =3D devm_kasprintf(dev, GFP_KERNEL, "%s-%u", dev_nam=
e(dev), i);
> +               if (!name)
> +                       return -ENOMEM;
> +
> +               rzn1_timer_clkevt_init_ced(timer, name, irq);
> +
> +               ret =3D devm_request_irq(dev, timer->ced.irq, rzn1_timer_=
interrupt,
> +                                      IRQF_TIMER, timer->ced.name, timer=
);
> +               if (ret < 0)
> +                       return dev_err_probe(dev, irq, "timer%d: Failed t=
o request IRQ\n", i);

%u

> +
> +               rzn1_timer_int_enable(timer);
> +       }
> +
> +       /*
> +        * Second step, almost all operations that can fail have been cal=
led.
> +        * Timers are ready to work. Start with the last operation that c=
an fail,
> +        * installing and invoking hotplug callbacks
> +        */
> +       rzn1_tab_timers =3D tab_timers;
> +       ret =3D cpuhp_setup_state(CPUHP_AP_ONLINE_DYN,
> +                               "clockevents/rzn1/global_timer:starting",
> +                               rzn1_local_timer_starting_cpu, NULL);
> +       if (ret < 0)
> +               return dev_err_probe(dev, ret, "Setup CPU hotplug state f=
ailed\n");
> +
> +       /*
> +        * At this point, no more operations can fail. Perform remaining
> +        * operations. Starting by handling the first 16-bit timer
> +        */
> +       timer =3D &tab_timers[RZN1_TIMER_BASE_INDEX_16BIT_TIMERS];
> +
> +       rzn1_timer_init(timer, RZN1_TIMER_BASE_INDEX_16BIT_TIMERS, base, =
clock_rate);
> +       rzn1_timer_config(timer, GENMASK(timer->width - 1, 0), true);
> +
> +       rzn1_sched_clock =3D timer;
> +
> +       sched_clock_register(rzn1_sched_read, rzn1_sched_clock->width, rz=
n1_sched_clock->rate);
> +
> +       rzn1_clocksource.mask =3D CLOCKSOURCE_MASK(rzn1_sched_clock->widt=
h);
> +       clocksource_register_hz(&rzn1_clocksource, rzn1_sched_clock->rate=
);
> +
> +       /*
> +        * Register clockevents only for 16-bit timers. 32-bit timers clo=
ckevents
> +        * are registered by CPU hotplug startup function set previously =
by the
> +        * cpuhp_setup_state() call.
> +        */
> +       for (i =3D RZN1_TIMER_BASE_INDEX_16BIT_TIMERS + 1; i < RZN1_TIMER=
_NB_16BIT_TIMERS; i++) {
> +               timer =3D &tab_timers[i];
> +               clockevents_config_and_register(&timer->ced, timer->rate,
> +                                               1, GENMASK(timer->width -=
 1, 0));
> +       }
> +
> +       return 0;
> +}
> +
> +static int rzn1_timer_probe_other(struct platform_device *pdev, struct r=
zn1_timer *tab_timers,
> +                                 void __iomem *base, unsigned long clock=
_rate)
> +{
> +       struct device *dev =3D &pdev->dev;
> +       struct rzn1_timer *timer;
> +       unsigned int i;
> +       char *name;
> +       int irq;
> +       int ret;
> +
> +       /*
> +        * Probe other instance(s), i.e. not the first one. In that case,
> +        * all timers are used as clock events and available for all poss=
ible
> +        * CPUs
> +        *
> +        * First step, perform all operation that could fail without call=
ing
> +        * clockevents_config_and_register(). Unregister counterpart does=
 not
> +        * exist and so, once called, we cannot remove the related resour=
ce.
> +        */
> +       for (i =3D 0; i < RZN1_TIMER_NB_TIMERS; i++) {

Technically "0" is RZN1_TIMER_BASE_INDEX_16BIT_TIMERS.

> +               timer =3D &tab_timers[i];
> +
> +               rzn1_timer_init(timer, i, base, clock_rate);
> +
> +               irq =3D platform_get_irq(pdev, i);
> +               if (irq < 0)
> +                       return irq;
> +
> +               name =3D devm_kasprintf(dev, GFP_KERNEL, "%s-%u", dev_nam=
e(dev), i);
> +               if (!name)
> +                       return -ENOMEM;
> +
> +               rzn1_timer_clkevt_init_ced(timer, name, irq);
> +
> +               ret =3D devm_request_irq(dev, timer->ced.irq, rzn1_timer_=
interrupt,
> +                                      IRQF_TIMER, timer->ced.name, timer=
);
> +               if (ret < 0)
> +                       return dev_err_probe(dev, irq, "timer%d: Failed t=
o request IRQ\n", i);

%u

> +
> +               rzn1_timer_int_enable(timer);
> +       }

This loop is identical to the first loop in rzn1_timer_probe_first(),
except for the lower bound. Perhaps it can be factored out?

> +
> +       /*
> +        * Second step, all operation that can fail have been called. We =
can
> +        * register our timers
> +        */
> +
> +       for (i =3D 0; i < RZN1_TIMER_NB_TIMERS; i++) {

Technically "0" is RZN1_TIMER_BASE_INDEX_16BIT_TIMERS.

> +               timer =3D &tab_timers[i];
> +               clockevents_config_and_register(&timer->ced, timer->rate,
> +                                               1, GENMASK(timer->width -=
 1, 0));
> +       }
> +
> +       return 0;
> +}

This loop is identical to the second loop in rzn1_timer_probe_first(),
except for the lower and upper bound. Perhaps it can be factored out?

Alternatively, you can
  1. Unify rzn1_timer_probe_{first,other}(), and pass the different
     bounds as parameters, OR
  2. Split rzn1_timer_probe_first() in three sub-functions, and call
     these from rzn1_timer_probe() directly.

> +static struct platform_driver rzn1_timer_driver =3D {
> +       .driver =3D {
> +               .name =3D "rzn1_timer",
> +               .of_match_table =3D rzn1_timer_of_match,

This driver can't be modular, and can't be unbound:

    .suppress_bind_attrs =3D true

> +       },
> +};
> +builtin_platform_driver_probe(rzn1_timer_driver, rzn1_timer_probe);

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

