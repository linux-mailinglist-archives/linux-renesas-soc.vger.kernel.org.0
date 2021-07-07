Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 754353BE48D
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  7 Jul 2021 10:43:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230231AbhGGIqE (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 7 Jul 2021 04:46:04 -0400
Received: from mail-vk1-f182.google.com ([209.85.221.182]:46011 "EHLO
        mail-vk1-f182.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230109AbhGGIqD (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 7 Jul 2021 04:46:03 -0400
Received: by mail-vk1-f182.google.com with SMTP id j190so416563vkg.12;
        Wed, 07 Jul 2021 01:43:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=g/NUV0k0sKL15rnH03t063q9JhylHeH6MXLj7AK83z8=;
        b=hGRzyERd1Ifu5U2xCx+uvaOeg+Gs4rSORmty/w3GQgjVSi+RVWdU9G9dyYQYAb+zyR
         JpwBfSl9ZzYEBqOzRhYELZUCcXGxln4QU9gv7ShLkTfCSywDByg18ltgjwcq551unoiK
         JuBxP3+aZArVDKvK1TUwHSF2xFIo86W2wmnE+cpcM4Z7R4hY1YT+So4aDqtvkLNHu58W
         sM0D/cpcRpiokO8V36rn2Mld1lvubjvEbTfIL2dfXTYB90vowqcjC7DfV2rYKO91dGKc
         Xd31hcB3N7LQD7kjUUlykRt3Pc2q4PkhtkMV3xm0YAOWwVJhBa/3D9t6K3YF+TjKqWlj
         zHNg==
X-Gm-Message-State: AOAM533dxEZxOBLC4/IfpEPiqxI8p6cl8xafjIB3Mmld2xXg85Tp+Ojt
        BKfcMa9AEXC6XU+yr8TrfVib7UD5sfw9gNSI0Ss=
X-Google-Smtp-Source: ABdhPJzgLJIgx7W1jbaDRxib8S/xT/cP8DYEWlpRrWLGM3rELD5iehuQGXyHOsv5HLOH75vCH9WGhY83DuluoiFFbkA=
X-Received: by 2002:a1f:1207:: with SMTP id 7mr520916vks.1.1625647403340; Wed,
 07 Jul 2021 01:43:23 -0700 (PDT)
MIME-Version: 1.0
References: <20210215111619.2385030-1-geert+renesas@glider.be>
 <CAJZ5v0ikVbMX0R9e_=wOxKfJX5X322AipmpWy-7wVnWE7Ogc9A@mail.gmail.com>
 <CAGETcx94nNjduOuYKVBZOC9Gm4yfyb9x92ddznyxK4BnDby4PA@mail.gmail.com>
 <CAMuHMdWm9FiJHWTzGqqNa-ggt9WTpS6Hg2WthNW86p_WpvPUtw@mail.gmail.com>
 <CAGETcx8N5QmR5V_mrv5tHmARsnWrLbH+N_Ay_pBqV9HJkpHJzQ@mail.gmail.com> <CAGETcx8nD7Ak8z7JEM1jUVdRRpUt=8BwGMix0ghv1QeDBLaGwA@mail.gmail.com>
In-Reply-To: <CAGETcx8nD7Ak8z7JEM1jUVdRRpUt=8BwGMix0ghv1QeDBLaGwA@mail.gmail.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Wed, 7 Jul 2021 10:43:12 +0200
Message-ID: <CAMuHMdX-cZO-tsj6T9av79d_bELihBfFGmB1=F+6YRNmUBWs9g@mail.gmail.com>
Subject: Re: [PATCH] driver core: Fix double failed probing with fw_devlink=on
To:     Saravana Kannan <saravanak@google.com>
Cc:     "Rafael J. Wysocki" <rafael@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Saravana,

(going over old patch I still have in my local tree)

On Tue, Feb 16, 2021 at 6:08 PM Saravana Kannan <saravanak@google.com> wrote:
> On Mon, Feb 15, 2021 at 12:59 PM Saravana Kannan <saravanak@google.com> wrote:
> > On Mon, Feb 15, 2021 at 11:08 AM Geert Uytterhoeven
> > <geert@linux-m68k.org> wrote:
> > > On Mon, Feb 15, 2021 at 7:27 PM Saravana Kannan <saravanak@google.com> wrote:
> > > > On Mon, Feb 15, 2021 at 6:59 AM Rafael J. Wysocki <rafael@kernel.org> wrote:
> > > > > On Mon, Feb 15, 2021 at 12:16 PM Geert Uytterhoeven
> > > > > <geert+renesas@glider.be> wrote:
> > > > > > With fw_devlink=permissive, devices are added to the deferred probe
> > > > > > pending list if their driver's .probe() method returns -EPROBE_DEFER.
> > > > > >
> > > > > > With fw_devlink=on, devices are added to the deferred probe pending list
> > > > > > if they are determined to be a consumer,
> > > >
> > > > If they are determined to be a consumer or if they are determined to
> > > > have a supplier that hasn't probed yet?
> > >
> > > When the supplier has probed:
> > >
> > >     bus: 'platform': driver_probe_device: matched device
> > > e6150000.clock-controller with driver renesas-cpg-mssr
> > >     bus: 'platform': really_probe: probing driver renesas-cpg-mssr
> > > with device e6150000.clock-controller
> > >     PM: Added domain provider from /soc/clock-controller@e6150000
> > >     driver: 'renesas-cpg-mssr': driver_bound: bound to device
> > > 'e6150000.clock-controller'
> > >     platform e6055800.gpio: Added to deferred list
> > >     [...]
> > >     platform e6020000.watchdog: Added to deferred list
> > >     [...]
> > >     platform fe000000.pcie: Added to deferred list
> > >
> > > > > > which happens before their
> > > > > > driver's .probe() method is called.  If the actual probe fails later
> > > > > > (real failure, not -EPROBE_DEFER), the device will still be on the
> > > > > > deferred probe pending list, and it will be probed again when deferred
> > > > > > probing kicks in, which is futile.
> > > > > >
> > > > > > Fix this by explicitly removing the device from the deferred probe
> > > > > > pending list in case of probe failures.
> > > > > >
> > > > > > Fixes: e590474768f1cc04 ("driver core: Set fw_devlink=on by default")
> > > > > > Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> > > > >
> > > > > Good catch:
> > > > >
> > > > > Reviewed-by: Rafael J. Wysocki <rafael.j.wysocki@intel.com>
> > > >
> > > > The issue is real and needs to be fixed. But I'm confused how this can
> > > > happen. We won't even enter really_probe() if the driver isn't ready.
> > > > We also won't get to run the driver's .probe() if the suppliers aren't
> > > > ready. So how does the device get added to the deferred probe list
> > > > before the driver is ready? Is this due to device_links_driver_bound()
> > > > on the supplier?
> > > >
> > > > Can you give a more detailed step by step on the case you are hitting?
> > >
> > > The device is added to the list due to device_links_driver_bound()
> > > calling driver_deferred_probe_add() on all consumer devices.
> >
> > Thanks for the explanation. Maybe add more details like this to the
> > commit text or in the code?
> >
> > For the code:
> > Reviewed-by: Saravana Kanna <saravanak@google.com>
>
> Ugh... I just realized that I might have to give this a Nak because of
> bad locking in deferred_probe_work_func(). The unlock/lock inside the
> loop is a terrible hack. If we add this patch, we can end up modifying
> a linked list while it's being traversed and cause a crash or busy
> loop (you'll accidentally end up on an "empty list"). I ran into a
> similar issue during one of my unrelated refactors.

Turns out the issue I was seeing went away due to commit
f2db85b64f0af141 ("driver core: Avoid pointless deferred probe
attempts"), so there is no need to apply this patch.


Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
