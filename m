Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B57AB215811
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  6 Jul 2020 15:11:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729154AbgGFNLW (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 6 Jul 2020 09:11:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43628 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729161AbgGFNLW (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 6 Jul 2020 09:11:22 -0400
Received: from mail-vk1-xa42.google.com (mail-vk1-xa42.google.com [IPv6:2607:f8b0:4864:20::a42])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CDC51C08C5DF
        for <linux-renesas-soc@vger.kernel.org>; Mon,  6 Jul 2020 06:11:21 -0700 (PDT)
Received: by mail-vk1-xa42.google.com with SMTP id b205so8265264vkb.8
        for <linux-renesas-soc@vger.kernel.org>; Mon, 06 Jul 2020 06:11:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=cZN3oqpT3mY3ZP7VHNBdr6oh1QqrYp8zTouB6uMREts=;
        b=RtSW4awI1ZlN0CzqzNb/Rb2hC+G04BKdDAgF4NPJSwqDNtrKHtyCFIIHKcueeQvxjv
         LHj7OZTvjIjb8aE/VTStBWUoziTGpONDVzGbLjCcfc7Ocl+OqeNUF0ZtCTPpg05Uue0S
         eK2S3Vv5e2lA/D7dpqCi0bsTJP3LN1HqCAtCfnkzx+jgwvbNIqI50YUHG2/zEPkjdaDx
         1W8qUgvsntoU2kiJ9dvhscxVxF2ECF/DCXG1vNiZeZgGZP8FgVmpH9Lwd7r9dDJ9urMk
         bN0C6I3HrC0uPuOvLkI53pBt+yoRSe6frYCUGswei8UCjLTDiRYlNfGOYcIrj+BKG1gC
         Pwlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=cZN3oqpT3mY3ZP7VHNBdr6oh1QqrYp8zTouB6uMREts=;
        b=KKSuZuLtc6lHM0ukyey4h/t/rHBJbiMRSG/8qweQiMhCyF8Qd7C5iAEhnRFJTAdZC4
         LetYyoT5iij9KIp9zzRfAffhEltZLgzkcvvoy7M8ZxeP0GFU2j0giA+I2KfY3qis4b3C
         Ivmiy54PYKqlwb2DLzIm2fhsr4v2XJJJtwZ1k8LX5/Pzm1dtnPR4tbBr7VgwzWxR+GVl
         KEFKogQSh5+4JAdgAVEXXYeaq6Ko0XgLWoQlrz85Kj+jWmc4ejv5xcJD8pF9+SxGYnEs
         WcwZZTeOcWUv2qgIUZxM+7DlwyeLXEuT1FMscaNFBQimhJ5clguH3dt21d1gK+FB4dAC
         47NQ==
X-Gm-Message-State: AOAM5300gNzt1RvHlHNYRiD0Xm+dbxDOUtb0De03jC2uvR7R0B4nKTbC
        fMErs0sttaw/4zWgSMazM1dGzLso2+IXa40dNBVhyw==
X-Google-Smtp-Source: ABdhPJxUbQ1E0UMKasKYQjpsQ9HHoO4n+rrne++3P661pD4zF68s3CGioejvyXzAGECoSxG0gfzv0j0f2zw8wFEF/uY=
X-Received: by 2002:a05:6122:32f:: with SMTP id d15mr3752572vko.101.1594041080810;
 Mon, 06 Jul 2020 06:11:20 -0700 (PDT)
MIME-Version: 1.0
References: <1592792699-24638-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
 <1592792699-24638-3-git-send-email-yoshihiro.shimoda.uh@renesas.com>
 <CAPDyKFq-dEPaU094hrk2xg18VpJAsbnf8enieFmcMhKiB1bW1A@mail.gmail.com>
 <CAMuHMdXjU7N4oG89YsozGijMpjgKGN6ezw2qm6FeGX=JyRhsvg@mail.gmail.com>
 <TY2PR01MB36921A71A493ABD624A28C42D8920@TY2PR01MB3692.jpnprd01.prod.outlook.com>
 <CAMuHMdWLWBvZmHNqPFk2GW6XLnBx-sqfCo6d=B4iei88ONWX=w@mail.gmail.com>
 <CAPDyKFpiBU1D+a7zb+Ggm0_HZ+YR4=LXJZ5MPytXtT=uBEdjPA@mail.gmail.com> <TY2PR01MB36927A37B98684B6C62E3473D86D0@TY2PR01MB3692.jpnprd01.prod.outlook.com>
In-Reply-To: <TY2PR01MB36927A37B98684B6C62E3473D86D0@TY2PR01MB3692.jpnprd01.prod.outlook.com>
From:   Ulf Hansson <ulf.hansson@linaro.org>
Date:   Mon, 6 Jul 2020 15:10:44 +0200
Message-ID: <CAPDyKFq-=L_nvKmwgmu-jDiUcdrJFC=pucsyU1sq3Yiw6B8eNw@mail.gmail.com>
Subject: Re: [PATCH v3 2/2] mmc: core: Call mmc_poweroff_nofity() if pm_suspend_via_firmware()
To:     Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Cc:     Mark Rutland <mark.rutland@arm.com>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>,
        "linux-mmc@vger.kernel.org" <linux-mmc@vger.kernel.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        Mark Brown <broonie@kernel.org>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        Rob Herring <robh+dt@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Thu, 2 Jul 2020 at 14:37, Yoshihiro Shimoda
<yoshihiro.shimoda.uh@renesas.com> wrote:
>
> Hi Ulf,
>
> > From: Ulf Hansson, Sent: Friday, June 26, 2020 8:03 PM
> >
> > + Rob
> >
> > On Thu, 25 Jun 2020 at 11:26, Geert Uytterhoeven <geert@linux-m68k.org>=
 wrote:
> > >
> > > Hi Shimoda-san,
> > >
> > > CC broonie
> > >
> > > On Thu, Jun 25, 2020 at 8:31 AM Yoshihiro Shimoda
> > > <yoshihiro.shimoda.uh@renesas.com> wrote:
> > > > > From: Geert Uytterhoeven, Sent: Wednesday, June 24, 2020 8:13 PM
> > > > > On Wed, Jun 24, 2020 at 12:06 PM Ulf Hansson <ulf.hansson@linaro.=
org> wrote:
> > > > > > On Mon, 22 Jun 2020 at 04:25, Yoshihiro Shimoda
> > > > > > <yoshihiro.shimoda.uh@renesas.com> wrote:
> > > > > > > If pm_suspend_via_firmware() returns true, the system will be=
 able
> > > > > > > to cut both vcc and vccq in the suspend. So, call
> > > > > > > mmc_poweroff_nofity() if pm_suspend_via_firmware() returns tr=
ue.
> > > > > > >
> > > > > > > Note that we should not update the MMC_CAP2_FULL_PWR_CYCLE ca=
ps
> > > > > > > because the mmc_select_voltage() checks the caps when attache=
s
> > > > > > > a mmc/sd.
> > > > >
> > > > > > > --- a/drivers/mmc/core/mmc.c
> > > > > > > +++ b/drivers/mmc/core/mmc.c
> > > > > > > @@ -2038,7 +2039,8 @@ static int _mmc_suspend(struct mmc_host=
 *host, bool is_suspend)
> > > > > > >                 goto out;
> > > > > > >
> > > > > > >         if (mmc_can_poweroff_notify(host->card) &&
> > > > > > > -               ((host->caps2 & MMC_CAP2_FULL_PWR_CYCLE) || !=
is_suspend))
> > > > > > > +           ((host->caps2 & MMC_CAP2_FULL_PWR_CYCLE) || !is_s=
uspend ||
> > > > > > > +            pm_suspend_via_firmware()))
> > > > > >
> > > > > > Sorry, but this doesn't work.
> > > > > >
> > > > > > Even if PSCI is a generic FW interface, it doesn't mean that al=
l PSCI
> > > > > > implementations will cut the vcc and vccq for the MMC card at s=
ystem
> > > > > > suspend.
> > > > >
> > > > > Indeed, there's nothing guaranteed here.  Nor documented how it s=
hould
> > > > > behave.  Basically the firmware is free to power off the SoC. Or =
not do that.
> > > > > "If firmware is involved, all odds are off".
> > > >
> > > > I thought we could be guaranteed. But, I understood we could not be=
 guaranteed...
> > > >
> > > > > > Instead, you need to decide this based on some specific DT prop=
erty.
> > > > > > Perhaps in conjunction with using pm_suspend_via_firmware().
> > > > >
> > > > > Last time I was involved in a discussion about this, the PSCI peo=
ple
> > > > > didn't want to add any properties describing particular PSCI beha=
vior...
> > > > > "If firmware is involved, all odds are off".
> > > > >
> > > > > So the only safe thing to do is to expect the worst, and prepare =
for it...
> > > >
> > > > A headache point is an eMMC device consumes much power if that the =
system
> > > > doesn't cut the vcc and vccq and doesn=E2=80=99t enter the sleep mo=
de.
> > > > In other words, in power consumption point of view, this patch will
> > > > cause a regression in such a case...
> > >
> > > Indeed.
> > >
> > > > By the way, about adding specific DT property, the regulator can ha=
ve
> > > > regulator-off-in-suspend property in regulator-state-mem subnode.
> > > > For now, we doesn't seem to get the property from a regulator consu=
mer though.
> > > > So, I'll try to add an API of regulator for it.
> > >
> > > Oh right, the eMMC is described in DT as being connected to two
> > > regulators.
> > > Note that the semantics of regulator-off-in-suspend are that the
> > > regulator should be disabled (by the regulator core) during suspend, =
not
> > > that the regulator is disabled during suspend by a third party.
> > > No idea if that will work with a fixed-regulator without GPIO control=
,
> > > but of course you can try.
>
> As other email thread of this trial as v4, I could not get approval [1].
>
> [1]
> https://lore.kernel.org/linux-renesas-soc/CAMuHMdX93Q9WhKLqv_wNPzArbc68Nc=
bVN8jJ9MDKxAcicpBQ5Q@mail.gmail.com/T/#m70883cc5de4fa7fca50118dad743c836d5e=
3b451
>
> > For mmc we already have a DT property, "full-pwr-cycle". Which tells
> > whether the host is able to completely power-cycle the card (some
> > host's manage power internally).
> >
> > However, maybe the proper thing here would be to add a property of
> > regulator instead.
>
> My v4 patch was using a regulator property. But since I could not get
> approval, we could not use this way, I think.
>
> > If that doesn't make sense, I am also open to add a
> > new MMC property, "full-pwr-cycle-in-suspend".
>
> I thought this way was better. However, I'm wondering if adding such a ne=
w MMC
> property to issue Power Off Notification in mmc_suspend() is really bette=
r
> than the current implementation. This is because we don't have any comple=
tely
> solutions now:
>  - Depend on board configuration (The board doesn't have "full-pwr-cycle"=
).
>  - Depend on firmware on board [2]. So, even if adding a new MMC property=
,
>    it cannot sync the firmware condition. In fact, this is possible to
>    cause regression in power consumption point of view [3].

This is a generic problem with FWs.

I guess one could try to update the DTB using DT overlays, in case
some FW version changes.

>  - My environment (PSCI which is one of firmware) doesn't support
>    any ability to sync between the firmware and OS for now [4].

Yes, I see.

It seems like Geert has tried different approaches to convince PSCI
folkz, to find a solution for this, but it seems like none have make
it yet.

>
> But, what do you think?

From the mmc DT property point of view, I am fine adding a
"full-pwr-cycle-in-suspend" - and then also update the mmc core's
behavior to use the eMMC power-off-notify command at system suspend.

However, I don't have a strong opinion, as the current solution with
the eMMC sleep command also seems to work.

My main concern with the current approach though, is not about wasting
energy, but rather that we are not doing a graceful shutdown of the
eMMC device. Instead we just cut VCCQ while the eMMC is "sleeping",
which in worst case could lead to internal data corruptions, but also
increased re-initialization time at system suspend.

>
> [2]
> https://lore.kernel.org/linux-renesas-soc/1592792699-24638-1-git-send-ema=
il-yoshihiro.shimoda.uh@renesas.com/T/#mde38d5866b7f3edc9a2ed105ac06b4fda4c=
3e99e
>
> [3]
> https://lore.kernel.org/linux-renesas-soc/1592792699-24638-1-git-send-ema=
il-yoshihiro.shimoda.uh@renesas.com/T/#mf8e7abdf135586ba0b70a1c235410a6f94c=
6007d
>
> [4]
> https://lore.kernel.org/linux-renesas-soc/CAMuHMdX93Q9WhKLqv_wNPzArbc68Nc=
bVN8jJ9MDKxAcicpBQ5Q@mail.gmail.com/T/#m442a2ce972cfdb3ff33637c120c8d096e4d=
07af8
>

Kind regards
Uffe
