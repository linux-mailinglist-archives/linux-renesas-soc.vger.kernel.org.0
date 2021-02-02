Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 62DCD30B900
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  2 Feb 2021 08:56:32 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230073AbhBBHz5 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 2 Feb 2021 02:55:57 -0500
Received: from mail-ot1-f43.google.com ([209.85.210.43]:34444 "EHLO
        mail-ot1-f43.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229466AbhBBHzz (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 2 Feb 2021 02:55:55 -0500
Received: by mail-ot1-f43.google.com with SMTP id d5so3582843otc.1;
        Mon, 01 Feb 2021 23:55:39 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=y3W4ojETZRqcy6K2o7uqMnhqNcJkNWap/xwgIJK0V1g=;
        b=AFBPH7EQiW0gQMhBfpEUQHXoYTuF3Nn5zXH7Yf+/kh/Q4s1gs42CxBpKM4FNyEJ/Xx
         GXTINXBeL+daZCvx8wk/FR3Vq4rcA170fOdLGj1kLi7rZ82J1uP28CeZMFmcXgGo2bab
         Too/ybd66oJ6/ZezyveJQykNKPLsX7sxaKitu5pksThns5tUgFoptKr5pWCNKmQHGjH+
         JXA48QKFdm8GbV1rJ274cTZ0FULJjvDAK2kI7hDYt8ejqMHdnNlZ5BdtAmwtumfhVoZK
         b6KFN1H42DZfe4zgQxz19x+v+nFrKj3Yb5uogOo2DQuAopP+LwlPmIHRGIOjQvnbsjA1
         p0Jg==
X-Gm-Message-State: AOAM530XX4wr7mVarCyBuvvvrcQJiI5k0ICnVtX4bZVss//5/Dt46G6j
        z0yHsP15U8fROuvOd7rcLSX6nRbo+kcZ3xeh6hU=
X-Google-Smtp-Source: ABdhPJzuyQLJgOyFdbcv2aqIb+hOzlKKiF6Sn6VhjXREBWxj60HBybKJgAxIatRMC70329Bp2QDj6sQ6M4GuTtMDOaY=
X-Received: by 2002:a9d:3604:: with SMTP id w4mr6009142otb.107.1612252514252;
 Mon, 01 Feb 2021 23:55:14 -0800 (PST)
MIME-Version: 1.0
References: <20210130040344.2807439-1-saravanak@google.com>
 <CAGETcx941J7Zhrf=ZjO6PW0fiax5VXcV3gbsLQfM_wU_U0EnYw@mail.gmail.com>
 <CAMuHMdUGkRmjnkSXQ4VNz5crMJ0S4xUvrV=BenOf96Y_bepPSw@mail.gmail.com> <CAGETcx896XEv8OqOe4eGncjOYb=v6+g1RWkpo5g0hTbfp4Os+w@mail.gmail.com>
In-Reply-To: <CAGETcx896XEv8OqOe4eGncjOYb=v6+g1RWkpo5g0hTbfp4Os+w@mail.gmail.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Tue, 2 Feb 2021 08:55:02 +0100
Message-ID: <CAMuHMdWo0Dpf_GwT1WrGk9f3v7-KX86eR2wgNtXkqoN0t_CLag@mail.gmail.com>
Subject: Re: [PATCH v1 0/2] Make fw_devlink=on more forgiving
To:     Saravana Kannan <saravanak@google.com>
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Marek Szyprowski <m.szyprowski@samsung.com>,
        Marc Zyngier <maz@kernel.org>,
        Tudor Ambarus <Tudor.Ambarus@microchip.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        LKML <linux-kernel@vger.kernel.org>,
        Android Kernel Team <kernel-team@android.com>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Saravana,

On Tue, Feb 2, 2021 at 4:01 AM Saravana Kannan <saravanak@google.com> wrote:
> On Mon, Feb 1, 2021 at 2:40 AM Geert Uytterhoeven <geert@linux-m68k.org> wrote:
> > On Sat, Jan 30, 2021 at 5:09 AM Saravana Kannan <saravanak@google.com> wrote:
> > > On Fri, Jan 29, 2021 at 8:03 PM Saravana Kannan <saravanak@google.com> wrote:
> > > > This patch series solves two general issues with fw_devlink=on
> > > >
> > > > Patch 1/2 addresses the issue of firmware nodes that look like they'll
> > > > have struct devices created for them, but will never actually have
> > > > struct devices added for them. For example, DT nodes with a compatible
> > > > property that don't have devices added for them.
> > > >
> > > > Patch 2/2 address (for static kernels) the issue of optional suppliers
> > > > that'll never have a driver registered for them. So, if the device could
> > > > have probed with fw_devlink=permissive with a static kernel, this patch
> > > > should allow those devices to probe with a fw_devlink=on. This doesn't
> > > > solve it for the case where modules are enabled because there's no way
> > > > to tell if a driver will never be registered or it's just about to be
> > > > registered. I have some other ideas for that, but it'll have to come
> > > > later thinking about it a bit.
> > > >
> > > > These two patches might remove the need for several other patches that
> > > > went in as fixes for commit e590474768f1 ("driver core: Set
> > > > fw_devlink=on by default"), but I think all those fixes are good
> > > > changes. So I think we should leave those in.
> > > >
> > > > Marek, Geert,
> > > >
> > > > Can you try this series on a static kernel with your OF_POPULATED
> > > > changes reverted? I just want to make sure these patches can identify
> > > > and fix those cases.
> > > >
> > > > Tudor,
> > > >
> > > > You should still make the clock driver fix (because it's a bug), but I
> > > > think this series will fix your issue too (even without the clock driver
> > > > fix). Can you please give this a shot?
> > >
> > > Marek, Geert, Tudor,
> > >
> > > Forgot to say that this will probably fix your issues only in a static
> > > kernel. So please try this with a static kernel. If you can also try
> > > and confirm that this does not fix the issue for a modular kernel,
> > > that'd be good too.
> >
> > Thanks for your series!
> >
> > For the modular case, this series has no impact, as expected (i.e. fails
> > to boot, no I/O devices probed).
> > With modules disabled, both r8a7791/koelsch and r8a77951/salvator-xs
> > seem to boot fine, except for one issue on koelsch:
>
> Thanks a lot for testing the series!
>
> Regarding the koelsch issue, do you not see it with your OF_POPULATED
> fix for rcar-sysc driver? But only see if you revert it and use this
> series?

I've just rechecked, and with fw_devlink=on, and my OF_POPULATED
fir for rcar-sysc, i2c-demux-pinctrl works, both with modules enabled
and disabled.

> > dmesg:
> >
> >     +i2c-demux-pinctrl i2c-12: failed to setup demux-adapter 0 (-19)
> >     +i2c-demux-pinctrl i2c-13: failed to setup demux-adapter 0 (-19)
> >     +i2c-demux-pinctrl i2c-14: failed to setup demux-adapter 0 (-19)
> >
> >     -  #0: rsnd-dai.0-ak4642-hifi
> >     +  No soundcards found.
> >
> > regulator_summary:
> >
> >     -13-0050-vcc                   0    0mA     0mV     0mV
> >     -13-0039-dvdd-3v               1    0mA     0mV     0mV
> >     -13-0039-bgvdd                 1    0mA     0mV     0mV
> >     -13-0039-pvdd                  1    0mA     0mV     0mV
> >     -13-0039-dvdd                  1    0mA     0mV     0mV
> >     -13-0039-avdd                  1    0mA     0mV     0mV
> >
> > pm_genpd_summary:
> >
> >     -/devices/platform/soc/e6518000.i2c  suspended                  0
> >     -/devices/platform/soc/e6530000.i2c  suspended                  0
> >     -/devices/platform/soc/e6520000.i2c  suspended                  0
> >
> > These are all symptoms of the same issue: i2c buses and devices are not
> > probed, due to the use of the i2c demuxer.
> > I guess the fw_devlink tracker doesn't consider "i2c-parent" links?
>
> No, it doesn't parse "i2c-parent". Ugh... looked at it. It's going to
> be a problem to parse because it requires the parents to be disbled in
> DT and then fixes them up during run time. fw_devlink can handle DT
> overlay changing a specific node, but the problem is that the consumer
> DT node doesn't get changed. So the i2c-parent will first be parsed,
> fw_devlink will notice they are disabled, so it'll ignore them. Then
> those nodes are enabled, but the i2c-parent isn't reparsed because the
> consumer isn't updated.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
