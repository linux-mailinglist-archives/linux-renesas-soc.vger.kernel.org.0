Return-Path: <linux-renesas-soc+bounces-11872-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 17477A022C3
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  6 Jan 2025 11:18:28 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 412B21882D85
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  6 Jan 2025 10:18:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 59634199391;
	Mon,  6 Jan 2025 10:18:24 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-vk1-f179.google.com (mail-vk1-f179.google.com [209.85.221.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2AEF51EEF9;
	Mon,  6 Jan 2025 10:18:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736158704; cv=none; b=N6XWnrchlg92FJmVJpYyPT2LJ5tjadYXEUIGOBsBv2NxvzCv6JfIQcwX8qVX9U07I4tXtcaHGSG4sqEg017UdW6y9wFG2Wi9O+86YHX4qIUCMXsu+QRKgx8h6B6BXtQ83oo3S45VroEg1p5wEXxs0/2kMZdx0NHUpknR3xy75sI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736158704; c=relaxed/simple;
	bh=Blv97fwMdHQS0RKmZxhrLI011NuTaKYEBkVfCRfupw4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=AA4UlTf6Rsmx4Jp1IbzEqNPXbnVwzIXrNJ8HhyRRQJCMpUC3OH0rHEn81oJBi5aqExAsVxMFPkFfpRoLTpxT9bmM9tN6yIgAPZpFFJ5Pro2sSPCgw9npOmmP0fmThMgaYsq+4w9kQ5zPRUZKGqy+n0yTmTlwgaWR0oCKsBeGsUg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f179.google.com with SMTP id 71dfb90a1353d-51bb020339fso2939176e0c.0;
        Mon, 06 Jan 2025 02:18:21 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736158700; x=1736763500;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=VFiw2m0qYuDUxpznSFuo6WroJW1SYr3XFORf2X9DILQ=;
        b=Ntb4Yko/SqHocAP8c8eVZ5nzJr1XIzNglkpzo23itQsH9+QmiSQniuIwWEhvV1WRJs
         vR73ZboqiC9HoJ7FbUob3/hV2IfHriZBmlXT1CmgAmXNI18OkqjDz5x98nZLn87Jcg+f
         iEZZOgzBPD1+CS0Nt3UGkb9lTsUXFsNo40ttUFPhsxobjTFLaM4UId6eAGDZhPqr3ta4
         Zm3u0HeZ1+dRaraqBjDeE00WFFt4j3UfvT3n9JpJ49CFn56CjU3dQToAmyURMUQbPJkW
         kNq9LRcY32D2BdIzT9rMIdYWDsZEbQeXT/8tafA43j9r52BXFiPA3aX6yzyx+jqCvBWE
         QSxg==
X-Forwarded-Encrypted: i=1; AJvYcCV8GPU7+QCIS03rjgbZy4OWxQl9fRZ3XEQX3bi0OdbtzL2bgwvJqH7w4EXBCoPZBR++Yd2mFBZjRzUQZ8E=@vger.kernel.org, AJvYcCXbMHPcYAnUT+ucBN470mKpKf0YgsjMagPOl2oNqvAkBibGUbJH7i8gASqRf852Q8e2ETpz7jdzym/q+soFirobmEk=@vger.kernel.org
X-Gm-Message-State: AOJu0YyARgruHZtkP0PLEGOHDsh7IAEpksSX9NLvriwPotcc/vMgNox7
	jGZpsiLqeznZ3dlrAPfe20xEV+nlE2oaBFkEm4vdF+VU77j1LZ4fCvWiowYT
X-Gm-Gg: ASbGnctu3yXeM4A5WhQG1E+heFA48D7uLeOM7ZkYXJEW2hL+jsqCNbDsC7x+fpnE+m+
	C3uPAg8SnWorUOcPUcB2zSGMlitfmPJlKzG171etqfF2d73TOT2B/Hsco6tRMHqGY3icYPL0R/2
	eitvDnHFhX74U015rlbYUxHIhhd6u5Gmv3OqW6fvqZIvAmO4dAvMGbCLHKYNgD3WCLAYgxm5YO5
	DjSdfPj2bt4w2pn44fWdZBzMhQjRXEJH2FXDYXU4jtSvYLwsSUgnx4vbY1JuhWRYxu1cg+Nhd/t
	qfYhlrW3zP/4M4A9xSIHTGw=
X-Google-Smtp-Source: AGHT+IGjZSD6vBe+HYSH3WFp5N/9hKIF+uz0iFmzjVIquTPtmH2ldl81b8hVtMsrKeyAUXE/cEo7gA==
X-Received: by 2002:a05:6122:370d:b0:516:2209:9032 with SMTP id 71dfb90a1353d-51b75c31269mr47123489e0c.2.1736158700669;
        Mon, 06 Jan 2025 02:18:20 -0800 (PST)
Received: from mail-vk1-f177.google.com (mail-vk1-f177.google.com. [209.85.221.177])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-8610ac6b800sm7265689241.15.2025.01.06.02.18.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 06 Jan 2025 02:18:20 -0800 (PST)
Received: by mail-vk1-f177.google.com with SMTP id 71dfb90a1353d-51bb020339fso2939167e0c.0;
        Mon, 06 Jan 2025 02:18:20 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCUNozctRXzDM6gKkC8Kr7btdPizINU+FtjIwR+ZHJqDGp010rD5RbCV7oGK2IoMJPmn/uKY9OtL5VxNfAU=@vger.kernel.org, AJvYcCUbLHdKVIThvC/vuc2yxDAHxl7ZwuA7UBx2SumIVuZTPNqvH75+bfOd9akIqsaHlPTjBWoD/NxRktcOr089UQxcbmQ=@vger.kernel.org
X-Received: by 2002:a05:6122:318f:b0:518:a2af:d666 with SMTP id
 71dfb90a1353d-51b75c30618mr35360461e0c.1.1736158700259; Mon, 06 Jan 2025
 02:18:20 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241221033321.4154409-1-koichiro.den@canonical.com>
 <ff6461df-25d1-494f-ad34-763faf249309@lucifer.local> <2q7ge6cgzeowqffyn6w6ed4trhaaumv5ubdgud2tsoolen7wpw@4akuomhbacyh>
In-Reply-To: <2q7ge6cgzeowqffyn6w6ed4trhaaumv5ubdgud2tsoolen7wpw@4akuomhbacyh>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 6 Jan 2025 11:18:08 +0100
X-Gmail-Original-Message-ID: <CAMuHMdWvW7hsUq68xuX-YNApk06zMMzRsHMCDCLcrsTiEUkuDg@mail.gmail.com>
X-Gm-Features: AbW1kvbMfnk2SgBXKVUIV0YROpavUz-OLtnVYxy0TWeDhPN2Kq31j9pnnSSq8o0
Message-ID: <CAMuHMdWvW7hsUq68xuX-YNApk06zMMzRsHMCDCLcrsTiEUkuDg@mail.gmail.com>
Subject: Re: [PATCH v2] vmstat: disable vmstat_work on vmstat_cpu_down_prep()
To: Koichiro Den <koichiro.den@canonical.com>
Cc: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>, linux-mm@kvack.org, 
	akpm@linux-foundation.org, linux-kernel@vger.kernel.org, 
	Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Koichiro,

On Sat, Jan 4, 2025 at 5:00=E2=80=AFAM Koichiro Den <koichiro.den@canonical=
.com> wrote:
> On Fri, Jan 03, 2025 at 11:33:19PM +0000, Lorenzo Stoakes wrote:
> > On Sat, Dec 21, 2024 at 12:33:20PM +0900, Koichiro Den wrote:
> > > Even after mm/vmstat:online teardown, shepherd may still queue work f=
or
> > > the dying cpu until the cpu is removed from online mask. While it's
> > > quite rare, this means that after unbind_workers() unbinds a per-cpu
> > > kworker, it potentially runs vmstat_update for the dying CPU on an
> > > irrelevant cpu before entering atomic AP states.
> > > When CONFIG_DEBUG_PREEMPT=3Dy, it results in the following error with=
 the
> > > backtrace.
> > >
> > >   BUG: using smp_processor_id() in preemptible [00000000] code: \
> > >                                                kworker/7:3/1702
> > >   caller is refresh_cpu_vm_stats+0x235/0x5f0
> > >   CPU: 0 UID: 0 PID: 1702 Comm: kworker/7:3 Tainted: G
> > >   Tainted: [N]=3DTEST
> > >   Workqueue: mm_percpu_wq vmstat_update
> > >   Call Trace:
> > >    <TASK>
> > >    dump_stack_lvl+0x8d/0xb0
> > >    check_preemption_disabled+0xce/0xe0
> > >    refresh_cpu_vm_stats+0x235/0x5f0
> > >    vmstat_update+0x17/0xa0
> > >    process_one_work+0x869/0x1aa0
> > >    worker_thread+0x5e5/0x1100
> > >    kthread+0x29e/0x380
> > >    ret_from_fork+0x2d/0x70
> > >    ret_from_fork_asm+0x1a/0x30
> > >    </TASK>
> > >
> > > So, for mm/vmstat:online, disable vmstat_work reliably on teardown an=
d
> > > symmetrically enable it on startup.
> > >
> > > Signed-off-by: Koichiro Den <koichiro.den@canonical.com>
> >
> > I observed a warning in my qemu and real hardware, which I bisected to =
this commit:
> >
> > [    0.087733] ------------[ cut here ]------------
> > [    0.087733] workqueue: work disable count underflowed
> > [    0.087733] WARNING: CPU: 1 PID: 21 at kernel/workqueue.c:4313 enabl=
e_work+0xb5/0xc0

I am seeing the same on arm32 (R-Car M2-W) and arm64 (R-Car H3 ES2.0).

> Thank you for the report. I was able to reproduce the warning and now
> wonder how I missed it.. My oversight, apologies.
>
> In my current view, the simplest solution would be to make sure a local
> vmstat_work is disabled until vmstat_cpu_online() runs for the cpu, even
> during boot-up. The following patch suppresses the warning:
>
>   diff --git a/mm/vmstat.c b/mm/vmstat.c
>   index 0889b75cef14..19ceed5d34bf 100644
>   --- a/mm/vmstat.c
>   +++ b/mm/vmstat.c
>   @@ -2122,10 +2122,14 @@ static void __init start_shepherd_timer(void)
>    {
>           int cpu;
>
>   -       for_each_possible_cpu(cpu)
>   +       for_each_possible_cpu(cpu) {
>                   INIT_DEFERRABLE_WORK(per_cpu_ptr(&vmstat_work, cpu),
>                           vmstat_update);
>
>   +               /* will be enabled on vmstat_cpu_online */
>   +               disable_delayed_work_sync(&per_cpu(vmstat_work, cpu));
>   +       }
>   +
>           schedule_delayed_work(&shepherd,
>                   round_jiffies_relative(sysctl_stat_interval));
>    }
>
> If you think of a better solution later, please let me know. Otherwise,
> I'll submit a follow-up fix patch with the above diff.

Thank you, that fixes the warnings for me!
Tested-by: Geert Uytterhoeven <geert+renesas@glider.be>

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

