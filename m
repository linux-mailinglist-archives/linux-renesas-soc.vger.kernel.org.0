Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 315883BED55
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  7 Jul 2021 19:46:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230126AbhGGRsl (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 7 Jul 2021 13:48:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56544 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229519AbhGGRsl (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 7 Jul 2021 13:48:41 -0400
Received: from mail-yb1-xb2a.google.com (mail-yb1-xb2a.google.com [IPv6:2607:f8b0:4864:20::b2a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DF6EFC061574
        for <linux-renesas-soc@vger.kernel.org>; Wed,  7 Jul 2021 10:46:00 -0700 (PDT)
Received: by mail-yb1-xb2a.google.com with SMTP id a16so4416421ybt.8
        for <linux-renesas-soc@vger.kernel.org>; Wed, 07 Jul 2021 10:46:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=e8u4xPlHjWE3z1kPd6+no/nJC4zF/v0dweDYhSivEqc=;
        b=TSEoUqXjzQlZ1Tdwv7QhxMkGP9zH5n2C9gszCR0sWSXEiZ7R0Dp8hUweTqFEvZmG3n
         Ku2Ngd1rEAr27dfYNytr59XXAzhJlCXr1KOC7IdUj0VJgU2u3X5uyjtDFttcaHhQHHVc
         NmITJl4eQw0Rta8GApIvrL0hWBdKqImiu4b+iVo7OKI//SWMuk+mvwhnpAEZ7S8s5pfF
         WV7tcJfwxmf5LD6p8+95YJhVAY9fjTWM/ZcsYkmQFQWJBJXy93UKSMofoj5dWEJpE5HX
         +njNJV0Z97G4Or40cJK/kpAh0c9lFZkGhyX7lUCCGPgxBB8SgXSwZqmuEX1So8Q9kX/6
         NZLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=e8u4xPlHjWE3z1kPd6+no/nJC4zF/v0dweDYhSivEqc=;
        b=GaNQMkjcDvplunE47mBe2ElmZTmIT5ze9JBRWCi9Q1qzlv2+C7CQpvrjPDowNYjJsh
         QyaeJbOxLKKXmC77JT31WO3d0GsbHOhDNBMbLL2cGpvFSFMY9EutvaRJYsjlNlxBbZIx
         o5aMv7em27AmjKu4y8AwG8ZMkZc9WmumkJJvWLcr0cJR+oCS42joWgeMkjmCJ4ZYF5wt
         5F1//lk5xMelpXAQxzuXlFJzWSeNcYmqfHa1g1QkmdvlV5EVZqR/r5Y30VO6xAdHugcT
         cm+vse777pqWsSpHeqakljJGAnhOjqTX0kM6y7vgk6XlvGgDOZ+RfVjge2QxD1rt3hZR
         oimA==
X-Gm-Message-State: AOAM532+2tVoHXVf940zFqspoXphfA0XOwvtpIbOIzwXD5y7r3O+a0yB
        yMt34icwbvX2j1wBBc4OedWbH2NIyhYMwwczIz9iAY8g0hA=
X-Google-Smtp-Source: ABdhPJzmx/HlIIbVoAc8l6n7zgX7lerHnshEOCN2SPRgRxNaoFTKkGu2EyNFZmnE/3izjkwcRXMEBOehDCbokg1BvhY=
X-Received: by 2002:a25:b3c8:: with SMTP id x8mr33888178ybf.466.1625679959923;
 Wed, 07 Jul 2021 10:45:59 -0700 (PDT)
MIME-Version: 1.0
References: <20210215111619.2385030-1-geert+renesas@glider.be>
 <CAJZ5v0ikVbMX0R9e_=wOxKfJX5X322AipmpWy-7wVnWE7Ogc9A@mail.gmail.com>
 <CAGETcx94nNjduOuYKVBZOC9Gm4yfyb9x92ddznyxK4BnDby4PA@mail.gmail.com>
 <CAMuHMdWm9FiJHWTzGqqNa-ggt9WTpS6Hg2WthNW86p_WpvPUtw@mail.gmail.com>
 <CAGETcx8N5QmR5V_mrv5tHmARsnWrLbH+N_Ay_pBqV9HJkpHJzQ@mail.gmail.com>
 <CAGETcx8nD7Ak8z7JEM1jUVdRRpUt=8BwGMix0ghv1QeDBLaGwA@mail.gmail.com> <CAMuHMdX-cZO-tsj6T9av79d_bELihBfFGmB1=F+6YRNmUBWs9g@mail.gmail.com>
In-Reply-To: <CAMuHMdX-cZO-tsj6T9av79d_bELihBfFGmB1=F+6YRNmUBWs9g@mail.gmail.com>
From:   Saravana Kannan <saravanak@google.com>
Date:   Wed, 7 Jul 2021 10:45:24 -0700
Message-ID: <CAGETcx9JUqiA26-SdwCbnyj+w2FM648YmeJwMPZeX_5NCgdmfg@mail.gmail.com>
Subject: Re: [PATCH] driver core: Fix double failed probing with fw_devlink=on
To:     Geert Uytterhoeven <geert@linux-m68k.org>
Cc:     "Rafael J. Wysocki" <rafael@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Wed, Jul 7, 2021 at 1:43 AM Geert Uytterhoeven <geert@linux-m68k.org> wrote:
>
> Hi Saravana,
>
> (going over old patch I still have in my local tree)
>
> On Tue, Feb 16, 2021 at 6:08 PM Saravana Kannan <saravanak@google.com> wrote:
> > On Mon, Feb 15, 2021 at 12:59 PM Saravana Kannan <saravanak@google.com> wrote:
> > > On Mon, Feb 15, 2021 at 11:08 AM Geert Uytterhoeven
> > > <geert@linux-m68k.org> wrote:
> > > > On Mon, Feb 15, 2021 at 7:27 PM Saravana Kannan <saravanak@google.com> wrote:
> > > > > On Mon, Feb 15, 2021 at 6:59 AM Rafael J. Wysocki <rafael@kernel.org> wrote:
> > > > > > On Mon, Feb 15, 2021 at 12:16 PM Geert Uytterhoeven
> > > > > > <geert+renesas@glider.be> wrote:
> > > > > > > With fw_devlink=permissive, devices are added to the deferred probe
> > > > > > > pending list if their driver's .probe() method returns -EPROBE_DEFER.
> > > > > > >
> > > > > > > With fw_devlink=on, devices are added to the deferred probe pending list
> > > > > > > if they are determined to be a consumer,
> > > > >
> > > > > If they are determined to be a consumer or if they are determined to
> > > > > have a supplier that hasn't probed yet?
> > > >
> > > > When the supplier has probed:
> > > >
> > > >     bus: 'platform': driver_probe_device: matched device
> > > > e6150000.clock-controller with driver renesas-cpg-mssr
> > > >     bus: 'platform': really_probe: probing driver renesas-cpg-mssr
> > > > with device e6150000.clock-controller
> > > >     PM: Added domain provider from /soc/clock-controller@e6150000
> > > >     driver: 'renesas-cpg-mssr': driver_bound: bound to device
> > > > 'e6150000.clock-controller'
> > > >     platform e6055800.gpio: Added to deferred list
> > > >     [...]
> > > >     platform e6020000.watchdog: Added to deferred list
> > > >     [...]
> > > >     platform fe000000.pcie: Added to deferred list
> > > >
> > > > > > > which happens before their
> > > > > > > driver's .probe() method is called.  If the actual probe fails later
> > > > > > > (real failure, not -EPROBE_DEFER), the device will still be on the
> > > > > > > deferred probe pending list, and it will be probed again when deferred
> > > > > > > probing kicks in, which is futile.
> > > > > > >
> > > > > > > Fix this by explicitly removing the device from the deferred probe
> > > > > > > pending list in case of probe failures.
> > > > > > >
> > > > > > > Fixes: e590474768f1cc04 ("driver core: Set fw_devlink=on by default")
> > > > > > > Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> > > > > >
> > > > > > Good catch:
> > > > > >
> > > > > > Reviewed-by: Rafael J. Wysocki <rafael.j.wysocki@intel.com>
> > > > >
> > > > > The issue is real and needs to be fixed. But I'm confused how this can
> > > > > happen. We won't even enter really_probe() if the driver isn't ready.
> > > > > We also won't get to run the driver's .probe() if the suppliers aren't
> > > > > ready. So how does the device get added to the deferred probe list
> > > > > before the driver is ready? Is this due to device_links_driver_bound()
> > > > > on the supplier?
> > > > >
> > > > > Can you give a more detailed step by step on the case you are hitting?
> > > >
> > > > The device is added to the list due to device_links_driver_bound()
> > > > calling driver_deferred_probe_add() on all consumer devices.
> > >
> > > Thanks for the explanation. Maybe add more details like this to the
> > > commit text or in the code?
> > >
> > > For the code:
> > > Reviewed-by: Saravana Kanna <saravanak@google.com>
> >
> > Ugh... I just realized that I might have to give this a Nak because of
> > bad locking in deferred_probe_work_func(). The unlock/lock inside the
> > loop is a terrible hack. If we add this patch, we can end up modifying
> > a linked list while it's being traversed and cause a crash or busy
> > loop (you'll accidentally end up on an "empty list"). I ran into a
> > similar issue during one of my unrelated refactors.
>
> Turns out the issue I was seeing went away due to commit
> f2db85b64f0af141 ("driver core: Avoid pointless deferred probe
> attempts"), so there is no need to apply this patch.
>

Yay! That was the goal :) I'm assuming it wasn't ever applied.

-Saravana
