Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 698C92071E1
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 24 Jun 2020 13:13:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2390584AbgFXLNl (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 24 Jun 2020 07:13:41 -0400
Received: from mail-ot1-f67.google.com ([209.85.210.67]:44985 "EHLO
        mail-ot1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728656AbgFXLNl (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 24 Jun 2020 07:13:41 -0400
Received: by mail-ot1-f67.google.com with SMTP id e5so1501014ote.11;
        Wed, 24 Jun 2020 04:13:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=VGHbY4tRcC+HGQ6+hqB3IaCi6Xesr0JrCyLKajoL86A=;
        b=LzTLQ4EHFsXqK7dN/HeZQGeVflkELn7Pvu0NgEzJuHLnEmwGgRCCBLc7Gsd0NSNI4c
         nlNA/QmEQk7M7MlxCkPWPGp8Lk1qSlRc64UOTsQxb3tj/3w5JUmh5hQD7TpZqLNd5ILb
         Gd6JMeAs83swtwLpYVa0F7F7t42V75QC3ErtXYOH4PLJngQXrv1G5DlKo4dJsrGZD78N
         6ieKeDbDfGvYyaiDpTMyd8G/pL9znXs5DWy4qBAxmnmOmjhL1thWWZNiE7rpbYvqp5Ou
         xw5w3ajIjXb1RIJICFaw3stiSA18JegcZxlpeX9QUCoFbmUqcbeyPpryGUSissZytyl4
         ivFw==
X-Gm-Message-State: AOAM531W07DPbSl6tLWZUVJjJ1KW9XAXiTMEsXMsOP2QxF5v5ogLvZhW
        e+rgEoR1w9i/bZi3vFQoWxF5azOeXi8dXCT4iCk=
X-Google-Smtp-Source: ABdhPJzt56PzOmPRiUdhsI78I8Kqbjlq7j1oL/WY2YX+wBR8LDPTMsZF0eFLOsPi4AcdVLdl1E95crMmNyg0URw5X2A=
X-Received: by 2002:a9d:62c2:: with SMTP id z2mr21719012otk.145.1592997220346;
 Wed, 24 Jun 2020 04:13:40 -0700 (PDT)
MIME-Version: 1.0
References: <1592792699-24638-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
 <1592792699-24638-3-git-send-email-yoshihiro.shimoda.uh@renesas.com> <CAPDyKFq-dEPaU094hrk2xg18VpJAsbnf8enieFmcMhKiB1bW1A@mail.gmail.com>
In-Reply-To: <CAPDyKFq-dEPaU094hrk2xg18VpJAsbnf8enieFmcMhKiB1bW1A@mail.gmail.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Wed, 24 Jun 2020 13:13:29 +0200
Message-ID: <CAMuHMdXjU7N4oG89YsozGijMpjgKGN6ezw2qm6FeGX=JyRhsvg@mail.gmail.com>
Subject: Re: [PATCH v3 2/2] mmc: core: Call mmc_poweroff_nofity() if pm_suspend_via_firmware()
To:     Ulf Hansson <ulf.hansson@linaro.org>
Cc:     Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        Mark Rutland <mark.rutland@arm.com>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>,
        "linux-mmc@vger.kernel.org" <linux-mmc@vger.kernel.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Ulf,

On Wed, Jun 24, 2020 at 12:06 PM Ulf Hansson <ulf.hansson@linaro.org> wrote:
> On Mon, 22 Jun 2020 at 04:25, Yoshihiro Shimoda
> <yoshihiro.shimoda.uh@renesas.com> wrote:
> > If pm_suspend_via_firmware() returns true, the system will be able
> > to cut both vcc and vccq in the suspend. So, call
> > mmc_poweroff_nofity() if pm_suspend_via_firmware() returns true.
> >
> > Note that we should not update the MMC_CAP2_FULL_PWR_CYCLE caps
> > because the mmc_select_voltage() checks the caps when attaches
> > a mmc/sd.

> > --- a/drivers/mmc/core/mmc.c
> > +++ b/drivers/mmc/core/mmc.c
> > @@ -2038,7 +2039,8 @@ static int _mmc_suspend(struct mmc_host *host, bool is_suspend)
> >                 goto out;
> >
> >         if (mmc_can_poweroff_notify(host->card) &&
> > -               ((host->caps2 & MMC_CAP2_FULL_PWR_CYCLE) || !is_suspend))
> > +           ((host->caps2 & MMC_CAP2_FULL_PWR_CYCLE) || !is_suspend ||
> > +            pm_suspend_via_firmware()))
>
> Sorry, but this doesn't work.
>
> Even if PSCI is a generic FW interface, it doesn't mean that all PSCI
> implementations will cut the vcc and vccq for the MMC card at system
> suspend.

Indeed, there's nothing guaranteed here.  Nor documented how it should
behave.  Basically the firmware is free to power off the SoC. Or not do that.
"If firmware is involved, all odds are off".

> Instead, you need to decide this based on some specific DT property.
> Perhaps in conjunction with using pm_suspend_via_firmware().

Last time I was involved in a discussion about this, the PSCI people
didn't want to add any properties describing particular PSCI behavior...
"If firmware is involved, all odds are off".

So the only safe thing to do is to expect the worst, and prepare for it...

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
