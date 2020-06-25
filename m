Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F1282209BE0
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 25 Jun 2020 11:26:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2390143AbgFYJ00 convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 25 Jun 2020 05:26:26 -0400
Received: from mail-oi1-f195.google.com ([209.85.167.195]:41444 "EHLO
        mail-oi1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726149AbgFYJ00 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 25 Jun 2020 05:26:26 -0400
Received: by mail-oi1-f195.google.com with SMTP id a21so4365338oic.8;
        Thu, 25 Jun 2020 02:26:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=yjzuDu5iqeNsu8xsS5EjF8Gr+ffGuq2vYXMsQZ3k7jM=;
        b=t5r1W+kC9nS+TaTm1T6GoKesiKPG6wHWBa3urlMP2Wk5ej3xwKueRPVpEvMznSE1C8
         1dj2ne/+ypF24KAPqm05ZX+caR+PNr2FLFuPXmE0RSqF589iHjzCr6YsjeMgxm8QGyyx
         S0NLHObNlI54stIVoGyuT+mKt7NxCYXPwmIXZqtUEv1o+u6GxNyE45W9+ocMWsAD9esq
         j7d3qgTnn7oaMK/XV6/h3qxYmUsBma5GA0QZKibtwm8KiOUthLpR5ZFZYOTcltlDpfg5
         BWGHA315ckMAkqSINUp9By5e1MUOJsvvyIzeT4hImlp9PCw1XVa5kW8UkVRTK8ikAx/D
         uIDQ==
X-Gm-Message-State: AOAM530sP7mjd//Ylw9yurtMjjquLVT90WIhi29S6GeSxUkGJfoHM4n6
        V1fwXuNCXpJjtNM+u3crtis2qkpFObyz43NfQPs=
X-Google-Smtp-Source: ABdhPJwsgOEyHOyhQZQfhnuYyoD/aYDE50iovKEbQsMjIg8T4WNNLfeSIQT55JpX+5PPkCNy8BmSIizKd1H9+owNtRU=
X-Received: by 2002:a54:4006:: with SMTP id x6mr1352366oie.148.1593077185115;
 Thu, 25 Jun 2020 02:26:25 -0700 (PDT)
MIME-Version: 1.0
References: <1592792699-24638-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
 <1592792699-24638-3-git-send-email-yoshihiro.shimoda.uh@renesas.com>
 <CAPDyKFq-dEPaU094hrk2xg18VpJAsbnf8enieFmcMhKiB1bW1A@mail.gmail.com>
 <CAMuHMdXjU7N4oG89YsozGijMpjgKGN6ezw2qm6FeGX=JyRhsvg@mail.gmail.com> <TY2PR01MB36921A71A493ABD624A28C42D8920@TY2PR01MB3692.jpnprd01.prod.outlook.com>
In-Reply-To: <TY2PR01MB36921A71A493ABD624A28C42D8920@TY2PR01MB3692.jpnprd01.prod.outlook.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Thu, 25 Jun 2020 11:26:14 +0200
Message-ID: <CAMuHMdWLWBvZmHNqPFk2GW6XLnBx-sqfCo6d=B4iei88ONWX=w@mail.gmail.com>
Subject: Re: [PATCH v3 2/2] mmc: core: Call mmc_poweroff_nofity() if pm_suspend_via_firmware()
To:     Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Cc:     Ulf Hansson <ulf.hansson@linaro.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>,
        "linux-mmc@vger.kernel.org" <linux-mmc@vger.kernel.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        Mark Brown <broonie@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8BIT
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Shimoda-san,

CC broonie

On Thu, Jun 25, 2020 at 8:31 AM Yoshihiro Shimoda
<yoshihiro.shimoda.uh@renesas.com> wrote:
> > From: Geert Uytterhoeven, Sent: Wednesday, June 24, 2020 8:13 PM
> > On Wed, Jun 24, 2020 at 12:06 PM Ulf Hansson <ulf.hansson@linaro.org> wrote:
> > > On Mon, 22 Jun 2020 at 04:25, Yoshihiro Shimoda
> > > <yoshihiro.shimoda.uh@renesas.com> wrote:
> > > > If pm_suspend_via_firmware() returns true, the system will be able
> > > > to cut both vcc and vccq in the suspend. So, call
> > > > mmc_poweroff_nofity() if pm_suspend_via_firmware() returns true.
> > > >
> > > > Note that we should not update the MMC_CAP2_FULL_PWR_CYCLE caps
> > > > because the mmc_select_voltage() checks the caps when attaches
> > > > a mmc/sd.
> >
> > > > --- a/drivers/mmc/core/mmc.c
> > > > +++ b/drivers/mmc/core/mmc.c
> > > > @@ -2038,7 +2039,8 @@ static int _mmc_suspend(struct mmc_host *host, bool is_suspend)
> > > >                 goto out;
> > > >
> > > >         if (mmc_can_poweroff_notify(host->card) &&
> > > > -               ((host->caps2 & MMC_CAP2_FULL_PWR_CYCLE) || !is_suspend))
> > > > +           ((host->caps2 & MMC_CAP2_FULL_PWR_CYCLE) || !is_suspend ||
> > > > +            pm_suspend_via_firmware()))
> > >
> > > Sorry, but this doesn't work.
> > >
> > > Even if PSCI is a generic FW interface, it doesn't mean that all PSCI
> > > implementations will cut the vcc and vccq for the MMC card at system
> > > suspend.
> >
> > Indeed, there's nothing guaranteed here.  Nor documented how it should
> > behave.  Basically the firmware is free to power off the SoC. Or not do that.
> > "If firmware is involved, all odds are off".
>
> I thought we could be guaranteed. But, I understood we could not be guaranteed...
>
> > > Instead, you need to decide this based on some specific DT property.
> > > Perhaps in conjunction with using pm_suspend_via_firmware().
> >
> > Last time I was involved in a discussion about this, the PSCI people
> > didn't want to add any properties describing particular PSCI behavior...
> > "If firmware is involved, all odds are off".
> >
> > So the only safe thing to do is to expect the worst, and prepare for it...
>
> A headache point is an eMMC device consumes much power if that the system
> doesn't cut the vcc and vccq and doesn’t enter the sleep mode.
> In other words, in power consumption point of view, this patch will
> cause a regression in such a case...

Indeed.

> By the way, about adding specific DT property, the regulator can have
> regulator-off-in-suspend property in regulator-state-mem subnode.
> For now, we doesn't seem to get the property from a regulator consumer though.
> So, I'll try to add an API of regulator for it.

Oh right, the eMMC is described in DT as being connected to two
regulators.
Note that the semantics of regulator-off-in-suspend are that the
regulator should be disabled (by the regulator core) during suspend, not
that the regulator is disabled during suspend by a third party.
No idea if that will work with a fixed-regulator without GPIO control,
but of course you can try.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
