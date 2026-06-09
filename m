Return-Path: <linux-renesas-soc+bounces-33748-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id ATs2DvPyJ2qY6AIAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-33748-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 09 Jun 2026 13:03:15 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C14A65F3BC
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 09 Jun 2026 13:03:14 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=none;
	dmarc=none;
	spf=pass (mail.lfdr.de: domain of "linux-renesas-soc+bounces-33748-lists+linux-renesas-soc=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-renesas-soc+bounces-33748-lists+linux-renesas-soc=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 1B9AB3005D34
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  9 Jun 2026 11:02:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 80DE33AEB2D;
	Tue,  9 Jun 2026 11:02:28 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-vk1-f172.google.com (mail-vk1-f172.google.com [209.85.221.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF9CE3B38BD
	for <linux-renesas-soc@vger.kernel.org>; Tue,  9 Jun 2026 11:02:26 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781002948; cv=none; b=XCNU54Qhk5tRH6f2VTY8EGLkkUHGFN7GoADT3Chm4uc5uO/bq4EIeYIILowsSfwqXmJiSOu4Sb5yKNWdeErtOLOigj9iqwxFRsJh3Y5PqWiJCe9zUp8DYkU7F26gH+PTcWhwMojaM13v6LAzBRkI+4A5GjaL216sk4a2qKrkg70=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781002948; c=relaxed/simple;
	bh=GhDmkVqz9xLk8j/r3kd6iLFuAL+7q+gHNK9WhqOKoUA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Y12PfeO+72Dv29B+ZH4CgS6ps+t4HMMt7pplOtuAW53aeN3MMN1qrjSCk0emlkS2CKmiKvsfzKVxzN6mpzJDwVPVhEQVpfE/JcM8fNN+nR0pw8BBc8jacMB8xi8K3qTRnag2Cwik53q5PT6gi7qwXZjZPgd706NypEsiCNWaJgI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.172
Received: by mail-vk1-f172.google.com with SMTP id 71dfb90a1353d-59cd803792aso3744408e0c.3
        for <linux-renesas-soc@vger.kernel.org>; Tue, 09 Jun 2026 04:02:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781002946; x=1781607746;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ABwH5YsbFhDWFIvQcHcNLXxsILyTTw3ghSNzBdmL3nU=;
        b=U4M7ZRET/72cPNRtoScGMvIByqXFNKcvJp13UWRezMgRw48wnNZlsFHpACbClNMSCV
         ofZn9pFyRbSdiGc9jZmCjMS0/kidMLu1W/upT9UggAHFoEU6a92s3bKp0qQQUO7tukjZ
         n+WVsXqBcsQibTPM2neMnZIKXXS1Fo5scjtPFRnhPe96KaOUxyPCLYQsGWuC5zf6sebB
         sH412zO9XqGfyQFRvF2IKvEMrkirQehsZ6ed3Ba+IlcrQ3fPf6Yd3N0aoTINoSP2d6Pa
         87BCHkEl1g70Wy4+pxWWKE31yiS2DDpNHiREI3qf0fY3ysujWUZeace/ypyiwHzOdrq+
         bG+g==
X-Forwarded-Encrypted: i=1; AFNElJ9cc7LOOfn+0GuDwtzPUH7CWUX35UT65gmT6IzxkKeezYqrPljwHrty8wnkc1AIzXrKGMMChD7s3CLzjNcnsFcPYQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YzVT8iJx8wcpqExb4OT4ZfvcgS2VhOp7rFvXCss90+4H4dfYDbT
	rl0bxuIIcGbuOlHa3vYam0Kix7fbGvkn/0sYc3v0u0JveWYMmZU8f5N92g+I6lUBKd0=
X-Gm-Gg: Acq92OHNycxA7AgVV++wT0HyYfr13bLTJNTCFXHaBu+YpLqHNHV19hliNVOQfZHpPaT
	JXi74s3E/dXpMx5Yc66sULKg9QL241rwmJcnBo4fX3dnxs85RzzFtIOzRvUfvlPKkIM7o6P7b2c
	GnK6hU/iTzb8eKXCAw2VVJYgQZXkgEAhszSrdqLu1X0WTwaG+aZU/ruh6W4zpa9x9f1rGFx770L
	tfLIuIPZBXkcLZ9x3GM0q+po8/4x2QDf1YwRKIXwtH/3LOiC/Wveu+DMdtUvP2F5+doQepA+1xQ
	aMYzI+RmR01ekgHQVdBevAEKQatTsFqD9MYhBQ+CirXJqVxgaqMl9PZBQAS5acKMnTcdiQyThKK
	UDhr8I1lMhV0sTfxnTR6TUjKgFMoHugqRfEEFknh7cfQRS1gw1NSnSWxcmRdKj2nHpJX14ixAiR
	w8y4I04xhOjGrrd+JhTr9elMiCXDQCnrvpJ6pSZYbVxyUB9ZpZfO4swvT3T6tSsNaIY5pRaDA=
X-Received: by 2002:a05:6122:c8b:b0:567:4e8a:fb13 with SMTP id 71dfb90a1353d-5ac5520a218mr9427289e0c.8.1781002945849;
        Tue, 09 Jun 2026 04:02:25 -0700 (PDT)
Received: from mail-ua1-f51.google.com (mail-ua1-f51.google.com. [209.85.222.51])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-9649d1fbab7sm25403241.10.2026.06.09.04.02.25
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 09 Jun 2026 04:02:25 -0700 (PDT)
Received: by mail-ua1-f51.google.com with SMTP id a1e0cc1a2514c-963b70c2678so3842133241.0
        for <linux-renesas-soc@vger.kernel.org>; Tue, 09 Jun 2026 04:02:25 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ9QeYcGol5ECkdxIoBHaRmu3/N4sizdDfepuQmXxTVz8Up/K9EE4MgghQfNGdi+N6ypH6LqkKwn1RFax5hWa+A9Ng==@vger.kernel.org
X-Received: by 2002:a05:6122:6e0f:b0:5ab:26f:4a42 with SMTP id
 71dfb90a1353d-5ac4d5208c3mr10293829e0c.0.1781002944871; Tue, 09 Jun 2026
 04:02:24 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260424104050.2617041-1-johan@kernel.org> <CAMuHMdUHabMGJyJ7e7yp7DLC+JJc9k6NK9p4anj2wRKNuwZUng@mail.gmail.com>
In-Reply-To: <CAMuHMdUHabMGJyJ7e7yp7DLC+JJc9k6NK9p4anj2wRKNuwZUng@mail.gmail.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 9 Jun 2026 13:02:13 +0200
X-Gmail-Original-Message-ID: <CAMuHMdWk+wR6V4qJ9ArN22RTKDaOtmAu9kvxN6ZOzykwAk3HUA@mail.gmail.com>
X-Gm-Features: AVVi8CcGHfQNQ_XrOeYBXFDxJS8e2DDpJwQ1JOOtUUPkG5Byv8GOXBOUnw7INDk
Message-ID: <CAMuHMdWk+wR6V4qJ9ArN22RTKDaOtmAu9kvxN6ZOzykwAk3HUA@mail.gmail.com>
Subject: Re: [PATCH] pmdomain: core: switch to dynamic root device
To: Johan Hovold <johan@kernel.org>
Cc: Ulf Hansson <ulfh@kernel.org>, linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-1.46 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-33748-lists,linux-renesas-soc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DMARC_NA(0.00)[linux-m68k.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:johan@kernel.org,m:ulfh@kernel.org,m:linux-pm@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-renesas-soc@vger.kernel.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[geert@linux-m68k.org,linux-renesas-soc@vger.kernel.org];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCPT_COUNT_FIVE(0.00)[5];
	FORGED_SENDER_FORWARDING(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[geert@linux-m68k.org,linux-renesas-soc@vger.kernel.org];
	MISSING_XM_UA(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	R_DKIM_NA(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-renesas-soc];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,mail.gmail.com:mid,linux-m68k.org:from_mime,linux-m68k.org:email,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 8C14A65F3BC

On Tue, 9 Jun 2026 at 12:53, Geert Uytterhoeven <geert@linux-m68k.org> wrote:
> On Fri, 24 Apr 2026 at 12:41, Johan Hovold <johan@kernel.org> wrote:
> > Driver core expects devices to be dynamically allocated and will, for
> > example, complain loudly if a device that lacks a release function is
> > ever freed.
> >
> > Use root_device_register() to allocate and register the root device
> > instead of open coding using a static device.
> >
> > Signed-off-by: Johan Hovold <johan@kernel.org>
>
> Thanks for your patch, which is now commit a96e40f4afdcb52a
> ("pmdomain: core: switch to dynamic root device") in pmdomain/next.
> On e.g. R-Car H1, R-Car M2-W, and R-Car H3, this causes scary messages
> when systemd-journald.service is started:
>
>     synth uevent: /always-on: failed to send uevent
>     genpd_provider always-on: uevent: failed to send synthetic uevent: -22
>     synth uevent: /ca15-cpu0: failed to send uevent
>     genpd_provider ca15-cpu0: uevent: failed to send synthetic uevent: -22
>     [...]

I missed that there is another set on e.g. R-Car H1 for the clock domain:

    synth uevent: /clocks: failed to send uevent
    genpd_provider clocks: uevent: failed to send synthetic uevent: -22

>
> Reverting the commit fixes the issue.
>
> > --- a/drivers/pmdomain/core.c
> > +++ b/drivers/pmdomain/core.c
> > @@ -33,9 +33,7 @@ static const struct bus_type genpd_provider_bus_type = {
> >  };
> >
> >  /* The parent for genpd_provider devices. */
> > -static struct device genpd_provider_bus = {
> > -       .init_name = "genpd_provider",
> > -};
> > +static struct device *genpd_provider_bus;
> >
> >  #define GENPD_RETRY_MAX_MS     250             /* Approximate */
> >
> > @@ -2325,7 +2323,7 @@ static int genpd_alloc_data(struct generic_pm_domain *genpd)
> >         device_initialize(&genpd->dev);
> >         genpd->dev.release = genpd_provider_release;
> >         genpd->dev.bus = &genpd_provider_bus_type;
> > -       genpd->dev.parent = &genpd_provider_bus;
> > +       genpd->dev.parent = genpd_provider_bus;
> >
> >         if (!genpd_is_dev_name_fw(genpd)) {
> >                 dev_set_name(&genpd->dev, "%s", genpd->name);
> > @@ -3567,11 +3565,9 @@ static int __init genpd_bus_init(void)
> >  {
> >         int ret;
> >
> > -       ret = device_register(&genpd_provider_bus);
> > -       if (ret) {
> > -               put_device(&genpd_provider_bus);
> > -               return ret;
> > -       }
> > +       genpd_provider_bus = root_device_register("genpd_provider");
> > +       if (IS_ERR(genpd_provider_bus))
> > +               return PTR_ERR(genpd_provider_bus);
> >
> >         ret = bus_register(&genpd_provider_bus_type);
> >         if (ret)
> > @@ -3593,7 +3589,7 @@ static int __init genpd_bus_init(void)
> >  err_prov_bus:
> >         bus_unregister(&genpd_provider_bus_type);
> >  err_dev:
> > -       device_unregister(&genpd_provider_bus);
> > +       root_device_unregister(genpd_provider_bus);
> >         return ret;
> >  }
> >  core_initcall(genpd_bus_init);
>
> Apparently this is done too late for drivers/pmdomain/renesas/rcar-sysc.c,
> which registers PM domains from an early_initcall().  Doing all work in
> rcar-sysc.c from the postcore_initcall() is not an option, as the
> CPU power domains are needed for secondary CPU startup on R-Car H1.

Same story for cpg_mstp_add_clk_domain(), which is called from

    CLK_OF_DECLARE(r8a7778_cpg_clks, "renesas,r8a7778-cpg-clocks",
                   r8a7778_cpg_clocks_init);
    CLK_OF_DECLARE(r8a7779_cpg_clks, "renesas,r8a7779-cpg-clocks",
                   r8a7779_cpg_clocks_init);
    CLK_OF_DECLARE(rz_cpg_clks, "renesas,rz-cpg-clocks", rz_cpg_clocks_init);

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

