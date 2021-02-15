Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5E10F31C182
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 15 Feb 2021 19:29:22 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229925AbhBOS1z (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 15 Feb 2021 13:27:55 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48446 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229802AbhBOS1v (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 15 Feb 2021 13:27:51 -0500
Received: from mail-yb1-xb2f.google.com (mail-yb1-xb2f.google.com [IPv6:2607:f8b0:4864:20::b2f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 654AEC061756
        for <linux-renesas-soc@vger.kernel.org>; Mon, 15 Feb 2021 10:27:11 -0800 (PST)
Received: by mail-yb1-xb2f.google.com with SMTP id c131so3245345ybf.7
        for <linux-renesas-soc@vger.kernel.org>; Mon, 15 Feb 2021 10:27:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=uZdfuvZKh6ztrTveUXeyEDkpyKAhS13j3dKVJUZWOmo=;
        b=D1wwNuFr+0FpZniHfm2h3fZDPqNd00MWNhfBi5k8SLFxmWR02gpFyGqaWAJxK5wHLq
         yC8+r0/Qj4PjOFCfBZPju5KVwPQFPWWM6tedamfW57Ie0kgx3DvCJ2ZDneu35lApe9I0
         K8AhKRE0wq2U8HvWoP3fkP546PxdcEVs2X5cyKn7EXPnA0r0SzrUDKvR4D9KMYXhdsnv
         bX+MfG+ZgUZ5007JZfbD+nfigpk4AUXEVqgm94bg4nks/kdRuHTWs5epatRHNR4guHcp
         jflSa6JwEvOCochYqol7ikXPawB4hU32wkf12MRnQ0/lhBlq2xNiPfLoTtI3RA8ROU3g
         jIcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=uZdfuvZKh6ztrTveUXeyEDkpyKAhS13j3dKVJUZWOmo=;
        b=dRahnpZuUexXAnX+yx2EaQ8d+308OvqyTgyR+6OB20WWi5c3ystRNPDZ3WlDn8c2vN
         HrO7yC5zOW7BJMHeTelA03FU71VIn7NSh9Q4W9Sd0lgmKPOQQy+5lj/LECsoIs94A7Kg
         dqHwmeIKasT7lV2XmxbkHSdMDDC+Z9dCzB1xX+WhiLeufoQvLOn1ZpdV52ZlwOKMgLfE
         wC8cBIBeDEDauNladU3uSn11s5DjKXhHiReHk+Jlby6HoxsUQiFwORrfm+c0DLcP/Xps
         c9plYr5I9RtEcDmMVeyXOxEMiGNCCuc6ApgYozrtQVJqzwpQGEDrJUR90pvNZD9ZkLcc
         9veg==
X-Gm-Message-State: AOAM532pktAZFSyNU47Zi+zaLy0iYLqbDT3FyyGMzKryAhXcn+Qh89H6
        HXVFK/gDJSGMYGCJxkwCtmmitqS9NuEqPTMIuinqMw==
X-Google-Smtp-Source: ABdhPJymB8VFqHaEfy3+cqkjsVG6qdmJtTdOYD0tnoDjZEEU0+MNAbjDITZYFZn/B3xUGD1RmKhzH+qUpw2eM3dHaUM=
X-Received: by 2002:a05:6902:1025:: with SMTP id x5mr24333565ybt.96.1613413630483;
 Mon, 15 Feb 2021 10:27:10 -0800 (PST)
MIME-Version: 1.0
References: <20210215111619.2385030-1-geert+renesas@glider.be> <CAJZ5v0ikVbMX0R9e_=wOxKfJX5X322AipmpWy-7wVnWE7Ogc9A@mail.gmail.com>
In-Reply-To: <CAJZ5v0ikVbMX0R9e_=wOxKfJX5X322AipmpWy-7wVnWE7Ogc9A@mail.gmail.com>
From:   Saravana Kannan <saravanak@google.com>
Date:   Mon, 15 Feb 2021 10:26:34 -0800
Message-ID: <CAGETcx94nNjduOuYKVBZOC9Gm4yfyb9x92ddznyxK4BnDby4PA@mail.gmail.com>
Subject: Re: [PATCH] driver core: Fix double failed probing with fw_devlink=on
To:     "Rafael J. Wysocki" <rafael@kernel.org>
Cc:     Geert Uytterhoeven <geert+renesas@glider.be>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Mon, Feb 15, 2021 at 6:59 AM Rafael J. Wysocki <rafael@kernel.org> wrote:
>
> On Mon, Feb 15, 2021 at 12:16 PM Geert Uytterhoeven
> <geert+renesas@glider.be> wrote:
> >
> > With fw_devlink=permissive, devices are added to the deferred probe
> > pending list if their driver's .probe() method returns -EPROBE_DEFER.
> >
> > With fw_devlink=on, devices are added to the deferred probe pending list
> > if they are determined to be a consumer,

If they are determined to be a consumer or if they are determined to
have a supplier that hasn't probed yet?

> > which happens before their
> > driver's .probe() method is called.  If the actual probe fails later
> > (real failure, not -EPROBE_DEFER), the device will still be on the
> > deferred probe pending list, and it will be probed again when deferred
> > probing kicks in, which is futile.
> >
> > Fix this by explicitly removing the device from the deferred probe
> > pending list in case of probe failures.
> >
> > Fixes: e590474768f1cc04 ("driver core: Set fw_devlink=on by default")
> > Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
>
> Good catch:
>
> Reviewed-by: Rafael J. Wysocki <rafael.j.wysocki@intel.com>

Geert,

The issue is real and needs to be fixed. But I'm confused how this can
happen. We won't even enter really_probe() if the driver isn't ready.
We also won't get to run the driver's .probe() if the suppliers aren't
ready. So how does the device get added to the deferred probe list
before the driver is ready? Is this due to device_links_driver_bound()
on the supplier?

Can you give a more detailed step by step on the case you are hitting?

Greg/Rafael,

Let's hold off picking this patch till I get to take a closer look
(within a day or two) please.

-Saravana

>
> > ---
> > Seen on various Renesas R-Car platforms, cfr.
> > https://lore.kernel.org/linux-acpi/CAMuHMdVL-1RKJ5u-HDVA4F4w_+8yGvQQuJQBcZMsdV4yXzzfcw@mail.gmail.com
> > ---
> >  drivers/base/dd.c | 2 ++
> >  1 file changed, 2 insertions(+)
> >
> > diff --git a/drivers/base/dd.c b/drivers/base/dd.c
> > index 9179825ff646f4e3..91c4181093c43709 100644
> > --- a/drivers/base/dd.c
> > +++ b/drivers/base/dd.c
> > @@ -639,11 +639,13 @@ static int really_probe(struct device *dev, struct device_driver *drv)
> >         case -ENXIO:
> >                 pr_debug("%s: probe of %s rejects match %d\n",
> >                          drv->name, dev_name(dev), ret);
> > +               driver_deferred_probe_del(dev);
> >                 break;
> >         default:
> >                 /* driver matched but the probe failed */
> >                 pr_warn("%s: probe of %s failed with error %d\n",
> >                         drv->name, dev_name(dev), ret);
> > +               driver_deferred_probe_del(dev);
> >         }
> >         /*
> >          * Ignore errors returned by ->probe so that the next driver can try
> > --
> > 2.25.1
> >
