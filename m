Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 157A931C356
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 15 Feb 2021 22:01:08 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229706AbhBOVAg (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 15 Feb 2021 16:00:36 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52826 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229520AbhBOVAd (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 15 Feb 2021 16:00:33 -0500
Received: from mail-yb1-xb2f.google.com (mail-yb1-xb2f.google.com [IPv6:2607:f8b0:4864:20::b2f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2792FC061574
        for <linux-renesas-soc@vger.kernel.org>; Mon, 15 Feb 2021 12:59:53 -0800 (PST)
Received: by mail-yb1-xb2f.google.com with SMTP id x19so8480454ybe.0
        for <linux-renesas-soc@vger.kernel.org>; Mon, 15 Feb 2021 12:59:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=3dLgveZdM46x2bbwg0HqxOz9RVwmEkJteT9c43w2RHs=;
        b=SPONsPUWVt8jXmzvcypXB2jQqpK3eFXkZUNBCSIDdaqTC7/FdkjuFaFJSA+tC7aBK3
         juscsNZufCi9yDHiFPIc3jEmB12dCLvZHGxN8qTIxEGQC8T4+Tj5KBgjYVxCZvYJ08zV
         TpCEDRjY0Cn764gGGuzDGN6JdAUEZvhnBh78QgSnZITZkHD8wzSHmHSYman3GvS/PQ4B
         /A4W3S8lv3hN0PvaocLDCzWX+6OuOrN5kPV+bUVJDs0vdQp0YCGu7+DAATUHmSwq24tb
         MGXsu/qO2cCs2lqFKhNT4LWh9PTNHNGMuqmAQx0PkGhuWxDvRtrbr0QJt18vPciIXesV
         ZalQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=3dLgveZdM46x2bbwg0HqxOz9RVwmEkJteT9c43w2RHs=;
        b=V4eOLC7N/8EcgwP6ihEaa94zjW3jOgZKBTRdrfLt9ECima0aGBGJAaSLy0CoON+Jb7
         WU3/tCEuVjVK/9BCkVZohPYiOBGtd4LcRQvxwJ/SQqsCE3yrMz5H+zAcp6e+zpr5mZ7L
         HRhtHVhh5lfGLOCpzGeWkzwNzvZuRHu6VYwfEl11aTadcPSVUUK2V5fg3rjoDos0Kq9Q
         uBIU5Q+FapvPwB1ap7Db6PeV+CrAFWudut1tbQR+8cqmH440OOzwVe+VE2gITJYv4Odw
         RH6WIisKiM1rMasxpbRhPgWVXFkSev31qRhwSUhlDDhrh1U5wsVzGJ3zP3c5J71DquwF
         OXjA==
X-Gm-Message-State: AOAM531Mj+sKC4yqLh3wX9HjNzX28HsUq4dfInDALbll5l/f4DvC6Zpk
        urk4QP/Ci8SxB3uf/qhSh6ydc86/GQ+cQgwbPcKu8kgSq3g=
X-Google-Smtp-Source: ABdhPJxdBJn00t260+EU9W6ab+mrqb6SJOPbOyq4TlRcLive6b7K4hJBfBra7aqPTVcGhSYq1Eh4KZDTEoiqgB83IXQ=
X-Received: by 2002:a25:af0b:: with SMTP id a11mr24804601ybh.228.1613422792220;
 Mon, 15 Feb 2021 12:59:52 -0800 (PST)
MIME-Version: 1.0
References: <20210215111619.2385030-1-geert+renesas@glider.be>
 <CAJZ5v0ikVbMX0R9e_=wOxKfJX5X322AipmpWy-7wVnWE7Ogc9A@mail.gmail.com>
 <CAGETcx94nNjduOuYKVBZOC9Gm4yfyb9x92ddznyxK4BnDby4PA@mail.gmail.com> <CAMuHMdWm9FiJHWTzGqqNa-ggt9WTpS6Hg2WthNW86p_WpvPUtw@mail.gmail.com>
In-Reply-To: <CAMuHMdWm9FiJHWTzGqqNa-ggt9WTpS6Hg2WthNW86p_WpvPUtw@mail.gmail.com>
From:   Saravana Kannan <saravanak@google.com>
Date:   Mon, 15 Feb 2021 12:59:16 -0800
Message-ID: <CAGETcx8N5QmR5V_mrv5tHmARsnWrLbH+N_Ay_pBqV9HJkpHJzQ@mail.gmail.com>
Subject: Re: [PATCH] driver core: Fix double failed probing with fw_devlink=on
To:     Geert Uytterhoeven <geert@linux-m68k.org>
Cc:     "Rafael J. Wysocki" <rafael@kernel.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Mon, Feb 15, 2021 at 11:08 AM Geert Uytterhoeven
<geert@linux-m68k.org> wrote:
>
> Hi Saravana,
>
> On Mon, Feb 15, 2021 at 7:27 PM Saravana Kannan <saravanak@google.com> wrote:
> > On Mon, Feb 15, 2021 at 6:59 AM Rafael J. Wysocki <rafael@kernel.org> wrote:
> > > On Mon, Feb 15, 2021 at 12:16 PM Geert Uytterhoeven
> > > <geert+renesas@glider.be> wrote:
> > > > With fw_devlink=permissive, devices are added to the deferred probe
> > > > pending list if their driver's .probe() method returns -EPROBE_DEFER.
> > > >
> > > > With fw_devlink=on, devices are added to the deferred probe pending list
> > > > if they are determined to be a consumer,
> >
> > If they are determined to be a consumer or if they are determined to
> > have a supplier that hasn't probed yet?
>
> When the supplier has probed:
>
>     bus: 'platform': driver_probe_device: matched device
> e6150000.clock-controller with driver renesas-cpg-mssr
>     bus: 'platform': really_probe: probing driver renesas-cpg-mssr
> with device e6150000.clock-controller
>     PM: Added domain provider from /soc/clock-controller@e6150000
>     driver: 'renesas-cpg-mssr': driver_bound: bound to device
> 'e6150000.clock-controller'
>     platform e6055800.gpio: Added to deferred list
>     [...]
>     platform e6020000.watchdog: Added to deferred list
>     [...]
>     platform fe000000.pcie: Added to deferred list
>
> > > > which happens before their
> > > > driver's .probe() method is called.  If the actual probe fails later
> > > > (real failure, not -EPROBE_DEFER), the device will still be on the
> > > > deferred probe pending list, and it will be probed again when deferred
> > > > probing kicks in, which is futile.
> > > >
> > > > Fix this by explicitly removing the device from the deferred probe
> > > > pending list in case of probe failures.
> > > >
> > > > Fixes: e590474768f1cc04 ("driver core: Set fw_devlink=on by default")
> > > > Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> > >
> > > Good catch:
> > >
> > > Reviewed-by: Rafael J. Wysocki <rafael.j.wysocki@intel.com>
> >
> > The issue is real and needs to be fixed. But I'm confused how this can
> > happen. We won't even enter really_probe() if the driver isn't ready.
> > We also won't get to run the driver's .probe() if the suppliers aren't
> > ready. So how does the device get added to the deferred probe list
> > before the driver is ready? Is this due to device_links_driver_bound()
> > on the supplier?
> >
> > Can you give a more detailed step by step on the case you are hitting?
>
> The device is added to the list due to device_links_driver_bound()
> calling driver_deferred_probe_add() on all consumer devices.

Thanks for the explanation. Maybe add more details like this to the
commit text or in the code?

For the code:
Reviewed-by: Saravana Kanna <saravanak@google.com>

-Saravana

>
> > > > +++ b/drivers/base/dd.c
> > > > @@ -639,11 +639,13 @@ static int really_probe(struct device *dev, struct device_driver *drv)
> > > >         case -ENXIO:
> > > >                 pr_debug("%s: probe of %s rejects match %d\n",
> > > >                          drv->name, dev_name(dev), ret);
> > > > +               driver_deferred_probe_del(dev);
> > > >                 break;
> > > >         default:
> > > >                 /* driver matched but the probe failed */
> > > >                 pr_warn("%s: probe of %s failed with error %d\n",
> > > >                         drv->name, dev_name(dev), ret);
> > > > +               driver_deferred_probe_del(dev);
> > > >         }
> > > >         /*
> > > >          * Ignore errors returned by ->probe so that the next driver can try
>
> Gr{oetje,eeting}s,
>
>                         Geert
>
> --
> Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org
>
> In personal conversations with technical people, I call myself a hacker. But
> when I'm talking to journalists I just say "programmer" or something like that.
>                                 -- Linus Torvalds
