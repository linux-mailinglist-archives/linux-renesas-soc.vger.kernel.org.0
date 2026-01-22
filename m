Return-Path: <linux-renesas-soc+bounces-27302-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id cLgEKC5JcmnpfAAAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-27302-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 22 Jan 2026 16:58:38 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 14A5B6959F
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 22 Jan 2026 16:58:38 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 0939F3001C49
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 22 Jan 2026 15:58:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1EF4C38F936;
	Thu, 22 Jan 2026 15:35:50 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-vk1-f172.google.com (mail-vk1-f172.google.com [209.85.221.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C58DB423A81
	for <linux-renesas-soc@vger.kernel.org>; Thu, 22 Jan 2026 15:35:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769096149; cv=none; b=ihx28lESTdsP3gMikoPqB1pyz9mvp72ToGA/lDxo0FxwE2eBNj85mEJZc3U4ZOF4roTba4kEhhLb43AYY5HfljpzVFFtNGMyDfOR59ayFv45X/O8/NryMC0s4D+20Al70SHcq2qUfUjEUzmsmEYFhp/qWTv7hRmlErHQEJoPK+w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769096149; c=relaxed/simple;
	bh=YPE69ll2AbGtRwWchQWHGcc4LtU2Wr3G3FF3DkunjjY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=L+dPBO8QyrhCTGp/T3JB4OVmg+KLPg4iEhMciiHZ2kafemSLfwIf0EqpMU8m47r0vymQe5QfVT9uHv8njRMA/6fDY6tJTtdcLCeJsD0dvuG1CmhMprMT5ROS17eEWg1DCGClZ8Fb2bi3IzgXVkKkjpIV4FYkjsVquo1tislZDys=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f172.google.com with SMTP id 71dfb90a1353d-56637565faaso542856e0c.1
        for <linux-renesas-soc@vger.kernel.org>; Thu, 22 Jan 2026 07:35:47 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769096146; x=1769700946;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vofMq1n4Pgk5SZoZLvHR7ju3JLd7F3NzrDb2mQ9r5Ns=;
        b=E9RwueeDsKyd3ugLDLuC2gHhdzEXHsic/JJMM8w5Tliy93U+6NJW9PbEIdhI0WihEb
         Wx/067GgYdxnx76cHLMawmT4BPFLN+yTZ+QU7UUEajKMd21Sl2ddEC+KAi3B+R/SO6RE
         LPBAKxUU+tVgY6IJ1hPPki3zAX1Oxq7BUie5OzGdkldr0fvRFruCRJBY/5ozo2cb/hbR
         D0hb/R7J1oUu9we/BjeclG/vwtTp8nECDR2DHh4TbJiK5lwx+nGYozuST8PsLecylYQd
         /YPQ4cj8BzD0Zm4I7kTTsBIXPoR8l0RdEJQROlDrE0YKHca/w7pdPqcP0ohtBvpUSYDA
         w4Ag==
X-Forwarded-Encrypted: i=1; AJvYcCU910p3v8c3MZ7qLMKRCCqH4Ib7MEwh3gzCfFNMVKuznUqtelIbLI7ksTCDVvJKAWHydpzfy9z4sSb/1tM48KZavw==@vger.kernel.org
X-Gm-Message-State: AOJu0YykD7PDOdtQ+KoePR4dQGZeE1EUzaEds3+0nrGQTM7hiOMocQ9g
	JzVeKzssaiHLaf3JdUoiBH/ZdN7AH93vThFOvDkxw6EBfuGMhlJGeAPYPKpylxdt
X-Gm-Gg: AZuq6aJmqG0doetTlK4uBuGsqooX/WWbxivf2lAlw2e3aRanXL5SS4OvC7Gifiyn14E
	W0npMxNFnIbley0SdQrS23XecvuH2znvoxJhe3Jt6FsuSoMOoOLnW7oOEaWQZxgDywyKIX62uxe
	Oql9FCbhGuF/914gDo6DiRhgemxNSTvgzqL8qX2oy5qibUhegwrgipJf+P3H2O2u6WtUgjoialq
	s8FUvgg1cVwLOeKCI9MKuOBDu7ij6PMFYcd9oZB5gSgH+kBOSBdBw+ByJB8TaJr/9o/mJdOJDoa
	C85CV9bjUjhAg9JI4q8xIFYZnic0u7Np1xoYuas4ZJUxIMfyoya0DnFsmS7BKlk1KECvPCXzdTI
	kA9uWZtKCUseTzczxKnFpRUdtqzcI8aFHNfCfJmoKEYEUx+Mo7uaKtRjpt5nTQKI7fvFJ3u//c5
	KYCw+bAD4zU9vDOWV7MeTT9b29Ja/+4n7dxNF8gEuQkUwjnGKMF9NAi7pFaUH1Y4Q=
X-Received: by 2002:a05:6122:341a:b0:563:7a35:1d9f with SMTP id 71dfb90a1353d-5663eb65faamr2787e0c.15.1769096146375;
        Thu, 22 Jan 2026 07:35:46 -0800 (PST)
Received: from mail-vk1-f175.google.com (mail-vk1-f175.google.com. [209.85.221.175])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5663bec2e81sm114409e0c.0.2026.01.22.07.35.44
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 22 Jan 2026 07:35:45 -0800 (PST)
Received: by mail-vk1-f175.google.com with SMTP id 71dfb90a1353d-56637565faaso542794e0c.1
        for <linux-renesas-soc@vger.kernel.org>; Thu, 22 Jan 2026 07:35:44 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCWN83WZFCssEXh8NYSyROh2J4OkTqMUxLTNs2sjksF6Xj+/uK4tyCKHFktmUU1Y+ldAEuAqX93ytFKAvKrhRcLQKw==@vger.kernel.org
X-Received: by 2002:a05:6122:e14b:b0:566:3d03:8e1d with SMTP id
 71dfb90a1353d-5663eb76e24mr2012e0c.17.1769096143945; Thu, 22 Jan 2026
 07:35:43 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CAMuHMdWapT40hV3c+CSBqFOW05aWcV1a6v_NiJYgoYi0i9_PDQ@mail.gmail.com>
 <0e9f963b-00e0-43d1-b567-cb10b8f66df1@mailbox.org>
In-Reply-To: <0e9f963b-00e0-43d1-b567-cb10b8f66df1@mailbox.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 22 Jan 2026 16:35:32 +0100
X-Gmail-Original-Message-ID: <CAMuHMdVOUzanEufhWqOL0nv81xCYh4YNAX_waG6y9PyUZ030tg@mail.gmail.com>
X-Gm-Features: AZwV_QhcJQLltP1BceqwN2KHR0oQK_LzttveVgO-i1rRJzUP3zQgj-PiPJBF22I
Message-ID: <CAMuHMdVOUzanEufhWqOL0nv81xCYh4YNAX_waG6y9PyUZ030tg@mail.gmail.com>
Subject: Re: drm/imagination: genpd_runtime_suspend() crash
To: Marek Vasut <marek.vasut@mailbox.org>
Cc: Frank Binns <frank.binns@imgtec.com>, Matt Coster <matt.coster@imgtec.com>, 
	Ulf Hansson <ulf.hansson@linaro.org>, "Rafael J. Wysocki" <rafael@kernel.org>, 
	DRI Development <dri-devel@lists.freedesktop.org>, Linux PM list <linux-pm@vger.kernel.org>, 
	Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.46 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_RCPT(0.00)[linux-renesas-soc];
	RCPT_COUNT_SEVEN(0.00)[8];
	FORGED_SENDER_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
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
	TAGGED_FROM(0.00)[bounces-27302-lists,linux-renesas-soc=lfdr.de];
	RCVD_COUNT_FIVE(0.00)[6];
	TO_DN_ALL(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linux-m68k.org:email,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,mail.gmail.com:mid,mailbox.org:email]
X-Rspamd-Queue-Id: 14A5B6959F
X-Rspamd-Action: no action

Hi Marek,

On Sat, 3 Jan 2026 at 19:25, Marek Vasut <marek.vasut@mailbox.org> wrote:
> On 10/29/25 3:08 PM, Geert Uytterhoeven wrote:
> >       default_suspend_ok+0xb4/0x20c (P)
> >       genpd_runtime_suspend+0x11c/0x4e0
> >       __rpm_callback+0x44/0x1cc
> >       rpm_callback+0x6c/0x78
> >       rpm_suspend+0x108/0x564
> >       pm_runtime_work+0xb8/0xbc
> >       process_one_work+0x144/0x280
> >       worker_thread+0x2c8/0x3d0
> >       kthread+0x128/0x1e0
> >       ret_from_fork+0x10/0x20
> >      Code: aa1303e0 52800863 b0005661 912dc021 (f9402095)
> >      ---[ end trace 0000000000000000 ]---
> >
> > This driver uses manual PM Domain handling for multiple PM Domains.  In
> > my case, pvr_power_domains_fini() calls dev_pm_domain_detach() (twice),
> > which calls dev_pm_put_subsys_data(), and sets dev->power.subsys_data to
> > NULL when psd->refcount reaches zero.
> >
> > Later/in parallel, default_suspend_ok() calls dev_gpd_data():
> >
> >      static inline struct generic_pm_domain_data *dev_gpd_data(struct
> > device *dev)
> >      {
> >              return to_gpd_data(dev->power.subsys_data->domain_data);
> >      }
> >
> > triggering the NULL pointer dereference.  Depending on timing, it may
> > crash earlier or later in genpd_runtime_suspend(), or not crash at all
> > (initially, I saw it only with extra debug prints in the genpd subsystem).
>
> I came to the same conclusion when revisiting it yesterday and today.
>
> The power 3dg-{a,b} domains are in RPM_SUSPENDING state, the
> __rpm_callback() is running and it unlocks dev->power.lock spinlock for
> just long enough, that the pvr_power_domains_fini() can issue
> dev_pm_domain_detach() and then dev_pm_put_subsys_data() , which unsets
> subsys_data, which are later still used by the __rpm_callback() (really
> the genpd_runtime_suspend() -> suspend_ok() it calls for this domain).
>
> But, I wonder if the problem is actually in the CPG MSSR clock domain
> driver. The pvr_power_domains_fini() dev_pm_domain_detach() really calls
> cpg_mssr_detach_dev() which calls pm_clk_destroy() and that invokes the
> dev_pm_domain_detach() which unsets the subsys_data . The
> pm_clk_destroy() documentation is explicit about it unsetting the
> subsys_data .
>
> I wonder if what we need to do instead, is patch the CPG MSSR clock
> domain driver such, that it would surely NOT call pm_clk_destroy()
> before the domain transitioned from RPM_SUSPENDING -> RPM_SUSPENDED
> state and surely is done with all its __rpm_callback() invocations ?
>
> Can you please test this change and see if it fixes the problem ?
>
> The barrier should guarantee that the domain is settled and no more
> callbacks are still running.

Thank you, that indeed fixes the issue!

However, I am not so sure this barrier belongs in the .detach_dev()
callback.  The documentation for almost all dev_pm_domain_{at,de}tach*()
functions states:

     * Callers must ensure proper synchronization of this function with power
     * management callbacks.

However, I couldn't find any user that calls pm_runtime_barrier() first.

In case of multiple PM domains, it is even more complicated, as
dev_pm_domain_attach_list() (and pvr_power_domains_init(), which is
basically an open-coded variant of the former) creates a list of virtual
devices, which all need synchronization.  For the devres-enabled version
(devm_pm_domain_attach_list()), the caller cannot take care of calling
pm_runtime_barrier() anyway, so it has to be handled by the PM core?

> --- a/drivers/clk/renesas/renesas-cpg-mssr.c
> +++ b/drivers/clk/renesas/renesas-cpg-mssr.c
> @@ -24,6 +24,7 @@
>   #include <linux/platform_device.h>
>   #include <linux/pm_clock.h>
>   #include <linux/pm_domain.h>
> +#include <linux/pm_runtime.h>
>   #include <linux/psci.h>
>   #include <linux/reset-controller.h>
>   #include <linux/slab.h>
> @@ -656,8 +657,10 @@ int cpg_mssr_attach_dev(struct generic_pm_domain
> *unused, struct device *dev)
>
>   void cpg_mssr_detach_dev(struct generic_pm_domain *unused, struct
> device *dev)
>   {
> -       if (!pm_clk_no_clocks(dev))
> +       if (!pm_clk_no_clocks(dev)) {
> +               pm_runtime_barrier(dev);
>                 pm_clk_destroy(dev);
> +       }
>   }
>
>   static void cpg_mssr_genpd_remove(void *data)

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

