Return-Path: <linux-renesas-soc+bounces-17252-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id BC54AABD80E
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 20 May 2025 14:16:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 689A44C3FE9
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 20 May 2025 12:10:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F203E27FB30;
	Tue, 20 May 2025 12:10:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="IOM/kXfm"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-yb1-f180.google.com (mail-yb1-f180.google.com [209.85.219.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E30AD27BF83
	for <linux-renesas-soc@vger.kernel.org>; Tue, 20 May 2025 12:10:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747743015; cv=none; b=F5w9bz1rde1YPxNVOyzxAKS+MAxb1jNvuMNgem+2Y3pN+Xvv0VnngZDuQlpEuxskcBucFDVeIf30fmsuvV3oL57Q4oAC7F6Mc3tWwYOQfYeHF1axplzI6dUAKup7iw9ggpNpceR0f6sGt2vPluh0YxeQJhsxn4OmZ71DfBr8Mng=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747743015; c=relaxed/simple;
	bh=GJ0JNMLAovWgxgEBZ25jZXWcgEMBvp/li8Jc0RcIHmo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=BOAAgckq/uMjsipBqPq+tfTlmnmF45SL9ukkJ0NxFzi70iuqy+zLaBD3ZNjFDDQ3mkJ3PIAzSHFEUabq+zP59jRnatqL0RfiKPQ4LSniswmhNh6KbWClcjqeN8dVDf7k1MMKjwTEy29swYSUh1DHvgpVCDtMbNl5OZ4hkGj8lbk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=IOM/kXfm; arc=none smtp.client-ip=209.85.219.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yb1-f180.google.com with SMTP id 3f1490d57ef6-e7b97c6159aso2111801276.1
        for <linux-renesas-soc@vger.kernel.org>; Tue, 20 May 2025 05:10:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1747743013; x=1748347813; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=GJ0JNMLAovWgxgEBZ25jZXWcgEMBvp/li8Jc0RcIHmo=;
        b=IOM/kXfmW4pkn61r9H8loQfT2CbPDiAAD/ujHC3zQ7OdBoj4iptjgvsqvHiR2/7YEg
         x8PWrA2R8Jt9zezDCB55191cZ5fjajr89DfvAtPInXFc78rkbJSjQdJ8I+5ONwvzIFrT
         VCph7SVpRHxxYNFY886U2MQXA+EFet+5VWYxsaZSfIK3KjCoftRf1KOYztMGP46V1ilS
         KeMUXg6btkhZ3vslCloTY/JlwFEu3606tVNA1f8Klq+9zGb926sdyZDlJoOkyz3OjLH2
         AnK+NNN/7L62PtCHgK2cZmb5QXxa4baIAdBdvTGRUaNA9h5uSqhqdoAfAYJhI87JHO6u
         O0BA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747743013; x=1748347813;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=GJ0JNMLAovWgxgEBZ25jZXWcgEMBvp/li8Jc0RcIHmo=;
        b=MCxkPKduYencf+Yqx906aRyUTMvc0zERE69FBZ1Ywzz60/2j0Np0Gvp8YOTvVfIZOg
         fuZboma4fv81E36L72z6s6dat4cM8ni4+BOZ8YM4HLDrHtIoQNDuzMSXRV7SVE4md29T
         PPxs32+nUnJd4OfuuvumDYJrzqrZkktNb8Qha4Bl/9h/ZQ5+LzGwQ6IDxy1FqbsicsDU
         Lwxrln1YQVzYCgrUaHYZzLYM7pS5Q78Db/yn256vszEqTWef+fVL5TxxlG7GlawaUMKH
         1WokP6aIfeUyb0GuEXZLrtiBkbB2EP2PPCRPBbf7OPYTC8ueSh4JVj2X6ZiIqOPBiDz/
         ptNg==
X-Forwarded-Encrypted: i=1; AJvYcCUv+ymgo+YhnRKvPJJ9v66vgSNbc/TwDwYoipsLvKvIQVA16V4BC0dizaGO/oBnXC3kYvK7mwQoevqGrFUgg5t96Q==@vger.kernel.org
X-Gm-Message-State: AOJu0YzGhLLrfaGB1halrIqgoHHuWqUvGe3y2QNZsW9J/qMUamKDtvcw
	105eZ2IYOFnzDuTlotRiVo/GUprYJbHj7+dep3PMrtZEM3xXpVa1w7W8jBnJtSIc4mKC4eEg/W6
	OPDIN0jTnAfRNRFooGoPEl8FD3eklsv6vNt8chrzeXg==
X-Gm-Gg: ASbGnctJJpg/gsj0DHx0vF20dRcCs5+JbAEleK4wmZrTonft8b6WUJgAEbG5CWLpPqR
	gt5HmJ/BjuuilAn5SfetC5HuJ2u2bOHn8LPUO27TswSN1wyUwvisnexf7hKLY4whygJ2/YQT8xg
	Y+6mS0yT4o/oPd8M6/nCVGfAEF69QZ9w07Pg==
X-Google-Smtp-Source: AGHT+IEb2zwt9aalfZhKo4S79q1t9OvpKzt7oCToAtr/TuLcXSK8xWk48UxIJViQ+sFnBt6vJsguUpP0RMjJ0GKqQgA=
X-Received: by 2002:a05:6902:c02:b0:e7a:3d4f:6355 with SMTP id
 3f1490d57ef6-e7b4f87732emr26855350276.19.1747743012777; Tue, 20 May 2025
 05:10:12 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <8d83ea72-bb81-4c63-bf69-28cf5848ae20@tuxon.dev>
 <20250305140309.744866b2@jic23-huawei> <Z8k8lDxA53gUJa0n@google.com>
 <f74085be-7b14-4551-a0a7-779318a5dc70@tuxon.dev> <20250330163129.02f24afb@jic23-huawei>
 <5bca6dfd-fe03-4c44-acf4-a51673124338@tuxon.dev> <95f5923f-7a8f-4947-b588-419525930bcb@tuxon.dev>
 <CAPDyKFoMqmCFBoO8FwQe2wHh2kqQi4jUZNFyiNckK7QhGVgmvg@mail.gmail.com>
 <c3a2950a-17ff-444a-bee7-af5e7e10e2bf@tuxon.dev> <CAPDyKFozR4qDq4mzcZBK-LcoPf=fGyuJTXwdt=Ey+_DcQOAp0g@mail.gmail.com>
 <4o3wo76st7w6qwyye3rrayuo2qx773i6jfzcnbkhdj76ouh7ds@3e2mblehkgwf>
In-Reply-To: <4o3wo76st7w6qwyye3rrayuo2qx773i6jfzcnbkhdj76ouh7ds@3e2mblehkgwf>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Tue, 20 May 2025 14:09:36 +0200
X-Gm-Features: AX0GCFtcVErlvFZx1FIEgTgFELOf8mwizDWzHsBg11TTKOgl1oY6699W9dYY-yo
Message-ID: <CAPDyKFqMB7XutXba73YHx1X4rm6uc3Fz6yMZ8yM=wgduEmgUDg@mail.gmail.com>
Subject: Re: [PATCH] driver core: platform: Use devres group to free driver
 probe resources
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: Claudiu Beznea <claudiu.beznea@tuxon.dev>, Jonathan Cameron <jic23@kernel.org>, 
	"Rafael J. Wysocki" <rafael@kernel.org>, Daniel Lezcano <daniel.lezcano@linaro.org>, dakr@kernel.org, 
	linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org, geert@linux-m68k.org, 
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-iio@vger.kernel.org, bhelgaas@google.com
Content-Type: text/plain; charset="UTF-8"

[...]

> > > >>>>>
> > > >>>>
> > > >>>> Rafael,
> > > >>>>
> > > >>>> Greg suggested we ask for your input on the right option:
> > > >>>>
> > > >>>> https://lore.kernel.org/all/2025032703-genre-excitable-9473@gregkh/
> > > >>>> (that thread has the other option).
> > > >>>
> > > >>> Can you please let us know your opinion on this?
> > > >> Can you please let us know if you have any suggestions for this?
> > > >
> > > > It's been a while since I looked at this. Although as I understand it,
> > > > the main issue comes from using devm_pm_runtime_enable().
> > >
> > > Yes, it comes from the usage of devm_pm_runtime_enable() in drivers and the
> > > dev_pm_domain_detach() call in platform_remove() right after calling
> > > driver's remove function.
> >
> > Okay.
>
> This is not the root of the problem though. There is nothing really
> special about power domain and runtime power management. The root of the
> problem is that current code violates the order of releasing resources
> by mixing devm- and normal resource management together. Usually it is
> individual driver's fault, but in this case it is bus code that uses the
> manual release (dev_om_domain_detach) that violates the "release in
> opposite order to acquisition" rule.

As I said before, runtime PM is not a regular resource, but a
behaviour that we turn on/off for a device. Enabling and disabling
runtime PM needs to be managed more carefully in my opinion.

For example, even if the order is made correctly, suppose a driver's
->remove() callback completes by turning off the resources for its
device and leaves runtime PM enabled, as it relies on devres to do it
some point later. Beyond this point, nothing would prevent userspace
for runtime resuming/suspending the device via sysfs. I would be quite
worried if that happens as it certainly would lead to undefined
behaviour.

>
> >
> > >
> > > On the platform I experienced issues with, the dev_pm_domain_detach() drops
> > > the clocks from the device power domain and any subsequent PM runtime
> > > resume calls (that may happen in the devres cleanup phase) have no effect
> > > on enabling the clocks. If driver has functions registered (e.g. through
> > > devm_add_action_or_reset()), or driver specific runtime PM functions that
> > > access directly registers in the devres cleanup phase this leads to system
> > > aborts.
> >
> > So if you move away from using devm_pm_runtime_enable() things would
> > be easier to manage and there is no additional new devres-management
> > needed.
>
> How exactly will it improve the situation? You still need to make sure
> that you are not disabling things out of the order. You simply moving
> the complexity to the driver, essentially forbidding it (and any other
> driver on platform bus) from using any devm APIs.

The driver can still use the devres APIs to "get" all resources and
then rely on devres to "put" them. There is nothing that prevents
that, right?

Or maybe I didn't understand the problem correctly?

>
> >
> > >
> > >
> > > >
> > > > As I have tried to argue before, I think devm_pm_runtime_enable()
> > > > should *not* be used. Not here, not at all. Runtime PM isn't like any
> > > > other resources that we fetch/release. Instead, it's a behaviour that
> > > > you turn on and off, which needs to be managed more carefully, rather
> > > > than relying on fetch/release ordering from devres.
>
> I disagree. It is a resource that you turn on and off, same as clocks,
> regulators, interrupts, etc. We manage those during lifetime of the
> device, disable them when going into low power mode/suspend, reenable
> them upon resume, may disable and reenable them for other reasons.
>
> PM is not any more special here. As long as you keep the proper order of
> operations it works as well.

How would you solve the issue I pointed out above?

>
> > > >
> > > > That said, I would convert the driver to use pm_runtime_enable() and
> > > > pm_runtime_disable() instead.
> > >
> > > I've tried this approach previously but it resulted in more complicated
> > > code and thus, Jonathan wasn't happy with it [1].
> >
> > I understand that you have been trying to move forward to address
> > people's opinions. It's not always easy to keep everybody happy. :-)
> >
> > That said, I still think this is the most viable option as it's how
> > the vast majority of drivers do it today. A few lines of additional
> > code shouldn't really be a big problem in my opinion.
>
> Have you tried making such change? Again, you will need to abandon use
> of most other devm APIs so that you keep the order of releasing
> resources. The only devm that you can still use is devm_k*alloc(), the
> rest has to be converted into unmanaged.

I guess I need to take a stab at this particular use case.

Looking closer, could it be that it's really the combination of
turning on/off resources using devres (not just get/put if them) like
clocks - and using devm_pm_runtime_enable()?

Kind regards
Uffe

