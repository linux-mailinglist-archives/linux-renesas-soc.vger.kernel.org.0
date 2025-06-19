Return-Path: <linux-renesas-soc+bounces-18533-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id EF785AE058B
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 19 Jun 2025 14:23:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 3D8307A6C42
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 19 Jun 2025 12:22:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D3DE42459DC;
	Thu, 19 Jun 2025 12:21:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="CBWs8vz9"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-yb1-f169.google.com (mail-yb1-f169.google.com [209.85.219.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 94A53230BF2
	for <linux-renesas-soc@vger.kernel.org>; Thu, 19 Jun 2025 12:21:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750335702; cv=none; b=LldENL/gZxz2z++RNePQFQynlfhbXg6s/kcBL8a7v5GFXXXmpTkpqDg08OKJYncBG+JrMVw7uCnw1FzryaESduifjEel9pyvZA2xeVSrF8F7hlRYfnBpuG+J1btFOEsTzHWs/U7++PUFEp9OE99Y9MMLL9gAVmtNqNfsS/figFo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750335702; c=relaxed/simple;
	bh=YRue0WJuPtLxoBVv+KFDo9ZggLsUwdYL3n1w3SwMk3Y=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=LZdoWzZ1vCSgwU2vhg2ek+s+TFnnsbS+cC5ZwU62gwCVJwPiNKBOroIkbkOq07e8PyRJEdf3DwyfSimZPjej/FnPi5ao8Gr7cSUjqnP2qxgpRrFAjA87i9rgXlp7wr6drfXnax7kTSZ2nu5s7e6Zt5O9F9H+cJCqzI7ORVzHZyM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=CBWs8vz9; arc=none smtp.client-ip=209.85.219.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yb1-f169.google.com with SMTP id 3f1490d57ef6-e7569ccf04cso674511276.0
        for <linux-renesas-soc@vger.kernel.org>; Thu, 19 Jun 2025 05:21:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1750335699; x=1750940499; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pwmdksVD6YXez/dG34BIFl6OrS8BUR1pzIoP9l3GraY=;
        b=CBWs8vz9W86f/IyF7T8aGUyxB3Ol+eVekJryNBZzte1jhFx8FZEeomXFaSrbP7KmCY
         XpJS+O5xxX3WCGWnBfvfK4EXdavXl82wyfolumXaG5dNMzVJ2TkyZpH9aO+PBJLxKXMy
         AbfMEBaoQv9Jk9hWEJ0ViznkXEWVgUnbCPfcdzV4Y7A/RJuLsSmdhpNb3QWv//fbPZGS
         iMMdnjkGzqbPKRR4UllCsHaGo6uIZN1cGDPCWEnyqaYWTDTHB+F6bOrnc+DzoLIkj+kp
         jaxC7yQ8jYoT/9xukMqVKJ2X6tpnj0fMa4fQLP9Fe+97cvTlFVBG2pJLCHKQIDKQf89/
         xYpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750335699; x=1750940499;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=pwmdksVD6YXez/dG34BIFl6OrS8BUR1pzIoP9l3GraY=;
        b=BERoLTmmFitqolrAg7nH2u0bkP2hGLbfBQ4H+mU+Cyg9yo02/On8K6bl7UB592GfK0
         a/i3DLft01sahuva+n+xXAxRRQVp0zouc5Q8jlfId3iV+kFSqH1p6fB6uYmAJzvPSZas
         Xw5Y3gTzaQvQ2a0v9LuJexw4FX0QpkrmnxC2SNa82lSWcLcAHbuoxZTsLgdA6rxnU1JQ
         6Wzqz0zvE9F/lajxaOXV+9KF4GbRlPR90q0IE9MFL9cjNAI9C5V9gUx7QzZw83OlvAcL
         pFdvnxAbKD+wAw0zPdatGLIfGoEBVsTnM2YUkRl0VpZqDeYmiCY8rjXMIyp1O+den+Vy
         VH9Q==
X-Forwarded-Encrypted: i=1; AJvYcCW6D49ZJBNx+jqvlA0Sltr7UB1GwU0+ACFva2W/cTavVELySaekrUgEucGcTS5PGQDi3pvRFHcHVwM/pPBinxKqTA==@vger.kernel.org
X-Gm-Message-State: AOJu0YzRju2chDaFInlSBp1EgC/D80c7AlwcYcc8Ye5dmHIW/BZCglIj
	z+p7yxtq5PaQ640JNY9B0+P66043iuVdcks+7iVhMbQ0i2thZlZOJXUfVHrxBYqyc05d23QpZSG
	C8mC5B3KmA08Dclr+pmvRYN48D2cCnPQmLWQBzuQF6A==
X-Gm-Gg: ASbGnctCHQFeInTzNiL3bJEDznTvbSV1y2LZ5cnAPavP4SzyNE6FlM+s/kGr/MFUIt1
	1L4OwxJZIEUdR5Pdqd6wWroCOgCWE3vv3WuO6mFGrR8NtTAmQq5RJFJZuktddJa2iS+wOxdlWtX
	PSXN5CxQLs/xdAqkXlGjCSusAGmQuoHkoE562LJn9FmYablggG8ibUNoI=
X-Google-Smtp-Source: AGHT+IFVjuxM9JhUXyBY5Y1KHd+A+kbHg5s3qsj6ylPNC3aTnc86js3xN9INVKP5Nzq0IMhBoxC+yHOrUaKFuQRK7Tg=
X-Received: by 2002:a05:6902:461a:b0:e81:cfde:3d46 with SMTP id
 3f1490d57ef6-e822acc753fmr25933364276.16.1750335699445; Thu, 19 Jun 2025
 05:21:39 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250606111749.3142348-1-claudiu.beznea.uj@bp.renesas.com>
 <20250606111749.3142348-2-claudiu.beznea.uj@bp.renesas.com>
 <CAJZ5v0i_Ey+OVpSZHXru=tubMaZi=y-uOh_0M6zmWZ2DqqA7Vg@mail.gmail.com>
 <zhjytvj35lknj7v3jhva3n3nbv6qctvqgykwyi5huj6omet7lz@wchd7f4p4dpv>
 <CAJZ5v0hsT-Q2hz=qoBo409oungaCmexJwwGheN7KRLFqz=6_Dw@mail.gmail.com>
 <20250607140600.76e87ea5@jic23-huawei> <CAJZ5v0jqZ6gYKb85dpR-X5RwFeUBcbbcJ_b-AOe+JypBXod-MA@mail.gmail.com>
 <486a1110-5336-42fd-82b8-a7b1452bad65@tuxon.dev> <CAJZ5v0hqBm4L2V9aUjB0tmW67eRRCnM7FScgdJQ=ihnpAZuMfA@mail.gmail.com>
 <4360ee7a-d85a-4fa0-a1d6-d09a3b9d57c0@tuxon.dev> <CAJZ5v0jUGf9QO6h6bcBcTX+nUbDeD0XMhWj1Qb-0qAtZ8EbVsA@mail.gmail.com>
 <1b83c587-76c2-4fa1-aef8-f94575a3627a@tuxon.dev> <CAJZ5v0jZNX+FCmu_FeRPS47F37AmyAN25+7LJvzbqRdvs-aGcQ@mail.gmail.com>
In-Reply-To: <CAJZ5v0jZNX+FCmu_FeRPS47F37AmyAN25+7LJvzbqRdvs-aGcQ@mail.gmail.com>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Thu, 19 Jun 2025 14:21:03 +0200
X-Gm-Features: AX0GCFuSuDxy-Q537az3NIbYqeWbeOa0jS8fPqafARgyDQg4xgTuVFH_Ol9pIOM
Message-ID: <CAPDyKFq9at+aA+OG__ZHvhc3AELfUOyOakH7a=MGHrbAjzL8OA@mail.gmail.com>
Subject: Re: [PATCH v3 1/2] PM: domains: Add devres variant for dev_pm_domain_attach()
To: "Rafael J. Wysocki" <rafael@kernel.org>
Cc: Claudiu Beznea <claudiu.beznea@tuxon.dev>, Jonathan Cameron <jic23@kernel.org>, 
	Dmitry Torokhov <dmitry.torokhov@gmail.com>, gregkh@linuxfoundation.org, dakr@kernel.org, 
	len.brown@intel.com, pavel@kernel.org, daniel.lezcano@linaro.org, 
	linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org, bhelgaas@google.com, 
	geert@linux-m68k.org, linux-iio@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org, fabrizio.castro.jz@renesas.com, 
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, 16 Jun 2025 at 13:47, Rafael J. Wysocki <rafael@kernel.org> wrote:
>
> On Mon, Jun 16, 2025 at 1:37=E2=80=AFPM Claudiu Beznea <claudiu.beznea@tu=
xon.dev> wrote:
> >
> >
> >
> > On 16.06.2025 14:18, Rafael J. Wysocki wrote:
> > > On Mon, Jun 16, 2025 at 11:37=E2=80=AFAM Claudiu Beznea
> > > <claudiu.beznea@tuxon.dev> wrote:
> > >>
> > >> Hi, Rafael,
> > >>
> > >> On 13.06.2025 13:02, Rafael J. Wysocki wrote:
> > >>> On Fri, Jun 13, 2025 at 9:39=E2=80=AFAM Claudiu Beznea <claudiu.bez=
nea@tuxon.dev> wrote:
> > >>>>
> > >>>> Hi, Rafael,
> > >>>>
> > >>>> On 09.06.2025 22:59, Rafael J. Wysocki wrote:
> > >>>>> On Sat, Jun 7, 2025 at 3:06=E2=80=AFPM Jonathan Cameron <jic23@ke=
rnel.org> wrote:
> > >>>>>>
> > >>>>>> On Fri, 6 Jun 2025 22:01:52 +0200
> > >>>>>> "Rafael J. Wysocki" <rafael@kernel.org> wrote:
> > >>>>>>
> > >>>>>> Hi Rafael,
> > >>>>>>
> > >>>>>>> On Fri, Jun 6, 2025 at 8:55=E2=80=AFPM Dmitry Torokhov
> > >>>>>>> <dmitry.torokhov@gmail.com> wrote:
> > >>>>>>>>
> > >>>>>>>> On Fri, Jun 06, 2025 at 06:00:34PM +0200, Rafael J. Wysocki wr=
ote:
> > >>>>>>>>> On Fri, Jun 6, 2025 at 1:18=E2=80=AFPM Claudiu <claudiu.bezne=
a@tuxon.dev> wrote:
> > >>>>>>>>>>
> > >>>>>>>>>> From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
> > >>>>>>>>>>
> > >>>>>>>>>> The dev_pm_domain_attach() function is typically used in bus=
 code alongside
> > >>>>>>>>>> dev_pm_domain_detach(), often following patterns like:
> > >>>>>>>>>>
> > >>>>>>>>>> static int bus_probe(struct device *_dev)
> > >>>>>>>>>> {
> > >>>>>>>>>>     struct bus_driver *drv =3D to_bus_driver(dev->driver);
> > >>>>>>>>>>     struct bus_device *dev =3D to_bus_device(_dev);
> > >>>>>>>>>>     int ret;
> > >>>>>>>>>>
> > >>>>>>>>>>     // ...
> > >>>>>>>>>>
> > >>>>>>>>>>     ret =3D dev_pm_domain_attach(_dev, true);
> > >>>>>>>>>>     if (ret)
> > >>>>>>>>>>         return ret;
> > >>>>>>>>>>
> > >>>>>>>>>>     if (drv->probe)
> > >>>>>>>>>>         ret =3D drv->probe(dev);
> > >>>>>>>>>>
> > >>>>>>>>>>     // ...
> > >>>>>>>>>> }
> > >>>>>>>>>>
> > >>>>>>>>>> static void bus_remove(struct device *_dev)
> > >>>>>>>>>> {
> > >>>>>>>>>>     struct bus_driver *drv =3D to_bus_driver(dev->driver);
> > >>>>>>>>>>     struct bus_device *dev =3D to_bus_device(_dev);
> > >>>>>>>>>>
> > >>>>>>>>>>     if (drv->remove)
> > >>>>>>>>>>         drv->remove(dev);
> > >>>>>>>>>>     dev_pm_domain_detach(_dev);
> > >>>>>>>>>> }
> > >>>>>>>>>>
> > >>>>>>>>>> When the driver's probe function uses devres-managed resourc=
es that depend
> > >>>>>>>>>> on the power domain state, those resources are released late=
r during
> > >>>>>>>>>> device_unbind_cleanup().
> > >>>>>>>>>>
> > >>>>>>>>>> Releasing devres-managed resources that depend on the power =
domain state
> > >>>>>>>>>> after detaching the device from its PM domain can cause fail=
ures.
> > >>>>>>>>>>
> > >>>>>>>>>> For example, if the driver uses devm_pm_runtime_enable() in =
its probe
> > >>>>>>>>>> function, and the device's clocks are managed by the PM doma=
in, then
> > >>>>>>>>>> during removal the runtime PM is disabled in device_unbind_c=
leanup() after
> > >>>>>>>>>> the clocks have been removed from the PM domain. It may happ=
en that the
> > >>>>>>>>>> devm_pm_runtime_enable() action causes the device to be runt=
ime-resumed.
> > >>>>>>>>>
> > >>>>>>>>> Don't use devm_pm_runtime_enable() then.
> > >>>>>>>>
> > >>>>>>>> What about other devm_ APIs? Are you suggesting that platform =
drivers
> > >>>>>>>> should not be using devm_clk*(), devm_regulator_*(),
> > >>>>>>>> devm_request_*_irq() and devm_add_action_or_reset()? Because a=
gain,
> > >>>>>>>> dev_pm_domain_detach() that is called by platform bus_remove()=
 may shut
> > >>>>>>>> off the device too early, before cleanup code has a chance to =
execute
> > >>>>>>>> proper cleanup.
> > >>>>>>>>
> > >>>>>>>> The issue is not limited to runtime PM.
> > >>>>>>>>
> > >>>>>>>>>
> > >>>>>>>>>> If the driver specific runtime PM APIs access registers dire=
ctly, this
> > >>>>>>>>>> will lead to accessing device registers without clocks being=
 enabled.
> > >>>>>>>>>> Similar issues may occur with other devres actions that acce=
ss device
> > >>>>>>>>>> registers.
> > >>>>>>>>>>
> > >>>>>>>>>> Add devm_pm_domain_attach(). When replacing the dev_pm_domai=
n_attach() and
> > >>>>>>>>>> dev_pm_domain_detach() in bus probe and bus remove, it ensur=
es that the
> > >>>>>>>>>> device is detached from its PM domain in device_unbind_clean=
up(), only
> > >>>>>>>>>> after all driver's devres-managed resources have been releas=
e.
> > >>>>>>>>>>
> > >>>>>>>>>> For flexibility, the implemented devm_pm_domain_attach() has=
 2 state
> > >>>>>>>>>> arguments, one for the domain state on attach, one for the d=
omain state on
> > >>>>>>>>>> detach.
> > >>>>>>>>>
> > >>>>>>>>> dev_pm_domain_attach() is not part driver API and I'm not con=
vinced at
> > >>>>>>>>
> > >>>>>>>> Is the concern that devm_pm_domain_attach() will be [ab]used b=
y drivers?
> > >>>>>>>
> > >>>>>>> Yes, among other things.
> > >>>>>>
> > >>>>>> Maybe naming could make abuse at least obvious to spot? e.g.
> > >>>>>> pm_domain_attach_with_devm_release()
> > >>>>>
> > >>>>> If I'm not mistaken, it is not even necessary to use devres for t=
his.
> > >>>>>
> > >>>>> You might as well add a dev_pm_domain_detach() call to
> > >>>>> device_unbind_cleanup() after devres_release_all().  There is a s=
light
> > >>>>> complication related to the second argument of it, but I suppose =
that
> > >>>>> this can be determined at the attach time and stored in a new dev=
ice
> > >>>>> PM flag, or similar.
> > >>>>>
> > >>>>
> > >>>> I looked into this solution. I've tested it for all my failure cas=
es and
> > >>>> went good.
> > >>>
> > >>> OK
> > >>>
> > >>>>> Note that dev->pm_domain is expected to be cleared by ->detach(),=
 so
> > >>>>> this should not cause the domain to be detached twice in a row fr=
om
> > >>>>> the same device, but that needs to be double-checked.
> > >>>>
> > >>>> The genpd_dev_pm_detach() calls genpd_remove_device() ->
> > >>>> dev_pm_domain_set(dev, NULL) which sets the dev->pm_domain =3D NUL=
L. I can't
> > >>>> find any other detach function in the current code base.
> > >>>
> > >>> There is also acpi_dev_pm_detach() which can be somewhat hard to fi=
nd,
> > >>> but it calls dev_pm_domain_set(dev, NULL) either.
> > >>>
> > >>>> The code I've tested for this solution is this one:
> > >>>>
> > >>>> diff --git a/drivers/base/dd.c b/drivers/base/dd.c
> > >>>> index b526e0e0f52d..5e9750d007b4 100644
> > >>>> --- a/drivers/base/dd.c
> > >>>> +++ b/drivers/base/dd.c
> > >>>> @@ -25,6 +25,7 @@
> > >>>>  #include <linux/kthread.h>
> > >>>>  #include <linux/wait.h>
> > >>>>  #include <linux/async.h>
> > >>>> +#include <linux/pm_domain.h>
> > >>>>  #include <linux/pm_runtime.h>
> > >>>>  #include <linux/pinctrl/devinfo.h>
> > >>>>  #include <linux/slab.h>
> > >>>> @@ -552,8 +553,11 @@ static void device_unbind_cleanup(struct devi=
ce *dev)
> > >>>>         dev->dma_range_map =3D NULL;
> > >>>>         device_set_driver(dev, NULL);
> > >>>>         dev_set_drvdata(dev, NULL);
> > >>>> -       if (dev->pm_domain && dev->pm_domain->dismiss)
> > >>>> -               dev->pm_domain->dismiss(dev);
> > >>>> +       if (dev->pm_domain) {
> > >>>> +               if (dev->pm_domain->dismiss)
> > >>>> +                       dev->pm_domain->dismiss(dev);
> > >>>> +               dev_pm_domain_detach(dev, dev->pm_domain->detach_p=
ower_off);
> > >>>
> > >>> I would do the "detach" before the "dismiss" to retain the current =
ordering.
> > >>
> > >> I applied on my local development branch all your suggestions except=
 this
> > >> one because genpd_dev_pm_detach() as well as acpi_dev_pm_detach() se=
t
> > >> dev->pm_domain =3D NULL.
> > >>
> > >> Due to this I would call first ->dismiss() then ->detach(), as initi=
ally
> > >> proposed. Please let me know if you consider it otherwise.
> > >
> > > This is a matter of adding one more dev->pm_domain check AFAICS, but =
OK.
> >
> > I don't know all the subtleties around this, my concern with adding one
> > more check on dev->pm_domain was that the
> > dev->pm_domain->dismiss() will never be called if the ->detach() functi=
on
> > will be called before ->dismiss() and it will set dev->pm_domain =3D NU=
LL (as
> > it does today (though genpd_dev_pm_detach() and acpi_dev_pm_detach())).
> >
> > For platform drivers that used to call dev_pm_domain_detach() in platfo=
rm
> > bus remove function, if I'm not wrong, the dev->pm_domain->dismiss() wa=
s
> > never called previously. If that is a valid scenario, the code proposed=
 in
> > this thread will change the behavior for devices that have ->dismiss()
> > implemented.
>
> ->dismiss() and ->detach() are supposed to be mutually exclusive, so
> this should not be a problem either way and in practice so far the
> only user of ->dismiss() has been acpi_lpss_pm_domain which doesn't do
> ->detach() at all.

May I ask if you know if there remains any real good reasons to keep
the ->dismiss() callback around?

Can't acpi_lpss_pm_domain() convert to use the ->detach() callback
instead? Just thinking that it would be easier, but maybe it doesn't
work.

Kind regards
Uffe

