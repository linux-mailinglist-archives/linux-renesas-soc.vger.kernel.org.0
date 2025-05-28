Return-Path: <linux-renesas-soc+bounces-17587-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id B370BAC6609
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 28 May 2025 11:31:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 8545618808BB
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 28 May 2025 09:32:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 45976211706;
	Wed, 28 May 2025 09:31:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="XU+rZryQ"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-yb1-f173.google.com (mail-yb1-f173.google.com [209.85.219.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 72E7118FDD2
	for <linux-renesas-soc@vger.kernel.org>; Wed, 28 May 2025 09:31:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748424704; cv=none; b=CFbuIi76CJNonhJ3tZb4Ot/qsbgOFRAs9Fg6VEr0UOEw8evognjOWYcon/upC84o5bYCIeXMp75bnNr4keiw4b6vdaq7PhPQ42L4pMINnCdYvwlQlLEN/oDicVeuqoS3uvQt4UakxmHGM8/R5PXnONN7j6xJf8DhvkOckKRTxzU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748424704; c=relaxed/simple;
	bh=WsTVlNGVWMlMr7/1HnY9hFlDZoNZeHk/mPpV96JRdec=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=RDaN1OFQbBITKiR3yEvF9ImKs8JU0Td3n8nItB7DpNZOxbRhfAUf9NJZdfYi8FLOMlQpPYW2r2Os7/Tmx9v9F5akV5zOQ3YwMcvgnJjtFAFXhsDaNxNdEBNyKH0qvqooUmEKHRd3hl7vmFxWAOnHwD9L4uze0oeClySe0W0J8/c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=XU+rZryQ; arc=none smtp.client-ip=209.85.219.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yb1-f173.google.com with SMTP id 3f1490d57ef6-e7dc5f8148bso694695276.0
        for <linux-renesas-soc@vger.kernel.org>; Wed, 28 May 2025 02:31:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1748424700; x=1749029500; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=qxCNklpcwB9Aux3Ir6fEZ7ZfodLW5xursubADF1vInc=;
        b=XU+rZryQS5rdYN2wA/8ERj2PCnbtqeZzyNCZx0JNdYtBEYRXhfmQfsyR5N3NHJAi8x
         BqXDUxD5KSNbirNzLWcNZiIyDNgr7am0Iv2Nj6gXZ1YKATLsJnlOSufs2e54SxfMRypH
         fhl+tKm/Fmv8RstCQ4Ou3HKlz2LjaEyoOItKT33DvXjNkPD2sd8uZrKfsrxt7jfxukzc
         UZ/P7qCKYr+uWmsbUOTyfyGoobkyz7vNIGCOya1yVOcLk+fJNYRggd3+djG9XKnpzjU0
         BGqQzRYyc6d4Y/1wXFYWbGDS0yEcXNaX+DZVYfrRpr4J/O5W0b9aLtJ6OEmKxNPhWLPO
         a7MA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748424700; x=1749029500;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=qxCNklpcwB9Aux3Ir6fEZ7ZfodLW5xursubADF1vInc=;
        b=f6pPYZMQDcOZKdZnrzC8iT/Sa8NOE9Q6Rpyyz6C7sks789XIzPMTeqqm+DTTpBwSNS
         Gi0Qrm7KGF8IGZF2qXReB20dgRR6D5L43aTvIHI4YlXizYez//FgqilQnVCWgmHPIa85
         nwFUSD+xpFrR64TV7aMN5w5485e+Rg3drH1OnSOEPbFKvRwMv0UdfCyBzSfM75LpIp9h
         CLiAEe+u/Nv8gIlTqeFUm5sM3tq95TQbJvt2np/SytUZHv0FfMFl1uGSvzMnjTcbpLkz
         r9/8lQ6xyspoIs0P3uHIAGvu5tI6eeJP80+F8KSc0MyBLCeh/iPDA6UTwBHczYN40vhM
         vP+A==
X-Forwarded-Encrypted: i=1; AJvYcCUwWcvkhxGzgAtliddHjgZ+3jaCh5JWWy0wRAmnbUtISQTjfaLISiuQQp2Vmqvl7iYM9BA+ctm4dFcdN44SnGXBZg==@vger.kernel.org
X-Gm-Message-State: AOJu0YxOaTtI3CJijw7TJKlXfIQvbMOzOLaVMJFx8RtL7fH9ZYzjXbxg
	D4UEca8UUzedEHqdfHJNj0d3BMVn+gpiAsG1d4hGxqqpAvYJHQxNMyg8csSpFnULizvtRLIVfqG
	D72LAxi2ngiZFZSCbKkeybrAx8Iv9VhH/W0J1Ynj6Rw==
X-Gm-Gg: ASbGncuAzrskgLUW+aVvE5dsHkuRZ1atAjmeH2m+VkC7+ESEfMfeTxURjKcG47/98D7
	6P1AP33QBn2ixDeAraH+gq2v7z0ZxFRiO2rrSyXsWPyTZ2g5WQJBmAdwEeuaWPT+XPEw1FEHXGm
	uJwpSQnKt56ARuPH7ikpB3YhJbn2zZyB8kZw==
X-Google-Smtp-Source: AGHT+IEyw0lUrmYinEboMHvAdYvFeBCQMFpAFX9P5BvMD2PBk8DgM7GAXBhZytV2fKUiOCBjFWXeZ1b8qL3n9/JSqsY=
X-Received: by 2002:a05:6902:120a:b0:e7d:cff1:340b with SMTP id
 3f1490d57ef6-e7dd01eea9bmr4498112276.0.1748424700237; Wed, 28 May 2025
 02:31:40 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250526122054.65532-1-claudiu.beznea.uj@bp.renesas.com>
 <20250526122054.65532-2-claudiu.beznea.uj@bp.renesas.com> <hojdkntm3q5a5ywya7n5i4zy24auko4u6zdqm25infhd44nyfx@x2evb6sc2d45>
In-Reply-To: <hojdkntm3q5a5ywya7n5i4zy24auko4u6zdqm25infhd44nyfx@x2evb6sc2d45>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Wed, 28 May 2025 11:31:03 +0200
X-Gm-Features: AX0GCFsFhqUi2AGDMBlqa7RGrDqiU7Kbc5fKh9Fg0pv0gNT5kfMImVz5Whz-roI
Message-ID: <CAPDyKFptNg5t6RehRNNfnnuCqpfiaQLaHBEdh4aRXfn7X6rYQQ@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] PM: domains: Add devres variant for dev_pm_domain_attach()
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: Claudiu <claudiu.beznea@tuxon.dev>, gregkh@linuxfoundation.org, rafael@kernel.org, 
	dakr@kernel.org, len.brown@intel.com, pavel@kernel.org, jic23@kernel.org, 
	daniel.lezcano@linaro.org, linux-kernel@vger.kernel.org, 
	linux-pm@vger.kernel.org, linux-iio@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org, bhelgaas@google.com, geert@linux-m68k.org, 
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"

On Tue, 27 May 2025 at 23:27, Dmitry Torokhov <dmitry.torokhov@gmail.com> wrote:
>
> Hi Claudiu,
>
> On Mon, May 26, 2025 at 03:20:53PM +0300, Claudiu wrote:
> > From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
> >
> > The dev_pm_domain_attach() function is typically used in bus code alongside
> > dev_pm_domain_detach(), often following patterns like:
> >
> > static int bus_probe(struct device *_dev)
> > {
> >     struct bus_driver *drv = to_bus_driver(dev->driver);
> >     struct bus_device *dev = to_bus_device(_dev);
> >     int ret;
> >
> >     // ...
> >
> >     ret = dev_pm_domain_attach(_dev, true);
> >     if (ret)
> >         return ret;
> >
> >     if (drv->probe)
> >         ret = drv->probe(dev);
> >
> >     // ...
> > }
> >
> > static void bus_remove(struct device *_dev)
> > {
> >     struct bus_driver *drv = to_bus_driver(dev->driver);
> >     struct bus_device *dev = to_bus_device(_dev);
> >
> >     if (drv->remove)
> >         drv->remove(dev);
> >     dev_pm_domain_detach(_dev);
> > }
> >
> > When the driver's probe function uses devres-managed resources that depend
> > on the power domain state, those resources are released later during
> > device_unbind_cleanup().
> >
> > Releasing devres-managed resources that depend on the power domain state
> > after detaching the device from its PM domain can cause failures.
> >
> > For example, if the driver uses devm_pm_runtime_enable() in its probe
> > function, and the device's clocks are managed by the PM domain, then
> > during removal the runtime PM is disabled in device_unbind_cleanup() after
> > the clocks have been removed from the PM domain. It may happen that the
> > devm_pm_runtime_enable() action causes the device to be runtime-resumed.
> > If the driver specific runtime PM APIs access registers directly, this
> > will lead to accessing device registers without clocks being enabled.
> > Similar issues may occur with other devres actions that access device
> > registers.
>
> I think you are concentrating too much on runtime PM aspect of this. As
> you mentioned in the last sentence the same issue may happen in the
> absence of runtime PM if the power domain code will shut down the device
> while it is not fully cleaned up.
>
> >
> > Add devm_pm_domain_attach(). When replacing the dev_pm_domain_attach() and
> > dev_pm_domain_detach() in bus probe and bus remove, it ensures that the
> > device is detached from its PM domain in device_unbind_cleanup(), only
> > after all driver's devres-managed resources have been release.
> >
> > For flexibility, the implemented devm_pm_domain_attach() has 2 state
> > arguments, one for the domain state on attach, one for the domain state on
> > detach.
> >
> > Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
> > ---
> >
> > Changes in v2:
> > - none; this patch is new
> >
> >  drivers/base/power/common.c | 59 +++++++++++++++++++++++++++++++++++++
> >  include/linux/pm_domain.h   |  8 +++++
> >  2 files changed, 67 insertions(+)
> >
> > diff --git a/drivers/base/power/common.c b/drivers/base/power/common.c
> > index 781968a128ff..6ef0924efe2e 100644
> > --- a/drivers/base/power/common.c
> > +++ b/drivers/base/power/common.c
> > @@ -115,6 +115,65 @@ int dev_pm_domain_attach(struct device *dev, bool power_on)
> >  }
> >  EXPORT_SYMBOL_GPL(dev_pm_domain_attach);
> >
> > +/**
> > + * devm_pm_domain_detach_off - devres action for devm_pm_domain_attach() to
> > + * detach a device and power it off.
> > + * @dev: device to detach.
> > + *
> > + * This function reverse the actions from devm_pm_domain_attach().
> > + * It will be invoked during the remove phase from drivers implicitly.
> > + */
> > +static void devm_pm_domain_detach_off(void *dev)
> > +{
> > +     dev_pm_domain_detach(dev, true);
> > +}
> > +
> > +/**
> > + * devm_pm_domain_detach_on - devres action for devm_pm_domain_attach() to
> > + * detach a device and power it on.
> > + * @dev: device to detach.
> > + *
> > + * This function reverse the actions from devm_pm_domain_attach().
> > + * It will be invoked during the remove phase from drivers implicitly.
> > + */
> > +static void devm_pm_domain_detach_on(void *dev)
> > +{
> > +     dev_pm_domain_detach(dev, false);
> > +}
> > +
> > +/**
> > + * devm_pm_domain_attach - devres-enabled version of dev_pm_domain_attach()
> > + * @dev: Device to attach.
> > + * @attach_power_on: Use to indicate whether we should power on the device
> > + *                   when attaching (true indicates the device is powered on
> > + *                   when attaching).
> > + * @detach_power_off: Used to indicate whether we should power off the device
> > + *                    when detaching (true indicates the device is powered off
> > + *                    when detaching).
> > + *
> > + * NOTE: this will also handle calling dev_pm_domain_detach() for
> > + * you during remove phase.
> > + *
> > + * Returns 0 on successfully attached PM domain, or a negative error code in
> > + * case of a failure.
> > + */
> > +int devm_pm_domain_attach(struct device *dev, bool attach_power_on,
> > +                       bool detach_power_off)
>
> Do we have examples where we power on a device and leave it powered on
> (or do not power on device on attach but power off it on detach)? I
> believe devm release should strictly mirror the acquisition, so separate
> flag is not needed.

This sounds reasonable for me too.

Note that, in most of the *special* cases for where
dev_pm_domain_attach|detach() is used today, the corresponding PM
domain is managed by genpd through a DT based configuration. And genpd
via genpd_dev_pm_attach|detach() doesn't even take this as an
in-parameter.

So this is solely for the behaviour for the acpi PM domain, just to
make sure that's clear.

[...]

Kind regards
Uffe

