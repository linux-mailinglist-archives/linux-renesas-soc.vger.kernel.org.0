Return-Path: <linux-renesas-soc+bounces-28234-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id wC9gFB/dkmlvzQEAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-28234-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 16 Feb 2026 10:02:23 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id A47C0141CCE
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 16 Feb 2026 10:02:22 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 161CD300C91F
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 16 Feb 2026 09:01:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7455622B5AD;
	Mon, 16 Feb 2026 09:01:03 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-vs1-f45.google.com (mail-vs1-f45.google.com [209.85.217.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A2061991CB
	for <linux-renesas-soc@vger.kernel.org>; Mon, 16 Feb 2026 09:01:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771232463; cv=none; b=D/Z4DA5wms1n2+9aD8OFM+4bTS9Ffylu7IGkV+oJ8gSSalaor2k3xSSuXH+R9t0X5tJxEZdFcKn5+r9fei1zHhfkY88r5RfNJyk+EoiciNfNG7LzjXBxa61CAw4+M7gKUyKIMbwgB3gZRsV1x1BABLnUOuKloLtuWlvH8fcJp4g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771232463; c=relaxed/simple;
	bh=G1XKDnA1Pp+L2xvNGMAFEx1FJW9MZknDmsm840sEdpM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=TvgHuOUEAmFRInsPeS2lbA0dpKl2IOtNJ8MksSqdwPfUwtSp8t/zdR9cd9i/kLJ2JxhE8KXGhHAC/oEBKGVZiQ9t4QDYPnAvJBNIpzAzDXvSkqSER3cJp1fyNflVFD521KX5yd8O+yJ+4fe3aGrKLrf/2Wi5wjXuu4x20hyiZjY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.217.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vs1-f45.google.com with SMTP id ada2fe7eead31-5fded34fce9so552206137.0
        for <linux-renesas-soc@vger.kernel.org>; Mon, 16 Feb 2026 01:01:02 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771232461; x=1771837261;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Kge8JOhnejw0JLwZ79trJtM/bgRZ8RfiXwLb+ldmjbA=;
        b=fwW/HJq9QO/R4FvLdxPHwCWSDzgDRqrIF2z2U1eo2ikydLyqjxXmIwCUPNKl2kdLCT
         Ji120/tmkoLRaPm74xKv6ChphrGuX6BWnH5NMKf1r5Qq0+7C0k1WbBANCb+Pv7/45fGH
         mKQsUsrOjqU2TPKpK9RGI2xkEuncoso03nMjLpPECKDB1OzsRKUWW/ihh4YNSSIbrh3k
         5T1Vxj8Ty/n5ElBAlgFYtiaJtIFEbMduqUAzoKITZsMD3hvAhRG707NELloEqJn50Cb/
         ujAoPA6vnzMQ+E1MsykdGJwyeKu6jSfNAifw9I6uopwkvbiQIXF2rX4YysM0pUkD+u9C
         OdLg==
X-Forwarded-Encrypted: i=1; AJvYcCXK2yPFs7A9zvwWmNYxp9dqhQSJeUSJY56uzKqnRwloLxSyB0M4aKSY0zsiw1p3iec7USFLEBZKa/800anxky2OqA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yy9dpoVCfCtxgY4+sb4h/10buzyFkQ4Zcxzf0HzLvrUrz82YS74
	IkgQBdCT7xZhtLskzZ33qF7pEThLYJZ1D0XgL6Y5oRG5j1bxjpIpRXPT41qVm4K0
X-Gm-Gg: AZuq6aLK84AHai+wcpa7kaI5rVWHvGCFMTZisopmTVhx3hU47sU9dfZ6XFw0xPQSauw
	OaJGNbuFbE7YAAAQJA5q9gUWJ/3JNquCUvkWphUJ3qcbxqTp5TAplBG2LRR+G4lwLXm2OW4i8vH
	82pH7EW6m7NV025upbxdCJjfiKLV76VYINJxspVbuENsvZHBCM+RaT/8HguWBt5Zq4mwoWccUHL
	MNgBQOWb5JqKaxR97nxUSFouTqBMsfaq//nKHUiCS7pK2eF8z9rJ4y5KYFnWPKr+yHTyTZw1Q7X
	gcM7Vf3T0hYJEtjZ2Hf2WPbe5WuFn/Eag+zJ6kgFCWq6Vglanw7npzbMS9jORMJxc1pIFq6n36m
	R2OXU1H6bIe6IS1lwQda9THYRv4dAY8gcS+lHkvosbzif8S0onhea3JZrjGAuLTqGtwX5uGzhk9
	zenuzw+PHmhsQ0jlHERJuvipuqgiLlMhoQXetahEYTuCsB6P0qj1P5hlioWNc3
X-Received: by 2002:a05:6102:d91:b0:5ef:adaf:ae6 with SMTP id ada2fe7eead31-5fe16f9c6e8mr3774158137.41.1771232461113;
        Mon, 16 Feb 2026 01:01:01 -0800 (PST)
Received: from mail-ua1-f46.google.com (mail-ua1-f46.google.com. [209.85.222.46])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-5fde8853847sm7485158137.4.2026.02.16.01.01.00
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 16 Feb 2026 01:01:00 -0800 (PST)
Received: by mail-ua1-f46.google.com with SMTP id a1e0cc1a2514c-948ccec7c89so765337241.0
        for <linux-renesas-soc@vger.kernel.org>; Mon, 16 Feb 2026 01:01:00 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCWzALSKiy/FJStqx/3mYRd2Uzw3X5NzJQiSwCagioFP82wIawr6N9c0RY8YDDoKbJ1sYds01ussmdTEvIES6ngo6A==@vger.kernel.org
X-Received: by 2002:a05:6102:2913:b0:5f5:2638:9f3f with SMTP id
 ada2fe7eead31-5fe16c0367amr3303732137.8.1771232460393; Mon, 16 Feb 2026
 01:01:00 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <194465eda54d1f852a9226cf691ddc5aa208e0a3.1769097977.git.geert+renesas@glider.be>
 <ffdf3982-e22c-4d01-afa6-5449ed381000@imgtec.com> <CAMuHMdWMh_oJFg-KtapcTDGvYWZ-hg_ZEJ2=E5Tp1apOEc8tnQ@mail.gmail.com>
 <b3b4f10e-1222-44f7-b308-db7199c67147@mailbox.org> <3e0def93-2f6c-4bcf-8ee5-bf607f2ca382@imgtec.com>
 <f5d3dde6-edec-42f4-93cb-459c8677245a@mailbox.org> <f82b7734-6ddc-4029-b38d-147e9a1de021@leemhuis.info>
 <fcf5ab75-029e-469e-8b2a-51fa5c2a2374@mailbox.org> <95fd3f52-c3ed-40c5-920f-11e8767f701d@leemhuis.info>
In-Reply-To: <95fd3f52-c3ed-40c5-920f-11e8767f701d@leemhuis.info>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 16 Feb 2026 10:00:49 +0100
X-Gmail-Original-Message-ID: <CAMuHMdV-g+3kTaG6Ost4iHo1Tdi_H=qscLBkBRWuR+6DG5c=SA@mail.gmail.com>
X-Gm-Features: AaiRm52WVbXjwZzPHyB6pXVlpVbl_Xj9ZkKfZnmmR7eryStWwzhYeOW7DeWViQM
Message-ID: <CAMuHMdV-g+3kTaG6Ost4iHo1Tdi_H=qscLBkBRWuR+6DG5c=SA@mail.gmail.com>
Subject: Re: [PATCH] drm/imagination: Convert to dev_pm_domain_{at,de}tach_list()
To: Thorsten Leemhuis <regressions@leemhuis.info>
Cc: Marek Vasut <marek.vasut@mailbox.org>, Matt Coster <Matt.Coster@imgtec.com>, 
	Frank Binns <Frank.Binns@imgtec.com>, Brajesh Gupta <Brajesh.Gupta@imgtec.com>, 
	Alessio Belle <Alessio.Belle@imgtec.com>, Alexandru Dadu <Alexandru.Dadu@imgtec.com>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	"dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>, 
	"linux-pm@vger.kernel.org" <linux-pm@vger.kernel.org>, 
	"linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, 
	"regressions@lists.linux.dev" <regressions@lists.linux.dev>
Content-Type: text/plain; charset="UTF-8"
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.46 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DMARC_NA(0.00)[linux-m68k.org];
	RCPT_COUNT_TWELVE(0.00)[17];
	FREEMAIL_CC(0.00)[mailbox.org,imgtec.com,linux.intel.com,kernel.org,suse.de,gmail.com,ffwll.ch,lists.freedesktop.org,vger.kernel.org,lists.linux.dev];
	TAGGED_FROM(0.00)[bounces-28234-lists,linux-renesas-soc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[geert@linux-m68k.org,linux-renesas-soc@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_COUNT_FIVE(0.00)[6];
	TAGGED_RCPT(0.00)[linux-renesas-soc];
	R_DKIM_NA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imgtec.com:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,mail.gmail.com:mid,leemhuis.info:email,linux-m68k.org:email]
X-Rspamd-Queue-Id: A47C0141CCE
X-Rspamd-Action: no action

Hi Thorsten,

On Sat, 14 Feb 2026 at 13:38, Thorsten Leemhuis
<regressions@leemhuis.info> wrote:
> On 2/13/26 23:52, Marek Vasut wrote:
> > On 2/12/26 4:56 PM, Thorsten Leemhuis wrote:
> >> On 2/12/26 15:38, Marek Vasut wrote:
> >>> On 2/12/26 10:00 AM, Matt Coster wrote:
> >>>> On 11/02/2026 19:17, Marek Vasut wrote:
> >>>>> On 1/23/26 2:50 PM, Geert Uytterhoeven wrote:
> >>>>>> On Fri, 23 Jan 2026 at 14:36, Matt Coster <Matt.Coster@imgtec.com>
> >>>>>> wrote:
> >>>>>>> On 22/01/2026 16:08, Geert Uytterhoeven wrote:
> >>>>>>>> Call the dev_pm_domain_attach_list() and
> >>>>>>>> dev_pm_domain_detach_list()
> >>>>>>>> helpers instead of open-coding multi PM Domain handling.
> >>>>>>>>
> >>>>>>>> This changes behavior slightly:
> >>>>>>>>      - The new handling is also applied in case of a single PM
> >>>>>>>> Domain,
> >>>>>>>>      - PM Domains are now referred to by index instead of by
> >>>>>>>> name, but
> >>>>>>>>        "make dtbs_check" enforces the actual naming and ordering
> >>>>>>>> anyway,
> >>>>>>>>      - There are no longer device links created between virtual
> >>>>>>>> domain
> >>>>>>>>        devices, only between virtual devices and the parent device.
> >>>>>>>
> >>>>>>> We still need this guarantee, both at start and end of day. In the
> >>>>>>> current implementation dev_pm_domain_attach_list() iterates
> >>>>>>> forwards,
> >>>>>>> but so does dev_pm_domain_detach_list(). Even if we changed that,
> >>>>>>> I'd
> >>>>>>> prefer not to rely on the implementation details when we can
> >>>>>>> declare the
> >>>>>>> dependencies explicitly.
> >>>>>>
> >>>>>> Note that on R-Car, the PM Domains are nested (see e.g.
> >>>>>> r8a7795_areas[]),
> >>>>>> so they are always (un)powered in the correct order.  But that may
> >>>>>> not
> >>>>>> be the case in the integration on other SoCs.
> >>>>>>
> >>>>>>> We had/have a patch (attached) kicking around internally to use the
> >>>>>>> *_list() functions but keep the inter-domain links in place; it got
> >>>>>>> held
> >>>>>>> up by discussions as to whether we actually need those dependencies
> >>>>>>> for
> >>>>>>> the hardware to behave correctly. Your patch spurred me to run
> >>>>>>> around
> >>>>>>> the office and nag people a bit, and it seems we really do need to
> >>>>>>> care
> >>>>>>> about the ordering.
> >>>>>>
> >>>>>> OK.
> >>>>>>
> >>>>>>> Can you add the links back in for a V2 or I can properly send the
> >>>>>>> attached patch instead, I don't mind either way.
> >>>>>>
> >>>>>> Please move forward with your patch, you are the expert.
> >>>>>> I prefer not to be blamed for any breakage ;-)
> >>>>>
> >>>>> Has there been any progress on fixing this kernel crash ?
> >>>>>
> >>>>> There are already two proposed solutions, but no fix is upstream.
> >>>>
> >>>> Yes and no. Our patch to use dev_pm_domain_attach_list() has landed in
> >>>> drm-misc-next as commit e19cc5ab347e3 ("drm/imagination: Use>>
> >>>> dev_pm_domain_attach_list()"), but this does not fix the underlying
> >>>> issue of missing synchronization in the PM core[1] is still unresolved
> >>>> as far as I'm aware.
> >>>
> >>> OK, but the pvr driver can currently easily crash the kernel on boot if
> >>> firmware is missing, so that should be fixed soon, right ?
> >>
> >> Well, drm-misc-next afaik means that the above mentioned fix would only
> >> be merged in 7.1, which is ~4 months away, which is not really "soon"
> >> I'd say. Or did I misjudge this?
> >
> > The PM domain issue here crashes the kernel, so I think this would be
> > material for drm-misc-fixes .
>
> Yeah, sounds a lot like it.
>
> >>> I added the regressions list onto CC, because this seems like a problem
> >>> worth tracking.
> >>
> >> Noticed that and wondered what change caused the regression.
> >
> > I think this one:
> >
> > 330e76d31697 ("drm/imagination: Add power domain control")
>
> Thx; FWIW, that was merged for v6.16-rc1.
>
> >> Did not
> >> find a answer in a quick search on lore[1]. Because if it's a
> >> regression, we maybe should just revert the culprit for now according to
> >> Linus:
> >> https://lore.kernel.org/lkml/CAHk-=wi86AosXs66-
> >> yi54+mpQjPu0upxB8ZAfG+LsMyJmcuMSA@mail.gmail.com/
> >>
> >> [1] I guess this was the initial report from Geert?
> >> https://lore.kernel.org/all/
> >> CAMuHMdWapT40hV3c+CSBqFOW05aWcV1a6v_NiJYgoYi0i9_PDQ@mail.gmail.com/
> >
> > It is.
> >
> > I think there are other SoCs which depend on the power domain commit, so
> > revert is not so clear cut anymore.
>
> Well, it's a judgement call. 330e76d31697 was merged less then a year
> ago, so I'd not be surprised at all if Linus would revert it in a case
> like this. But it seems it doesn't revert clearly anymore, which
> complicates things.
>
> > But SoCs which have hierarchical
> > power domains and which manage to probe this driver without having a
> > firmware available for the GPU will simply end with crashed kernel,
> > which is really not good.
>
> Does the patch Matt mentioned fix the crash? His "this does not fix the
> underlying issue [...]" (see quote earlier) makes it sound like the
> crash or some other problem (theoretical or practical? regression or
> not?) remains. If that's the case and no quick fix in sight I guess it
> would be best if someone affected could post a revert and then we can
> ask Linus if he wants to pick it up.

I don't think that patch would fix the crash.  The Adreno and Panfrost
GPU drivers do similar things (explicit multi-PM Domain handling),
so I am wondering if the issue can be triggered with them too (e.g. on
unbind).

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

