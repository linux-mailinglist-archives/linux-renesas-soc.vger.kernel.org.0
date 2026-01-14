Return-Path: <linux-renesas-soc+bounces-26736-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id E66B0D1F387
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 14 Jan 2026 14:54:57 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id C897230087B4
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 14 Jan 2026 13:54:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1908C26B741;
	Wed, 14 Jan 2026 13:54:52 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-vk1-f175.google.com (mail-vk1-f175.google.com [209.85.221.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 20E0F26ED45
	for <linux-renesas-soc@vger.kernel.org>; Wed, 14 Jan 2026 13:54:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768398892; cv=none; b=QgyopU4mXEcayVXw2M4vfRbUtTqSuYqUsbydYtJ0NsPF37z5wO9/nkcOVnr7Z2xwptyaTeKqaBYcymEkPkHQ1OSrlxivjPU04biB6iMBLUzSOoKqJKwdHnvk0CC2IaXNL6ff/7Q26UTWb7ePC56qfCYR0oRBVOfp9/UietHi7TE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768398892; c=relaxed/simple;
	bh=KC6CzTSKWMfxqz4JG4C85CGQWTLzY6Yl9nFumKlYQ+s=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=aT+FD919y2Q3BilHf6TFiXhsiu6hfoKuDXqiwMJC5UckST1TB/pN0zZdsx4qKlJfwNS9OhQKeV+A/n7AghmoE3q8c9i4JzyJsp8J7/6rekrV33jtQ/ul/ZL+taiz92bm7L4hrYaGmZBnD+2E7a3GkKbrZwZhl/92FRX9TpQ2+zI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f175.google.com with SMTP id 71dfb90a1353d-5636784884eso1582278e0c.2
        for <linux-renesas-soc@vger.kernel.org>; Wed, 14 Jan 2026 05:54:49 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768398889; x=1769003689;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RZLqC1bLBjSQm/oEEjmqpl5nTEIq7+AXCXiTqeXbF7A=;
        b=gAjx4KvcQFVku9Ah1/8RmA7cwgRB7cerPhoq0ViAoQd8vGZnmeaf2gw+vyLYtRHX95
         M4MZS55B+39eeXrUntvfryYHauE0JCxgjubfAOIfnDNP4nDwftDzXLbXn4qULv1XZCEj
         nXTzRdXNvEaCu2qvvMRSkXktxF2RiVXB6GJ3Mw+KkjLA8Sn1H4nLHohkIbrk2nGdRpPy
         b1K8BBFHk8rbLq6g9dbG5t4nZaOLQX9cx+1Y2nIINAklDhMrQoSVCIZo103BnmYA9x9V
         XgYDnnIOoykpSVTp8a/HC1RKOIC4SPwZefu8bAfVPoDx/8xNw/ObnNbGZEb5/fFHR9/F
         KMfQ==
X-Forwarded-Encrypted: i=1; AJvYcCVWXu1ZhDayZ9HpNgtWy/RwXdpIekqJiTib6Z1161yqzqyBtD1N/8OlVezVtKVzXDZNKpn8z/v9zggA+4t1deBFRQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YxISE+KQbP2YR1+ckffzUGcsmB3UOspa73+eQbo5A/PQTX1EFaJ
	4XNt5P7r4OPbhDrzTzDP0n6GQ3fRn4TlHhYWBpao+3MwdiYsP9Pz18/rCvBovVD3
X-Gm-Gg: AY/fxX7QksrHV/XR3AK2UZ52OOzBH1A4P6h9fX1goXibn4JOQmKs//NK4EOtUQOMAfk
	+Wz+rmYOsraaNzyk/y45SqlU8J9h7mDNvlVbxPEZJDqtqpLrNporSdN4eSEz+dkJA1I7XWVWV78
	iOJI2OV+PbgoEaootBkEdG3Dwgv1dzLEO2DdWoKS9ABqPPM2XMas0HpoFNqJVlRFq0oYvTtnYc+
	THJJ/UZEtJWZk1gGwMH6yUUUfFNsStnUFf1PB3CNc+BJn3OhR+zEIseLOEGdTAuWqYRpLMhFyBw
	AmTFTt72kWo9paAPVm6D0yhzfyxLKPDEnjbnS4bCNToRzONe1q059Q5HlzMmjNwZRGEg5PebO/U
	INq2+0prpTKjHmZn6vjoPyFln3D5vxkixOQC5hwhFs9UmSF3IhWqkRX8EXJadHLNujMRS6wGu40
	/3MKVJ1t3pTrgyg/XJQmdd/H4wyKIPWmTFkKUc7PVU10aF8Opa
X-Received: by 2002:a05:6122:168c:b0:55b:1938:9183 with SMTP id 71dfb90a1353d-563a0935ce6mr944808e0c.4.1768398888756;
        Wed, 14 Jan 2026 05:54:48 -0800 (PST)
Received: from mail-ua1-f44.google.com (mail-ua1-f44.google.com. [209.85.222.44])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-56367b7dc8fsm15524186e0c.21.2026.01.14.05.54.47
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 14 Jan 2026 05:54:47 -0800 (PST)
Received: by mail-ua1-f44.google.com with SMTP id a1e0cc1a2514c-9412edb5defso2434349241.0
        for <linux-renesas-soc@vger.kernel.org>; Wed, 14 Jan 2026 05:54:47 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCWi2DIn/BvMqW7XZfo+muMTVqYIrLvwiVD+Xe5zVoZ5rYqCjxNJIATtoKXrDJl3qN2Cr2wPdD2AF54sLs+UITqJSg==@vger.kernel.org
X-Received: by 2002:a05:6102:4a96:b0:5ed:77d:fd6c with SMTP id
 ada2fe7eead31-5f17f5d8436mr999268137.21.1768398886733; Wed, 14 Jan 2026
 05:54:46 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251230080115.2120612-1-zhenglifeng1@huawei.com>
 <20251230080115.2120612-4-zhenglifeng1@huawei.com> <CAMuHMdVeHk-Enc-M9ztwSdeAtE8YPKtJwq+273bGPEFOEsu=Rw@mail.gmail.com>
 <aWZriVlQZ5jRx2o4@arm.com>
In-Reply-To: <aWZriVlQZ5jRx2o4@arm.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 14 Jan 2026 14:54:35 +0100
X-Gmail-Original-Message-ID: <CAMuHMdVgbQnaCQ8U8FK6J1vJLsqc0_MC7zSTX2B=rsuF2kpEKg@mail.gmail.com>
X-Gm-Features: AZwV_Qjx2dELiMfsKzad8VnoGFI8Ocod5E-6j0toQajY1saFLqz5CsCrIlg1Tmo
Message-ID: <CAMuHMdVgbQnaCQ8U8FK6J1vJLsqc0_MC7zSTX2B=rsuF2kpEKg@mail.gmail.com>
Subject: Re: [REPOST PATCH v6 3/3] arm64: topology: Handle AMU FIE setup on
 CPU hotplug
To: Beata Michalska <beata.michalska@arm.com>
Cc: Lifeng Zheng <zhenglifeng1@huawei.com>, catalin.marinas@arm.com, will@kernel.org, 
	rafael@kernel.org, viresh.kumar@linaro.org, sudeep.holla@arm.com, 
	gregkh@linuxfoundation.org, dakr@kernel.org, ionela.voinescu@arm.com, 
	linux-arm-kernel@lists.infradead.org, linux-pm@vger.kernel.org, 
	linuxarm@huawei.com, jonathan.cameron@huawei.com, vincent.guittot@linaro.org, 
	zhanjie9@hisilicon.com, lihuisong@huawei.com, yubowen8@huawei.com, 
	zhangpengjie2@huawei.com, wangzhi12@huawei.com, linhongye@h-partners.com, 
	Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"

Hi Beata,

On Tue, 13 Jan 2026 at 16:58, Beata Michalska <beata.michalska@arm.com> wrote:
> On Tue, Jan 13, 2026 at 11:51:45AM +0100, Geert Uytterhoeven wrote:
> > On Tue, 30 Dec 2025 at 09:02, Lifeng Zheng <zhenglifeng1@huawei.com> wrote:
> > > Currently, when a cpufreq policy is created, the AMU FIE setup process
> > > checks all CPUs in the policy -- including those that are offline. If any
> > > of these CPUs are offline at that time, their AMU capability flag hasn't
> > > been verified yet, leading the check fail. As a result, AMU FIE is not
> > > enabled, even if the CPUs that are online do support it.
> > >
> > > Later, when the previously offline CPUs come online and report AMU support,
> > > there's no mechanism in place to re-enable AMU FIE for the policy. This
> > > leaves the entire frequency domain without AMU FIE, despite being eligible.
> > >
> > > Restrict the initial AMU FIE check to only those CPUs that are online at
> > > the time the policy is created, and allow CPUs that come online later to
> > > join the policy with AMU FIE enabled.
> > >
> > > Signed-off-by: Lifeng Zheng <zhenglifeng1@huawei.com>
> > > Acked-by: Beata Michalska <beata.michalska@arm.com>
> >
> > Thanks for your patch, which is now commit 6fd9be0b7b2e957d
> > ("arm64: topology: Handle AMU FIE setup on CPU hotplug") in
> > arm64/for-next/core (next-20260107 and later).
> >
> > > --- a/arch/arm64/kernel/topology.c
> > > +++ b/arch/arm64/kernel/topology.c
> > > @@ -284,7 +284,7 @@ static int init_amu_fie_callback(struct notifier_block *nb, unsigned long val,
> > >         struct cpufreq_policy *policy = data;
> > >
> > >         if (val == CPUFREQ_CREATE_POLICY)
> > > -               amu_fie_setup(policy->related_cpus);
> > > +               amu_fie_setup(policy->cpus);
> > >
> > >         /*
> > >          * We don't need to handle CPUFREQ_REMOVE_POLICY event as the AMU
> > > @@ -303,10 +303,71 @@ static struct notifier_block init_amu_fie_notifier = {
> > >         .notifier_call = init_amu_fie_callback,
> > >  };
> > >
> > > +static int cpuhp_topology_online(unsigned int cpu)
> > > +{
> > > +       struct cpufreq_policy *policy = cpufreq_cpu_policy(cpu);
> > > +
> > > +       /* Those are cheap checks */
> > > +
> > > +       /*
> > > +        * Skip this CPU if:
> > > +        *  - it has no cpufreq policy assigned yet,
> > > +        *  - no policy exists that spans CPUs with AMU counters, or
> > > +        *  - it was already handled.
> > > +        */
> > > +       if (unlikely(!policy) || !cpumask_available(amu_fie_cpus) ||
> > > +           cpumask_test_cpu(cpu, amu_fie_cpus))
> > > +               return 0;
> > > +
> > > +       /*
> > > +        * Only proceed if all already-online CPUs in this policy
> > > +        * support AMU counters.
> > > +        */
> > > +       if (unlikely(!cpumask_subset(policy->cpus, amu_fie_cpus)))
> > > +               return 0;
> > > +
> > > +       /*
> > > +        * If the new online CPU cannot pass this check, all the CPUs related to
> > > +        * the same policy should be clear from amu_fie_cpus mask, otherwise they
> > > +        * may use different source of the freq scale.
> > > +        */
> > > +       if (!freq_counters_valid(cpu)) {
> > > +               pr_warn("CPU[%u] doesn't support AMU counters\n", cpu);
> >
> > This is triggered during resume from s2ram on Renesas R-Car H3
> > (big.LITTLE 4x Cortex-A57 + 4x Cortex-A53), when enabling the first
> > little core:
> >
> >     AMU: CPU[4] doesn't support AMU counters
> >
> > Adding debug code:
> >
> >     pr_info("Calling
> > topology_clear_scale_freq_source(SCALE_FREQ_SOURCE_ARCH, %*pbl)\n",
> > cpumask_pr_args(policy->related_cpus));
> >     pr_info("Calling cpumask_andnot(..., %*pbl, %*pbl)\n",
> > cpumask_pr_args(amu_fie_cpus), cpumask_pr_args(policy->related_cpus));
> >
> > gives:
> >
> >     AMU: Calling topology_clear_scale_freq_source(SCALE_FREQ_SOURCE_ARCH, 4-7)
> >     AMU: Calling cpumask_andnot(..., , 4-7)
> >
> > so AMU is disabled for all little cores.
> >
> > Since this only happens during s2ram, and not during initial CPU
> > bring-up on boot, this looks wrong to me?
> This does look rather surprising. If that CPU was marked as supporting AMUs at
> the initial bring-up it should be part of amu_fie_cpus mask, so the hp callback
> should bail out straight away. Would you be able to add some logs to see what
> that mask actually contains ?
> Furthermore, freq_counters_valid is logging issues when validating the counters.
> Would you be able to re-run it with the debug level to see what might be
> happening under the hood, although I am still unsure why it is even reaching
> that point ...

Adding extra debugging info, and "#define DEBUG" at the top.

During boot:

    AMU: amu_fie_setup:260: cpus 0-3 amu_fie_cpus
    ^^^ empty amu_fie_cpus
    AMU: CPU0: counters are not supported.
    ^^^ pr_debug
    AMU: amu_fie_setup:260: cpus 4-7 amu_fie_cpus
    ^^^ empty amu_fie_cpus
    AMU: CPU4: counters are not supported.
    ^^^ pr_debug

During resume from s2ram:

    AMU: cpuhp_topology_online:314: cpu 1 amu_fie_cpus
    AMU: cpuhp_topology_online:343: skipped
(!cpumask_subset(policy->cpus, amu_fie_cpus))
    AMU: cpuhp_topology_online:314: cpu 2 amu_fie_cpus
    AMU: cpuhp_topology_online:343: skipped
(!cpumask_subset(policy->cpus, amu_fie_cpus))
    AMU: cpuhp_topology_online:314: cpu 3 amu_fie_cpus
    AMU: cpuhp_topology_online:343: skipped
(!cpumask_subset(policy->cpus, amu_fie_cpus))
    AMU: cpuhp_topology_online:314: cpu 4 amu_fie_cpus
    AMU: CPU4: counters are not supported.
    ^^^ pr_debug
    AMU: CPU[4] doesn't support AMU counters
    ^^^ pr_warn
    AMU: Calling topology_clear_scale_freq_source(SCALE_FREQ_SOURCE_ARCH, 4-7)
    AMU: Calling cpumask_andnot(..., , 4-7)
    AMU: cpuhp_topology_online:314: cpu 5 amu_fie_cpus
    AMU: cpuhp_topology_online:343: skipped
(!cpumask_subset(policy->cpus, amu_fie_cpus))
    AMU: cpuhp_topology_online:314: cpu 6 amu_fie_cpus
    AMU: cpuhp_topology_online:343: skipped
(!cpumask_subset(policy->cpus, amu_fie_cpus))
    AMU: cpuhp_topology_online:314: cpu 7 amu_fie_cpus
    AMU: cpuhp_topology_online:343: skipped
(!cpumask_subset(policy->cpus, amu_fie_cpus))

Hence there is no issue, as AMU is not supported at all!

The confusing part is in the (absence of) logging.
If AMU is not supported, freq_counters_valid() uses:

     pr_debug("CPU%d: counters are not supported.\n", cpu);

which is typically not printed, unless DEBUG is enabled.

If freq_counters_valid() failed, the new cpuhp_topology_online() uses:

    pr_warn("CPU[%u] doesn't support AMU counters\n", cpu);

which is always printed.

Given freq_counters_valid() already prints a (debug) message, I think
the pr_warn() should just be removed.  Do you agree, or is there still
another incorrect check that should prevent getting this far?

Thanks!

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

