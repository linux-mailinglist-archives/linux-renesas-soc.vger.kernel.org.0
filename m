Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1C2E030B987
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  2 Feb 2021 09:22:56 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229537AbhBBIVv (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 2 Feb 2021 03:21:51 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33026 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232557AbhBBIV2 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 2 Feb 2021 03:21:28 -0500
Received: from mail-yb1-xb2d.google.com (mail-yb1-xb2d.google.com [IPv6:2607:f8b0:4864:20::b2d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D930EC06174A
        for <linux-renesas-soc@vger.kernel.org>; Tue,  2 Feb 2021 00:20:47 -0800 (PST)
Received: by mail-yb1-xb2d.google.com with SMTP id i71so6083326ybg.7
        for <linux-renesas-soc@vger.kernel.org>; Tue, 02 Feb 2021 00:20:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=jnWY72rptLP2mi3bsf536ONY28gusJQRji0UXgomKro=;
        b=B4gFI+8TlnKMhqz6tbOVJryq3Znq5MIWuzHAOCEZO5GypiU4NOFut9T0tQ5pk5dXvq
         goh06hx7cQwhNY83q90CUXxRahn9Qh4FLftjcwKQnCN6iMUrJ/uZ8RkjFJfyg6Acb80z
         OWSxirqdbEjpVLZlXRXHCXJcQUiJynislup8VRliS+WV5Bhei2DeGuiSBAkMkkdD2WIg
         bHAItCeeqqR5VrITXjMvxRuKyLqn+KLgeil9OBMDJRVGLk7oeZ8popox74WskuLc2yNT
         bP9pafaCrVd7Z1SGTD9ez4UIPLVBex9CPA1OKFXjVDSHxPELdIPH0gj05zylnGUs77JX
         srHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=jnWY72rptLP2mi3bsf536ONY28gusJQRji0UXgomKro=;
        b=Lqn6/C8H7qH7eq1Lf0F/R8TMmqEMVJt1kv/hoMxRpPcx8FTd1/IY4HBS3NEYDTkWYM
         BT3iJXNzE8PNDHjy4lg87qR3rv7q0PXr771xuv38RCZ7XDZxvtggo3bxIVp3pbLsaRVn
         kX+lRnwlsYDd824YFyrs3S6y1kq9wGAw0Meq6YzLGL75MPc1DaU7RoyUabF8npkipyqo
         hor9ndELDgfQ8ulNsVTdeCU7amkFJ/FZyKtyKO/ffuoKqDMdgDDjFioOZkHiCsk9eGGk
         Azg5TZXH4i+dAP+JmSWCFGNAJp5P4U20PQkJW99sijcn8pkxy5w2pjq6ooFP6kDyiltp
         umgg==
X-Gm-Message-State: AOAM531LaxF5Da1FwgPUnVvT95hE+7aIzA4P7kFmh3ti6LxLHXueBGC/
        6NVyzw+KsJwe5vK0YagHa4+sGJarIZYEYfAUf4AllQ==
X-Google-Smtp-Source: ABdhPJyUafIkSuqqvECAV1VOlEitae42W6N7ZcUU85gX9a6HPyT7KNsD9A4o3TN8eGNhEnSU1WfBWlBxGagdxpVURF4=
X-Received: by 2002:a25:b74c:: with SMTP id e12mr21829597ybm.20.1612254046790;
 Tue, 02 Feb 2021 00:20:46 -0800 (PST)
MIME-Version: 1.0
References: <20210130040344.2807439-1-saravanak@google.com>
 <CAGETcx941J7Zhrf=ZjO6PW0fiax5VXcV3gbsLQfM_wU_U0EnYw@mail.gmail.com>
 <CAMuHMdUGkRmjnkSXQ4VNz5crMJ0S4xUvrV=BenOf96Y_bepPSw@mail.gmail.com>
 <CAGETcx896XEv8OqOe4eGncjOYb=v6+g1RWkpo5g0hTbfp4Os+w@mail.gmail.com> <CAMuHMdWo0Dpf_GwT1WrGk9f3v7-KX86eR2wgNtXkqoN0t_CLag@mail.gmail.com>
In-Reply-To: <CAMuHMdWo0Dpf_GwT1WrGk9f3v7-KX86eR2wgNtXkqoN0t_CLag@mail.gmail.com>
From:   Saravana Kannan <saravanak@google.com>
Date:   Tue, 2 Feb 2021 00:20:09 -0800
Message-ID: <CAGETcx9C3jM+6K3oYHooV6fKkj5OiBT6UnJpufH3w=zCmKLY8A@mail.gmail.com>
Subject: Re: [PATCH v1 0/2] Make fw_devlink=on more forgiving
To:     Geert Uytterhoeven <geert@linux-m68k.org>
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

On Mon, Feb 1, 2021 at 11:55 PM Geert Uytterhoeven <geert@linux-m68k.org> wrote:
>
> Hi Saravana,
>
> On Tue, Feb 2, 2021 at 4:01 AM Saravana Kannan <saravanak@google.com> wrote:
> > On Mon, Feb 1, 2021 at 2:40 AM Geert Uytterhoeven <geert@linux-m68k.org> wrote:
> > > On Sat, Jan 30, 2021 at 5:09 AM Saravana Kannan <saravanak@google.com> wrote:
> > > > On Fri, Jan 29, 2021 at 8:03 PM Saravana Kannan <saravanak@google.com> wrote:
> > > > > This patch series solves two general issues with fw_devlink=on
> > > > >
> > > > > Patch 1/2 addresses the issue of firmware nodes that look like they'll
> > > > > have struct devices created for them, but will never actually have
> > > > > struct devices added for them. For example, DT nodes with a compatible
> > > > > property that don't have devices added for them.
> > > > >
> > > > > Patch 2/2 address (for static kernels) the issue of optional suppliers
> > > > > that'll never have a driver registered for them. So, if the device could
> > > > > have probed with fw_devlink=permissive with a static kernel, this patch
> > > > > should allow those devices to probe with a fw_devlink=on. This doesn't
> > > > > solve it for the case where modules are enabled because there's no way
> > > > > to tell if a driver will never be registered or it's just about to be
> > > > > registered. I have some other ideas for that, but it'll have to come
> > > > > later thinking about it a bit.
> > > > >
> > > > > These two patches might remove the need for several other patches that
> > > > > went in as fixes for commit e590474768f1 ("driver core: Set
> > > > > fw_devlink=on by default"), but I think all those fixes are good
> > > > > changes. So I think we should leave those in.
> > > > >
> > > > > Marek, Geert,
> > > > >
> > > > > Can you try this series on a static kernel with your OF_POPULATED
> > > > > changes reverted? I just want to make sure these patches can identify
> > > > > and fix those cases.
> > > > >
> > > > > Tudor,
> > > > >
> > > > > You should still make the clock driver fix (because it's a bug), but I
> > > > > think this series will fix your issue too (even without the clock driver
> > > > > fix). Can you please give this a shot?
> > > >
> > > > Marek, Geert, Tudor,
> > > >
> > > > Forgot to say that this will probably fix your issues only in a static
> > > > kernel. So please try this with a static kernel. If you can also try
> > > > and confirm that this does not fix the issue for a modular kernel,
> > > > that'd be good too.
> > >
> > > Thanks for your series!
> > >
> > > For the modular case, this series has no impact, as expected (i.e. fails
> > > to boot, no I/O devices probed).
> > > With modules disabled, both r8a7791/koelsch and r8a77951/salvator-xs
> > > seem to boot fine, except for one issue on koelsch:
> >
> > Thanks a lot for testing the series!
> >
> > Regarding the koelsch issue, do you not see it with your OF_POPULATED
> > fix for rcar-sysc driver? But only see if you revert it and use this
> > series?
>
> I've just rechecked, and with fw_devlink=on, and my OF_POPULATED
> fir for rcar-sysc, i2c-demux-pinctrl works, both with modules enabled
> and disabled.

Thanks Geert! My guess is that with your OF_POPULATED changes the
"i2c-parents" of i2c-demux-pinctrl don't get probe deferred and
therefore i2c-demux-pinctrl probes after them and everything goes
well.

I guess that goes to show this series can't be the magic bullet even
with patch 2/3 -- especially for top level DT nodes that never have
devices created.

The other odd thing I noticed is that i2c-demux-pinctrl seems to
return -ENODEV when I think it should do -EPROBE_DEFER. In
i2c_demux_activate_master():

        ret = of_changeset_apply(&priv->chan[new_chan].chgset);
        if (ret)
                goto err;

        adap = of_find_i2c_adapter_by_node(priv->chan[new_chan].parent_np);
        if (!adap) {
                ret = -ENODEV;
                goto err_with_revert;
        }

If I understand the code correctly, it's assuming the selected parent
will probe successfully as soon as its status=ok change is done. Which
is not guaranteed for many reasons (driver not registered, async
probing, stuff like fw_devlink, etc).

Thanks,
Saravana
