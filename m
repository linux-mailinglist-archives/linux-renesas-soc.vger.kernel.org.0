Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7060F2FD716
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 20 Jan 2021 18:33:47 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732208AbhATRc7 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 20 Jan 2021 12:32:59 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34126 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726046AbhATRXz (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 20 Jan 2021 12:23:55 -0500
Received: from mail-yb1-xb36.google.com (mail-yb1-xb36.google.com [IPv6:2607:f8b0:4864:20::b36])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2ED76C0613C1
        for <linux-renesas-soc@vger.kernel.org>; Wed, 20 Jan 2021 09:23:15 -0800 (PST)
Received: by mail-yb1-xb36.google.com with SMTP id x6so20198830ybr.1
        for <linux-renesas-soc@vger.kernel.org>; Wed, 20 Jan 2021 09:23:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=oNx8zfmJ6aCV/l/wFtzedIlPmvsdlC12Abrufb0b2mI=;
        b=R4LPJkuu8pMI2nfXzhLEmgQvHEQaC+kZYweT/rQXz/w9OFb7s2t4sVFYv9faeCSVOs
         KWnYqgEr4y7+ZlP0Eo1V+L1LuGj6I4pXiWStg2GPpKCRNAqHvmB7+pOo8dYE+lryGv2Y
         Uo3ji8cDM3OToF7snZrTwjLYZv34J4yV9gui2bPFnLvIBqOVYo+5TVK6SkgELLJTE+H9
         7fwz48ui+6pH/LH99bBPXKY02SR9JAN0S/3qslusyva/HSi5NMtETUBzLxL3VflHmVe5
         dhu1bk00eIobO0FbT4IXNEkAKLeS+y3jtk+4C/S2AGIkX7/Bo+YH8XU62975nPKZ9Zc3
         pleA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=oNx8zfmJ6aCV/l/wFtzedIlPmvsdlC12Abrufb0b2mI=;
        b=St9b9c51Hp4/QPkkGGoedngN1++lLe8Acp36AGjkEdilCMK5Sk9qdZpoSsC1aqrcSk
         r7KAKhJOKoqZIx43zcx8yD0tMDs6iAzzyOf+wzgeCOQNdp7eIJM+zKmnrO2dgOqrGMl2
         GG1NEuQ84E/GZ4eeZJJSutkbGHAmTk8uy3JDiM+POIz/NEvNK4FAeWfuQZ8UjoMRPXkB
         qbGJiOFEHaJdowe3awRYbq50/tHUqBcvg3lRA6byK4pV9TYoAehUm3rU1VQF6IQ39k19
         yuvZyi/mwlX7UHrJSDoGDpvikmWnrtjVKfToVeX2D7si3PcsaKP20UU9dcg9ju3naxNu
         rhBg==
X-Gm-Message-State: AOAM5322HesarIv21uCQaGJp5DZOI3Bkob4bDuyj5SQYbtfLIv4HcfWV
        Ujcl6/GSF2ka47/zLluuZokmpnhtT+noy43j12IDFw==
X-Google-Smtp-Source: ABdhPJynEpWkCvQU0D6bAJu+QzWGfZF7fu44yHedfiY2++2Y1rmRZ17zV/ZMeFyoWTr3IggwVpl/1m18CBdPsSfBjoo=
X-Received: by 2002:a25:8b8b:: with SMTP id j11mr13966597ybl.310.1611163394222;
 Wed, 20 Jan 2021 09:23:14 -0800 (PST)
MIME-Version: 1.0
References: <20201218031703.3053753-1-saravanak@google.com>
 <20201218031703.3053753-6-saravanak@google.com> <CAMuHMdWDAg6+utMDLunPXmVtnP+13G2s0E-Fcnkc9bkNBs-cEg@mail.gmail.com>
 <86db7747ea6d48eebbf40a5855240d14@kernel.org> <CAMuHMdUUX22D7gV-LtDJ4jcxD=TD6soWzP=gUy4EqdFFAntoGA@mail.gmail.com>
 <CAGETcx_aroLLf_U50=KgfOBL-DW+VrgvgrSNEyHAyeSxWKZTgQ@mail.gmail.com>
 <CAMuHMdVTKEy3rbdYYUKS+L1pY0y0ctMWRXNf7o+hJWyGR7L-Dg@mail.gmail.com>
 <CAGETcx-ax00kGq=u_XCaQ0phgc_iCqtqD7k2aiQ1qSLFmrQG=g@mail.gmail.com>
 <CAGETcx_dVCsLObf_APFur6jNiS_7+ymXEjDx4Sy-tBoMCSx71w@mail.gmail.com>
 <CAMuHMdUnxSW+a8Z2dRg4T61VPwJXFBeJ+myFY=xb+mQZmmF0Eg@mail.gmail.com> <CAMuHMdVhwdq32krAxgo3UKdVkciwnhN3sRgHrbZ6xPkTvJgh2w@mail.gmail.com>
In-Reply-To: <CAMuHMdVhwdq32krAxgo3UKdVkciwnhN3sRgHrbZ6xPkTvJgh2w@mail.gmail.com>
From:   Saravana Kannan <saravanak@google.com>
Date:   Wed, 20 Jan 2021 09:22:37 -0800
Message-ID: <CAGETcx_g60Vw1K0c5JngoLGGYUHh7PCKCsFopRv5++EpKfk6KA@mail.gmail.com>
Subject: Re: [PATCH v1 5/5] driver core: Set fw_devlink=on by default
To:     Geert Uytterhoeven <geert@linux-m68k.org>
Cc:     Marc Zyngier <maz@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Android Kernel Team <kernel-team@android.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Jisheng Zhang <Jisheng.Zhang@synaptics.com>,
        Kevin Hilman <khilman@baylibre.com>,
        John Stultz <john.stultz@linaro.org>,
        Nicolas Saenz Julienne <nsaenzjulienne@suse.de>,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Wed, Jan 20, 2021 at 6:27 AM Geert Uytterhoeven <geert@linux-m68k.org> wrote:
>
> Hi Saravana,
>
> On Wed, Jan 20, 2021 at 10:40 AM Geert Uytterhoeven
> <geert@linux-m68k.org> wrote:
> > On Tue, Jan 19, 2021 at 10:51 PM Saravana Kannan <saravanak@google.com> wrote:
> > > On Tue, Jan 19, 2021 at 10:08 AM Saravana Kannan <saravanak@google.com> wrote:
> > > > On Tue, Jan 19, 2021 at 1:05 AM Geert Uytterhoeven <geert@linux-m68k.org> wrote:
> > > > > On Mon, Jan 18, 2021 at 10:19 PM Saravana Kannan <saravanak@google.com> wrote:
> > > > > > On Mon, Jan 18, 2021 at 11:16 AM Geert Uytterhoeven
> > > > > > <geert@linux-m68k.org> wrote:
> > > > > > > On Mon, Jan 18, 2021 at 6:59 PM Marc Zyngier <maz@kernel.org> wrote:
> > > > > > > > On 2021-01-18 17:39, Geert Uytterhoeven wrote:
> > > > > > > > > On Fri, Dec 18, 2020 at 4:34 AM Saravana Kannan <saravanak@google.com>
> > > > > > > > > wrote:
> > > > > > > > >> Cyclic dependencies in some firmware was one of the last remaining
> > > > > > > > >> reasons fw_devlink=on couldn't be set by default. Now that cyclic
> > > > > > > > >> dependencies don't block probing, set fw_devlink=on by default.
> > > > > > > > >>
> > > > > > > > >> Setting fw_devlink=on by default brings a bunch of benefits
> > > > > > > > >> (currently,
> > > > > > > > >> only for systems with device tree firmware):
> > > > > > > > >> * Significantly cuts down deferred probes.
> > > > > > > > >> * Device probe is effectively attempted in graph order.
> > > > > > > > >> * Makes it much easier to load drivers as modules without having to
> > > > > > > > >>   worry about functional dependencies between modules (depmod is still
> > > > > > > > >>   needed for symbol dependencies).
> > > > > > > > >>
> > > > > > > > >> If this patch prevents some devices from probing, it's very likely due
> > > > > > > > >> to the system having one or more device drivers that "probe"/set up a
> > > > > > > > >> device (DT node with compatible property) without creating a struct
> > > > > > > > >> device for it.  If we hit such cases, the device drivers need to be
> > > > > > > > >> fixed so that they populate struct devices and probe them like normal
> > > > > > > > >> device drivers so that the driver core is aware of the devices and
> > > > > > > > >> their
> > > > > > > > >> status. See [1] for an example of such a case.
> > > > > > > > >>
> > > > > > > > >> [1] -
> > > > > > > > >> https://lore.kernel.org/lkml/CAGETcx9PiX==mLxB9PO8Myyk6u2vhPVwTMsA5NkD-ywH5xhusw@mail.gmail.com/
> > > > > > > > >> Signed-off-by: Saravana Kannan <saravanak@google.com>
> > > > > > > > >
> > > > > > > > > Shimoda-san reported that next-20210111 and later fail to boot
> > > > > > > > > on Renesas R-Car Gen3 platforms. No output is seen, unless earlycon
> > > > > > > > > is enabled.
> > > > > > > > >
> > > > > > > > > I have bisected this to commit e590474768f1cc04 ("driver core: Set
> > > > > > > > > fw_devlink=on by default").
> > > > > > > >
> > > > > > > > There is a tentative patch from Saravana here[1], which works around
> > > > > > > > some issues on my RK3399 platform, and it'd be interesting to find
> > > > > > > > out whether that helps on your system.
> > > > > > > >
> > > > > > > > Thanks,
> > > > > > > >
> > > > > > > >          M.
> > > > > > > >
> > > > > > > > [1]
> > > > > > > > https://lore.kernel.org/r/20210116011412.3211292-1-saravanak@google.com
> > > > > > >
> > > > > > > Thanks for the suggestion, but given no devices probe (incl. GPIO
> > > > > > > providers), I'm afraid it won't help. [testing] Indeed.
> > > > > > >
> > > > > > > With the debug prints in device_links_check_suppliers enabled, and
> > > > > > > some postprocessing, I get:
> > > > > > >
> > > > > > >     255 supplier e6180000.system-controller not ready
> > > > > > >       9 supplier fe990000.iommu not ready
> > > > > > >       9 supplier fe980000.iommu not ready
> > > > > > >       6 supplier febd0000.iommu not ready
> > > > > > >       6 supplier ec670000.iommu not ready
> > > > > > >       3 supplier febe0000.iommu not ready
> > > > > > >       3 supplier e7740000.iommu not ready
> > > > > > >       3 supplier e6740000.iommu not ready
> > > > > > >       3 supplier e65ee000.usb-phy not ready
> > > > > > >       3 supplier e6570000.iommu not ready
> > > > > > >       3 supplier e6054000.gpio not ready
> > > > > > >       3 supplier e6053000.gpio not ready
> > > > > > >
> > > > > > > As everything is part of a PM Domain, the (lack of the) system controller
> > > > > > > must be the culprit. What's wrong with it? It is registered very early in
> > > > > > > the boot:
> > > > > > >
> > > > > > > [    0.142096] rcar_sysc_pd_init:442: of_genpd_add_provider_onecell() returned 0
> > > > >
> > > > > > Looks like you found the important logs. Can you please enable all
> > > > > > these logs and send the early con logs as an attachment (so I don't
> > > > > > need to deal with lines getting wrapped)?
> > > > > > 1. The ones in device_links_check_suppliers()
> > > > > > 2. The ones in device_link_add()
> > > > > > 3. initcall_debug=1
> > > > >
> > > > > I have attached[*] the requested log.
> > > > >
> > > > > > That should help us figure out what's going on. Also, what's the DT
> > > > > > that corresponds to one of the boards that see this issue?
> > > > >
> > > > > arch/arm64/boot/dts/renesas/r8a77951-salvator-xs.dts
> > > > >
> > > > > > Lastly, can you please pick up these 3 patches (some need clean up
> > > > > > before they merge) to make sure it's not an issue being worked on from
> > > > > > other bug reports?
> > > > > > https://lore.kernel.org/lkml/20210116011412.3211292-1-saravanak@google.com/
> > > > > > https://lore.kernel.org/lkml/20210115210159.3090203-1-saravanak@google.com/
> > > > > > https://lore.kernel.org/lkml/20201218210750.3455872-1-saravanak@google.com/
> > > > > >
> > > > > > I have a strong hunch the 2nd one will fix your issues. fw_devlink can
> > > > > > handle cyclic dependencies now (it basically reverts to
> > > > > > fw_devlink=permissive mode for devices in the cycle), but it needs to
> > > > > > "see" all the dependencies to know there's a cycle. So want to make
> > > > > > sure it "sees" the "gpios" binding used all over some of the Renesas
> > > > > > DT files.
> > > > >
> > > > > These patches don't help.
> > > > > The 2nd one actually introduces a new failure:
> > > > >
> > > > >      OF: /soc/i2c@e66d8000/gpio@20/pcie-sata-switch-hog: could not get
> > > > > #gpio-cells for /cpus/cpu@102
> > > > >
> > > > > Note that my issues don't seem to be GPIO-related at all.
> >
> > > I took a look at your logs. It looks like your guess is right. It's at
> > > least one of the issues.
> > >
> > > You'll need to convert drivers/soc/renesas/rcar-sysc.c into a platform
> > > driver. You already have a platform device created for it. So just go
> > > ahead and probe it with a platform driver. See what Marek did here
> > > [1].
> > >
> > > You probably had to implement it as an "initcall based driver"
> > > because you had to play initcall chicken to make sure the PD hardware
> > > was initialized before the consumers. With fw_devlink=on you won't
> > > have to worry about that. As an added benefit of implementing a proper
> > > platform driver, you can  actually implement runtime PM now, your
> > > suspend/resume would be more robust, etc.
> >
> > On R-Car H1, the system controller driver needs to be active before
> > secondary CPU setup, hence the early_initcall().
> > platform_bus_init() is called after that, so this is gonna need a split
> > initialization.  Or a dummy platform driver to make devlinks think
> > everything is fine ;-)

I was wondering if you could still probe the "not needed by CPU" power
domains (if there are any) as devices. Using driver-core brings you
good things :)

>
> Note that adding a dummy platform driver does work.
>
> > So basically all producer DT drivers not using a platform (or e.g. i2c)
> > driver are now broken?
> > Including all clock drivers using CLK_OF_DECLARE()?
>
> Oh, of_link_to_phandle() ignores device nodes where OF_POPULATED
> is set, and of_clk_init() sets that flag.  So rcar-sysc should do so, too.
> Patch sent.
>
> >     $ git grep -L "\<[a-z0-9]*_driver\>" -- $(git grep -l
> > "\.compatible\>") | wc -l
> >     249
> >
> > (includes false positives)
> >
> > I doubt they'll all get fixed for v5.12, as we're already at rc4...
>
> Still more than 100 drivers to fix?

Not fully sure what the grep is trying to catch, but fw_devlink
supports devices on any bus (i2c, platform, pci, etc). So that's not a
problem. It'll be a problem when a struct device is never created for
a real device. Or if it's created, but never probed.

I'm also looking into a bunch of other options for fallback when
fw_devlink=on doesn't work. Too much to explain here -- patches are
easier :)

-Saravana
