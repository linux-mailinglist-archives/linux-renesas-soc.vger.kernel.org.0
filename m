Return-Path: <linux-renesas-soc+bounces-29991-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id QE8mIp8YvWnG6QIAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-29991-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 20 Mar 2026 10:51:27 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id E27292D849E
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 20 Mar 2026 10:51:26 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 69D3D305185E
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 20 Mar 2026 09:48:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2A5BC35BDB7;
	Fri, 20 Mar 2026 09:48:13 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-vk1-f176.google.com (mail-vk1-f176.google.com [209.85.221.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C65893612D5
	for <linux-renesas-soc@vger.kernel.org>; Fri, 20 Mar 2026 09:48:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774000093; cv=none; b=S2oW8WcbvEUHwrLoHIXu246+NVtAS1wxCk4r2CAraLWhg2NWj4Ot8W3oG7ITUf9o6AvRjqnG9iuKeomzzXxaXzU+aUxcIqeAQwmyhixiIHIsB0ZEb0u6iozW6UfIyTbQfZ6+TkJAy3sIfyEZvrI8a/LM0whtuDzgbfNUEzR4R+I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774000093; c=relaxed/simple;
	bh=7APFMvqa0gCQJ5T8+qHwOHyoZaMkXMNBK/5TVY+s4UI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Z0Qe4U4OdApIBokOAW2Bn/MbqqVYx7KVdChRT1qcD8i4gJQZ887oswBQKqaj0qEBy3aLgnKF+OE9xgnbDcUyA99kkUE0pJGLYH0NMKDvz4sLgqPxUUfTZ7bvNcuGeWNvVVSaAKsgss+WEFI+KBgZcE3rHvl6lvVfAAoiJhqRGkw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f176.google.com with SMTP id 71dfb90a1353d-5673804da95so615182e0c.0
        for <linux-renesas-soc@vger.kernel.org>; Fri, 20 Mar 2026 02:48:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774000091; x=1774604891;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2iGUIJ7TvYbGTB2SBBw+JWXRbj4mLmqq0A0KfQHtxXA=;
        b=imXjeEnUv0XxP6pi6ieCA6v/yHlf9nCpi/q6ymiJDzVGzBUaKU7Z1YY+JPvgFf3uXI
         3dQIdpTrLnnqrdioToa7kQWPrUfPK1BCHohZxpJr996RyFTWUywXa1/xMRUz5fSAtdBA
         BeBGDvIDSFCHEOdHD8JZY+7nx2adm0SqKlhnjBeJexHeRgzGVVFaDtOWG94xU0zezNVU
         VAgZktfuGgGuaDnxGs+yXjDfJouYwlbME8FmzupRB+HngOCM0JZM5RNt1eO50LwaUdT/
         hteshJVhqj43kwPKaxbp4UrpnUFN+jghAI8iUP/d6nBCl6Lt5xLVveXaaUymUGjH+ARY
         e+FQ==
X-Forwarded-Encrypted: i=1; AJvYcCXXlR28lM3TrWo21H/F1NrWliyEaLfmhWtwJTZK3GmzfwhVnYSSg4P1UOVmcYhAN94pA/Jk06S1mxqXG55gE8n/uQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YxbyUpoznCF0eXkhr+3qxt5TmIfwvUzyqDYkpv2+DT8aZlXfOkd
	sxS4SLx4Acgd2VzLfAdbR0HSRxMI80DmYUpy+sbeqb87de47I+n4ExLiLg13IuW5ubE=
X-Gm-Gg: ATEYQzycDrIgtivT64STZT8Q8ANpbfU1mFhnAq1Xp6uq1iTLBjs8ZnIRM0hZBMuDs1e
	wB/IK8CGdEzK7oEZXBsZuZVfwcF38yiktC0CHPKB1QNTK4a9ehPd3zdxCfvVf2sLlZ1BIzNzV2H
	bZ0R5mnzLZNA4QUIrfvWxDeQ1x2hT2OfDOqt1+ae/9KXTpANzJ9WbR/yXUnw6heChgK624XTeF+
	zpWSBIFNBJHoTL7zSMm0AblLKs3ngvhBCSL94nQHHmCquRAGqhoXSqovd7IOcmhfjvkrxh4IW/D
	UFFgNcGTE/kEznI9TW4kcVV0JgsDlgnGVDVUTNPGJNwJsWKs/jtJq296coUyGEafVZyxhUAJ1/A
	gWNK1NwMd73sbJucPi3dVxzAIRsJsbAl+glA1Q8DGeWb1VtRmcAeU9zL0ng2nMRasBbsUj/z8L2
	g1qo7GVFTXLh3tG5ZvpL6VO0uiAzs5aYVHUGoqi0kG3wSsdehhKDep6wz8rtYK
X-Received: by 2002:a05:6102:2c0a:b0:5f9:39e9:3562 with SMTP id ada2fe7eead31-602aeac0ee2mr1090619137.2.1774000090648;
        Fri, 20 Mar 2026 02:48:10 -0700 (PDT)
Received: from mail-ua1-f48.google.com (mail-ua1-f48.google.com. [209.85.222.48])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-602afb5b832sm938876137.12.2026.03.20.02.48.09
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 20 Mar 2026 02:48:10 -0700 (PDT)
Received: by mail-ua1-f48.google.com with SMTP id a1e0cc1a2514c-94e2ad66abcso469013241.1
        for <linux-renesas-soc@vger.kernel.org>; Fri, 20 Mar 2026 02:48:09 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCWG7+KIaO00KvIUI9+gDpvtV3JpzWnXmef0cdNFWjpKyLGO8EAe7B7hfxx86H7meo2El1CZL9VLptU8gEI14RGvJA==@vger.kernel.org
X-Received: by 2002:a05:6102:4b85:b0:602:8ad9:1f6f with SMTP id
 ada2fe7eead31-602aeabedb1mr1161798137.5.1774000089201; Fri, 20 Mar 2026
 02:48:09 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <15510cee649959281d9554965cacd0c06531c1f3.1773308898.git.geert+renesas@glider.be>
 <CAPDyKFrMtsp5tRSAOx=ytfQ0xSONtRbC24gq2v4QdSh2wWSw1A@mail.gmail.com>
In-Reply-To: <CAPDyKFrMtsp5tRSAOx=ytfQ0xSONtRbC24gq2v4QdSh2wWSw1A@mail.gmail.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 20 Mar 2026 10:47:58 +0100
X-Gmail-Original-Message-ID: <CAMuHMdXupFRDV7AQUwem7Jd2MJyepyONUtTXr8Xdow=zB_qcYg@mail.gmail.com>
X-Gm-Features: AaiRm53jo1Kzi6wdd9BDyM25xGy57mtBCx3HvMxUoZBMKfg4MkiWLGZ43AKoUH4
Message-ID: <CAMuHMdXupFRDV7AQUwem7Jd2MJyepyONUtTXr8Xdow=zB_qcYg@mail.gmail.com>
Subject: Re: [PATCH/RFC] PM: domains: Call pm_runtime_barrier() before dev_pm_domain_{attach*,detach}()
To: Ulf Hansson <ulf.hansson@linaro.org>
Cc: "Rafael J . Wysocki" <rafael@kernel.org>, Pavel Machek <pavel@kernel.org>, Len Brown <lenb@kernel.org>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Danilo Krummrich <dakr@kernel.org>, 
	Frank Binns <frank.binns@imgtec.com>, Matt Coster <matt.coster@imgtec.com>, 
	Marek Vasut <marek.vasut@mailbox.org>, linux-pm@vger.kernel.org, 
	driver-core@lists.linux.dev, linux-renesas-soc@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Spamd-Result: default: False [-1.46 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-29991-lists,linux-renesas-soc=lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	DMARC_NA(0.00)[linux-m68k.org];
	RCPT_COUNT_TWELVE(0.00)[13];
	MIME_TRACE(0.00)[0:+];
	MISSING_XM_UA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[geert@linux-m68k.org,linux-renesas-soc@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_COUNT_FIVE(0.00)[6];
	R_DKIM_NA(0.00)[];
	NEURAL_HAM(-0.00)[-0.527];
	TAGGED_RCPT(0.00)[linux-renesas-soc];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,linaro.org:email,linux-m68k.org:email,glider.be:email,mail.gmail.com:mid]
X-Rspamd-Queue-Id: E27292D849E
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi Ulf,

On Thu, 19 Mar 2026 at 11:59, Ulf Hansson <ulf.hansson@linaro.org> wrote:
> On Thu, 12 Mar 2026 at 10:54, Geert Uytterhoeven
> <geert+renesas@glider.be> wrote:
> > If a device has multiple PM Domains, dev_pm_domain_detach() is called
> > multiple times on unbind or probe failure.  If the PM Domain is also a
> > Clock Domain, and thus calls pm_clk_destroy() from its .detach()
> > callback, dev_pm_put_subsys_data() will set dev->power.subsys_data to
> > NULL when psd->refcount reaches zero.
> >
> > Later/in parallel, default_suspend_ok() calls dev_gpd_data():
> >
> >     static inline struct generic_pm_domain_data *dev_gpd_data(struct device *dev)
> >     {
> >             return to_gpd_data(dev->power.subsys_data->domain_data);
> >     }
> >
> > which may trigger a NULL pointer dereference.
> >
> > All dev_pm_domain_{at,de}tach*() functions document that callers must
> > ensure proper synchronization of these functions with power management
> > callbacks.  Unfortunately no callers seem to actually do so.  This
> > includes dev_pm_domain_attach_list() and dev_pm_domain_detach_list():
> > they call dev_pm_domain_{attach*,detach}() internally, which means they
> > should take care of this synchronization themselves.
> >
> > Add synchronization to dev_pm_domain_{at,de}tach_list() by calling
> > pm_runtime_barrier() before dev_pm_domain_{attach*,detach}(), and drop
> > the now obsolete comments.
>
> My apologies for not being able to respond earlier to your
> suggestions/questions. I have started looking into this now, and I
> will follow up with more replies and perhaps a patch shortly.
>
> Anyway, the principle is that callers of dev_pm_domain_detach() must
> manage the runtime PM enabling/disabling for its device. If runtime PM
> was enabled, it must typically be disabled before calling
> dev_pm_domain_detach().
>
> What makes this a bit more complicated is that we have two different
> scenarious to consider.
>
> 1) The legacy case, attachment via dev_pm_domain_attach() for the
> single PM domain case. Runtime PM should be enabled/disabled for the
> device, from its corresponding driver/bus. I assume this isn't the
> problem you are facing, right?

No, this is not the problem I am facing.

> 2) Attachment via dev_pm_domain_attach_by_id|name() (which is called
> for the *attach_list() case too), for the single/multi PM domain
> cases. In these cases, runtime PM is enabled in
> genpd_dev_pm_attach_by_id().
>
> For 2), I am inclined to think that the proper action is to call
> pm_runtime_disable() in genpd_dev_pm_detach() before it calls
> genpd_remove_device(). Although, I need to check more closely how
> suitable that would be.

Thanks, that sounds reasonable: genpd_dev_pm_attach_by_id() calls
pm_runtime_enable(), but there is no pm_runtime_disable() call to
balance that...

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

