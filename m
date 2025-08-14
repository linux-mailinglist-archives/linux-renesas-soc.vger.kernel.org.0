Return-Path: <linux-renesas-soc+bounces-20535-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D070B26BAB
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 14 Aug 2025 17:57:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id BC7F35E1BC5
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 14 Aug 2025 15:50:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7FCB4233710;
	Thu, 14 Aug 2025 15:50:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="cskMR78W"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-yb1-f171.google.com (mail-yb1-f171.google.com [209.85.219.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7572B240611
	for <linux-renesas-soc@vger.kernel.org>; Thu, 14 Aug 2025 15:50:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755186628; cv=none; b=lGhmDXFWOcjR/JfRatgvPBEkNAM45mgTBlnQjmAu8r2BgFP39gIrXy4dun0Wr6qsxjaZW6NuBmqDPeuALe95eRqyYg+mhcRAhQIeQNB7jknS3W8FDy0gq+Mb+1Dtph5LclDAOzBGUwt3p1rabmL+1aAv6baIB5KqW78LnE+EE+8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755186628; c=relaxed/simple;
	bh=exEQSQ1zMctL93eMWFVlMD38hFz3MbFmZh5iUn+s2aQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=fH+FJRhhbO9avZxUEGF8UjAPCNg9WgA2USnRpm9pAkPNuxICqOQMas0gjlIf3j0gYiCPqksRgG7zFqWVGOPnPXXpp32KsK9OLo6BDWALP7uKCPTBpOjA7AhRqQ+HM1kGK/YZH02L3Nb+vMrFEunq3cRtillFNzqtdSiofAlTD4I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=cskMR78W; arc=none smtp.client-ip=209.85.219.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yb1-f171.google.com with SMTP id 3f1490d57ef6-e932c98433dso25358276.1
        for <linux-renesas-soc@vger.kernel.org>; Thu, 14 Aug 2025 08:50:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1755186625; x=1755791425; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=TcolRZoQB4ws+cuLwpFSDmMfaoDBVHgV4no7KK057D4=;
        b=cskMR78WHwIWMLSgu1P2KVGAIxw9XanMgARdKqib8/S/AcZAhz8eCUyUoTof6bTdym
         qUo5PwQJ2rdXC1ky88WvMd34NrWzWwZY8Fxya0c83QD1BNztXaP4IQjnA3cda9IGETY/
         0Xc6W2bdqILZYm1/6JHfuyCBsL/R5pnF4pPDzNdjujcxm9kZqUqfRsYpTaFSXVXxx7Ud
         lPlWwwzK5Tx5t6x7PrBz4qk8s1m0Y6g0LCzIozdILjqX+Me1kdfupZR1KjfYN1ZYLdrC
         25zhcj63CashofZL4gylMnpTLd0lXFZb3BskY2jdkTN9W6MD80VK0qT3kBU64A4FReDW
         fmPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755186625; x=1755791425;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=TcolRZoQB4ws+cuLwpFSDmMfaoDBVHgV4no7KK057D4=;
        b=Wy2a4wu99tEUtIZOYHwQXtKq9ldmy0tqSz2DZwjBU+O4saNEiUlrhPA7LqxsomjWBT
         w5k07LlugUzgRO8SLDyBSVEnP3S45HYaP2CM+cFszB9Oj3SAhKSVw4HYz9eau5nv+8qh
         8bfwTAuODBygsCaoWEjIHdZBfPhYZYh7wW/k1B4JuJ9LhFt6k8Lli0RhMBPvCzVTNtQn
         UycX2SpfTjBDYSxWb54Ew5FJkRk1Nx2h3pg+Lk3jNJNiyLBcctcQum4J32floFvzhi6v
         rrhXyzQCFvvh4Ap3Er19+PUQ+14H7m0svV6Fft2qIW964niOZcM4pF4Wd2tw9m0wLQtY
         OAjQ==
X-Forwarded-Encrypted: i=1; AJvYcCVQabK+IM5MkSmN6X3CxHSF4QUDabxOeNqjT1nhwhJhELv+cssmXW+8ODjMpdTPT3F2sUt531ZuOm2bXiaRwCT7MQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yx7yxFRO7T8o3LtmXhmURblneiOGW/GNfkB9zjwzvr6buynk2Pz
	e/1hUfnDSDnhw9qZeOkB+ydC5GlPNAtaiSfNy8tWCuXL98dg23U3gfsIYEGIJrchjoqv3Q1BiBM
	vbJEBE2FnRIsanw8KWe6JmbiR1FBAj+kcDq7+PhAp0Q==
X-Gm-Gg: ASbGncsPRShdln1oFJXaWlImVEv7uVH12Ycymjpu4m84uIb4LeOkAYrzWmdy1hkpaAa
	f3+UB4VccN/RJFjoCMdnnV5ZkvVF5/rKhZOOxPm2pucB1yWkdzSWTQetWD0qNgsdLH0OlFKwvQ0
	wWauJYDHy4XDeYm7FQluCcN53MuvnmWFIkvEJiB0n5JTMcai7+PCWYdRnmAChkenkR4tBqcA/Od
	dRcKGkJ
X-Google-Smtp-Source: AGHT+IEZdf3u9KWA9hpdME1MSo058HtmW98XBIg+BRTyD6KMN6/eMmlikus/YCW2MUTCFxGAEqaAwS1dA88OESJcat4=
X-Received: by 2002:a05:690c:7309:b0:71b:f500:70c2 with SMTP id
 00721157ae682-71d633f0da3mr47170887b3.6.1755186625067; Thu, 14 Aug 2025
 08:50:25 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250701114733.636510-1-ulf.hansson@linaro.org>
 <CAPDyKFr=u0u2ijczExkntHK1miWZ6hRrEWBMiyUwShS3m6c29g@mail.gmail.com>
 <CAMuHMdX1BacUfqtmV8g7NpRnY9aTdL=fh+jC7OryMLz4ijaOCg@mail.gmail.com>
 <CAPDyKFqANQZmGXd8ccA5qWiGrCor2N=W_7dmV+OK8hMd_+zmmw@mail.gmail.com>
 <CAMuHMdVrkr56XsRsbG7H-tLHVzmP+g-7=5Nrv9asC25ismwiYA@mail.gmail.com>
 <CAPDyKFq7z9e9hEC9QWiYcaU=t+Gs_GgRurmK-+cNYp4xkhr5Ow@mail.gmail.com> <CAMuHMdU7W+f3nZ_ckHOFsmmK6V9HzK0-fNtcu8kgjTSeU89AqQ@mail.gmail.com>
In-Reply-To: <CAMuHMdU7W+f3nZ_ckHOFsmmK6V9HzK0-fNtcu8kgjTSeU89AqQ@mail.gmail.com>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Thu, 14 Aug 2025 17:49:48 +0200
X-Gm-Features: Ac12FXw0d_08LwE0Kxq885y0aixo5HX1zNMPaf7I2LzMEd8jDbPPe6xvMDHaAUY
Message-ID: <CAPDyKFr-mVbGo62Wp+othcs+cWR6Wn9bz==ZB5hSpyKgkGtqHg@mail.gmail.com>
Subject: Re: [PATCH v3 00/24] pmdomain: Add generic ->sync_state() support to genpd
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Saravana Kannan <saravanak@google.com>, Stephen Boyd <sboyd@kernel.org>, linux-pm@vger.kernel.org, 
	"Rafael J . Wysocki" <rafael@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Michael Grzeschik <m.grzeschik@pengutronix.de>, Bjorn Andersson <andersson@kernel.org>, 
	Abel Vesa <abel.vesa@linaro.org>, Peng Fan <peng.fan@oss.nxp.com>, 
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>, Johan Hovold <johan@kernel.org>, 
	Maulik Shah <maulik.shah@oss.qualcomm.com>, Michal Simek <michal.simek@amd.com>, 
	Konrad Dybcio <konradybcio@kernel.org>, Thierry Reding <thierry.reding@gmail.com>, 
	Jonathan Hunter <jonathanh@nvidia.com>, Hiago De Franco <hiago.franco@toradex.com>, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"

On Wed, 13 Aug 2025 at 13:58, Geert Uytterhoeven <geert@linux-m68k.org> wrote:
>
> Hi Ulf,
>
> On Tue, 12 Aug 2025 at 12:01, Ulf Hansson <ulf.hansson@linaro.org> wrote:
> > On Thu, 7 Aug 2025 at 11:38, Geert Uytterhoeven <geert@linux-m68k.org> wrote:
> > > On Wed, 30 Jul 2025 at 12:29, Ulf Hansson <ulf.hansson@linaro.org> wrote:
> > > > On Wed, 30 Jul 2025 at 11:56, Geert Uytterhoeven <geert@linux-m68k.org> wrote:
> > > > > On Wed, 9 Jul 2025 at 13:31, Ulf Hansson <ulf.hansson@linaro.org> wrote:
> > > > > > On Tue, 1 Jul 2025 at 13:47, Ulf Hansson <ulf.hansson@linaro.org> wrote:
> > > > > > > Changes in v3:
> > > > > > >         - Added a couple of patches to adress problems on some Renesas
> > > > > > >         platforms. Thanks Geert and Tomi for helping out!
> > > > > > >         - Adressed a few comments from Saravanna and Konrad.
> > > > > > >         - Added some tested-by tags.
> > > > > >
> > > > > > I decided it was time to give this a try, so I have queued this up for
> > > > > > v6.17 via the next branch at my pmdomain tree.
> > > > > >
> > > > > > If you encounter any issues, please let me know so I can help to fix them.
> > > > >
> > > > > Thanks for your series!  Due to holidays, I only managed to test
> > > > > this very recently.
> > > > >
> > > > > Unfortunately I have an issue with unused PM Domains no longer being
> > > > > disabled on R-Car:
> > > > >   - On R-Car Gen1/2/3, using rcar-sysc.c, unused PM Domains are never
> > > > >     disabled.
> > > > >   - On R-Car Gen4, using rcar-gen4-sysc.c, unused PM Domains are
> > > > >     sometimes not disabled.
> > > > >     At first, I noticed the IOMMU driver was not enabled in my config,
> > > > >     and enabling it did fix the issue.  However, after that I still
> > > > >     encountered the issue in a different config that does have the
> > > > >     IOMMU driver enabled...
> > > > >
> > > > > FTR, unused PM Domains are still disabled correctly on R/SH-Mobile
> > > > > (using rmobile-sysc.c) and on BeagleBone Black. Note that these use
> > > > > of_genpd_add_provider_simple(), while all R-Car drivers use
> > > > > of_genpd_add_provider_onecell().  Perhaps there is an issue with
> > > > > the latter?  If you don't have a clue, I plan to do some more
> > > > > investigation later...
> > >
> > > of_genpd_add_provider_onecell() has:
> > >
> > >     if (!dev)
> > >             sync_state = true;
> > >     else
> > >             dev_set_drv_sync_state(dev, genpd_sync_state);
> > >
> > >     for (i = 0; i < data->num_domains; i++) {
> > >             ...
> > >             if (sync_state && !genpd_is_no_sync_state(genpd)) {
> > >                     genpd->sync_state = GENPD_SYNC_STATE_ONECELL;
> > >                     device_set_node(&genpd->dev, fwnode);
> > >                     sync_state = false;
> > >                     ^^^^^^^^^^^^^^^^^^^
> > >             }
> > >             ...
> > >     }
> > >
> > > As the R-Car SYSC drivers are not platform drivers, dev is NULL, and
> > > genpd->sync_state is set to GENPD_SYNC_STATE_ONECELL for the first PM
> > > Domain only.  All other domains have the default value of sync_state
> > > (0 = GENPD_SYNC_STATE_OFF).  Hence when genpd_provider_sync_state()
> > > is called later, it ignores all but the first domain.
> > > Apparently this is intentional, as of_genpd_sync_state() tries to
> > > power off all domains handled by the same controller anyway (see below)?
> >
> > Right, this is intentional and mainly because of how fw_devlink works.
> >
> > fw_devlink is limited to use only the first device - if multiple
> > devices share the same fwnode. In principle, we could have picked any
> > of the devices in the array of genpds here - and reached the same
> > result.
>
> OK, just like I already assumed...
>
> > > > > BTW, the "pending due to"-messages look weird to me.
> > > > > On R-Car M2-W (r8a7791.dtsi) I see e.g.:
> > > > >
> > > > >     genpd_provider ca15-cpu0: sync_state() pending due to e6020000.watchdog
> > > > >     renesas-cpg-mssr e6150000.clock-controller: sync_state() pending
> > > > > due to e6020000.watchdog
> > > > >
> > > > > ca15-cpu0 is the PM Domain holding the first CPU core, while
> > > > > the watchdog resides in the always-on Clock Domain, and uses the
> > > > > clock-controller for PM_CLK handling.
> > >
> > > Unfortunately the first PM Domain is "ca15-cpu0", which is blocked on
> > > these bogus pending states, and no PM Domain is powered off.
> >
> > I see, thanks for the details. I am looking closer at this.
> >
> > In any case, this is the main issue, as it prevents the ->sync_state()
> > callback to be called. Hence the "genpd->stay_on" will also *not* be
> > cleared for any of the genpd's for the genpd-provider.
>
> I was under the impression there is a time-out, after which the
> .sync_state() callback would be called anyway, just like for probe
> deferral due to missing optional providers like DMACs and IOMMUs.
> Apparently that is not the case?

The behaviour is configurable, so it depends. The current default
behaviour does *not* enforce the ->sync_state() callbacks to be
called, even after a time-out.

You may set CONFIG_FW_DEVLINK_SYNC_STATE_TIMEOUT to achieve the above
behavior or use the fw_devlink command line parameters to change it.
Like setting "fw_devlink.sync_state=timeout".

I guess it can be debated what the default behaviour should be.
Perhaps we should even allow the default behaviour to be dynamically
tweaked on a per provider device/driver basis?

>
> > > If I remove the "sync_state = false" above, genpd_provider_sync_state()
> > > considers all domains, and does power down all unused domains (even
> > > multiple times, as expected).
> >
> > I think those are getting called because with the change above, there
> > is no device_link being tracked. As stated above, fw_devlink is
> > limited to use only one device - if multiple devices share the same
> > fwnode.
>
> Indeed.
>
> > In other words, the ->sync_state() callbacks are called even if the
> > corresponding consumer devices have not been probed yet.
>
> Hence shouldn't there be a timeout, as the kernel may not even have
> a driver for one or more consumer devices?

See above.

>
> > > Upon closer look, all "pending due to" messages I see claim that the
> > > first (index 0) PM Domain is pending on some devices, while all of
> > > these devices are part of a different domain (usually the always-on
> > > domain, which is always the last (32 or 64) on R-Car).
> > >
> > > So I think there are two issues:
> > >   1. Devices are not attributed to the correct PM Domain using
> > >      fw_devlink sync_state,
> > >   2. One PM Domain of a multi-domain controller being blocked should
> > >      not block all other domains handled by the same controller.
> >
> > Right, that's a current limitation with fw_devlink. To cope with this,
> > it's possible to enforce the ->sync_state() callback to be invoked
> > from user-space (timeout or explicitly) for a device.
> >
> > Another option would be to allow an opt-out behavior for some genpd's
> > that are powered-on at initialization. Something along the lines of
> > the below.
> >
> > From: Ulf Hansson <ulf.hansson@linaro.org>
> > Date: Tue, 29 Jul 2025 14:27:22 +0200
> > Subject: [PATCH] pmdomain: core: Allow powered-on PM domains to be powered-off
> >  during boot
>
> [...]
>
> I gave this a try (i.e. "| GENPD_FLAG_NO_STAY_ON" in rcar-sysc.c), but
> this doesn't make any difference.  I assume this would only work when
> actively calling genpd_power_off() (i.e. not from of_genpd_sync_state()
> or genpd_provider_sync_state())?

Right. Thanks for testing!

So, we may need to restore some part of the genpd_power_off_unused()
when CONFIG_PM_GENERIC_DOMAINS_OF is set. Without clearing
"genpd->stay_on".

I can extend the patch, if you think it would make sense for you?

Kind regards
Uffe

