Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 77C4B1050DF
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 21 Nov 2019 11:52:37 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726351AbfKUKwg (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 21 Nov 2019 05:52:36 -0500
Received: from mail-oi1-f196.google.com ([209.85.167.196]:39626 "EHLO
        mail-oi1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726014AbfKUKwg (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 21 Nov 2019 05:52:36 -0500
Received: by mail-oi1-f196.google.com with SMTP id v138so2768804oif.6;
        Thu, 21 Nov 2019 02:52:35 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=zfmx5dABv7bdbBjebq8j9Qlud7KrWqgZWOvDU/9s5R4=;
        b=tO1pXKyJh8DGslcgytAJwYgmHr0PuCr9kMii83IWwwsL16b8WX2oq4NlbdPhVJbc+j
         YirVE8HnCIxj/7YE/uzYtQxf23vKjigSVruBVRrAcOJoxMcXg8uB5I9nk4HdbvZtceNo
         SjrtZ8Hht655Vdy383APZ/ERdyY22FIK4V9uYVsFZDraTgjmnh9tOrxQeLvnwYSgOqQF
         PJtQrfLPI1t6kCF5VtKbz95QLzAPjMNKDk26FtJ7LtmxmEaaGT9eoaxpxeahwj5X2pCs
         FmS7JEh6LsZ3o2fZwljwMC7btpwmxeHjyPqoHwO02Rb+1LItgMLD2P56J5VPEUfrbdZ0
         Zttg==
X-Gm-Message-State: APjAAAU0KhS8V710XPNKtDqm7yfeHru9zUzzf0Jxfnu6cCoelrsBaiFL
        NrT1xlZzF0jxRiI3V2CizEUgethJ0NVFsNePJx0f7GoG
X-Google-Smtp-Source: APXvYqwAHB7+Pu7KwfupTvDSi0VoDv6uES1gSu+w/Rq35Vb3ANeaXlwSAWEGU9bt2+Y8hYA1+ueOUpugjFhMA/5UMbs=
X-Received: by 2002:a05:6808:5d9:: with SMTP id d25mr7079229oij.54.1574333555331;
 Thu, 21 Nov 2019 02:52:35 -0800 (PST)
MIME-Version: 1.0
References: <20190917183652.7310-1-wsa+renesas@sang-engineering.com>
 <CAMuHMdVYYveVeF4+16vi8zk+0yVZMMJnMvKbLms7CbQ6w00uVg@mail.gmail.com>
 <20191119204725.GA1454@kunai> <CAMuHMdV+W62MkSRuYZNT0ezOt_KkyStfoeZohu7m1pOP=4a0HQ@mail.gmail.com>
 <20191121085702.GA1184@ninjato> <CAMuHMdVHN_wVuqFn3UcbFWxGPLxc5TfbMBRAWpptdt9M36JRHQ@mail.gmail.com>
 <CAPDyKFq0WySphCKJwJuxydiBJ+9ustV8=83cMKnCp0+aVZWF3A@mail.gmail.com>
In-Reply-To: <CAPDyKFq0WySphCKJwJuxydiBJ+9ustV8=83cMKnCp0+aVZWF3A@mail.gmail.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Thu, 21 Nov 2019 11:52:24 +0100
Message-ID: <CAMuHMdVD0jfq7b=s6oW42c7XC6orQbNSxQz3u9-JKEH+mL-zGA@mail.gmail.com>
Subject: Re: [PATCH] mmc: tmio: remove workaround for NON_REMOVABLE
To:     Ulf Hansson <ulf.hansson@linaro.org>
Cc:     Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Wolfram Sang <wsa@the-dreams.de>,
        Linux MMC List <linux-mmc@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Ulf,

On Thu, Nov 21, 2019 at 11:30 AM Ulf Hansson <ulf.hansson@linaro.org> wrote:
> On Thu, 21 Nov 2019 at 10:35, Geert Uytterhoeven <geert@linux-m68k.org> wrote:
> > On Thu, Nov 21, 2019 at 9:57 AM Wolfram Sang <wsa@the-dreams.de> wrote:
> > > > So some of my local code on top must have impacted the behavior.
> > >
> > > Any change in temperature? Niklas and I wonder if it is thermal related.
> >
> > Nope. I tried an old "known" good kernel again yesterday, and it worked.
> > That was BTW the one which had the additional debug prints:
> >
> > --- a/drivers/base/power/domain.c
> > +++ b/drivers/base/power/domain.c
> > @@ -199,6 +199,7 @@ static struct generic_pm_domain
> > *dev_to_genpd(struct device *dev)
> >  static int genpd_stop_dev(const struct generic_pm_domain *genpd,
> >                           struct device *dev)
> >  {
> > +pr_info("==== %s/%s: stop\n", genpd->name, dev_name(dev));
> >         WARN(device_may_wakeup(dev),
> >              "Domain %s must be active_wakeup for wakeup source %s\n",
> >              genpd->name, dev_name(dev));
> > @@ -208,6 +209,7 @@ static int genpd_stop_dev(const struct
> > generic_pm_domain *genpd,
> >  static int genpd_start_dev(const struct generic_pm_domain *genpd,
> >                            struct device *dev)
> >  {
> > +pr_info("==== %s/%s: start\n", genpd->name, dev_name(dev));
> >         return GENPD_DEV_CALLBACK(genpd, int, start, dev);
> >  }
> >
> > Removing those prints made the old kernel fail, too, so this is why I think
> > it is a race with Runtime PM.
> >
> > With a tree based on latest renesas-drivers, it happens regardless of those
> > debug prints.
> >
> > > > > I am working on an issue where the SCC hangs, but this has to do with
> > > > > always providing the SCC clock (SDnH). I don't really see the connection
> > > > > of that to RuntimePM yet, though :/

> A few comments around your runtime PM concerns, not sure if this
> matters to you issues.
>
> So, only by looking at the code for probing of the tmio variant
> drivers, it seems like there are accesses (both reads and writes) for
> the device being done, without first making sure that the clock
> managed by the PM domain has been enabled. Is that really okay? Note,
> this isn't a new thing, but it has been there as long as can remember.

No, that is not OK.
On R-Car Gen2, my debug code that disables all non-critical module
clocks during early boot should have caught them.
On R-Car Gen3, it's different, unfortunately, as apparently not all
module clocks can be disabled (protected by secure code?).
So my debug code has limited use on those platforms.

Note that the SCC seems to be clocked by a normal clock (SDnH), not by a
module clock, so it's not controlled by Runtime PM.
In fact, without "[PATCH] WIP: clk: renesas: rcar-gen3: enable SDnH clk
for HS modes", Linux doesn't enable it at all.

BTW, perhaps U-Boot leaves the SCC in a different state on R-Car E3
than on M3-N?

> For example, in renesas_sdhi_probe() there are calls made to
> sd_ctrl_write16|read16() before calling tmio_mmc_host_probe().
>
> Additionally in tmio_mmc_host_probe(), there are calls made to
> sd_ctrl_write16|read16(), before calling pm_runtime_get_sync().

Ugh.

> If you haven't noticed, we have also managed to replace the call with
> pm_runtime_get_sync() with a call to dev_pm_domain_start(), to
> simplify the code. The point is, these changes are queued via Rafael's
> pm-tree for v5.5.

Thanks, I hadn't noticed that.
I do have pm/linux-next in renesas-drivers, so that code has been exercised.

> So, perhaps at this point we should simply drop the offending commit
> and revisit this once v5.5-rc1 is out?

Yes, that looks like the best short-term solution.
Thanks!

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
