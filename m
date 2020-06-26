Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C27DB20B02B
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 26 Jun 2020 13:03:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728307AbgFZLD4 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 26 Jun 2020 07:03:56 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39868 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728303AbgFZLD4 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 26 Jun 2020 07:03:56 -0400
Received: from mail-vs1-xe41.google.com (mail-vs1-xe41.google.com [IPv6:2607:f8b0:4864:20::e41])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4E7F5C08C5DB
        for <linux-renesas-soc@vger.kernel.org>; Fri, 26 Jun 2020 04:03:56 -0700 (PDT)
Received: by mail-vs1-xe41.google.com with SMTP id m62so5277854vsd.4
        for <linux-renesas-soc@vger.kernel.org>; Fri, 26 Jun 2020 04:03:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=pEzsuEd/aCvcZyu1S5Yn11Om7ZgSkL9Q9ICeH90WCD0=;
        b=YgzFPq42CDSJqG+7tbfP7dKxmJCMMyhnTVdP451IYkwUznSwujwJcjXa2C2cAXPJTl
         pe7lM9GtVkqrCEk2UhPOAeiCwGbeBj/AxqsixmDqVjkitFIUkBKl0Z7x/wenE14rl12a
         YYIETi+4mmBcFMwBp6IcCokuMtS/DVIjqSbR466EYytkoUHjkt6Tj68sgtYAassQn7Nk
         QAL/q0CFCROZTKXDqR5FUVbTgIi8fAP3+BivSQ52rz5b3ZAMJDk+Pbf5QVcQwabpguGo
         bWfRn3prB/pFDLJkYqiTYCn2zqfBgAR9CatFimW++ARNm/6jZzC+RtUWf3ho2udgOReQ
         Kc4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=pEzsuEd/aCvcZyu1S5Yn11Om7ZgSkL9Q9ICeH90WCD0=;
        b=mPHVSSmIwiiWhSaUTZ7VhBRTKxnAI6PdpyXiYyik8Su5Sbb+pX7wiGJRYiYQgnqbrm
         mqQr1rn5dmAqGGXm+5GClmRaAv45tXKTK1LTQs8HiJg4TuB2trkPrvgsjs7h+bE088E3
         +6nci91hgwbDQNoYTMjot2V160reUv64TCpccv1bjAk7yn1vVHVsyhOFvMYsO4b1VufO
         7OxjQ9aJjm8lxhs1HMUiMh7OV/Z2EgQCi+FxRS4OwCachr+EUx7P3u6eT82XP/jSCPgE
         EkNdpSqs5mJd7c7wZVm1mm0f1I+6niwaAXaAhDylUz7ySfx3NWWC8ugRY/VSgQaY5jbo
         isOA==
X-Gm-Message-State: AOAM531i2NM/dS4GFiai6Uay6lec1EznIjYuLw0c2YMWhxAo2I1jvWrJ
        i++vUfjp/DOyFXtgeAm/Kb+N+ReUhijElqpfRyBeUA==
X-Google-Smtp-Source: ABdhPJwQgp+LNgbMVdLT4VTwXdt8Qyr2taE7VIICnj75uGBC73I2WDL2Eek6hrilrThKi50H76GYoNNtn5F2Wlb2N1Y=
X-Received: by 2002:a67:db88:: with SMTP id f8mr1892578vsk.165.1593169435316;
 Fri, 26 Jun 2020 04:03:55 -0700 (PDT)
MIME-Version: 1.0
References: <1592792699-24638-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
 <1592792699-24638-3-git-send-email-yoshihiro.shimoda.uh@renesas.com>
 <CAPDyKFq-dEPaU094hrk2xg18VpJAsbnf8enieFmcMhKiB1bW1A@mail.gmail.com>
 <CAMuHMdXjU7N4oG89YsozGijMpjgKGN6ezw2qm6FeGX=JyRhsvg@mail.gmail.com>
 <TY2PR01MB36921A71A493ABD624A28C42D8920@TY2PR01MB3692.jpnprd01.prod.outlook.com>
 <CAMuHMdWLWBvZmHNqPFk2GW6XLnBx-sqfCo6d=B4iei88ONWX=w@mail.gmail.com>
In-Reply-To: <CAMuHMdWLWBvZmHNqPFk2GW6XLnBx-sqfCo6d=B4iei88ONWX=w@mail.gmail.com>
From:   Ulf Hansson <ulf.hansson@linaro.org>
Date:   Fri, 26 Jun 2020 13:03:19 +0200
Message-ID: <CAPDyKFpiBU1D+a7zb+Ggm0_HZ+YR4=LXJZ5MPytXtT=uBEdjPA@mail.gmail.com>
Subject: Re: [PATCH v3 2/2] mmc: core: Call mmc_poweroff_nofity() if pm_suspend_via_firmware()
To:     Geert Uytterhoeven <geert@linux-m68k.org>,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        Rob Herring <robh+dt@kernel.org>
Cc:     Mark Rutland <mark.rutland@arm.com>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>,
        "linux-mmc@vger.kernel.org" <linux-mmc@vger.kernel.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        Mark Brown <broonie@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

+ Rob

On Thu, 25 Jun 2020 at 11:26, Geert Uytterhoeven <geert@linux-m68k.org> wro=
te:
>
> Hi Shimoda-san,
>
> CC broonie
>
> On Thu, Jun 25, 2020 at 8:31 AM Yoshihiro Shimoda
> <yoshihiro.shimoda.uh@renesas.com> wrote:
> > > From: Geert Uytterhoeven, Sent: Wednesday, June 24, 2020 8:13 PM
> > > On Wed, Jun 24, 2020 at 12:06 PM Ulf Hansson <ulf.hansson@linaro.org>=
 wrote:
> > > > On Mon, 22 Jun 2020 at 04:25, Yoshihiro Shimoda
> > > > <yoshihiro.shimoda.uh@renesas.com> wrote:
> > > > > If pm_suspend_via_firmware() returns true, the system will be abl=
e
> > > > > to cut both vcc and vccq in the suspend. So, call
> > > > > mmc_poweroff_nofity() if pm_suspend_via_firmware() returns true.
> > > > >
> > > > > Note that we should not update the MMC_CAP2_FULL_PWR_CYCLE caps
> > > > > because the mmc_select_voltage() checks the caps when attaches
> > > > > a mmc/sd.
> > >
> > > > > --- a/drivers/mmc/core/mmc.c
> > > > > +++ b/drivers/mmc/core/mmc.c
> > > > > @@ -2038,7 +2039,8 @@ static int _mmc_suspend(struct mmc_host *ho=
st, bool is_suspend)
> > > > >                 goto out;
> > > > >
> > > > >         if (mmc_can_poweroff_notify(host->card) &&
> > > > > -               ((host->caps2 & MMC_CAP2_FULL_PWR_CYCLE) || !is_s=
uspend))
> > > > > +           ((host->caps2 & MMC_CAP2_FULL_PWR_CYCLE) || !is_suspe=
nd ||
> > > > > +            pm_suspend_via_firmware()))
> > > >
> > > > Sorry, but this doesn't work.
> > > >
> > > > Even if PSCI is a generic FW interface, it doesn't mean that all PS=
CI
> > > > implementations will cut the vcc and vccq for the MMC card at syste=
m
> > > > suspend.
> > >
> > > Indeed, there's nothing guaranteed here.  Nor documented how it shoul=
d
> > > behave.  Basically the firmware is free to power off the SoC. Or not =
do that.
> > > "If firmware is involved, all odds are off".
> >
> > I thought we could be guaranteed. But, I understood we could not be gua=
ranteed...
> >
> > > > Instead, you need to decide this based on some specific DT property=
.
> > > > Perhaps in conjunction with using pm_suspend_via_firmware().
> > >
> > > Last time I was involved in a discussion about this, the PSCI people
> > > didn't want to add any properties describing particular PSCI behavior=
...
> > > "If firmware is involved, all odds are off".
> > >
> > > So the only safe thing to do is to expect the worst, and prepare for =
it...
> >
> > A headache point is an eMMC device consumes much power if that the syst=
em
> > doesn't cut the vcc and vccq and doesn=E2=80=99t enter the sleep mode.
> > In other words, in power consumption point of view, this patch will
> > cause a regression in such a case...
>
> Indeed.
>
> > By the way, about adding specific DT property, the regulator can have
> > regulator-off-in-suspend property in regulator-state-mem subnode.
> > For now, we doesn't seem to get the property from a regulator consumer =
though.
> > So, I'll try to add an API of regulator for it.
>
> Oh right, the eMMC is described in DT as being connected to two
> regulators.
> Note that the semantics of regulator-off-in-suspend are that the
> regulator should be disabled (by the regulator core) during suspend, not
> that the regulator is disabled during suspend by a third party.
> No idea if that will work with a fixed-regulator without GPIO control,
> but of course you can try.

For mmc we already have a DT property, "full-pwr-cycle". Which tells
whether the host is able to completely power-cycle the card (some
host's manage power internally).

However, maybe the proper thing here would be to add a property of
regulator instead. If that doesn't make sense, I am also open to add a
new MMC property, "full-pwr-cycle-in-suspend".

Kind regards
Uffe
