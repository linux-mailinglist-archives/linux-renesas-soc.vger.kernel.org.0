Return-Path: <linux-renesas-soc+bounces-10865-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id ECEFB9E2C21
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  3 Dec 2024 20:35:43 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id B5F3B165C6C
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  3 Dec 2024 19:35:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BBBD820B208;
	Tue,  3 Dec 2024 19:33:27 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-vs1-f42.google.com (mail-vs1-f42.google.com [209.85.217.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E90B20B1E6;
	Tue,  3 Dec 2024 19:33:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733254407; cv=none; b=FH1wFVVnI4ZHa/Wtdbd4ZxlRliWwwCypIU7bMlEjOqaZAs/xJHquMVP7Lyh+3OKL9taypVo1O7kCco+QX0lf/BNYGbQgjt+6N704ONFHifGMP8PHtvkTp+8YwSoXvEUw6Qn7xfr/wNQOIYpEbuNN2YFz06i2YLaMz74Tj8E4WkQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733254407; c=relaxed/simple;
	bh=VPqlSBqukRVsuLtkm3lgXrEecOjMFaq9c2Ty364QFoI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Vm+jieCIwt1EmiMUvxcSaZnhX7tfpb7ptzlxp0ZePuUtptH2lwsqUfZ0dhnmmy2h6Lgb8SGS613ZEy6H+K48B1LuxTuwfIMV2Lcywh9LiTGRWFWNERip4L5zjJ5J8ouTHjZmoA+v5yAB/W4d6hoNgxbiLiumtSA5UHMEIesmwRw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.217.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vs1-f42.google.com with SMTP id ada2fe7eead31-4af38d1a28fso1156932137.1;
        Tue, 03 Dec 2024 11:33:25 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733254403; x=1733859203;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Oi38/ekDRQ1bmjZMJ3FxZ4GsHKCt9eLcmGDs6gFn8KQ=;
        b=joSLZv3PmRgx8S/8Y6WPUcpMT3cjmloBxQZ73itJoLzg3eOGBDE7D+9YP7P3zEG+vB
         zKgAvUrco5rG1CLiPW199BufCoRxQRSubdLMJy2a7onLDdlNfxGkeSN6zf8yNJ7J8kfx
         vAvd6l/BL9GHnPsbAgDIjHwirN4CGL44SV0kG2Fb4CLT3XAvwGU8mXfWre/MDMzpyeHu
         hL4qD/W2EjJdp6RQDonxAzqeFnoUiS/4KVPZu1Vb1HILScmWpFHICNlc29iut3WLAhOI
         mh0dioRbTGE+XFxi7KYijhow8RhE0ZH4sozBplNuATnb2ZXztGlgGNv+mRhKjk07Cmhk
         Jo9Q==
X-Forwarded-Encrypted: i=1; AJvYcCWFBIXbRzvMRCXPqGSxobj3vAm5Z7Hu1KD7ZMFcF4Nxghjm+9WbdzmPfiGdTZfozI80cXPDupmycNivEzB/2Nr0uA==@vger.kernel.org, AJvYcCWnE10bZoBINNCQ/axQEl3gg6ryne79BxoLQZIPFdApY/Y/ksXzUMG2IdeHsCmzOSAxMY2ZGMNJwyNpDgfEN/zGLNe0@vger.kernel.org
X-Gm-Message-State: AOJu0YxtrvfI/2PCnk0esMkf5wY9B35AJM+vzC29Ovaz9dtCyZ0HhKIK
	EWetq12a6vHt4rvNhC6WF7wDIaNPONncW7B2MDF08cx5Y1tFnUgR3OLbEw7k
X-Gm-Gg: ASbGnctvLKIDsiFDVCDhTFcc3HUVH4Pii7h2RNyh65He6NAelVKsLz9xBGXHHvWgz2K
	aQa1LLQxZNffe+oEI7Ms8pyZNUFcjtUyqrhgyymnearKarissiKkPfgYENbykKIMkb5Fey8fpjz
	5/Tek4U2vosO/JydIeq2VezzLfsU875qj8GqNrnGKnAqvPF0v1jy5H3xhzh1XxdX/tKWQxaCRiG
	mArJCytqSUa9cpZbPIFSiDU8n5RLDT9o440bqZAUco85dSBPaYPzDpLEUvvlLMC/XupcLBCy+o7
	mA849rrF89lT
X-Google-Smtp-Source: AGHT+IFHa9D3u79XeMPqTNOhY/M0aMHDMK48pjAoOSjtZO/z5vCmO6gUAXVKn+MLx5WdbpIsZq0vjQ==
X-Received: by 2002:a05:6102:511f:b0:4af:4d60:2e12 with SMTP id ada2fe7eead31-4af9723c0a4mr6889997137.7.1733254403636;
        Tue, 03 Dec 2024 11:33:23 -0800 (PST)
Received: from mail-vs1-f41.google.com (mail-vs1-f41.google.com. [209.85.217.41])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-4af59210ed7sm2209731137.23.2024.12.03.11.33.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 03 Dec 2024 11:33:23 -0800 (PST)
Received: by mail-vs1-f41.google.com with SMTP id ada2fe7eead31-4af3bfbb721so1724861137.3;
        Tue, 03 Dec 2024 11:33:23 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCUqZAWZJ+o4hRWp8qckLawl2BT2bx8XVjL+JuPgnR+y7tsi2XAAhozaQ5HkCIMoKRjeYAdhXe0zzakDfzb5HbanAJvE@vger.kernel.org, AJvYcCUx/Ijfj7pBeIlRt1MwFkeRszgrhDPSaOXNezfWz0GRv7fSHTDouduD460szDh8RaVgUnxuc2mtJvkUI9duhwzvBQ==@vger.kernel.org
X-Received: by 2002:a05:6102:c04:b0:4af:3923:bf51 with SMTP id
 ada2fe7eead31-4af97385347mr4712527137.25.1733254402888; Tue, 03 Dec 2024
 11:33:22 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241003181629.36209057@gandalf.local.home>
In-Reply-To: <20241003181629.36209057@gandalf.local.home>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 3 Dec 2024 20:33:11 +0100
X-Gmail-Original-Message-ID: <CAMuHMdX=52qRUhVMCWFp-jjyz=Q0XS_Q=GrVf7uuF6hpzacbNQ@mail.gmail.com>
Message-ID: <CAMuHMdX=52qRUhVMCWFp-jjyz=Q0XS_Q=GrVf7uuF6hpzacbNQ@mail.gmail.com>
Subject: Re: [PATCH v2] tracing: Remove definition of trace_*_rcuidle()
To: Steven Rostedt <rostedt@goodmis.org>
Cc: LKML <linux-kernel@vger.kernel.org>, 
	Linux Trace Kernel <linux-trace-kernel@vger.kernel.org>, Masami Hiramatsu <mhiramat@kernel.org>, 
	Mathieu Desnoyers <mathieu.desnoyers@efficios.com>, Mark Rutland <mark.rutland@arm.com>, 
	Peter Zijlstra <peterz@infradead.org>, Joel Fernandes <joel@joelfernandes.org>, 
	Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Steven,

On Fri, Oct 4, 2024 at 12:15=E2=80=AFAM Steven Rostedt <rostedt@goodmis.org=
> wrote:
> From: Steven Rostedt <rostedt@goodmis.org>
>
> The trace_*_rcuidle() variant of a tracepoint was to handle places where =
a
> tracepoint was located but RCU was not "watching". All those locations
> have been removed, and RCU should be watching where all tracepoints are
> located. We can now remove the trace_*_rcuidle() variant.
>
> Signed-off-by: Steven Rostedt (Google) <rostedt@goodmis.org>
> ---
> Changes since v1: https://lore.kernel.org/20241003173051.6b178bb3@gandalf=
.local.home
>
> - Silly me didn't remove the rcuidle logic from __DO_TRACE()

Thanks for your patch, which is now commit 48bcda6848232667
("tracing: Remove definition of trace_*_rcuidle()") in v6.13-rc1.

This is causing warnings during s2ram on various ARM platforms.
E.g. on Koelsch:

 Freezing user space processes
 Freezing user space processes completed (elapsed 0.001 seconds)
 OOM killer disabled.
 Freezing remaining freezable tasks
-Freezing remaining freezable tasks completed (elapsed 0.001 seconds)
-PM: suspend devices took 0.110 seconds
+Freezing remaining freezable tasks completed (elapsed 0.003 seconds)
+------------[ cut here ]------------
+------------[ cut here ]------------
+WARNING: CPU: 0 PID: 0 at include/trace/events/preemptirq.h:36
__irq_svc+0x48/0xac
+WARNING: CPU: 1 PID: 0 at include/trace/events/preemptirq.h:40
trace_hardirqs_on+0x40/0x7c
+RCU not watching for tracepoint
+RCU not watching for tracepoint
+Modules linked in:
+Modules linked in:
+CPU: 0 UID: 0 PID: 0 Comm: swapper/0 Tainted: G        W        N
6.12.0-rc2-koelsch-00005-g48bcda684823 #2094
+
+Tainted: [W]=3DWARN, [N]=3DTEST
+Hardware name: Generic R-Car Gen2 (Flattened Device Tree)
+Call trace:
+ unwind_backtrace from show_stack+0x10/0x14
+ show_stack from dump_stack_lvl+0x78/0xa8
+ dump_stack_lvl from __warn+0x80/0x198
+ __warn from warn_slowpath_fmt+0xbc/0x120
+ warn_slowpath_fmt from __irq_svc+0x48/0xac
+Exception stack(0xc1201f20 to 0xc1201f68)
+1f20: c026570c ebf8fe7c 00000000 00000000 c120c0c0 c026570c c120905c c1209=
020
+1f40: c120c0c0 c106d640 c120905c c10438f8 fffffff8 c1201f70 c0a1c4fc c0a1c=
510
+1f60: 60000013 ffffffff
+ __irq_svc from cpu_idle_poll+0xd0/0x130
+ cpu_idle_poll from do_idle+0xc0/0x2a0
+ do_idle from cpu_startup_entry+0x28/0x2c
+ cpu_startup_entry from rest_init+0x150/0x178
+ rest_init from start_kernel+0x57c/0x610
+irq event stamp: 24900
+CPU: 1 UID: 0 PID: 0 Comm: swapper/1 Tainted: G        W        N
6.12.0-rc2-koelsch-00005-g48bcda684823 #2094
+hardirqs last  enabled at (24899): [<c0a1c658>] default_idle_call+0xe8/0x1=
04
+Tainted: [W]=3DWARN, [N]=3DTEST
+hardirqs last disabled at (24900): [<c0200b68>] __irq_svc+0x48/0xac
+Hardware name: Generic R-Car Gen2 (Flattened Device Tree)
+softirqs last  enabled at (24832): [<c0226bd4>] handle_softirqs+0x170/0x3c=
c
+Call trace:
+softirqs last disabled at (24821): [<c0227400>] __irq_exit_rcu+0xf0/0x148
+ unwind_backtrace from show_stack+0x10/0x14
+---[ end trace 0000000000000000 ]---
+ show_stack from dump_stack_lvl+0x78/0xa8
+ dump_stack_lvl from __warn+0x80/0x198
+ __warn from warn_slowpath_fmt+0xbc/0x120
+ warn_slowpath_fmt from trace_hardirqs_on+0x40/0x7c
+ trace_hardirqs_on from __irq_svc+0x94/0xac
+Exception stack(0xf0861f48 to 0xf0861f90)
+1f40:                   c026570c ebfa1e7c 00000000 00000001 c2220000 c0265=
70c
+1f60: c120905c c1209020 c2220000 c106d640 c120905c 00000000 fffffff8 f0861=
f98
+1f80: c0a1c4fc c0a1c554 20000113 ffffffff
+ __irq_svc from cpu_idle_poll+0x114/0x130
+ cpu_idle_poll from do_idle+0xc0/0x2a0
+ do_idle from cpu_startup_entry+0x28/0x2c
+ cpu_startup_entry from secondary_start_kernel+0xec/0x104
+ secondary_start_kernel from 0x40201334
+irq event stamp: 16791
+hardirqs last  enabled at (16791): [<c0265764>] do_idle+0x118/0x2a0
+hardirqs last disabled at (16790): [<c02656d8>] do_idle+0x8c/0x2a0
+softirqs last  enabled at (16782): [<c0226bd4>] handle_softirqs+0x170/0x3c=
c
+softirqs last disabled at (16765): [<c0227400>] __irq_exit_rcu+0xf0/0x148
+---[ end trace 0000000000000000 ]---
+PM: suspend devices took 0.430 seconds
 Disabling non-boot CPUs ...
 Enabling non-boot CPUs ...
 CPU1 is up

Unfortunately it cannot be reverted easily.

Gr{oetje,eeting}s,

                        Geert

--=20
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k=
.org

In personal conversations with technical people, I call myself a hacker. Bu=
t
when I'm talking to journalists I just say "programmer" or something like t=
hat.
                                -- Linus Torvalds

