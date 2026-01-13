Return-Path: <linux-renesas-soc+bounces-26664-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D6FAD18409
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 13 Jan 2026 11:58:13 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 52244309CE0C
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 13 Jan 2026 10:53:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 71C4E38A70F;
	Tue, 13 Jan 2026 10:52:01 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-ua1-f47.google.com (mail-ua1-f47.google.com [209.85.222.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4EB9535C19B
	for <linux-renesas-soc@vger.kernel.org>; Tue, 13 Jan 2026 10:51:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768301521; cv=none; b=Js6VHHx7AZF/BIymiazQlz9lmi6MqhTFPKCCeARWndh42iJUUTp8lwjQ3q6Oe6jjLVSvyjPL1HMUiFqO/FFqVwtyOa8bhh8TCoey0wm7U4vwMoY21l1gIwMOffVwOeKrdVIX1zGbvwPhaKiuoG30UjHQnJCBvhjOiN6hP1UWFlw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768301521; c=relaxed/simple;
	bh=zVgC2T1qmVxIG0uAA9JbSZgg+CLSJlVw+aYdFAQNi+M=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=A7W822jPJ04i8aAigIDocZ+VY47GT4pNiWJ/eAogMG01Y2LobBn19vgri4V9REhtAwFT486tlUjW1Wt0KY1yKM5KX074fizWaxg/pS8D7FTRrMooTEvKMfP2K+DELocX2vf29LQnP64+VQUMgXxunw6nniMq1Pf4I9kWl72mlKQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.222.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ua1-f47.google.com with SMTP id a1e0cc1a2514c-93f64ae67dbso2219522241.1
        for <linux-renesas-soc@vger.kernel.org>; Tue, 13 Jan 2026 02:51:59 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768301518; x=1768906318;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kzWAvWlKk1ivM3WNqFslwu42j6W682o4xLEKdFkEC58=;
        b=Y9eBkfcO2uSsjwUa/6KBfBMRx9qbwQk5qfEgw9SrQmedS9RFmYf1gvVFCJWZUbMPqI
         bj26uoOuccQ8Vzpizbf/eruaO6sJQZBeP5M+46pdFlM+3dptEUDSG2G9tD78CfFOiCXL
         mcP7tXi4Vxtuts8aE4wzOhi2OKTBqjaFf25gbNn7KcxdUBKJN98HChMXKPHjlhZBzkMT
         Wi4JhSu8LKgwmgS5AyxdhXPVydph0S9EElwV9HwpEMqrXQLwXZxzh86XDw5BAcTXgT8V
         Yi78ZkTEqBVtFhrwwSobLVNbmZ/QcOk784ut0I/dJ2jBdDBwGnF7AUKhqsU4wW9eOtn2
         s8JQ==
X-Forwarded-Encrypted: i=1; AJvYcCVgTDBxadcWgoofPMSJjWGpffeM8+jYoD+cZPtgF79On/AlIJqYEoE86AuErHNHJQ4OlfFBrMW0FADgew8kLHHriw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yz2iyDKq0M6tQdjWBJI2Jmmxdiu9EM4S/HQjuYR3Cbbi3JRsGSh
	n96HU2pv/9Csb0LTfg+dUbWOPMyqvpjlIDBkDUnswsXoFSt3atmmCqN6WKo6YDDw
X-Gm-Gg: AY/fxX6rwpAAlSi6WmjOaeZA8IFmRLcndV/nwSqNTPwQz1890jNhVPl1/5IZwYFtHX3
	kDG3DwjTjr1nmZkGEF6HYzrqLKxtPtqSRWExuXyl1dpMoTS59PC6PjACdNdAr+7GVb6Y8IsNITz
	RZC2PavsICjRIvkEv8+AYTsmaTd4dNkKyqOgHoZycDfDpuQhDQ+xoKFsKYpIHfVfVIs4a+cOX4U
	ski+pTdvpsK1s3XR8Whn1TQcORJcbEV/eXlfdfuMI1wx2HS4ew8aCBaRivge2wxOpWmoJ3JaA+Y
	45WtQY27i3fGsHEFmP7VF1TRUNsNn/CwwsPyng2fYGRS000KRk1F4tIV04ozOQr0niXgJTZo7w0
	vJWcEkGdM9EH+xNP9evA0qVj5v9ledBPd2jne79TlsRPUrAY8ikta7r0meqMHgZ98obfBQIKJUa
	MDTrYBuW+Z0F9C7Cs9mY/TqQSh3AZZIyq5hH2tk2/BKLZxRWwF
X-Google-Smtp-Source: AGHT+IFdGWw4xp54QG+0l/LjREE04y9KBISmAxQawhIFRkhYvRXB1l6C4wiSG1HYqsv9Y2xPqUq5+g==
X-Received: by 2002:a05:6102:5e89:b0:5ee:a30b:d0e3 with SMTP id ada2fe7eead31-5eea30be1eemr6420213137.23.1768301518072;
        Tue, 13 Jan 2026 02:51:58 -0800 (PST)
Received: from mail-vs1-f42.google.com (mail-vs1-f42.google.com. [209.85.217.42])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-5ee9d013b3csm15547195137.5.2026.01.13.02.51.57
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 13 Jan 2026 02:51:57 -0800 (PST)
Received: by mail-vs1-f42.google.com with SMTP id ada2fe7eead31-5efa6d5dbf5so1281161137.1
        for <linux-renesas-soc@vger.kernel.org>; Tue, 13 Jan 2026 02:51:57 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCVcFlI/05gi8O6rF3rfCNIoAneOGGd+LbQjK0+nreCGXTrSTAFD/EOXdLLzX6JhE9N7IdX1YD4zqG2uC8XbVRLxhg==@vger.kernel.org
X-Received: by 2002:a05:6102:4412:b0:4e6:a338:a421 with SMTP id
 ada2fe7eead31-5ecb5cbb070mr8601476137.6.1768301516773; Tue, 13 Jan 2026
 02:51:56 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251230080115.2120612-1-zhenglifeng1@huawei.com> <20251230080115.2120612-4-zhenglifeng1@huawei.com>
In-Reply-To: <20251230080115.2120612-4-zhenglifeng1@huawei.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 13 Jan 2026 11:51:45 +0100
X-Gmail-Original-Message-ID: <CAMuHMdVeHk-Enc-M9ztwSdeAtE8YPKtJwq+273bGPEFOEsu=Rw@mail.gmail.com>
X-Gm-Features: AZwV_QisLfN-JbYTCLd4Pwog5D8ewcnp0Gg5r8ROYeUNPNSxroJTI4oVjqJhvbQ
Message-ID: <CAMuHMdVeHk-Enc-M9ztwSdeAtE8YPKtJwq+273bGPEFOEsu=Rw@mail.gmail.com>
Subject: Re: [REPOST PATCH v6 3/3] arm64: topology: Handle AMU FIE setup on
 CPU hotplug
To: Lifeng Zheng <zhenglifeng1@huawei.com>
Cc: catalin.marinas@arm.com, will@kernel.org, rafael@kernel.org, 
	viresh.kumar@linaro.org, sudeep.holla@arm.com, gregkh@linuxfoundation.org, 
	dakr@kernel.org, beata.michalska@arm.com, ionela.voinescu@arm.com, 
	linux-arm-kernel@lists.infradead.org, linux-pm@vger.kernel.org, 
	linuxarm@huawei.com, jonathan.cameron@huawei.com, vincent.guittot@linaro.org, 
	zhanjie9@hisilicon.com, lihuisong@huawei.com, yubowen8@huawei.com, 
	zhangpengjie2@huawei.com, wangzhi12@huawei.com, linhongye@h-partners.com, 
	Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"

Hi Lifeng,

On Tue, 30 Dec 2025 at 09:02, Lifeng Zheng <zhenglifeng1@huawei.com> wrote:
> Currently, when a cpufreq policy is created, the AMU FIE setup process
> checks all CPUs in the policy -- including those that are offline. If any
> of these CPUs are offline at that time, their AMU capability flag hasn't
> been verified yet, leading the check fail. As a result, AMU FIE is not
> enabled, even if the CPUs that are online do support it.
>
> Later, when the previously offline CPUs come online and report AMU support,
> there's no mechanism in place to re-enable AMU FIE for the policy. This
> leaves the entire frequency domain without AMU FIE, despite being eligible.
>
> Restrict the initial AMU FIE check to only those CPUs that are online at
> the time the policy is created, and allow CPUs that come online later to
> join the policy with AMU FIE enabled.
>
> Signed-off-by: Lifeng Zheng <zhenglifeng1@huawei.com>
> Acked-by: Beata Michalska <beata.michalska@arm.com>

Thanks for your patch, which is now commit 6fd9be0b7b2e957d
("arm64: topology: Handle AMU FIE setup on CPU hotplug") in
arm64/for-next/core (next-20260107 and later).

> --- a/arch/arm64/kernel/topology.c
> +++ b/arch/arm64/kernel/topology.c
> @@ -284,7 +284,7 @@ static int init_amu_fie_callback(struct notifier_block *nb, unsigned long val,
>         struct cpufreq_policy *policy = data;
>
>         if (val == CPUFREQ_CREATE_POLICY)
> -               amu_fie_setup(policy->related_cpus);
> +               amu_fie_setup(policy->cpus);
>
>         /*
>          * We don't need to handle CPUFREQ_REMOVE_POLICY event as the AMU
> @@ -303,10 +303,71 @@ static struct notifier_block init_amu_fie_notifier = {
>         .notifier_call = init_amu_fie_callback,
>  };
>
> +static int cpuhp_topology_online(unsigned int cpu)
> +{
> +       struct cpufreq_policy *policy = cpufreq_cpu_policy(cpu);
> +
> +       /* Those are cheap checks */
> +
> +       /*
> +        * Skip this CPU if:
> +        *  - it has no cpufreq policy assigned yet,
> +        *  - no policy exists that spans CPUs with AMU counters, or
> +        *  - it was already handled.
> +        */
> +       if (unlikely(!policy) || !cpumask_available(amu_fie_cpus) ||
> +           cpumask_test_cpu(cpu, amu_fie_cpus))
> +               return 0;
> +
> +       /*
> +        * Only proceed if all already-online CPUs in this policy
> +        * support AMU counters.
> +        */
> +       if (unlikely(!cpumask_subset(policy->cpus, amu_fie_cpus)))
> +               return 0;
> +
> +       /*
> +        * If the new online CPU cannot pass this check, all the CPUs related to
> +        * the same policy should be clear from amu_fie_cpus mask, otherwise they
> +        * may use different source of the freq scale.
> +        */
> +       if (!freq_counters_valid(cpu)) {
> +               pr_warn("CPU[%u] doesn't support AMU counters\n", cpu);

This is triggered during resume from s2ram on Renesas R-Car H3
(big.LITTLE 4x Cortex-A57 + 4x Cortex-A53), when enabling the first
little core:

    AMU: CPU[4] doesn't support AMU counters

Adding debug code:

    pr_info("Calling
topology_clear_scale_freq_source(SCALE_FREQ_SOURCE_ARCH, %*pbl)\n",
cpumask_pr_args(policy->related_cpus));
    pr_info("Calling cpumask_andnot(..., %*pbl, %*pbl)\n",
cpumask_pr_args(amu_fie_cpus), cpumask_pr_args(policy->related_cpus));

gives:

    AMU: Calling topology_clear_scale_freq_source(SCALE_FREQ_SOURCE_ARCH, 4-7)
    AMU: Calling cpumask_andnot(..., , 4-7)

so AMU is disabled for all little cores.

Since this only happens during s2ram, and not during initial CPU
bring-up on boot, this looks wrong to me?

> +               topology_clear_scale_freq_source(SCALE_FREQ_SOURCE_ARCH,
> +                                                policy->related_cpus);
> +               cpumask_andnot(amu_fie_cpus, amu_fie_cpus, policy->related_cpus);
> +               return 0;
> +       }
> +
> +       cpumask_set_cpu(cpu, amu_fie_cpus);
> +
> +       topology_set_scale_freq_source(&amu_sfd, cpumask_of(cpu));
> +
> +       pr_debug("CPU[%u]: counter will be used for FIE.", cpu);
> +
> +       return 0;
> +}
> +
>  static int __init init_amu_fie(void)
>  {
> -       return cpufreq_register_notifier(&init_amu_fie_notifier,
> +       int ret;
> +
> +       ret = cpufreq_register_notifier(&init_amu_fie_notifier,
>                                         CPUFREQ_POLICY_NOTIFIER);
> +       if (ret)
> +               return ret;
> +
> +       ret = cpuhp_setup_state_nocalls(CPUHP_AP_ONLINE_DYN,
> +                                       "arm64/topology:online",
> +                                       cpuhp_topology_online,
> +                                       NULL);
> +       if (ret < 0) {
> +               cpufreq_unregister_notifier(&init_amu_fie_notifier,
> +                                           CPUFREQ_POLICY_NOTIFIER);
> +               return ret;
> +       }
> +
> +       return 0;
>  }
>  core_initcall(init_amu_fie);
>
> diff --git a/drivers/base/arch_topology.c b/drivers/base/arch_topology.c
> index 84ec92bff642..c0ef6ea9c111 100644
> --- a/drivers/base/arch_topology.c
> +++ b/drivers/base/arch_topology.c
> @@ -34,7 +34,14 @@ EXPORT_PER_CPU_SYMBOL_GPL(capacity_freq_ref);
>
>  static bool supports_scale_freq_counters(const struct cpumask *cpus)
>  {
> -       return cpumask_subset(cpus, &scale_freq_counters_mask);
> +       int i;
> +
> +       for_each_cpu(i, cpus) {
> +               if (cpumask_test_cpu(i, &scale_freq_counters_mask))
> +                       return true;
> +       }
> +
> +       return false;
>  }
>
>  bool topology_scale_freq_invariant(void)

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

