Return-Path: <linux-renesas-soc+bounces-12283-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C9252A16EE1
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 20 Jan 2025 15:59:49 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D034A3A5F99
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 20 Jan 2025 14:59:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 22E8B1E47B3;
	Mon, 20 Jan 2025 14:59:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="JBXzQO6s"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-yb1-f176.google.com (mail-yb1-f176.google.com [209.85.219.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 278FB1E0E08
	for <linux-renesas-soc@vger.kernel.org>; Mon, 20 Jan 2025 14:59:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737385183; cv=none; b=jQWVhVldCLcARysF60inS6ABhkTwjHVIUozDCs0joeCadwbLQNKbzACIe6IKzckb8L0kw9moQtLhavjH3iVcyfIJrfQDivgtKBsUtnL25bM6fVoJ6PYx1rPXDW+0EAKydbRnDtRbW8t4x7L4OTj9DHUsY+vdwNcph44L0CgRKZ4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737385183; c=relaxed/simple;
	bh=AKIPfGPJFvZiS/iRGujwZKSJJiZR1tzVulRkdntn/d0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=uDU7fhxFp9YuAL/royDqnPVPF1jjOyKZxll86+6hNLZCwrBe1rAPBEFf8wRMcdlJoKqNJ9YmfxQIqBTdxFZ4NzDSAcM3bCXL5FKmNwRjYO04/x6PA8GWWB62vbjtQ+jKBd/hyL6y9MDSJdRs5/aCmEHN15omOOKjzq556L4y84k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=JBXzQO6s; arc=none smtp.client-ip=209.85.219.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yb1-f176.google.com with SMTP id 3f1490d57ef6-e545c1e8a15so7137951276.1
        for <linux-renesas-soc@vger.kernel.org>; Mon, 20 Jan 2025 06:59:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1737385179; x=1737989979; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=Y8HGj+4ADIYK1+I9oL+sbry4GxHS0y5T06mIK4lctbo=;
        b=JBXzQO6sIbp4c8+XWIp9ZlwLq8LDpPXw84G3kZqybcS5+W07WFvrT3Fkm/roHDyUjt
         VICOnW+dcl+Z0oZAuELB54WAfMlRqW1IUeC/dp5lKZBLMOwAXgnz2IECUSMfm/vTZEDG
         wrnHybilSMkM+UFEkd9d+JywGrir1S1fTZ/1IS0PiYGws4NjaqG/9S3aHeCFjhRL2dwd
         Cc9WJu/j9D+XIbImpBSVKe3WZ0MrLXnW8cI+lGUgbvl/zdNYbKkbIDFA+S38wFAhMBrr
         1pgLEpcDwOHeHpLDAeoElE3PJBpi4P9dcM+h9VGWs0EX+6SsSDmlz7T0p+pV+eMU14/S
         qShQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737385179; x=1737989979;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Y8HGj+4ADIYK1+I9oL+sbry4GxHS0y5T06mIK4lctbo=;
        b=Pkja6GAIUikYKZspxsYGTWj2Vu38au2L3xb3hsXehEUaqxGGktHDJMA19GaI3ii0wN
         cXON6o72p5M7zcD+fGwkbhflBoUTlygeXHS+Y5ViTKhtn+8jHdLYdijfAS+j+hvLj1p1
         x86wwwvi5/iHFuQYGnOEGx0eYdaRa8d6ziYzvhB70dlUPcQt3P5vC7lZBl9PqG87FARH
         pb89g0yHXeRt5g6n6vxLcJ5kc/mtxCnD0pH7QT3ZI0Pcnrlm+yietbVJE4rkyOqnLJLC
         gFDZBtGkILB5gc2npWa2OiAKiAls/fITLvJ4rTNt6fJ+OQO6rN/G3yAYGs0HEkyb4aNt
         aQFw==
X-Forwarded-Encrypted: i=1; AJvYcCXna8rc7zOl16kFvve/hzIv7tTHJQKp2wMHUyrw+GbxRW5iWPVvFnWTzoLj7X1aFawDodeZzbJsdWUfqrkpMPT/WA==@vger.kernel.org
X-Gm-Message-State: AOJu0YyZJMrXKtmig6w7Fnfqw7R8eNeIegQGiisSWxhr+zRx5A6ggXA8
	FdgBl/uL/ty2y3P+seGyfsLpa2JGRNkisRN7gYI9xg5rti3y1W9FXVYIR3Jr+hbChjcYWO9zAWw
	IRPjVR5El3+8cBGshtHVKzS+RKfLf4HwPnZbfeQ==
X-Gm-Gg: ASbGncvJqBeAaSuqgdFkplERmrHfiCoM/iqPT60eCzHTITfDKHq7VrSvTD0RFAraAJC
	V5AqJf8bMIUh7LRmo7ZO2Pvs7p/iqTw5DOUNvAluxSM2uv9CGrLqp
X-Google-Smtp-Source: AGHT+IFQ5IXG4S9ARGvXg4t9oYdvzyL1htQknMe99cK2eITxWGkv2ohuVapx9MBkkQHqe2R/xZnfnZHhvClZ+XPELD0=
X-Received: by 2002:a05:6902:2304:b0:e57:3fb7:598f with SMTP id
 3f1490d57ef6-e57b1051949mr10231733276.13.1737385178986; Mon, 20 Jan 2025
 06:59:38 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250103140042.1619703-1-claudiu.beznea.uj@bp.renesas.com>
 <20250103140042.1619703-2-claudiu.beznea.uj@bp.renesas.com>
 <20250104135225.2573285b@jic23-huawei> <44e4a6b4-39a4-49d0-b3a5-fc5545c39a56@tuxon.dev>
 <20250111131409.36bebfd3@jic23-huawei> <bb987a1b-a999-478c-8e35-124fcf41561d@tuxon.dev>
 <CAPDyKFoJ3pLU-5_b5MSxMZd7B1cfOvmcdqR4FGkU2Wb7No0mcw@mail.gmail.com> <20250117155226.00002691@huawei.com>
In-Reply-To: <20250117155226.00002691@huawei.com>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Mon, 20 Jan 2025 15:59:02 +0100
X-Gm-Features: AbW1kva-aWI1SiBCmCsXiQ7gM90scDx3fujv8_8NycEvSMaCU96MoLvTbZTyre0
Message-ID: <CAPDyKFpQUMOFtA-QCbYdaeKSDGJpnjcA+tiKZ=kzmrjYRtFZdw@mail.gmail.com>
Subject: Re: [PATCH 1/2] iio: adc: rzg2l_adc: Drop devm_pm_runtime_enable()
To: Jonathan Cameron <Jonathan.Cameron@huawei.com>
Cc: Claudiu Beznea <claudiu.beznea@tuxon.dev>, Jonathan Cameron <jic23@kernel.org>, 
	prabhakar.mahadev-lad.rj@bp.renesas.com, lars@metafoo.de, 
	linux-iio@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, 
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>, "Rafael J. Wysocki" <rafael@kernel.org>, 
	linux-pm@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Fri, 17 Jan 2025 at 16:52, Jonathan Cameron
<Jonathan.Cameron@huawei.com> wrote:
>
> On Wed, 15 Jan 2025 16:29:15 +0100
> Ulf Hansson <ulf.hansson@linaro.org> wrote:
>
> > On Wed, 15 Jan 2025 at 14:37, Claudiu Beznea <claudiu.beznea@tuxon.dev> wrote:
> > >
> > > Hi, Jonathan,
> > >
> > > Thank you for your input!
> > >
> > > On 11.01.2025 15:14, Jonathan Cameron wrote:
> > > > On Mon, 6 Jan 2025 11:18:41 +0200
> > > > Claudiu Beznea <claudiu.beznea@tuxon.dev> wrote:
> > > >
> > > >> Hi, Jonathan,
> > > >>
> > > >>
> > > >> On 04.01.2025 15:52, Jonathan Cameron wrote:
> > > >>> On Fri,  3 Jan 2025 16:00:41 +0200
> > > >>> Claudiu <claudiu.beznea@tuxon.dev> wrote:
> > > >>>
> > > >>>> From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
> > > >>> +CC Rafael and linux-pm
> > > >>>
> > > >>>>
> > > >>>> On all systems where the rzg2l_adc driver is used, the ADC clocks are part
> > > >>>> of a PM domain. The code that implements the PM domains support is in
> > > >>>> drivers/clk/renesas/rzg2l-cpg.c, the functions of interest for this commit
> > > >>>> being rzg2l_cpg_attach_dev() and rzg2l_cpg_deattach_dev(). The PM
> > > >>>> domains support is registered with GENPD_FLAG_PM_CLK which, according to
> > > >>>> the documentation, instructs genpd to use the PM clk framework while
> > > >>>> powering on/off attached devices.
> > > >>>>
> > > >>>> During probe, the ADC device is attached to the PM domain
> > > >>>> controlling the ADC clocks. Similarly, during removal, the ADC device is
> > > >>>> detached from the PM domain.
> > > >>>>
> > > >>>> The detachment call stack is as follows:
> > > >>>>
> > > >>>> device_driver_detach() ->
> > > >>>>   device_release_driver_internal() ->
> > > >>>>     __device_release_driver() ->
> > > >>>>       device_remove() ->
> > > >>>>         platform_remove() ->
> > > >>>>           dev_pm_domain_detach()
> > > >>>>
> > > >>>> During driver unbind, after the ADC device is detached from its PM domain,
> > > >>>> the device_unbind_cleanup() function is called, which subsequently invokes
> > > >>>> devres_release_all(). This function handles devres resource cleanup.
> > > >>>>
> > > >>>> If runtime PM is enabled via devm_pm_runtime_enable(), the cleanup process
> > > >>>> triggers the action or reset function for disabling runtime PM. This
> > > >>>> function is pm_runtime_disable_action(), which leads to the following call
> > > >>>> stack of interest when called:
> > > >>>>
> > > >>>> pm_runtime_disable_action() ->
> > > >>>>   pm_runtime_dont_use_autosuspend() ->
> > > >>>
> > > >>> So is the only real difference that in the code below you disable runtime pm
> > > >>> before autosuspend?
> > > >>
> > > >> No, the difference is that now, the driver specific runtime PM APIs are not
> > > >> called anymore (through the pointed call stack) after the ADC was removed
> > > >> from it's PM domain.
> > > >
> > > > By my reading they are only not called now because you turn autosuspend off
> > > > after disabling runtime PM.
> > >
> > > Sorry, I wanted to say that the runtime PM APIs are not called anymore from
> > > devm_action_release(), though this call stack:
> > >
> > > [   24.801195] Call trace:
> > > [   24.803633]  rzg2l_adc_pm_runtime_suspend+0x18/0x54 (P)
> > > [   24.808847]  pm_generic_runtime_suspend+0x2c/0x44 (L)
> > > [   24.813887]  pm_generic_runtime_suspend+0x2c/0x44
> > > [   24.818580]  __rpm_callback+0x48/0x198
> > > [   24.822319]  rpm_callback+0x68/0x74
> > > [   24.825798]  rpm_suspend+0x100/0x578
> > > [   24.829362]  rpm_idle+0xd0/0x17c
> > > [   24.832582]  update_autosuspend+0x30/0xc4
> > > [   24.836580]  pm_runtime_disable_action+0x40/0x64
> > > [   24.841184]  devm_action_release+0x14/0x20
> > > [   24.845274]  devres_release_all+0xa0/0x100
> > > [   24.849361]  device_unbind_cleanup+0x18/0x60
> > >
> > > This is because I dropped the devm_pm_runtime_enable() which registers the
> > > pm_runtime_disable_action(), which is called at the time the
> > > device_unbind_cleanup() is called, which is called when the ADC is not
> > > anymore part of its PM domain.
> > >
> > > If I change the order in remove function proposed in this patch, thus do:
> > >
> > > +static void rzg2l_adc_remove(struct platform_device *pdev)
> > > +{
> > > +       struct device *dev = &pdev->dev;
> > > +
> > > +       pm_runtime_dont_use_autosuspend(dev);
> > > +       pm_runtime_disable(dev);
> > >  }
> > >
> > > nothing changes with the behavior of this patch. There will be no issue if
> > > the device is runtime suspended/resumed through the
> > > pm_runtime_dont_use_autosuspend() because at the time the
> > > rzg2l_adc_remove() is called the ADC is still part of the PM domain.
> > >
> > >
> > >
> > > >
> > > >>
> > > >>
> > > >>>  Can you still do that with a devm callback just not
> > > >>> the standard one?
> > > >>
> > > >> No. It doesn't matter if we call the standard devm callback or driver
> > > >> specific one. As long as it is devm it will impact us as long as the driver
> > > >> specific runtime PM APIs are called through devres_release_all() after
> > > >> dev_pm_domain_detach(). And at that time the PM domain may be off along
> > > >> with its clocks disabled.
> > > >
> > > > As above, I think that this is only the case because of the reordering
> > > > of those two calls, not something more fundamental.
> > >
> > > I tried having a local devm function (the following diff applied with this
> > > patch reverted) identical with pm_runtime_disable_action():
> > >
> > > diff --git a/drivers/iio/adc/rzg2l_adc.c b/drivers/iio/adc/rzg2l_adc.c
> > > index 22a581c894f8..459cc9c67eec 100644
> > > --- a/drivers/iio/adc/rzg2l_adc.c
> > > +++ b/drivers/iio/adc/rzg2l_adc.c
> > > @@ -423,6 +423,12 @@ static int rzg2l_adc_hw_init(struct device *dev,
> > > struct rzg2l_adc *adc)
> > >         return ret;
> > >  }
> > >
> > > +static void rzg2l_pm_runtime_disable(void *data)
> > > +{
> > > +       pm_runtime_dont_use_autosuspend(data);
> > > +       pm_runtime_disable(data);
> > > +}
> > > +
> > >  static int rzg2l_adc_probe(struct platform_device *pdev)
> > >  {
> > >         struct device *dev = &pdev->dev;
> > > @@ -463,7 +469,9 @@ static int rzg2l_adc_probe(struct platform_device *pdev)
> > >
> > >         pm_runtime_set_autosuspend_delay(dev, 300);
> > >         pm_runtime_use_autosuspend(dev);
> > > -       ret = devm_pm_runtime_enable(dev);
> > > +       pm_runtime_enable(dev);
> > > +
> > > +       ret = devm_add_action_or_reset(dev, rzg2l_pm_runtime_disable, dev);
> > >         if (ret)
> > >                 return ret;
> > >
> > > With this the issue is still reproducible.
> > >
> > > However, changing the order of functions in rzg2l_pm_runtime_disable() and
> > > having it like:
> > >
> > > +static void rzg2l_pm_runtime_disable(void *data)
> > > +{
> > > +       pm_runtime_disable(data);
> > > +       pm_runtime_dont_use_autosuspend(data);
> > > +}
> > >
> > >
> > > leads to no failure when doing unbind/bind.
> > >
> > > However, I see the pm_runtime_disable() can still call rpm_resume() under
> > > certain conditions. It can still lead to failures if it is called after the
> > > device was remove from its PM domain.
> > >
> > > >
> > > > In driver remove flow, device_unbind_cleanup9() is called
> > > > just after device_remove() which is calling the dev->driver_remove()
> > > > callback. There are no runtime pm related calls in between that I can see.
> > >
> > > On my side the device_remove() is calling dev->bus->remove() which is
> > > platform_remove(), which calls the dev_pm_domain_detach(). The
> > > dev_pm_domain_detach() detaches the ADC from it's PM domain. Because of
> > > this, accessing now the ADC registers after a runtime resume leads to
> > > failures pointed in this patch (as of my investigation) (as the ADC is not
> > > anymore part of its PM domain and its PM domain is not started anymore
> > > though runtime PM APIs).
> > >
> > > A similar issue was found while I was adding thermal support for RZ/G3S,
> > > explained in
> > > https://lore.kernel.org/all/20250103163805.1775705-3-claudiu.beznea.uj@bp.renesas.com
> > >
> > >
> > > Jonathan, Rafael, Ulf, all,
> > >
> > > Do consider OK to change the order in pm_runtime_disable_action() to get
> > > rid of these issues, e.g.:
> > >
> > > diff --git a/drivers/base/power/runtime.c b/drivers/base/power/runtime.c
> > > index 2ee45841486b..f27d311d2619 100644
> > > --- a/drivers/base/power/runtime.c
> > > +++ b/drivers/base/power/runtime.c
> > > @@ -1547,8 +1547,8 @@ EXPORT_SYMBOL_GPL(pm_runtime_enable);
> > >
> > >  static void pm_runtime_disable_action(void *data)
> > >  {
> > > -       pm_runtime_dont_use_autosuspend(data);
> > >         pm_runtime_disable(data);
> > > +       pm_runtime_dont_use_autosuspend(data);
> > >  }
> > >
> > > though I see a rpm_resume() call is still possible though pm_runtime_disable().
> >
> > I am still worried about keeping the device runtime enabled during a
> > window when we have turned off all resources for the device. Typically
> > we want to leave the device in a low power state after unbind.
> >
> > That said, I would rather just drop the devm_pm_runtime_enable() API
> > altogether and convert all users of it into
> > pm_runtime_enable|disable(), similar to what your patch does.
>
> That is making a mess of a lot of automated cleanup for a strange
> runtime pm related path.  This is pain a driver should not have
> to deal with, though I'm not clear what the right solution is!
>
> Key is that drivers should not mix devm managed cleanup and not, so
> that means that anything that happens after runtime pm is enabled
> has to be torn down manually.  One solution to this might be to
> always enable it late assuming that is safe to do so there is
> never anything else done after it in the probe path of a driver.

The problem is that runtime PM isn't really comparable to other
resources that we are managing through devm* functions.

Enabling runtime PM for a device changes the behaviour for how
power-mgmt is handled for the device. Enabling/disabling of runtime PM
really needs to be explicitly controlled by the driver for the device.

If there are cleanups to be made for runtime PM, beyond disabling
runtime PM, we could instead consider adding that code in
pm_runtime_reinit().

[...]

Kind regards
Uffe

