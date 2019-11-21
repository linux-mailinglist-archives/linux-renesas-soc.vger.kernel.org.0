Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9C196105083
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 21 Nov 2019 11:30:08 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726014AbfKUKaI (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 21 Nov 2019 05:30:08 -0500
Received: from mail-vs1-f68.google.com ([209.85.217.68]:37295 "EHLO
        mail-vs1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726132AbfKUKaI (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 21 Nov 2019 05:30:08 -0500
Received: by mail-vs1-f68.google.com with SMTP id u6so1903089vsp.4
        for <linux-renesas-soc@vger.kernel.org>; Thu, 21 Nov 2019 02:30:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=6sZfvZyVgDlKuZ6qQVLHnrSCgxosTp/YXB5rWT4Y4uo=;
        b=rlXpc9AaqY4Iwgt8VbLOuKZeS871aJkmLEMkNxXhD/+348bi/VnGMp9wwGIBtZfoaI
         Kt+cADUpaCiG3O+djVmTaGF1tKftAIvsAtRy6oeyqLyJofku3VKOZL+//4UWCmKx9qQx
         HswEe+hBTfU0ZKA9hqP9ykVcSXWnwPhn2ySmSCa9W3tlPNTAAMVHwwnPkY+OtfR/ErZ/
         9LRsegXdb9R6AXK4xXTNW3T4EVjd5rRTjp2R//qEnDacE3VphVobkg8MY44oHsIxQS9X
         lsDsjhUPauXHqQcOSHy1j1pFCGSNQzm4ifIfVPlNbLGjs+7xbStxcjw0FnfMlpmMzmuA
         W+dg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=6sZfvZyVgDlKuZ6qQVLHnrSCgxosTp/YXB5rWT4Y4uo=;
        b=LuLv+ABdf1FFJDfKJrhbBUmL/PJc/kiT6RKHmykQdio4kQuJIuORA2BdlmvydGRQIn
         gcYVbS3akwAZsFIIpndEi5/klH/FgKy9f0RHt6fmQqEw+RrJp2Wj1Z6kPtuWAkKOltOZ
         J8QnD+N9bsWG172mnGCejVlM7ug9OH0QplKfhdjTSIL/XVskhOe7anrbPb3b3uKwdBAl
         QipbuE0t68yhoeeRiAvz1YahnwmWShB7ELWb+NBk6tORxpx9HjtENx5HFWAw/xsKFJb7
         kv35N/Dd6DIytfzp/QNMcU/sIXw0J8bGBOa9/gMpPEOC9YibalvWlv1JygyKqhE6+ycE
         hiBw==
X-Gm-Message-State: APjAAAWHV0M8peAcyLLJakE9REtuE/0EWJ6O+cw6jSXVz5YmSB45BJEP
        w1/cdgkwoIQCcYk3PT8K9BiL8jHVD8fphr8tilZWMw==
X-Google-Smtp-Source: APXvYqymQJZ5XXVmwTcwJpOQeeQ7dCEnOmeXB4WmXicqojBix0RpuZuFoH/1L+ZkWK0We4VaVhaXbq/I0MwSMVteKGs=
X-Received: by 2002:a67:fc04:: with SMTP id o4mr5187411vsq.35.1574332206526;
 Thu, 21 Nov 2019 02:30:06 -0800 (PST)
MIME-Version: 1.0
References: <20190917183652.7310-1-wsa+renesas@sang-engineering.com>
 <CAMuHMdVYYveVeF4+16vi8zk+0yVZMMJnMvKbLms7CbQ6w00uVg@mail.gmail.com>
 <20191119204725.GA1454@kunai> <CAMuHMdV+W62MkSRuYZNT0ezOt_KkyStfoeZohu7m1pOP=4a0HQ@mail.gmail.com>
 <20191121085702.GA1184@ninjato> <CAMuHMdVHN_wVuqFn3UcbFWxGPLxc5TfbMBRAWpptdt9M36JRHQ@mail.gmail.com>
In-Reply-To: <CAMuHMdVHN_wVuqFn3UcbFWxGPLxc5TfbMBRAWpptdt9M36JRHQ@mail.gmail.com>
From:   Ulf Hansson <ulf.hansson@linaro.org>
Date:   Thu, 21 Nov 2019 11:29:30 +0100
Message-ID: <CAPDyKFq0WySphCKJwJuxydiBJ+9ustV8=83cMKnCp0+aVZWF3A@mail.gmail.com>
Subject: Re: [PATCH] mmc: tmio: remove workaround for NON_REMOVABLE
To:     Geert Uytterhoeven <geert@linux-m68k.org>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Wolfram Sang <wsa@the-dreams.de>
Cc:     Linux MMC List <linux-mmc@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Geert, Wolfram

On Thu, 21 Nov 2019 at 10:35, Geert Uytterhoeven <geert@linux-m68k.org> wrote:
>
> Hi Wolfram,
>
> On Thu, Nov 21, 2019 at 9:57 AM Wolfram Sang <wsa@the-dreams.de> wrote:
> > > So some of my local code on top must have impacted the behavior.
> >
> > Any change in temperature? Niklas and I wonder if it is thermal related.
>
> Nope. I tried an old "known" good kernel again yesterday, and it worked.
> That was BTW the one which had the additional debug prints:
>
> --- a/drivers/base/power/domain.c
> +++ b/drivers/base/power/domain.c
> @@ -199,6 +199,7 @@ static struct generic_pm_domain
> *dev_to_genpd(struct device *dev)
>  static int genpd_stop_dev(const struct generic_pm_domain *genpd,
>                           struct device *dev)
>  {
> +pr_info("==== %s/%s: stop\n", genpd->name, dev_name(dev));
>         WARN(device_may_wakeup(dev),
>              "Domain %s must be active_wakeup for wakeup source %s\n",
>              genpd->name, dev_name(dev));
> @@ -208,6 +209,7 @@ static int genpd_stop_dev(const struct
> generic_pm_domain *genpd,
>  static int genpd_start_dev(const struct generic_pm_domain *genpd,
>                            struct device *dev)
>  {
> +pr_info("==== %s/%s: start\n", genpd->name, dev_name(dev));
>         return GENPD_DEV_CALLBACK(genpd, int, start, dev);
>  }
>
> Removing those prints made the old kernel fail, too, so this is why I think
> it is a race with Runtime PM.
>
> With a tree based on latest renesas-drivers, it happens regardless of those
> debug prints.
>
> > > > I am working on an issue where the SCC hangs, but this has to do with
> > > > always providing the SCC clock (SDnH). I don't really see the connection
> > > > of that to RuntimePM yet, though :/
> > >
> > > Makes sense: this is consistent with the behavior when accessing
> > > registers without enabling the corresponding module clock: it hangs.
> > > So this can happen with other clocks, too.
> > > One more reason not to delegate clock handling to a guest, as doing it
> > > wrong can take down the host, too...
> >
> > You mean when it comes to virtualization?
>
> Exactly.
>
> > > > Can you test this simple workaround patch instead of the revert just so
> > > > we get an idea if these issues are related?
> > >
> > > Thanks, applying your workaround on top of
> > > renesas-drivers-2019-11-19-v5.4-rc8 fixes the issue.
> >
> > Ok, good to know thanks for testing. Currently, I wonder why reverting
> > the NON_REMOVABLE workaround makes a difference. Maybe it is not
> > temperature related but a some race with RPM? I am debugging in this
> > direction now. But the lockup is still hard to trigger for me. Tried
> > v5.4-rc8 + NON_REMOVABLE patch with no luck. Will try renesas-drivers
> > next.
>
> As I managed to bisect it, it was fairly reproducible for me. Just checkout
> commit 7a7dab237027939c ("mmc: tmio: remove workaround for NON_REMOVABLE"),
> or use renesas-drivers.
>
> Oh, if it's a race, it may be affected by the compiler, too.
> gcc version 7.4.0 (Ubuntu/Linaro 7.4.0-1ubuntu1~18.04.1)
>
> > > This fix is part of renesas/topic/sdhi-manual-calib, right?
> >
> > Yes.
> >
> > > And thus has been present in some renesas-drivers release, but was
> > > dropped _before_ the 2019-10-15-v5.4-rc3 release.
> >
> > That would explain why it didn't show up before, right? And don't you
>
> Not exactly. That branch was dropped before Ulf reverted the
> NON_REMOVABLE workaround.
>
> > have a Ebisu in your board farm, too? Luckily, I have one, too, now. It
> > should be affected.
>
> Haven't seen the issue on Ebisu (yet?).
> To be sure, I have just retried again with the exact same kernel image
> and userland: m3n-salvator-xs hangs, ebisu boots fine (and I can read
> /dev/mmcblk2).
>
> But as it looks to be timing-related, and E3 has different/less CPU cores,
> it may still be affected.

A few comments around your runtime PM concerns, not sure if this
matters to you issues.

So, only by looking at the code for probing of the tmio variant
drivers, it seems like there are accesses (both reads and writes) for
the device being done, without first making sure that the clock
managed by the PM domain has been enabled. Is that really okay? Note,
this isn't a new thing, but it has been there as long as can remember.

For example, in renesas_sdhi_probe() there are calls made to
sd_ctrl_write16|read16() before calling tmio_mmc_host_probe().

Additionally in tmio_mmc_host_probe(), there are calls made to
sd_ctrl_write16|read16(), before calling pm_runtime_get_sync().

If you haven't noticed, we have also managed to replace the call with
pm_runtime_get_sync() with a call to dev_pm_domain_start(), to
simplify the code. The point is, these changes are queued via Rafael's
pm-tree for v5.5.

So, perhaps at this point we should simply drop the offending commit
and revisit this once v5.5-rc1 is out?

Kind regards
Uffe
