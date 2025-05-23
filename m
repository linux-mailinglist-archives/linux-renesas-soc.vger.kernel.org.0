Return-Path: <linux-renesas-soc+bounces-17423-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id C11EFAC2024
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 23 May 2025 11:48:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 1787A18861C4
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 23 May 2025 09:48:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BE2462F3E;
	Fri, 23 May 2025 09:48:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="z8BI0vbP"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-yb1-f179.google.com (mail-yb1-f179.google.com [209.85.219.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F21F57083A
	for <linux-renesas-soc@vger.kernel.org>; Fri, 23 May 2025 09:48:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747993702; cv=none; b=T6wWNXNZgjGt1byVLNW3H3Z5WgtyWYRsK5IR1BkZQWeVgh2fi5JlkPIAjMHsuVK5/NERGBwD75Oc7oZKda+U4YcA51w7qS6Ll3uX9ScHA5qHubDTLViXiPb/MiSV01FGSgyBD9lOr/21dTieK2q+FK44C2lRaWUVO5icFNnfKk8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747993702; c=relaxed/simple;
	bh=kqRooQP7wyYERc3tIK6PxMGYiVJobVpNr0VGK+/z1y8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=E0gFh5/CD6kfmkJOUBy74j+7joNBFvi73FEv2YjsMVGk4paovOqyCGV9tI+Bbqc4DIXIf1u2/i4wuKDIePWo4KvIHDiZf4Ud48UpVz6ARTF+rrUfVbyRONeLxprIYs+iaVUvlcSw4lvqQLsWLDSqYRidAT4sa67qbpRHU1Y6vUs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=z8BI0vbP; arc=none smtp.client-ip=209.85.219.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yb1-f179.google.com with SMTP id 3f1490d57ef6-e7b99f387e8so4898230276.0
        for <linux-renesas-soc@vger.kernel.org>; Fri, 23 May 2025 02:48:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1747993699; x=1748598499; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=gf1oFgGMAo5ySKKkyFUQlYC/gWonudK8iq+CfquDz4o=;
        b=z8BI0vbPDDai/hy03iPXnDHPAzjNcisXJDpB01NQc7KyB7heZSFDEe89GEGlRlheib
         SK6oaUaV18MAS8eNyG4NOum06gcr47ANwQwt8A9JYjnmHwy2ZU9cvQDeMu7e9bfDTf55
         tNZJ74oVJAlvD6WQASNEfb+z/ZQvKmclOAu6Ld/46dJdlys5U9LkyyIbh3oldCNjbmNy
         l4/6nqKuUZO9XKuye057HVT7o4X80Hnx+uao/MEvcIY9yjn9DydLJoNSfOVb6MsjZsRv
         /dYmumvyMEsl9tritVAVtm3NfZsvPQpkHzuNVhtFsFEzGebBFJBTNspRQWoauffjD0J0
         qJOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747993699; x=1748598499;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=gf1oFgGMAo5ySKKkyFUQlYC/gWonudK8iq+CfquDz4o=;
        b=JM+AMIsbeWMZNHb+M36h6fDecUqtwQpiHAd9lGtiFB2bR9eHdoU4jEwl0qNTqBNoN2
         nfY3Yk1RMeg2YixV446T0x78H1WYBFgatNmJGq8a3ok8vy926p/OpnRQ9PloYdj3ln6F
         MjanIR+gsW/NndFldjR+oOKVWpwmIP9KrU1zItITgYjcW3YkbfwCBj4+ZJ1e1OAbzuLb
         UYf9oOVPFxzAKD72JGPSGse/UdwNprjcMC+K94zTbcwgL1sdmlG7nW9TIgve3Qap5SuA
         /5LeBurvWxCAcU5MRT+iKvNHEYm559SUg25sXJuyNHI0RCBwB1Hzy1iy2NYNQngY3jTW
         iesw==
X-Forwarded-Encrypted: i=1; AJvYcCWjT9ULE8X2dD6c+zFaoM1pAqb3JVhc8TsPpCIID5GJdLb/ka6kH/+PkbzNkOL+H5tm5ebFUYQXOhTHNS9V9zwjIQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yy8h61uQLmeVRRrut3NbjZ7MXeMEDuN1W/OITnz87+cOl2UEPHP
	D3k5acrTY4/nempwbEkLbU8uh8F0XQomQimOKWJ1S8ppNJYMgCe0XLGxzRC4bebS+b05KUloeO9
	MOn+TlGwLzyDvzcWLfV7RB8oq21Tc2ZJExYvDlzK9ZA==
X-Gm-Gg: ASbGnctb1T10wkamk0pIdqSgK9LPwRxNaB30HHjK9j+sL6o3n9gD8wwisWuOoRN40I8
	hr2kZNPp7AzKVt1hhbb/FqLNxwCk/KCSXMwEX+zkMjfhNMkH6Bm/se4syJCOrUMxm0k+fjrDSfy
	H6a2jymmBU/XO9P0Q80eNmStlHGWvPxN1e4Q==
X-Google-Smtp-Source: AGHT+IE71jpU4o2Dz9Rsf58M10k5dof+C/Tn+eb+QnYtG+Sft5AFiAJxRVWm2trar5794+mzV8ymBCssa7ptpstNHoI=
X-Received: by 2002:a05:6902:1147:b0:e7b:52a4:4dc4 with SMTP id
 3f1490d57ef6-e7d7e198ae0mr2587521276.32.1747993698932; Fri, 23 May 2025
 02:48:18 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CAPDyKFqMB7XutXba73YHx1X4rm6uc3Fz6yMZ8yM=wgduEmgUDg@mail.gmail.com>
 <a20fc6ee-c6c3-4013-b175-4918b9a44380@tuxon.dev> <CAPDyKFpbeLJUiB_xQbqDib+-8Q3AcJNVg+DuEcqmVGMbFdNxwA@mail.gmail.com>
 <fgl4w5uhxci7rrbdigtni72vveb2gqemh6iccz4qruqkek5rja@rzwkcjg6hkid>
 <3b1963ba-f93f-48f2-8fb0-a485dd80ffcb@tuxon.dev> <CAPDyKFqrAS4iV59S-zJ9H7_3VuGr9JdZABhfUGBwTzQNDCasaw@mail.gmail.com>
 <482b55c9-a210-4b2d-8405-e9f30d48a8fd@tuxon.dev> <CAPDyKFpLF2P438GGWSgbXzpT7JNdUjtZ2ZxYf1_4=fNUX3s-KQ@mail.gmail.com>
 <4fzotopz57igmiyssgkogfbup6uu7qgza3t53t5qsouegmj7ii@wfiz4g3eiffs>
 <CAPDyKFoxs6wDCLp5EGHVqkqSstBLNmngps2KfanRezV_EN8tuA@mail.gmail.com> <hd3hobuaunmn2uqzl72yv7nz2ms25fczc264wmt6o7twrxdhsy@mm22ujnawutc>
In-Reply-To: <hd3hobuaunmn2uqzl72yv7nz2ms25fczc264wmt6o7twrxdhsy@mm22ujnawutc>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Fri, 23 May 2025 11:47:42 +0200
X-Gm-Features: AX0GCFsMgsS0EfFQI1GE9DAIaDPwkKUd09ZHiYkzy1SkKNdFa0nVSmZcT9xiJ-8
Message-ID: <CAPDyKFpRUhTK=UfcEdRdT0f5EVoGN5okLosd9_tYjdGKr0qvkA@mail.gmail.com>
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

On Fri, 23 May 2025 at 01:06, Dmitry Torokhov <dmitry.torokhov@gmail.com> wrote:
>
> On Fri, May 23, 2025 at 12:09:08AM +0200, Ulf Hansson wrote:
> > On Thu, 22 May 2025 at 20:47, Dmitry Torokhov <dmitry.torokhov@gmail.com> wrote:
> > >
> > > On Thu, May 22, 2025 at 06:28:44PM +0200, Ulf Hansson wrote:
> > > > On Thu, 22 May 2025 at 16:08, Claudiu Beznea <claudiu.beznea@tuxon.dev> wrote:
> > > > >
> > > > > Hi, Ulf,
> > > > >
> > > > > On 22.05.2025 14:53, Ulf Hansson wrote:
> > > > > >
> > > > > > That said, I think adding a devm_pm_domain_attach() interface would
> > > > > > make perfect sense. Then we can try to replace
> > > > > > dev_pm_domain_attach|detach() in bus level code, with just a call to
> > > > > > devm_pm_domain_attach(). In this way, we should preserve the
> > > > > > expectation for drivers around devres for PM domains. Even if it would
> > > > > > change the behaviour for some drivers, it still sounds like the
> > > > > > correct thing to do in my opinion.
> > > > >
> > > > > This looks good to me, as well. I did prototype it on my side and tested on
> > > > > all my failure cases and it works.
> > > >
> > > > That's great! I am happy to help review, if/when you decide to post it.
> > >
> > > So you are saying you'd be OK with essentially the following (with
> > > devm_pm_domain_attach() actually being elsewhere in a real patch and not
> > > necessarily mimicked by devm_add_action_or_reset()):
> >
> > Correct!
> >
> > >
> > > diff --git a/drivers/base/platform.c b/drivers/base/platform.c
> > > index cfccf3ff36e7..1e017bfa5caf 100644
> > > --- a/drivers/base/platform.c
> > > +++ b/drivers/base/platform.c
> > > @@ -1376,6 +1376,27 @@ static int platform_uevent(const struct device *dev, struct kobj_uevent_env *env
> > >         return 0;
> > >  }
> > >
> > > +
> > > +static void platform_pm_domain_detach(void *d)
> > > +{
> > > +       dev_pm_domain_detach(d, true);
> > > +}
> >
> > Well, I would not limit this to the platform bus, even if that is the
> > most widely used.
> >
> > Let's add the new generic interface along with
> > dev_pm_domain_attach|detach* and friends instead.
> >
> > Then we can convert bus level code (and others), such as the platform
> > bus to use it, in a step-by-step approach.
>
> Right, this was only a draft:
>
> "... with devm_pm_domain_attach() actually being elsewhere in a real
> patch and not necessarily mimicked by devm_add_action_or_reset() ..."
>
> >
> > > +
> > > +static int devm_pm_domain_attach(struct device *dev)
> > > +{
> > > +       int error;
> > > +
> > > +       error = dev_pm_domain_attach(dev, true);
> > > +       if (error)
> > > +               return error;
> > > +
> > > +       error = devm_add_action_or_reset(dev, platform_pm_domain_detach, dev);
> > > +       if (error)
> > > +               return error;
> > > +
> > > +       return 0;
> > > +}
> > > +
> > >  static int platform_probe(struct device *_dev)
> > >  {
> > >         struct platform_driver *drv = to_platform_driver(_dev->driver);
> > > @@ -1396,15 +1417,12 @@ static int platform_probe(struct device *_dev)
> > >         if (ret < 0)
> > >                 return ret;
> > >
> > > -       ret = dev_pm_domain_attach(_dev, true);
> > > +       ret = devm_pm_domain_attach(_dev);
> > >         if (ret)
> > >                 goto out;
> > >
> > > -       if (drv->probe) {
> > > +       if (drv->probe)
> > >                 ret = drv->probe(dev);
> > > -               if (ret)
> > > -                       dev_pm_domain_detach(_dev, true);
> > > -       }
> > >
> > >  out:
> > >         if (drv->prevent_deferred_probe && ret == -EPROBE_DEFER) {
> > > @@ -1422,7 +1440,6 @@ static void platform_remove(struct device *_dev)
> > >
> > >         if (drv->remove)
> > >                 drv->remove(dev);
> > > -       dev_pm_domain_detach(_dev, true);
> > >  }
> > >
> > >  static void platform_shutdown(struct device *_dev)
> > >
> > >
> > > If so, then OK, it will work for me as well. This achieves the
> > > same behavior as with using devres group. The only difference is that if
> > > we ever need to extend the platform bus to acquire/release more
> > > resources they will also have to use devm API and not the regular one.
> >
> > Sounds reasonable to me! Thanks for a nice discussion!
> >
> > When it comes to the devm_pm_runtime_enable() API, I think we
> > seriously should consider removing it. Let me have a closer look at
> > that.
>
> I think once we sort out the power domain detach being out of order with
> regard to other devm-managed resources in bus code you need to analyze
> this again and you will find out that much as with IRQs, devm API for
> runtime PM is useful for majority of cases. Of course there will be
> exceptions, but by and large it will cut down on boilerplate code.

Well, the problem is that the interface is just too difficult to
understand how to use correctly.

A quick look for deployments in drivers confirms my worries.

Kind regards
Uffe

