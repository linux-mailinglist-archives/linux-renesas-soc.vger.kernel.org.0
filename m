Return-Path: <linux-renesas-soc+bounces-27478-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id sPh4M4+2eGlzsQEAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-27478-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 27 Jan 2026 13:58:55 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 72E0994980
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 27 Jan 2026 13:58:55 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 415B9301A425
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 27 Jan 2026 12:58:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8AA85355816;
	Tue, 27 Jan 2026 12:58:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="eQBRy99R"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A6422D837C;
	Tue, 27 Jan 2026 12:58:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769518680; cv=none; b=MSHHq+dnfW/8UI734EVPf7U0YwkNuZmUX9OSEtBLfqiid9aglfyUbSshYG4ChpQJocuaygVlPML2Y89qrVDOC/M4kgbSkG7cXYWIbmQAhV05jKtNaGqd0vbApegTu/CeHWotF4k+PwRg3tU5oTK/Flhi0VfZXYg0DQ/q4kw5CLA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769518680; c=relaxed/simple;
	bh=3o64PwU28ysjnNUiRB1D57wvNoSimtplK+EBmTlnC9w=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=a3Mo/tkF4KQbyVHtr0gH361bgYG07Jy1zb6V9Mbnc/dZv5f+KqftvR5BWAOd2a52k/E8GaU1kvhye2vVteEFK+cct4yRDzjvbKso2ub/DD/dq+FgAHzAOxJi3xyl+/zly5tAlOfbJl1w5w6m0G97edB3awnVV6ltgWX6h0iWFeU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=eQBRy99R; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8ACA7C116C6;
	Tue, 27 Jan 2026 12:57:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1769518679;
	bh=3o64PwU28ysjnNUiRB1D57wvNoSimtplK+EBmTlnC9w=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=eQBRy99R/xG1kluqhxZ1tmjcKJJpwKeCxg+7OsxRlbAUIP4fK/J/uT09g9OLyhwdI
	 aKhX9PUrvmQgoV3o/DFIOaQ3MSZ+fzf91+QpImzyxH+FJeUogZB0yWm4wI6XZhZ5gu
	 QZ/hEX9lyE7AS2lzDvlS2/U5RtspqLJOXNmr51iE=
Date: Tue, 27 Jan 2026 13:57:56 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>,
	Marek Szyprowski <m.szyprowski@samsung.com>,
	Xin Zhao <jackzxcui1989@163.com>, jirislaby@kernel.org,
	tj@kernel.org, hch@infradead.org, linux-kernel@vger.kernel.org,
	linux-serial@vger.kernel.org,
	Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Subject: Re: [PATCH v8] tty: tty_port: add workqueue to flip TTY buffer
Message-ID: <2026012739-compile-bling-3779@gregkh>
References: <20251223034836.2625547-1-jackzxcui1989@163.com>
 <CGME20260127103433eucas1p1ce8d8c194d4fd16d2f1dbbc0e9df28de@eucas1p1.samsung.com>
 <d1942304-ee30-478d-90fb-279519f3ae81@samsung.com>
 <aXic3pyl0xfTSYB-@tom-desktop>
 <CAMuHMdV2SLyrTs5MJKwAL2-jVLpd=TP+bMMnuEj-Ump0oyLjJA@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAMuHMdV2SLyrTs5MJKwAL2-jVLpd=TP+bMMnuEj-Ump0oyLjJA@mail.gmail.com>
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [2.34 / 15.00];
	MID_END_EQ_FROM_USER_PART(4.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[linuxfoundation.org,none];
	MID_RHS_NOT_FQDN(0.50)[];
	R_DKIM_ALLOW(-0.20)[linuxfoundation.org:s=korg];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-27478-lists,linux-renesas-soc=lfdr.de];
	FREEMAIL_CC(0.00)[bp.renesas.com,samsung.com,163.com,kernel.org,infradead.org,vger.kernel.org];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[linuxfoundation.org:+];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	MISSING_XM_UA(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[gregkh@linuxfoundation.org,linux-renesas-soc@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[10];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-renesas-soc];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,linuxfoundation.org:dkim,renesas.com:email]
X-Rspamd-Queue-Id: 72E0994980
X-Rspamd-Action: no action

On Tue, Jan 27, 2026 at 01:02:44PM +0100, Geert Uytterhoeven wrote:
> On Tue, 27 Jan 2026 at 12:10, Tommaso Merciai
> <tommaso.merciai.xr@bp.renesas.com> wrote:
> > On Tue, Jan 27, 2026 at 11:34:32AM +0100, Marek Szyprowski wrote:
> > > On 23.12.2025 04:48, Xin Zhao wrote:
> > > > On the embedded platform, certain critical data, such as IMU data, is
> > > > transmitted through UART. The tty_flip_buffer_push() interface in the TTY
> > > > layer uses system_dfl_wq to handle the flipping of the TTY buffer.
> > > > Although the unbound workqueue can create new threads on demand and wake
> > > > up the kworker thread on an idle CPU, it may be preempted by real-time
> > > > tasks or other high-prio tasks.
> > > >
> > > > flush_to_ldisc() needs to wake up the relevant data handle thread. When
> > > > executing __wake_up_common_lock(), it calls spin_lock_irqsave(), which
> > > > does not disable preemption but disables migration in RT-Linux. This
> > > > prevents the kworker thread from being migrated to other cores by CPU's
> > > > balancing logic, resulting in long delays. The call trace is as follows:
> > > >      __wake_up_common_lock
> > > >      __wake_up
> > > >      ep_poll_callback
> > > >      __wake_up_common
> > > >      __wake_up_common_lock
> > > >      __wake_up
> > > >      n_tty_receive_buf_common
> > > >      n_tty_receive_buf2
> > > >      tty_ldisc_receive_buf
> > > >      tty_port_default_receive_buf
> > > >      flush_to_ldisc
> > > >
> > > > In our system, the processing interval for each frame of IMU data
> > > > transmitted via UART can experience significant jitter due to this issue.
> > > > Instead of the expected 10 to 15 ms frame processing interval, we see
> > > > spikes up to 30 to 35 ms. Moreover, in just one or two hours, there can
> > > > be 2 to 3 occurrences of such high jitter, which is quite frequent. This
> > > > jitter exceeds the software's tolerable limit of 20 ms.
> > > >
> > > > Introduce flip_wq in tty_port which can be set by tty_port_link_wq() or as
> > > > default linked to default workqueue allocated when tty_register_driver().
> > > > The default workqueue is allocated with flag WQ_SYSFS, so that cpumask and
> > > > nice can be set dynamically. The execution timing of tty_port_link_wq() is
> > > > not clearly restricted. The newly added function tty_port_link_driver_wq()
> > > > checks whether the flip_wq of the tty_port has already been assigned when
> > > > linking the default tty_driver's workqueue to the port. After the user has
> > > > set a custom workqueue for a certain tty_port using tty_port_link_wq(), the
> > > > system will only use this custom workqueue, even if tty_driver does not
> > > > have %TTY_DRIVER_CUSTOM_WORKQUEUE flag.
> > > >
> > > > Introduce %TTY_DRIVER_CUSTOM_WORKQUEUE flag meaning not to create the
> > > > default single tty_driver workqueue. Two reasons why need to introduce the
> > > > %TTY_DRIVER_CUSTOM_WORKQUEUE flag:
> > > > 1. If the WQ_SYSFS parameter is enabled, workqueue_sysfs_register() will
> > > > fail when trying to create a workqueue with the same name. The pty is an
> > > > example of this; if both CONFIG_LEGACY_PTYS and CONFIG_UNIX98_PTYS are
> > > > enabled, the call to tty_register_driver() in unix98_pty_init() will fail.
> > > > 2. Different tty ports may be used for different tasks, which may require
> > > > separate core binding control via workqueues. In this case, the workqueue
> > > > created by default in the tty driver is unnecessary. Enabling this flag
> > > > prevents the creation of this redundant workqueue.
> > > >
> > > > After applying this patch, we can set the related UART TTY flip buffer
> > > > workqueue by sysfs. We set the cpumask to CPU cores associated with the
> > > > IMU tasks, and set the nice to -20. Testing has shown significant
> > > > improvement in the previously described issue, with almost no stuttering
> > > > occurring anymore.
> > > >
> > > > Signed-off-by: Xin Zhao <jackzxcui1989@163.com>
> > >
> > > This patch landed in linux-next as commit d000422a46aa ("tty: tty_port:
> > > add workqueue to flip TTY buffer"). In my tests I found that it causes
> > > some regressions, see the comments in the code below.
> >
> > Same here, testing on RZ/G3E looks like s2idle is broken:
> 
> > [  185.237717] Call trace:
> > [  185.240176]  __queue_work+0x20/0x474 (P)
> > [  185.244141]  queue_work_on+0x8c/0xa8
> > [  185.247753]  tty_flip_buffer_push+0x2c/0x38
> 
> Lucky you, there is a hint to tty in your trace ;-)
> 
> I see a similar crash during boot on koelsch (R-Car M2-W), and a
> lock-up during boot on salvator-xs (R-Car H3 ES2.0), with either no
> output or an rcu stall:
> 
>     rcu: INFO: rcu_preempt detected stalls on CPUs/tasks:
>     rcu:     1-...!: (0 ticks this GP) idle=1fe8/0/0x0 softirq=85/85
> fqs=1 (false positive?)
>     rcu:     2-...!: (1 ticks this GP) idle=1c78/0/0x0 softirq=77/77
> fqs=1 (false positive?)
>     rcu:     6-...!: (0 ticks this GP) idle=07b8/0/0x0 softirq=9/9
> fqs=1 (false positive?)
>     rcu:     (detected by 3, t=5260 jiffies, g=-1015, q=274 ncpus=8)
>     Sending NMI from CPU 3 to CPUs 1:
>     Sending NMI from CPU 3 to CPUs 2:
>     Sending NMI from CPU 3 to CPUs 6:
>     rcu: rcu_preempt kthread timer wakeup didn't happen for 12771
> jiffies! g-1015 f0x0 RCU_GP_WAIT_FQS(5) ->state=0x200
>     rcu:     Possible timer handling issue on cpu=6 timer-softirq=1
>     rcu: rcu_preempt kthread starved for 12780 jiffies! g-1015 f0x0
> RCU_GP_WAIT_FQS(5) ->state=0x200 ->cpu=6
>     rcu:     Unless rcu_preempt kthread gets sufficient CPU time, OOM
> is now expected behavior.
>     rcu: RCU grace-period kthread stack dump:
>     task:rcu_preempt     state:R stack:0     pid:15    tgid:15
> ppid:2      task_flags:0x208040 flags:0x00000010
>     Call trace:
>      __switch_to+0xcc/0x100 (T)
>      __schedule+0x368/0xc00
>      schedule+0x30/0x100
>      schedule_timeout+0x80/0xf8
>      rcu_gp_fqs_loop+0xfc/0x418
>      rcu_gp_kthread+0xe0/0xf4
>      kthread+0x128/0x1e0
>      ret_from_fork+0x10/0x20
> 
> Reverting commit d000422a46aad322 ("tty: tty_port: add workqueue to
> flip TTY buffer") in tty-next fixes both.

Thanks all for the reports, I'll go revert this for now, sorry for the
problems!

greg k-h

