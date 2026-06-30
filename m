Return-Path: <linux-renesas-soc+bounces-34574-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id y6L7BM//Q2p9nAoAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-34574-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 30 Jun 2026 19:41:35 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 600256E6FBD
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 30 Jun 2026 19:41:34 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=none;
	dmarc=none;
	spf=pass (mail.lfdr.de: domain of "linux-renesas-soc+bounces-34574-lists+linux-renesas-soc=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-renesas-soc+bounces-34574-lists+linux-renesas-soc=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 36D0630363B5
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 30 Jun 2026 17:39:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CC3843DDDAE;
	Tue, 30 Jun 2026 17:39:18 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-vk1-f173.google.com (mail-vk1-f173.google.com [209.85.221.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 44BEF3DB652
	for <linux-renesas-soc@vger.kernel.org>; Tue, 30 Jun 2026 17:39:16 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782841158; cv=none; b=lCX1KJO9fKaPe0HEo+Qr3vPaCfxhKlsxrFefotrYl8L9gYWEZ3qi0kxVBdlR4iWgWWUY8fG6hpyw/WyNseF7MAm1Zadjm/WA8H4DQ3cxVKEakhryaKkVXjq9iJ6lhzGA6wuboW1mjEfOsU5X7D3vDux0yj5ClsJIDPNRM4VFV2Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782841158; c=relaxed/simple;
	bh=ceIQFcyKSTFsdljk3XnZIZyqLu95RJzoCgEOVNaf7ug=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=GbPwKFl4mAPTIPJzMHQPz+4YZt0SojCMNih+4ETHDUSKXZ+oOqnLLAOg84Ty6rOqFC5K3PaR5Y/vqCEf3pJzKQuiXjZfZraDJ6DUGW+embufDBoZ/xzmPDLJ7suwiPvNddIXbADqWWFRRt2YQ8zxp4e34Ikp47nfygHoG/ezU0A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.173
Received: by mail-vk1-f173.google.com with SMTP id 71dfb90a1353d-5bdbd631a6aso424559e0c.1
        for <linux-renesas-soc@vger.kernel.org>; Tue, 30 Jun 2026 10:39:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782841155; x=1783445955;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Q5RvN79X/e2Dnh+83xOfluZFMOzlAF7dZpeIDtZ5KiY=;
        b=Anjx3LT654MWfdIBLsVGGCob1xS61wRcSAytx1nVB+NOLfWqP62gBgCf0Lxz7RnX1r
         em2jBXN7/3ALrAWacsb2oSJhVYugV4BL0WKnjpYvvKhBErWWRQSrHmOoF2FE3LbrVHnG
         iCWRLDH6LrLfpdtGXGpxnndzQeoJ5yvn60/8eey8zvwKhON7kgKTT6WUIhTUf2kUMsSV
         FydH3wVSSM5/iyM1vITnOEzH9Q3Yd88qOqIkQ6Qlxsh7pPoets47G82RCGhoOrmjx0P6
         uJ/fCeQ0oIjCYE5kA2bb64YSz3vjE1Jo7QiuqJNcTCjOHiGohUqbz1Q/I3tXOATN4M8H
         dUEg==
X-Forwarded-Encrypted: i=1; AHgh+RrTU1HEiCA+gfzxq+Ys9glHiXEqFgJy00RvtUflw1xne1nmvCOedGhRIRFwcHtIEvVT/yhLXzvFJJOQPB94Pxyudg==@vger.kernel.org
X-Gm-Message-State: AOJu0Yysvz2sjxrwnoTErEvQrlx0C+x/aC6PKjdRFUqbaBaucIncHfem
	3/ks4qOR2cBJrzoGB8mOJ/rDpJKVdfXySfgBxMIDcyKOkBiNssC746+pW/sGIxOD0Go=
X-Gm-Gg: AfdE7cmK2Y4bRfPD9LCo+vlgiciuj47gXyOJHZIVhDqMKw+z+2JAYPqhou4Fjkx38dW
	dRRlHhLkTRpTzoOLqGs32Ij1Q7DNmBfW08rkd3zJR6IqiLtdiXkzLks6dTI+g38fJDnYCvEzjK+
	slIqz80Oyc/4v4Iu3gPhCdeA/rUyoKfG30uT6GyjjBS1R2JhAHrHo1ptd2vfgQMkpH2eWEiwKsa
	T2cW1Ow/fUeECJujz6Tj8oK7THZqDUAWFpmNgy6XuJSjxaaYi4EZJu8fIDAAJ11506pPHtthRg0
	ewhcei598ONxFAfTVKXcxzAqaZjbQjmqtvNpTC1tNkrc2XQWzklVSz2J5s5ryMMCSoYxkrdO01R
	uUiShVw4y9j65V7i+zQFdRt2IwtcmfMRfCTpDKh7UeRhSbfGb88k/Cl8MtVcYE+PMdmjLvY69u0
	u5e/98Dfcg7VII5m7XLmUc+BzLRDTevIWGMP74QVzqW0n2O1CYjw==
X-Received: by 2002:a05:6123:54d:20b0:5bd:b47d:1865 with SMTP id 71dfb90a1353d-5bdc950ab17mr768974e0c.5.1782841155160;
        Tue, 30 Jun 2026 10:39:15 -0700 (PDT)
Received: from mail-ua1-f54.google.com (mail-ua1-f54.google.com. [209.85.222.54])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-96966877f94sm1306301241.8.2026.06.30.10.39.14
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 30 Jun 2026 10:39:14 -0700 (PDT)
Received: by mail-ua1-f54.google.com with SMTP id a1e0cc1a2514c-9674d727c0aso314535241.1
        for <linux-renesas-soc@vger.kernel.org>; Tue, 30 Jun 2026 10:39:14 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+RoUQmxWyN2BXGFNDQFPzk5WKbVz8qPojXX8sh1tpVtMPK2FBBF52vnD/1ffz0vLFIyfsUZIAlB00w178LY9WxWD7Q==@vger.kernel.org
X-Received: by 2002:a05:6102:6488:10b0:736:e29f:168d with SMTP id
 ada2fe7eead31-73bd49b5dd2mr832615137.16.1782841154210; Tue, 30 Jun 2026
 10:39:14 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260522143508.298439732@kernel.org> <20260522143525.551205135@kernel.org>
In-Reply-To: <20260522143525.551205135@kernel.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 30 Jun 2026 19:39:02 +0200
X-Gmail-Original-Message-ID: <CAMuHMdXud_RpWag_hFqa2ByBGRxg6KnxGL1ObCWZrpTsk3TfAw@mail.gmail.com>
X-Gm-Features: AVVi8CfpdU_5Hk90n_46nl3mYsXiinAyh-Bo52vsKnmAulDjunUQyOI8OG1lM20
Message-ID: <CAMuHMdXud_RpWag_hFqa2ByBGRxg6KnxGL1ObCWZrpTsk3TfAw@mail.gmail.com>
Subject: Re: [for-next][PATCH 04/15] tracepoint: Add lockdep rcu_is_watching()
 check to trace_##name##_enabled()
To: Steven Rostedt <rostedt@kernel.org>, David Carlier <devnexen@gmail.com>
Cc: linux-kernel@vger.kernel.org, Masami Hiramatsu <mhiramat@kernel.org>, 
	Mark Rutland <mark.rutland@arm.com>, Mathieu Desnoyers <mathieu.desnoyers@efficios.com>, 
	Andrew Morton <akpm@linux-foundation.org>, 
	"Vineeth Pillai (Google)" <vineeth@bitbyteword.org>, Peter Zijlstra <peterz@infradead.org>, 
	Linux ARM <linux-arm-kernel@lists.infradead.org>, 
	Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-1.46 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-34574-lists,linux-renesas-soc=lfdr.de];
	DMARC_NA(0.00)[linux-m68k.org];
	FORGED_RECIPIENTS(0.00)[m:rostedt@kernel.org,m:devnexen@gmail.com,m:linux-kernel@vger.kernel.org,m:mhiramat@kernel.org,m:mark.rutland@arm.com,m:mathieu.desnoyers@efficios.com,m:akpm@linux-foundation.org,m:vineeth@bitbyteword.org,m:peterz@infradead.org,m:linux-arm-kernel@lists.infradead.org,m:linux-renesas-soc@vger.kernel.org,s:lists@lfdr.de];
	FREEMAIL_TO(0.00)[kernel.org,gmail.com];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER(0.00)[geert@linux-m68k.org,linux-renesas-soc@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[geert@linux-m68k.org,linux-renesas-soc@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	ALIAS_RESOLVED(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[11];
	R_DKIM_NA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-renesas-soc];
	DBL_BLOCKED_OPENRESOLVER(0.00)[msgid.link:url,mail.gmail.com:mid,bitbyteword.org:email,linux-m68k.org:from_mime,linux-m68k.org:email,efficios.com:email,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 600256E6FBD

Hi Steven, David,

On Fri, 22 May 2026 at 16:35, Steven Rostedt <rostedt@kernel.org> wrote:
> From: David Carlier <devnexen@gmail.com>
>
> The trace_##name##_enabled() static call branch is used when work needs to
> be done for a tracepoint. It allows that work to be skipped when the
> tracepoint is not active and still uses the static_branch() of the
> tracepoint to keep performance.
>
> Tracepoints themselves require being called in "RCU watching" locations
> otherwise races can occur that corrupts things. In order to make sure
> lockdep triggers at tracepoint locations, the lockdep checks are added to
> the tracepoint calling location and trigger even if the tracepoint is not
> enabled. This is done because a poorly placed tracepoint may never be
> detected if it is never enabled when lockdep is enabled.
>
> As trace_##name##_enabled() also prevents the lockdep checks when the
> tracepoint is disabled add lockdep checks to that as well so that if one
> is placed in a location that RCU is not watching, it will trigger a
> lockdep splat even when the tracepoint is not enabled.
>
> Cc: Vineeth Pillai (Google) <vineeth@bitbyteword.org>
> Cc: Mathieu Desnoyers <mathieu.desnoyers@efficios.com>
> Cc: Masami Hiramatsu <mhiramat@kernel.org>
> Cc: Peter Zijlstra <peterz@infradead.org>
> Link: https://patch.msgid.link/20260430144159.10985-1-devnexen@gmail.com
> Signed-off-by: David Carlier <devnexen@gmail.com>
> [ Updated the change log ]
> Signed-off-by: Steven Rostedt <rostedt@goodmis.org>

Thanks for your patch, which is now commit 9764e731ef6abacd
("tracepoint: Add lockdep rcu_is_watching() check to
trace_##name##_enabled()") in v7.2-rc1.

This is causing multiple warnings during system suspend on Renesas
SH-Mobile AG5, R-Car H1. and R-Car M2-W:

     PM: suspend entry (deep)
    -Filesystems sync: 0.018 seconds
    +Filesystems sync: 0.027 seconds
     Freezing user space processes
     Freezing user space processes completed (elapsed 0.001 seconds)
     OOM killer disabled.
     Freezing remaining freezable tasks
     Freezing remaining freezable tasks completed (elapsed 0.001 seconds)
    -PM: suspend devices took 0.110 seconds
    +------------[ cut here ]------------
    +WARNING: include/trace/events/preemptirq.h:36 at
trace_irq_disable_enabled+0x3c/0x64, CPU#0: swapper/0/0
    +------------[ cut here ]------------
    +RCU not watching for tracepoint
    +Modules linked in:
    +WARNING: include/trace/events/preemptirq.h:40 at
trace_irq_enable_enabled+0x3c/0x64, CPU#1: swapper/1/0
    +
    +RCU not watching for tracepoint
    +CPU: 0 UID: 0 PID: 0 Comm: swapper/0 Not tainted
7.1.0-rc4-koelsch-00006-g9764e731ef6a #2337 VOLUNTARY
    +Hardware name: Generic R-Car Gen2 (Flattened Device Tree)
    +Call trace:
    + unwind_backtrace from show_stack+0x10/0x14
    + show_stack from dump_stack_lvl+0x7c/0xb0
    + dump_stack_lvl from __warn+0x98/0x27c
    + __warn from warn_slowpath_fmt+0xc0/0x124
    + warn_slowpath_fmt from trace_irq_disable_enabled+0x3c/0x64
    + trace_irq_disable_enabled from trace_hardirqs_off+0x6c/0xb0
    + trace_hardirqs_off from __irq_svc+0x48/0xac
    +Exception stack(0xc1401f20 to 0xc1401f68)
    +1f20: c027a764 effb0e88 00000000 00000001 c140b080 c027a764
c140801c c140b080
    +1f40: c1407fe0 00000000 c140801c 00000000 fffffff8 c1401f70
c0b35980 c0b359d8
    +1f60: 20000113 ffffffff
    + __irq_svc from cpu_idle_poll+0x114/0x130
    + cpu_idle_poll from do_idle+0xb8/0x268
    + do_idle from cpu_startup_entry+0x28/0x2c
    + cpu_startup_entry from rest_init+0x150/0x178
    + rest_init from start_kernel+0x634/0x6d8
    +irq event stamp: 19112
    +Modules linked in:
    +hardirqs last  enabled at (19111): [<c0b35adc>]
default_idle_call+0xe8/0x104
    +
    +hardirqs last disabled at (19112): [<c0200b88>] __irq_svc+0x48/0xac
    +CPU: 1 UID: 0 PID: 0 Comm: swapper/1 Not tainted
7.1.0-rc4-koelsch-00006-g9764e731ef6a #2337 VOLUNTARY
    +Hardware name: Generic R-Car Gen2 (Flattened Device Tree)
    +Call trace:
    + unwind_backtrace from show_stack+0x10/0x14
    + show_stack from dump_stack_lvl+0x7c/0xb0
    + dump_stack_lvl from __warn+0x98/0x27c
    + __warn from warn_slowpath_fmt+0xc0/0x124
    + warn_slowpath_fmt from trace_irq_enable_enabled+0x3c/0x64
    + trace_irq_enable_enabled from trace_hardirqs_on+0x40/0xbc
    + trace_hardirqs_on from __irq_svc+0x94/0xac
    +Exception stack(0xf0865f48 to 0xf0865f90)
    +5f40:                   c027a764 effc2e88 00000000 00000001
c227cec0 c027a764
    +5f60: c140801c c227cec0 c1407fe0 413fc0f2 c140801c 00000000
fffffff8 f0865f98
    +5f80: c0b35980 c0b35988 20000013 ffffffff
    + __irq_svc from cpu_idle_poll+0xc4/0x130
    + cpu_idle_poll from do_idle+0xb8/0x268
    + do_idle from cpu_startup_entry+0x28/0x2c
    + cpu_startup_entry from secondary_start_kernel+0xdc/0xf0
    + secondary_start_kernel from 0x4020f094
    +irq event stamp: 27461
    +softirqs last  enabled at (19008): [<c02341ec>] handle_softirqs+0x174/0x3e4
    +hardirqs last  enabled at (27461): [<c027a7d0>] do_idle+0x124/0x268
    +softirqs last disabled at (18991): [<c0234a84>] __irq_exit_rcu+0xf0/0x194
    +hardirqs last disabled at (27460): [<c027a734>] do_idle+0x88/0x268
    +---[ end trace 0000000000000000 ]---
    +softirqs last  enabled at (27438): [<c02341ec>] handle_softirqs+0x174/0x3e4
    +softirqs last disabled at (27425): [<c0234a84>] __irq_exit_rcu+0xf0/0x194
    +---[ end trace 0000000000000000 ]---
    +PM: suspend devices took 0.380 seconds
     Disabling non-boot CPUs ...

Other Renesas ARM32 platforms I tried (R-Mobile A1, RZ/A1H, RZ/A2M)
are unafffected, perhaps because they are not SMP?
All Renesas ARM64 platforms I tried (R-Car Gen3/4) are also unaffected.

Reverting the commit fixes the issue.

Do you have a clue?
Thanks!

> --- a/include/linux/tracepoint.h
> +++ b/include/linux/tracepoint.h
> @@ -293,6 +293,10 @@ static inline struct tracepoint *tracepoint_ptr_deref(tracepoint_ptr_t *p)
>         static inline bool                                              \
>         trace_##name##_enabled(void)                                    \
>         {                                                               \
> +               if (IS_ENABLED(CONFIG_LOCKDEP)) {                       \
> +                       WARN_ONCE(!rcu_is_watching(),                   \
> +                                 "RCU not watching for tracepoint");   \
> +               }                                                       \
>                 return static_branch_unlikely(&__tracepoint_##name.key);\
>         }

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

