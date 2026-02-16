Return-Path: <linux-renesas-soc+bounces-28233-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id aAjxEVHbkmn3zAEAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-28233-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 16 Feb 2026 09:54:41 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 97104141B5C
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 16 Feb 2026 09:54:40 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 0A40C300B130
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 16 Feb 2026 08:54:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 567A527A92D;
	Mon, 16 Feb 2026 08:54:38 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-vk1-f182.google.com (mail-vk1-f182.google.com [209.85.221.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D85A227991E
	for <linux-renesas-soc@vger.kernel.org>; Mon, 16 Feb 2026 08:54:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771232078; cv=none; b=QFo43LXgXL0lKq9JbTf69RuNNKIhHUD6YJ7lEXR0Z5DtFkGGUnIIHgcTwOND+IHCExsPhZuvQvT8ZoyxU1obIYraxjZS+SoN7BE5upYmOcyx0Kc6cr2BrQXmxmfeWhzfM2Pf+UntJgdVXUWP7iwFeCF2wvIky98VbknCX0y2IZ8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771232078; c=relaxed/simple;
	bh=xe6iy91Dnkp2s7PGFf6JlSYAsMMbjCE4ZJ2vNs/NJvU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=og8ZdyhMbsRFReL5sOdxQV/IzAZPlELbYe8yclkH0n2kCI9jhJE67WilZsgD/628LUQdzmlbprNo6EBVSdtoxXPNsDZMcKtWKHxJYQ3wZuP3/TkglmkT2Y+R9c8KzQfE1JD1ewc3UTFVohdO80z9KESlwZupt6v9SuLqlBAPZHQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f182.google.com with SMTP id 71dfb90a1353d-566fe6a4ceeso1291362e0c.3
        for <linux-renesas-soc@vger.kernel.org>; Mon, 16 Feb 2026 00:54:36 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771232076; x=1771836876;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=amIuxySa6dDUHXa+BAvlMLYYKh0V6dJe17/ltsM6dbs=;
        b=C7EzVv1UDbOv4XNqEEpBvpVYOZjM6VPXWjyQVIjCYN43jgoOYpZzyVvX0Cfi5FI5fn
         ShBoRhDleh7D4Iiwz9MZq8SPPgyZJnn4zpNV+wyaCQlLOX8zn2BqaR9EVT2gQgTh7RZg
         0gv9yWnxeDwxPKaUQUHK73J+sHlxdONSyx/dpUL6d68WSb6dwsxE+p3pIvCB8lwmZath
         7zeJSiPEmZXOhSx/HXOMeI7QSIQGjexrbemDfyI6riNloup8VVlrJnq7SCNhCQdfwu+I
         isI5tSJVV2bz94Gh2x+AByrIe0+Ns3HKSE5k6/esO8myHDli7dwIMrG6YQ2TxTNR6SUW
         EiRA==
X-Forwarded-Encrypted: i=1; AJvYcCUF6HkrU7aWW4CBLbhwNE4vxNyWYdGBEUOE9jxHfPZTHzgK4XUb0Zu9NIy87GB6q/bI99/R7K31loEsSS9DVv22/g==@vger.kernel.org
X-Gm-Message-State: AOJu0YzP0bQN2fZcgUtH+S91GV0zUVsd06u9/ah1R/5KG1cZrc7aShQR
	EU+o3/PMk+HyXcQZwe3HzvVegBEsM2J4JuY0JR0sN92tUg/cDPoNdttDCodYZV8u
X-Gm-Gg: AZuq6aKVNKn08DPdGai9HEtMFBBW7wCrludxTYmqNbZcbU/ESP3GxTMFZY4Ri5qMPmN
	qd86kqCC7tf8qTfxKhExY6jBXkWStBR8GRHNxJkpmMOhT9Lfmh4dnXn5nm4YEAm7WmfaXYWgAm8
	rBzeM0g7d3yxoQPQyct6fGjyMot6g48epe7/pzusyQYQRta6w0sdt1x0taQ6ksTYBSUU093e8o2
	ybbZP5eeDEEL1mfU2f68AlNIZjvtQcKtEa1Kw35gevAQCrEoVDfjw8ZdDSq+ZNr/P9uP6kqd5Jb
	Of+EMiqY+haVxT1SzXO6EqB4UFrdTiO+JyMTUjxhgrLOkO62f/rlkA48A3eMuiic2zT3ulWBV07
	9NdUGcKnI2SSoVD3EZqASXwIg4X9nrGPA7EALGowhwGracn+AXoc+2tFK2uv8JqkVMpqNPVp/Qe
	CmqHX4zY2jQIUTOcvYFH+JpJax1Q/wtF6FDo4AAIpN7jH5bd3pLiVBFvnwzfBv
X-Received: by 2002:a05:6122:3a07:b0:567:65ea:10be with SMTP id 71dfb90a1353d-5676aa8020dmr2586761e0c.21.1771232075762;
        Mon, 16 Feb 2026 00:54:35 -0800 (PST)
Received: from mail-vs1-f53.google.com (mail-vs1-f53.google.com. [209.85.217.53])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5674bfc96b6sm7256226e0c.3.2026.02.16.00.54.35
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 16 Feb 2026 00:54:35 -0800 (PST)
Received: by mail-vs1-f53.google.com with SMTP id ada2fe7eead31-5fc419c346fso527743137.2
        for <linux-renesas-soc@vger.kernel.org>; Mon, 16 Feb 2026 00:54:35 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCX8e7PBmyIoZv+EL6C0gFFsmFy2lrV9lMo7r7Qb8FEYB0vRr64dGKTNJWyqx9+QH/GHl+WBk/nfxbwY3/iQ80+Txw==@vger.kernel.org
X-Received: by 2002:a05:6102:5110:b0:5ef:bd3a:ab1f with SMTP id
 ada2fe7eead31-5fe1afbda79mr3606828137.34.1771232075129; Mon, 16 Feb 2026
 00:54:35 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CAMuHMdWapT40hV3c+CSBqFOW05aWcV1a6v_NiJYgoYi0i9_PDQ@mail.gmail.com>
 <0e9f963b-00e0-43d1-b567-cb10b8f66df1@mailbox.org> <CAMuHMdVOUzanEufhWqOL0nv81xCYh4YNAX_waG6y9PyUZ030tg@mail.gmail.com>
In-Reply-To: <CAMuHMdVOUzanEufhWqOL0nv81xCYh4YNAX_waG6y9PyUZ030tg@mail.gmail.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 16 Feb 2026 09:54:23 +0100
X-Gmail-Original-Message-ID: <CAMuHMdU-jRhW65cxeApFbCK+XgRazPOTABcbmBC3J38pwXfzJQ@mail.gmail.com>
X-Gm-Features: AaiRm53fj_d9e6w8NbwYy6InUSZHagi7WeBARKJlpME8J2ANfsii8ZwJtSbH60k
Message-ID: <CAMuHMdU-jRhW65cxeApFbCK+XgRazPOTABcbmBC3J38pwXfzJQ@mail.gmail.com>
Subject: Re: drm/imagination: genpd_runtime_suspend() crash
To: Ulf Hansson <ulf.hansson@linaro.org>, "Rafael J. Wysocki" <rafael@kernel.org>
Cc: Frank Binns <frank.binns@imgtec.com>, Matt Coster <matt.coster@imgtec.com>, 
	Marek Vasut <marek.vasut@mailbox.org>, DRI Development <dri-devel@lists.freedesktop.org>, 
	Linux PM list <linux-pm@vger.kernel.org>, 
	Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.46 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_RCPT(0.00)[linux-renesas-soc];
	RCPT_COUNT_SEVEN(0.00)[8];
	FORGED_SENDER_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MIME_TRACE(0.00)[0:+];
	MISSING_XM_UA(0.00)[];
	R_DKIM_NA(0.00)[];
	DMARC_NA(0.00)[linux-m68k.org];
	RCVD_TLS_LAST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[geert@linux-m68k.org,linux-renesas-soc@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	TAGGED_FROM(0.00)[bounces-28233-lists,linux-renesas-soc=lfdr.de];
	RCVD_COUNT_FIVE(0.00)[6];
	TO_DN_ALL(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,linux-m68k.org:email]
X-Rspamd-Queue-Id: 97104141B5C
X-Rspamd-Action: no action

Hi Ulf, Rafael,

On Thu, 22 Jan 2026 at 16:35, Geert Uytterhoeven <geert@linux-m68k.org> wrote:
> On Sat, 3 Jan 2026 at 19:25, Marek Vasut <marek.vasut@mailbox.org> wrote:
> > On 10/29/25 3:08 PM, Geert Uytterhoeven wrote:
> > >       default_suspend_ok+0xb4/0x20c (P)
> > >       genpd_runtime_suspend+0x11c/0x4e0
> > >       __rpm_callback+0x44/0x1cc
> > >       rpm_callback+0x6c/0x78
> > >       rpm_suspend+0x108/0x564
> > >       pm_runtime_work+0xb8/0xbc
> > >       process_one_work+0x144/0x280
> > >       worker_thread+0x2c8/0x3d0
> > >       kthread+0x128/0x1e0
> > >       ret_from_fork+0x10/0x20
> > >      Code: aa1303e0 52800863 b0005661 912dc021 (f9402095)
> > >      ---[ end trace 0000000000000000 ]---
> > >
> > > This driver uses manual PM Domain handling for multiple PM Domains.  In
> > > my case, pvr_power_domains_fini() calls dev_pm_domain_detach() (twice),
> > > which calls dev_pm_put_subsys_data(), and sets dev->power.subsys_data to
> > > NULL when psd->refcount reaches zero.
> > >
> > > Later/in parallel, default_suspend_ok() calls dev_gpd_data():
> > >
> > >      static inline struct generic_pm_domain_data *dev_gpd_data(struct
> > > device *dev)
> > >      {
> > >              return to_gpd_data(dev->power.subsys_data->domain_data);
> > >      }
> > >
> > > triggering the NULL pointer dereference.  Depending on timing, it may
> > > crash earlier or later in genpd_runtime_suspend(), or not crash at all
> > > (initially, I saw it only with extra debug prints in the genpd subsystem).
> >
> > I came to the same conclusion when revisiting it yesterday and today.
> >
> > The power 3dg-{a,b} domains are in RPM_SUSPENDING state, the
> > __rpm_callback() is running and it unlocks dev->power.lock spinlock for
> > just long enough, that the pvr_power_domains_fini() can issue
> > dev_pm_domain_detach() and then dev_pm_put_subsys_data() , which unsets
> > subsys_data, which are later still used by the __rpm_callback() (really
> > the genpd_runtime_suspend() -> suspend_ok() it calls for this domain).
> >
> > But, I wonder if the problem is actually in the CPG MSSR clock domain
> > driver. The pvr_power_domains_fini() dev_pm_domain_detach() really calls
> > cpg_mssr_detach_dev() which calls pm_clk_destroy() and that invokes the
> > dev_pm_domain_detach() which unsets the subsys_data . The
> > pm_clk_destroy() documentation is explicit about it unsetting the
> > subsys_data .
> >
> > I wonder if what we need to do instead, is patch the CPG MSSR clock
> > domain driver such, that it would surely NOT call pm_clk_destroy()
> > before the domain transitioned from RPM_SUSPENDING -> RPM_SUSPENDED
> > state and surely is done with all its __rpm_callback() invocations ?
> >
> > Can you please test this change and see if it fixes the problem ?
> >
> > The barrier should guarantee that the domain is settled and no more
> > callbacks are still running.
>
> Thank you, that indeed fixes the issue!
>
> However, I am not so sure this barrier belongs in the .detach_dev()
> callback.  The documentation for almost all dev_pm_domain_{at,de}tach*()
> functions states:
>
>      * Callers must ensure proper synchronization of this function with power
>      * management callbacks.
>
> However, I couldn't find any user that calls pm_runtime_barrier() first.
>
> In case of multiple PM domains, it is even more complicated, as
> dev_pm_domain_attach_list() (and pvr_power_domains_init(), which is
> basically an open-coded variant of the former) creates a list of virtual
> devices, which all need synchronization.  For the devres-enabled version
> (devm_pm_domain_attach_list()), the caller cannot take care of calling
> pm_runtime_barrier() anyway, so it has to be handled by the PM core?

Any guidance from the PM people?
Thanks!

> > --- a/drivers/clk/renesas/renesas-cpg-mssr.c
> > +++ b/drivers/clk/renesas/renesas-cpg-mssr.c
> > @@ -24,6 +24,7 @@
> >   #include <linux/platform_device.h>
> >   #include <linux/pm_clock.h>
> >   #include <linux/pm_domain.h>
> > +#include <linux/pm_runtime.h>
> >   #include <linux/psci.h>
> >   #include <linux/reset-controller.h>
> >   #include <linux/slab.h>
> > @@ -656,8 +657,10 @@ int cpg_mssr_attach_dev(struct generic_pm_domain
> > *unused, struct device *dev)
> >
> >   void cpg_mssr_detach_dev(struct generic_pm_domain *unused, struct
> > device *dev)
> >   {
> > -       if (!pm_clk_no_clocks(dev))
> > +       if (!pm_clk_no_clocks(dev)) {
> > +               pm_runtime_barrier(dev);
> >                 pm_clk_destroy(dev);
> > +       }
> >   }
> >
> >   static void cpg_mssr_genpd_remove(void *data)

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

