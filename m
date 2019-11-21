Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6B3FC104F5D
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 21 Nov 2019 10:35:49 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726968AbfKUJfh (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 21 Nov 2019 04:35:37 -0500
Received: from mail-ot1-f65.google.com ([209.85.210.65]:46201 "EHLO
        mail-ot1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726014AbfKUJfg (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 21 Nov 2019 04:35:36 -0500
Received: by mail-ot1-f65.google.com with SMTP id n23so2292875otr.13;
        Thu, 21 Nov 2019 01:35:36 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=FqJIwRXkY/ndk4ETuWOeddea6oKCI1oJRLGtnrA3lYY=;
        b=QJAxEN8UsHjUmZEhwO2LTVSwU+PpSyIxyry0hK9jg4FVpzE4DArMAJobYMjnmAMgPz
         VxuUJCRkbn2SkYmPPJq90yZeIIvDHdFenrm5nfNywXAoRMkg63scRkS0leC+4dTy7VVb
         2ZWm33t14g8PFWlR00xv/REE3c304zo58La9MUPGOP5JtXDbKXsfBsHUaog/2cX3RIxn
         WXQb7qVzNFPxKwsDQFS1iVVoxdK9/7zz9Oo28HFiCLL2ZkKUbmHwbdg6LcFjH/SnH+gw
         UA0Q4ENeTImZ9GtkV3QHZSo2/LqgGDDGfqSAxWJzPE5M5E8Yd6cMaqhnGMLfRWsBDEDO
         7pMg==
X-Gm-Message-State: APjAAAUbPAfH0TcgXIhj+oFzwgvkftiWNNiNFajySgLpgui70wDoN0FB
        rNkAxIeP/KmslpKhCGjAcCeDmcmTs3BxypyT3dp2VQcY
X-Google-Smtp-Source: APXvYqz7mnWB1KC/XF96Ggp4uYVE7dKJuKpR/pjYqlaxfDHJpzRzHVlV2vifs6tESHF2Qe9sVvKj7MIuyxJ6NwzJiMI=
X-Received: by 2002:a9d:5511:: with SMTP id l17mr5709465oth.145.1574328935531;
 Thu, 21 Nov 2019 01:35:35 -0800 (PST)
MIME-Version: 1.0
References: <20190917183652.7310-1-wsa+renesas@sang-engineering.com>
 <CAMuHMdVYYveVeF4+16vi8zk+0yVZMMJnMvKbLms7CbQ6w00uVg@mail.gmail.com>
 <20191119204725.GA1454@kunai> <CAMuHMdV+W62MkSRuYZNT0ezOt_KkyStfoeZohu7m1pOP=4a0HQ@mail.gmail.com>
 <20191121085702.GA1184@ninjato>
In-Reply-To: <20191121085702.GA1184@ninjato>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Thu, 21 Nov 2019 10:35:24 +0100
Message-ID: <CAMuHMdVHN_wVuqFn3UcbFWxGPLxc5TfbMBRAWpptdt9M36JRHQ@mail.gmail.com>
Subject: Re: [PATCH] mmc: tmio: remove workaround for NON_REMOVABLE
To:     Wolfram Sang <wsa@the-dreams.de>
Cc:     Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Linux MMC List <linux-mmc@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Wolfram,

On Thu, Nov 21, 2019 at 9:57 AM Wolfram Sang <wsa@the-dreams.de> wrote:
> > So some of my local code on top must have impacted the behavior.
>
> Any change in temperature? Niklas and I wonder if it is thermal related.

Nope. I tried an old "known" good kernel again yesterday, and it worked.
That was BTW the one which had the additional debug prints:

--- a/drivers/base/power/domain.c
+++ b/drivers/base/power/domain.c
@@ -199,6 +199,7 @@ static struct generic_pm_domain
*dev_to_genpd(struct device *dev)
 static int genpd_stop_dev(const struct generic_pm_domain *genpd,
                          struct device *dev)
 {
+pr_info("==== %s/%s: stop\n", genpd->name, dev_name(dev));
        WARN(device_may_wakeup(dev),
             "Domain %s must be active_wakeup for wakeup source %s\n",
             genpd->name, dev_name(dev));
@@ -208,6 +209,7 @@ static int genpd_stop_dev(const struct
generic_pm_domain *genpd,
 static int genpd_start_dev(const struct generic_pm_domain *genpd,
                           struct device *dev)
 {
+pr_info("==== %s/%s: start\n", genpd->name, dev_name(dev));
        return GENPD_DEV_CALLBACK(genpd, int, start, dev);
 }

Removing those prints made the old kernel fail, too, so this is why I think
it is a race with Runtime PM.

With a tree based on latest renesas-drivers, it happens regardless of those
debug prints.

> > > I am working on an issue where the SCC hangs, but this has to do with
> > > always providing the SCC clock (SDnH). I don't really see the connection
> > > of that to RuntimePM yet, though :/
> >
> > Makes sense: this is consistent with the behavior when accessing
> > registers without enabling the corresponding module clock: it hangs.
> > So this can happen with other clocks, too.
> > One more reason not to delegate clock handling to a guest, as doing it
> > wrong can take down the host, too...
>
> You mean when it comes to virtualization?

Exactly.

> > > Can you test this simple workaround patch instead of the revert just so
> > > we get an idea if these issues are related?
> >
> > Thanks, applying your workaround on top of
> > renesas-drivers-2019-11-19-v5.4-rc8 fixes the issue.
>
> Ok, good to know thanks for testing. Currently, I wonder why reverting
> the NON_REMOVABLE workaround makes a difference. Maybe it is not
> temperature related but a some race with RPM? I am debugging in this
> direction now. But the lockup is still hard to trigger for me. Tried
> v5.4-rc8 + NON_REMOVABLE patch with no luck. Will try renesas-drivers
> next.

As I managed to bisect it, it was fairly reproducible for me. Just checkout
commit 7a7dab237027939c ("mmc: tmio: remove workaround for NON_REMOVABLE"),
or use renesas-drivers.

Oh, if it's a race, it may be affected by the compiler, too.
gcc version 7.4.0 (Ubuntu/Linaro 7.4.0-1ubuntu1~18.04.1)

> > This fix is part of renesas/topic/sdhi-manual-calib, right?
>
> Yes.
>
> > And thus has been present in some renesas-drivers release, but was
> > dropped _before_ the 2019-10-15-v5.4-rc3 release.
>
> That would explain why it didn't show up before, right? And don't you

Not exactly. That branch was dropped before Ulf reverted the
NON_REMOVABLE workaround.

> have a Ebisu in your board farm, too? Luckily, I have one, too, now. It
> should be affected.

Haven't seen the issue on Ebisu (yet?).
To be sure, I have just retried again with the exact same kernel image
and userland: m3n-salvator-xs hangs, ebisu boots fine (and I can read
/dev/mmcblk2).

But as it looks to be timing-related, and E3 has different/less CPU cores,
it may still be affected.

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
