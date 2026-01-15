Return-Path: <linux-renesas-soc+bounces-26815-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 873B3D2348A
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 15 Jan 2026 09:53:26 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 2628B3000DFE
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 15 Jan 2026 08:53:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1A87732AAD8;
	Thu, 15 Jan 2026 08:53:23 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-vk1-f170.google.com (mail-vk1-f170.google.com [209.85.221.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1690433A9EC
	for <linux-renesas-soc@vger.kernel.org>; Thu, 15 Jan 2026 08:53:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768467202; cv=none; b=p5cTKeRtDCUTBlTXc5oHDzz3vW4DfVLm8b5vmQIdWzjrCP6kTPc4QN1Q/DK/fftM3Nk1PeQI4lUlvf/f8f23iUNNuIC5XTwq6rh0kZnLUfo0dy2zUZAbDrdqMDDRG1e/Tz6u85diTIGmjY8EIs+ddaYFShjDMeoSE9wjzszEqVs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768467202; c=relaxed/simple;
	bh=Ic+BG6PwFENklasmULObFPSGqA588zsHCZepmm6A/P4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=IVzphK1STQXUq5Q1OXTDbxAmS11nE2AaVuueHWU9QOm5y8O3JdAgWFDZN1qiw9W56R1WVbxXvprdX4IbRAJ94fgOvbSxgMEYMe29UqIEif4drvsR1uNUtv/8d7g+smS0qpyczrNjoY4GGDDaeuEmLiuChFGwmeVs+a8bAO3RZQU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f170.google.com with SMTP id 71dfb90a1353d-5637b96211aso639414e0c.2
        for <linux-renesas-soc@vger.kernel.org>; Thu, 15 Jan 2026 00:53:18 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768467197; x=1769071997;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1p2XoRu+N3MN1gMwzSh5wyB5gfaCBHLjeZ1kZTlyHmo=;
        b=OaaPvKNQobyA1IYrmP9WV4jcC+dHXiX6uawIPGg7SGVNnd0pFUhn4yJzMoOSZ4TEmf
         /LHjTnPG6Dh00aH3asEjuZIct4kXf1D9kBse8Ubbe9kXy4wjuKqAEJtbHMgMLRjyvYUW
         zzwWbOcmbGpgMxX585K8c7xOmRiuH92IzwMLUvlJsnEA8hRDu5uy2RnrxpQ0p4VB+P4J
         FyV7t252Wykpfy7yaAN0CRJP8YH9vo1kU6MLhcFuJVD5kBVIlKx9q7R9dHtL6xz55aA/
         QDnAnRwHYzTI7orIG/2tiT61aVtq5ijvRF+TDIpEd4rSZUdDK/OU6IQNKermbG4KIOii
         d2og==
X-Forwarded-Encrypted: i=1; AJvYcCXmq11p106VYvXr/B4ONBmt/ON+fhIwD+QiZSjcqjF2efmCanzkk79M9lZ7Bhvf65oytn5wev/8sUybzVhitahl4A==@vger.kernel.org
X-Gm-Message-State: AOJu0YzoTFhctR3brJ54jVXQQ2kIoW5UqbgZMVx46nFLx4AW9BeAqOjH
	96JMIHV+c+gl13/NaBi4CfsvMn+Ku2wtT/Yrmb1NzBz7pa7tajkasoS1WsrZuRLC
X-Gm-Gg: AY/fxX66OMwhhk1XRSGEItOAQLkt+iOGtilYidwkH2D9dp4pi4xIDXXmVs2mzdJxLOP
	UFnIW3WPxaXTrPTOGYc6rnU2vtHfT7E9SpYtSU6c47Do/IahvpRZzW4tHrTKGuD/fqmQ1tiOLmq
	LebPohLmd5f5g+O2+wTTXJjJIe/LBBDAmHxHP9hFtbq187/65nZfrQ7S5lqD8rSy6YW1bQlRJuJ
	ZpUjVrntgrxQMx/n5ji+gVsG+KSTfnpEOMepSm2G8PLo/MgoTi/0fps6/HfWBok0WIWWzqXw7S4
	S5GOBWqxVIJ2xvYdpmEqdnhPgwVwmE4OgxHbZNNwFrKxcSD2zGjUWwfP/cAjSv8nDO4apxqBxcp
	asAUhJ2YGMQ0OuQDutDFnaUhanvgjfAcM8Z6HfQ8n9ikdDJtD3ePZh3kVMBhUZo2EZb8hFdCmKx
	myVP8IVgcWzsbsm2pRGHy4ceCwRddKDJx0z8EpAnflzNZbgWrYeyhj4M7Iprs=
X-Received: by 2002:a05:6122:2207:b0:563:702b:e2ab with SMTP id 71dfb90a1353d-563a09cec17mr2174077e0c.12.1768467197197;
        Thu, 15 Jan 2026 00:53:17 -0800 (PST)
Received: from mail-ua1-f44.google.com (mail-ua1-f44.google.com. [209.85.222.44])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-947bc43f085sm3293743241.5.2026.01.15.00.53.16
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 15 Jan 2026 00:53:17 -0800 (PST)
Received: by mail-ua1-f44.google.com with SMTP id a1e0cc1a2514c-94130b88642so451276241.3
        for <linux-renesas-soc@vger.kernel.org>; Thu, 15 Jan 2026 00:53:16 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCVWVEE31vIN4chH+i0tz/bxV5QSxBWZv2V31C+6qh6PAqFe4bgvC+ujc7zhf9Sr1NAKW2aJq5XNGY0czLzhGPHKcw==@vger.kernel.org
X-Received: by 2002:a05:6102:4b83:b0:5f1:4fb8:6b92 with SMTP id
 ada2fe7eead31-5f17f58c046mr2296699137.22.1768467196661; Thu, 15 Jan 2026
 00:53:16 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251230080115.2120612-1-zhenglifeng1@huawei.com>
 <20251230080115.2120612-4-zhenglifeng1@huawei.com> <CAMuHMdVeHk-Enc-M9ztwSdeAtE8YPKtJwq+273bGPEFOEsu=Rw@mail.gmail.com>
 <aWZriVlQZ5jRx2o4@arm.com> <CAMuHMdVgbQnaCQ8U8FK6J1vJLsqc0_MC7zSTX2B=rsuF2kpEKg@mail.gmail.com>
 <41b7398c-b1a4-4b87-b6f9-07eacf4f4752@huawei.com> <CAMuHMdUuTrF=eN5tMsjmOfWuuT9r7aCOTS7=YP6+KrSdNrhEpw@mail.gmail.com>
In-Reply-To: <CAMuHMdUuTrF=eN5tMsjmOfWuuT9r7aCOTS7=YP6+KrSdNrhEpw@mail.gmail.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 15 Jan 2026 09:53:05 +0100
X-Gmail-Original-Message-ID: <CAMuHMdVxZ5bbkDqib7jyG50YEnKX=KuHs-svMX7-o2SPz8WF6g@mail.gmail.com>
X-Gm-Features: AZwV_QiQCjp_xx6Rd7qqH4UVq_yR09vqEc-Jt_NOVYext6gLSj5FqsRdjfyRE28
Message-ID: <CAMuHMdVxZ5bbkDqib7jyG50YEnKX=KuHs-svMX7-o2SPz8WF6g@mail.gmail.com>
Subject: Re: [REPOST PATCH v6 3/3] arm64: topology: Handle AMU FIE setup on
 CPU hotplug
To: "zhenglifeng (A)" <zhenglifeng1@huawei.com>
Cc: Beata Michalska <beata.michalska@arm.com>, catalin.marinas@arm.com, will@kernel.org, 
	rafael@kernel.org, viresh.kumar@linaro.org, sudeep.holla@arm.com, 
	gregkh@linuxfoundation.org, dakr@kernel.org, ionela.voinescu@arm.com, 
	linux-arm-kernel@lists.infradead.org, linux-pm@vger.kernel.org, 
	linuxarm@huawei.com, jonathan.cameron@huawei.com, vincent.guittot@linaro.org, 
	zhanjie9@hisilicon.com, lihuisong@huawei.com, yubowen8@huawei.com, 
	zhangpengjie2@huawei.com, wangzhi12@huawei.com, linhongye@h-partners.com, 
	Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"

On Thu, 15 Jan 2026 at 09:37, Geert Uytterhoeven <geert@linux-m68k.org> wrote:
> On Thu, 15 Jan 2026 at 03:25, zhenglifeng (A) <zhenglifeng1@huawei.com> wrote:
> > On 2026/1/14 21:54, Geert Uytterhoeven wrote:
> > > The confusing part is in the (absence of) logging.
> > > If AMU is not supported, freq_counters_valid() uses:
> > >
> > >      pr_debug("CPU%d: counters are not supported.\n", cpu);
> > >
> > > which is typically not printed, unless DEBUG is enabled.
> > >
> > > If freq_counters_valid() failed, the new cpuhp_topology_online() uses:
> > >
> > >     pr_warn("CPU[%u] doesn't support AMU counters\n", cpu);
> > >
> > > which is always printed.
> > >
> > > Given freq_counters_valid() already prints a (debug) message, I think
> > > the pr_warn() should just be removed.  Do you agree, or is there still
> > > another incorrect check that should prevent getting this far?
> >
> > I'm OK with removing it.
>
> OK, I will send a patch.

https://lore.kernel.org/a8dbf49bfa44a6809fa4f34b918516847dc14460.1768466986.git.geert+renesas@glider.be/

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

