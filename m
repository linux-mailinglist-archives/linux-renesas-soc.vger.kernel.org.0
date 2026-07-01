Return-Path: <linux-renesas-soc+bounces-34590-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 90xJDgzdRGpD2QoAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-34590-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 01 Jul 2026 11:25:32 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 70AB76EB950
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 01 Jul 2026 11:25:31 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=none;
	dmarc=none;
	spf=pass (mail.lfdr.de: domain of "linux-renesas-soc+bounces-34590-lists+linux-renesas-soc=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-renesas-soc+bounces-34590-lists+linux-renesas-soc=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 9CB2A303B715
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  1 Jul 2026 09:24:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F393D3EF0DC;
	Wed,  1 Jul 2026 09:24:48 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com [209.85.208.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0EB7319CC14
	for <linux-renesas-soc@vger.kernel.org>; Wed,  1 Jul 2026 09:24:46 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782897888; cv=none; b=WN0iC5XeV/T6cH6djvX6S2wjV6j7Q1aQGav8l3qe4k9a65ul1m4UxtbFXIvgn3N3ayEgw/y6SgjyFvDrEdGKqUomrVntQnGrNnPVqjL6fCXXSUk4ZuQwSrF0OlEMVppTc9D3yTbe3ObPlEaTPYiR/T69KwYM1hHaIRFyzRiB7qU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782897888; c=relaxed/simple;
	bh=LWusLF1KBXoWTyLOjSoeAoe37ZFfp/VarsRdsUGbbHo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=jOmRk6iEdijsRG89y+SZ72o8KAp1Y6PasjDPT9YphPHSY+FwmaNHZVocSKTW1hwc5ojOYnxMlSmrNkrxemO9E/C2azRSav6WSaxxvu9S/O3xI17ubL828S8pCrfczCgVjW9J+2K8pwqawJFreq3XeosABPnAldnFLVVeXUsFaIM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.208.52
Received: by mail-ed1-f52.google.com with SMTP id 4fb4d7f45d1cf-6978f1eeb87so791607a12.0
        for <linux-renesas-soc@vger.kernel.org>; Wed, 01 Jul 2026 02:24:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782897885; x=1783502685;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ow+/9+zwH5SPEvPH9IdGcsqaSRDdfYfSH3/rH1hC2nw=;
        b=KfXw0VRXmiMBjvxwzyA6j2TuVu+eHGbQFYIdnC3XL6I14A80f6IkKIzK9OFKf6huaR
         Jn2x7hmnZwih0njvelSE7BQjH94R1isF8zkDPoLX1UHaiomYZsEzcd+gfZTkLVxHRTjr
         zcGyvv/7kJdAP2/sW0R1mzdyfwZMV0UciHtsffW++w6vouOthH428/FECVTTMLVPF08G
         wvSI6BL50s1bNtfHAHk7Y00w4tJCT8exKqLDpu9wvzMk5ajwZJqzN/a7ce8Bo2DBMqlb
         s6Uhw/KZc92GWsjSRDMLmi1BMr36SbZzgzTRYdbnqgSKW/uPUQO0LIgdiZgKKR5Ptr4s
         pBgQ==
X-Forwarded-Encrypted: i=1; AHgh+Rpw5IyWkww7Oy8i6J6cPb/FP1oA9asWxIqGIwnE9GOwSWtZ3bt9pWLbDgxpakDWFP2O7EmCaYTnvjPQteTGqxma1A==@vger.kernel.org
X-Gm-Message-State: AOJu0YyXTle0AOHIpno+0Yxk7/l7x6WaIpuBjAxArC3x17gSH3MBplU7
	PgSlUuVfHKHxRQ74p1xaFq/KPD2btMRmDPJEPObv6qchdg2imDH5pi5lh5nH2+EWu58=
X-Gm-Gg: AfdE7cnaCE/gxI+IEUCBNrYTfpLqP1v8WPX2HGVFJeXKfeaCtYKbnEYWTkhak2NrcuT
	5ydnEt1E1ztHIy+fX0G1w3EvWerwPsK5YaoKHdVOb98fza1hJmIIh0gQPhtnpUYAz+esWW020Jb
	kjn9y25CiakkqfQ9gZ9A/HbnSKVkiiBdirgjQMocY6mRVelkZiNUBjIQ7MViCdGjJ7BN/La5Y2u
	rATEJgW5ja8hRws9FL3xlhUckpnp04cqNBhYMLhXzYeOJlvBv5tbFZHuUsRb+f60YTicHO+B59V
	pO+51Stc/KNqNWcHQ1XCdXO92BD0GaC30UN/qCO1yPC2h2hbn4KLUU0uMIzFZ2FBkM10x7jaeGv
	3ofOfLKhFNckh+TZSR4wMP+qEoyh6IdWQaq4LOVTHmbAq6EgQ5IWTvF07xjZtNEwmGcWDBWT5rt
	b0ZHm6s84SAtKZxUNr+lVfprVaq9AbTP4BxomugXFsEDqMS568ZQ==
X-Received: by 2002:a17:906:b793:b0:c12:83c9:d41 with SMTP id a640c23a62f3a-c12a9de3cd8mr25962166b.12.1782897885256;
        Wed, 01 Jul 2026 02:24:45 -0700 (PDT)
Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com. [209.85.208.51])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c1288f48b35sm243382866b.46.2026.07.01.02.24.43
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 01 Jul 2026 02:24:43 -0700 (PDT)
Received: by mail-ed1-f51.google.com with SMTP id 4fb4d7f45d1cf-69531108f25so833120a12.2
        for <linux-renesas-soc@vger.kernel.org>; Wed, 01 Jul 2026 02:24:43 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+RpxbxhtEVIqIfQQKxzCXy4XbuvxiIrosOwViKJAQopQ6A634f93Z6Cbz1kHVXphrbYIEKH/6c9nZUUdI+EUli5EbA==@vger.kernel.org
X-Received: by 2002:a05:6402:4589:b0:697:edf5:20d1 with SMTP id
 4fb4d7f45d1cf-6989f2ee1a4mr383545a12.6.1782897883684; Wed, 01 Jul 2026
 02:24:43 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260522143508.298439732@kernel.org> <20260522143525.551205135@kernel.org>
 <CAMuHMdXud_RpWag_hFqa2ByBGRxg6KnxGL1ObCWZrpTsk3TfAw@mail.gmail.com> <20260630155318.7db20990@gandalf.local.home>
In-Reply-To: <20260630155318.7db20990@gandalf.local.home>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 1 Jul 2026 11:24:31 +0200
X-Gmail-Original-Message-ID: <CAMuHMdUdsTHCMnitVEHdZvRFe9xgmLLTjSr=QqvOi0dxFjkTEA@mail.gmail.com>
X-Gm-Features: AVVi8CfjY3jgBlKnwpLmZCzcIfOcIROBllX921r5PB5mKoy_GTLEWEU4nHyABmY
Message-ID: <CAMuHMdUdsTHCMnitVEHdZvRFe9xgmLLTjSr=QqvOi0dxFjkTEA@mail.gmail.com>
Subject: Re: [for-next][PATCH 04/15] tracepoint: Add lockdep rcu_is_watching()
 check to trace_##name##_enabled()
To: Steven Rostedt <rostedt@kernel.org>
Cc: David Carlier <devnexen@gmail.com>, linux-kernel@vger.kernel.org, 
	Masami Hiramatsu <mhiramat@kernel.org>, Mark Rutland <mark.rutland@arm.com>, 
	Mathieu Desnoyers <mathieu.desnoyers@efficios.com>, Andrew Morton <akpm@linux-foundation.org>, 
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
	TAGGED_FROM(0.00)[bounces-34590-lists,linux-renesas-soc=lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[gmail.com,vger.kernel.org,kernel.org,arm.com,efficios.com,linux-foundation.org,bitbyteword.org,infradead.org,lists.infradead.org];
	RCVD_TLS_LAST(0.00)[];
	DMARC_NA(0.00)[linux-m68k.org];
	FORGED_RECIPIENTS(0.00)[m:rostedt@kernel.org,m:devnexen@gmail.com,m:linux-kernel@vger.kernel.org,m:mhiramat@kernel.org,m:mark.rutland@arm.com,m:mathieu.desnoyers@efficios.com,m:akpm@linux-foundation.org,m:vineeth@bitbyteword.org,m:peterz@infradead.org,m:linux-arm-kernel@lists.infradead.org,m:linux-renesas-soc@vger.kernel.org,s:lists@lfdr.de];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,mail.gmail.com:mid,linux-m68k.org:from_mime,linux-m68k.org:email]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 70AB76EB950

Hi Steven,

On Tue, 30 Jun 2026 at 21:53, Steven Rostedt <rostedt@kernel.org> wrote:
> On Tue, 30 Jun 2026 19:39:02 +0200
> Geert Uytterhoeven <geert@linux-m68k.org> wrote:
> > Other Renesas ARM32 platforms I tried (R-Mobile A1, RZ/A1H, RZ/A2M)
> > are unafffected, perhaps because they are not SMP?
> > All Renesas ARM64 platforms I tried (R-Car Gen3/4) are also unaffected.
> >
> > Reverting the commit fixes the issue.
> >
> > Do you have a clue?
>
> Yes, it means the code was buggy before the commit. The commit will trigger
> warnings in places that have issues. Before the commit, the buggy code was
> never caught.
>
> It's like enabling KASAN and finding code that has use-after-free.
> Disabling KASAN is not the fix.
>
> Tracepoints are managed by using RCU. There's places that RCU is turned
> off, meaning a tracepoint in one of those locations can be triggered when
> RCU is not active which may have a use-after-free semantic when the
> tracepoint is enabled.
>
> Tracepoints hidden by trace_#tracepoint#_enabled() are not caught when RCU
> is disabled and the tracepoint is not active. This commit makes these
> locations trigger even when the tracepoint is not active.

Sorry, my wording could indeed be better: this commit probably does not
"cause" the issue, but merely exposes it.

> One way to find out if this is an existing bug or not, could you enable the
> preemptirq tracepoints and run the tests again with the commit reverted?
>
>   echo 1 >  /sys/kernel/tracing/events/preemptirq/enable
>
> This will enable the events that are hidden without the commit. If it
> triggers when enabled, it shows the commit found a bug.
>
> If you get the same errors, the bug isn't with the commit in question, it's
> with the tracepoints being called during suspend/resume. We will need to
> fix that if that's the case.

Thanks, it does not trigger with the commit reverted and the "echo 1 > ...".

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

