Return-Path: <linux-renesas-soc+bounces-27477-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id YDtIJnepeGl9rwEAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-27477-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 27 Jan 2026 13:03:03 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id DE39893F8B
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 27 Jan 2026 13:03:02 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 30BF2301CFA1
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 27 Jan 2026 12:03:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D9B23309F1B;
	Tue, 27 Jan 2026 12:03:00 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-vs1-f47.google.com (mail-vs1-f47.google.com [209.85.217.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 40D841CAA68
	for <linux-renesas-soc@vger.kernel.org>; Tue, 27 Jan 2026 12:02:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769515380; cv=none; b=jhCzf378WjmYlqe83CUpqT4McJMdFp1Y72ex1CsC16QFRe+v38P6ym25Rz7a5zl5qkvF6boBmWtC3bN/+jxFIlaB1jGbHPZNjS58QGczMfTNnwaBrsL9JH0ZH0HrxHpHZkbQ4hC63OZj+2rcBqmsneBP67NDQDT8P/cMLlV1SsM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769515380; c=relaxed/simple;
	bh=VSDhsz7hhQgS/GjFO9HWbBRYdCO4lfz6dTEe5eSZ5Co=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=HIGVIxPpWbfWqwRhIGGQPxRT9FW3935DTYpIB5mxacEuFV6sYyheuxpZ2og/zVgi6a2L0prS6pkFs12c9q9weDLoEIob3OKfj3SqvL3IejR/eJe/vx8iZA0ttX88CP/a0cuvZQMHzfwNcAFnnm2KWDIeAn80FVWMTJ5M5jq6ATY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.217.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vs1-f47.google.com with SMTP id ada2fe7eead31-5f52b0728ccso1876563137.2
        for <linux-renesas-soc@vger.kernel.org>; Tue, 27 Jan 2026 04:02:57 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769515377; x=1770120177;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=F1MjAM7V7GKMwIfo0dCUePGAiWLlyClrktdqGiTAq1E=;
        b=RNqXfgVSisveMV5DJTUPekGFgWcbx8b/HYTbFsPp121GERSc2pwbVxACFjqBTMzb4U
         mMUntV02rnM1+rueMu3X2A7ZDUbaXaBlCt7hf4uyLwZRek5ssJCzv4nchZRMXlixlkK5
         KsKhLD9uLo5vEnYKkn+/ZSzpxf+onsvdwvszb29IOPLARX5K7dRaU9pRPj+r0Hml9zE4
         1MBGAH0oXrcjbzEVbCh2Dg6mXjwvzpkiR2cdRP/PajCxjDep1+0DHT4KHg3ZlwD3dPVh
         mVOKl68232ay91xRwdpd3x5a+Qf4du0NwfzKQpNyEvveouM9HhKT+2YaPmVM3AKJ6G5X
         Sgww==
X-Forwarded-Encrypted: i=1; AJvYcCXheue7F+lrJOUlJZySJm07Wm3gp/BnmXAgHfdI5ZqjdEW2DeKj8mf0FCCwBb06jTtYTMw1VpAG55FSajrz7TqTBA==@vger.kernel.org
X-Gm-Message-State: AOJu0YzGABVCduV+OZDhBm7fK8AE5Ig2ey6kLRdDXyYo7mmWBhBH1Uo5
	xwNyu4HYS0gDwok03ieV8XC50KEv8SukzL1M5u5GgmZyuev5yWb38JEN+rbYS+/o
X-Gm-Gg: AZuq6aJ2KBmaQkG2FWBPStqvFBWmyLpxzF/X3HvjxczhTZLIg7FBvWM1PpedD/yHY45
	Bgto8nFkEPuudeVV+tkfAj4ISfV3IeqfeZPN6E9GzuOXNvwz75RI11FZ8pFL4/CEyEtPD8jyokj
	2NTr7o6J5Hc34Usse0drBBN+A69sFPtz0mndv4ElWGdtNrE9gKhgC2lGfqMsQ/jjpqIc1pzQivE
	5A3accfvqGEvbrOpM/9d8lWVu4DbUJhBmlKD/98VitfIvR4//56gxAS9el/9liOYt1saKxdCvSa
	INIMP9iYgdIxTF7qFOAzApPtF6g/cZoqyWbsooUSbJOcJXlB09zJJhYJy4yW1oW2XkTbfi7MmEH
	v55tDGVEnl6ELc2pEJ0lOS/vaDFE4eBdVnWNiCAtRupr22O/qcLsm54OlXp3iLnx8lQmU9HEhiU
	PUDKXY/ekTliLlKauWMs7K066TlHhce0KIHf80VcO4coUxeguu
X-Received: by 2002:a05:6102:948:b0:5f1:72a7:f879 with SMTP id ada2fe7eead31-5f72378e7a1mr597251137.28.1769515376794;
        Tue, 27 Jan 2026 04:02:56 -0800 (PST)
Received: from mail-ua1-f52.google.com (mail-ua1-f52.google.com. [209.85.222.52])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-9482e3727d3sm2443758241.10.2026.01.27.04.02.56
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 27 Jan 2026 04:02:56 -0800 (PST)
Received: by mail-ua1-f52.google.com with SMTP id a1e0cc1a2514c-944199736ebso1503533241.2
        for <linux-renesas-soc@vger.kernel.org>; Tue, 27 Jan 2026 04:02:56 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCW2ftcV8jBBDuiONrCKFePmg3jdehXgDITJayw52Ipi89PLCkclgZ3Kmf6QcyHQ+R1tf1TMk29gGsm0pCFnfXIbSg==@vger.kernel.org
X-Received: by 2002:a05:6102:a50:b0:5ed:675:e355 with SMTP id
 ada2fe7eead31-5f72378e301mr620065137.27.1769515376244; Tue, 27 Jan 2026
 04:02:56 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251223034836.2625547-1-jackzxcui1989@163.com>
 <CGME20260127103433eucas1p1ce8d8c194d4fd16d2f1dbbc0e9df28de@eucas1p1.samsung.com>
 <d1942304-ee30-478d-90fb-279519f3ae81@samsung.com> <aXic3pyl0xfTSYB-@tom-desktop>
In-Reply-To: <aXic3pyl0xfTSYB-@tom-desktop>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 27 Jan 2026 13:02:44 +0100
X-Gmail-Original-Message-ID: <CAMuHMdV2SLyrTs5MJKwAL2-jVLpd=TP+bMMnuEj-Ump0oyLjJA@mail.gmail.com>
X-Gm-Features: AZwV_QitHOaDYnXLTjC-AAT75rs03dxH0UgF1aly7BgaAEU8qPMzcTWF4eGkACQ
Message-ID: <CAMuHMdV2SLyrTs5MJKwAL2-jVLpd=TP+bMMnuEj-Ump0oyLjJA@mail.gmail.com>
Subject: Re: [PATCH v8] tty: tty_port: add workqueue to flip TTY buffer
To: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
Cc: Marek Szyprowski <m.szyprowski@samsung.com>, Xin Zhao <jackzxcui1989@163.com>, 
	gregkh@linuxfoundation.org, jirislaby@kernel.org, tj@kernel.org, 
	hch@infradead.org, linux-kernel@vger.kernel.org, linux-serial@vger.kernel.org, 
	Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.46 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[samsung.com,163.com,linuxfoundation.org,kernel.org,infradead.org,vger.kernel.org];
	RCVD_TLS_LAST(0.00)[];
	DMARC_NA(0.00)[linux-m68k.org];
	TAGGED_FROM(0.00)[bounces-27477-lists,linux-renesas-soc=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-renesas-soc];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[geert@linux-m68k.org,linux-renesas-soc@vger.kernel.org];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	R_DKIM_NA(0.00)[];
	NEURAL_HAM(-0.00)[-0.995];
	RCPT_COUNT_SEVEN(0.00)[10];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,mail.gmail.com:mid,renesas.com:email]
X-Rspamd-Queue-Id: DE39893F8B
X-Rspamd-Action: no action

On Tue, 27 Jan 2026 at 12:10, Tommaso Merciai
<tommaso.merciai.xr@bp.renesas.com> wrote:
> On Tue, Jan 27, 2026 at 11:34:32AM +0100, Marek Szyprowski wrote:
> > On 23.12.2025 04:48, Xin Zhao wrote:
> > > On the embedded platform, certain critical data, such as IMU data, is
> > > transmitted through UART. The tty_flip_buffer_push() interface in the TTY
> > > layer uses system_dfl_wq to handle the flipping of the TTY buffer.
> > > Although the unbound workqueue can create new threads on demand and wake
> > > up the kworker thread on an idle CPU, it may be preempted by real-time
> > > tasks or other high-prio tasks.
> > >
> > > flush_to_ldisc() needs to wake up the relevant data handle thread. When
> > > executing __wake_up_common_lock(), it calls spin_lock_irqsave(), which
> > > does not disable preemption but disables migration in RT-Linux. This
> > > prevents the kworker thread from being migrated to other cores by CPU's
> > > balancing logic, resulting in long delays. The call trace is as follows:
> > >      __wake_up_common_lock
> > >      __wake_up
> > >      ep_poll_callback
> > >      __wake_up_common
> > >      __wake_up_common_lock
> > >      __wake_up
> > >      n_tty_receive_buf_common
> > >      n_tty_receive_buf2
> > >      tty_ldisc_receive_buf
> > >      tty_port_default_receive_buf
> > >      flush_to_ldisc
> > >
> > > In our system, the processing interval for each frame of IMU data
> > > transmitted via UART can experience significant jitter due to this issue.
> > > Instead of the expected 10 to 15 ms frame processing interval, we see
> > > spikes up to 30 to 35 ms. Moreover, in just one or two hours, there can
> > > be 2 to 3 occurrences of such high jitter, which is quite frequent. This
> > > jitter exceeds the software's tolerable limit of 20 ms.
> > >
> > > Introduce flip_wq in tty_port which can be set by tty_port_link_wq() or as
> > > default linked to default workqueue allocated when tty_register_driver().
> > > The default workqueue is allocated with flag WQ_SYSFS, so that cpumask and
> > > nice can be set dynamically. The execution timing of tty_port_link_wq() is
> > > not clearly restricted. The newly added function tty_port_link_driver_wq()
> > > checks whether the flip_wq of the tty_port has already been assigned when
> > > linking the default tty_driver's workqueue to the port. After the user has
> > > set a custom workqueue for a certain tty_port using tty_port_link_wq(), the
> > > system will only use this custom workqueue, even if tty_driver does not
> > > have %TTY_DRIVER_CUSTOM_WORKQUEUE flag.
> > >
> > > Introduce %TTY_DRIVER_CUSTOM_WORKQUEUE flag meaning not to create the
> > > default single tty_driver workqueue. Two reasons why need to introduce the
> > > %TTY_DRIVER_CUSTOM_WORKQUEUE flag:
> > > 1. If the WQ_SYSFS parameter is enabled, workqueue_sysfs_register() will
> > > fail when trying to create a workqueue with the same name. The pty is an
> > > example of this; if both CONFIG_LEGACY_PTYS and CONFIG_UNIX98_PTYS are
> > > enabled, the call to tty_register_driver() in unix98_pty_init() will fail.
> > > 2. Different tty ports may be used for different tasks, which may require
> > > separate core binding control via workqueues. In this case, the workqueue
> > > created by default in the tty driver is unnecessary. Enabling this flag
> > > prevents the creation of this redundant workqueue.
> > >
> > > After applying this patch, we can set the related UART TTY flip buffer
> > > workqueue by sysfs. We set the cpumask to CPU cores associated with the
> > > IMU tasks, and set the nice to -20. Testing has shown significant
> > > improvement in the previously described issue, with almost no stuttering
> > > occurring anymore.
> > >
> > > Signed-off-by: Xin Zhao <jackzxcui1989@163.com>
> >
> > This patch landed in linux-next as commit d000422a46aa ("tty: tty_port:
> > add workqueue to flip TTY buffer"). In my tests I found that it causes
> > some regressions, see the comments in the code below.
>
> Same here, testing on RZ/G3E looks like s2idle is broken:

> [  185.237717] Call trace:
> [  185.240176]  __queue_work+0x20/0x474 (P)
> [  185.244141]  queue_work_on+0x8c/0xa8
> [  185.247753]  tty_flip_buffer_push+0x2c/0x38

Lucky you, there is a hint to tty in your trace ;-)

I see a similar crash during boot on koelsch (R-Car M2-W), and a
lock-up during boot on salvator-xs (R-Car H3 ES2.0), with either no
output or an rcu stall:

    rcu: INFO: rcu_preempt detected stalls on CPUs/tasks:
    rcu:     1-...!: (0 ticks this GP) idle=1fe8/0/0x0 softirq=85/85
fqs=1 (false positive?)
    rcu:     2-...!: (1 ticks this GP) idle=1c78/0/0x0 softirq=77/77
fqs=1 (false positive?)
    rcu:     6-...!: (0 ticks this GP) idle=07b8/0/0x0 softirq=9/9
fqs=1 (false positive?)
    rcu:     (detected by 3, t=5260 jiffies, g=-1015, q=274 ncpus=8)
    Sending NMI from CPU 3 to CPUs 1:
    Sending NMI from CPU 3 to CPUs 2:
    Sending NMI from CPU 3 to CPUs 6:
    rcu: rcu_preempt kthread timer wakeup didn't happen for 12771
jiffies! g-1015 f0x0 RCU_GP_WAIT_FQS(5) ->state=0x200
    rcu:     Possible timer handling issue on cpu=6 timer-softirq=1
    rcu: rcu_preempt kthread starved for 12780 jiffies! g-1015 f0x0
RCU_GP_WAIT_FQS(5) ->state=0x200 ->cpu=6
    rcu:     Unless rcu_preempt kthread gets sufficient CPU time, OOM
is now expected behavior.
    rcu: RCU grace-period kthread stack dump:
    task:rcu_preempt     state:R stack:0     pid:15    tgid:15
ppid:2      task_flags:0x208040 flags:0x00000010
    Call trace:
     __switch_to+0xcc/0x100 (T)
     __schedule+0x368/0xc00
     schedule+0x30/0x100
     schedule_timeout+0x80/0xf8
     rcu_gp_fqs_loop+0xfc/0x418
     rcu_gp_kthread+0xe0/0xf4
     kthread+0x128/0x1e0
     ret_from_fork+0x10/0x20

Reverting commit d000422a46aad322 ("tty: tty_port: add workqueue to
flip TTY buffer") in tty-next fixes both.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

