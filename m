Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 873C931C238
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 15 Feb 2021 20:12:19 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230392AbhBOTJY (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 15 Feb 2021 14:09:24 -0500
Received: from mail-ot1-f44.google.com ([209.85.210.44]:44526 "EHLO
        mail-ot1-f44.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229764AbhBOTJW (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 15 Feb 2021 14:09:22 -0500
Received: by mail-ot1-f44.google.com with SMTP id e5so6937589otb.11;
        Mon, 15 Feb 2021 11:09:05 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Fngrg/WHYlhlxWa8+hf+0PTGq5DsLjbMv81QOG2P/go=;
        b=WvDLdQTgI3oukNSVOBRQnmOanbK1k24gPMtA0iMTps1Q3ltHZJL9AquDs3y3W0Z77O
         kTQkzYQnOYF8vbNXhNpuAGhkW2PUA0zUcf0hAODxJlngkI92puNZob9tuOtF1VhEMmHy
         mcfaKSekZ+f0QCnPf3RDoUnIE2uAS1Gm3xl96mtY7gTToIKUTStL8lW3MR+ykcyT9V/r
         L3kYbCyn//WTjXvwqKJKoQB69S2DaiiGDAEcq7JDfc2UyQunKhsh4DLupWexGLo27G3D
         184nwWFCIhyjmmyln0fFDgj/JAyfGY1Y8XgdxFh3qJDeQTOgaheGboCvcPSixmO61V9C
         G3iw==
X-Gm-Message-State: AOAM533cT76skx+vgIjTqkFOeEn24S1OU+kegLX8GUu1f9eFkYN2US/1
        witr84fR7mRkwZ3j2zFad800aVv2uLWacZOt6Tc=
X-Google-Smtp-Source: ABdhPJynUEnxA8NjQ9hcCKR6ycrigP4iFglicdGPK8cp2FKtT0YAPC253Anh8Rkpod0lKr7kwdcwRxSHDtyNpR1nnw0=
X-Received: by 2002:a05:6830:148d:: with SMTP id s13mr12299201otq.250.1613416120234;
 Mon, 15 Feb 2021 11:08:40 -0800 (PST)
MIME-Version: 1.0
References: <20210215111619.2385030-1-geert+renesas@glider.be>
 <CAJZ5v0ikVbMX0R9e_=wOxKfJX5X322AipmpWy-7wVnWE7Ogc9A@mail.gmail.com> <CAGETcx94nNjduOuYKVBZOC9Gm4yfyb9x92ddznyxK4BnDby4PA@mail.gmail.com>
In-Reply-To: <CAGETcx94nNjduOuYKVBZOC9Gm4yfyb9x92ddznyxK4BnDby4PA@mail.gmail.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Mon, 15 Feb 2021 20:08:29 +0100
Message-ID: <CAMuHMdWm9FiJHWTzGqqNa-ggt9WTpS6Hg2WthNW86p_WpvPUtw@mail.gmail.com>
Subject: Re: [PATCH] driver core: Fix double failed probing with fw_devlink=on
To:     Saravana Kannan <saravanak@google.com>
Cc:     "Rafael J. Wysocki" <rafael@kernel.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Saravana,

On Mon, Feb 15, 2021 at 7:27 PM Saravana Kannan <saravanak@google.com> wrote:
> On Mon, Feb 15, 2021 at 6:59 AM Rafael J. Wysocki <rafael@kernel.org> wrote:
> > On Mon, Feb 15, 2021 at 12:16 PM Geert Uytterhoeven
> > <geert+renesas@glider.be> wrote:
> > > With fw_devlink=permissive, devices are added to the deferred probe
> > > pending list if their driver's .probe() method returns -EPROBE_DEFER.
> > >
> > > With fw_devlink=on, devices are added to the deferred probe pending list
> > > if they are determined to be a consumer,
>
> If they are determined to be a consumer or if they are determined to
> have a supplier that hasn't probed yet?

When the supplier has probed:

    bus: 'platform': driver_probe_device: matched device
e6150000.clock-controller with driver renesas-cpg-mssr
    bus: 'platform': really_probe: probing driver renesas-cpg-mssr
with device e6150000.clock-controller
    PM: Added domain provider from /soc/clock-controller@e6150000
    driver: 'renesas-cpg-mssr': driver_bound: bound to device
'e6150000.clock-controller'
    platform e6055800.gpio: Added to deferred list
    [...]
    platform e6020000.watchdog: Added to deferred list
    [...]
    platform fe000000.pcie: Added to deferred list

> > > which happens before their
> > > driver's .probe() method is called.  If the actual probe fails later
> > > (real failure, not -EPROBE_DEFER), the device will still be on the
> > > deferred probe pending list, and it will be probed again when deferred
> > > probing kicks in, which is futile.
> > >
> > > Fix this by explicitly removing the device from the deferred probe
> > > pending list in case of probe failures.
> > >
> > > Fixes: e590474768f1cc04 ("driver core: Set fw_devlink=on by default")
> > > Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> >
> > Good catch:
> >
> > Reviewed-by: Rafael J. Wysocki <rafael.j.wysocki@intel.com>
>
> The issue is real and needs to be fixed. But I'm confused how this can
> happen. We won't even enter really_probe() if the driver isn't ready.
> We also won't get to run the driver's .probe() if the suppliers aren't
> ready. So how does the device get added to the deferred probe list
> before the driver is ready? Is this due to device_links_driver_bound()
> on the supplier?
>
> Can you give a more detailed step by step on the case you are hitting?

The device is added to the list due to device_links_driver_bound()
calling driver_deferred_probe_add() on all consumer devices.

> > > +++ b/drivers/base/dd.c
> > > @@ -639,11 +639,13 @@ static int really_probe(struct device *dev, struct device_driver *drv)
> > >         case -ENXIO:
> > >                 pr_debug("%s: probe of %s rejects match %d\n",
> > >                          drv->name, dev_name(dev), ret);
> > > +               driver_deferred_probe_del(dev);
> > >                 break;
> > >         default:
> > >                 /* driver matched but the probe failed */
> > >                 pr_warn("%s: probe of %s failed with error %d\n",
> > >                         drv->name, dev_name(dev), ret);
> > > +               driver_deferred_probe_del(dev);
> > >         }
> > >         /*
> > >          * Ignore errors returned by ->probe so that the next driver can try

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
